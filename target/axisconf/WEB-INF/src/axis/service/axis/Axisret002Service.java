package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_RENTAS;
import axis.jdbc.PAC_IAX_RETORNO;
import axis.mvc.control.axis.Axisret002Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisret002Service.java
 * 
 * @since Java 5.0
 */
public class Axisret002Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisret002Action thisAction) {
		logger.debug("Axisret002Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_form(HttpServletRequest request, Axisret002Action thisAction) {
		logger.debug("Axisret002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDCONVENIO = getCampoNumerico(request, "IDCONVENIO");
			BigDecimal CAGENTE = usuario.getCagente();
			/*
			 * *****************************************************************************
			 * *****
			 */
			/* ******************* DATOS DE LA CABECERA ******************* */
			/*
			 * *****************************************************************************
			 * *****
			 */

			formdata.put("CAGENTE", CAGENTE);

			if (IDCONVENIO != null) {

				/*
				 * *****************************************************************************
				 * *****
				 */
				/* ******************* CABECERA ******************* */
				/*
				 * *****************************************************************************
				 * *****
				 */

				Map m_cabecera = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_GET_DATCONVENIO(IDCONVENIO);

				ArrayList lista_datos = (ArrayList) tratarRETURNyMENSAJES(request, m_cabecera);
				logger.debug("********************* cabecera:" + m_cabecera);
				if (!isEmpty(lista_datos)) {
					Map mapa_cabecera = (Map) lista_datos.get(0);
					formdata.putAll(mapa_cabecera);
				}

				/*
				 * *****************************************************************************
				 * *****
				 */
				/* ******************* PRODUCTOS ******************* */
				/*
				 * *****************************************************************************
				 * *****
				 */
				Map m_prod = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_GET_PRODCONVENIO(IDCONVENIO);
				ArrayList lista_productos = (ArrayList) tratarRETURNyMENSAJES(request, m_prod);
				logger.debug("********************* productos:" + m_prod);
				BigDecimal CRAMO = (BigDecimal) m_prod.get("PCRAMO");
				String TRAMO = (String) m_prod.get("PTRAMO");
				formdata.put("CRAMO", CRAMO);
				formdata.put("TRAMO", TRAMO);
				request.setAttribute("lista_productos", lista_productos);

				/*
				 * *****************************************************************************
				 * *****
				 */
				/* ******************* LISTA INTERMEDIARIOS ******************* */
				/*
				 * *****************************************************************************
				 * *****
				 */
				Map m_int = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_GET_AGECONVENIO(IDCONVENIO);
				ArrayList lista_intermediarios = (ArrayList) tratarRETURNyMENSAJES(request, m_int);
				logger.debug("********************* interm:" + m_int);
				request.setAttribute("lista_intermediarios", lista_intermediarios);
				/*
				 * *****************************************************************************
				 * *****
				 */
				/* ******************* BENEFICIARIOS RETORNO ******************* */
				/*
				 * *****************************************************************************
				 * *****
				 */
				Map m_bnf = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_GET_BENEFCONVENIO(IDCONVENIO);
				ArrayList lista_retornos = (ArrayList) tratarRETURNyMENSAJES(request, m_bnf);
				logger.debug("********************* retornos:" + m_bnf);
				request.setAttribute("lista_retornos", lista_retornos);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisret002Action thisAction) {
		logger.debug("Axisret002Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisret002Action thisAction) {
		logger.debug("Axisret002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SRECREN = getCampoNumerico(request, "SRECREN");

			Map mapa_cabecera = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_GET_CAB_RENTA(SRECREN);
			logger.debug(mapa_cabecera);
			HashMap cabecera = (HashMap) mapa_cabecera.get("OOCABRENTA");
			// formdata.putAll(cabecera);
			formdata.put("OOCABRENTA", cabecera);

			Map mapa_cuerpo = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_GET_PAGORENTA(SRECREN);
			logger.debug(mapa_cuerpo);
			HashMap cuerpo = (HashMap) mapa_cuerpo.get("OOPAGORENTA");
			// formdata.putAll(cuerpo);
			formdata.put("OOPAGORENTA", cuerpo);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_borrar_beneficiario(HttpServletRequest request, Axisret002Action thisAction) {
		logger.debug("Axisret002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDCONVENIO = getCampoNumerico(request, "IDCONVENIO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON_DEL");

			if (IDCONVENIO != null) {

				Map mapa_resultado = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_DEL_BENEFCONVENIO(IDCONVENIO, SPERSON);

				logger.debug(mapa_resultado);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_resultado);

				if (resultado.intValue() == 0) {
					formdata.put("OK", "OK");
				} else {
					formdata.put("OK", "KO");
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_borrar_intermediario(HttpServletRequest request, Axisret002Action thisAction) {
		logger.debug("Axisret002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_RETORNO pac_axis_retorno = new PAC_IAX_RETORNO(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDCONVENIO = getCampoNumerico(request, "IDCONVENIO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_DEL");

			if (IDCONVENIO != null) {

				Map mapa_resultado = pac_axis_retorno.ejecutaPAC_IAX_RETORNO__F_DEL_AGECONVENIO(IDCONVENIO, CAGENTE);

				logger.debug(mapa_resultado);
				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa_resultado);

				if (resultado.intValue() == 0) {
					formdata.put("OK", "OK");
				} else {
					formdata.put("OK", "KO");
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_ajax_validaconvenio(HttpServletRequest request) {
		// bug 0024892
		logger.debug("Axisret002Service m_ajax_validaconvenio");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal pIDCONVENIO = getCampoNumerico(request, "pIDCONVENIO");
			BigDecimal pPACCION = getCampoNumerico(request, "pPACCION");

			Map map = new PAC_IAX_RETORNO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RETORNO__F_OBLIG_CONVENIO(pIDCONVENIO, pPACCION);

			logger.debug(map);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr024Service - m�todo m_aceptar_modif_prop", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
		logger.debug("Axisret002Service m_ajax_act_pagorenta");
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

			Map m = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_ACT_PAGORENTA(SRECREN, CTIPBAN, NCTACOR, IBASE, PRETENC, ISINRET, IRETENC,
							ICONRET, CESTREC, FMOVINI); // (SRECREN,CTIPBAN,PCUENTA,BASE,PORCENTAJE,ISINRET,IRETENC,ICONRET,CESTREC,FECHAMOV);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			logger.debug("Mapa Actualizar Pago Renta:" + m);
			// HashMap actualizar = (HashMap)m.get("");

			tratarRETURNyMENSAJES(request, m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_ajax_act_pagorenta", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_calc_rentas(HttpServletRequest request) {
		logger.debug("Axisret002Service m_ajax_calc_rentas");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal SRECREN = this.getCampoNumerico(request, "SRECREN");
		BigDecimal CTIPBAN = this.getCampoNumerico(request, "CTIPBAN");

		BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
		BigDecimal CTIPCALC = new BigDecimal("2"); // Por defecto

		try {

			Map m = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_CALC_RENTAS(SRECREN, SSEGURO, CTIPCALC, CTIPBAN);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			logger.debug("Mapa Calcular Pago Renta:" + m);

			tratarRETURNyMENSAJES(request, m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_ajax_calc_rentas", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_bloq_proxpagos(HttpServletRequest request) {
		logger.debug("Axisret002Service m_ajax_bloq_proxpagos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");

		try {

			Map m = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_BLOQ_PROXPAGOS(SSEGURO);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

			logger.debug("Mapa Bloquear Pago Renta:" + m);

			tratarRETURNyMENSAJES(request, m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisret002Service - m�todo m_ajax_bloq_proxpagos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
