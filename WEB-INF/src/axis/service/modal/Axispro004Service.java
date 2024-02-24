package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ECO_MONEDAS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos ctipges
		Map map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPGES();
		List CTIPGES = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(CTIPGES);

		request.setAttribute("axispro001_listaCtipges", !isEmpty(CTIPGES) ? CTIPGES : new ArrayList());

		// Datos crecccob
		Map map0 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCRECCOB();
		List CRECCOB = (List) tratarRETURNyMENSAJES(request, map0, false);
		logger.debug(CRECCOB);

		request.setAttribute("axispro001_listaCreccob", !isEmpty(CRECCOB) ? CRECCOB : new ArrayList());

		// Datos CTIPREB
		Map map1 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPREB();
		List CTIPREB = (List) tratarRETURNyMENSAJES(request, map1, false);
		logger.debug(CTIPREB);

		request.setAttribute("axispro001_listaCtipreb", !isEmpty(CTIPREB) ? CTIPREB : new ArrayList());

		// Datos CCALCOM
		Map map2 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCCALCOM();
		List CCALCOM = (List) tratarRETURNyMENSAJES(request, map2, false);
		logger.debug(CCALCOM);

		request.setAttribute("axispro001_listaCcalcom", !isEmpty(CCALCOM) ? CCALCOM : new ArrayList());

		// Datos CTIPPAG
		Map map3 = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCTIPPAG();
		List CTIPPAG = (List) tratarRETURNyMENSAJES(request, map3, false);
		logger.debug(CTIPPAG);

		request.setAttribute("axispro001_listaCtippag", !isEmpty(CTIPPAG) ? CTIPPAG : new ArrayList());
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro004Action thisAction) {
		logger.debug("Axispro004Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axispro004Service m_form");

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_Get_Admprod(SPRODUC);
			logger.debug(map);
			Map OB_IAX_PRODADMINISTRACION = (Map) tratarRETURNyMENSAJES(request, map);
			logger.debug(OB_IAX_PRODADMINISTRACION);

			if (!isEmpty(OB_IAX_PRODADMINISTRACION)) {
				request.setAttribute("OB_IAX_PRODADMINISTRACION", OB_IAX_PRODADMINISTRACION);
				// formdata.putAll(OB_IAX_PRODADMINISTRACION);
				// MLR - 05/04/2013 - 0025803: RSA001 - Ampliar los decimales que utiliza iAXIS
				PAC_IAX_ECO_MONEDAS pac_iax_eco_monedas = new PAC_IAX_ECO_MONEDAS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa = pac_iax_eco_monedas.ejecutaPAC_IAX_ECO_MONEDAS__F_OBTENER_MONEDA_PRODUCTO2(SPRODUC);
				logger.debug(mapa);
				request.getSession().setAttribute(("CMONEDAPROD"), mapa.get("RETURN"));
			}

			cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axispro004Action thisAction) {

		logger.debug("Axispro004Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.setAttribute("OK", "!OK");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCTIPSEG = getCampoNumerico(request, "TTIPGES");
			BigDecimal PCRECCOB = getCampoNumerico(request, "CRECCOB");
			BigDecimal PCTIPREB = getCampoNumerico(request, "TTIPREB");
			BigDecimal PCCALCOM = getCampoNumerico(request, "TCALCOM");
			BigDecimal PCTIPPAG = getCampoNumerico(request, "TTIPPAG");
			BigDecimal PNDIASPRO = getCampoNumerico(request, "NDIASPRO");
			BigDecimal PIMINEXT = getCampoNumerico(request, "IMINEXT");
			String CNV_SPR = getCampoTextual(request, "CNV_SPR");
			BigDecimal pcmovdom = new BigDecimal(1);
			BigDecimal pcfeccob = new BigDecimal(1);
			BigDecimal pcrecfra = new BigDecimal(1);

			if (this.isEmpty(request.getParameter("CMOVDOM")))
				pcmovdom = new BigDecimal(0);

			if (this.isEmpty(request.getParameter("CFECCOB")))
				pcfeccob = new BigDecimal(0);

			if (this.isEmpty(request.getParameter("CRECFRA")))
				pcrecfra = new BigDecimal(0);

			Map map;
			map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_ADMPROD(SPRODUC, PCTIPSEG, PCRECCOB, PCTIPREB, PCCALCOM, PCTIPPAG,
							pcmovdom, pcfeccob, pcrecfra, PIMINEXT, PNDIASPRO, CNV_SPR);
			// Map OB_IAX_PRODADMINISTRACION = (Map) tratarRETURNyMENSAJES(request, map);

			logger.debug(map);

			boolean hayunerror = thisAction.maxistipoMENSAJEesERROR(request);
			if (!hayunerror && isEmpty(map.get("MENSAJES")))
				request.setAttribute("OK", "OK");
			else {
				thisAction.guardarMensaje(request, "1000052", new Object[] { map.get("MENSAJES") },
						Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
