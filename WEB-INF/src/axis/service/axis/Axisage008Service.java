package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.jdbc.PAC_IAX_TRASPASO_CARTERA_AGE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisage008Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

/**
 * Axisage008Service.java
 * 
 * @since Java 5.0
 */
public class Axisage008Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisage007Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal CMOTRASPASO = getCampoNumerico(request, "CMOTRASPASO");

			this.cargaListaMotTraspaso(request);
			formdata.put("CMOTRASPASO", CMOTRASPASO);

			String CPOLCIA = getCampoTextual(request, "CPOLCIA");
			String CRECCIA = getCampoTextual(request, "CRECCIA");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String TOBSERV = getCampoTextual(request, "TOBSERV");
			formdata.put("TOBSERV", TOBSERV);

			String NNUMIDE2 = getCampoTextual(request, "NNUMIDE2");
			logger.debug("--->NNUMIDE" + NNUMIDE2);
			formdata.put("NNUMIDE2", NNUMIDE2);

			if (isEmpty(NNUMIDE2))
				SPERSON = null;

			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

			// this.cargarListas(request);
			this.cargaListaRamos(request);
			BigDecimal VCRAMO = null;

			if ((!isEmpty(request.getAttribute("axisctr_listaRamos"))) && (CRAMO == null)) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				// if (lista.size()==1)
				VCRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			// formdata.put("CRAMO",CRAMO);
			List productos = new ArrayList();
			if (isEmpty(VCRAMO)) {
				productos = dbGetProductos(request, usuario);
			} else {
				productos = dbGetRamProductos(request, VCRAMO);
			}

			// if (!isEmpty(productos)){
			// if ((productos.size()==1)&&(SPRODUC==null)){
			// formdata.put("SPRODUC",(BigDecimal)(((HashMap)productos.get(0)).get("SPRODUC")));
			// }else{
			// formdata.put("SPRODUC",SPRODUC);
			// }
			formdata.put("productos", ((productos == null) ? new ArrayList() : productos));
			// }

			if (!isEmpty(CAGENTE)) {
				BigDecimal CEMPRES = (BigDecimal) usuario.getCempres();
				if (!isEmpty(CEMPRES) && !isEmpty(CAGENTE)) {
					// Si la persona CAGENTE1 est� informada recuperamos la lista de p�lizas.
					PAC_IAX_REDCOMERCIAL pac_iax_redcom = new PAC_IAX_REDCOMERCIAL(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					HashMap map_pol = pac_iax_redcom.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_POLAGENTE(CEMPRES, CAGENTE,
							NPOLIZA, CPOLCIA, SSEGURO, NNUMIDE, SPERSON, CRAMO, SPRODUC);
					ArrayList lista_pol = (ArrayList) tratarRETURNyMENSAJES(request, map_pol, false);
					// Recuperamos la lista de recibos pendientes
					HashMap map_recpend = pac_iax_redcom.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_RECAGENTE(CEMPRES, CAGENTE,
							new BigDecimal("0"), NPOLIZA, CPOLCIA, NRECIBO, CRECCIA, SSEGURO, NNUMIDE, SPERSON, CRAMO,
							SPRODUC);
					ArrayList lista_recpend = (ArrayList) tratarRETURNyMENSAJES(request, map_recpend, false);
					// Recuperamos la lista de recibos gesti�n
					HashMap map_recgest = pac_iax_redcom.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_RECAGENTE(CEMPRES, CAGENTE,
							new BigDecimal("3"), NPOLIZA, CPOLCIA, NRECIBO, CRECCIA, SSEGURO, NNUMIDE, SPERSON, CRAMO,
							SPRODUC);
					ArrayList lista_recgest = (ArrayList) tratarRETURNyMENSAJES(request, map_recgest, false);

					request.setAttribute("lista_pol", lista_pol);
					request.setAttribute("lista_recpend", lista_recpend);
					request.setAttribute("lista_recgest", lista_recgest);
				}
			}
			PAC_IAX_LISTVALORES pac_listaValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap map_comi = pac_listaValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(55));
			ArrayList lista_comi = (ArrayList) tratarRETURNyMENSAJES(request, map_comi, false);

			request.setAttribute("lista_comi", lista_comi);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage007Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisage008Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		try {
			String SPOLIZAS = getCampoTextual(request, "LISTPOL");
			/*
			 * String SRECIBOS = getCampoTextual(request,"LISTRECPEN"); String SRECIBOS_GEST
			 * = getCampoTextual(request,"LISTRECGES");
			 */
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CAGENTE2 = getCampoNumerico(request, "CAGENTE2");
			String comisiones = getCampoTextual(request, "comisiones");
			BigDecimal CTIPCOMI = getCampoNumerico(request, "tipComi");
			BigDecimal CMOTRASPASO = getCampoNumerico(request, "CMOTRASPASO");
			String TOBSERV = getCampoTextual(request, "TOBSERV");

			/*
			 * List lstComi = null; if(comisiones != null){ lstComi =
			 * parseComisiones(comisiones); }
			 */
			BigDecimal Retorno;
			int ContPolOK;
			int ContPolKO;
			int ContRecPenOK;
			int ContRecPenKO;
			int ContRecGesOK;
			int ContRecGesKO;
			int MensajeInfo;
			BigDecimal Sproces_In;
			BigDecimal Sproces_Out;
			String literal;
			String literal_error = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "105413");

			String[] LIST_POLIZAS = null;
			String[] LIST_RECIBOS = null;
			String[] LIST_RECIBOS_GEST = null;

			if (!SPOLIZAS.equals("undefined"))
				LIST_POLIZAS = SPOLIZAS.split("\\|");
			/*
			 * if (!SRECIBOS.equals("undefined")) LIST_RECIBOS = SRECIBOS.split("\\|"); if
			 * (!SRECIBOS_GEST.equals("undefined")) LIST_RECIBOS_GEST =
			 * SRECIBOS_GEST.split("\\|");
			 */

			PAC_IAX_TRASPASO_CARTERA_AGE pac_iax_traspaso_cartera_age = new PAC_IAX_TRASPASO_CARTERA_AGE(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/*
			 * if(!isEmpty (LIST_POLIZAS) || !isEmpty (LIST_RECIBOS) || !isEmpty
			 * (LIST_RECIBOS_GEST)){
			 */

			if (!isEmpty(LIST_POLIZAS)) {

				Map map;
				Sproces_In = null;
				Sproces_Out = null;
				ContPolOK = 0;
				ContPolKO = 0;
				if (!isEmpty(LIST_POLIZAS)) {
					for (String pos : LIST_POLIZAS) {

						logger.debug("Pol " + pos);
						map = pac_iax_traspaso_cartera_age.ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_TRASPASAR_CARTERA(
								CAGENTE, CAGENTE2, "POL", new BigDecimal(pos), null, Sproces_In, CTIPCOMI, comisiones,
								CMOTRASPASO, TOBSERV);
						logger.debug(map);
						// Retorno=(BigDecimal)tratarRETURNyMENSAJES(request, map);
						Retorno = this.stringToBigDecimal(String.valueOf(map.get("RETURN")));
						Sproces_Out = this.stringToBigDecimal(String.valueOf(map.get("PSPROCES_OUT")));

						if (isEmpty(Retorno) || Retorno.intValue() != 0)
							ContPolKO++;
						else
							ContPolOK++;

						if (!isEmpty(Sproces_Out))
							Sproces_In = Sproces_Out;

					}
					literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "9901952");

					if (ContPolKO > 0)
						MensajeInfo = Constantes.MENSAJE_ERROR;
					else
						MensajeInfo = Constantes.MENSAJE_INFO;

					AbstractDispatchAction.guardarMensaje(request,
							"verbatim:" + literal + ": " + ContPolOK + " - " + literal_error + ": " + ContPolKO, null,
							MensajeInfo);

				}

				ContRecPenOK = 0;
				ContRecPenKO = 0;
				/*
				 * if (!isEmpty (LIST_RECIBOS)) { for(String pos : LIST_RECIBOS ){
				 * logger.debug("RebPen " +pos); map = pac_iax_traspaso_cartera_age.
				 * ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_TRASPASAR_CARTERA(CAGENTE, CAGENTE2,
				 * "RECPEN", null, new BigDecimal(pos),
				 * Sproces_In,CTIPCOMI,comisiones,CMOTRASPASO,TOBSERV); logger.debug(map);
				 * //Retorno=(BigDecimal)tratarRETURNyMENSAJES(request, map);
				 * Retorno=this.stringToBigDecimal(String.valueOf(map.get("RETURN")));
				 * Sproces_Out=this.stringToBigDecimal(String.valueOf(map.get("PSPROCES_OUT")));
				 * 
				 * if (isEmpty(Retorno) || Retorno.intValue() != 0) ContRecPenKO++; else
				 * ContRecPenOK++;
				 * 
				 * if (!isEmpty (Sproces_Out)) Sproces_In = Sproces_Out; }
				 * logger.debug("literal aternatiu : "+ AltTag.getLiteralAlternativo(request,
				 * "axisage008", "RECPEND")); if (!isEmpty(AltTag.getLiteralAlternativo(request,
				 * "axisage008", "RECPEND_TRASPAS") )) literal=
				 * AltTag.getLiteralAlternativo(request, "axisage008", "RECPEND_TRASPAS"); else
				 * literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(),
				 * "9901953");
				 * 
				 * if (ContRecPenKO > 0) MensajeInfo = Constantes.MENSAJE_ERROR; else
				 * MensajeInfo = Constantes.MENSAJE_INFO;
				 * 
				 * AbstractDispatchAction.guardarMensaje (request, "verbatim:" + literal + ": "
				 * + ContRecPenOK + " - " + literal_error + ": " + ContRecPenKO, null,
				 * MensajeInfo); }
				 * 
				 * ContRecGesOK = 0; ContRecGesKO = 0; if (!isEmpty (LIST_RECIBOS_GEST)) {
				 * for(String pos : LIST_RECIBOS_GEST ){ logger.debug("RebGes " +pos); map =
				 * pac_iax_traspaso_cartera_age.
				 * ejecutaPAC_IAX_TRASPASO_CARTERA_AGE__F_TRASPASAR_CARTERA(CAGENTE, CAGENTE2,
				 * "RECGES", null, new BigDecimal(pos),
				 * Sproces_In,CTIPCOMI,comisiones,CMOTRASPASO,TOBSERV); logger.debug(map);
				 * //Retorno=(BigDecimal)tratarRETURNyMENSAJES(request, map);
				 * Retorno=this.stringToBigDecimal(String.valueOf(map.get("RETURN")));
				 * Sproces_Out=this.stringToBigDecimal(String.valueOf(map.get("PSPROCES_OUT")));
				 * 
				 * if (isEmpty(Retorno) || Retorno.intValue() != 0) ContRecGesKO++; else
				 * ContRecGesOK++;
				 * 
				 * if (!isEmpty (Sproces_Out)) Sproces_In = Sproces_Out; }
				 * 
				 * 
				 * literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(),
				 * "9901954");
				 * 
				 * 
				 * 
				 * if (ContRecGesKO > 0) MensajeInfo = Constantes.MENSAJE_ERROR; else
				 * MensajeInfo = Constantes.MENSAJE_INFO;
				 * 
				 * AbstractDispatchAction.guardarMensaje (request, "verbatim:" + literal + ": "
				 * + ContRecGesOK + " - " + literal_error + ": " + ContRecGesKO, null,
				 * MensajeInfo); }
				 */
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage008Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (!isEmpty(request.getSession().getAttribute("axisctr014_listaAgentes"))) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");

			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();

		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			// Axisage008Service

			String CONDICION = "TRASPASO_CARTERA";

			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
							new BigDecimal(1), CONDICION);

			/*
			 * mapAgentes = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE,
			 * new BigDecimal(1));
			 */
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		return mapAgentes;
	}

	public void m_ajax_actualiza_persona(HttpServletRequest request) {
		logger.debug("Axissin007Service m_ajax_actualiza_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");

			/*
			 * if (isEmpty(request.getSession().getAttribute("CAGENTE")))
			 * request.getSession().setAttribute("CAGENTE",CAGENTE);
			 * 
			 * if (!isEmpty (request.getSession().getAttribute("CAGENTE")) && isEmpty
			 * (CAGENTE)){ CAGENTE = (BigDecimal)
			 * request.getSession().getAttribute("CAGENTE");
			 * formdata.put("CAGENTE",CAGENTE); }
			 */
			logger.debug("act. person : " + CAGENTE);
			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - m�todo m_ajax_actualiza_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_traspasar(HttpServletRequest request, Axisage008Action thisAction) {

		logger.debug("Axissin011Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE_VISIO = getCampoNumerico(request, "CAGENTE_VISIO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE_PROD = getCampoNumerico(request, "CAGE");
			logger.debug("CAGENTE_PROD ---> " + CAGENTE_PROD);
			logger.debug("CAGENTE_VISIO ---> " + CAGENTE_VISIO);

			formdata.put("CAGENTE_ORI", CAGENTE_PROD);
			formdata.put("CAGENTE", CAGENTE_PROD);
			formdata.put("CAG_AUX", CAGENTE_PROD);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER(SPERSON, CAGENTE_VISIO,
					CAGENTE_PROD);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);

			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CMOTRASPASO = getCampoNumerico(request, "CMOTRASPASO");

		this.cargaListaMotTraspaso(request);
		formdata.put("CMOTRASPASO", CMOTRASPASO);

		this.cargaListaRamos(request);
		BigDecimal VCRAMO = null;

		if ((!isEmpty(request.getAttribute("axisctr_listaRamos"))) && (CRAMO == null)) {
			ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
			// if (lista.size()==1)
			VCRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
		}
		// formdata.put("CRAMO",CRAMO);
		List productos = new ArrayList();
		if (isEmpty(VCRAMO)) {
			productos = dbGetProductos(request, usuario);
		} else {
			productos = dbGetRamProductos(request, VCRAMO);
		}

		// if (!isEmpty(productos)){
		// if ((productos.size()==1)&&(SPRODUC==null)){
		// formdata.put("SPRODUC",(BigDecimal)(((HashMap)productos.get(0)).get("SPRODUC")));
		// }else{
		// formdata.put("SPRODUC",SPRODUC);
		// }
		formdata.put("productos", ((productos == null) ? new ArrayList() : productos));
		// }

		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE_ORI");
		String TAGENTE = getCampoTextual(request, "TAGENTE");
		formdata.put("CAGENTE", CAGENTE);
		logger.debug("CAGENTE_ORI-- :" + CAGENTE);
		logger.debug("TAGENTE_ORI-- :" + TAGENTE);

		String SNIP = this.getCampoTextual(request, "SNIP");

		if (!isEmpty(SPERSON)) {

			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			formdata.putAll(OB_PERSONA);
			formdata.put("CAGENTE", CAGENTE);
			formdata.put("TAGENTE", TAGENTE);
			formdata.put("NNUMIDE2", OB_PERSONA.get("NNUMIDE"));
			formdata.put("NNUMIDE", null);

			String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

			formdata.put("NOMBRE", nomComplet);

			if (isEmpty(SNIP))
				SNIP = (String) OB_PERSONA.get("SNIP");

			tratarRETURNyMENSAJES(request, map);

			String PORIGEN = this.getCampoTextual(request, "ORIGEN");

		}
		// formdata.put("CAGENTE", usuario.getCagente());

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axissin019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

				BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request, CRAMO));

			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin019Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetRamProductos(HttpServletRequest request, BigDecimal CRAMO) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"), CRAMO,
						new BigDecimal(0));
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * Carga la lista inicial de motivos de traspaso.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaMotTraspaso(HttpServletRequest request) throws Exception {
		// Carga de la BD
		PAC_IAX_LISTVALORES pac_listaValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		HashMap map = pac_listaValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001008));
		ArrayList MotTraspas = (ArrayList) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("axisctr_listaMotTraspas", MotTraspas != null ? MotTraspas : new ArrayList());
		MotTraspas = null;
	}

	public void m_ajax_existe_persona(HttpServletRequest request) {
		logger.debug("Axissin017Service AJAX m_ajax_existe_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			String SNIP = getCampoTextual(request, "SNIP");
			BigDecimal CSEXPER = getCampoNumerico(request, "CSEXPER");
			BigDecimal SPERREAL = getCampoNumerico(request, "SPERREAL");
			BigDecimal CAGENTE = isEmpty(getCampoNumerico(request, "CAGENTE"))
					? new BigDecimal(request.getParameter("CAGENTE"))
					: getCampoNumerico(request, "CAGENTE");
			java.sql.Date FNACIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FNACIMI"));
			Map plReturn = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_PERSONA(NNUMIDE, CSEXPER, FNACIMI, SNIP,
					SPERREAL, CAGENTE);
			logger.debug(plReturn);
			ajax.rellenarPlAContenedorAjax(plReturn);
			ajax.guardarContenidoFinalAContenedorAjax(plReturn);
		} catch (Exception e) {
			logger.error("Axissin017Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private List parseComisiones(String strComi) {
		try {
			String[] comisiones = strComi.split("/");
			List lstComi = new ArrayList();

			for (int i = 0; i < comisiones.length; i++) {
				String[] comision = comisiones[i].split("#");
				Map mComis = new HashMap();
				for (int j = 0; j < comision.length; j += 2) {
					mComis.put(comision[j], comision[j + 1]);

				}
				lstComi.add(mComis);
			}

			logger.debug("Prueba");
			return lstComi;
		} catch (Exception e) {
			logger.error("Error en el servicio Axisage008Service - m�todo parseComisiones", e);
			return new ArrayList();
		}

	}
}
