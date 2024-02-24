//Revision:# uIx7z2/8XKtAGb4MV+OMVw== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm096Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm096Service m_form");

		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm096Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_salir(HttpServletRequest request) {
		logger.debug("Axisadm096Service m_salir");
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("REC_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm096Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES_DEFAULT = ((!isEmpty(usuario) && !isEmpty(usuario.getCempres())) ? usuario.getCempres()
					: null);
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PSUCUR = getCampoNumerico(request, "AGENTETIPO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal CEMPRES = getCampoNumerico(request, "list_CEMPRES");
			BigDecimal HABRECIBO = getCampoNumerico(request, "HABRECIBO");
			BigDecimal HSOFERTA = getCampoNumerico(request, "HSOFERTA");
			BigDecimal HPCMODIF = getCampoNumerico(request, "HPCMODIF");
			BigDecimal HPPDLEGAL = getCampoNumerico(request, "HPPDLEGAL");
			BigDecimal HPPJUDI = getCampoNumerico(request, "HPPJUDI");
			BigDecimal HPPGUNICA = getCampoNumerico(request, "HPPGUNICA");
			BigDecimal HPPESTATAL = getCampoNumerico(request, "HPPESTATAL");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Carga de empresa
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			List T_IAX_EMPRESAS = (List) tratarRETURNyMENSAJES(request, map);

			if (CEMPRES != null && CEMPRES.intValue() == 0)
				CEMPRES = CEMPRES_DEFAULT;

			Map ramos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
			if (CEMPRES != null && CEMPRES.longValue() != 0 && CRAMO != null && CRAMO.longValue() != 0) {
				Map productos = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRES, CRAMO);
				logger.debug(productos);
				formdata.put("DOM_LSPRODUCTOS", tratarRETURNyMENSAJES(request, productos, false));
			}
			BigDecimal CIDIOMA = usuario.getCidioma();
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2), CIDIOMA, null);

			// map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null,
			// null, null, new BigDecimal(1));

			formdata.put("CEMPRES", CEMPRES);
			formdata.put("DOM_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos, false));
			formdata.put("T_IAX_EMPRESAS", T_IAX_EMPRESAS);
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("selected_CEMPRES", CEMPRES);

			formdata.put("NCERTIF", NCERTIF);
			formdata.put("AGENTETIPO", PSUCUR);
			formdata.put("CRAMO", CRAMO);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("CAGENTE", CAGENTE);

			formdata.put("NRECIBO", NCERTIF);
			formdata.put("NRECIBO", NCERTIF);
			formdata.put("HABRECIBO", HABRECIBO);
			formdata.put("HSOFERTA", HSOFERTA);
			formdata.put("HPCMODIF", HPCMODIF);
			formdata.put("HPPDLEGAL", HPPDLEGAL);
			formdata.put("HPPJUDI", HPPJUDI);
			formdata.put("HPPGUNICA", HPPGUNICA);
			formdata.put("HPPESTATAL", HPPESTATAL);

			formdata.put("LSAGENTESTIPO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm096Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm096Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal PCEMPRES = getCampoNumerico(request, "list_CEMPRES");
			BigDecimal PCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal PSPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PSUCUR = getCampoNumerico(request, "AGENTETIPO");
			BigDecimal PCAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal PNPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal PNCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal PNRECIBO = getCampoNumerico(request, "NRECIBO");
			String PIDTOMADOR = getCampoTextual(request, "IDTOMADOR");
			String PNTOMADOR = getCampoTextual(request, "NTOMADOR");
			BigDecimal HABRECIBO = getCampoNumerico(request, "HABRECIBO");
			BigDecimal HSOFERTA = getCampoNumerico(request, "HSOFERTA");
			BigDecimal HPCMODIF = getCampoNumerico(request, "HPCMODIF");
			BigDecimal HPPDLEGAL = getCampoNumerico(request, "HPPDLEGAL");
			BigDecimal HPPJUDI = getCampoNumerico(request, "HPPJUDI");
			BigDecimal HPPGUNICA = getCampoNumerico(request, "HPPGUNICA");
			BigDecimal HPPESTATAL = getCampoNumerico(request, "HPPESTATAL");

			PAC_IAX_GESTION_REC pac_IAX_GESTION_REC = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_IAX_GESTION_REC.ejecutaPAC_IAX_GESTION_REC__F_GET_ANULA_X_NO_PAGO(PCEMPRES, PCRAMO, PSPRODUC,
					PCAGENTE, PNPOLIZA, PNCERTIF, PSUCUR, PNRECIBO, PIDTOMADOR, PNTOMADOR, HABRECIBO, HSOFERTA,
					HPCMODIF, HPPDLEGAL, HPPJUDI, HPPGUNICA, HPPESTATAL);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				List REC_LSTRECIBOS = (List) map.get("CUR");
				request.getSession().setAttribute("REC_LSTRECIBOS", REC_LSTRECIBOS);

			}

			m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm096Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm096Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");
			Map<BigDecimal, BigDecimal> recibos = new HashMap<BigDecimal, BigDecimal>();
			PAC_IAX_GESTION_REC pac_IAX_GESTION_REC = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			for (int i = 0; i < CUENTA.intValue(); i++) {
				BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);

				if (!isEmpty(SELEC) && SELEC.intValue() != 0) {
					recibos.put(NRECIBO, new BigDecimal("1"));
				} else {
					recibos.put(NRECIBO, new BigDecimal("0"));
				}
			}
			Map mapa = null;
			for (Map.Entry entry : recibos.entrySet()) {
				logger.debug(entry.getKey() + " " + entry.getValue());
				mapa = pac_IAX_GESTION_REC.ejecutaPAC_IAX_GESTION_REC__F_SET_ANULA_X_NO_PAGO(
						(BigDecimal) entry.getKey(), (BigDecimal) entry.getValue());
			}
			tratarRETURNyMENSAJES(request, mapa);

			m_buscar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm002Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
