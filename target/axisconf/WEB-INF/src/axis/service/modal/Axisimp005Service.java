package axis.service.modal;

import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPUESTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisimp005Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 30/12/2008
 * @since Java 5.0
 */
public class Axisimp005Service extends AxisBaseService {
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
		logger.debug("Axisimp005Service m_form");
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

			if ("false".equals(getCampoTextual(request, "isNew"))) {

				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

				Map ramos = new HashMap();
				Map productos = new HashMap();
				Map actividades = new HashMap();
				Map garantias = new HashMap();
				Map conceptos = new HashMap();
				Map formasPago = new HashMap();
				Map tiposConcepto = new HashMap();

				PAC_IAX_IMPUESTOS pacIaxImpuestos = new PAC_IAX_IMPUESTOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Recuperar el impuesto especificado
				// Le paso todos los par�metros desde el modal AXISIMP004, as� me evito tener
				// que hacer una llamada a BBDD (ya la he hecho al buscar desde el modal
				// AXISIMP003)

				if (!isEmpty(CEMPRES)) {
					conceptos = pacIaxImpuestos.ejecutaPAC_IAX_IMPUESTOS__F_GET_CCONCEP_EMP(CEMPRES);
					logger.debug(conceptos);
					request.getSession().setAttribute("IMP_LSTCONCEPTOS", tratarRETURNyMENSAJES(request, conceptos));

					// Cargar Ramos
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug(ramos);
					request.getSession().setAttribute("IMP_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					// Cargar Tipos Concepto
					tiposConcepto = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(BigDecimal.valueOf(313));
					logger.debug(tiposConcepto);
					request.getSession().setAttribute("IMP_LSTTIPOSCONCEPTO",
							tratarRETURNyMENSAJES(request, tiposConcepto));
				}

				// Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ONE; // TODO: Hard-coded CTERMFIN
					String tipo = this.getCampoTextual(request, "tipo");
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, CRAMO, CTERMFIN);
					logger.debug(productos);
					request.getSession().setAttribute("IMP_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				}

				// Cargar Actividades
				if (!isEmpty(SPRODUC) && !isEmpty(CRAMO)) {
					actividades = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);
					logger.debug(actividades);
					request.getSession().setAttribute("IMP_LSTACTIVIDADES",
							tratarRETURNyMENSAJES(request, actividades));
				}

				// Cargar Formas de Pago
				if (!isEmpty(SPRODUC))
					formasPago = pacIaxImpuestos.ejecutaPAC_IAX_IMPUESTOS__F_GET_CFORPAG(SPRODUC);
				logger.debug(formasPago);
				request.getSession().setAttribute("IMP_LSTFORMASPAGO", tratarRETURNyMENSAJES(request, formasPago));

				// Cargar garant�as
				if (!isEmpty(SPRODUC) && !isEmpty(CRAMO) && !isEmpty(CACTIVI)) {
					garantias = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, CRAMO, CACTIVI);
					logger.debug(garantias);
					request.getSession().setAttribute("IMP_LSTGARANTIAS", tratarRETURNyMENSAJES(request, garantias));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp005Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		logger.debug("Axisimp005Service m_actualizar_combos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map<String, Map> ajaxResponse = new HashMap<String, Map>();

		try {
			char comboOrigen = getCampoTextual(request, "comboOrigen").charAt(0);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");

			Map ramos = new HashMap();
			Map productos = new HashMap();
			Map actividades = new HashMap();
			Map garantias = new HashMap();
			Map conceptos = new HashMap();
			Map formasPago = new HashMap();
			Map tiposConcepto = new HashMap();

			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_IMPUESTOS pacIaxImpuestos = new PAC_IAX_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			switch (comboOrigen) {
			case 'E': // Cargar Conceptos
				if (!isEmpty(CEMPRES)) {
					conceptos = pacIaxImpuestos.ejecutaPAC_IAX_IMPUESTOS__F_GET_CCONCEP_EMP(CEMPRES);
					logger.debug(conceptos);
					ajax.rellenarPlAContenedorAjax(conceptos);
					ajaxResponse.put("CCONCEP", conceptos);
					request.getSession().setAttribute("IMP_LSTCONCEPTOS", tratarRETURNyMENSAJES(request, conceptos));

					// Cargar Ramos
					ramos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CRAMO_EMP(CEMPRES);
					logger.debug(ramos);
					ajax.rellenarPlAContenedorAjax(ramos);
					ajaxResponse.put("CRAMO", ramos);
					request.getSession().setAttribute("IMP_LSTRAMOS", tratarRETURNyMENSAJES(request, ramos));

					// Cargar Tipos Concepto
					tiposConcepto = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(BigDecimal.valueOf(313));
					logger.debug(tiposConcepto);
					ajax.rellenarPlAContenedorAjax(tiposConcepto);
					ajaxResponse.put("CTIPCON", tiposConcepto);
					request.getSession().setAttribute("IMP_LSTTIPOSCONCEPTO",
							tratarRETURNyMENSAJES(request, tiposConcepto));
				}
				break;

			case 'R': // Cargar Productos
				if (!isEmpty(CRAMO)) {
					BigDecimal CTERMFIN = BigDecimal.ONE; // TODO: Hard-coded CTERMFIN
					String tipo = this.getCampoTextual(request, "tipo");
					productos = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, CRAMO, CTERMFIN);
					logger.debug(productos);
					ajax.rellenarPlAContenedorAjax(productos);
					ajaxResponse.put("SPRODUC", productos);
					request.getSession().setAttribute("IMP_LSTPRODUCTOS", tratarRETURNyMENSAJES(request, productos));
				}
				break;

			case 'P': // Cargar Actividades
				if (!isEmpty(SPRODUC) && !isEmpty(CRAMO)) {
					actividades = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(SPRODUC, CRAMO);
					logger.debug(actividades);
					ajax.rellenarPlAContenedorAjax(actividades);
					ajaxResponse.put("CACTIVI", actividades);
					request.getSession().setAttribute("IMP_LSTACTIVIDADES",
							tratarRETURNyMENSAJES(request, actividades));
				}

				// Cargar Formas de Pago
				if (!isEmpty(SPRODUC))
					formasPago = pacIaxImpuestos.ejecutaPAC_IAX_IMPUESTOS__F_GET_CFORPAG(SPRODUC);
				logger.debug(formasPago);
				ajax.rellenarPlAContenedorAjax(formasPago);
				ajaxResponse.put("CFORPAG", formasPago);
				request.getSession().setAttribute("IMP_LSTFORMASPAGO", tratarRETURNyMENSAJES(request, formasPago));
				break;

			case 'A': // Cargar garant�as
				if (!isEmpty(SPRODUC) && !isEmpty(CRAMO) && !isEmpty(CACTIVI)) {
					garantias = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC, CRAMO, CACTIVI);
					logger.debug(garantias);
					ajax.rellenarPlAContenedorAjax(garantias);
					ajaxResponse.put("CGARANT", garantias);
					request.getSession().setAttribute("IMP_LSTGARANTIAS", tratarRETURNyMENSAJES(request, garantias));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp005Service - m�todo m_actualizar_combos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Realiza una b�squeda de impuestos, seg�n los par�metros seleccionados en el
	 * modal.
	 * 
	 * @param request - El HttpServletRequest que contiene la petici�n del usuario.
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisimp005Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CCONCEP = getCampoNumerico(request, "CCONCEP");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal NCONCEP = getCampoNumerico(request, "NCONCEP");
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			BigDecimal CTIPCON = getCampoNumerico(request, "CTIPCON");
			BigDecimal NVALCON = getCampoNumerico(request, "NVALCON");
			BigDecimal CFRACCI = getCampoNumerico(request, "CFRACCI");
			BigDecimal CBONIFI = getCampoNumerico(request, "CBONIFI");
			BigDecimal CRECFRA = getCampoNumerico(request, "CRECFRA");
			java.sql.Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));

			// Llamada a PL/SQL
			PAC_IAX_IMPUESTOS pacIaxImpuestos = new PAC_IAX_IMPUESTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxImpuestos.ejecutaPAC_IAX_IMPUESTOS__F_SET_IMPREC(CCONCEP, CEMPRES, NCONCEP, CFORPAG, CRAMO,
					SPRODUC, CACTIVI, CGARANT, FINIVIG, CTIPCON, NVALCON, CFRACCI, CBONIFI, CRECFRA);

			logger.debug(map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (isEmpty(map.get("MENSAJES")) && BigDecimal.ZERO.equals(RETURN)) {
				// Grabaci�n exitosa. Borramos atributos guardados en Session por el Ajax.
				borrarAtributosSession(request);
				request.setAttribute("grabarOK", true);
				// Realizar una b�squeda con los par�metros actuales
				request.setAttribute("repetirBusqueda", true);
				new Axisimp003Service().m_aceptar(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp005Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Borra los atributos de Session/Ajax del modal.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void borrarAtributosSession(HttpServletRequest request) {
		logger.debug("Axisimp005Service borrarAtributosSession");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("IMP_") && !attribute.startsWith("IMP_LSTIMPUESTOS"))
				request.getSession().removeAttribute(attribute);
		}
	}

}
