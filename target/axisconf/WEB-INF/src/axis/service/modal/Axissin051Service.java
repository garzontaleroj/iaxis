package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin051Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin051Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin017Service axissin017Service = new Axissin017Service();

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map listValores = new HashMap();
		Map map;

		map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800067));
		logger.debug(map);
		listValores.put("lsttipdeman", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listvalores", listValores);
		formdata.put("CAGENTE", usuario.getCagente());

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin051Action thisAction) {
		logger.debug("Axissin051Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axissin051Service m_form");

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			formdata.put("NSINIES", NSINIES);
			logger.debug(NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug(NTRAMIT);
			formdata.put("NTRAMIT", NTRAMIT);
			String TTRAMIT = getCampoTextual(request, "TTRAMIT");
			logger.debug(TTRAMIT);
			formdata.put("TTRAMIT", TTRAMIT);
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			formdata.put("CAGENTE", CAGENTE);
			BigDecimal NTIPODEM = getCampoNumerico(request, "NTIPODEM");
			formdata.put("NTIPODEM", NTIPODEM);
			BigDecimal NLINDEM = getCampoNumerico(request, "NLINDEM");
			formdata.put("NLINDEM", NLINDEM);

			String isNew = getCampoTextual(request, "isNew");
			logger.debug(isNew);

			logger.debug("--" + getCampoNumerico(request, "NTRAMIT"));
			this.cargarListas(request);

			if (!isEmpty(NLINDEM)) {
				m_cargar(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_recargar(HttpServletRequest request, Axissin051Action thisAction) {

		logger.debug("Axissin051Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin051Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_traspasar(HttpServletRequest request, Axissin051Action thisAction) {

		logger.debug("Axissin051Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE_VISIO = getCampoNumerico(request, "CAGENTE_VISIO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal ABOGADO = getCampoNumerico(request, "ABOGADO");
			BigDecimal CAGENTE_PROD = getCampoNumerico(request, "CAGE");
			logger.debug("CAGENTE_PROD ---> " + CAGENTE_PROD);
			logger.debug("CAGENTE_VISIO ---> " + CAGENTE_VISIO);

			BigDecimal NTIPODEM = isEmpty(getHiddenCampoNumerico(request, "NTIPODEM"))
					? getHiddenCampoNumerico(request, "NTIPODEM2")
					: getHiddenCampoNumerico(request, "NTIPODEM");
			formdata.put("NTIPODEM", NTIPODEM);

			BigDecimal IDEPERSONA = isEmpty(getCampoNumerico(request, "PERSONA"))
					? getCampoNumerico(request, "IDEPERSONA")
					: getCampoNumerico(request, "PERSONA");
			logger.debug("--- IDEPERSONA" + IDEPERSONA);
			formdata.put("IDEPERSONA", IDEPERSONA);

			formdata.put("CAG_AUX", CAGENTE_PROD);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = null;
			if (IDEPERSONA.intValue() == 1)
				m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER(SPERSON, CAGENTE_VISIO,
						CAGENTE_PROD);
			else if (IDEPERSONA.intValue() == 2)
				m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER(ABOGADO, CAGENTE_VISIO,
						CAGENTE_PROD);

			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);

			BigDecimal pctramit = getCampoNumerico(request, "CTRAMIT");
			formdata.put("CTRAMIT", pctramit);
			// BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			// BigDecimal ABOGADO = this.getCampoNumerico(request, "ABOGADO");
			logger.debug("---- SPERSON:" + SPERSON + " ABOGADO:" + ABOGADO);
			BigDecimal CAGENTE = usuario.getCagente();
			formdata.put("CAGENTE", CAGENTE);
			logger.debug("CAGENTE-- :" + CAGENTE);
			Map map = null;
			String SNIP = this.getCampoTextual(request, "SNIP");
			if (!isEmpty(SPERSON)) {

				String PMODE = new String("POL");
				map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);
				tratarRETURNyMENSAJES(request, map);
				logger.debug("get PERSONA()" + map);
				Map OB_PERSONA = (Map) map.get("OBPERSONA");

				formdata.putAll(OB_PERSONA);

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				formdata.put("NOMBRE", nomComplet);

				if (isEmpty(SNIP))
					SNIP = (String) OB_PERSONA.get("SNIP");

				String PORIGEN = this.getCampoTextual(request, "ORIGEN");
				if (isEmpty(PORIGEN))
					PORIGEN = "INT";
			}

			if (!isEmpty(ABOGADO)) {

				String PMODE = new String("POL");
				map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(ABOGADO, CAGENTE, PMODE);
				tratarRETURNyMENSAJES(request, map);
				logger.debug("get PERSONA()" + map);
				Map OB_PERSONA = (Map) map.get("OBPERSONA");

				formdata.put("NNUMIDEABOGADO", OB_PERSONA.get("NNUMIDE"));
				formdata.put("ABOGADO", OB_PERSONA.get("SPERSON"));

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				formdata.put("NOMBREABOGADO", nomComplet);

				if (isEmpty(SNIP))
					SNIP = (String) OB_PERSONA.get("SNIP");

				String PORIGEN = this.getCampoTextual(request, "ORIGEN");
				if (isEmpty(PORIGEN))
					PORIGEN = "INT";

			}

			this.cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin051Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin051Action thisAction) {

		logger.debug("Axissin051Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");

			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug(NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug(NTRAMIT);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug(SPERSON);
			BigDecimal NLINDEM = getCampoNumerico(request, "NLINDEM");
			BigDecimal NTIPODEM = isEmpty(getHiddenCampoNumerico(request, "NTIPODEM"))
					? getHiddenCampoNumerico(request, "NTIPODEM2")
					: getHiddenCampoNumerico(request, "NTIPODEM");
			String TTRAMITA = getCampoTextual(request, "TTRAMITA");
			BigDecimal SPERSON2 = getCampoNumerico(request, "ABOGADO");
			String NPROCEDI = getCampoTextual(request, "NPROCEDI");
			String TCOMPANI = getCampoTextual(request, "COMPANI");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDEMAND(NSINIES, NTRAMIT,
					NLINDEM, SPERSON, NTIPODEM, TTRAMITA, SPERSON2, NPROCEDI, TCOMPANI);

			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0)))
				formdata.put("val1", "OK");

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin051Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargar(HttpServletRequest request, Axissin051Action thisAction) {

		logger.debug("Axissin051Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			logger.debug(NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug(NTRAMIT);
			BigDecimal NLINDEM = getCampoNumerico(request, "NLINDEM");
			logger.debug(NLINDEM);
			BigDecimal NTIPODEM = getCampoNumerico(request, "NTIPODEM");
			formdata.put("NTIPODEM", NTIPODEM);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMIDEMAND(NSINIES, NTRAMIT,
					NLINDEM, NTIPODEM);
			logger.debug("---> demandante:" + m);
			Map demand = (Map) tratarRETURNyMENSAJES(request, m);

			formdata.put("ABOGADO", demand.get("SPERSON2"));
			Map abogado = (Map) demand.get("ABOGADO");
			logger.debug("---> abogado:" + abogado);
			if (!isEmpty(abogado)) {
				formdata.put("NNUMIDEABOGADO", abogado.get("NNUMIDE"));
				String nombre = (String) abogado.get("TNOMBRE") + abogado.get("TAPELLI1") + abogado.get("TAPELLI2");
				formdata.put("NOMBREABOGADO", nombre);
			}
			formdata.put("NPROCEDI", demand.get("NPROCEDI"));
			formdata.put("COMPANI", demand.get("TCOMPANI"));
			formdata.put("SPERSON", demand.get("SPERSON"));

			Map persona = (Map) demand.get("PERSONA");
			logger.debug("---> persona:" + persona);
			if (!isEmpty(persona)) {
				formdata.put("NNUMIDE", persona.get("NNUMIDE"));
				String nombre = (String) persona.get("TNOMBRE") + persona.get("TAPELLI1") + persona.get("TAPELLI2");
				formdata.put("NOMBRE", nombre);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin051Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
	/*
	 * public void m_ajax_actualiza_persona(HttpServletRequest request) {
	 * logger.debug("Axissin007Service m_ajax_actualiza_persona"); UsuarioBean
	 * usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
	 * AjaxContainerService ajax = new AjaxContainerService(); Map formdata =
	 * (Map)request.getAttribute(Constantes.FORMDATA); try {
	 * 
	 * BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
	 * //(BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO"); BigDecimal
	 * CAGENTE = this.getCampoNumerico(request, "CAGENTE"); //(BigDecimal)
	 * AbstractDispatchAction.topPila(request, "SSEGURO");
	 * 
	 * /* if (isEmpty(request.getSession().getAttribute("CAGENTE")))
	 * request.getSession().setAttribute("CAGENTE",CAGENTE);
	 * 
	 * if (!isEmpty (request.getSession().getAttribute("CAGENTE")) && isEmpty
	 * (CAGENTE)){ CAGENTE = (BigDecimal)
	 * request.getSession().getAttribute("CAGENTE");
	 * formdata.put("CAGENTE",CAGENTE); }
	 */
	/*
	 * logger.debug("act. person : "+CAGENTE); String PMODE = new String("POL"); Map
	 * map = new
	 * PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
	 * )).ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON,CAGENTE,PMODE);
	 * 
	 * 
	 * logger.debug("get PERSONA()" + map); BigDecimal RETURN =
	 * (BigDecimal)tratarRETURNyMENSAJES(request, map); if (!isEmpty(map) && new
	 * BigDecimal(0).equals(RETURN)) {
	 * //ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA")); Map OB_PERSONA =
	 * (Map)map.get("OBPERSONA"); logger.debug(OB_PERSONA);
	 * ajax.rellenarPlAContenedorAjax(map);
	 * 
	 * 
	 * ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA); }
	 * 
	 * } catch (Exception e) { logger.
	 * error("Error en el servicio Axissin007Service - m�todo m_ajax_actualiza_persona"
	 * , e); ajax.rellenarExcepcionAContenedorAjax(e); } finally {
	 * request.setAttribute(Constantes.AJAXCONTAINER,
	 * ajax.procesarContenedorAjax()); } }
	 * 
	 * 
	 * public void m_ajax_direccion(HttpServletRequest request) {
	 * 
	 * axissin017Service.m_ajax_direccion(request, null); }
	 * 
	 */
}
