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

import axis.jdbc.PAC_IAX_LISTASRESTRINGIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr212Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr212Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr212Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr212Action thisAction) {
		logger.debug("Axisctr212Service m_init");
		try {
			this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr212Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr212Action thisAction) {
		logger.debug("Axisctr212Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.cargaListas(request);

			String CMODO = getCampoTextual(request, "CMODO");
			BigDecimal SMATRICLRE = getCampoNumerico(request, "SMATRICLRE");
			formdata.put("CMODO", CMODO);
			formdata.put("SMATRICLRE", SMATRICLRE);

			if (CMODO.equals(new String("MODIF")) && !isEmpty(SMATRICLRE)) {
				Map map = new PAC_IAX_LISTASRESTRINGIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA_AUT(null, null, null, null, null,
								null, null, null, null, null, SMATRICLRE);
				logger.debug("--> map:" + map);
				ArrayList autos = (ArrayList) map.get("RETURN");
				logger.debug("--> autos:" + autos);
				HashMap auto = (HashMap) autos.get(0);
				logger.debug("--> auto:" + auto);
				if (!isEmpty(auto)) {
					formdata.put("CCLALIS", auto.get("CCLALIS"));
					formdata.put("CTIPLIS", auto.get("CTIPLIS"));
					formdata.put("CMATRIC", auto.get("CMATRIC"));
					formdata.put("CODMOTOR", auto.get("CODMOTOR"));
					formdata.put("CCHASIS", auto.get("CCHASIS"));
					formdata.put("NBASTID", auto.get("NBASTID"));
					formdata.put("SMATRICLRE", auto.get("SMATRICLRE"));
					formdata.put("FINCLU", auto.get("FINCLUS"));
					formdata.put("FEXCLU", auto.get("FEXCLUS"));
					formdata.put("MOTINCLU", auto.get("CINCLUS"));
					formdata.put("CNOTIFI", auto.get("CNOTIFI"));

				}
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr212Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map map = new HashMap();
		Map listValores = new HashMap();

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPPERSON();
		logger.debug(map);
		listValores.put("tipPerson", (List) tratarRETURNyMENSAJES(request, map));

		// Tipo de documento
		BigDecimal TIDENTI = getCampoNumerico(request, "TPERSONA");
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(TIDENTI);
		logger.debug(map);
		listValores.put("tipDocum", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800040));
		logger.debug(map);
		listValores.put("claseList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800048));
		logger.debug(map);
		listValores.put("tipoList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800122));
		logger.debug(map);
		listValores.put("motExclu", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(49));
		logger.debug(map);
		listValores.put("listsino", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listValores", listValores);
	}

	public void m_guardar(HttpServletRequest request, Axisctr212Action thisAction) {

		logger.debug("Axisctr212Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SMATRICLRE = getCampoNumerico(request, "SMATRICLRE");
			String CMATRIC = getCampoTextual(request, "CMATRIC");
			String CODMOTOR = getCampoTextual(request, "CODMOTOR");
			String CCHASIS = getCampoTextual(request, "CCHASIS");
			String NBASTID = getCampoTextual(request, "NBASTID");
			BigDecimal CTIPLIS = getCampoNumerico(request, "CTIPLIS");
			BigDecimal CCLALIS = getCampoNumerico(request, "CCLALIS");

			Date FEXCLU = stringToSqlDate(getCampoTextual(request, "FEXCLU"));
			Date FINCLU = stringToSqlDate(getCampoTextual(request, "FINCLU"));
			BigDecimal MOTINCLU = getCampoNumerico(request, "MOTINCLU");
			BigDecimal CNOTIFI = getCampoNumerico(request, "CNOTIFI");

			logger.debug("--> SMATRICLRE:" + SMATRICLRE);
			logger.debug("--> CMATRIC:" + CMATRIC);
			logger.debug("--> CODMOTOR:" + CODMOTOR);
			logger.debug("--> CCHASIS:" + CCHASIS);
			logger.debug("--> NBASTID:" + NBASTID);
			logger.debug("--> CTIPLIS:" + CTIPLIS);
			logger.debug("--> CCLALIS:" + CCLALIS);
			logger.debug("--> FEXCLU:" + FEXCLU);
			logger.debug("--> FINCLU:" + FINCLU);
			logger.debug("--> MOTINCLU:" + MOTINCLU);

			Map map = new PAC_IAX_LISTASRESTRINGIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA_AUT(CMATRIC, CODMOTOR, CCHASIS, NBASTID,
							CCLALIS, CTIPLIS, CNOTIFI, SMATRICLRE, FEXCLU, FINCLU, MOTINCLU);

			logger.debug("-->lista restringida:" + map);
			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
				formdata.put("PSMATRICLRE_OUT", map.get("PSMATRICLRE_OUT"));
			} else
				formdata.put("OK", 1);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi004Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
