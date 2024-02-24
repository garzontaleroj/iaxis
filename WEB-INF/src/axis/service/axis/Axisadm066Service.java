package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm066Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm066Service extends AxisBaseService {
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
		logger.debug("Axisadm066Service m_form");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm066Service - m�todo m_init", e);
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
	public void m_form(HttpServletRequest request, Axisadm066Action thisAction) {
		logger.debug("Axisadm066Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			// Podemos recibir NRECIBO desde otro contexto/pantalla
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");

			// Permite cargar el �ltimo POST de pantalla
			Date FANULAC = stringToSqlDate(getCampoTextual(request, "FANULAC"));
			// Si la fecha es null, rellenamos con la fecha de hoy
			Date hoy = new Date(new java.util.Date().getTime());
			FANULAC = ((!isEmpty(FANULAC)) ? FANULAC : hoy);
			BigDecimal CMOTANU = getCampoNumerico(request, "CMOTANU_CHECK");

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

			if (!isEmpty(NRECIBO)) {
				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Info del recibo
				Map map1 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO, null);
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
							request.setAttribute("IIMP_1", IIMP_1);
							request.setAttribute("IIMP_2", IIMP_2);
							request.setAttribute("IIMP_3", IIMP_3);
							request.setAttribute("IIMP_4", IIMP_4);
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

				// Solo recargamos los datos en pantalla si no realizamos correctamente la
				// acci�n final. (m_aceptar)
				if (!estaReciboAnulado(request)) {

					request.setAttribute("FANULAC", !isEmpty(FANULAC) ? FANULAC : null);

					request.setAttribute("CMOTANU", !isEmpty(CMOTANU) ? CMOTANU : null);

				}

				request.setAttribute("NRECIBO", !isEmpty(NRECIBO) ? NRECIBO : null);

				request.setAttribute("OB_IAX_RECIBOS", !isEmpty(OB_IAX_RECIBOS) ? OB_IAX_RECIBOS : new HashMap());

				request.setAttribute("OB_IAX_GENPOLIZA", !isEmpty(OB_IAX_GENPOLIZA) ? OB_IAX_GENPOLIZA : new HashMap());
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm066Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que realiza la anulaci�n del recibo
	 * 
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm066Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			String sFREHABILI = getCampoTextual(request, "FREHABILI");
			Date FREHABILI = stringToSqlDate(sFREHABILI, "dd/MM/yyyy");

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Rehabilito el recibo
			Map map3 = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_REHABILITA_REC(NRECIBO, FREHABILI);
			BigDecimal returnAnulaRecibo = (BigDecimal) tratarRETURNyMENSAJES(request, map3);
			logger.debug(returnAnulaRecibo); // 0->ok

			if (BigDecimal.ZERO.equals(returnAnulaRecibo)) {
				List T_IAX_REHABILI = new ArrayList();
				Map OB_IAX_REHABILI = new HashMap();
				String TPRODUC = getCampoTextual(request, "TPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				String TAGENTE = getCampoTextual(request, "TAGENTE");
				BigDecimal ICOMISI = getCampoNumerico(request, "ICOMISI");
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");
				BigDecimal IIMP_1 = getCampoNumerico(request, "IIMP_1");
				BigDecimal IIMP_2 = getCampoNumerico(request, "IIMP_2");
				BigDecimal IIMP_3 = getCampoNumerico(request, "IIMP_3");
				BigDecimal IIMP_4 = getCampoNumerico(request, "IIMP_4");

				OB_IAX_REHABILI.put("NRECIBO", NRECIBO);
				OB_IAX_REHABILI.put("TPRODUC", TPRODUC);
				OB_IAX_REHABILI.put("NPOLIZA", NPOLIZA);
				OB_IAX_REHABILI.put("TAGENTE", TAGENTE);
				OB_IAX_REHABILI.put("ICOMISI", ICOMISI);
				OB_IAX_REHABILI.put("IMPORTE", IMPORTE);
				OB_IAX_REHABILI.put("IIMP_1", IIMP_1);
				OB_IAX_REHABILI.put("IIMP_2", IIMP_2);
				OB_IAX_REHABILI.put("IIMP_3", IIMP_3);
				OB_IAX_REHABILI.put("IIMP_4", IIMP_4);

				T_IAX_REHABILI.add(OB_IAX_REHABILI);

				logger.debug("----->" + T_IAX_REHABILI);

				request.setAttribute("T_IAX_REHABILI", !isEmpty(T_IAX_REHABILI) ? T_IAX_REHABILI : new ArrayList());
				// Para evitar repetir el proceso de cobro, en pantalla, con la misma p�liza
				// Para evitar repetir el proceso de anulaci�n, en pantalla, con la misma p�liza
				request.setAttribute("REHABILI", true);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm066Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
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
	private boolean estaReciboAnulado(HttpServletRequest request) throws Exception {
		boolean estaAnulado = true;

		if (!isEmpty(request) && isEmpty(request.getAttribute("ANULADO")))
			estaAnulado = false;

		return estaAnulado;
	}
}
