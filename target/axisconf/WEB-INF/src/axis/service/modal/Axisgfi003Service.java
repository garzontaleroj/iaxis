package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.mvc.control.modal.Axisgfi003Action;
import axis.mvc.model.ObIaxGfiparam;
import axis.mvc.model.TIaxGfiparam;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisgfi003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los parametros del combo parametros
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarParametros(HttpServletRequest request, Axisgfi003Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos combo params
		Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_GET_LSTPARAMETROS();
		List params = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(params);

		request.setAttribute("axisgfi_listaParametros", !isEmpty(params) ? params : new ArrayList());

	}

	/**
	 * M�todo que carga los parametros del displayTag
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarParametrosLista(HttpServletRequest request, Axisgfi003Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal PARAMETRO = getCampoNumerico(request, "CLAVE_AXGF002");

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos params de lista
		Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_GET_PARAMETROS(PARAMETRO);
		List params = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(params);

		request.getSession().setAttribute("axisgfi_listaParams", !isEmpty(params) ? params : new ArrayList());

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * importes de las garantia seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisgfi003Action thisAction) {
		logger.debug("Axisgfi003Service m_form");
		Map formula = new HashMap();
		try {
			String parametro_lista = getCampoTextual(request, "lista_parametros");

			if (!isEmpty(parametro_lista)) {
				formula.put("TERMINO", parametro_lista);
				request.setAttribute("axisgfi_formula", formula);
			}

			cargarParametros(request, thisAction);
			cargarParametrosLista(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * //TODO Que le debemos pasar al PL? el valor del combo o como dice el
	 * funcional la lista del displayTag (T_IAX_GFIPARAM)? M�todo que se encarga de
	 * anyadir un valor de param al displayTag de Params
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anadir_parametro_lista(HttpServletRequest request, Axisgfi003Action thisAction) {
		logger.debug("Axisgfi003Service m_anadir_parametro_lista");

		try {
			BigDecimal CLAVE = getCampoNumerico(request, "CLAVE_AXGF002");
			String PARAM = getCampoTextual(request, "lista_parametros");

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			if (!isEmpty(PARAM)) {
				// Carga de las PAC_IAX PL/SQL
				PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Datos params de lista
				Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_SET_GRABARFORMPARAMETROS(
						this.generarT_IAX_GFIPARAM(request, CLAVE, PARAM, null, usuario));
				BigDecimal params = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);
				logger.debug(params);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi003Service - m�todo m_anadir_parametro_lista", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de eliminar un registro del displayTag de Params
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar_parametro_lista(HttpServletRequest request, Axisgfi003Action thisAction) {
		logger.debug("Axisgfi003Service m_eliminar_parametro_lista");
		String PCLAVE = getCampoTextual(request, "CLAVE_BORRAR");
		String PARAMETRO = getCampoTextual(request, "PARAMETRO_BORRAR");

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			// Carga de las PAC_IAX PL/SQL
			PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Datos params de lista
			Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_SET_ELIMINARFORMPARAM(PCLAVE, PARAMETRO);
			BigDecimal params = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			logger.debug(params);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi003Service - m�todo m_anadir_parametro_lista", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que genera un oracle.sql.STRUCT (en este caso OB_IAX_GFI) para poderlo
	 * pasar como param a una funci�n PL.
	 * 
	 * @param parametro
	 * @return
	 * @throws Exception
	 */
	private TIaxGfiparam generarT_IAX_GFIPARAM(HttpServletRequest request, BigDecimal CLAVE, String PARAMETRO,
			String TPARAM, UsuarioBean usuario) throws Exception {
		int n = 1; // numero de parametros
		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxGfiparam[] paramsList = new ObIaxGfiparam[n];
		// primero, llenar los parametros
		{
			ObIaxGfiparam paramObj = null;
			for (int i = 0; i < n; i++) {
				paramObj = new ObIaxGfiparam(CLAVE, PARAMETRO, TPARAM);
				paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_GFIPARAM");
				paramsList[i] = paramObj;
			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxGfiparam params = new TIaxGfiparam(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_GFIPARAM");

		// finalmente, llenar el objeto form
		/*
		 * ObIaxGfiform ForMula=null; { java.math.BigDecimal clave=null; String
		 * codigo=null; String descripcion=null; String formula=null;
		 * java.math.BigDecimal cramo=null; java.math.BigDecimal cutili=null;
		 * java.math.BigDecimal crastro=null; java.math.BigDecimal sumatorio=null;
		 * ForMula=new ObIaxGfiform(clave, codigo, descripcion, formula, cramo, cutili,
		 * crastro, sumatorio, params); ForMula._SQL_NAME=UsuarioBean.fixOwner(USERNAME,
		 * "OB_IAX_GFIFORM"); }
		 */

		return params;
	}
}
