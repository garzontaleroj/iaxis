//Revision:# mWrlB5xnpO2SQe/BFxHWNA== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DOC_FACTURA;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axissin071Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axissin071Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axissin071Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.m_form(request, thisAction);
	}

	public void m_form(HttpServletRequest request, Axissin071Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.m_load_data(request, thisAction);

	}

	public void m_load_data(HttpServletRequest request, Axissin071Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			String sprofes = request.getParameter("pCodiProf");
			String sperson = request.getParameter("SPERSON");
			BigDecimal codi = null;
			formdata.put("SPROFES_INI", sprofes);

			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			}

			this.cargarDatosProfesional(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin071Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatosProfesional(HttpServletRequest request, Axissin071Action thisAction, Map formdata)
			throws Exception {
		try {
			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String sprofes = request.getParameter("pCodiProf");
			BigDecimal psperson = null;
			BigDecimal codi = null;
			if (sprofes != null) {
				codi = new BigDecimal(sprofes);
			}
			Map map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_PROFESIONAL(codi);

			if (map.get("RETURN") != null) {
				Map ppsperson = (Map) map.get("OBPROFESIONAL");
				psperson = (BigDecimal) ppsperson.get("SPERSON");
			}
			formdata.put("SPERSON", psperson);

			formdata.put("OBPROFESIONAL", map.get("OBPROFESIONAL"));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (psperson != null) {
				Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(psperson);
				request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));
				if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg))) {
					List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
					if (retornAgentesVision.size() > 0) {
						HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
						BigDecimal CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
						formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
						logger.debug("++++CAGENTE: " + CAGENTE);
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin071Service.cargarPersona", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axissin071Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin071Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_ejecutar(HttpServletRequest request, Axissin071Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin071Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_cargar_factura(HttpServletRequest request, Axissin071Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin071Service - m�todo m_cargar_factura", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_anular(HttpServletRequest request) {
		PAC_IAX_DOC_FACTURA pac_iax_doc_factura = new PAC_IAX_DOC_FACTURA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin071Service - m�todo m_anular", e);
		}
	}

	public void m_descargar(HttpServletRequest request, Axissin071Action thisAction) {
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = new BigDecimal(24);
		String CEXPORT = "PDF";
		String CMAP = "reporteEquFactura";
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = new BigDecimal(8);
		String CEMAIL = null;
		String PSPERSON = getCampoTextual(request, "PSPERSON");
		String FDESDE = getCampoTextual(request, "FDESDE");
		String FHASTA = getCampoTextual(request, "FHASTA");
		PARAMETROS__.put("PSPERSON", PSPERSON);
		TPARAMETROS__.put("TPSPERSON", "1");
		PARAMETROS__.put("PIDIOMA", CIDIOMA.toString());
		TPARAMETROS__.put("TPIDIOMA", "1");
		PARAMETROS__.put("FDESDE", FDESDE);
		TPARAMETROS__.put("TFDESDE", "1");
		PARAMETROS__.put("FHASTA", FHASTA);
		TPARAMETROS__.put("TFHASTA", "1");

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, new BigDecimal(0));
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_ejecutar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
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