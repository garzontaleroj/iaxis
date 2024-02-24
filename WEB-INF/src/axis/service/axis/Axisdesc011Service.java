package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTCAMPANYAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisdesc011Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisdesc011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisdesc011Action thisAction) {
		logger.debug("Axispen003Service m_init");
		// Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			logger.debug("m_init");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc011Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_form(HttpServletRequest request, Axisdesc011Action thisAction) {
		logger.debug("Axisdesc011Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {
			formdata.put("CIDIOMA_USU", usuario.getCidioma());
		} catch (Exception e) {
			logger.error("Error en el servicio Axisppro047Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_busqueda_campanyas(HttpServletRequest request, Axisdesc011Action thisAction) {
		logger.debug("Axisdesc011Service m_busqueda_campanyas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			formdata.put("NCONTADOR", 0);
			formdata.put("NCONSULTA", 1);

			PAC_IAX_MNTCAMPANYAS pac_iax_mntcampanyas = new PAC_IAX_MNTCAMPANYAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			String TCAMPANYA = getCampoTextual(request, "TCAMPANYA");

			logger.debug("--> CCAMPANYA:" + CCAMPANYA + " TCAMPANYA:" + TCAMPANYA);

			Map mapa_resultado_p = pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYAS(CCAMPANYA,
					TCAMPANYA);
			logger.debug(mapa_resultado_p);
			// Si la crida retorna error llencem excepcio.
			if (((BigDecimal) (tratarRETURNyMENSAJES(request, mapa_resultado_p))).compareTo(new BigDecimal(0)) != 0) {
				throw new Exception();
			}
			// Preparem llista de campanyas
			ArrayList listaCampanyas = (ArrayList<Map>) mapa_resultado_p.get("PCAMPANYAS");
			logger.debug(listaCampanyas);
			request.getSession().setAttribute("AXIS_CAMPANYAS", listaCampanyas);

			HashMap listaDetCapanyas = new HashMap();
			if (listaCampanyas.size() != 0) {
				BigDecimal CCAMPAN = (BigDecimal) ((HashMap) ((HashMap) listaCampanyas.get(0)).get("OB_IAX_CAMPANYAS"))
						.get("CCAMPANYA");

				listaDetCapanyas = pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(CCAMPAN,
						new BigDecimal(0));

				formdata.put("CCAMPANYA", CCAMPAN);
				logger.debug("-->" + listaDetCapanyas);
				logger.debug("-->" + listaDetCapanyas.get("PCAMPANYA"));
			}
			request.setAttribute("listaDetCapanyas", listaDetCapanyas.get("PCAMPANYA"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen003Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_borrarCampanya(HttpServletRequest request, Axisdesc011Action thisAction) {
		logger.debug("Axisdesc011Service m_borrar_garantias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {

			PAC_IAX_MNTCAMPANYAS pac_iax_mntcampanyas = new PAC_IAX_MNTCAMPANYAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");

			Map mapa_resultado_p = pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA(CCAMPANYA);
			logger.debug(mapa_resultado_p);

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, mapa_resultado_p, false))) {
				logger.debug(mapa_resultado_p);
			}

			// Inici Bug 0028012 - 10/10/2013 - RCL - Validaci�n Campos Campa�as/Dtos
			// especiales
			formdata.remove("CCAMPANYA");
			formdata.remove("TCAMPANYA");
			request.removeAttribute("CCAMPANYA");
			request.removeAttribute("TCAMPANYA");
			// Fi Bug 0028012 - 10/10/2013 - RCL - Validaci�n Campos Campa�as/Dtos
			// especiales

		} catch (Exception e) {
			logger.error("Error en el servicio axisdesc011Service - m�todo m_borrarCampanya", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_borrarCampanyaLin(HttpServletRequest request, Axisdesc011Action thisAction) {
		logger.debug("Axisdesc011Service m_borrar_garantias_hijas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_MNTCAMPANYAS pac_iax_mntcampanyas = new PAC_IAX_MNTCAMPANYAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");

			formdata.put("CCAMPANYA", CCAMPANYA);

			Map mapa_resultado_p = pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_DEL_CAMPANYA_LIN(CCAMPANYA,
					CIDIOMA);
			logger.debug(mapa_resultado_p);

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, mapa_resultado_p, false))) {
				logger.debug(mapa_resultado_p);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisdesc011Service - m�todo m_borrarCampanyaLin", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_busqueda_detalle_json(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			PAC_IAX_MNTCAMPANYAS pac_iax_mntcampanyas = new PAC_IAX_MNTCAMPANYAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap miDataObject = new HashMap();
			HashMap listaDetCapanyas = new HashMap();

			BigDecimal CCAMPAN = getCampoNumerico(request, "CCAMPANYA");

			listaDetCapanyas = pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(CCAMPAN,
					new BigDecimal(0));

			miDataObject.put("campanya", listaDetCapanyas.get("PCAMPANYA"));

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr207Service - m�todo m_actualizar_franq_json", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_busqueda_detalle(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			ArrayList listaCampanyas = new ArrayList();
			listaCampanyas = (ArrayList) request.getSession().getAttribute("AXIS_CAMPANYAS");
			ArrayList listaDetalle = new ArrayList();

			PAC_IAX_MNTCAMPANYAS pac_iax_mntcampanyas = new PAC_IAX_MNTCAMPANYAS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap miDataObject = new HashMap();
			HashMap listaDetCapanyas = new HashMap();

			BigDecimal CCAMPAN = getCampoNumerico(request, "CCAMPANYA");

			listaDetCapanyas = pac_iax_mntcampanyas.ejecutaPAC_IAX_MNTCAMPANYAS__F_GET_CAMPANYA(CCAMPAN,
					new BigDecimal(0));

			// miDataObject.put("campanya",listaDetCapanyas.get("PCAMPANYA"));
			logger.debug(listaDetCapanyas);
			request.setAttribute("listaDetCapanyas", listaDetCapanyas.get("PCAMPANYA"));

			// request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc011Service - m_busqueda_detalle", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
