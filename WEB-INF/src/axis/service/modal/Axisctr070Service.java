package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INSPECCION;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_PRODUCCION_AUT;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr070Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axisctr070Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axisctr070Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axisctr070Action thisAction) {
		logger.debug("Axisctr070Service m_init");
		try {
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr070Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr070Service m_form");
		try {
			this.formattingNumericValues(request);
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			String MODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			String cversion = getCampoTextual(request, "CVERSION");
			String CACCESORIO = getCampoTextual(request, "CACCESORIO");
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			logger.debug("---------- axisctr070 VALOR version  :" + cversion);
			logger.debug("---------- axisctr070 VALOR CACCESORIO  :" + CACCESORIO);

			request.getSession().setAttribute("CVERSION", cversion);

			// Lista combustible
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(292));
			logger.debug(map);
			request.setAttribute("TIPO", (List) tratarRETURNyMENSAJES(request, map));
			map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTACCESORIOS();
			logger.debug(map);
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {

				request.setAttribute("lstaccesorios", tratarRETURNyMENSAJES(request, map));
			}
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map map3 = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_ACCESORIOS(NRIESGO);
			logger.debug(map3);

			List no_serie_sel = null;
			if (!isEmpty(map)) {
				no_serie_sel = (List) tratarRETURNyMENSAJES(request, map3);
				logger.debug(no_serie_sel);
				if (!isEmpty(no_serie_sel) && !isEmpty(CACCESORIO)) {
					for (int i = 0; i < no_serie_sel.size(); i++) {
						HashMap mm = (HashMap) no_serie_sel.get(i);
						logger.debug(mm);

						HashMap accesorios = (HashMap) mm.get("OB_IAX_AUTACCESORIOS");
						logger.debug(accesorios);
						String CACCESORIOx = String.valueOf(accesorios.get("CACCESORIO"));
						logger.debug(CACCESORIOx);
						if (CACCESORIO.equals(CACCESORIOx)) {
							// formdata.putAll(accesorios);

							formdata.put("CTIPO", accesorios.get("CTIPACC"));
							formdata.put("TTACCESORIO", accesorios.get("TDESACC"));
							formdata.put("IIVALPUBL", accesorios.get("IVALACC"));
							formdata.put("CASEGURABLE", accesorios.get("CASEGURABLE"));
							formdata.put("CACCESORIO", accesorios.get("CACCESORIO"));
						}

					}
				}
			}

			map = new PAC_IAX_PRODUCCION_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION_AUT__F_LEE_RIESAUTO(NRIESGO);
			logger.debug("------ auto recuperado:" + map);
			map = (Map) tratarRETURNyMENSAJES(request, map);

			PAC_IAX_INSPECCION PAC_IAX_INSPECCION = new PAC_IAX_INSPECCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mmm = (Map) PAC_IAX_INSPECCION.ejecutaPAC_IAX_INSPECCION__F_TIENE_INSPEC_VIGENTE(SSEGURO, NMOVIMI,
					NRIESGO, String.valueOf((BigDecimal) map.get("CTIPMAT")), (String) map.get("CMATRIC"), SPRODUC, "",
					MODO);
			logger.debug(mmm + "mmm.get(\"PINSPECCION_VIGENTE\"):" + mmm.get("PINSPECCION_VIGENTE"));
			formdata.put("INSPECCION_VIGENTE", mmm.get("PINSPECCION_VIGENTE"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr070Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
