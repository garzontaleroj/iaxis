package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	ArrayList lstDatos = new ArrayList();

	/**
	 * M�todo que carga las formas de pago del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarFormasPago(HttpServletRequest request) throws Exception {
		boolean vEncontrado = false;
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		lstDatos = new ArrayList();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos display
		Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_GET_FORPAGO(SPRODUC);
		List params = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(params);

		request.setAttribute("axispro_listaFormas", !isEmpty(params) ? params : new ArrayList());

		int i = 0;
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		while (i < params.size() && !vEncontrado) {

			System.out.println(((Map) params.get(i)));
			HashMap mapa = (HashMap) ((Map) params.get(i)).get("OB_IAX_PRODFORMAPAGO");

			BigDecimal valor = (BigDecimal) mapa.get("CPAGDEF");

			if (valor.intValue() == 1) {
				vEncontrado = true;
				// request.setAttribute("FORPAGDEF", valor.intValue());
				formdata.put("FORPAGDEF", ((BigDecimal) mapa.get("CFORPAG")).intValue());
			} else {
				i++;
			}

		}

	}

	/**
	 * M�todo que actualiza las formas de pago del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void actualizarPago(HttpServletRequest request, AjaxContainerService ajax) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG_ACT");
		String TFORPAG = getCampoTextual(request, "TFORPAG_ACT");
		BigDecimal COBLIGA = getCampoNumerico(request, "COBLIGA_ACT");
		BigDecimal PRECFRAC = getCampoNumerico(request, "PRECARG_ACT");
		BigDecimal CPAGDEF = getCampoNumerico(request, "CPAGDEF_ACT");
		BigDecimal CREVFPG = getCampoNumerico(request, "CREVFPG_ACT");

		Map OB_IAX_PRODFORMAPAGO = new HashMap();
		Map temp = new HashMap();
		temp.put("CFORPAG_ACT", CFORPAG);
		temp.put("TFORPAG_ACT", TFORPAG);
		temp.put("COBLIGA_ACT", COBLIGA);
		temp.put("PRECARG_ACT", PRECFRAC);
		temp.put("CPAGDEF_ACT", CPAGDEF);
		temp.put("CREVFPG_ACT", CREVFPG);

		logger.debug("temp: " + temp);
		OB_IAX_PRODFORMAPAGO.put("OB_IAX_PRODFORMAPAGO", temp);
		lstDatos.add(OB_IAX_PRODFORMAPAGO);

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro006Action thisAction) {

		logger.debug("Axispro006Service m_form");

		try {
			cargarFormasPago(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_ajax_actualizar_pago(HttpServletRequest request, Axispro006Action thisAction) {
		logger.debug("Axispro006Service m_ajax_actualizar_pago");
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			actualizarPago(request, ajax);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro006Service - m�todo m_ajax_actualizar_pago", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_setforpago(HttpServletRequest request, Axispro006Action thisAction) {
		logger.debug("Axispro006Service m_ajax_setforpago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			HashMap r = new HashMap();
			PAC_IAX_MNTPROD pac_axis_mntprod = new PAC_IAX_MNTPROD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			for (int i = 0; i < lstDatos.size(); i++) {
				r = (HashMap) lstDatos.get(i);
				HashMap rr = (HashMap) r.get("OB_IAX_PRODFORMAPAGO");
				BigDecimal CFORPAG = (BigDecimal) (rr.get("CFORPAG_ACT"));
				String TFORPAG = (String) (rr.get("TFORPAG_ACT"));
				BigDecimal COBLIGA = (BigDecimal) (rr.get("COBLIGA_ACT"));
				BigDecimal PRECFRAC = (BigDecimal) (rr.get("PRECARG_ACT"));
				BigDecimal CPAGDEF = (BigDecimal) (rr.get("CPAGDEF_ACT"));
				BigDecimal CREVFPG = (BigDecimal) (rr.get("CREVFPG_ACT"));

				Map map = pac_axis_mntprod.ejecutaPAC_IAX_MNTPROD__F_SET_FORPAGO(SPRODUC, CFORPAG, TFORPAG, COBLIGA,
						PRECFRAC, CPAGDEF, CREVFPG);
				logger.debug(map);
				BigDecimal setForPagoReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);
				if (new BigDecimal("0").equals(setForPagoReturn))
					ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
				else
					ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}

			// Datos display

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro006Service - m�todo m_ajax_setforpago", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			if (lstDatos.size() == 0)
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
