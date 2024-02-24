package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.mvc.control.axis.Axisren002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisren002Service.java
 * 
 * @since Java 5.0
 */
public class Axisren002Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisren002Action thisAction) {
		logger.debug("Axisren002Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisren002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_form(HttpServletRequest request, Axisren002Action thisAction) {
		logger.debug("Axisren002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			HashMap valores = new HashMap();

			PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map tipo_cuenta = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("274"));
			logger.debug(tipo_cuenta);
			ArrayList lst_tipo_cuenta = (ArrayList) tratarRETURNyMENSAJES(request, tipo_cuenta);
			valores.put("tipo_cuenta", lst_tipo_cuenta);

			Map mapa_estados = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("230"));
			logger.debug(mapa_estados);
			ArrayList lst_mapa_estados = (ArrayList) tratarRETURNyMENSAJES(request, mapa_estados);
			valores.put("mapa_estados", lst_mapa_estados);

			formdata.put("valores", valores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisren002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisren002Action thisAction) {
		logger.debug("Axisren002Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisren002Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisren002Action thisAction) {
		logger.debug("Axisren002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SRECREN = getCampoNumerico(request, "SRECREN");

			Map mapa_cabecera = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_GET_CAB_RENTA(SRECREN);
			logger.debug(mapa_cabecera);
			HashMap cabecera = (HashMap) mapa_cabecera.get("OOCABRENTA");
			// formdata.putAll(cabecera);
			formdata.put("OOCABRENTA", cabecera);

			Map mapa_cuerpo = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_GET_PAGORENTA(SRECREN);
			logger.debug(mapa_cuerpo);
			HashMap cuerpo = (HashMap) mapa_cuerpo.get("OOPAGORENTA");
			// formdata.putAll(cuerpo);
			formdata.put("OOPAGORENTA", cuerpo);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisren002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_act_pagorenta(HttpServletRequest request) {
		logger.debug("Axisadm047Service m_ajax_act_pagorenta");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal SRECREN = this.getCampoNumerico(request, "SRECREN");
		BigDecimal CTIPBAN = this.getCampoNumerico(request, "CTIPBAN");
		String NCTACOR = this.getCampoTextual(request, "NCTACOR");

		BigDecimal IBASE = this.getCampoNumerico(request, "IBASE");
		BigDecimal PRETENC = this.getCampoNumerico(request, "PRETENC");
		BigDecimal ISINRET = this.getCampoNumerico(request, "ISINRET"); // Imp. Bruto
		BigDecimal ICONRET = this.getCampoNumerico(request, "ICONRET"); // I neto
		BigDecimal IRETENC = this.getCampoNumerico(request, "IRETENC"); // Retencion

		BigDecimal CESTREC = this.getCampoNumerico(request, "CESTREC"); // Retencion

		Date FMOVINI = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FMOVINI"));

		try {

			Map m = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_ACT_PAGORENTA(SRECREN, CTIPBAN, NCTACOR, IBASE, PRETENC, ISINRET, IRETENC,
							ICONRET, CESTREC, FMOVINI);// (SRECREN,CTIPBAN,PCUENTA,BASE,PORCENTAJE,ISINRET,IRETENC,ICONRET,CESTREC,FECHAMOV);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			logger.debug("Mapa Actualizar Pago Renta:" + m);
			// HashMap actualizar = (HashMap)m.get("");

			tratarRETURNyMENSAJES(request, m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_act_pagorenta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_calc_rentas(HttpServletRequest request) {
		logger.debug("Axisadm047Service m_ajax_calc_rentas");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal SRECREN = this.getCampoNumerico(request, "SRECREN");
		BigDecimal CTIPBAN = this.getCampoNumerico(request, "CTIPBAN");

		BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
		BigDecimal CTIPCALC = new BigDecimal("2"); // Por defecto

		try {

			Map m = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_CALC_RENTAS(SRECREN, SSEGURO, CTIPCALC, CTIPBAN);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			logger.debug("Mapa Calcular Pago Renta:" + m);

			tratarRETURNyMENSAJES(request, m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_calc_rentas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_bloq_proxpagos(HttpServletRequest request) {
		logger.debug("Axisadm047Service m_ajax_bloq_proxpagos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

		try {

			Map m = new PAC_IAX_RENTAS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_BLOQ_PROXPAGOS(SSEGURO);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			logger.debug("Mapa Bloquear Pago Renta:" + m);

			tratarRETURNyMENSAJES(request, m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_bloq_proxpagos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
