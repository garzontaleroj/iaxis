//Revision:# mjfOTUOFkGja+9uTNujg0A== #
package axis.service.modal;

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

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axissin065Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin065Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request, Axissin065Action thisAction) throws Exception {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map1 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001116"));
			List listaOrden = (List) tratarRETURNyMENSAJES(request, map1);
			formdata.put("listaOrden", !isEmpty(listaOrden) ? listaOrden : new ArrayList());
			Map map3 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001117"));
			List listaUnidades = (List) tratarRETURNyMENSAJES(request, map3);
			formdata.put("listaUnidades", !isEmpty(listaUnidades) ? listaUnidades : new ArrayList());
			Map map5 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001118"));
			List listaTipos = (List) tratarRETURNyMENSAJES(request, map5);
			formdata.put("listaTipos", !isEmpty(listaTipos) ? listaTipos : new ArrayList());
			Map map8 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001171"));
			List listaMedios = (List) tratarRETURNyMENSAJES(request, map8);
			formdata.put("listaMedios", !isEmpty(listaMedios) ? listaMedios : new ArrayList());
			Map map9 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001095"));
			List listaEstados = (List) tratarRETURNyMENSAJES(request, map9);
			formdata.put("listaEstados", !isEmpty(listaEstados) ? listaEstados : new ArrayList());
			Map map10 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001120"));
			List listaRecursos = (List) tratarRETURNyMENSAJES(request, map10);
			formdata.put("listaRecursos", !isEmpty(listaRecursos) ? listaRecursos : new ArrayList());
			Map map11 = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001119"));
			List listaFallos = (List) tratarRETURNyMENSAJES(request, map11);
			formdata.put("listaFallos", !isEmpty(listaFallos) ? listaFallos : new ArrayList());

			Map map = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("PAIS_DEF");
			BigDecimal pais = (BigDecimal) map.get("RETURN");
			formdata.put("CPAIS", pais);

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

		} catch (Exception e) {
			logger.error("Error en el m�todo Axissin006 cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin065Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");

			// bug 204
			// BigDecimal NRADICA=getCampoNumerico(request, "NRADICA");
			String NRADICA = getCampoTextual(request, "NRADICA");
			// fin bug 204

			BigDecimal isNew = getCampoNumerico(request, "isNew");
			String TTRAMITAD = getCampoTextual(request, "TTRAMITAD");
			String TSUBTRA = getCampoTextual(request, "TSUBTRA");

			// consulta de datos proceso
			BigDecimal CMODO = getCampoNumerico(request, "MODO");
			formdata.put("CMODO", CMODO);

			formdata.put("NRECLAMA", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);
			formdata.put("NPOLIZA", NPOLIZA);
			formdata.put("NCERTIF", NCERTIF);
			formdata.put("NORDEN", NORDEN);
			formdata.put("NRADICA", NRADICA);
			formdata.put("TTRAMITAD", TTRAMITAD);
			formdata.put("TSUBTRA", TSUBTRA);
			formdata.put("isNew", isNew);

			if (new BigDecimal(0).equals(isNew)) {
				this.m_cargar(request, thisAction);
			}

			this.cargarListas(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin065Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin065Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map resultado = null;
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));
			if (pRETURN != null && pRETURN.intValue() != 1) {
				String NSINIES = getCampoTextual(request, "NSINIES");
				BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
				BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
				Date FAPERTU = stringToSqlDate(getCampoTextual(request, "FAPERTU"));
				Date FIMPUTA = stringToSqlDate(getCampoTextual(request, "FIMPUTA"));
				Date FNOTIFI = stringToSqlDate(getCampoTextual(request, "FNOTIFI"));
				Date FAUDIEN = stringToSqlDate(getCampoTextual(request, "FAUDIEN"));
				String HAUDIEN = getCampoTextual(request, "HAUDIEN");
				BigDecimal CAUDIEN = getCampoNumerico(request, "CAUDIEN");
				BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");
				BigDecimal COTERRI = getCampoNumerico(request, "COTERRI");
				BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
				BigDecimal CCONTRA = getCampoNumerico(request, "CCONTRA");
				BigDecimal CUESPEC = getCampoNumerico(request, "CUESPEC");
				String TCONTRA = getCampoTextual(request, "TCONTRA");
				BigDecimal CTIPTRA = getCampoNumerico(request, "CTIPTRA");
				String TESTADO = getCampoTextual(request, "TESTADO");
				BigDecimal CMEDIO = getCampoNumerico(request, "CMEDIO");
				Date FDESCAR = stringToSqlDate(getCampoTextual(request, "FDESCAR"));
				Date FFALLO = stringToSqlDate(getCampoTextual(request, "FFALLO"));
				BigDecimal CFALLO = getCampoNumerico(request, "CFALLO");
				String TFALLO = getCampoTextual(request, "TFALLO");
				BigDecimal CRECURSO = getCampoNumerico(request, "CRECURSO");
				String CTRAMITAD = getCampoTextual(request, "CTRAMITAD");
				resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_SET_OBJ_FISCAL(NSINIES, NTRAMIT, NORDEN,
						FAPERTU, FIMPUTA, FNOTIFI, FAUDIEN, HAUDIEN, CAUDIEN, SPROFES, COTERRI, CPROVIN, CCONTRA,
						CUESPEC, TCONTRA, CTIPTRA, TESTADO, CMEDIO, FDESCAR, FFALLO, CFALLO, TFALLO, CRECURSO,
						CTRAMITAD);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, resultado);
				if (!isEmpty(resultado) && new BigDecimal(0).equals(RETURN)) {
					request.setAttribute("grabarOK", true);
				}

			} else {
				// para evitar que el onload llame a la funcion ajax f_actualizar_agente_sel()
				// que borra los mensajes
				formdata.put("hayErrorAvisos", "1");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin065Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this.getClass()));
		}
	}

	public void m_init(HttpServletRequest request, Axissin065Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin065Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_cargar(HttpServletRequest request, Axissin065Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		String NSINIES = getCampoTextual(request, "NSINIES");
		BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
		String TTRAMITAD = getCampoTextual(request, "TTRAMITAD");

		try {
			Map resultado = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_FISCAL(NSINIES, NTRAMIT, NORDEN);
			Map objfiscal = (Map) resultado.get("OBJFISCAL");
			formdata.put("TTRAMITAD", TTRAMITAD);
			formdata.put("NSINIES", objfiscal.get("NSINIES"));
			formdata.put("NTRAMIT", objfiscal.get("NTRAMIT"));
			formdata.put("NORDEN", objfiscal.get("NORDEN"));
			formdata.put("FAPERTU", objfiscal.get("FAPERTU"));
			formdata.put("FIMPUTA", objfiscal.get("FIMPUTA"));
			formdata.put("FNOTIFI", objfiscal.get("FNOTIFI"));
			formdata.put("FAUDIEN", objfiscal.get("FAUDIEN"));
			formdata.put("HAUDIEN", objfiscal.get("HAUDIEN"));
			formdata.put("CAUDIEN", objfiscal.get("CAUDIEN"));
			formdata.put("SPROFES", objfiscal.get("SPROFES"));
			formdata.put("COTERRI", objfiscal.get("COTERRI"));
			formdata.put("CPROVIN", objfiscal.get("CPROVIN"));
			formdata.put("CCONTRA", objfiscal.get("CCONTRA"));
			formdata.put("CUESPEC", objfiscal.get("CUESPEC"));
			formdata.put("TCONTRA", objfiscal.get("TCONTRA"));
			formdata.put("CTIPTRA", objfiscal.get("CTIPTRA"));
			formdata.put("TESTADO", objfiscal.get("TESTADO"));
			formdata.put("CMEDIO", objfiscal.get("CMEDIO"));
			formdata.put("FDESCAR", objfiscal.get("FDESCAR"));
			formdata.put("FFALLO", objfiscal.get("FFALLO"));
			formdata.put("CFALLO", objfiscal.get("CFALLO"));
			formdata.put("TFALLO", objfiscal.get("TFALLO"));
			formdata.put("CRECURSO", objfiscal.get("CRECURSO"));
			formdata.put("NNUMIDEPROFES", objfiscal.get("NNUMIDEPROFES"));
			formdata.put("NOMBREPROFES", objfiscal.get("NOMBREPROFES"));
			if (((List) objfiscal.get("GARANTIAS")).size() > 0)
				formdata.put("GARANTIAS", (List) objfiscal.get("GARANTIAS"));
			formdata.put("ITOTASEG", objfiscal.get("ITOTASEG"));
			formdata.put("ITOTPRET", objfiscal.get("ITOTPRET"));
			formdata.put("CMONEDAFAUL", "COP");

		} catch (Exception e) {
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrar(HttpServletRequest request, Axissin065Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CTIPO = this.getCampoNumerico(request, "TIPO_DEL");
			String NSINIES = getCampoTextual(request, "NSINIES_RES");
			BigDecimal NTRAMIT = this.getCampoNumerico(request, "NTRAMIT_RES");
			BigDecimal NORDEN = this.getCampoNumerico(request, "NORDEN_RES");
			BigDecimal NVALOR = null;
			if (CTIPO.equals(new BigDecimal(2)) || CTIPO.equals(new BigDecimal(3)) || CTIPO.equals(new BigDecimal(4)))
				NVALOR = this.getCampoNumerico(request, "NVALOR");
			Map mapObjTramite = null;
			PAC_IAX_SIN_TRAMITE pac_axis_sintramite = new PAC_IAX_SIN_TRAMITE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			mapObjTramite = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_ELIMINA_DATO_FISCAL(CTIPO, NSINIES,
					NTRAMIT, NORDEN, NVALOR);
			Map resulfiscal = pac_axis_sintramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_OBJ_FISCAL(NSINIES, NTRAMIT,
					NORDEN);
			Map objFiscal = (Map) resulfiscal.get("OBJFISCAL");

			HashMap mapa_pretension = new HashMap();
			BigDecimal importeFranquicia = (BigDecimal) tratarRETURNyMENSAJES(request, resulfiscal, false);
			mapa_pretension.put("ITOTASEG", (BigDecimal) objFiscal.get("ITOTASEG"));
			mapa_pretension.put("ITOTPRET", (BigDecimal) objFiscal.get("ITOTPRET"));
			ajax.rellenarPlAContenedorAjax(resulfiscal);
			ajax.guardarContenidoFinalAContenedorAjax(mapa_pretension);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - m�todo cargarFiscal", e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
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
			logger.error("Error en el servicio Axissin065Service - m�todo m_ajax_cargarPoblaciones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
