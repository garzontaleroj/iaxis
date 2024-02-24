package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm081Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm081Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm081Action thisAction) {
		logger.debug("Axisadm081Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio axisadm081Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisadm081Action thisAction) {
		logger.debug("Axisadm081 Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			Map LISTVALORES = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			BigDecimal CEMPRES = getCampoNumerico(request, "PCEMPRES");
			Date FCONTABINI = stringToSqlDate(getCampoTextual(request, "FCONTABINI"));
			Date FCONTABFIN = stringToSqlDate(getCampoTextual(request, "FCONTABFIN"));
			Date FADMININI = stringToSqlDate(getCampoTextual(request, "FADMININI"));
			Date FADMINFIN = stringToSqlDate(getCampoTextual(request, "FADMINFIN"));
			logger.debug("CEMPRES:" + CEMPRES);
			if (!isEmpty(CEMPRES)) {

				PAC_IAX_CONTABILIDAD pac_iax_contabilidad = new PAC_IAX_CONTABILIDAD(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_contabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_GET_APUNTESMANUALES(CEMPRES, FCONTABINI,
						FCONTABFIN, FADMININI, FADMINFIN);

				// logger.debug("map "+map);

				ArrayList desc = new ArrayList();
				tratarRETURNyMENSAJES(request, map, true);
				desc = (ArrayList) map.get("RETURN");

				logger.debug("desc " + desc);

				request.setAttribute("LISTAAPUNTES", desc);
			}

			// PAC_IAX_CONTABILIDAD pac_iax_contabilidad=new
			// PAC_IAX_CONTABILIDAD((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			// cargarDatosCombos(request, thisAction);

			// String CUSUARI = this.getCampoTextual(request,"CUSUARI");

			// if (isEmpty (CUSUARI)){
			// Map m =
			// pac_iax_contabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_GET_APUNTESMANUALES();
			// formdata.put("LISTAAPUNTES", (String)tratarRETURNyMENSAJES(request, m));
			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm081Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	private void cargarDatosCombos(HttpServletRequest request, Axisadm081Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map listValores = new HashMap();
		try {

			// Lista concepto de apuntes

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCONCEPTOSAPUNTEAGENDA();
			logger.debug(map);
			listValores.put("LSTCONCEPTOSAPUNTEAGENDA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista de Estado de apuntes
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADOSAPUNTEAGENDA();
			logger.debug(map);
			listValores.put("LSTESTADOSAPUNTEAGENDA", (List) tratarRETURNyMENSAJES(request, map));

			// Lista de usuarios
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			logger.debug(map);
			listValores.put("LSTUSUARIOSAGENDA", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisadm081 cargarDatosCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisadm081Action thisAction) {
		logger.debug("Axisadm081Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "PCEMPRES");
			Date FCONTABINI = stringToSqlDate(getCampoTextual(request, "FCONTABINI"));
			Date FCONTABFIN = stringToSqlDate(getCampoTextual(request, "FCONTABFIN"));
			Date FADMININI = stringToSqlDate(getCampoTextual(request, "FADMININI"));
			Date FADMINFIN = stringToSqlDate(getCampoTextual(request, "FADMINFIN"));

			PAC_IAX_CONTABILIDAD pac_iax_contabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_contabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_GET_APUNTESMANUALES(CEMPRES, FCONTABINI,
					FCONTABFIN, FADMININI, FADMINFIN);

			// logger.debug("map "+map);

			ArrayList desc = new ArrayList();
			tratarRETURNyMENSAJES(request, map, true);
			desc = (ArrayList) map.get("RETURN");

			logger.debug("desc " + desc);

			request.setAttribute("LISTAAPUNTES", desc);
			// formdata.put("LISTAAPUNTES", desc);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm081Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisadm081Action thisAction) {
		logger.debug("Axisadm081Service m_cerrar");
		try {
			request.getSession().removeAttribute("LISTAAPUNTESAGENDA");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm081Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_delete(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisadm081Service m_delete");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_CONTABILIDAD pac_iax_contabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CPAIS = this.getCampoNumerico(request, "CPAIS");
			java.sql.Date FEFEADM = this.stringToSqlDate(getCampoTextual(request, "FEFEADM"));
			BigDecimal CPROCES = getCampoNumerico(request, "CPROCES");
			String CCUENTA = getCampoTextual(request, "PCCUENTA");
			BigDecimal NLINEA = getCampoNumerico(request, "NLINEA");
			BigDecimal NASIENT = getCampoNumerico(request, "NASIENT");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			java.sql.Date FCONTA = this.stringToSqlDate(getCampoTextual(request, "FCONTA"));
			String TDESCRI = getCampoTextual(request, "TDESCRI");
			BigDecimal SINTERF = getCampoNumerico(request, "SINTERF");
			BigDecimal TTIPPAG = this.getCampoNumerico(request, "TTIPPAG");
			BigDecimal IDPAGO = this.getCampoNumerico(request, "IDPAGO");
			String CCOLETILLA = getCampoTextual(request, "PCCOLETILLA");
			String OTROS = getCampoTextual(request, "OTROS");

			Map map = pac_iax_contabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_DEL_APUNTEMANUAL(CPAIS, FEFEADM, CPROCES,
					CCUENTA, NLINEA, NASIENT, CEMPRES, FCONTA, TDESCRI, SINTERF, TTIPPAG, IDPAGO, CCOLETILLA, OTROS);

			logger.debug("map " + map);

			this.tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm081Service - m�todo m_delete", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_traspasar(HttpServletRequest request, Axisadm081Action thisAction) {
		logger.debug("Axisadm081Service m_traspasar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_CONTABILIDAD pac_iax_contabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_contabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_TRASPASA_APUNTEMANUAL();

			logger.debug("map " + map);

			// tratarRETURNyMENSAJES(request,map);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).equals(BigDecimal.ZERO)) {
				request.setAttribute("OK_acceptar181", 1);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm081Service - m�todo m_traspasar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

}
