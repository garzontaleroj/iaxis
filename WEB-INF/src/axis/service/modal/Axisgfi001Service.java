package axis.service.modal;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisgfi001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisgfi001Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisgfi001Service.class);

	/**
	 * M�todo que carga las claves del combo claves
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarClaves(HttpServletRequest request, Axisgfi001Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos claves
		Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_GET_CLAVES();
		List claves = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(claves);

		request.setAttribute("axisgfi_listaClaves", !isEmpty(claves) ? claves : new ArrayList());

	}

	/**
	 * M�todo que carga los ramos del combo Ramos
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarRamos(HttpServletRequest request, Axisgfi001Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_gfi = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		String tipo = this.getCampoTextual(request, "tipo");
		// Datos ramos
		Map map = pac_axis_gfi.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List ramos = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(ramos);

		request.setAttribute("axisgfi_listaRamos", !isEmpty(ramos) ? ramos : new ArrayList());

	}

	/**
	 * M�todo que carga los rastros del combo Rastros
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarRastros(HttpServletRequest request, Axisgfi001Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos rastros
		Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_GET_RASTRO();
		List rastros = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(rastros);

		request.setAttribute("axisgfi_listaRastros", !isEmpty(rastros) ? rastros : new ArrayList());

	}

	/**
	 * M�todo que carga las utilidades del combo utilidades
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarUtilis(HttpServletRequest request, Axisgfi001Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_GFI pac_axis_gfi = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos utilis
		Map map = pac_axis_gfi.ejecutaPAC_IAX_GFI__F_GET_UTILI();
		List utilis = (List) tratarRETURNyMENSAJES(request, map, false);
		logger.debug(utilis);

		request.setAttribute("axisgfi_listaUtilis", !isEmpty(utilis) ? utilis : new ArrayList());
	}

	public void m_form(HttpServletRequest request, Axisgfi001Action thisAction) {
		try {
			cargarClaves(request, thisAction);
			cargarRamos(request, thisAction);
			cargarRastros(request, thisAction);
			cargarUtilis(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}