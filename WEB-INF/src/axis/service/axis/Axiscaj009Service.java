package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_CFG;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axiscaj009Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj009Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj009Action thisAction) {
		logger.debug("Axiscaj009Service m_load_data");

		// Inicio MMS 20140820 ////////////////////////
		logger.debug("Axiscaj009Service m_form");
		logger.debug("************************* MMS ***********");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("************************* MMS *********** usuario: " + usuario);
		// Fin

		// Inicio MMS 20140820 ////////////////////////
		/*
		 * Map formdata=(Map)request.getAttribute(Constantes.FORMDATA); PAC_IAX_PROF
		 * pac_iax_prof=new
		 * PAC_IAX_PROF((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
		 */this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			formdata.put("CIDIOMA", usuario.getCidioma());
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			// this.getHiddenCampoNumerico(request, "CEMPRES");
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			// this.getHiddenCampoNumerico(request, "SPRODUC");
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			logger.debug("************************* MMS *********** CMODO:" + CMODO + "** CEMPRES:" + CEMPRES
					+ "** SPRODUC:" + SPRODUC);

			Map map = new PAC_IAX_CFG((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CFG__F_GET_INFORMES(CEMPRES, whoami(this).toUpperCase(), CMODO, SPRODUC);

			logger.debug(map);
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", usuario.getCempres());
			logger.debug("************************* MMS *********** CEMPRES:" + CEMPRES + "** map:" + map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map, false)).intValue() == 0)
				request.setAttribute("LISTADOS", map.get("PCURCONFIGSINF"));
			// formdata.put("LISTADOS", map.get("PCURCONFIGSINF"));
			request.getSession().setAttribute("LISTADOS", map.get("PCURCONFIGSINF"));
			// Fin
			this.cargarDatos(request, thisAction, formdata);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj009Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj009Action thisAction, Map formdata) throws Exception {
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			formdata.put("CUSUARI", usuario.getCusuari());
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(481));
			logger.debug(map);
			List LSTCMEDMOV = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCMEDMOV", LSTCMEDMOV);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(482));
			logger.debug(map);
			List LSTCTIPMOV = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCTIPMOV", LSTCTIPMOV);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj009Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ejecutar(HttpServletRequest request, Axiscaj009Action thisAction) {
		logger.debug("Axiscaj009Service m_ejecutar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Date FECHA = this.stringToSqlDate(this.getCampoTextual(request, "FECHA"));
			String dfecha = (new SimpleDateFormat("ddMMyyyy")).format(FECHA);
			String CLISTADO = this.getHiddenCampoTextual(request, "CLISTADO");
			String CUSUARI = this.getHiddenCampoTextual(request, "CUSUARI");

			String PPARAMS = usuario.getCidioma() + "|" + CUSUARI + "|" + dfecha;

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CLISTADO, PPARAMS);
			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR: " + map);
			if (!this.isEmpty(((String) tratarRETURNyMENSAJES(request, map)))) {
				List lstRet = new ArrayList();
				lstRet.add(map.get("RETURN"));
				formdata.put("LIST_FICHEROS", lstRet);
				// Recargar datos iniciales pantalla
				m_form(request, thisAction);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj009Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	// Bug 0032660/0190245 - 12/11/2014 - JMF
	public void m_cierre(HttpServletRequest request, Axiscaj009Action thisAction) {
		logger.debug("Axiscaj009Service m_cierre");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		// this.formattingNumericValues(request);
		// HashMap formdata=(HashMap)request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// 33886
			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_MOVTOCAJA(null, new BigDecimal(3), null, null, null, null,
					new BigDecimal(0), null, null, null, null, null, null, new BigDecimal(0), new BigDecimal(0), null,
					null, new BigDecimal(0), new BigDecimal(0));

			logger.debug("++++map ejecutaPAC_IAX_CAJA__F_INS_MOVTOCAJA " + map);

			if (!this.isEmpty(((BigDecimal) tratarRETURNyMENSAJES(request, map)))) {
				// List lstRet=new ArrayList();
				// lstRet.add(map.get("RETURN"));
				logger.debug("++++map2 ejecutaPAC_IAX_CAJA__F_INS_MOVTOCAJA " + map);
			}
			this.m_ejecutar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj009Service - m�todo m_cierre", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
