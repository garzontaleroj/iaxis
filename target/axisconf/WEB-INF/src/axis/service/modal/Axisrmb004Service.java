package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
//import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REEMBOLSOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrmb004Service.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a> - Finalizar Desarrollo -
 *         Modificaci�n Funciones PL
 * @since Java 5.0
 */
public class Axisrmb004Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisrmb004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb004Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal NFACT = null;

			/* Recuperar combo tipos */
			Map map1 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOFACT();
			logger.debug(map1);
			List listaTipos = (List) tratarRETURNyMENSAJES(request, map1);
			formdata.put("listaTipos", listaTipos);
			listaTipos = null;

			/* Recuperar combo Si-no */
			Map maplsn = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(maplsn);
			List listaSiNo = (List) tratarRETURNyMENSAJES(request, maplsn);
			formdata.put("listaSiNo", listaSiNo);
			listaSiNo = null;

			/* Recuperar n�mero reembolso */
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			NFACT = getCampoNumerico(request, "NFACT");
			/* Recuperar los datos del reembolso */
			if (!isEmpty(NREEMB)) {
				// Cambia la funcion por otra que recupere la cabecera
				Map map2 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATREEMB(NREEMB);
				logger.debug(map2);
				Map OB_IAX_REEMBOLSO = (Map) tratarRETURNyMENSAJES(request, map2);
				if (OB_IAX_REEMBOLSO != null) {

					formdata.putAll(OB_IAX_REEMBOLSO);

					String ncass = isEmpty(formdata.get("NCASS_ASE")) ? null : (String) formdata.get("NCASS_ASE");
					formdata.put("NCASSREEMB_ASE", ncass);
					// formdata.remove("NCASS_ASE");

					ncass = isEmpty(formdata.get("NCASS")) ? null : (String) formdata.get("NCASS");
					formdata.put("NCASSREEMB", ncass);
					// formdata.remove("NCASS");

					BigDecimal cbanhosp = isEmpty(formdata.get("CBANHOSP")) ? null
							: (BigDecimal) formdata.get("CBANHOSP");
					formdata.put("CBANHOSP", cbanhosp);
				}
			}

			// BigDecimal IMPFACT2= this.getCampoNumerico(request,"IMPFACT");
			// Recuperamos los datos de la factura
			if (!isEmpty(NFACT) && !isEmpty(NREEMB)) {
				Map map3 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_GET_DATOS_REEMBFACT(NREEMB, NFACT);
				logger.debug(map3);
				Map OB_IAX_FACTURA = (Map) tratarRETURNyMENSAJES(request, map3);

				if (OB_IAX_FACTURA != null) {
					formdata.putAll(OB_IAX_FACTURA);
				}

				BigDecimal importe = (BigDecimal) OB_IAX_FACTURA.get("IMPFACT");
				if (!isEmpty(importe) && importe.intValue() == 0) {
					formdata.put("IMPFACT", null);
				}
				// formdata.put("IMPFACT", IMPFACT2);

			} else {
				Date FACUSE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FACUSE"));
				java.sql.Date FACUSE_2 = FACUSE == null ? fcGetFechaActual() : FACUSE;
				if (FACUSE == null) {
					formdata.put("FACUSE", FACUSE_2);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_alta_factura(HttpServletRequest request) {
		logger.debug("Axisrmb004Service m_alta_factura");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");

			BigDecimal ISMODIF = getCampoNumerico(request, "ISMODIF");

			String NFACT_CLI = getCampoTextual(request, "NFACT_CLI");
			String NCASS = getCampoTextual(request, "NCASS");
			String NCASS_ASE = getCampoTextual(request, "NCASS_ASE");
			String NFACTEXT = getCampoTextual(request, "NFACTEXT");
			// Date FACUSE = getCampoTextual(request, "FACUSE") != null ?
			// sdf.parse(getCampoTextual(request, "FACUSE")) : null;
			Date FACUSE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FACUSE"));
			java.sql.Date FACUSE_2 = FACUSE != null ? new java.sql.Date(FACUSE.getTime()) : null;

			// Date FFACTURA = getCampoTextual(request, "FFACTURA") != null ?
			// sdf.parse(getCampoTextual(request, "FFACTURA")) : null;
			Date FFACTURA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFACTURA"));
			java.sql.Date FFACTURA_2 = FFACTURA != null ? new java.sql.Date(FFACTURA.getTime()) : null;

			// Date FBAJA = getCampoTextual(request, "FBAJA") != null ?
			// sdf.parse(getCampoTextual(request, "FBAJA")) : null;
			Date FBAJA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FBAJA"));
			java.sql.Date FBAJA_2 = FBAJA != null ? new java.sql.Date(FBAJA.getTime()) : null;

			BigDecimal IMPFACT = getCampoNumerico(request, "IMPFACT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			if (CTIPO == null) {
				CTIPO = getCampoNumerico(request, "CTIPO_AUX");
				if (CTIPO == null) {
					CTIPO = new BigDecimal("0");
				}
			}
			BigDecimal NFACT = getCampoNumerico(request, "NFACT");
			BigDecimal CTRACTAT = getCampoNumerico(request, "CTRACTAT");

			/* Alta Acto */
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBFACT(NREEMB, NFACT_CLI, NCASS_ASE, NCASS, FACUSE_2,
							FFACTURA_2, IMPFACT, FBAJA_2, CTIPO, NFACT, NFACTEXT, CTRACTAT);

			/* Cerrar y recargar la p�gina - Deber�a estar en el Servicermb002 */
			BigDecimal nuevo_mapa = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (map != null && nuevo_mapa.intValue() != 1) { // Si es vacio o diferente de 1 (ha dado error)
				BigDecimal nueva_factura = (BigDecimal) (map.get("PNFACTNEW"));
				formdata.put("NFACT", nueva_factura);
				if (nueva_factura != null && nueva_factura.intValue() > 0) {
					formdata.put("ALTAC", 0);
				} else {
					formdata.put("ALTAC", 1);
				}
			}
			/* Recoger si ha ido correctamente para bloquear mensaje aceptar */

			BigDecimal CBANHOSP = getCampoNumerico(request, "CBANHOSP");
			Map map1 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_MODIFICAR_CCC(NREEMB, CBANHOSP);
			logger.debug(map1);
			tratarRETURNyMENSAJES(request, map1);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Lee los datos de la simulacion
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Date fcGetFechaActual() throws Exception {

		java.util.Date today = new java.util.Date();
		java.sql.Date FECHA_ACTUAL = new java.sql.Date(today.getTime());
		return FECHA_ACTUAL;

	}

	public void m_existe_factura(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NREEMB = getCampoNumerico(request, "PPNREEMB");
			String NFACTURA_CLI = getCampoTextual(request, "NFACTURACLI");

			BigDecimal CBANHOSP = getCampoNumerico(request, "CBANHOSP");
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_MODIFICAR_CCC(NREEMB, CBANHOSP);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			Map map1 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_EXISTE_FACTCLI(NREEMB, NFACTURA_CLI);
			logger.debug(map1);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map1)).intValue() == 0) {
				BigDecimal PNREEMBDEST = (BigDecimal) map1.get("PNREEMBDEST");

				if (isEmpty(PNREEMBDEST)) {
					m_alta_factura(request);
				} else {
					formdata.put("PNREEMBDEST", PNREEMBDEST);
					formdata.put("missatge", "1");
				}
			}
			formdata.put("IMPFACT", this.getCampoNumerico(request, "IMPFACT"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_ajax_existe_factura", e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_tras_factura(HttpServletRequest request) {
		logger.debug("Axisrmb004Service m_tras_factura");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NREEMB = getCampoNumerico(request, "PPNREEMB");

			String NFACT_CLI = getCampoTextual(request, "NFACTURACLI");

			String NCASS = getCampoTextual(request, "NCASS");
			String NCASS_ASE = getCampoTextual(request, "NCASS_ASE");
			String NFACTEXT = getCampoTextual(request, "NFACTEXT");
			Date FACUSE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FACUSE"));
			java.sql.Date FACUSE_2 = FACUSE != null ? new java.sql.Date(FACUSE.getTime()) : null;
			Date FFACTURA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFACTURA"));
			java.sql.Date FFACTURA_2 = FFACTURA != null ? new java.sql.Date(FFACTURA.getTime()) : null;
			Date FBAJA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FBAJA"));
			java.sql.Date FBAJA_2 = FBAJA != null ? new java.sql.Date(FBAJA.getTime()) : null;

			BigDecimal IMPFACT = getCampoNumerico(request, "IMPFACT");
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			if (CTIPO == null) {
				CTIPO = getCampoNumerico(request, "CTIPO_AUX");
				if (CTIPO == null) {
					CTIPO = new BigDecimal("0");
				}
			}
			BigDecimal NFACT = getCampoNumerico(request, "NFACT");
			BigDecimal CTRACTAT = getCampoNumerico(request, "CTRACTAT");

			/* Alta Acto */
			Map map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_SET_REEMBFACT(NREEMB, NFACT_CLI, NCASS_ASE, NCASS, FACUSE_2,
							FFACTURA_2, IMPFACT, FBAJA_2, CTIPO, NFACT, NFACTEXT, CTRACTAT);
			logger.debug(map);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				BigDecimal NREEMBORI = getCampoNumerico(request, "NREEMBORI");
				BigDecimal nueva_factura = (BigDecimal) (map.get("PNFACTNEW"));
				map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_REEMBOLSOS__F_TRASPASAR_FACTURA(NREEMB, nueva_factura, NFACT_CLI, NREEMBORI);
				logger.debug(map);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					formdata.put("OK", "ok");
					formdata.put("newReemb", NREEMBORI);
				}
			}

			formdata.put("IMPFACT", this.getCampoNumerico(request, "IMPFACT"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_tras_factura", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request) {
		logger.debug("Axisrmb004Service m_tras_factura");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NFACT = null;

			/* Recuperar combo tipos */
			Map map1 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTTIPOFACT();
			logger.debug(map1);
			BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
			List listaTipos = (List) tratarRETURNyMENSAJES(request, map1);
			formdata.put("listaTipos", listaTipos);
			formdata.put("CTIPOFAC", CTIPO);

			/* Recuperar combo Si-no */
			Map maplsn = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(maplsn);
			List listaSiNo = (List) tratarRETURNyMENSAJES(request, maplsn);
			formdata.put("listaSiNo", listaSiNo);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb004Service - m�todo m_tras_factura", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
