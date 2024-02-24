package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisusu007Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisusu007Service.java 07/11/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastor</a>
 * @since Java 5.0
 */
public class Axisusu007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu007Action thisAction) {
		logger.debug("Axisusu007Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisusu003Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map LSTVALORES = new HashMap();

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			logger.debug(map);
			LSTVALORES.put("LSTIDIOMAS", tratarRETURNyMENSAJES(request, map, false));

			/* Recuperar lista de Agentes */
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGWIZARD();
			logger.debug(map);
			LSTVALORES.put("LSTWIZARD", tratarRETURNyMENSAJES(request, map, false));

			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGFORM();
			logger.debug(map);
			LSTVALORES.put("LSTFORM", tratarRETURNyMENSAJES(request, map, false));

			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGACCION();
			logger.debug(map);
			LSTVALORES.put("LSTACCION", tratarRETURNyMENSAJES(request, map, false));

			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_ROLMENU();
			logger.debug(map);
			LSTVALORES.put("LSTMENU", tratarRETURNyMENSAJES(request, map, false));

			// F_get_lst_ codsuplem
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CODSUPLEM();
			logger.debug(map);
			LSTVALORES.put("LSTSUPL", tratarRETURNyMENSAJES(request, map, false));

			// F_get_lst_cfgdoc
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGDOC();
			logger.debug(map);
			LSTVALORES.put("LSTDOC", tratarRETURNyMENSAJES(request, map, false));

			// F_get_lst_caccprod
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CACCPROD();
			logger.debug(map);
			LSTVALORES.put("LSTACCPROD", tratarRETURNyMENSAJES(request, map, false));

			// F_get_lst_cfgmap
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGMAP();
			logger.debug(map);
			LSTVALORES.put("LSTMAP", tratarRETURNyMENSAJES(request, map, false));

			// F_get_lst_cfgmap
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_USUAGRU();
			logger.debug(map);
			LSTVALORES.put("LSTUSUAGRU", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_aceptar(HttpServletRequest request, Axisusu007Action thisAction) {
		logger.debug("Axisusu007Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CROL = getHiddenCampoTextual(request, "CROL");
			String TROL = getCampoTextual(request, "TROL");
			BigDecimal CEMPRES = usuario.getCempres();
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal isNewRol = getCampoNumerico(request, "isNewRol");
			//
			String CWIZARD = getCampoTextual(request, "CCFGWIZ");
			String CFORM = getCampoTextual(request, "CCFGFORM");
			String CACCION = getCampoTextual(request, "CCFGACC");
			String CMENU = getCampoTextual(request, "CROLMEN");
			String CCONSUPL = getCampoTextual(request, "CCONSUPL");
			String CACCPROD = getCampoTextual(request, "CACCPROD");
			String CDOCUMENTACIO = getCampoTextual(request, "CCFGDOC");
			String CMAP = getCampoTextual(request, "CCFGMAP");
			String CUSUAGRU = getCampoTextual(request, "CUSUAGRU");
			BigDecimal CILIMITE = getCampoNumerico(request, "CILIMITE");

			if (isNewRol.equals(new BigDecimal(0))) {
				Map map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_SET_ROL(CROL, TROL, CIDIOMA, CEMPRES, CWIZARD, CFORM, CACCION,
						CMENU, CCONSUPL, CDOCUMENTACIO, CACCPROD, CMAP, CUSUAGRU, CILIMITE);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
			} else {
				Map map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_NEW_ROL(CROL, TROL, CIDIOMA, CEMPRES, CWIZARD, CFORM, CACCION,
						CMENU, CCONSUPL, CDOCUMENTACIO, CACCPROD, CMAP, CUSUAGRU, CILIMITE);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
			}

			formdata.put("isNewRol", 0);
			formdata.put("CROL", CROL);
			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu007Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_buscar(HttpServletRequest request, Axisusu007Action thisAction) {
		logger.debug("Axisusu007Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_CFG pacIaxCfg = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CROL = request.getParameter("PARCROL"); // getCampoTextual(request, "PARCROL");
			BigDecimal CEMPRES = new BigDecimal(request.getParameter("PARCEMPRES")); // getCampoNumerico(request,
																						// "PARCEMPRES");

			Map map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_ROL(CROL, CEMPRES);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);

			String TROL = (String) map.get("PTROL");
			String CCFGWIZ = (String) map.get("PCWIZARD");
			String CCFGFORM = (String) map.get("PCFORM");
			String CCFGACC = (String) map.get("PCACCION");
			String CROLMEN = (String) map.get("PCMENU");
			String CCONSUPL = (String) map.get("PCCONSUPL");
			String CACCPROD = (String) map.get("PCACCPROD");
			String CCFGDOC = (String) map.get("PCDOCUMENTACIO");
			String CCFGMAP = (String) map.get("PCMAP");
			String CUSUAGRU = (String) map.get("PCUSUAGRU");
			BigDecimal CILIMITE = (BigDecimal) map.get("PCILIMITE");

			formdata.put("isNewRol", 0);
			formdata.put("CROL", CROL);
			formdata.put("TROL", TROL);
			formdata.put("CCFGWIZ", CCFGWIZ);
			formdata.put("CCFGFORM", CCFGFORM);
			formdata.put("CCFGACC", CCFGACC);
			formdata.put("CROLMEN", CROLMEN);
			formdata.put("CCONSUPL", CCONSUPL);
			formdata.put("CACCPROD", CACCPROD);
			formdata.put("CCFGDOC", CCFGDOC);
			formdata.put("CCFGMAP", CCFGMAP);
			formdata.put("CUSUAGRU", CUSUAGRU);
			formdata.put("CILIMITE", CILIMITE);

			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu007Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}