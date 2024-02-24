package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTUSER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axismnt018Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axismnt018Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Autor creaci�n</a> Fecha:
 *         DD/MM/YYYY PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 DD/MM/YYYY
 *         XXX(iniciales) 1. Creaci�n del Service. Bug.9296
 */
public class Axismnt018Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axismnt018Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismnt018Action thisAction) {
		logger.debug("Axismnt018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(map);
			LISTVALORES.put("LSTSINO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRES"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES")))
					: this.getCampoNumerico(request, "CEMPRES");

			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
				formdata.put("CEMPRES", usuario.getCempres());
			} else {
				formdata.put("CEMPRES", CEMPRES);
			}

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_PRODUCTOS(CEMPRES);
			logger.debug(map);
			LISTVALORES.put("LSTPRODUCTOS", (List<Map>) map.get("PCURSOR"));

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CCFGFORM(CEMPRES);
			logger.debug(map);
			LISTVALORES.put("LSTCCFGFORM", (List<Map>) map.get("PCURSOR"));

			BigDecimal SPRODUC = isEmpty(this.getCampoNumerico(request, "SPRODUC"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC")))
					: this.getCampoNumerico(request, "SPRODUC");

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODMODO(CEMPRES, SPRODUC);
			logger.debug(map);
			LISTVALORES.put("LSTCODMODO", (List<Map>) map.get("PCURSOR"));

			String CMODO = isEmpty(this.getCampoTextual(request, "CMODO"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CMODO")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "CMODO")))
					: this.getCampoTextual(request, "CMODO");

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODFORM(CEMPRES, SPRODUC, CMODO);
			logger.debug(map);
			LISTVALORES.put("LSTCODFORM", (List<Map>) map.get("PCURSOR"));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axismnt018Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(map);
			LISTVALORES.put("LSTSINO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800012));
			logger.debug(map);
			LISTVALORES.put("LSTENMASCARA", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "BCEMPRES"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "BCEMPRES")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "BCEMPRES")))
					: this.getCampoNumerico(request, "BCEMPRES");

			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
				formdata.put("CEMPRES", usuario.getCempres());
			} else {
				formdata.put("CEMPRES", CEMPRES);
			}

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_PRODUCTOS(CEMPRES);
			logger.debug(map);
			LISTVALORES.put("LSTPRODUCTOS", (List<Map>) map.get("PCURSOR"));

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CCFGFORM(CEMPRES);
			logger.debug(map);
			LISTVALORES.put("LSTCCFGFORM", (List<Map>) map.get("PCURSOR"));

			BigDecimal SPRODUC = isEmpty(this.getCampoNumerico(request, "BSPRODUC"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "BSPRODUC")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "BSPRODUC")))
					: this.getCampoNumerico(request, "BSPRODUC");

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODMODO(CEMPRES, SPRODUC);
			logger.debug(map);
			LISTVALORES.put("LSTCODMODO", (List<Map>) map.get("PCURSOR"));

			String CMODO = isEmpty(this.getCampoTextual(request, "BCMODO"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "BCMODO")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "BCMODO")))
					: this.getCampoTextual(request, "BCMODO");

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODFORM(CEMPRES, SPRODUC, CMODO);
			logger.debug(map);
			LISTVALORES.put("LSTCODFORM", (List<Map>) map.get("PCURSOR"));

			formdata.put("LISTVALORES", LISTVALORES);

			//
			String CFORM = isEmpty(this.getCampoTextual(request, "BCODFORM"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "BCODFORM")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "BCODFORM")))
					: this.getCampoTextual(request, "BCODFORM");

			String CCFGFORM = isEmpty(this.getCampoTextual(request, "BCCFGFORM"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "BCCFGFORM")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "BCCFGFORM")))
					: this.getCampoTextual(request, "BCCFGFORM");

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CFGFORMPROPERTY(CEMPRES, CFORM, CMODO, CCFGFORM,
					SPRODUC);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

			List<Map> PROPIEDADES = (List<Map>) map.get("PCURSOR");

			BigDecimal CIDCFG = (BigDecimal) map.get("PCIDCFG");

			formdata.put("PROPIEDADES", PROPIEDADES);
			formdata.put("CIDCFG", CIDCFG);

			formdata.put("CEMPRES", CEMPRES);
			formdata.put("CODFORM", CFORM);
			formdata.put("CMODO", CMODO);
			formdata.put("CCFGFORM", CCFGFORM);
			formdata.put("SPRODUC", SPRODUC);
			//
		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt018Service - m�todo m_buscar", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axismnt018Action thisAction) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();
		try {

			BigDecimal CEMPRES = this.getCampoNumerico(request, "PCEMPRES");
			BigDecimal CVALUE = this.getCampoNumerico(request, "PCVALUE");
			BigDecimal CIDCFG = this.getCampoNumerico(request, "PCIDCFG");
			String CFORM = this.getCampoTextual(request, "PCFORM");
			String CITEM = this.getCampoTextual(request, "PCITEM");
			BigDecimal CPRPTY = this.getCampoNumerico(request, "PCPRPTY");

			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = new HashMap();

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_SET_CFGFORMPROPERTY(CEMPRES, CIDCFG, CFORM, CITEM, CPRPTY,
					CVALUE);
			logger.debug(map);
			// Map dummy = (Map) tratarRETURNyMENSAJES(request, map, false);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt018Service - m�todo m_guardar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_borrar(HttpServletRequest request, Axismnt018Action thisAction) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();
		try {

			BigDecimal CEMPRES = this.getCampoNumerico(request, "PCEMPRES");
			BigDecimal CIDCFG = this.getCampoNumerico(request, "PCIDCFG");
			String CFORM = this.getCampoTextual(request, "PCFORM");
			String CITEM = this.getCampoTextual(request, "PCITEM");
			BigDecimal CPRPTY = this.getCampoNumerico(request, "PCPRPTY");

			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = new HashMap();

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_DEL_CFGFORMPROPERTY(CEMPRES, CIDCFG, CFORM, CITEM, CPRPTY);
			logger.debug(map);
			Map dummy = (Map) tratarRETURNyMENSAJES(request, map, false);

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt018Service - m�todo m_borrar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
