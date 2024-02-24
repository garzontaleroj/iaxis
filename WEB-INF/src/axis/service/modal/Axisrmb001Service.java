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

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_REEMBOLSOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisrmb001Service.java 20/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @author <a href="lcalvo@csi-ti.com">Luz Calvo</a> - Finalizar Desarrollo -
 *         Modificaci�n Funciones PL
 * @since Java 5.0
 */
public class Axisrmb001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/**
	 * M�todo que, pasando unos parametros, permite la carga de todas las p�lizas
	 * posibles a partir de esta b�squeda.
	 * 
	 * @param request
	 * @param usuario
	 * @param NREEMB
	 * @param NPOLIZA
	 * @param NCASS
	 * @param AGRSALUD
	 * @param TNOMBRE
	 * @param COFICINA
	 * @param USUARIO
	 * @param NFACT_CLI
	 * @param NCERTIF
	 * @return
	 * @throws Exception
	 */
	private List dbConsultaReembFact(HttpServletRequest request, UsuarioBean usuario, BigDecimal NREEMB,
			BigDecimal CESTADO, BigDecimal NPOLIZA, String NCASS, String TNOMBRE, String AGRSALUD, BigDecimal COFICINA,
			String USUARIO, String NFACT_CLI, BigDecimal NCERTIF, java.sql.Date FACTO) throws Exception {

		HashMap map = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTAREEMB(CESTADO, NREEMB, NPOLIZA, NCERTIF, NCASS, TNOMBRE,
						AGRSALUD, COFICINA, USUARIO, NFACT_CLI, FACTO);
		logger.debug(map);
		List plReturn = (List) tratarRETURNyMENSAJES(request, map);

		// ArrayList T_IAX_REEMBOLSOS = (ArrayList) tratarRETURNyMENSAJES(request, map);
		// logger.debug(ConversionUtil.printAsXML(T_IAX_REEMBOLSOS,
		// "T_IAX_REEMBOLSOS"));

		return plReturn;
	}

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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// request.getSession().removeAttribute ("T_IAX_REEMBOLSOS");
			request.getSession().removeAttribute("axisctr_listaReembFact");
			request.getSession().removeAttribute("NFACTselected");

			this.m_obtener_combos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// BFP bug 22396 ini
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		// BFP bug 22396 fi
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
	@SuppressWarnings("all")
	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_REEMBOLSOS pac_iax_reembolsos = new PAC_IAX_REEMBOLSOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/* Busqueda de reembolso */
			BigDecimal NREEMB = getCampoNumerico(request, "NREEMB");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NCASS = getCampoTextual(request, "NCASS");
			String TNOMBRE = getCampoTextual(request, "TNOMBRE");
			String AGRSALUD = getCampoTextual(request, "AGRSALUD");
			BigDecimal COFICINA = getCampoNumerico(request, "COFICINA");
			String USUARIO = getCampoTextual(request, "USUARIO");
			String NFACT_CLI = getCampoTextual(request, "NFACT_CLI");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			Date FACTO = getCampoTextual(request, "FACTO") != null ? sdf.parse(getCampoTextual(request, "FACTO"))
					: null;
			java.sql.Date FACTO_2 = FACTO != null ? new java.sql.Date(FACTO.getTime()) : null;

			// Map map = new
			// PAC_IAX_REEMBOLSOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_REEMBOLSOS__F_SET_CONSULTAREEMB(CESTADO,NREEMB,NPOLIZA,NCERTIF,NCASS,TNOMBRE,AGRSALUD,COFICINA,USUARIO,NFACT_CLI);

			/* CESTADO,NREEMB,NPOLIZA,NCASS,TNOMBRE,AGRSALUD,COFICINA,USUARIO,NFACT_CLI); */
			// logger.debug(map);
			// ArrayList T_IAX_REEMBOLSOS = (ArrayList) tratarRETURNyMENSAJES(request, map);
			// logger.debug(ConversionUtil.printAsXML(T_IAX_REEMBOLSOS,
			// "T_IAX_REEMBOLSOS"));

			List consultaReembFact = this.dbConsultaReembFact(request, usuario, NREEMB, CESTADO, NPOLIZA, NCASS,
					TNOMBRE, AGRSALUD, COFICINA, USUARIO, NFACT_CLI, NCERTIF, FACTO_2);
			request.getSession().setAttribute("axisctr_listaReembFact", consultaReembFact);
			// request.getSession().setAttribute("T_IAX_REEMBOLSOS", T_IAX_REEMBOLSOS);

			this.m_obtener_combos(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		// BFP bug 22396 ini
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		// BFP bug 22396 fi
	}

	public void m_obtener_combos(HttpServletRequest request) {
		logger.debug("Axisrmb001Service m_buscar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map mapa = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_ESTADOSREEMB();
			List listaEstados = (List) tratarRETURNyMENSAJES(request, mapa);
			formdata.put("listaEstados", listaEstados);
			listaEstados = null;

			Map mapa1 = new PAC_IAX_REEMBOLSOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_REEMBOLSOS__F_GET_LSTAGRSALUD();
			List listaSalud = (List) tratarRETURNyMENSAJES(request, mapa1);
			formdata.put("listaSalud", listaSalud);
			listaEstados = null;

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrmb001Service - m�todo m_obtener_combos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		// BFP bug 22396 ini
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		// BFP bug 22396 fi
	}

}
