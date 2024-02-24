package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CUMULOS_CONF;
import axis.jdbc.PAC_IAX_GEDOX;
import axis.jdbc.PAC_IAX_GFI;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import java.util.Date;

/**
 * Axisfinv007Service.java 20/08/2008
 * 
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a>
 * @since Java 5.0
 */
public class Axisper030Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * MTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv007Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			if (formdata.get("IDDOCGEDOX") != null && formdata.get("IDDOCGEDOX").toString().equals("null")) {
				formdata.put("IDDOCGEDOX", "");
			}
			PAC_IAX_CUMULOS_CONF pac_iax_cumulos_conf = new PAC_IAX_CUMULOS_CONF(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug(formdata);

			BigDecimal psperson = getCampoNumerico(request, "SPERSON");
			BigDecimal pcagente = getCampoNumerico(request, "CAGENTE");
			// BigDecimal psperson=AxisBaseService.getCampoNumerico(request, "SPERSON");
			// BigDecimal pcagente=AxisBaseService.getCampoNumerico(request, "CAGENTE");
			BigDecimal piddocgedox = AxisBaseService.getCampoNumerico(request, "IDDOCGEDOX");
			logger.debug("SPERSON:" + psperson);
			logger.debug("CAGENTE" + pcagente);
			logger.debug("piddocgedox:" + piddocgedox);
			String ptablas = new String("PROD");

			PAC_IAX_GEDOX pac_iax_gedox = new PAC_IAX_GEDOX(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_GET_CATEGOR();
			logger.debug(map);
			formdata.put("LSTCATEGOR", tratarRETURNyMENSAJES(request, map));

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map2 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8000945"));
			List documents = (List) tratarRETURNyMENSAJES(request, map2);
			logger.debug(documents);

			Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8000944"));
			List estados = (List) tratarRETURNyMENSAJES(request, map3);
			logger.debug(estados);

			request.setAttribute("documents", !isEmpty(documents) ? documents : new ArrayList());
			request.setAttribute("estados", !isEmpty(estados) ? estados : new ArrayList());

			if (!AxisBaseService.isEmpty(piddocgedox)) {
				PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_DOCPERSONA(psperson, pcagente, piddocgedox,
						ptablas);
				logger.debug("--> docum:" + map);
				logger.debug("--> piddocgedox:" + piddocgedox);
				logger.debug("--> ptablas:" + ptablas);
				formdata.putAll((Map) map.get("POBDOCPERSONA"));
				Map POBDOCPERSONA = (Map) map.get("POBDOCPERSONA");
				formdata.put("TFILE", POBDOCPERSONA.get("FICHERO"));
				formdata.put("FCADUCIDAD", POBDOCPERSONA.get("FCADUCA"));
				formdata.put("IDDOCGEDOX", POBDOCPERSONA.get("IDDOCGEDOX"));
				formdata.put("OBSERVACIONES", POBDOCPERSONA.get("TOBSERVA"));
				formdata.put("myTDESC", POBDOCPERSONA.get("TDESCRIP"));
				formdata.put("myIDCAT", POBDOCPERSONA.get("IDDCAT"));
				formdata.put("FALTA", POBDOCPERSONA.get("FALTA"));
				formdata.put("myTIPDOCUMENTO", POBDOCPERSONA.get("TDOCUMENTO"));
				formdata.put("myEDODOCUMENTO", POBDOCPERSONA.get("EDOCUMENTO"));
				formdata.put("FEDO", POBDOCPERSONA.get("FEDO"));
			} else {
				java.util.Date sysdate = new java.util.Date();
				long time = sysdate.getTime();
				Date FALTA = new Date(time);
				formdata.put("FALTA", FALTA);
				Date FEDO = new Date(time);
				formdata.put("FEDO", FEDO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv007Service - mtodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actualizardoc(HttpServletRequest request) {
		logger.debug("Axisfinv007Service m_actualizardoc");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			/*
			 * PAC_IAX_GEDOX pac_iax_gedox=new
			 * PAC_IAX_GEDOX(java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			 * Map map=pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_GET_CATEGOR();
			 */

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TDESC = getCampoTextual(request, "myTDESC");

			logger.debug("SPERSON:" + SPERSON);
			logger.debug("CAGENTE" + CAGENTE);
			logger.debug("TDESC" + TDESC);

			// TODO: volver a ponerlo como es: BigDecimal IDCAT=getCampoNumerico(request,
			// "IDCAT");
			BigDecimal IDCAT = getCampoNumerico(request, "IDCAT");

			String TOBSERVA = getCampoTextual(request, "OBSERVACIONES");
			java.sql.Date FCADUCA = stringToSqlDate(getCampoTextual(request, "FCADUCIDAD"));
			BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
			String TFILENAME = getCampoTextual(request, "TFILE");

			// DF
			// TODO: Deberia ser asi?: BigDecimal TIPDOCUMENTO=getCampoNumerico(request,
			// "TIPDOCUMENTO");
			BigDecimal TIPDOCUMENTO = getCampoNumerico(request, "myTIPDOCUMENTO");
			// TODO: Deberia ser asi?: BigDecimal EDODOCUMENTO=getCampoNumerico(request,
			// "EDODOCUMENTO");
			BigDecimal EDODOCUMENTO = getCampoNumerico(request, "myEDODOCUMENTO");
			java.sql.Date FEDO = stringToSqlDate(getCampoTextual(request, "FEDO"));
			// DF

			PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			logger.debug("TFILENAME:" + TFILENAME);
			logger.debug("TOBSERVA" + TOBSERVA);
			logger.debug("FCADUCA" + FCADUCA);
			logger.debug("TOBSERVA" + TOBSERVA);
			logger.debug("FCADUCA" + FCADUCA);

			logger.debug("IDDOCGEDOX:" + IDDOCGEDOX);
			logger.debug("IDDOCGEDOX" + IDDOCGEDOX);
			logger.debug("IDCAT" + IDCAT);
			logger.debug(" TIPDOCUMENTO" + TIPDOCUMENTO);
			logger.debug("EDODOCUMENTO" + EDODOCUMENTO);
			logger.debug("FEDO" + FEDO);

			// map=pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_SET_DOCPERSONA(SPERSON,
			// CAGENTE, FCADUCA, TOBSERVA, TFILENAME, IDDOCGEDOX, TDESC, IDCAT);
			map = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_SET_DOCPERSONA(SPERSON, CAGENTE, FCADUCA, TOBSERVA,
					TFILENAME, IDDOCGEDOX, TDESC, IDCAT, TIPDOCUMENTO, EDODOCUMENTO, FEDO);

			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0)))
				request.setAttribute("isUpload", "ok");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv007Service - mtodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_f_cambiarcaducidad(HttpServletRequest request) {

		logger.debug("Axisper03Service m_ajax_f_cambiarcaducidad");
		AjaxContainerService ajax = new AjaxContainerService();
		this.formattingNumericValues(request);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.calcularcaducidad(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper03Service- mtodo ajax_f_cambiarcaducidad", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private Map calcularcaducidad(HttpServletRequest request) throws Exception {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map fec = new HashMap();
		try {

			PAC_IAX_GFI pac_iax_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map5 = null;
			BigDecimal TIPDOCUMENTO = this.getCampoNumerico(request, "documento");
			java.sql.Date FEDO = stringToSqlDate(this.getCampoTextual(request, "fedo"));

			// if(TIPDOCUMENTO!=null){
			// obteniendo el valor de caducidad segun el tipo de documento
			map5 = pac_iax_gfi.ejecutaPAC_IAX_GFI__F_TRAMO(new BigDecimal("999"), null, new BigDecimal("300000"),
					TIPDOCUMENTO);
			String caducidad = map5.get("RETURN").toString();
			int intcaducidad = Integer.parseInt(caducidad);

			if (FEDO == null) {
				java.util.Date da = new java.util.Date();
				FEDO = new java.sql.Date(da.getTime());
			}

			Calendar c = Calendar.getInstance();
			c.setTime(FEDO);
			c.add(Calendar.DATE, intcaducidad);
			java.util.Date da = c.getTime();
			FEDO = new java.sql.Date(da.getTime());

			SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
			String FCADUCAoutput = sdf.format(FEDO.getTime());

			fec.put("FECHACADUCIDAD", FCADUCAoutput);
			formdata.put("FCADUCIDAD", FCADUCAoutput);

			// }
			logger.debug("$$$$$$$$$$$$ fin PAC_IAX_GFI : " + map5);

			return fec;
		} catch (Exception e) {
			logger.error("Error en el servicioAxisper03Service - mtodo ajax_f_cambiarcaducidad", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

		return null;
	}

}
