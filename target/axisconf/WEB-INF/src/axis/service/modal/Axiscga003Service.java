package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GEDOX;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axiscga003Service extends AxisBaseService {
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
		logger.debug("Axiscga003Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal pcagente = AxisBaseService.getCampoNumerico(request, "CAGENTE");
			BigDecimal piddocgedox = AxisBaseService.getCampoNumerico(request, "IDDOCGEDOX");
			String ptablas = new String("PROD");
			PAC_IAX_GEDOX pac_iax_gedox = new PAC_IAX_GEDOX(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapLs = null;
			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001043));
			List LS_TIPO_DOCUMENTO_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_TIPO_DOCUMENTO_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_TIPO_DOCUMENTO_CONTRAGARANTIA",
					!isEmpty(LS_TIPO_DOCUMENTO_CONTRAGARANTIA) ? LS_TIPO_DOCUMENTO_CONTRAGARANTIA : new ArrayList());
			formdata.put("LS_TIPO_DOCUMENTO_CONTRAGARANTIA", LS_TIPO_DOCUMENTO_CONTRAGARANTIA);

			formdata.put("LSTCATEGOR", tratarRETURNyMENSAJES(request, mapLs));
			if (!AxisBaseService.isEmpty(piddocgedox)) {
				logger.debug("--> docum:" + mapLs);
				// formdata.putAll((Map)map.get("POBDOCAGENTE"));
				/*
				 * Map POBDOCAGENTE = (Map)map.get("POBDOCAGENTE");
				 * formdata.put("TFILE",POBDOCAGENTE.get("FICHERO"));
				 * formdata.put("FCADUCIDAD",POBDOCAGENTE.get("FCADUCA"));
				 * formdata.put("IDDOCGEDOX",POBDOCAGENTE.get("IDDOCGEDOX"));
				 * formdata.put("OBSERVACIONES",POBDOCAGENTE.get("TOBSERVA"));
				 * formdata.put("myTDESC",POBDOCAGENTE.get("TDESCRIP"));
				 * formdata.put("myIDCAT",POBDOCAGENTE.get("IDDCAT"));
				 * formdata.put("FALTA",POBDOCAGENTE.get("FALTA"));
				 * formdata.put("TAMANO",POBDOCAGENTE.get("TAMANO"));
				 */

			} else {
				java.util.Date sysdate = new java.util.Date();
				long time = sysdate.getTime();
				Date FALTA = new Date(time);
				formdata.put("FALTA", FALTA);

				BigDecimal myIDCAT = getCampoNumerico(request, "myIDCAT");

				String TOBSERVA = getCampoTextual(request, "TOBSERVA");
				String myTDESC = getCampoTextual(request, "myTDESC");
				BigDecimal SCONTGAR = getCampoNumerico(request, "SCONTGAR");
				BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
				BigDecimal NDOCUME = getCampoNumerico(request, "NDOCUME");
				String ORIGEN = getCampoTextual(request, "ORIGEN");

				formdata.put("myIDCAT", TOBSERVA);
				formdata.put("TOBSERVA", myTDESC);
				formdata.put("SCONTGAR", SCONTGAR);
				formdata.put("NMOVIMI", NMOVIMI);
				formdata.put("SPERSON", SPERSON);
				formdata.put("CAGENTE", CAGENTE);
				formdata.put("IDDOCGEDOX", IDDOCGEDOX);
				formdata.put("NDOCUME", NDOCUME);
				formdata.put("ORIGEN", ORIGEN);

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga003Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_actualizardoc(HttpServletRequest request) {
		logger.debug("Axisage021Service m_actualizardoc");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			/*
			 * PAC_IAX_GEDOX pac_iax_gedox=new
			 * PAC_IAX_GEDOX(java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			 * Map map=pac_iax_gedox.ejecutaPAC_IAX_GEDOX__F_GET_CATEGOR();
			 */

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String TDESC = getCampoTextual(request, "myTDESC");
			BigDecimal IDCAT = getCampoNumerico(request, "IDCAT");
			String TOBSERVA = getCampoTextual(request, "OBSERVACIONES");
			java.sql.Date FCADUCA = stringToSqlDate(getCampoTextual(request, "FCADUCIDAD"));
			BigDecimal IDDOCGEDOX = getCampoNumerico(request, "IDDOCGEDOX");
			String TFILENAME = getCampoTextual(request, "TFILE");
			String TAMANO = getCampoTextual(request, "TAMANO");
			logger.debug("---> tama�o:" + TAMANO);
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;

			map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_SET_DOCAGENTE(CAGENTE, FCADUCA, TOBSERVA,
					TFILENAME, IDDOCGEDOX, TAMANO, TDESC, IDCAT);
			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0)))
				request.setAttribute("isUpload", "ok");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage021Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}
