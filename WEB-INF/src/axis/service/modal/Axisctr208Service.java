package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr208Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr208Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr208Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr208Action thisAction) {
		logger.debug("Axisctr208Service m_init");
		try {
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr208Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr208Service m_form");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String cversion = getCampoTextual(request, "CVERSION");
			String CDISPOSITIVO = getCampoTextual(request, "CDISPOSITIVO");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			logger.debug("---------- axisctr208 VALOR version  :" + cversion);
			logger.debug("---------- axisctr208 VALOR CDISPOSITIVO  :" + CDISPOSITIVO);

			request.getSession().setAttribute("CVERSION", cversion);

			// Lista combustible
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8000912));
			logger.debug(map);
			request.setAttribute("TIPO", (List) tratarRETURNyMENSAJES(request, map));
			map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTDISPOSITIVOS();
			logger.debug(map);
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {

				request.setAttribute("lstdispositivos", tratarRETURNyMENSAJES(request, map));
			}
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map map3 = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_DISPOSITIVOS(NRIESGO);
			logger.debug(map3);

			List no_serie_sel = null;
			if (!isEmpty(map)) {
				no_serie_sel = (List) tratarRETURNyMENSAJES(request, map3);
				logger.debug(no_serie_sel);
				if (!isEmpty(no_serie_sel) && !isEmpty(CDISPOSITIVO)) {
					for (int i = 0; i < no_serie_sel.size(); i++) {
						HashMap mm = (HashMap) no_serie_sel.get(i);
						logger.debug(mm);

						HashMap DISPOSITIVOs = (HashMap) mm.get("OB_IAX_AUTDISPOSITIVOS");
						logger.debug(DISPOSITIVOs);
						String CDISPOSITIVOx = String.valueOf(DISPOSITIVOs.get("CDISPOSITIVO"));
						logger.debug(CDISPOSITIVOx);
						if (CDISPOSITIVO.equals(CDISPOSITIVOx)) {
							// formdata.putAll(DISPOSITIVOs);

							formdata.put("CPROPDISP", DISPOSITIVOs.get("CPROPDISP"));
							formdata.put("FINICONTRATO", DISPOSITIVOs.get("FINICONTRATO"));
							formdata.put("IVALDISP", DISPOSITIVOs.get("IVALDISP"));
							formdata.put("NCONTRATO", DISPOSITIVOs.get("NCONTRATO"));
							formdata.put("CDISPOSITIVO", DISPOSITIVOs.get("CDISPOSITIVO"));
						}

					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr208Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
