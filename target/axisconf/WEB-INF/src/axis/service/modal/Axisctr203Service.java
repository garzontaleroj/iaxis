//Revision:# tbjoXXcETqoMmGRdf4nXTw== #
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
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.modal.Axisctr203Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr203Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr203Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr203Action thisAction) {
		logger.debug("Axisctr203Service m_init");
		try {
			this.cargaListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr203Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisctr203Action thisAction) {
		logger.debug("Axisctr203Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.cargaListas(request);

			String CMODO = getCampoTextual(request, "CMODO");
			BigDecimal SPERLRE = getCampoNumerico(request, "SPERLRE");
			formdata.put("CMODO", CMODO);
			formdata.put("SPERLRE", SPERLRE);

			if (CMODO.equals(new String("MODIF")) && !isEmpty(SPERLRE)) {
				Map map = new PAC_IAX_LISTASRESTRINGIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTASRESTRINGIDA__F_GET_LISTARESTRINGIDA(null, null, null, null, null, null,
								null, null, null, null, SPERLRE, null, null);
				logger.debug("--> map:" + map);
				ArrayList personas = (ArrayList) map.get("RETURN");
				logger.debug("--> personas:" + personas);
				HashMap persona = (HashMap) personas.get(0);
				logger.debug("--> persona:" + persona);
				if (!isEmpty(persona)) {
					formdata.put("CCLALIS", persona.get("CCLALIS"));
					formdata.put("CTIPLIS", persona.get("CTIPLIS"));
					formdata.put("CTIPIDE", persona.get("CTIPIDE"));
					formdata.put("SPERSON", persona.get("SPERSON"));
					formdata.put("CTIPPER", persona.get("CTIPPER"));
					formdata.put("NNUMIDE", persona.get("NNUMIDE"));
					String NOMBRE = (String) persona.get("TNOMBRE1")
							+ ((persona.get("TNOMBRE2") != null) ? " " + persona.get("TNOMBRE2") : "") + ","
							+ ((persona.get("TAPELLI1") != null) ? " " + persona.get("TAPELLI1") : "") + " "
							+ ((persona.get("TAPELLI2") != null) ? " " + persona.get("TAPELLI2") : "");
					formdata.put("NOMBRE", NOMBRE);
					formdata.put("FINCLU", persona.get("FINCLUS"));
					formdata.put("FEXCLU", persona.get("FEXCLUS"));
					formdata.put("MOTINCLU", persona.get("CINCLUS"));
					formdata.put("FNACIMI", persona.get("FNACIMI"));
					formdata.put("TDESCRIP", persona.get("TDESCRIP"));
					formdata.put("TOBSERV", persona.get("TOBSERV"));
					formdata.put("TMOTEXC", persona.get("TMOTEXC"));
				}
			}
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr203Service - m�todo m_form", e);
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
		boolean listdep = false;

		for (int i = 0; i < ((List) listValores.get("claseList")).size(); i++) {
			if (((BigDecimal) ((HashMap) ((List) listValores.get("claseList")).get(i)).get("CATRIBU"))
					.equals(new BigDecimal(2))) {
				listdep = true;
			}
		}

		// JAVENDANO CONF 239 deben salir todos los tipos de lista
		/*
		 * if(listdep==false){ map =
		 * pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
		 * BigDecimal(800048)); logger.debug(map); listValores.put("tipoList",
		 * (List)tratarRETURNyMENSAJES(request, map)); }else{ map =
		 * pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(usuario.
		 * getCempres(),new BigDecimal(800040),new BigDecimal(2),new
		 * BigDecimal(800048)); logger.debug(map); listValores.put("tipoList",
		 * (List)tratarRETURNyMENSAJES(request, map)); }
		 */
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800048));
		logger.debug(map);
		listValores.put("tipoList", (List) tratarRETURNyMENSAJES(request, map));

		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800122));
		logger.debug(map);
		listValores.put("motExclu", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("listValores", listValores);
	}

	public void m_guardar(HttpServletRequest request, Axisctr203Action thisAction) {

		logger.debug("Axisctr203Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPLIS = getCampoNumerico(request, "CTIPLIS");
			BigDecimal CCLALIS = getCampoNumerico(request, "CCLALIS");
			BigDecimal SPERLRE = getCampoNumerico(request, "SPERLRE");
			Date FEXCLU = stringToSqlDate(getCampoTextual(request, "FEXCLU"));
			Date FINCLU = stringToSqlDate(getCampoTextual(request, "FINCLU"));
			BigDecimal MOTINCLU = getCampoNumerico(request, "MOTINCLU");
			Date FNACIMI = stringToSqlDate(getCampoTextual(request, "FNACIMI"));
			String TDESCRIP = getCampoTextual(request, "TDESCRIP");
			String TOBSERV = getCampoTextual(request, "TOBSERV"); // JAVENDANO CONF 239
			String TMOTEXC = getCampoTextual(request, "TMOTEXC"); // JAVENDANO CONF 239
			logger.debug("--> SPERSON:" + SPERSON);
			logger.debug("--> CTIPLIS:" + CTIPLIS);
			logger.debug("--> CCLALIS:" + CCLALIS);
			logger.debug("--> SPERLRE:" + SPERLRE);
			logger.debug("--> FEXCLU:" + FEXCLU);
			logger.debug("--> FINCLU:" + FINCLU);
			logger.debug("--> MOTINCLU:" + MOTINCLU);
			logger.debug("--> TDESCRIP:" + TDESCRIP);
			System.out.println("--> SPERSON:" + SPERSON);
			System.out.println("--> TDESCRIP:" + TDESCRIP);
			System.out.println("--> TOBSERV:" + TOBSERV);
			System.out.println("--> TMOTEXC:" + TMOTEXC);
			// JAVENDANO CONF 239
			// Map map = new
			// PAC_IAX_LISTASRESTRINGIDA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA(SPERSON,CCLALIS,CTIPLIS,new
			// BigDecimal(1),SPERLRE,FEXCLU,FINCLU,MOTINCLU,FNACIMI,TDESCRIP);
			Map map = new PAC_IAX_LISTASRESTRINGIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTASRESTRINGIDA__F_SET_LISTARESTRINGIDA(SPERSON, CCLALIS, CTIPLIS,
							new BigDecimal(1), SPERLRE, FEXCLU, FINCLU, MOTINCLU, FNACIMI, TDESCRIP, TOBSERV, TMOTEXC);

			logger.debug("-->lista restringida:" + map);
			tratarRETURNyMENSAJES(request, map);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
				formdata.put("PSPERLRE_OUT", map.get("PSPERLRE_OUT"));
			} else
				formdata.put("OK", 1);

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi004Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axisctr203Action thisAction) {
		logger.debug("Axisper025Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");

			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug("--> persona:" + OB_PERSONA);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisctr203Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
