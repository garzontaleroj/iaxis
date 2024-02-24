package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axiscomi012Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axiscomi012Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axiscomi012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axiscomi012Action thisAction) {
		logger.debug("Axiscomi012Service m_init");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi012Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axiscomi012Action thisAction) {
		logger.debug("Axiscomi012Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			formdata.put("CIDIOMA_USU", usuario.getCidioma());

			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal CMODCOM = getCampoNumerico(request, "CMODCOM");
			// String FINIVIG = getCampoTextual(request, "FINIVIG");
			java.sql.Date FINIVIG = this.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			logger.debug("--> FINIVIG:" + FINIVIG);
			// SimpleDateFormat sdfAmi=new SimpleDateFormat("dd-MM-yyyy");
			// Date xDate= (Date) sdfAmi.parse(FINIVIG);

			BigDecimal NINIALT = getCampoNumerico(request, "NINIALT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NFINALT = getCampoNumerico(request, "NFINALT");
			BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
			BigDecimal ESTADO = getCampoNumerico(request, "ESTADO");
			logger.debug("--> CACTIVI:" + CACTIVI + " CGARANT:" + CGARANT + " CCOMISI:" + CCOMISI + " CMODCOM:"
					+ CMODCOM + " FINIVIG" + FINIVIG + " NINIALT:" + NINIALT + " SPRODUC:" + SPRODUC + " NFINALT:"
					+ NFINALT + " NIVEL:" + NIVEL + " ESTADO:" + ESTADO);

			formdata.put("CACTIVI", CACTIVI);
			formdata.put("CGARANT", CGARANT);
			formdata.put("CCOMISI", CCOMISI);
			formdata.put("CMODCOM", CMODCOM);
			formdata.put("FINIVIG", FINIVIG);
			formdata.put("NINIALT", NINIALT);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("NFINALT", NFINALT);
			formdata.put("NIVEL", NIVEL);
			formdata.put("CESTADO", ESTADO);

			String MODO = getCampoTextual(request, "CMODO");
			formdata.put("CMODO", MODO);

			/*
			 * Map map = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000911));
			 * logger.debug(map); HashMap desc = new HashMap(); ArrayList m =
			 * (ArrayList)map.get("RETURN"); for(int i=0;i<m.size();i++){ desc =
			 * ((HashMap)m.get(i)); desc.put("VALOR",null); }
			 */

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_COMISIONDESGLOSE(CACTIVI, CGARANT, CCOMISI, CMODCOM, FINIVIG,
							NINIALT, SPRODUC, NFINALT);

			ArrayList desc = new ArrayList();
			tratarRETURNyMENSAJES(request, map);
			desc = (ArrayList) map.get("RETURN");

			request.getSession().removeAttribute("DESGLOSES");
			request.getSession().setAttribute("DESGLOSES", desc);
			logger.debug("---> desgloses:" + desc);
			// formdata.put("LISTDESGLOSE",tratarRETURNyMENSAJES(request,map));

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi012Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_guardar_desglose_json(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		this.formattingNumericValues(request);
		try {
			HashMap miDataObject = new HashMap();
			BigDecimal catribu = getCampoNumerico(request, "CATRIBU");
			BigDecimal valor = getCampoNumerico(request, "VALOR");

			ArrayList desgloses = (ArrayList) request.getSession().getAttribute("DESGLOSES");
			logger.debug("-->desgloses:" + desgloses);
			HashMap desc = new HashMap();
			for (int i = 0; i < desgloses.size(); i++) {
				desc = (HashMap) desgloses.get(i);
				BigDecimal v = (BigDecimal) desc.get("CATRIBU");
				if (v.equals(catribu)) {
					desc.put("PCOMISI", valor);
					desgloses.set(i, desc);
				}
			}
			logger.debug("-->desgloses:" + desgloses);
			request.getSession().setAttribute("DESGLOSES", desgloses);

			// miDataObject.put("lstinforme",map.get("VTIMP"));
			// miDataObject.put("resultado",map);
			// ajax.rellenarPlAContenedorAjax(map);

			// request.setAttribute(Constantes.AJAXCONTAINER,miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axiscomi012Action thisAction) {
		logger.debug("Axiscomi012Service m_aceptar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CCOMISI = getCampoNumerico(request, "CCOMISI");
			BigDecimal CMODCOM = getCampoNumerico(request, "CMODCOM");
			java.sql.Date FINIVIG = this.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			BigDecimal NINIALT = getCampoNumerico(request, "NINIALT");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NFINALT = getCampoNumerico(request, "NFINALT");
			BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
			BigDecimal NHASTA = getCampoNumerico(request, "NHASTA");
			BigDecimal NDESDE = getCampoNumerico(request, "NDESDE");
			BigDecimal CCRITERIO = getCampoNumerico(request, "CCRITERIO");
			logger.debug("--> CACTIVI:" + CACTIVI + " CGARANT:" + CGARANT + " CCOMISI:" + CCOMISI + " CMODCOM:"
					+ CMODCOM + " FINIVIG" + FINIVIG + " NINIALT:" + NINIALT + " SPRODUC:" + SPRODUC + " NFINALT:"
					+ NFINALT + " NIVEL:" + NIVEL);

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_SET_COMISIONDESGLOSE(CACTIVI, CGARANT, CCOMISI, CMODCOM, FINIVIG,
							NINIALT, SPRODUC, NFINALT, NIVEL, CCRITERIO, NDESDE, NHASTA,
							generarT_IAX_Info(request, usuario));
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
			} else {
				formdata.put("OK", new BigDecimal(1));
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi012Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ArrayList tinfo = (ArrayList) request.getSession().getAttribute("DESGLOSES");

		int n = tinfo.size(); // numero de parametros

		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < tinfo.size(); i++) {
				HashMap xx = (HashMap) tinfo.get(i);
				// HashMap mm =(HashMap) xx.get("OB_IAX_DESCCUADROCOMISION");
				logger.debug("xx-->" + xx);
				if (!isEmpty(xx.get("PCOMISI"))) {

					paramObj = new ObIaxInfo(String.valueOf(xx.get("CATRIBU")),
							((BigDecimal) xx.get("PCOMISI")).toString(), "", new BigDecimal(1));
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

}
