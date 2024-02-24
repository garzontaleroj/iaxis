//Revision:# teoyNI8X34+aiF1txbWbrA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
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
import axis.mvc.control.modal.Axisadm206Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisadm206Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisadm206Action thisAction) {
		logger.debug("Axisadm202Service m_init");
		this.m_form(request, thisAction);
	}

	public void m_form(HttpServletRequest request, Axisadm206Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		if (!isEmpty(getCampoTextual(request, "CMODO"))) {
			AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "CMODO"));
			formdata.put("CMODOS", getCampoTextual(request, "CMODO"));
		}
		logger.error("entre m_form axisadm206");
		try {

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			request.setAttribute("MAILS", (List) tratarRETURNyMENSAJES(request, map));

			Map map2 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002013));
			request.setAttribute("TESTADOS", (List) tratarRETURNyMENSAJES(request, map2));

			if (!isEmpty(getCampoNumerico(request, "SRDIAN"))) {
				BigDecimal SRDIAN = getCampoNumerico(request, "SRDIAN");
				BigDecimal NRESOL = getCampoNumerico(request, "NRESOL");
				BigDecimal CAGENTE = getCampoNumerico(request, "SUCURSAL");
				String CGRUPO = getCampoTextual(request, "CGRUPO");
				String DESCRIP = getCampoTextual(request, "DESCRIPCION");
				String USUARIO = getCampoTextual(request, "CUSU");
				BigDecimal MAIL = getCampoNumerico(request, "MAIL");
				BigDecimal ACTIVIDAD = getCampoNumerico(request, "CACTIVI");
				BigDecimal TESTADO = getCampoNumerico(request, "TESTADO");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");

				Map map3 = new PAC_IAX_RANGO_DIAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_RANGO_DIAN__F_GET_VERSIONESDIAN(SRDIAN, NRESOL, DESCRIP, CRAMO, ACTIVIDAD,
								CGRUPO, CAGENTE, USUARIO, MAIL, TESTADO);
				List plListaVersionesDian = (List) tratarRETURNyMENSAJES(request, map3);

				request.setAttribute("axisadm206_plListaVersionesDian", plListaVersionesDian);

				formdata.put("SRDIAN", ((Map) plListaVersionesDian.get(0)).get("SRDIAN"));
				formdata.put("NRESOL", ((Map) plListaVersionesDian.get(0)).get("NRESOL"));
				formdata.put("TDESCRIP", ((Map) plListaVersionesDian.get(0)).get("TDESCRIP"));
				formdata.put("CRAMO", ((Map) plListaVersionesDian.get(0)).get("CRAMO"));
				formdata.put("CAGENTE", ((Map) plListaVersionesDian.get(0)).get("CAGENTE"));
				formdata.put("CGRUPO", ((Map) plListaVersionesDian.get(0)).get("CGRUPO"));
				formdata.put("CACTIVI", ((Map) plListaVersionesDian.get(0)).get("CACTIVI"));
				formdata.put("NUSU", ((Map) plListaVersionesDian.get(0)).get("NUSU"));
				formdata.put("TNUSU", ((Map) plListaVersionesDian.get(0)).get("TNUSU"));
				formdata.put("FINIVIG", ((Map) plListaVersionesDian.get(0)).get("FINIVIG"));
				formdata.put("FFINVIG", ((Map) plListaVersionesDian.get(0)).get("FFINVIG"));
				formdata.put("NAVISO", ((Map) plListaVersionesDian.get(0)).get("NAVISO"));
				formdata.put("CENVCORR", ((Map) plListaVersionesDian.get(0)).get("CENVCORR"));
				formdata.put("NINICIAL", ((Map) plListaVersionesDian.get(0)).get("NINICIAL"));
				formdata.put("NFINAL", ((Map) plListaVersionesDian.get(0)).get("NFINAL"));
				formdata.put("NCERTAVI", ((Map) plListaVersionesDian.get(0)).get("NCERTAVI"));
				formdata.put("TESTADO", ((Map) plListaVersionesDian.get(0)).get("TESTADO"));

			}
			this.m_buscar_usuario(request, thisAction);
			this.dbGetCramosDian(request, usuario);
			this.m_ajax_selected_ramos(request);
			this.m_ajax_selected_activi(request);
			this.m_ajax_selected_grupo(request);
			this.cargaListasucursales(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm206Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargaListasucursales(HttpServletRequest request) throws Exception {
//      UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);          
		logger.debug("Axisadm206Service cargaListasucursales");
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
		// FIN - IAXIS-5100 - JLTS - 23/08/2019.
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

	public void m_aceptar(HttpServletRequest request, Axisadm206Action thisAction) {
		logger.debug("Axisadm206Service m_aceptar");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// INI -IAXIS-5100 - JLTS - 22/08/2019
			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				// FIN -IAXIS-5100 - JLTS - 22/08/2019

				BigDecimal SRDIAN = getCampoNumerico(request, "SRDIAN");
				BigDecimal NRESOL = getCampoNumerico(request, "NRESOL");

				String DESCRIPCION = getCampoTextual(request, "DESCRIPCION");
				BigDecimal SUCURSAL = getCampoNumerico(request, "SUCURSAL");
				String CGRUPO = getCampoTextual(request, "CGRUPO");
				String CUSUario = getCampoTextual(request, "CUSU");
				String MAILs = getCampoTextual(request, "MAIL");
				Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
				Date FFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG"));
				String TESTADO = getCampoTextual(request, "TESTADO");
				if (TESTADO == null) {
					TESTADO = "1";
				}
				String MODO = getCampoTextual(request, "CMODOS");
				String NINICIAL = getCampoTextual(request, "NINICIAL");
				String NFINAL = getCampoTextual(request, "NFINAL");
				String NCERTAVI = getCampoTextual(request, "NCERTAVI");
				String NAVISO = getCampoTextual(request, "NAVISO");
				BigDecimal ACTIVIDAD = getCampoNumerico(request, "CACTIVI");
				// INI - IAXIS-3288 - JLTS - 20/06/2019. Se adiciona CRAMO y SPRODUC
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

				Map map = new PAC_IAX_RANGO_DIAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_RANGO_DIAN__F_SET_VERSIONESDIAN(SRDIAN, NRESOL, SUCURSAL, CGRUPO, FINIVIG,
								FINIVIG, FFINVIG, DESCRIPCION, new BigDecimal(NINICIAL), new BigDecimal(NFINAL),
								CUSUario, TESTADO, MAILs, new BigDecimal(NAVISO), new BigDecimal(NCERTAVI),
								new BigDecimal(0), MODO, ACTIVIDAD, CRAMO, SPRODUC);
				// FIN - IAXIS-3288 - JLTS - 20/06/2019. Se adiciona CRAMO y SPRODUC
				logger.debug(map);
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() != 0) {
					if (!isEmpty(map.get("MENSAJES"))) {
						String mensaje = ((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
								.get("TERROR").toString();
						formdata.put("errorMensaje", mensaje);
						formdata.put("grabarOK", '1');
					}
				} else {
					formdata.put("grabarOK", '0');
					request.getSession().setAttribute("errorMensaje", "Proceso realizado con �xito");
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm206Service - m�todo m_aceptar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString()
			// },Constantes.MENSAJE_ERROR);

			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private void dbGetCramosDian(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		Map m = new PAC_IAX_RANGO_DIAN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(usuario.getCempres());
		logger.debug(m);
		List cramos = (List) tratarRETURNyMENSAJES(request, m, false);

		request.getSession().setAttribute("cramos", cramos);
	}

	public List f_cargar_listaVersionesDian(HttpServletRequest request, Axisadm206Action thisAction) throws Exception {
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

		request.setAttribute("axisadm206_plListaVersionesDian", plListaVersionesDian);
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		return plListaVersionesDian;
	}

	public void m_buscar_usuario(HttpServletRequest request, Axisadm206Action thisAction) {
		logger.debug("Axisadm206Service m_buscar_usuario");
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

	public void m_ajax_selected_grupo(HttpServletRequest request) {
		logger.debug("Axisadm206Service AJAX m_ajax_selected_grupo");
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
			// FIN - IAXIS-5100 - JLTS - 23/08/2019
			logger.debug(plReturn);
			List getSucursalIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("listaSucursales");

			if (!isEmpty(getSucursalIniReturn) && getSucursalIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getSucursalIniReturn);
				request.getSession().setAttribute("listaSucursales", getSucursalIniReturn);
			}

		} catch (Exception e) {
			logger.error("Axissin032Service m_ajax_selected_grupo - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_selected_ramos(HttpServletRequest request) {
		logger.debug("Axisadm206Service AJAX m_ajax_selected_ramos");
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
			logger.error("Axisadm206Service m_ajax_selected_ramos - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_selected_activi(HttpServletRequest request) {
		logger.debug("Axisadm206Service AJAX m_ajax_selected_activi");
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
			logger.error("Axisadm206Service m_ajax_selected_ramos - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

}
