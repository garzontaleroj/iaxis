package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro014Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro014Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axispro014Action thisAction) {
		logger.debug("Axispro014Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			BigDecimal PCUTILI = getCampoNumerico(request, "CUTILI");

			formdata.put("CUTILI", PCUTILI);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_FORMULASGARAN(SPRODUC, PCACTIVI, PCGARANT);
			logger.debug(map);

			List T_IAX_PRODGARFORMULAS = new ArrayList();
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
				List x = (List) tratarRETURNyMENSAJES(request, map);

				for (int i = 0; i < x.size(); i++) {
					if (((Map) ((Map) x.get(i)).get("OB_IAX_PRODGARFORMULAS")).get("CUTILI").equals(PCUTILI)) {
						T_IAX_PRODGARFORMULAS.add(((Map) x.get(i)).get("OB_IAX_PRODGARFORMULAS"));
					}
				}
			}

			formdata.put("T_IAX_PRODGARFORMULAS", T_IAX_PRODGARFORMULAS);

			// map = new
			// PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTFORMULAS(SPRODUC);
			map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_CLAVES();
			logger.debug(map);

			List LSTFORMULAS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTFORMULAS", LSTFORMULAS);

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCODCAMPO(PCUTILI);
			logger.debug(map);
			List LSTCODIGOS = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("LSTCODIGOS", LSTCODIGOS);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro014Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	public void m_modificarFormula(HttpServletRequest request, Axispro014Action thisAction) {
		logger.debug("Axispro014Service m_modificarFormula");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			String PCCAMPO = getCampoTextual(request, "PCCAMPO");
			BigDecimal PCLAVE = getCampoNumerico(request, "PCLAVE");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_SET_PRODGARFORMULAS(SPRODUC, PCACTIVI, PCGARANT, PCCAMPO, PCLAVE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro014Service - m�todo m_modificarFormula", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_borrarFormula(HttpServletRequest request, Axispro014Action thisAction) {
		logger.debug("Axispro014Service m_borrarFormula");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "PCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "PCGARANT");
			String PCCAMPO = getCampoTextual(request, "PCCAMPO");
			BigDecimal PCLAVE = getCampoNumerico(request, "PCLAVE");

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_DEL_PRODGARFORMULAS(SPRODUC, PCACTIVI, PCGARANT, PCCAMPO, PCLAVE);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro014Service - m�todo m_modificarFormula", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}