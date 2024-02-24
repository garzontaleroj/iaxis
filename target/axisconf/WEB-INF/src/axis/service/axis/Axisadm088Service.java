package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COBRADOR;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm088Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisadm088Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/******************************************************
	 * z
	 ***************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisadm088Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Carga la lista de todos los Ramos y carga el Agente inicial.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisadm088Action thisAction) {
		logger.debug("Axisadm088Service m_form");
		try {
			//
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			Map LISTVALORES = new HashMap();
			//
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));
			formdata.put("LISTVALORES", LISTVALORES);
			//
			BigDecimal CEMPRES = usuario.getCempres();
			Map LVCOBBANCORG = new HashMap();
			//
			pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapCobBancOrg = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES_ALL(CEMPRES);
			logger.debug(mapCobBancOrg);
			LVCOBBANCORG.put("LSTCOBBANORG", tratarRETURNyMENSAJES(request, mapCobBancOrg));
			formdata.put("LVCOBBANCORG", LVCOBBANCORG);
			//
			Map LVCOBBANCDEST = new HashMap();
			//
			pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapCobBancDest = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDESCCOBRADORES(CEMPRES);
			logger.debug(mapCobBancDest);
			LVCOBBANCDEST.put("LSTCOBBANDEST", tratarRETURNyMENSAJES(request, mapCobBancDest));
			formdata.put("LVCOBBANCDEST", LVCOBBANCDEST);
			//
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza una b�squeda de Bancos por Ajax.
	 * 
	 * @see buscaBancos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_bancos(HttpServletRequest request) {
		logger.debug("Axisadm088Service m_ajax_busqueda_bancos");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaBancos(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm088Service - m�todo m_ajax_busqueda_bancos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de bancos en la BD en funci�n del cobrador bancario
	 * seleccionado (CCOBBAN).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private List buscaBancos(HttpServletRequest request) throws Exception {
		//
		BigDecimal CCOBBAN = getCampoNumerico(request, "COBBANORG");
		//
		Map map = new PAC_IAX_COBRADOR((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_COBRADOR__F_GET_COBRADOR_SEL(CCOBBAN, null);
		logger.debug("----> Cobradores_sel:" + map.get("PCCOBBANSEL"));
		request.getSession().setAttribute("axisctr_listaBancos", map.get("PCCOBBANSEL"));
		//
		return (List) request.getSession().getAttribute("axisctr_listaBancos");
		//
	}

	/**
	 * Realiza una b�squeda de Bancos por Ajax.
	 * 
	 * @see m_accion_aceptar
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_accion_aceptar(HttpServletRequest request) {
		//
		logger.debug("Axisadm088Service m_accion_aceptar");
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		//
		try {
			//
			BigDecimal CODEMPRESA = getCampoNumerico(request, "CODEMPRESA");
			BigDecimal COBBANCORIGEN = getCampoNumerico(request, "COBBANCORIGEN");
			String BANCOSATRASPASAR = getCampoTextual(request, "BANCOSATRASPASAR");
			BigDecimal COBBANCDESTINO = getCampoNumerico(request, "COBBANCDESTINO");
			//
			BigDecimal Retorno;
			//
			int ContBancoOK;
			int ContBancoKO;
			int MensajeInfo;
			//
			String literal;
			String literal_error = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "105413");
			//
			logger.debug("----> *CODEMPRESA: " + CODEMPRESA + " - *COBBANCORIGEN: " + COBBANCORIGEN
					+ " - *BANCOSATRASPASAR: " + BANCOSATRASPASAR + " - *COBBANCDESTINO: " + COBBANCDESTINO);
			//
			String[] LIST_BANCOS = null;
			//
			if (!BANCOSATRASPASAR.equals("undefined"))
				LIST_BANCOS = BANCOSATRASPASAR.split("\\|");
			//
			PAC_IAX_COBRADOR pac_iax_cobrador = new PAC_IAX_COBRADOR(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			//
			ContBancoOK = 0;
			ContBancoKO = 0;
			//
			if (!isEmpty(LIST_BANCOS)) {
				//
				Map map;
				//
				for (String pos : LIST_BANCOS) {
					//
					if (!isEmpty(pos)) {
						//
						logger.debug("----> *Banco " + pos);
						//
						map = pac_iax_cobrador.ejecutaPAC_IAX_COBRADOR__F_TRASPASO_COBRADORES(CODEMPRESA, COBBANCORIGEN,
								new BigDecimal(pos), COBBANCDESTINO);
						logger.debug(map);
						//
						Retorno = this.stringToBigDecimal(String.valueOf(map.get("RETURN")));
						//
						if (isEmpty(Retorno) || Retorno.intValue() != 0) {
							//
							ContBancoKO++;
							//
						} else {
							//
							ContBancoOK++;
							//
						}
						//
					}
					//
				}
				//
				literal = Traductor.traducir(AxisBaseService.getLocale(request).toString(), "9904574");
				//
				if (ContBancoKO > 0) {
					//
					MensajeInfo = Constantes.MENSAJE_ERROR;
					//
				} else {
					//
					MensajeInfo = Constantes.MENSAJE_INFO;
					//
				}
				//
				AbstractDispatchAction.guardarMensaje(request,
						"verbatim:" + literal + ": " + ContBancoOK + " - " + literal_error + ": " + ContBancoKO, null,
						MensajeInfo);
				//
			}
			//
		} catch (Exception e) {
			//
			logger.error("Error en el servicio Axisadm088Service - m�todo m_accion_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			//
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			//
		}
		//
	}
}