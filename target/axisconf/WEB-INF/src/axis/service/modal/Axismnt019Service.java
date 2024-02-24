package axis.service.modal;

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
import axis.mvc.control.modal.Axismnt019Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * NOMBRE: Axismnt019Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Autor creaci�n</a> Fecha:
 *         DD/MM/YYYY PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 DD/MM/YYYY
 *         XXX(iniciales) 1. Creaci�n del Service. Bug.9296
 */
public class Axismnt019Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axismnt019Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axismnt019Action thisAction) {
		logger.debug("Axismnt019Service m_form");
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

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODMODO_N();
			logger.debug(map);
			LISTVALORES.put("LSTCODMODO", (List<Map>) map.get("PCURSOR"));

			map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODFORM_N();
			logger.debug(map);
			LISTVALORES.put("LSTCODFORM", (List<Map>) map.get("PCURSOR"));

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt019Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axismnt019Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRES"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES")))
					: this.getCampoNumerico(request, "CEMPRES");

			BigDecimal SPRODUC = isEmpty(this.getCampoNumerico(request, "SPRODUC"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC")))
					: this.getCampoNumerico(request, "SPRODUC");

			String CMODO = isEmpty(this.getCampoTextual(request, "CMODO"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CMODO")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "CMODO")))
					: this.getCampoTextual(request, "CMODO");

			String CFORM = isEmpty(this.getCampoTextual(request, "CODFORM"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CODFORM")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "CODFORM")))
					: this.getCampoTextual(request, "CODFORM");

			String CCFGFORM = isEmpty(this.getCampoTextual(request, "CCFGFORM"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CCFGFORM")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "CCFGFORM")))
					: this.getCampoTextual(request, "CCFGFORM");

			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_SET_CFGFORM(CEMPRES, CFORM, CMODO, CCFGFORM, SPRODUC,
					null);
			logger.debug(map);

			tratarRETURNyMENSAJES(request, map, false);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(1));
			} else {
				formdata.put("OK", new BigDecimal(0));

				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map LISTVALORES = new HashMap();

				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
				logger.debug(map);
				LISTVALORES.put("LSTEMPRESAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
				logger.debug(map);
				LISTVALORES.put("LSTSINO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

				CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRES"))
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

				map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODMODO_N();
				logger.debug(map);
				LISTVALORES.put("LSTCODMODO", (List<Map>) map.get("PCURSOR"));

				map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CODFORM_N();
				logger.debug(map);
				LISTVALORES.put("LSTCODFORM", (List<Map>) map.get("PCURSOR"));

				formdata.put("LISTVALORES", LISTVALORES);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt019Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
