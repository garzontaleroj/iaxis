package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.mvc.control.modal.Axissin020Action;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin020Service.java
 * 
 * @author <a href="mailto:xpastor@csi-ti.com">Xavi Pastor</a>
 */
public class Axissin020Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/

	/**
	 */
	public

			void m_init(HttpServletRequest request, Axissin020Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin020Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axissin020Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.remove("CTIPDES");
			formdata.remove("SCAUMOT");
			this.cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axissin002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
	}

	private void cargarCombos(HttpServletRequest request, Axissin020Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		try {
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			/* Recuperar lista de idiomas */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_SIN pacIaxListValores_sin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug(map);
			listValores.put("lstempresas", tratarRETURNyMENSAJES(request, map));

			if (((List) listValores.get("lstempresas")).size() == 1) {
				CEMPRES = (BigDecimal) ((HashMap) ((List) listValores.get("lstempresas")).get(0)).get("CEMPRES");
			}
			if (!isEmpty(CEMPRES)) {
				/* Recuperar lista de Ramos */
				String tipo = this.getCampoTextual(request, "tipo");
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, CEMPRES);
				logger.debug(map);
				listValores.put("lstramos", tratarRETURNyMENSAJES(request, map));

				if (VisibleTag.esComponenteVisible(request, "axissin020", "CRAMO")) {
					if (!isEmpty(CRAMO)) {
						map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(tipo, CRAMO,
								new BigDecimal(1));
						logger.debug(map);
						listValores.put("lstproductos", tratarRETURNyMENSAJES(request, map));
					}
				} else {
					Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTPRODUCTOSSIN();
					logger.debug(m);
					listValores.put("lstproductos", tratarRETURNyMENSAJES(request, m));
				}

			}

			map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCASSIN_CODMOTCAU();
			logger.debug(map);
			listValores.put("lstcausas", tratarRETURNyMENSAJES(request, map));

			BigDecimal CCAUSIN = this.getCampoNumerico(request, "CCAUSIN");

			if (!isEmpty(CCAUSIN)) {
				map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTMOTSIN_CODMOTCAU(CCAUSIN);
				logger.debug(map);
				listValores.put("lstmotivos", tratarRETURNyMENSAJES(request, map));

			}

			map = pacIaxListValores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPDESTINATARIO();
			logger.debug(map);
			listValores.put("lstdestinataris", tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio axissin020Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			formdata.put("listValores", listValores);
		}

	}

}
