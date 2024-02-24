package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisgfi031Action;
import axis.mvc.model.ObIaxGfiform;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisgfi031Service extends AxisBaseService {

	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */
	public void m_form(HttpServletRequest request, Axisgfi031Action thisAction) {
		logger.debug("Axisgfi031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA), mapa = null;

		try {
			BigDecimal PCLAVE = (BigDecimal) getCampoNumerico(request, "CLAVE");
			/* Recuperamos el �rbol de f�rmulas */

			if (PCLAVE != null) {
				Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GFI__F_GET_FORMULA(PCLAVE);
				logger.debug(map);
				mapa = (Map) tratarRETURNyMENSAJES(request, map);
			}
			/* recuperar combos */
			this.recuperarCombos(request, thisAction);

			request.setAttribute("axisgfi0031_detalle_formula", mapa);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisgfi031Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void recuperarCombos(HttpServletRequest request, Axisgfi031Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datos_formula = new HashMap();
		try {
			/* Recuperamos el combo RAMO */
			String tipo = this.getCampoTextual(request, "tipo");
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
			List comboRamo = (List) tratarRETURNyMENSAJES(request, map, false);
			datos_formula.put("RAMO", comboRamo);
			logger.debug(comboRamo);

			/* Recuperamos el combo RASTRO */

			map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_RASTRO();
			List comboRastro = (List) tratarRETURNyMENSAJES(request, map, false);
			datos_formula.put("RASTRO", comboRastro);
			logger.debug(comboRastro);

			/* Recurpermos el combo UTILIZADO */
			map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_UTILI();
			List comboUtil = (List) tratarRETURNyMENSAJES(request, map, false);
			datos_formula.put("UTIL", comboUtil);
			logger.debug(comboUtil);

			/* Guardamos el arbol de f�rmulas y los datos */
			request.setAttribute("axisgfi002_datos_formula", datos_formula);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi031Service - m�todo recuperarCombos", e);
			// AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] {
			// e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*
	 * Recarga la pantalla con los datos de la f�rmula seleccionada en el arbol de
	 * la parte izquierda de la pantalla
	 **/

	public void m_recargar(HttpServletRequest request, Axisgfi031Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datos_formula = new HashMap();
		Map mapa = new HashMap();
		try {
			BigDecimal PCLAVE = (BigDecimal) getCampoNumerico(request, "PCLAVE");
			/* Recuperamos el �rbol de f�rmulas */

			if (PCLAVE != null) {
				Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GFI__F_GET_FORMULA(PCLAVE);
				logger.debug(map);
				mapa = (Map) tratarRETURNyMENSAJES(request, map);
				// ArrayList lstobj = (ArrayList)mapa.get("RETURN");
				formdata.putAll(mapa);

			}
			/* recuperar combos */
			this.recuperarCombos(request, thisAction);

			request.setAttribute("axisgfi031_detalle_formula", mapa);
			request.setAttribute("last_operation", "recarga");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi031Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*
	 * Description: Guarda la formula cuando le damos al boton Aceptar de la
	 * pantalla ("Guardar") Author: JMB Date: 30/03/2012
	 */
	public void m_grabar_formula(HttpServletRequest request, Axisgfi031Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		ObIaxGfiform ForMula = null;

		logger.debug("Axisgfi031Service m_grabar_formula");

		try {

			String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData()
					.getUserName();

			/* crear objeto */
			BigDecimal clave = getCampoNumerico(request, "CLAVE");
			String codigo = getCampoTextual(request, "CODIGO");
			String descripcion = getCampoTextual(request, "DESCRIPCION");
			String formula = getCampoTextual(request, "FORMULA");
			BigDecimal cramo = getCampoNumerico(request, "CRAMO");
			BigDecimal cutili = getCampoNumerico(request, "CUTILI");
			BigDecimal crastro = getCampoNumerico(request, "CRASTRO");
			java.math.BigDecimal sumatorio = !isEmpty(getCampoNumerico(request, "SUMATORIO"))
					? getCampoNumerico(request, "SUMATORIO")
					: BigDecimal.valueOf(0);

			ForMula = new ObIaxGfiform(clave, codigo, descripcion, formula, cramo, cutili, crastro, sumatorio, null);
			ForMula._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_GFIFORM"); // !

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABAR_FORMULA(ForMula);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
				formdata.put("loading", "1");
				request.setAttribute("loading", "1");
				formdata.put("CLAVE_OUT", map.get("PSCLAVE"));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi031Service - m�todo m_grabar_formula", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

}
