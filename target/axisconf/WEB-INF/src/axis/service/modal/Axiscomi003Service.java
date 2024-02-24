package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi003Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axiscomi003Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axiscomi003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscomi003Action thisAction) {
		logger.debug("Axiscomi003Service m_init");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal PCCOMISI = getCampoNumerico(request, "CCOMISI");
			Date PFINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date PFFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_CUADROCOMISION(PCCOMISI, PFINIVIG, PFFINVIG);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				if (!isEmpty(map.get("PCUADROCOMISION"))) {
					if (!isEmpty(((HashMap) map.get("PCUADROCOMISION")).get("DESCRIPCIONES")))
						request.getSession().setAttribute("descripciones",
								(ArrayList<HashMap>) ((HashMap) map.get("PCUADROCOMISION")).get("DESCRIPCIONES"));

					formdata.putAll((HashMap) map.get("PCUADROCOMISION"));

					logger.debug(map.get("PCUADROCOMISION"));
					logger.debug(((HashMap) map.get("PCUADROCOMISION")).get("CESTADO"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi003Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axiscomi003Action thisAction) {
		logger.debug("Axiscomi003Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			formdata.put("CIDIOMA_USU", usuario.getCidioma());

			String MODO = getCampoTextual(request, "CMODO");
			formdata.put("CMODO", MODO);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1015));
			formdata.put("TIPO", tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(1016));
			formdata.put("ESTADO", tratarRETURNyMENSAJES(request, map));

			/*
			 * BigDecimal PCCOMISI = getCampoNumerico(request,"CCOMISI");
			 * 
			 * map = new
			 * PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_GET_OBJ_CUADROCOMISION(PCCOMISI);
			 * 
			 * logger.debug("---> cuadro:"+map); Map cuadro =
			 * (Map)map.get("PCUADROCOMISION");
			 * 
			 * if( !isEmpty(cuadro)){ if(MODO.equals(new String("NVIGEN"))){
			 * formdata.put("DESCRIPCIONES",cuadro.get("DESCRIPCIONES"));
			 * formdata.put("CTIPO",cuadro.get("CTIPO"));
			 * formdata.put("CESTADO",cuadro.get("CESTADO"));
			 * formdata.put("CCOMISI",cuadro.get("CCOMISI")); } else
			 * formdata.putAll(cuadro); }
			 * 
			 * tratarRETURNyMENSAJES(request,map);
			 */
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ajax_guardar_lista(HttpServletRequest request, Axiscomi003Action thisAction) {
		logger.debug("Axiscomi003Service m_ajax_guardar_lista");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// HashMap map= new HashMap();
		Map ajaxcontainer = new HashMap();
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			String TCOMISI = getCampoTextual(request, "TCOMISI");

			// Map map = new
			// PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_SET_OBJ_DESCCUADRO(CIDIOMA,CCOMISI,TCOMISI);

			if (!isEmpty(request.getSession().getAttribute("descripciones"))) {

				for (HashMap descripcion : (ArrayList<HashMap>) request.getSession().getAttribute("descripciones")) {

					HashMap desc = (HashMap) descripcion.get("OB_IAX_DESCCUADROCOMISION");
					BigDecimal CIDIOMAx = (BigDecimal) desc.get("CIDIOMA");

					if (CIDIOMAx.intValue() == CIDIOMA.intValue()) {
						desc.put("TCOMISI", TCOMISI);
						desc.put("CCOMISI", CCOMISI);
					}
				}
			}

			/*
			 * if (!isEmpty (map.get ("MENSAJES"))){
			 * 
			 * List MENSAJES = (List)map.get ("MENSAJES");
			 * 
			 * HashMap mensaje=(HashMap)MENSAJES.get(0); HashMap
			 * OB_IAX_MENSAJES=(HashMap)mensaje.get("OB_IAX_MENSAJES"); BigDecimal
			 * TIPERROR=(BigDecimal)OB_IAX_MENSAJES.get("TIPERROR"); BigDecimal
			 * CERROR=(BigDecimal)OB_IAX_MENSAJES.get("CERROR"); String
			 * TERROR=(String)OB_IAX_MENSAJES.get("TERROR");
			 * 
			 * ajaxcontainer.put("ERROR","1"); ajaxcontainer.put("smserror", TERROR);
			 * 
			 * } else{
			 */

			ajaxcontainer.put("ERROR", "0");
			ajaxcontainer.put("smserror", "");
			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi003Service - m�todo m_ajax_guardar_lista", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_aceptar(HttpServletRequest request, Axiscomi003Action thisAction) {
		logger.debug("Axiscomi003Service m_aceptar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PCCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal PCTIPO = isEmpty(getCampoNumerico(request, "CTIPO")) ? getCampoNumerico(request, "TIPO")
					: getCampoNumerico(request, "CTIPO");
			BigDecimal PCESTADO = isEmpty(getCampoNumerico(request, "CESTADO")) ? getCampoNumerico(request, "ESTADO")
					: getCampoNumerico(request, "CESTADO");
			String PMODO = getCampoTextual(request, "CMODO");
			Date PFINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date PFFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG"));

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_SET_CUADROCOMISION(PCCOMISI, PCTIPO, PCESTADO, PFINIVIG, PFFINVIG,
							generarT_IAX_Info(request, usuario), PMODO);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
			} else {
				formdata.put("OK", new BigDecimal(1));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi003Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ArrayList tinfo = (ArrayList) request.getSession().getAttribute("descripciones");

		int n = tinfo.size(); // numero de parametros

		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < tinfo.size(); i++) {
				HashMap xx = (HashMap) tinfo.get(i);
				HashMap mm = (HashMap) xx.get("OB_IAX_DESCCUADROCOMISION");
				logger.debug("mm-->" + mm);
				if (!isEmpty(mm.get("TCOMISI"))) {

					paramObj = new ObIaxInfo(String.valueOf(mm.get("CIDIOMA")), (String) mm.get("TCOMISI"), "",
							new BigDecimal(1));
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}
			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}

	public void m_actccomisi(HttpServletRequest request, Axiscomi003Action thisAction) {
		logger.debug("Axiscomi003Service m_actccomisi");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PCCOMISI = getCampoNumerico(request, "CCOMISI");

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_ACT_CCOMISI(PCCOMISI);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 1) {
				request.removeAttribute("CCOMISI");
				formdata.put("CCOMISI", "");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi003Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

}
