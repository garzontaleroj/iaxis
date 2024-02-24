//Revision:# g3Zr0SE0hKz6eeXkXmqC+g== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_RANGO_DIAN;
import axis.jdbc.PAC_IAX_USER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm205Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm205Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisadm205Action thisAction) {
		logger.debug("Axisadmxx1Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		this.m_form(request, thisAction);
	}

	public void m_form(HttpServletRequest request, Axisadm205Action thisAction) {
		logger.debug("Axisadm205Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		logger.error("entre m_form Axisadm205Service");
		try {

			// this.cargaListasucursales(request);
			// this.dbGetGruposDian(request, usuario);
			this.m_buscar_usuario_205(request, thisAction);
			this.dbGetCramosDian_205(request, usuario);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			// request.setAttribute("MAILS",(List)tratarRETURNyMENSAJES(request, map));

			AjaxContainerService ajax = new AjaxContainerService();
			List getMailsIniReturn = (List) ajax.rellenarPlAContenedorAjax(map);
			request.getSession().removeAttribute("MAILS");

			if (!isEmpty(getMailsIniReturn) && getMailsIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getMailsIniReturn);
				request.getSession().setAttribute("MAILS", getMailsIniReturn);
			}

			Map map1 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002013));

			AjaxContainerService ajax1 = new AjaxContainerService();
			List getEstadosIniReturn = (List) ajax.rellenarPlAContenedorAjax(map1);
			request.getSession().removeAttribute("TESTADOS");

			if (!isEmpty(getEstadosIniReturn) && getEstadosIniReturn.size() > 0) {
				ajax1.guardarContenidoFinalAContenedorAjax((List) getEstadosIniReturn);
				request.getSession().setAttribute("TESTADOS", getEstadosIniReturn);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadmxx1Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargaListasucursales(HttpServletRequest request) throws Exception {
//      UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);          
		logger.debug("Axisadm205Service cargaListasucursales");
		String NOMBRE = getCampoTextual(request, "NOMBRE");
		String NNUMIDE = getCampoTextual(request, "NNUMIDE");
		BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
		String CONDICION = getCampoTextual(request, "CONDICION");
		BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
		BigDecimal TIPAGENTE = new BigDecimal(2);
		HashMap map = null;
		// INI - IAXIS-5100 - JLTS - 23/08/2019. Se ajusta de BigDeciman(1) a
		// BigDecimal(55)
		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE, CAGENTE, new BigDecimal(55),
						CONDICION, TIPAGENTE);
		// INI - IAXIS-5100 - JLTS - 23/08/2019
		logger.debug(map);
		List listaAgentes = (List) tratarRETURNyMENSAJES(request, map);
		request.getSession().setAttribute("listaSucursales", listaAgentes);
	}

	/*
	 * private void dbGetGruposDian(HttpServletRequest request, UsuarioBean usuario)
	 * throws Exception{
	 * 
	 * Map m = new
	 * PAC_IAX_RANGO_DIAN((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)).ejecutaPAC_IAX_RANGO_DIAN__F_GET_GRUPOSDIAN(); logger.debug(m);
	 * List gruposDian = (List)tratarRETURNyMENSAJES (request, m,false);
	 * 
	 * request.getSession().setAttribute("gruposdian", gruposDian ); }
	 */

	private void dbGetCramosDian_205(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		Map m = new PAC_IAX_RANGO_DIAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(usuario.getCempres());
		logger.debug(m);
		List cramos = (List) tratarRETURNyMENSAJES(request, m, false);

		request.getSession().setAttribute("cramos", cramos);
	}

	public List f_cargar_listaVersionesDian(HttpServletRequest request, Axisadm205Action thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SRDIAN = getCampoNumerico(request, "SRDIAN");
		BigDecimal RESOLUCION = getCampoNumerico(request, "RESOLUCION");
		BigDecimal SUCURSAL = getCampoNumerico(request, "SUCURSAL");
		String CGRUPO = getCampoTextual(request, "CGRUPO");
		String DESCRIP = getCampoTextual(request, "DESCRIPCION");
		String USUARIO = getCampoTextual(request, "CUSU");
		BigDecimal MAIL = getCampoNumerico(request, "MAIL");
		BigDecimal ACTIVIDAD = getCampoNumerico(request, "CACTIVI");
		BigDecimal RAMOS = getCampoNumerico(request, "RAMOS");
		BigDecimal TESTADO = getCampoNumerico(request, "TESTADO");
		Map map = new PAC_IAX_RANGO_DIAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_RANGO_DIAN__F_GET_VERSIONESDIAN(SRDIAN, RESOLUCION, DESCRIP, RAMOS, ACTIVIDAD, CGRUPO,
						SUCURSAL, USUARIO, MAIL, TESTADO);
		List plListaVersionesDian = (List) tratarRETURNyMENSAJES(request, map);

		request.setAttribute("axisadm205_plListaVersionesDian", plListaVersionesDian);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		return plListaVersionesDian;
	}

	public void m_buscar_usuario_205(HttpServletRequest request, Axisadm205Action thisAction) {
		logger.debug("Axisadm206Service m_buscar_usuario_205");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_USER pacIaxUser = new PAC_IAX_USER((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = usuario.getCempres();
			String USER = null;
			String USERNAME = getCampoTextual(request, "USERNAME");
			BigDecimal CDELEGA = getCampoNumerico(request, "CDELEGA");

			Map map = pacIaxUser.ejecutaPAC_IAX_USER__F_CONSULTA_USUARIOS(CEMPRES, USER, USERNAME, CDELEGA);
			logger.debug(map);

//            formdata.put("LSTUSUARIOS", tratarRETURNyMENSAJES(request, map,false)); 
			List getUsuarioIniReturn = (List) ajax.rellenarPlAContenedorAjax(map);
			request.getSession().removeAttribute("LSTUSUARIOS");

			if (!isEmpty(getUsuarioIniReturn) && getUsuarioIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getUsuarioIniReturn);
				request.getSession().setAttribute("LSTUSUARIOS", getUsuarioIniReturn);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisusu002Service  -  m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_selected_grupo_205(HttpServletRequest request) {
		logger.debug("Axisadm205Service AJAX m_ajax_selected_grupo_205");
		// UsuarioBean
		// usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			String NOMBRE = getCampoTextual(request, "NOMBRE");
			String NNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			String CONDICION = getCampoTextual(request, "CONDICION");
			BigDecimal PARTNER = getCampoNumerico(request, "PARTNER");
			BigDecimal TIPAGENTE = new BigDecimal(2);
			// INI - IAXIS-5100 - JLTS - 23/08/2019. Se ajusta de BigDeciman(1) a
			// BigDecimal(55)
			Map plReturn = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_TIPAGE_COND(NNUMIDE, NOMBRE,
					CAGENTE, new BigDecimal(55), CONDICION, TIPAGENTE);
			// INI - IAXIS-5100 - JLTS - 23/08/2019
			logger.debug(plReturn);
			List getSucursalIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("listaSucursales");

			if (!isEmpty(getSucursalIniReturn) && getSucursalIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getSucursalIniReturn);
				request.getSession().setAttribute("listaSucursales", getSucursalIniReturn);
			}

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_selected_grupo_205 - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_selected_ramos_205(HttpServletRequest request) {
		logger.debug("Axisadm205Service AJAX m_ajax_selected_ramos_205");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			BigDecimal RAMOS = getCampoNumerico(request, "CRAMO");
			Map plReturn = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(null, RAMOS);
			logger.debug(plReturn);
			List getRamosIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("actividadesramos");

			if (!isEmpty(getRamosIniReturn) && getRamosIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getRamosIniReturn);
				request.getSession().setAttribute("actividadesramos", getRamosIniReturn);
			}

		} catch (Exception e) {
			logger.error("Axisadm205Service m_ajax_selected_ramos_205 - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_selected_activi_205(HttpServletRequest request) {
		logger.debug("Axisadm205Service AJAX m_ajax_selected_activi");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			BigDecimal RAMOS = getCampoNumerico(request, "CRAMO");
			BigDecimal ACTIVIDAD = getCampoNumerico(request, "CACTIVI");
			Map plReturn = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODACTIVIDAD(RAMOS, ACTIVIDAD);
			logger.debug(plReturn);
			List getProductoIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("actividadesproducto");

			if (!isEmpty(getProductoIniReturn) && getProductoIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getProductoIniReturn);
				request.getSession().setAttribute("actividadesproducto", getProductoIniReturn);
			}

		} catch (Exception e) {
			logger.error("Axisadm205Service m_ajax_selected_ramos_205 - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

}
