package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CODIGOS;
import axis.jdbc.PAC_IAX_FONDOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro008Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro008Action thisAction) {
		logger.debug("Axispro008Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro008Service m_form");

		PAC_IAX_CODIGOS listValores = new PAC_IAX_CODIGOS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CMODINV = getCampoNumerico(request, "CMODINVH");

			if (CMODINV != null) {

				formdata.put("CMODINV", CMODINV);

				this.m_recargarFondos(request);
				this.m_recargarMODINVFONDO(request);

			}

			request.setAttribute("SPRODUCKEY", SPRODUC);
			/* Listado de perfiles */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000942));
			request.setAttribute("LST_MODABO", tratarRETURNyMENSAJES(request, map1));

			Map OB_IAX_PRODUCTO = new HashMap();
			Map mm = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
			logger.debug(mm);
			OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, mm);
			request.setAttribute("mntproducto", OB_IAX_PRODUCTO);
			request.getSession().setAttribute("mntproducto", OB_IAX_PRODUCTO);

			Map map = listValores.ejecutaPAC_IAX_CODIGOS__F_GET_IDIOMAS_ACTIVOS();

			List idiomas = (List) map.get("PCURIDIOMAS");
			formdata.put("lstIdiomas", idiomas);
			formdata.put("nIdiomas", idiomas.size());

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardar(HttpServletRequest request, Axispro008Action thisAction) {

		logger.debug("Axispro008Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_FONDOS pac_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			TIaxInfo idiomas = this.generarT_IAX_Info(request, usuario);
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");
			BigDecimal cmodinv = getCampoNumerico(request, "CMODINVH");
			formdata.put("CMODINV", cmodinv);
			TIaxInfo fondos = generarT_IAX_InfoFondos(request, usuario);

			if (idiomas != null) {
				Map mm = pac_fondos.ejecutaPAC_IAX_FONDOS__F_SET_MODELINV(sproduc, cmodinv, idiomas);
				this.tratarRETURNyMENSAJES(request, mm);
			}

			Map mm = pac_fondos.ejecutaPAC_IAX_FONDOS__F_SET_MODINVFONDOS(sproduc, cmodinv, fondos);
			if (!isEmpty(mm.get("MENSAJES"))) {
				formdata.put("guradadoOK", 1);
			} else {
				formdata.put("guradadoOK", 0);
			}

			this.tratarRETURNyMENSAJES(request, mm);

			this.m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro008Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		List keys = new ArrayList(formdata.keySet());

		ArrayList lista = new ArrayList();

		for (int i = 0; i < keys.size(); i++) {
			String key = (String) keys.get(i);
			if (key.startsWith("idioma") && !key.contains("_")) {
				Map idioma = new HashMap();
				if (formdata.get(key) != null && !formdata.get(key).equals("")) {
					idioma.put("codigo", key.substring(key.lastIndexOf("a") + 1, key.length()));
					idioma.put("literal", formdata.get(key));
					lista.add(idioma);
				}
			}

		}

		int n = lista.size(); // numero de parametros

		if (n <= 0)
			return null;
		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			int x = 0;

			for (int i = 0; i < lista.size(); i++) {
				HashMap mm = (HashMap) lista.get(i);
				String codi = (String) mm.get("codigo");
				String literal = (String) mm.get("literal");
				paramObj = new ObIaxInfo(codi, literal, "", BigDecimal.ONE);
				paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
				paramsList[x] = paramObj;
				x++;
			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}

	private TIaxInfo generarT_IAX_InfoFondos(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		List keys = new ArrayList(formdata.keySet());

		ArrayList lista = new ArrayList();

		for (int i = 0; i < keys.size(); i++) {
			String key = (String) keys.get(i);
			if (key.startsWith("ccodfon") && !key.contains("_")) {
				Map fondos = new HashMap();
				if (formdata.get("ccodfon" + key.substring(key.lastIndexOf("n") + 1, key.length())) != null) {
					fondos.put("ccodfon",
							formdata.get("ccodfon" + key.substring(key.lastIndexOf("n") + 1, key.length())));
					fondos.put("pinvers",
							formdata.get("pinvers" + key.substring(key.lastIndexOf("n") + 1, key.length())));
					fondos.put("pmaxcont",
							formdata.get("pmaxcont" + key.substring(key.lastIndexOf("n") + 1, key.length())));
					fondos.put("cmodabo",
							formdata.get("selcmodabo" + key.substring(key.lastIndexOf("n") + 1, key.length())));
					lista.add(fondos);
				}
			}

		}

		int n = lista.size(); // numero de parametros
		if (n <= 0)
			return new TIaxInfo();
		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros

		ObIaxInfo paramObj = null;
		int x = 0;
		for (int i = 0; i < lista.size(); i++) {
			HashMap mm = (HashMap) lista.get(i);
			String codi = (String) mm.get("ccodfon");
			String literal = (String) mm.get("pinvers") + "#" + (String) mm.get("pmaxcont") + "#"
					+ (String) mm.get("cmodabo");
			paramObj = new ObIaxInfo(codi, literal, "", BigDecimal.ONE);
			paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
			paramsList[x] = paramObj;
			x++;
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}

	public void m_recargarMODINVFONDO(HttpServletRequest request) {
		logger.debug("Axispro001Service datosUnitLinked_RecargarMODINVFONDO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CMODINV = getCampoNumerico(request, "CMODINV");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");
			logger.debug(CMODINV);

			PAC_IAX_FONDOS pac_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mFondos = pac_fondos.ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOS(sproduc, CMODINV);
			List lstFondos = (List) mFondos.get("PMODINVFONDO");
			formdata.put("MODINVFONDO", lstFondos);
			formdata.put("CMODINV", CMODINV);
			ajax.guardarContenidoFinalAContenedorAjax(lstFondos);

		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo datosUnitLinked_RecargarMODINVFONDO", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_recargarFondos(HttpServletRequest request) {
		logger.debug("Axispro008Service datosUnitLinked_RecargarMODINVFONDO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CMODINV = getCampoNumerico(request, "CMODINV");
			BigDecimal sproduc = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_FONDOS pac_fondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mFondos = pac_fondos.ejecutaPAC_IAX_FONDOS__F_GET_MODINVFONDOS2(sproduc, CMODINV);
			List lstFondos = (List) mFondos.get("PMODINVFONDO");
			formdata.put("MODINVFONDO2", lstFondos);
			formdata.put("MODINVFONDO2size", lstFondos.size());
			ajax.guardarContenidoFinalAContenedorAjax(lstFondos);
			formdata.put("CMODINV", CMODINV);
		} catch (Exception e) {
			logger.error("Error en el servicio axispro001Service - m�todo datosUnitLinked_RecargarMODINVFONDO", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
