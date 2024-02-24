package axis.service.axis;

import java.math.BigDecimal;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisimp004Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 19/12/2008
 * @since Java 5.0
 */
public class Axisimp004Service extends AxisBaseService {
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
		logger.debug("Axisimp004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			Map tiposConcepto = new HashMap();
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			// Cargar Tipos Concepto
			tiposConcepto = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(BigDecimal.valueOf(313));
			logger.debug(tiposConcepto);
			request.getSession().setAttribute("IMP_LSTTIPOSCONCEPTO", tratarRETURNyMENSAJES(request, tiposConcepto));

			// Buscar empresa seleccionada en el modal AXISIMP003
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (!isEmpty(CEMPRES)) {
				Map map = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaF_DESEMPRESA(CEMPRES, null, "");
				logger.debug(map);

				if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
					formdata.put("TEMPRES", map.get("PTEMPRES"));
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimp004Service - m�todo m_form", e);
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
	 * Borra los atributos de Session/Ajax del flujo.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void borrarAtributosSession(HttpServletRequest request) {
		logger.debug("Axisimp004Service borrarAtributosSession");

		/* Quitar datos de otras b�squedas que hayan quedado en Session */
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("IMP_"))
				request.getSession().removeAttribute(attribute);
		}
	}

}
