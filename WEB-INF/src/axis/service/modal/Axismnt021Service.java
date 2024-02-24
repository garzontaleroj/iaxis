//Revision:# VXXYn8DWVfIsZWYELdsVtw== #
package axis.service.modal;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_COMPANIAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axismnt021Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * NOMBRE: Axismnt021Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Autor creaci�n</a> Fecha:
 *         DD/MM/YYYY PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 DD/MM/YYYY
 *         XXX(iniciales) 1. Creaci�n del Service. Bug.9296
 */
public class Axismnt021Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axismnt021Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	public void m_dbGetCalifi(HttpServletRequest request, Axismnt021Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SPERSON = (this.getCampoNumerico(request, "SPERSON"));
		BigDecimal CENTICALIFI = ((isEmpty(this.getCampoNumerico(request, "CENTICALIFI")))
				? (BigDecimal) request.getAttribute("CENTICALIFI")
				: this.getCampoNumerico(request, "CENTICALIFI"));
		try {
			List mc;

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axismnt021Action thisAction) {
		logger.debug("Axismnt021Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPERSON = (this.getCampoNumerico(request, "SPERSON"));
			BigDecimal CENTICALIFI = ((isEmpty(this.getCampoNumerico(request, "CENTICALIFI")))
					? (BigDecimal) request.getAttribute("CENTICALIFI")
					: this.getCampoNumerico(request, "CENTICALIFI"));
			String PROCESO = isEmpty(request.getAttribute("PROCESO")) ? this.getCampoTextual(request, "PROCESO")
					: (String) request.getAttribute("PROCESO");
			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = new HashMap();
			List mc;

			map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF(SPERSON, CENTICALIFI);
			logger.debug(map);
			if (!isEmpty(map.get("RETURN"))) {
				mc = (List) tratarRETURNyMENSAJES(request, map);
				formdata.put("LSTCALIFICA", mc);
				logger.debug(mc);
			}

			if (PROCESO.equals("nuevo")) {
				map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIA(null, SPERSON, null);
				logger.debug(map);
				// CENTICALIFI=new BigDecimal(-1);
				if (!isEmpty(map.get("RETURN"))) {
					HashMap m2 = (HashMap) tratarRETURNyMENSAJES(request, map, false);
					if (m2.get("CCOMPANI") != null) {
						formdata.putAll(m2);
						logger.debug(m2);
						formdata.put("FEFECTO", new Date());
					} else {
						m_alta_empresa(request, thisAction);
					}
				}
			} else {
				map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF(SPERSON, CENTICALIFI);
				logger.debug(map);
				if (!isEmpty(map.get("RETURN"))) {
					List m2 = (List) tratarRETURNyMENSAJES(request, map, false);
					formdata.putAll(((Map) m2.get(0)));
					logger.debug(m2);
				}
			}

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800101));
			logger.debug(map);
			formdata.put("LSTCENTICALIFI", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800100));
			logger.debug(map);
			formdata.put("LSTCCALIFI", tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001034));
			logger.debug(map);
			formdata.put("LSTESTCALIFI", tratarRETURNyMENSAJES(request, map, false));

			/*
			 * map=pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS_CALIF((
			 * BigDecimal)formdata.get("SPERSON"), CENTICALIFI);
			 * logger.debug("LSTCALIFICA: "+map); formdata.put("LSTCALIFICA",
			 * tratarRETURNyMENSAJES(request, map, false));
			 */
			formdata.put("CENTICALIFI", CENTICALIFI);

			request.setAttribute("PROCESO", PROCESO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axismnt021Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("OK", 0);
			BigDecimal SPERSON = (this.getCampoNumerico(request, "SPERSON"));
			BigDecimal CCOMPANI = (isEmpty(this.getCampoNumerico(request, "CCOMPANI")))
					? this.getCampoNumerico(request, "CCOMPANI_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CENTICALIFI = (isEmpty(this.getCampoNumerico(request, "CENTICALIFI")))
					? this.getCampoNumerico(request, "CENTICALIFI_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CENTICALIFI");
			BigDecimal CCALIFI = (this.getCampoNumerico(request, "CCALIFI"));
			BigDecimal PRECARGO = (this.getCampoNumerico(request, "PRECARGO"));
			java.sql.Date FEFECTO = this.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));
			BigDecimal CESTADOCALIFI = (isEmpty(this.getCampoNumerico(request, "CESTADOCALIFI")))
					? this.getCampoNumerico(request, "CESTADOCALIFI_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CESTADOCALIFI");
			java.sql.Date FINSCRIP = this.stringToSqlDate(this.getCampoTextual(request, "FINSCRIP"));
			java.sql.Date ANYOACTUALIZ = this.stringToSqlDate(this.getCampoTextual(request, "ANYOACTUALIZ"));
			String OFC_REPRES = (this.getCampoTextual(request, "OFC_REPRES"));

			formdata.put("CENTICALIFI", CENTICALIFI);
			formdata.put("CESTADOCALIFI", CESTADOCALIFI);
			Map map = new HashMap();
			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_SET_COMPANIA_CALIF(SPERSON, CENTICALIFI, CCOMPANI,
					CCALIFI, PRECARGO, FEFECTO, OFC_REPRES, CESTADOCALIFI, FINSCRIP, ANYOACTUALIZ);
			logger.debug(map);
			BigDecimal ret = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 1);
				request.setAttribute("PROCESO", "editar");
				thisAction.guardarMensaje(request, "180121", new Object[] { "" }, Constantes.MENSAJE_INFO);
			}
			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_nuevo(HttpServletRequest request, Axismnt021Action thisAction) {
		logger.debug("Axismnt021Service m_nuevo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			m_guardar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_nuevo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_editar(HttpServletRequest request, Axismnt021Action thisAction) {
		logger.debug("Axismnt021Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			m_guardar(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_editar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_eliminar(HttpServletRequest request, Axismnt021Action thisAction) {
		logger.debug("Axismnt021Service m_eliminar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			formdata.put("OK", 0);
			BigDecimal SPERSON = (this.getCampoNumerico(request, "SPERSON"));
			BigDecimal CENTICALIFI = (isEmpty(this.getCampoNumerico(request, "CENTICALIFI")))
					? this.getCampoNumerico(request, "CENTICALIFI_MODIFVISIBLE")
					: this.getCampoNumerico(request, "CENTICALIFI");
			java.sql.Date FEFECTO = this.stringToSqlDate(this.getCampoTextual(request, "FEFECTO"));
			request.setAttribute("PROCESO", "eliminar");
			Map map = new HashMap();
			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_DEL_COMPANIA_CALIF(SPERSON, CENTICALIFI, FEFECTO);
			logger.debug(map);
			BigDecimal ret = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 1);
				thisAction.guardarMensaje(request, "180121", new Object[] { "" }, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_eliminar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_alta_empresa(HttpServletRequest request, Axismnt021Action thisAction) {

		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axismnt021Service m_alta_empresa");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_COMPANIAS pac_axis_companias = new PAC_IAX_COMPANIAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			String TCOMPANI = this.getCampoTextual(request, "TCOMPANI");
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPIVA = this.getCampoNumerico(request, "CTIPIVA");
			java.sql.Date FBAJA = stringToSqlDate(this.getCampoTextual(request, "FBAJA"));
			BigDecimal CAFILI = this.getCampoNumerico(request, "CAFILI");
			BigDecimal CENTICALIFI = this.getCampoNumerico(request, "CENTICALIFI");
			BigDecimal CCALIFI = this.getCampoNumerico(request, "CCALIFI");
			BigDecimal NANYCALIF = this.getCampoNumerico(request, "NANYCALIF");
			String CDIAN = this.getCampoTextual(request, "CDIAN");
			String CCASAMAT = this.getCampoTextual(request, "CCASAMAT");
			String CSUPERFINAN = this.getCampoTextual(request, "CSUPERFINAN");
			BigDecimal CTIPCOM = this.getCampoNumerico(request, "CTIPCOM");
			BigDecimal NPATRIMONIO = this.getCampoNumerico(request, "NPATRIMONIO");
			BigDecimal PIMPINT = this.getCampoNumerico(request, "PIMPINT");
			java.sql.Date FFALTA = stringToSqlDate(this.getCampoTextual(request, "FFALTA"));

			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			String CCOMISI = this.getCampoTextual(request, "CCOMISI");
			String CUNESPA = this.getCampoTextual(request, "CUNESPA");
			BigDecimal CCONTABLE = this.getCampoNumerico(request, "CCONTABLE");
			BigDecimal CTRAMTAX = this.getCampoNumerico(request, "CTRAMTAX");

			Map map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_SET_COMPANIA(SPERSON, CCOMPANI, TCOMPANI, CPAIS,
					CTIPIVA, CCOMISI, CUNESPA, FFALTA, FBAJA, CCONTABLE, CTIPCOM, CAFILI, CCASAMAT, CSUPERFINAN, CDIAN,
					CCALIFI, CENTICALIFI, NANYCALIF, NPATRIMONIO, PIMPINT, CTRAMTAX, null, null, null, null, null);

			logger.debug(map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				logger.debug("guardardo");
				if (isEmpty(CCOMPANI)) {
					logger.debug("NUEVA COMPA�IA" + map.get("PCCOMPANI_NEW"));
					CCOMPANI = (BigDecimal) map.get("PCCOMPANI_NEW");
					formdata.put("CCOMPANI", CCOMPANI);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt021Service - m�todo m_alta_empresa", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
