package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GESTIONBPM;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisctr213Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr213Service extends AxisBaseService {
	Log log = LogFactory.getLog(this.getClass());
	static Log logger = LogFactory.getLog(Axisctr019Service.class);

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr213Action thisAction) {
		try {
		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Limpia la antigua lista de agentes de sesi�n, en caso que hubiera, para poder
	 * realizar una b�squeda nueva.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisctr213Action thisAction) {
		log.debug("Axisctr213Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			String DONDE = getCampoTextual(request, "DONDE");
			BigDecimal CRAMOSEL = getCampoNumerico(request, "CRAMOSEL");
			BigDecimal SPRODUCSEL = getCampoNumerico(request, "SPRODUCSEL");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NPOLIZASEL = getCampoNumerico(request, "NPOLIZASEL");
			BigDecimal NCERTIFSEL = getCampoNumerico(request, "NCERTIFSEL");
			logger.debug("---> CRAMOSEL:" + CRAMOSEL);
			logger.debug("---> SPRODUCSEL:" + SPRODUCSEL);
			logger.debug("---> NPOLIZASEL:" + NPOLIZASEL);
			logger.debug("---> NCERTIFSEL:" + NCERTIFSEL);

			// request.getSession().removeAttribute("axisctr014_listaAgentes");
			/* LISTVALORES */

			logger.debug("---> DONDE:" + DONDE);
			if (!isEmpty(DONDE)) { // Cuando se tenga la pantalla de consulta de bpm no se cargara el usuario
				formdata.put("DONDE", DONDE);
				formdata.put("USUASIG", usuario.getCusuari());
				formdata.put("BLOQUSUASIG", new BigDecimal(0));
				if (DONDE.equals(new String("AXISCTR001"))) {
					formdata.put("BLOQCRAMO", new BigDecimal(0));
				} else if (DONDE.equals(new String("AXISCTR060"))) {
					formdata.put("BLOQCRAMO", new BigDecimal(0));
					formdata.put("BLOQSPRODUC", new BigDecimal(0));
					formdata.put("TIPMOV", new BigDecimal(10));
				} else if (DONDE.equals(new String("AXISCTR039"))) {
					if (!isEmpty(NCERTIFSEL)) {
						if (NCERTIFSEL.equals(new BigDecimal(0)))
							formdata.put("TIPMOV", new BigDecimal(3));
						else
							formdata.put("TIPMOV", new BigDecimal(11));
					}
				} else if (DONDE.equals(new String("AXISCTR016"))) {
					if (!isEmpty(NCERTIFSEL)) {
						if (NCERTIFSEL.equals(new BigDecimal(0)))
							formdata.put("TIPMOV", new BigDecimal(4));
						else
							formdata.put("TIPMOV", new BigDecimal(12));
					}
				} else if (DONDE.equals(new String("AXISCTR072"))) {
					if (!isEmpty(NCERTIFSEL)) {
						if (NCERTIFSEL.equals(new BigDecimal(0)))
							formdata.put("TIPMOV", new BigDecimal(5));
						else
							formdata.put("TIPMOV", new BigDecimal(13));
					}
				}

			}

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			Map map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(961));
			log.debug(map);
			LISTVALORES.put("LSTESTCASO", tratarRETURNyMENSAJES(request, map));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(964));
			log.debug(map);
			LISTVALORES.put("LSTTIPMOV", tratarRETURNyMENSAJES(request, map));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTUSUARIOSAGENDA();
			log.debug(map);
			LISTVALORES.put("LSTUSUARIOS", tratarRETURNyMENSAJES(request, map));

			formdata.put("LISTVALORES", LISTVALORES);

			this.cargaListaRamos(request);
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);

			if (isEmpty(CRAMO) && !isEmpty(CRAMOSEL)) {
				formdata.put("CRAMO", CRAMOSEL);
				CRAMO = CRAMOSEL;
			}

			List productos = new ArrayList();
			logger.debug("----> CCOMPANI:" + CCOMPANI);

			if (isEmpty(CRAMO) && isEmpty(CCOMPANI))
				productos = dbGetProductos(request, usuario);
			else
				productos = dbGetRamProductos(request);

			if (!isEmpty(productos)) {
				if (productos.size() == 1) {
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
					SPRODUC = (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC"));
				}
			}

			if (isEmpty(SPRODUC) && !isEmpty(SPRODUCSEL)) {
				formdata.put("SPRODUC", SPRODUCSEL);
			}

			if (!isEmpty(NPOLIZASEL)) {
				formdata.put("NPOLIZA", NPOLIZASEL);
			}

			request.getSession().setAttribute("productos", ((productos == null) ? new ArrayList() : productos));

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Dado un NOMBRE y/o un NNUMIDE de un Agente, ejecuta la consulta de b�squeda
	 * de Agentes en BD, y devuelve el resultado en el atributo de sesi�n
	 * axisctr014_listaAgentes.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_busqueda(HttpServletRequest request, Axisctr213Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CODBPM = getCampoNumerico(request, "CODBPM");
			BigDecimal SOLBPM = getCampoNumerico(request, "SOLBPM");
			String USUASIG = getCampoTextual(request, "USUASIG");
			BigDecimal ESTCASO = getCampoNumerico(request, "ESTCASO");
			BigDecimal TIPMOV = getCampoNumerico(request, "TIPMOV");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			String NUMIDE = getCampoTextual(request, "NUMIDE");
			String NOMTOM = getCampoTextual(request, "NOMTOM");

			PAC_IAX_GESTIONBPM pac_iax_gestionbpm = new PAC_IAX_GESTIONBPM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_gestionbpm.ejecutaPAC_IAX_GESTIONBPM__F_GET_CASOS(CODBPM, SOLBPM, USUASIG, ESTCASO,
					TIPMOV, CRAMO, SPRODUC, NPOLIZA, NCERTIF, NUMIDE, NOMTOM);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			formdata.put("LSTCASOS", map.get("RETURN"));

		} catch (Exception e) {
			log.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
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
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		Map m;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(pCOMPANI, getCampoNumerico(request, "CRAMO"));
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
							getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		}

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		logger.debug("-----> compa�ia:" + this.getCampoNumerico(request, "CCOMPANI"));

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CCOMPANI")))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		List listaRamos = dbGetCompaniRams(request);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
	}

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		// Carga de ramos de la BD
		Map map;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(pCOMPANI);
		} else {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}
}
