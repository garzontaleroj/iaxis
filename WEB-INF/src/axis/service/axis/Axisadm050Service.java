package axis.service.axis;

import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm050Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm050Service.java 02/03/2010
 * 
 * @since Java 5.0
 */
public class Axisadm050Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm050Action thisAction) {
		logger.debug("Axisadm050Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			// this.formattingNumericValues(request);
			this.m_buscarRebut(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm050Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axisadm050Action thisAction) {
		logger.debug("Axisadm050Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {

			BigDecimal NRECIBO_ORIGEN = getCampoNumerico(request, "NRECIBO_ORIGEN");
			BigDecimal NRECIBO_DESTINO = getCampoNumerico(request, "NRECIBO_DESTINO");
			BigDecimal TRANSF_ORIGEN = getCampoNumerico(request, "TRANSF_ORIGEN");
			String TDESCRIP = getCampoTextual(request, "TDESCRIP");

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_TRANSFERIR(NRECIBO_ORIGEN, NRECIBO_DESTINO,
					TRANSF_ORIGEN, TDESCRIP);
			// ejecutaPAC_IAX_GESTION_REC__F_TRANSFERIR(NRECIBO_ORIGEN,NRECIBO_DESTINO,TRANSF_ORIGEN);
			logger.debug(map);
			// this.formattingNumericValues(request);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0)
				request.removeAttribute("MODI");
			else
				request.setAttribute("MODI", "1");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm050Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscarRebut(HttpServletRequest request, Axisadm050Action thisAction) {
		logger.debug("Axisadm050Service m_buscarRebut");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRECIBO_ORIGEN = getCampoNumerico(request, "NRECIBO_ORIGEN");
			BigDecimal NRECIBO_DESTINO = getCampoNumerico(request, "NRECIBO_DESTINO");
			BigDecimal TRANSF_ORIGEN = getCampoNumerico(request, "TRANSF_ORIGEN");
			String modificacio_import = getCampoTextual(request, "MODI");

			if (!isEmpty(NRECIBO_ORIGEN)) {
				Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO_ORIGEN, new BigDecimal(0));
				logger.debug(map);
				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(OB_IAX_RECIBOS)) {
					// Formateo CBANCAR
					BigDecimal CTIPBAN = (BigDecimal) OB_IAX_RECIBOS.get("CTIPBAN");
					String CBANCAR = (String) OB_IAX_RECIBOS.get("CBANCAR");
					logger.debug("CTIPBAN" + CTIPBAN);
					logger.debug("CBANCAR" + CBANCAR);
					if (!isEmpty(CBANCAR) && !isEmpty(CTIPBAN)) {
						map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR);
						logger.debug(map);
						if (!"".equals(tratarRETURNyMENSAJES(request, map)))
							OB_IAX_RECIBOS.put("CBANCAR", map.get("RETURN"));
					}
					formdata.put("OB_IAX_RECIBOS_ORIGEN", OB_IAX_RECIBOS);
					if (!isEmpty(OB_IAX_RECIBOS.get("SSEGURO"))) {
						PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						map = pac_iax_produccion
								.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA((BigDecimal) OB_IAX_RECIBOS.get("SSEGURO"));
						logger.debug(map);
						Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_GENPOLIZA_ORIGEN", OB_IAX_GENPOLIZA);
					}

					map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_SALDO_INICIAL(NRECIBO_ORIGEN);
					logger.debug(map);
					if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).intValue() == 0) {
						BigDecimal PISALDO = (BigDecimal) map.get("PISALDO");
						formdata.put("PISALDO_ORIGEN", PISALDO);
						if (isEmpty(modificacio_import) && !isEmpty(PISALDO)) {
							float isaldo = PISALDO.floatValue();
							BigDecimal import_rebut = new BigDecimal(String.valueOf(OB_IAX_RECIBOS.get("IMPORTE")));
							formdata.put("TRANSF_ORIGEN",
									isaldo - import_rebut.floatValue() < 0 ? 0 : isaldo - import_rebut.floatValue());
						} else {
							if (this.isEmpty(this.getCampoNumerico(request, "TRANSF_ORIGEN")))
								formdata.put("TRANSF_ORIGEN", new Float(0));
						}
					}

				}
			}

			if (!isEmpty(NRECIBO_DESTINO)) {
				Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO_DESTINO, new BigDecimal(0));
				logger.debug(map);
				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(OB_IAX_RECIBOS)) {
					// Formateo CBANCAR
					BigDecimal CTIPBAN = (BigDecimal) OB_IAX_RECIBOS.get("CTIPBAN");
					String CBANCAR = (String) OB_IAX_RECIBOS.get("CBANCAR");

					if (!isEmpty(CBANCAR) && !isEmpty(CTIPBAN)) {
						map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_COMMON__F_FORMATCCC(CTIPBAN, CBANCAR);
						logger.debug(map);
						if (!"".equals(tratarRETURNyMENSAJES(request, map)))
							OB_IAX_RECIBOS.put("CBANCAR", map.get("RETURN"));
					}
					formdata.put("OB_IAX_RECIBOS_DESTINO", OB_IAX_RECIBOS);
					if (!isEmpty(OB_IAX_RECIBOS.get("SSEGURO"))) {
						PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						map = pac_iax_produccion
								.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA((BigDecimal) OB_IAX_RECIBOS.get("SSEGURO"));
						logger.debug(map);
						Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map);
						formdata.put("OB_IAX_GENPOLIZA_DESTINO", OB_IAX_GENPOLIZA);
						// logger.debug(ConversionUtil.printAsXML(OB_IAX_GENPOLIZA,
						// "OB_IAX_GENPOLIZA"));
					}

				}
				map = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_GET_SALDO_INICIAL(NRECIBO_DESTINO);
				logger.debug(map);
				if (((BigDecimal) (tratarRETURNyMENSAJES(request, map))).intValue() == 0) {
					BigDecimal PISALDO = (BigDecimal) map.get("PISALDO");
					formdata.put("PISALDO_DESTINO", PISALDO);

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm050Service - m�todo m_buscarRebut", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public static void formattingNumericValues(HttpServletRequest request) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Enumeration enumera = request.getParameterNames();
		while (enumera.hasMoreElements()) {
			String fieldName = (String) enumera.nextElement();
			String[] todos_valores = request.getParameterValues(fieldName);
			for (int i = 0; i < todos_valores.length; i++) {
				String fieldValue = todos_valores[i];
				if (fieldValue.indexOf(".") >= 0 || fieldValue.indexOf(",") >= 0) {
					if (!isEmpty(getCampoFormateado(request, fieldValue))) {
						if (i == 0)
							formdata.put(fieldName, getCampoFormateado(request, fieldValue));
						else
							formdata.put(fieldName + "__" + i, getCampoFormateado(request, fieldValue));
					}
				}
			}
		}
	}

	public static BigDecimal getCampoFormateado(HttpServletRequest request, String field) {
		String localeNumerico = ((isEmpty(request.getSession().getAttribute(Constantes.LOCALENUMERICO))) ? "EUR"
				: (String) request.getSession().getAttribute(Constantes.LOCALENUMERICO));
		try {
			field = field.trim();
			field = ((localeNumerico.equals("EUR")) ? StringUtils.replace(field, ".", "")
					: StringUtils.replace(field, ",", ""));
			field = ((localeNumerico.equals("EUR")) ? StringUtils.replace(field, ",", ".")
					: StringUtils.replace(field, ".", "."));
			return new BigDecimal(field);
		} catch (NumberFormatException e) {
			return null;
		}
	}

}