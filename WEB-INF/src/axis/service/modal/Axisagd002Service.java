//Revision:# f5Ahn14CRVsZJ1KLyTxQmA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AGENDA;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisagd002Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisagd002Action.java 17/11/2010
 * 
 * @since Java 5.0
 */
public class Axisagd002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisagd002Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			BigDecimal CTIPAGD = this.getHiddenCampoNumerico(request, "CTIPAGD");
			BigDecimal SPERSON = this.getHiddenCampoNumerico(request, "SPERSON");
			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VISIONOBS(IDOBS, CTIPAGD);
			tratarRETURNyMENSAJES(request, map, false);
		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			BigDecimal CTIPAGD = this.getHiddenCampoNumerico(request, "CTIPAGD");

			String pParam = this.getInfoString(request);
			if (!isEmpty(IDOBS)) {

				// IAXIS 3482 SGM 17/04/2019 se agrega columna a apartado gestion agenda
				BigDecimal NMOVOBS = this.getHiddenCampoNumerico(request, "NMOVOBS");
				int indice = 0;
				if (CTIPAGD.intValue() == 2) {
					indice = NMOVOBS.intValue() - 1;
				}
				// IAXIS 3482 SGM 17/04/2019 se agrega columna a apartado gestion agenda

				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAGDOBS(CTIPAGD, IDOBS, pParam);
				BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

				if (ok.intValue() == 0) {
					ArrayList lstagenda = (ArrayList) m.get("PLSTAGDOBS");
					if (!isEmpty(lstagenda) && lstagenda.size() > 0)
						formdata.putAll((Map) lstagenda.get(indice));// IAXIS 3482 SGM 17/04/2019 se trae por defecto el
																		// registro 0 de la lista o el correspondiente
																		// si es agenda recibo
				}

			} else {

				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_ENTIDAD(CTIPAGD, pParam);
				BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);

				if (ok.intValue() == 0) {
					formdata.put("TENTIDAD", m.get("PTENTIDAD"));
				}

			}

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			BigDecimal CCONOBS = this.getHiddenCampoNumerico(request, "CCONOBS");
			BigDecimal CTIPOBS = this.getHiddenCampoNumerico(request, "CTIPOBS");
			BigDecimal CAMBITO = this.getHiddenCampoNumerico(request, "CAMBITO");
			BigDecimal CPRIORI = this.getHiddenCampoNumerico(request, "CPRIORI");
			BigDecimal CPRIVOBS = this.getHiddenCampoNumerico(request, "CPRIVOBS");
			BigDecimal PUBLICO = isEmpty(this.getHiddenCampoNumerico(request, "PUBLICO"))
					? this.getCampoNumerico(request, "PUBLICO_AGD")
					: this.getHiddenCampoNumerico(request, "PUBLICO");
			formdata.put("PUBLICO", PUBLICO);
			BigDecimal CESTOBS = this.getHiddenCampoNumerico(request, "CESTOBS");
			String TTITOBS = this.getHiddenCampoTextual(request, "TTITOBS");
			String TOBS = this.getHiddenCampoTextual(request, "TOBS");
			java.sql.Date FOBS = this.stringToSqlDate(this.getCampoTextual(request, "FOBS"));
			java.sql.Date FRECORDATORIO = this.stringToSqlDate(this.getCampoTextual(request, "FRECORDATORIO"));
			java.sql.Date FESTOBS = this.stringToSqlDate(this.getCampoTextual(request, "FESTOBS"));
			BigDecimal CTIPAGD = this.getHiddenCampoNumerico(request, "CTIPAGD");
			formdata.put("CTIPAGD", CTIPAGD);

			BigDecimal SPERSON = this.getHiddenCampoNumerico(request, "SPERSON");

			String TDESC = getCampoTextual(request, "TDESC");
			BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
			String TFILENAME = getCampoTextual(request, "TFILE");

			BigDecimal sizeArrayVisionRol = this.getHiddenCampoNumerico(request, "sizeArrayVisionRol");

			if (!isEmpty(sizeArrayVisionRol)) {
				for (int i = 0; i < sizeArrayVisionRol.intValue(); i++) {

					String TTIPVISION = this.getHiddenCampoTextual(request, "TTIPVISION_ROL_" + i);
					BigDecimal VISION = this.getHiddenCampoNumerico(request, "VISION_ROL_" + i);

					Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(IDOBS, PUBLICO, new BigDecimal(1),
							TTIPVISION, VISION);
					this.tratarRETURNyMENSAJES(request, m);

				}
			}

			BigDecimal sizeArrayVisionUsu = this.getHiddenCampoNumerico(request, "sizeArrayVisionUsu");

			if (!isEmpty(sizeArrayVisionUsu)) {
				for (int i = 0; i < sizeArrayVisionUsu.intValue(); i++) {

					String TTIPVISION = this.getHiddenCampoTextual(request, "TTIPVISION_USU_" + i);
					BigDecimal VISION = this.getHiddenCampoNumerico(request, "VISION_USU_" + i);

					Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(IDOBS, PUBLICO, new BigDecimal(2),
							TTIPVISION, VISION);
					this.tratarRETURNyMENSAJES(request, m);

				}
			}

			String TTIPAGD = this.getInfoString(request);
			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_OBS(IDOBS, CCONOBS, CTIPOBS, TTITOBS, TOBS, FOBS,
					FRECORDATORIO, CTIPAGD, CAMBITO, CPRIORI, CPRIVOBS, PUBLICO, CESTOBS, FESTOBS, TTIPAGD, TDESC,
					TFILENAME, IDDOCGEDOX);
			BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			if (ok.intValue() == 0) {
				formdata.put("IDOBS_OUT", m.get("PIDOBS_OUT"));
			}

			String CUSUALT = this.getHiddenCampoTextual(request, "CUSUALT");
			formdata.put("CUSUALT", CUSUALT);

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar_usuario(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			BigDecimal PUBLICO = this.getHiddenCampoNumerico(request, "PUBLICO");

			BigDecimal CTIPAGD = this.getHiddenCampoNumerico(request, "CTIPAGD");
			formdata.put("CTIPAGD", CTIPAGD);

			BigDecimal sizeArrayVisionRol = this.getHiddenCampoNumerico(request, "sizeArrayVisionRol");

			for (int i = 0; i < sizeArrayVisionRol.intValue(); i++) {

				String TTIPVISION = this.getHiddenCampoTextual(request, "TTIPVISION_ROL_" + i);
				BigDecimal VISION = this.getHiddenCampoNumerico(request, "VISION_ROL_" + i);

				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(IDOBS, PUBLICO, new BigDecimal(1),
						TTIPVISION, VISION);
				this.tratarRETURNyMENSAJES(request, m);

			}

			BigDecimal sizeArrayVisionUsu = this.getHiddenCampoNumerico(request, "sizeArrayVisionUsu");

			for (int i = 0; i < sizeArrayVisionUsu.intValue(); i++) {

				String TTIPVISION = this.getHiddenCampoTextual(request, "TTIPVISION_USU_" + i);
				BigDecimal VISION = this.getHiddenCampoNumerico(request, "VISION_USU_" + i);

				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(IDOBS, PUBLICO, new BigDecimal(2),
						TTIPVISION, VISION);
				this.tratarRETURNyMENSAJES(request, m);

			}
			String CUSUARI = this.getHiddenCampoTextual(request, "CUSUARI");
			if (!isEmpty(CUSUARI)) {
				Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_SET_VISIONOBS_OB(IDOBS, PUBLICO, new BigDecimal(2),
						CUSUARI, new BigDecimal(1));
				this.tratarRETURNyMENSAJES(request, m);
			}

			String CUSUALT = this.getHiddenCampoTextual(request, "CUSUALT");
			formdata.put("CUSUALT", CUSUALT);

			this.m_cargarCombos(request, thisAction);
			PUBLICO = isEmpty(this.getHiddenCampoNumerico(request, "PUBLICO"))
					? this.getCampoNumerico(request, "PUBLICO_AGD")
					: this.getHiddenCampoNumerico(request, "PUBLICO");
			formdata.put("PUBLICO", PUBLICO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002Service - m�todo m_guardar_usuario", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla.
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();

		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CTIPAGD = this.getHiddenCampoNumerico(request, "CTIPAGD");
			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			String CMODO = "";
			if (!isEmpty(getCampoTextual(request, "CMODO"))) {
				AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
				CMODO = getCampoTextual(request, "CMODO");
			}
			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTCONCEPTOS(CTIPAGD, CMODO); // Tipo de agenda
			tratarRETURNyMENSAJES(request, map, false);
			listValores.put("lstconcepto", map.get("PLSTCONCEPTOS"));

			Map m = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(9));
			listValores.put("lstsino", (List) tratarRETURNyMENSAJES(request, m, false));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOAPUNTESAGENDA();
			listValores.put("lsttipos", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de Estado de apuntes
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			listValores.put("lstestados", (List) tratarRETURNyMENSAJES(request, map, false));

			// Lista de Tipos Agenda
			map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTTIPOSAGENDA();
			tratarRETURNyMENSAJES(request, map, false);
			listValores.put("lsttiposagenda", map.get("PLSTTIPOSAGENDA"));

			// Lista de Roles
			map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTROLES(CTIPAGD);
			tratarRETURNyMENSAJES(request, map, false);
			listValores.put("lstroles", map.get("PLSTROLES"));

			map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VISIONOBS_OB();
			tratarRETURNyMENSAJES(request, map, false);
			listValores.put("lstvisionrol", map.get("PLSTVISIONROL"));
			listValores.put("lstvisionusu", map.get("PLSTVISIONUSU"));
			// Lista de usuarios
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			listValores.put("lstusuarios", (List) tratarRETURNyMENSAJES(request, map, false));
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_buscar(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDAPUNTE = this.getHiddenCampoNumerico(request, "IDAPUNTE");
			BigDecimal IDAGENDA = this.getHiddenCampoNumerico(request, "IDAGENDA");
			BigDecimal CCLAGD = this.getHiddenCampoNumerico(request, "CCLAGD");
			BigDecimal CCONAPU = this.getHiddenCampoNumerico(request, "CCONAPU");
			BigDecimal CESTAPU = this.getHiddenCampoNumerico(request, "CESTAPU");
			String CGRUPO = this.getHiddenCampoTextual(request, "CGRUPO");
			String TGRUPO = this.getHiddenCampoTextual(request, "TGRUPO");
			BigDecimal CTIPAPU = this.getHiddenCampoNumerico(request, "CTIPAPU");
			BigDecimal CPERAGD = this.getHiddenCampoNumerico(request, "CPERAGD");
			BigDecimal CAMBITO = this.getHiddenCampoNumerico(request, "CAMBITO");
			BigDecimal CPRIORI = this.getHiddenCampoNumerico(request, "CPRIORI");
			String TCLAGD = this.getHiddenCampoTextual(request, "TCLAGD");
			String TTITAPU = this.getHiddenCampoTextual(request, "TTITAPU");
			String CUSUARI = this.getHiddenCampoTextual(request, "CUSUARI");
			java.sql.Date FALTA = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FALTA"));
			java.sql.Date FAPUNTE = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FAPUNTE"));
			java.sql.Date FRECORDATORIO = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FRECORDATORIO"));
			// Bug 0017744 - 25/02/2011 - JMF
			String CAPUAGE = this.getHiddenCampoTextual(request, "CAPUAGE");

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_LSTAPUNTES(IDAPUNTE, IDAGENDA, CCLAGD, TCLAGD, CCONAPU,
					CESTAPU, CGRUPO, TGRUPO, TTITAPU, CTIPAPU, CPERAGD, CAMBITO, CPRIORI, FAPUNTE, FALTA, FRECORDATORIO,
					CUSUARI, CAPUAGE, null);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				formdata.put("resultagenda", m.get("PLSTAGENDA"));
			}

			formdata.remove("CCLAGD");
			request.removeAttribute("CCLAGD");
			formdata.remove("CGRUPO");
			request.removeAttribute("CGRUPO");

			this.m_cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_actualitzar_usuarios(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			BigDecimal PUBLICO = this.getHiddenCampoNumerico(request, "PUBLICO");
			BigDecimal CPRIVOBS = this.getHiddenCampoNumerico(request, "CPRIVOBS");

			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_ACTUALIZAR_VISION_OB(IDOBS, PUBLICO, CPRIVOBS);
			tratarRETURNyMENSAJES(request, map, false);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002 - m�todo m_ajax_actualitzar_usuarios", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_busqueda_valoresgrupo(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CGRUPO = getHiddenCampoTextual(request, "CGRUPO");

			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_GET_VALORESGRUPO(CGRUPO, new BigDecimal(1));

			ArrayList datos = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
			if (!isEmpty(datos)) {
				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(datos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002 - m�todo m_ajax_busqueda_valoresgrupo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_del_vision(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PIDOBS = this.getHiddenCampoNumerico(request, "IDOBS");
			BigDecimal PCTIPVISON = this.getHiddenCampoNumerico(request, "CTIPVISION");

			String PTTIPVISION = this.getHiddenCampoTextual(request, "TTIPVISION");
			formdata.put("IDOBS", PIDOBS);
			BigDecimal CTIPAGD = this.getHiddenCampoNumerico(request, "CTIPAGD");
			formdata.put("CTIPAGD", CTIPAGD);
			String CUSUALT = this.getHiddenCampoTextual(request, "CUSUALT");
			formdata.put("CUSUALT", CUSUALT);

			this.m_guardar_usuario(request, thisAction);

			BigDecimal PUBLICO = isEmpty(this.getHiddenCampoNumerico(request, "PUBLICO"))
					? this.getCampoNumerico(request, "PUBLICO_AGD")
					: this.getHiddenCampoNumerico(request, "PUBLICO");
			formdata.put("PUBLICO", PUBLICO);

			Map m = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_DEL_VISIONOBS_OB(PIDOBS, PCTIPVISON, PTTIPVISION);
			this.tratarRETURNyMENSAJES(request, m);

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private String getInfoString(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	// --ABJ bug 4961 validar si existe conclusiones y si no traer descripcion de
	// riesgo
	public void m_ajax_valconclusiones(HttpServletRequest request, Axisagd002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			PAC_IAX_AGENDA paciaxagenda = new PAC_IAX_AGENDA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal IDOBS = this.getHiddenCampoNumerico(request, "IDOBS");

			BigDecimal PNSINIES = null;
			if (isEmpty(IDOBS)) {
				PNSINIES = this.getHiddenCampoNumerico(request, "PNSINIES");

			}
			Map map = paciaxagenda.ejecutaPAC_IAX_AGENDA__F_VALCONCLUSIONES(IDOBS, PNSINIES);
			tratarRETURNyMENSAJES(request, map, false);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisagd002 - m�todo m_ajax_valconclusiones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
