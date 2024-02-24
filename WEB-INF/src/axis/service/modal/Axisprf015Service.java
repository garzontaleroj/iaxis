package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import java.util.Date;

/**
 * h* @since Java 5.0
 */
public class Axisprf015Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisprf015Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			if (formdata.get("IDDOCGEDOX") != null && formdata.get("IDDOCGEDOX").toString().equals("null")) {
				formdata.put("IDDOCGEDOX", "");
			}

			BigDecimal psperson = AxisBaseService.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", psperson);
			BigDecimal pcagente = AxisBaseService.getCampoNumerico(request, "CAGENTE");
			formdata.put("CAGENTE", pcagente);
			BigDecimal psprofes = AxisBaseService.getCampoNumerico(request, "SPROFES");
			formdata.put("SPROFES", psprofes);
			BigDecimal piddocgedox = AxisBaseService.getCampoNumerico(request, "IDDOCGEDOX");
			logger.debug("piddocgedox:" + piddocgedox);
			PAC_IAX_LISTVALORES_SIN pac_axis_listValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_listValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCDOCUME();
			logger.debug("++++ CATEGORIAS:" + map);
			formdata.put("LSTCATEGOR", tratarRETURNyMENSAJES(request, map));

			if (!AxisBaseService.isEmpty(piddocgedox)) {
				PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_GET_DOCUMENTOS(psprofes, piddocgedox);
				logger.debug("--> docum:" + map);
				formdata.putAll((Map) map.get("POBDOCPERSONA"));
				Map POBDOCPERSONA = (Map) map.get("POBDOCPERSONA");
				formdata.put("TFILE", POBDOCPERSONA.get("FICHERO"));
				formdata.put("FCADUCIDAD", POBDOCPERSONA.get("FCADUCA"));
				formdata.put("IDDOCGEDOX", POBDOCPERSONA.get("IDDOCGEDOX"));
				formdata.put("OBSERVACIONES", POBDOCPERSONA.get("TOBSERVA"));
				formdata.put("myTDESC", POBDOCPERSONA.get("TDESCRIP"));
				formdata.put("myIDCAT", POBDOCPERSONA.get("IDDCAT"));
				formdata.put("FALTA", POBDOCPERSONA.get("FALTA"));
			} else {
				java.util.Date sysdate = new java.util.Date();
				long time = sysdate.getTime();
				Date FALTA = new Date(time);
				formdata.put("FALTA", FALTA);
			}

			String MODO = this.getCampoTextual(request, "MODO");
			formdata.put("MODO", MODO);

			if (MODO != null) {
				if (MODO.equalsIgnoreCase("modificar") || MODO.equalsIgnoreCase("actualizar")) {
					String pTDESCRI = this.getCampoTextual(request, "TDESCRI");
					formdata.put("myTDESC", pTDESCRI);
					BigDecimal pIDDOCGX = this.getCampoNumerico(request, "IDDOCGX");
					formdata.put("IDDOCGEDOX", pIDDOCGX);
					String pTTITDOC = this.getCampoTextual(request, "TTITDOC");
					formdata.put("TTITDOC", pTTITDOC);
					SimpleDateFormat formatoDelTexto = new SimpleDateFormat("yyyy-MM-dd");
					String strFecha = request.getParameter("FALTA").substring(0, 9);
					Date pFALTA = formatoDelTexto.parse(strFecha);
					formdata.put("FALTA", pFALTA);
					logger.debug("++++pFALTA: " + pFALTA);
					String pTOBSERVA = this.getCampoTextual(request, "TOBSERVA");
					formdata.put("OBSERVACIONES", pTOBSERVA);
					strFecha = request.getParameter("FCADUCA").substring(0, 9);
					Date pFCADUCA = formatoDelTexto.parse(strFecha);
					formdata.put("FCADUCIDAD", pFCADUCA);
					logger.debug("++++pFCADUCA: " + pFCADUCA);
					BigDecimal pIDCATX = this.getCampoNumerico(request, "IDCAT");
					formdata.put("myIDCAT", pIDCATX);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf015Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actualizardoc(HttpServletRequest request) {
		logger.debug("Axisprf015Service m_actualizardoc");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");
			String TDESC = getCampoTextual(request, "myTDESC");
			BigDecimal IDCAT = getCampoNumerico(request, "IDCAT");
			String TOBSERVA = getCampoTextual(request, "OBSERVACIONES");
			java.sql.Date FCADUCA = stringToSqlDate(getCampoTextual(request, "FCADUCIDAD"));
			BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
			String TFILENAME = getCampoTextual(request, "TFILE");

			PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			map = pac_iax_prof.ejecutaPAC_IAX_PROF__F_SET_DOCUMENTACION(SPROFES, SPERSON, CAGENTE, FCADUCA, TOBSERVA,
					TFILENAME, IDDOCGEDOX, TDESC, IDCAT);

			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0)))
				request.setAttribute("isUpload", "ok");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisprf015Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
