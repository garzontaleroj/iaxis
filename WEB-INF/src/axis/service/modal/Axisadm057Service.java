package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ALM;
import axis.mvc.control.modal.Axisadm057Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisadm057Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisadm057Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisadm057Action thisAction) {
		logger.debug("Axisadm057Service m_init");
		try {
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_form(HttpServletRequest request, Axisadm057Action thisAction) {
		logger.debug("Axisadm057Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm057Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

	public void m_aceptar(HttpServletRequest request, Axisadm057Action thisAction) {
		logger.debug("Axisadm057Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			this.formattingNumericValues(request);

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			String TCRITERIO = getCampoTextual(request, "TCRITERIO");
			BigDecimal NORDEN = getCampoNumerico(request, "NORDEN");
			BigDecimal PCREDIBI = getCampoNumerico(request, "PCREDIBI");
			BigDecimal PINTFUT = getCampoNumerico(request, "PINTFUT");

			/*
			 * logger.debug("CEMPRES --> "+CEMPRES);
			 * logger.debug("TCRITERIO --> "+TCRITERIO);
			 * logger.debug("PCREDIBI --> "+PCREDIBI);
			 * logger.debug("PFINTFUT --> "+PFINTFUT);
			 */

			Map map = new PAC_IAX_ALM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_ALM__F_SET_ALMCRITERIO(CEMPRES, TCRITERIO, NORDEN, PCREDIBI, PINTFUT);
			logger.debug("Aceptar ---> " + map);
			// BigDecimal num = (BigDecimal)tratarRETURNyMENSAJES(request, map, false);

			tratarRETURNyMENSAJES(request, map);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(0));
			} else {
				formdata.put("OK", new BigDecimal(1));
			}

			// if (num.intValue() !=0)

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm057Service - m�todo m_calcular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, whoami(this));
		this.cargaDependencias(request, (List) request.getAttribute("DEPENDENCIAS"));
	}

}
