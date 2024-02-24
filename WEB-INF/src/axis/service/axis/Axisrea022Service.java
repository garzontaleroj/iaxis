package axis.service.axis;

import java.math.BigDecimal;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea022Service.java 11/01/2010
 * 
 * @author am
 * @since Java 5.0
 */
public class Axisrea022Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrea022Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea022Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisrea022Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CEMPRES = usuario.getCempres();
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CMAP = getCampoNumerico(request, "CMAP");
			BigDecimal COMPANIA = getCampoNumerico(request, "COMPANIA");
			BigDecimal VMODALIDADES = getCampoNumerico(request, "VMODALIDADES");
			BigDecimal VITECNICO = getCampoNumerico(request, "VITECNICO");
			BigDecimal VEPAGO = getCampoNumerico(request, "VEPAGO");

			java.sql.Date FDESDE = null;
			java.sql.Date FHASTA = null;
			FDESDE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FDESDE"));
			FHASTA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FHASTA"));

			Calendar cal = Calendar.getInstance();
			cal.setTime(FDESDE);
			Integer dia = cal.get(Calendar.DATE);
			Integer mes = cal.get(Calendar.MONTH) + 1;
			Integer anyo = cal.get(Calendar.YEAR);

			String Dia;
			if (dia < 10)
				Dia = '0' + dia.toString();
			else
				Dia = dia.toString();

			String Mes;
			if (mes < 10)
				Mes = '0' + mes.toString();
			else
				Mes = mes.toString();

			String fdesde = anyo.toString() + Mes + Dia;

			cal.setTime(FHASTA);
			dia = cal.get(Calendar.DATE);
			mes = cal.get(Calendar.MONTH) + 1;
			anyo = cal.get(Calendar.YEAR);

			if (dia < 10)
				Dia = '0' + dia.toString();
			else
				Dia = dia.toString();

			if (mes < 10)
				Mes = '0' + mes.toString();
			else
				Mes = mes.toString();

			String fhasta = anyo.toString() + Mes + Dia;
			String[] C_FICHERO_OUT = { "RETURN" };

			String CPARAMETROS = null;

			String compania;
			if (COMPANIA != null)
				compania = COMPANIA.toString();
			else
				compania = new String();
			String modalidad;
			if (VMODALIDADES != null)
				modalidad = VMODALIDADES.toString();
			else
				modalidad = new String();

			String interes;
			if (VITECNICO != null) {
				// ecg 20101014 bug 16167 ANTES: interes = VITECNICO.toString(); - debido a
				// problemas con el formateo y la mascara de PL, decidimos de NO pasar
				// decimales, sino multiplicarlo por 100
				interes = "" + VITECNICO.multiply(new BigDecimal(100.0)).intValue();
			} else
				interes = new String();

			String pago;
			if (VEPAGO != null)
				pago = VEPAGO.toString();
			else
				pago = new String();

			if (CMAP.intValue() == 113) {
				// Companyia|Empresa|Fecha_Inicio(AAAAMMDD)|Fecha_Fin(AAAAMMDD)|Modalidad|Idioma
				CPARAMETROS = compania + '|' + CEMPRES.toString() + '|' + fdesde + '|' + fhasta + '|' + modalidad + '|'
						+ CIDIOMA.toString();
			} else if (CMAP.intValue() == 114) {
				// Companyia|Empresa|Fecha_Inicio(AAAAMMDD)|Fecha_Fin(AAAAMMDD)|Inter�s
				// T�cnico|Idioma
				CPARAMETROS = compania + '|' + CEMPRES.toString() + '|' + fdesde + '|' + fhasta + '|' + interes + '|'
						+ CIDIOMA.toString();
			} else if (CMAP.intValue() == 120) {
				// Companyia|Empresa|Fecha_Inicio(AAAAMMDD)|Fecha_Fin(AAAAMMDD)|Tipus
				// siniestro|Idioma
				CPARAMETROS = compania + '|' + CEMPRES.toString() + '|' + fdesde + '|' + fhasta + '|' + pago + '|'
						+ CIDIOMA.toString();
			}

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP.toString(), CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}
				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea022Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisrea022Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			logger.debug("formdata:" + formdata);
			Map map = new HashMap();

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1004));
			logger.debug(map);
			request.setAttribute("LISTADOS", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA();
			logger.debug("------- Compa�ias:" + map);
			request.setAttribute("COMPANIAS", (List) tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(3));
			logger.debug(map);
			request.setAttribute("ESTPAGOS", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1005));
			logger.debug(map);
			request.setAttribute("MODALIDADES", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea022Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000075", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public static void main(String[] args) throws Exception {

		// ecg 20101014 bug 16167 - main para probar los cambios: miltuplicacion por 100
		BigDecimal VITECNICO = new BigDecimal(0.191);
		String interes;
		if (VITECNICO != null) {
			// ecg 20101014 bug 16167 ANTES: interes = VITECNICO.toString(); - debido a
			// problemas con el formateo y la mascara de PL, decidimos de NO pasar
			// decimales, sino multiplicarlo por 100
			interes = "" + VITECNICO.multiply(new BigDecimal(100.0)).intValue();
		} else
			interes = new String();
		System.out.println(interes);

	}

}
