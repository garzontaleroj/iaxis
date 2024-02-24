package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class AxisServiceDetValores extends AxisBaseService {

	public void addDetvalores(HttpServletRequest request, Integer c, String nombre) {
		List list = null;
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal clave = new BigDecimal(c.toString());
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(clave);
			list = (List) tratarRETURNyMENSAJES(request, mapLs);
			request.setAttribute(nombre, !isEmpty(list) ? list : new ArrayList());
		} catch (Exception e) {
		}

	}

	public void addRamos(HttpServletRequest request, String nombre) {
		List list = null;
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, null);
			List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);
			request.setAttribute(nombre, listaRamos != null ? listaRamos : new ArrayList());
		} catch (Exception e) {
		}
	}

	public void addProductos(HttpServletRequest request, String nombre, BigDecimal ramo) {
		List list = null;
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// INI - AXIS 3999 - ML - CORRECCION DE LLAMADA A METODO RAMPRODUCTOS PARA
			// FILTRO CON RAMO
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(null, ramo, BigDecimal.ZERO);
			// FIN - AXIS 3999 - ML - CORRECCION DE LLAMADA A METODO RAMPRODUCTOS PARA
			// FILTRO CON RAMO
			logger.debug(m);
			List primas = (List) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute(nombre, primas != null ? primas : new ArrayList());
		} catch (Exception e) {
		}
	}

	public void addSucursales(HttpServletRequest request, String nombre, BigDecimal tipo, BigDecimal idioma) {
		List list = null;
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(tipo, idioma, null);
			logger.debug(m);
			List sucursales = (List) tratarRETURNyMENSAJES(request, m, false);
			request.setAttribute(nombre, sucursales != null ? sucursales : new ArrayList());
		} catch (Exception e) {
		}
	}

}
