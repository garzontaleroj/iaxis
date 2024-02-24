//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MARCAS;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_USER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisusu003Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axisusu003Service.java 07/11/2008
 * 
 * @author <a href="xpastor@csi-ti.com">Xavi Pastorr</a>
 * @since Java 5.0
 */
public class Axisusu003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axisusu003Action thisAction) {
		logger.debug("Axisusu003Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CEMPRES = usuario.getCempres();
		try {

			this.cargarCombos(request);

			if ("axis.isNewUser".equals(request.getParameter("usuario"))) {
				formdata.put("isNewUser", "true");
			}

			if (!"true".equals(formdata.get("isNewUser"))) {
				/* Recuperar datos del usuario */
				String user = isEmpty(request.getParameter("usuario")) ? String.valueOf(request.getAttribute("ACTUSER"))
						: request.getParameter("usuario");
				// CUSUARI
				logger.debug("user :: " + user);
				if (user.equals("null"))
					user = getCampoTextual(request, "CUSUARI");
				logger.debug("user 2:: " + user);
				if (!isEmpty(user)) {
					Map map = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_USER__F_GET_USUARIO(user);
					logger.debug(map);
					if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
						Map OB_IAX_USUARIO = (Map) map.get("PUSUARIO");
						if (!isEmpty(OB_IAX_USUARIO)) {
							formdata.putAll(OB_IAX_USUARIO);
							// INI IAXIS-4994
							request.getSession().setAttribute("CCFGMARCA", OB_IAX_USUARIO.get("CCFGMARCA"));
							request.getSession().setAttribute("CCFGINFESP", OB_IAX_USUARIO.get("CCFGINFESP"));
							// FIN IAXIS-4994
							if (OB_IAX_USUARIO.get("SPERSON") != null) {
								actualizar_persona(request, new BigDecimal(OB_IAX_USUARIO.get("SPERSON").toString()));
							}
						}

					}
				}
			}
			// INI IAXIS-4994
			// --START-01/12/2020 FCG IAXIS-5378
			PAC_IAX_MARCAS pac_iax_marcas = new PAC_IAX_MARCAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// PAC_IAX_LISTVALORES pac_axis_listValores=new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			Map mapAREAS;
			// mapAREAS = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			// BigDecimal(8002004));
			mapAREAS = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_GET_MARCAS(CEMPRES);
			// --END-01/12/2020 FCG IAXIS-5378
			logger.debug(mapAREAS);
			Object o = tratarRETURNyMENSAJES(request, mapAREAS, false);
			request.getSession().setAttribute("LST_AREAS", tratarRETURNyMENSAJES(request, mapAREAS, false));
			// FIN IAXIS-4994

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
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
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, null, new BigDecimal(2));
			logger.debug(map);
			LSTVALORES.put("LSTAGENTES", tratarRETURNyMENSAJES(request, map, false));

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

			// F_get_lst_cfgrol
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGROL();
			logger.debug(map);
			LSTVALORES.put("LSTROL", tratarRETURNyMENSAJES(request, map, false));

			// F_get_psu_desusuagru
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_USUAGRU();
			logger.debug(map);
			LSTVALORES.put("LSTPSU", tratarRETURNyMENSAJES(request, map, false));

			/* Department */
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000946));
			logger.debug(map);
			LSTVALORES.put("LSTDEPART", tratarRETURNyMENSAJES(request, map, false));

			/* Job Title */
			map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000947));
			logger.debug(map);
			LSTVALORES.put("LSTJOBT", tratarRETURNyMENSAJES(request, map, false));

			// F_get_lst_cfginf
			map = pacIaxCfg.ejecutaPAC_IAX_CFG__F_GET_LST_CFGINF();
			logger.debug(map);
			LSTVALORES.put("LSTINF", tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LSTVALORES", LSTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_aceptar(HttpServletRequest request, Axisusu003Action thisAction) {
		logger.debug("Axisusu003Action m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CUSUARI = getCampoTextual(request, "CUSUARI");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			BigDecimal CEMPRES = usuario.getCempres();
			String TUSUNOM = getCampoTextual(request, "TUSUNOM");
			String MAIL = getCampoTextual(request, "MAIL_USU");
			String TELFUSU = getCampoTextual(request, "TELFUSU");
			BigDecimal CDELEGA = getCampoNumerico(request, "CDELEGA");
			String OLDPWD = getCampoTextual(request, "TPWD");
			String NEWPWD = getCampoTextual(request, "NEWPWD");
			String NEWPWDCNF = getCampoTextual(request, "NEWPWD_CONFIRMACION");
			String CEMPLEADO = getCampoTextual(request, "CEMPLEADO");
			String CWIZARD = getCampoTextual(request, "CCFGWIZ");
			String CFORM = getCampoTextual(request, "CCFGFORM");
			String CACCION = getCampoTextual(request, "CCFGACC");
			String CMENU = getCampoTextual(request, "CROLMEN");
			String CCONSUPL = getCampoTextual(request, "CCONSUPL");
			String CACCPROD = getCampoTextual(request, "CACCPROD");
			String CDOCUMENTACIO = getCampoTextual(request, "CCFGDOC");
			BigDecimal CAUTLOG = getCampoNumerico(request, "CAUTLOG_CHECK");
			BigDecimal CVISPUBLI = getHiddenCampoNumerico(request, "CVISPUBLI_CHECK");
			String CROL = getCampoTextual(request, "CROL");
			String CMAP = getCampoTextual(request, "CCFGMAP");
			BigDecimal CUSUAGRU = getCampoNumerico(request, "CACCPSU");
			BigDecimal LSTDEPART = getCampoNumerico(request, "LSTDEPART");
			BigDecimal LSTJOBT = getCampoNumerico(request, "LSTJOBT");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			// INI IAXIS-4994
			String AREAS = getCampoTextual(request, "CAD_AREAS");
			// INI AJUSTE IAXIS-4994
			if (!isEmpty(AREAS))
				AREAS = AREAS.substring(0, AREAS.length() - 1);
			// FIN AJUSTE IAXIS-4994
			// INI IAXIS-15078
			String INFESP = getCampoTextual(request, "CAD_INFESP");
			if (!isEmpty(INFESP))
				INFESP = INFESP.substring(0, INFESP.length() - 1);
			// FIN IAXIS-15078
			// INI SingleSignOn FCG 21/12/2020 Se agrega parametro pidREQ
			String idREQ = ConversionUtil.encriptar(NEWPWD);
			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_SET_USUARIO(CUSUARI, CIDIOMA, CEMPRES, TUSUNOM, CDELEGA, OLDPWD,
					NEWPWD, NEWPWDCNF, CEMPLEADO, CWIZARD, CFORM, CACCION, CMENU, CCONSUPL, CDOCUMENTACIO, CAUTLOG,
					CACCPROD, CMAP, CVISPUBLI, CROL, CUSUAGRU, MAIL, TELFUSU, LSTDEPART, LSTJOBT, SPERSON, AREAS, idREQ,
					INFESP);
			// INI SingleSignOn FCG 21/12/2020 Se agrega parametro pidREQ
			// FIN IAXIS-4994
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map, false))) {
				request.setAttribute("grabarOK", true);

				if (CUSUARI.equals(usuario.getCusuari())) {
					// Usuario es el usuario activo
					// Cambiar locale de la aplicaci�n
					String locale = ConversionUtil.CIDIOMA2locale(CIDIOMA);

					if (!isEmpty(locale)) {
						request.getSession().setAttribute(Constantes.LOCALE, locale);
						// Cambiar el locale e idioma del usuario
						usuario.setLocale(locale);
						usuario.setCidioma(CIDIOMA);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_borrar(HttpServletRequest request, Axisusu003Action thisAction) {
		logger.debug("Axisusu003Service m_borrar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CUSUARI = getCampoTextual(request, "CUSUARI");
			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_DEL_USUARIO(CUSUARI);
			logger.debug(map);
			BigDecimal OK = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			if (OK.intValue() == 0) {
				request.setAttribute("grabarOK", true);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo m_borrar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_activar(HttpServletRequest request, Axisusu003Action thisAction) {
		logger.debug("Axisusu003Service m_activar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CUSUARI = getCampoTextual(request, "CUSUARI");
			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_ACTIVAR_USUARIO(CUSUARI);
			logger.debug(map);

			BigDecimal OK = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

			if (OK.intValue() == 0) {
				request.setAttribute("ACTUSER", CUSUARI);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo m_activar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void actualizar_persona(HttpServletRequest request, BigDecimal sperson) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal CAGENTE = usuario.getCagente();

		try {

			if (!isEmpty(sperson)) {

				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(sperson, CAGENTE);

				logger.debug("get PERSONA()" + map);
				Map OB_PERSONA = (Map) map.get("OBPERSONA");

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				logger.debug("++++NOMBRE: " + nomComplet);

				formdata.put("NOMBRE", nomComplet);
				formdata.put("NNUMIDE", OB_PERSONA.get("NNUMIDE"));
				formdata.put("SPERSON", OB_PERSONA.get("SPERSON"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu003Service - m�todo actualizar_persona", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

		try {

			if (!isEmpty(SPERSON)) {

				String PMODE = new String("POL");
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

				logger.debug("get PERSONA()" + map);
				Map OB_PERSONA = (Map) map.get("OBPERSONA");

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				logger.debug("++++NOMBRE: " + nomComplet);

				Map mapPersona = new HashMap<String, String>();
				mapPersona.put("NOMBRE", nomComplet);
				mapPersona.put("NNUMIDE", OB_PERSONA.get("NNUMIDE"));
				mapPersona.put("SPERSON", OB_PERSONA.get("SPERSON"));

				ajax.guardarContenidoFinalAContenedorAjax(mapPersona);

			}

		} catch (Exception e) {
			logger.error("Error actualizando persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n cabecera_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			logger.debug("Axisusu003Service m_ajax_ver_agente");

		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.formattingNumericValues(request);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
