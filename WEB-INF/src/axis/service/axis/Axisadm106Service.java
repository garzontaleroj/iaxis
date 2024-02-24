package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm106Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm106Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm106Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm106Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm106Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			AxisServiceDetValores service = new AxisServiceDetValores();

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON") != null
					? this.getCampoNumerico(request, "SPERSON")
					: null;
			BigDecimal CINTERMEDIARIO = this.getCampoNumerico(request, "CINTERMEDIARIO") != null
					? this.getCampoNumerico(request, "CINTERMEDIARIO")
					: null;

			String PMODE = new String("POL");

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			if (SPERSON != null) {
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, usuario.getCagente(), PMODE);

				logger.debug("get PERSONA()" + map);
				Map OB_PERSONA = (Map) map.get("OBPERSONA");

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				formdata.put("TOMADOR", nomComplet);
				formdata.put("NNUMIDE", OB_PERSONA.get("NNUMIDE"));
			}

			PAC_IAX_INFORMES pac_IAX_INFORMES = new PAC_IAX_INFORMES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapReturn = pac_IAX_INFORMES.ejecutaPAC_IAX_INFORMES__F_LISTA_POLIZAS_PENDIENTES(SPERSON,
					CINTERMEDIARIO);
			List<Map> listPolizas = (List) tratarRETURNyMENSAJES(request, mapReturn);

			formdata.put("LISTAPOLIZA", listPolizas);
			formdata.put("SPERSON", SPERSON);
			formdata.put("INTERMEDIARIO", CINTERMEDIARIO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm106Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ins_obs(HttpServletRequest request) {
		logger.debug("Axisadm106Service m_ins_obs");
		try {
			AjaxContainerService ajax = new AjaxContainerService();
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// INI IAXIS-4136 JRVG 23/04/2020
			String observaciones = (String) ((Map) request.getAttribute(Constantes.FORMDATA)).get("val");
			String[] obsArray = observaciones.split("\n");
			for (int i = 0; i < obsArray.length; i++) {
				String[] values = obsArray[i].split(">");
				String nrecibo = values[0].split("=")[1];
				String sseguro = "0";
				String obs = "";
				if (values[1].split("=").length > 1 && !values[2].split("=")[1].trim().isEmpty()) {
					obs = values[1].split("=")[1];
				}
				String marca = values[2].split("=")[1];

				// INI IAXIS BUG 5215 AABG - SE INSERTA UNICAMENTE LOS QUE TIENEN OBSERVACION
				if (obs != null) { // INI IAXIS-10514 JRVG 02/04/2020 SE INSERTAN TODAS LAS OBSERVACIONES
					PAC_IAX_INFORMES pac_IAX_INFORMES = new PAC_IAX_INFORMES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapReturn = pac_IAX_INFORMES.ejecutaPAC_IAX_INFORMES__F_INS_OBS_CUENTACOBRO(obs.toUpperCase(),
							new BigDecimal(sseguro), new BigDecimal(nrecibo), new BigDecimal(marca));
				}
				// INI IAXIS BUG 5215 AABG - SE INSERTA UNICAMENTE LOS QUE TIENEN OBSERVACION
				// FIN IAXIS-4136 JRVG 23/04/2020
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm106Service - mêµ¯do m_ins_obs", e);

		}
	} // tarea 4136

	public void m_descargar(HttpServletRequest request, Axisadm106Action thisAction) {
		logger.debug("Axisadm106Service m_descargar");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = new BigDecimal(24);
		String CEXPORT = "PDF";
		String CMAP = new String();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = new BigDecimal(8);
		String CINTERMEDIARIO = "";
		String CTOMADOR = getCampoTextual(request, "CTOMADOR");
		if ((getCampoTextual(request, "CINTERMEDIARIO") == null)
				|| (getCampoTextual(request, "CINTERMEDIARIO").isEmpty())) {
			CINTERMEDIARIO = "0";
		} else {
			CINTERMEDIARIO = getCampoTextual(request, "CINTERMEDIARIO");
		}

		CMAP = "Cuenta cobro";
		PARAMETROS__.put("PTOMADOR", CTOMADOR);
		TPARAMETROS__.put("TPTOMADOR", "1");
		PARAMETROS__.put("PINTERMEDIARIO", CINTERMEDIARIO);
		TPARAMETROS__.put("TPINTERMEDIARIO", "1");
		PARAMETROS__.put("PUSUARIO", usuario.getCusuari());
		TPARAMETROS__.put("TPUSUARIO", "1");

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch, null,
							new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(map);

			System.out.println(ajax.getAjaxContainer());
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m굯do m_ejecutar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);

		} finally {

			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()) == null) {
					String valorParametro = "T" + keyArray[i].toString();
					;
					String tipoParametro = null;
					paramObj = new ObIaxInfo(keyArray[i].toString(), null, tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				} else if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro) != null
							? TPARAMETROS__.get(valorParametro).toString()
							: null;
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
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

	public void m_ajax_actualizar_persona(HttpServletRequest request) {
		logger.debug("Axisadm106Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");

			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, usuario.getCagente(), PMODE);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");

			String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			formdata.put("TOMADOR", nomComplet);
			formdata.put("NNUMIDE", OB_PERSONA.get("NNUMIDE"));
			formdata.put("SPERSON", SPERSON);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm106Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}
}