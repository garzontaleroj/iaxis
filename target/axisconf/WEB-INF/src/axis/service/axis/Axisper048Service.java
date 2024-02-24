package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_MIGRACION;
import axis.jdbc.PAC_IAX_TRAMITADORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisper048Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisper048Service.java
 * 
 * @since Java 5.0
 */
public class Axisper048Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper048Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String CTRAMIT = getCampoTextual(request, "CTRAMITBUS");
			if (isEmpty(CTRAMIT)) {
				CTRAMIT = (String) formdata.get("CTRAMITBUS");
			}
			logger.debug("----> CTRAMIT" + CTRAMIT);

			if (!isEmpty(CTRAMIT)) {
				Map m = new PAC_IAX_TRAMITADORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_TRAMITADORES__F_GET_TRAMITADOR(CTRAMIT);

				logger.debug("--> tramitador:" + m);
				tratarRETURNyMENSAJES(request, m);
				formdata.put("TRAMITAORI", m.get("PTTRAMITAD"));

			}

			cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper048Service - método m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_consultar(HttpServletRequest request) {
		logger.debug("Axisper048Service m_consultar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			String PNPOLIZA = null;// getCampoTextual(request,"CNPOLIZA");
			String PCSUCURSAL = "-1";// getCampoTextual(request,"CSUCURSAL");
			String PNNUMIDE = getCampoTextual(request, "CNNUMIDE");
			String PNSINIES = null;// getCampoTextual(request,"CNSINIES");
			/*
			 * if (!PCSUCURSAL.equals("-1")) { PCSUCURSAL = PCSUCURSAL.substring(2,5); }
			 */

			logger.debug("Parametros para consulta a Osiris PNPOLIZA= " + PNPOLIZA + " CSUCURSAL= " + PCSUCURSAL
					+ " PNNUMIDE= " + PNNUMIDE + " PNSINIES= " + PNSINIES);

			Map mc = new PAC_IAX_MIGRACION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MIGRACION_F_CONSULTA(PNPOLIZA, new BigDecimal(PCSUCURSAL), PNNUMIDE, PNSINIES);

			logger.debug("--> Retorno de la consulta para Osiris:" + mc);
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, mc);

			logger.debug("--> Retur Osiris:" + pRETURN);
			formdata.put("OK", pRETURN);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper048Service - m_consultar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisper048Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal nRet = new BigDecimal("0");
			String PNPOLIZA = null;// getCampoTextual(request,"CNPOLIZA");
			String PCSUCURSAL = "-1";// getCampoTextual(request,"CSUCURSAL");
			String PNNUMIDE = getCampoTextual(request, "CNNUMIDE");
			String PNSINIES = null;// getCampoTextual(request,"CNSINIES");
			/*
			 * if (!PCSUCURSAL.equals("-1")) { PCSUCURSAL = PCSUCURSAL.substring(2,5); }
			 */

			if (PNPOLIZA != null && !PCSUCURSAL.equals("-1")) {
				PNNUMIDE = null;
				PNSINIES = null;
			} else if (PNNUMIDE != null) {
				PNPOLIZA = null;
				PCSUCURSAL = "-1";
				PNSINIES = null;
			} else if (PNSINIES != null) {
				PNPOLIZA = null;
				PCSUCURSAL = "-1";
				PNNUMIDE = null;
			}

			logger.debug("Parametros para migracion a Iaxis PNPOLIZA= " + PNPOLIZA + " CSUCURSAL= " + PCSUCURSAL
					+ " PNNUMIDE= " + PNNUMIDE + " PNSINIES= " + PNSINIES);

			Map mc = new PAC_IAX_MIGRACION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MIGRACION_UNI_F_MIGRA(PNPOLIZA, new BigDecimal(PCSUCURSAL), PNNUMIDE, PNSINIES);

			logger.debug("--> Retorno de la migracion para Iaxis:" + mc);
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, mc);
			String pRetorno = (String) mc.get("RESULTADO");// 7782-79
			/*
			 * 7782-78 SE AJUSTA PARA QUE MUESTRE MENSAJES DE ERROR CORRECTAMENTE POR
			 * PANTALLA
			 */
			logger.debug("--> Retur Osiris:" + pRETURN);
			if (!pRETURN.equals(nRet)) {
				formdata.put("OK", pRETURN);
				formdata.put("RES", pRetorno);// 7782-83 para saber que release esta ejecutando el usuario
			} else {
				formdata.put("OK", 0);
				if (PNPOLIZA != null && !PCSUCURSAL.equals("-1")) {
					formdata.put("SEGURO", pRetorno);
					formdata.put("TERCERO", "0");
					formdata.put("SINIESTRO", "0");
				} else if (PNNUMIDE != null) {
					formdata.put("SEGURO", "0");
					formdata.put("TERCERO", pRetorno);
					formdata.put("SINIESTRO", "0");
				} else if (PNSINIES != null) {
					formdata.put("SEGURO", "0");
					formdata.put("TERCERO", "0");
					formdata.put("SINIESTRO", pRetorno);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper048Service - método m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();

		Map mSuc = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2), null, null);
		// Map mSuc = new
		// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPOS(new
		// BigDecimal(2), null, null);
		List sucursales = (List) tratarRETURNyMENSAJES(request, mSuc, false);
		request.getSession().setAttribute("sucursales", sucursales);

	}

	/**
	 * Método que llama a la función pl correspondiente para cargar los motivos
	 * (según la causa seleccionada) de una póliza seleccionada.
	 * 
	 * @param usuario
	 * @param pcempres
	 * @param pctramitpad
	 * @return
	 * @throws Exception
	 */
	private

			Map dbGectramitadIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES,
					String CTRAMITPAD) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(CCEMPRES, CTRAMITPAD);
		logger.debug("TRAMITADOR INI axissin016---------------------------------------->" + m);
		return m;
	}

	public void m_volver(HttpServletRequest request, Axisper048Action thisAction) {
		logger.debug("Axisper048Service m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			Map formdata_axisper048 = (Map) thisAction.removeTopPila(request, "formdata_axisper048");
			logger.debug("------> recuperamos formada:" + formdata_axisper048);
			if (!isEmpty(formdata_axisper048)) {
				formdata.putAll(formdata_axisper048);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper048Service - método m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
