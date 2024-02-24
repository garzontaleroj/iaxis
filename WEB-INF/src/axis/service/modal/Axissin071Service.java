//Revision:# 1T4NeJeWl0V03qcTIDgbfA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.modal.Axissin071Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin071Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axissin071Action thisAction) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Limpia la antigua lista de personas de sesi�n, en caso que hubiera, para
	 * poder realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axissin071Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal NCITACION = getCampoNumerico(request, "NCITACION");
			String ISNEW = getCampoTextual(request, "isNew");

			// AB CONSULTA DE DATOS BUG-
			BigDecimal CMODO = getCampoNumerico(request, "MODO");
			formdata.put("CMODO", CMODO);
			formdata.put("NSINIES", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);
			formdata.put("ISNEW", ISNEW);

			if (ISNEW.equals("yes")) {
				personaDefecto(NSINIES, NTRAMIT, request);
			} else if (ISNEW.equals("no")) {
				recuperarCitacion(NSINIES, NTRAMIT, NCITACION, request);
			}

			this.cargarListas(request);

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void personaDefecto(String nsinies, BigDecimal ntramit, HttpServletRequest request) throws Exception {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_ASISTE_CITACION_DEF(nsinies, ntramit);
		List RETURN = (List) tratarRETURNyMENSAJES(request, map, false);

		if (RETURN != null) {
			Map OB_RETURN = (Map) RETURN.get(0);

			String nomComplet = !isEmpty(OB_RETURN.get("TNOMBRE")) ? (String) OB_RETURN.get("TNOMBRE") + " " : " ";
			nomComplet += !isEmpty(OB_RETURN.get("TAPELLI1")) ? (String) OB_RETURN.get("TAPELLI1") + " " : " ";
			nomComplet += !isEmpty(OB_RETURN.get("TAPELLI2")) ? (String) OB_RETURN.get("TAPELLI2") + " " : " ";

			formdata.put("NOMBRE", nomComplet);

			formdata.put("NNUMIDE", OB_RETURN.get("NNUMIDE"));

			formdata.put("SPERSON", OB_RETURN.get("SPERSON"));
		}

	}

	private void recuperarCitacion(String nsinies, BigDecimal ntramit, BigDecimal ncitacion, HttpServletRequest request)
			throws Exception {

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_CITACION(nsinies, ntramit, ncitacion);
		Map OB_RETURN = (Map) map.get("RETURN");
		Map OB_PERSONA = (Map) OB_RETURN.get("PERSONA");

		String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " " : " ";
		nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
		nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

		formdata.put("NOMBRE", nomComplet);
		formdata.put("NNUMIDE", OB_PERSONA.get("NNUMIDE"));
		formdata.put("SPERSON", OB_PERSONA.get("SPERSON"));

		formdata.put("FCITACION", OB_RETURN.get("FCITACION"));
		formdata.put("HCITACION", OB_RETURN.get("HCITACION"));

		formdata.put("CPROVIN", OB_RETURN.get("CPROVIN"));
		formdata.put("CPOBLAC", OB_RETURN.get("CPOBLAC"));

		formdata.put("TLUGAR", OB_RETURN.get("TLUGAR"));

		formdata.put("NCITACION", OB_RETURN.get("NCITACION"));

		formdata.put("TAUDIEN", OB_RETURN.get("TAUDIEN"));
		formdata.put("CORAL", OB_RETURN.get("CORAL"));
		formdata.put("CESTADO", OB_RETURN.get("CESTADO"));
		formdata.put("CRESOLU", OB_RETURN.get("CRESOLU"));
		formdata.put("FNUEVA", OB_RETURN.get("FNUEVA"));
		formdata.put("TRESULT", OB_RETURN.get("TRESULT"));
		formdata.put("CMEDIO", OB_RETURN.get("CMEDIO"));

	}

	private void cargarListas(HttpServletRequest request) throws Exception {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(728));

		List TIPOSZONA = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("TIPOSZONA", TIPOSZONA);

		Map map4 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001121"));
		List listaClases = (List) tratarRETURNyMENSAJES(request, map4);
		formdata.put("listaClases", !isEmpty(listaClases) ? listaClases : new ArrayList());

		map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
		BigDecimal pais = (BigDecimal) map.get("RETURN");
		formdata.put("CPAIS", pais);

		Map map7 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001171"));
		List listaMedios = (List) tratarRETURNyMENSAJES(request, map7);
		formdata.put("listaMedios", !isEmpty(listaMedios) ? listaMedios : new ArrayList());
		Map map8 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001094"));
		List listaOral = (List) tratarRETURNyMENSAJES(request, map8);
		formdata.put("listaOral", !isEmpty(listaOral) ? listaOral : new ArrayList());
		Map map9 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001095"));
		List listaEstados = (List) tratarRETURNyMENSAJES(request, map9);
		formdata.put("listaEstados", !isEmpty(listaEstados) ? listaEstados : new ArrayList());
		Map map10 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001096"));
		List listaResolucion = (List) tratarRETURNyMENSAJES(request, map10);
		formdata.put("listaResolucion", !isEmpty(listaResolucion) ? listaResolucion : new ArrayList());

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_PROVINCIA", pais.toString() + "|");
		List PROVINCIAS = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("PROVINCIAS", PROVINCIAS);

		BigDecimal pCPROVIN = this.getCampoNumerico(request, "CPROVIN");
		if (pCPROVIN != null) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", pCPROVIN + "|||");
			List POBLACIONES = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("POBLACIONES", POBLACIONES);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_actualizar_persona(HttpServletRequest request, Axissin071Action axissin071Action) {

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

		try {

			if (!isEmpty(SPERSON)) {

				String PMODE = new String("POL");
				Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				formdata.putAll(OB_PERSONA);

				String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " "
						: " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
				nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

				formdata.put("NOMBRE", nomComplet);

				formdata.put("NNUMIDE", OB_PERSONA.get("NNUMIDE"));

				formdata.put("SPERSON", OB_PERSONA.get("SPERSON"));

			}

			cargarListas(request);

		} catch (Exception e) {
			log.error("Error", e);
			axissin071Action.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

	}

	public void m_ajax_cargarPoblaciones(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String CPROVIN = this.getCampoTextual(request, "CPROVIN");

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA("LISTA_POBLACION", CPROVIN + "|||");
			ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
		} catch (Exception e) {
			log.error("Error en el servicio Axissin071Service - m�todo m_ajax_cargarPoblaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_aceptar(HttpServletRequest request, Axissin071Action axissin071Action) {

		try {

			BigDecimal NCITACION = getCampoNumerico(request, "NCITACION");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			java.sql.Date FCITACION = this.stringToSqlDate(getCampoTextual(request, "PFCITACION"));
			String HCITACION = getCampoTextual(request, "PHCITACION");
			BigDecimal CPROVIN = getCampoNumerico(request, "PCPROVIN");
			BigDecimal CPOBLAC = getCampoNumerico(request, "PCPOBLAC");
			BigDecimal CPAIS = getCampoNumerico(request, "PCPAIS");
			String TLUGAR = getCampoTextual(request, "PTLUGAR");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			String TAUDIEN = getCampoTextual(request, "TAUDIEN");
			BigDecimal CORAL = getCampoNumerico(request, "CORAL");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal CRESOLU = getCampoNumerico(request, "CRESOLU");
			Date FNUEVA = stringToSqlDate(getCampoTextual(request, "FNUEVA"));
			String TRESULT = getCampoTextual(request, "TRESULT");
			BigDecimal CMEDIO = getCampoNumerico(request, "CMEDIO");

			PAC_IAX_SINIESTROS pacIaxSiniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxSiniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMICIT(NSINIES, NTRAMIT, NCITACION,
					SPERSON, FCITACION, HCITACION, CPAIS, CPROVIN, CPOBLAC, TLUGAR, TAUDIEN, CORAL, CESTADO, CRESOLU,
					FNUEVA, TRESULT, CMEDIO);

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			log.error("Error en el servicio Axissin011Service - m�todo m_guardar", e);
			axissin071Action.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

}
