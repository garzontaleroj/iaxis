package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CODIGOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axismnt014Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axismnt014Service.class);

	public void m_form(HttpServletRequest request) {
		logger.debug("Axismnt014Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			this.m_cargar_valores(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, e.getLocalizedMessage(), new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_cargar_valores(HttpServletRequest request) {

		logger.debug("Axismnt014Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_CODIGOS pac_iax_codigos = new PAC_IAX_CODIGOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			/* Lista c�digos */
			Map map = pac_iax_codigos.ejecutaPAC_IAX_CODIGOS__F_GET_TIPCODIGOS();
			logger.debug(map);

			ArrayList codigos = (ArrayList) map.get("PCURTIPCODIGOS");
			if (!isEmpty(codigos)) {
				formdata.put("lstCodigos", codigos);
			}

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("------- Empresas:" + map);
			LISTVALORES.put("EMPRESAS", (List) tratarRETURNyMENSAJES(request, map, false));

			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");

			List listaRamos = this.cargaListaRamos(request);
			LISTVALORES.put("ramos", listaRamos);
			if (!isEmpty(listaRamos) && listaRamos.size() == 1) {
				CRAMO = (BigDecimal) ((HashMap) listaRamos.get(0)).get("CRAMO");
				formdata.put("CRAMO", CRAMO);
			}

			if (this.isEmpty(CRAMO)) {
				LISTVALORES.put("productos", this.dbGetProductos(request, usuario));
			} else {
				LISTVALORES.put("productos", this.dbGetRamProductos(request));

			}

			formdata.put("listValores", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt014Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

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
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	private List cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
		return listaRamos;
	}

	protected String getInfoStringConcatenar(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axismnt014Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_CODIGOS pac_iax_codigos = new PAC_IAX_CODIGOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String idRequest = getCampoTextual(request, "idRequest");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CCOLECT = getCampoNumerico(request, "CCOLECT");
			BigDecimal CIDIOMA = getCampoNumerico(request, "CIDIOMA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CMODALI = getCampoNumerico(request, "CMODALI");
			BigDecimal CTIPSEG = getCampoNumerico(request, "CTIPSEG");

			String PARAMS = this.getInfoStringConcatenar(request);

			/*
			 * "#idRequest;"+OPERACION; PARAMS =
			 * PARAMS+"#cempres;"+CEMPRES+"#"+"cidioma;"+CIDIOMA; PARAMS =
			 * PARAMS+"#cramo;"+CRAMO+"#"+"ccolect;"+CCOLECT+"#"+"cmodali;"+CMODALI+"#"+
			 * "ctipseg;"+CTIPSEG;
			 */
			Map map = pac_iax_codigos.ejecutaPAC_IAX_CODIGOS__F_GET_CODIGOS(PARAMS);
			tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.clear();
			formdata.put("idRequest", idRequest);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisage008Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargarProductos(HttpServletRequest request) {
		logger.debug("Axislist002Service m_ajax_cargarProductos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CPREVIO = this.getCampoNumerico(request, "CPREVIO");
			BigDecimal CCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal CAGRPRO = this.getCampoNumerico(request, "CAGRPRO");
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			logger.debug(CCOMPANI);

			logger.debug(request.getParameter("CCOMPANI"));

			logger.debug(request.getAttribute("CCOMPANI"));
			if (this.isEmpty(CRAMO)) {
				if (this.isEmpty(CCOMPANI))
					ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
				else {
					Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(CCOMPANI, CRAMO);
					logger.debug(map);
					ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
				}

			} else {
				if (this.isEmpty(CCOMPANI))
					ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
				else {
					Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(CCOMPANI, CRAMO);
					logger.debug(map);
					ajax.guardarContenidoFinalAContenedorAjax((List) tratarRETURNyMENSAJES(request, map, false));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist002Service - m�todo m_ajax_cargarProductos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

}
