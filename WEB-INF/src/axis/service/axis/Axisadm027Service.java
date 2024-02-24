//Revision:# OZUzOhdRkf7da5ITJl2tIg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm027Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm027Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm027Service m_form");

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm027Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm027Action thisAction) {
		logger.debug("Axisadm027Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal COBBANCARIO = getCampoNumerico(request, "list_COBBANCARIO");
			Date FECHA = stringToSqlDate(getCampoTextual(request, "FECHA"));
			// Si la fecha es null, rellenamos con la fecha de hoy
			Date hoy = new Date(new java.util.Date().getTime());
			FECHA = ((!isEmpty(FECHA)) ? FECHA : hoy);

			// Datos que provienen de un flujo externo para controlar:
			// a- Si queremos ver el modal
			// b- A que pantalla de vuelta se dirige cuando se cancela.
			boolean acceso_externo = ((!isEmpty(thisAction.topPila(request, "acceso_externo")))
					? (Boolean) thisAction.topPila(request, "acceso_externo")
					: false);
			String pantalla_origen = ((!isEmpty(thisAction.topPila(request, "pantalla_origen")))
					? (String) thisAction.topPila(request, "pantalla_origen")
					: "axisctr020");

			request.setAttribute("acceso_externo", acceso_externo);
			request.setAttribute("pantalla_origen", pantalla_origen);

			// Solo recargamos si no realizamos correctamente la acci�n final
			if (!isEmpty(NRECIBO)) {
				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// aqui--etm
				Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(73));
				logger.debug(map);
				request.setAttribute("lstmotimpago", tratarRETURNyMENSAJES(request, map, false));

				// Info del recibo
				Map map1 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO, new BigDecimal(1));
				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map1);
				logger.debug(OB_IAX_RECIBOS);

				// ReFormateo el valor de CBANCAR
				if (!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CBANCAR"))) {
					String CBANCAR_TMP = (String) OB_IAX_RECIBOS.get("CBANCAR");
					CBANCAR_TMP = CBANCAR_TMP.replaceAll("-", "");
					OB_IAX_RECIBOS.put("CBANCAR", CBANCAR_TMP);
					logger.debug(OB_IAX_RECIBOS);
				}

				// RECOGER DATOS DEL VDETRECIBO
				if (!isEmpty(OB_IAX_RECIBOS)) {
					ArrayList lista_det = (ArrayList) OB_IAX_RECIBOS.get("VDETRECIBO");
					if (!isEmpty(lista_det) && lista_det.size() >= 1) {
						Map OB_VDETRECIBO = (Map) lista_det.get(0);
						Map OB_IAX_VDETRECIBO = (Map) OB_VDETRECIBO.get("OB_IAX_VDETRECIBO");
						if (!isEmpty(OB_IAX_VDETRECIBO)) {
							BigDecimal IIMP_1 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_1");
							BigDecimal IIMP_2 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_2");
							BigDecimal IIMP_3 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_3");
							BigDecimal IIMP_4 = (BigDecimal) OB_IAX_VDETRECIBO.get("IIMP_4");
							BigDecimal ICOMBRU = (BigDecimal) OB_IAX_VDETRECIBO.get("ICOMBRU");
							request.setAttribute("IIMP_1", IIMP_1);
							request.setAttribute("IIMP_2", IIMP_2);
							request.setAttribute("IIMP_3", IIMP_3);
							request.setAttribute("IIMP_4", IIMP_4);
							request.setAttribute("ICOMBRU", ICOMBRU);
						}
					}
				}

				// Info. general de la p�liza
				BigDecimal SSEGURO = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("SSEGURO")))
						? (BigDecimal) OB_IAX_RECIBOS.get("SSEGURO")
						: null);
				Map map2 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map2);
				logger.debug(OB_IAX_GENPOLIZA);
				PAC_IAXPAR_PRODUCTOS pac_iax_productos = new PAC_IAXPAR_PRODUCTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map retVal = pac_iax_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("HAYCTACLIENTE",
						(BigDecimal) OB_IAX_GENPOLIZA.get("SPRODUC"));

				request.setAttribute("retVal", tratarRETURNyMENSAJES(request, retVal));

				if (!estaReciboImpagado(request)) {
					// Carga de cobros
					BigDecimal CEMPRES = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CEMPRES")))
							? (BigDecimal) OB_IAX_RECIBOS.get("CEMPRES")
							: null);
					Map map4 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(CEMPRES);
					List T_IAX_COBRADORES = (List) tratarRETURNyMENSAJES(request, map4);
					logger.debug(T_IAX_COBRADORES);

					// Lo guardamos en sesi�n para no perder nunca sus valores

					request.setAttribute("REC_IAX_COBRADORES",
							!isEmpty(T_IAX_COBRADORES) ? T_IAX_COBRADORES : new ArrayList());

					// Si estan seleccionados los combos, para cargarlos en pantalla
					request.setAttribute("selected_COBBANCARIO", !isEmpty(COBBANCARIO) ? COBBANCARIO : null);

					request.setAttribute("FECHA", !isEmpty(FECHA) ? FECHA : null);
				} else {
					// Limpiamos objetos de sesi�n
					m_salir(request);
				}

				request.setAttribute("NRECIBO", !isEmpty(NRECIBO) ? NRECIBO : null);

				request.setAttribute("OB_IAX_RECIBOS", !isEmpty(OB_IAX_RECIBOS) ? OB_IAX_RECIBOS : new HashMap());

				request.setAttribute("OB_IAX_GENPOLIZA", !isEmpty(OB_IAX_GENPOLIZA) ? OB_IAX_GENPOLIZA : new HashMap());

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm027Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que realiza el cobro del recibo
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm027Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			Date FECHA = stringToSqlDate(getCampoTextual(request, "FECHA"), "dd/MM/yyyy");
			BigDecimal COBBAN = getCampoNumerico(request, "CCOBBANCARIOselected");
			BigDecimal PRECIMP = getCampoNumerico(request, "PRECIMP");

			BigDecimal CMOTIVO = getCampoNumerico(request, "lst_motimpago");
			BigDecimal PNPOLIZA = getCampoNumerico(request, "NPOLIZA2");
			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Impago el recibo
			Map map3 = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_IMPAGO_RECIBO(NRECIBO, FECHA, COBBAN, CMOTIVO,
					PRECIMP, PNPOLIZA); // etm
			BigDecimal returnImpago = (BigDecimal) tratarRETURNyMENSAJES(request, map3);
			logger.debug(returnImpago);

			if (BigDecimal.ZERO.equals(returnImpago)) {
				List T_IAX_IMPAGADO = new ArrayList();
				Map OB_IAX_IMPAGADO = new HashMap();
				String TPRODUC = getCampoTextual(request, "TPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				String TAGENTE = getCampoTextual(request, "TAGENTE");
				BigDecimal ICOMBRU = getCampoNumerico(request, "ICOMBRU");
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
				BigDecimal IIMP_1 = getCampoNumerico(request, "IIMP_1");
				BigDecimal IIMP_2 = getCampoNumerico(request, "IIMP_2");
				BigDecimal IIMP_3 = getCampoNumerico(request, "IIMP_3");
				BigDecimal IIMP_4 = getCampoNumerico(request, "IIMP_4");

				OB_IAX_IMPAGADO.put("NRECIBO", NRECIBO);
				OB_IAX_IMPAGADO.put("TPRODUC", TPRODUC);
				OB_IAX_IMPAGADO.put("NPOLIZA", NPOLIZA);
				OB_IAX_IMPAGADO.put("TAGENTE", TAGENTE);
				OB_IAX_IMPAGADO.put("ICOMBRU", ICOMBRU);
				OB_IAX_IMPAGADO.put("IMPORTE", IMPORTE);
				OB_IAX_IMPAGADO.put("IIMP_1", IIMP_1);
				OB_IAX_IMPAGADO.put("IIMP_2", IIMP_2);
				OB_IAX_IMPAGADO.put("IIMP_3", IIMP_3);
				OB_IAX_IMPAGADO.put("IIMP_4", IIMP_4);
				T_IAX_IMPAGADO.add(OB_IAX_IMPAGADO);
				logger.debug(T_IAX_IMPAGADO);

				request.setAttribute("T_IAX_IMPAGADO", !isEmpty(T_IAX_IMPAGADO) ? T_IAX_IMPAGADO : new ArrayList());
				// Para evitar repetir el proceso de impago, en pantalla, con la misma p�liza
				request.setAttribute("IMPAGADO", true);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm027Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que limpia los elementos en sesi�n no necesarios
	 * 
	 * @param request
	 */
	public void m_salir(HttpServletRequest request) {
		logger.debug("Axisadm027Service m_salir");
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("REC_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que comprueba si un recibo ha sido anulado
	 * 
	 * @param request
	 * @param NRECIBO
	 * @return
	 * @throws Exception
	 */
	private boolean estaReciboImpagado(HttpServletRequest request) throws Exception {
		boolean estaImpagado = true;

		if (!isEmpty(request) && isEmpty(request.getAttribute("IMPAGADO")))
			estaImpagado = false;

		return estaImpagado;
	}

	/**
	 * M�todo que busca datos poliza
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request, Axisadm027Action thisAction) {
		logger.debug("Axisctr031Service m_cargar_poliza");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug("SSEGURO-->" + SSEGURO);

			if (SSEGURO != null) {
				Map map = null;
				PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				logger.debug(map);
				Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("datos_poliza", datosPoliza);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr301Service - m�todo m_cargar_poliza", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
