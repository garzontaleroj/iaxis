//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm047Service.java 03/09/2009
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axisadm047Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm047Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			// BigDecimal CEMPRES =usuario.getCempres();
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CMAP = getCampoNumerico(request, "CMAP");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGRPRO = getCampoNumerico(request, "CAGRPRO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CVINCU = getCampoNumerico(request, "CVINCU");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CESTREC = getCampoNumerico(request, "CESTREC");
			BigDecimal CTIPREC = getCampoNumerico(request, "CTIPREC");

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

			String fdesde = Dia + Mes + anyo.toString();

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

			String fhasta = Dia + Mes + anyo.toString();
			String[] C_FICHERO_OUT = { "RETURN" };

			String CPARAMETROS = null;

			String cempres;
			if (CEMPRES != null)
				cempres = CEMPRES.toString();
			else
				cempres = new String();
			String cestrec;
			if (CESTREC != null)
				cestrec = CESTREC.toString();
			else
				cestrec = new String();
			String ctiprec;
			if (CTIPREC != null)
				ctiprec = CTIPREC.toString();
			else
				ctiprec = new String();
			String cestado;
			if (CESTADO != null)
				cestado = CESTADO.toString();
			else
				cestado = new String();
			String vincu;
			if (CVINCU != null)
				vincu = CVINCU.toString();
			else
				vincu = new String();
			String estado;
			if (CESTADO != null)
				estado = CESTADO.toString();
			else
				estado = new String();

			String agente;
			if (CAGENTE != null)
				agente = CAGENTE.toString();
			else
				agente = new String();

			if (CMAP.intValue() == 344) {
				// Idioma|Empresa|Cestrec|FInicial|FFinal|Ctiprec|Agente|Cestado
				CPARAMETROS = CIDIOMA.toString() + '|' + cempres + '|' + cestrec + '|' + fdesde + '|' + fhasta + '|'
						+ ctiprec + '|' + agente + '|' + cestado;
			} else if (CMAP.intValue() == 345) {
				// Idioma|Empresa|Producto|FInicial|FFinal|Ramo|Vinculo|Agrupacion
				CPARAMETROS = CIDIOMA.toString() + '|' + cempres + '|' + cestrec + '|' + fdesde + '|' + fhasta + '|'
						+ ctiprec + '|' + agente + '|' + cestado;
			} else if (CMAP.intValue() == 346) {
				// Idioma|Empresa|Agrupacion|Producto|Ramo|Agente|Estado|Fecha_inicio|Fecha_fin
				CPARAMETROS = CIDIOMA.toString() + '|' + cempres + '|' + cestrec + '|' + fdesde + '|' + fhasta + '|'
						+ ctiprec + '|' + agente + '|' + cestado;
			}

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP.toString(), CPARAMETROS);
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
			logger.error("Error en el servicio Axisadm047Service - m�todo m_ajax_generar_resultados_map", e);
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
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map map = new HashMap();

			List listados = new ArrayList();

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1003));
			request.setAttribute("LISTADOS", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			request.setAttribute("EMPRESAS", (List) tratarRETURNyMENSAJES(request, map));

			String CONDICION = this.getCampoTextual(request, "CONDICION");
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, null, new BigDecimal(2), CONDICION);
			request.setAttribute("AGENTES", tratarRETURNyMENSAJES(request, map, false));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1));
			request.setAttribute("ESTRECS", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8));
			request.setAttribute("TIPRECS", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(61));
			request.setAttribute("ESTADOS", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm047Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000075", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaRamos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CAGRPRO"))) {
				BigDecimal PCEMPRES = usuario.getCempres();
				BigDecimal PCAGRPRO = getCampoNumerico(request, "CAGRPRO");
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSAGRUPACION(PCEMPRES, PCAGRPRO);

				ajax.guardarContenidoFinalAContenedorAjax(map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm047Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaAgente(HttpServletRequest request) throws Exception {
		if (isEmpty(request.getSession().getAttribute("axisctr_agente"))) {
			// Cargar Agente de la BD
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map mapCX = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

			String CONDICION = this.getCampoTextual(request, "CONDICION");
			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, (BigDecimal) (mapCX.get("RETURN")),
							new BigDecimal(1), CONDICION);
			Map agente = new HashMap();
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, map, false);
				agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
			}
			request.getSession().setAttribute("axisctr_agente", agente);

		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
