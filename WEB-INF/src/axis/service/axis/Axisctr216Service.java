package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_FONDOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisctr216Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisfinv016Service m_init");
		try {

			m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr031Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr216Service.class));
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En �l hacemos la carga inicial
	 * del riesgo con sus preguntas y garantias.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("axisctr216Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
		logger.debug("VMODO : " + VMODO);
		request.getSession().setAttribute("MODO", VMODO);
		try {
			/* Lista de modelos de inversi�n */
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			formdata.put("SPRODUC", SPRODUC);
			Map mm = pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PERFIL_LIBRE", SPRODUC);
			BigDecimal perfLibre = (BigDecimal) mm.get("RETURN");
			BigDecimal NMODELO = this.getHiddenCampoNumerico(request, "NMODELO");
			// Map par =
			// pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("MODIF_CMODABO",
			// SPRODUC);

			// formdata.put("permiteModif",tratarRETURNyMENSAJES(request, par));

			mm = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(NMODELO);
			Map modelos = (Map) this.tratarRETURNyMENSAJES(request, mm);
			if (modelos.get("CMODINV") != null) {
				NMODELO = (BigDecimal) modelos.get("CMODINV");
				mm = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(NMODELO);
				modelos = (Map) this.tratarRETURNyMENSAJES(request, mm);
				formdata.put("MODINVFONDO", modelos.get("MODINVFONDO"));
			}

			formdata.put("CMODINV", NMODELO);
			formdata.put("perfLibre", perfLibre);

			/* Listado de perfiles */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000942));
			request.setAttribute("LST_MODABO", tratarRETURNyMENSAJES(request, map));

			if (!isEmpty(SPRODUC)) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERFILES(SPRODUC);

				logger.debug(map);

				request.setAttribute("LST_PERFILES", tratarRETURNyMENSAJES(request, map));
			}
			/*
			 * if( formdata.get("CMODINV")!=null &&
			 * ((BigDecimal)formdata.get("CMODINV")).intValue() >= 0 ){
			 * this.m_recargarMODINVFONDO(request); }
			 */

			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr216Service.class));
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr216Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("axisctr216Service m_anterior");
		String CFORM = getCampoTextual(request, "FORM_ACT");
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
		request.setAttribute("SSEGURO", SSEGURO);
		request.setAttribute("SSEGURO_OUT", SSEGURO_OUT);
		request.setAttribute("SPRODUC", SPRODUC);
		request.setAttribute("NRIESGO", NRIESGO);
		BigDecimal CMODINV = (BigDecimal) getCampoNumerico(request, "CMODINV");
		BigDecimal perfLibre = (BigDecimal) getCampoNumerico(request, "perfLibre");

		try {
			PAC_IAX_PRODUCCION pacIaxProd = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!CMODINV.equals(perfLibre)) {
				pacIaxProd.ejecutaPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(CMODINV);
			}
			Map m = pacIaxProd.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
			tratarRETURNyMENSAJES(request, m);
			request.setAttribute("NMODELO", CMODINV);
			if (m.get("MENSAJES") != null) {
				this.m_form(request, thisAction);

			} else {
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, Constantes.SIGUIENTE, CFORM, null));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr216Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr216Service.class));

	}

	public void m_recargarMODINVFONDO(HttpServletRequest request) {
		logger.debug("axisctr216Service m_RecargarMODINVFONDO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CMODINV = getCampoNumerico(request, "CMODINV");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");
			logger.debug(CMODINV);
			PAC_IAX_FONDOS pac_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mFondos = pac_fondos.ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOSSEG(sproduc, CMODINV);
			List lstFondos = (List) mFondos.get("PMODINVFONDO");

			formdata.put("MODINVFONDO", lstFondos);
			ajax.guardarContenidoFinalAContenedorAjax(lstFondos);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr216Service - m�todo datosUnitLinked_RecargarMODINVFONDO", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardarFondo(HttpServletRequest request) {
		logger.debug("axisctr216Service m_guardarFondo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal pPNMODELO = getCampoNumerico(request, "pcmodinv");
			BigDecimal pPCCODFON = getCampoNumerico(request, "pccodfon");
			BigDecimal pPCMODABO = getCampoNumerico(request, "pcmodabo");
			BigDecimal pPPINVERS = getCampoNumerico(request, "ppinvers");
			PAC_IAX_PRODUCCION pac_prod = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			pac_prod.ejecutaPAC_IAX_PRODUCCION__F_SET_MODELOINV_FONDO(pPNMODELO, pPCCODFON, pPCMODABO, pPPINVERS);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr216Service - m_guardarFondo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_borrarFondo(HttpServletRequest request) {
		logger.debug("axisctr216Service m_guardarFondo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal pPNMODELO = getCampoNumerico(request, "pcmodinv");
			BigDecimal pPCCODFON = getCampoNumerico(request, "pccodfon");
			BigDecimal pPCMODABO = getCampoNumerico(request, "pcmodabo");
			BigDecimal pPPINVERS = getCampoNumerico(request, "ppinvers");
			PAC_IAX_PRODUCCION pac_prod = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			pac_prod.ejecutaPAC_IAX_PRODUCCION__F_ELIMINA_MODELOINV_FONDO(pPNMODELO, pPCCODFON, pPCMODABO, pPPINVERS);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr216Service - m_guardarFondo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param requestequest
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("AxisfinvService m_anterior");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// Al informar preguntas y darle atrasno se bajan las preguntas a las EST, eso
			// hace
			// que salten validaciones incorrectamente.
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
			logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, "axisctr216", null));

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr216Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));

	}
}