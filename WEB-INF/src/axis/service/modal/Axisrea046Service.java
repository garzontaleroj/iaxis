package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_ESTCESIONESREA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisrea046Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axissin002Service.java
 * 
 * @author <a href="mailto:lcalvo@csi-ti.com">Luz Calvo</a>
 */
public class Axisrea046Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisrea046Action thisAction) {
		logger.debug("Axispro002Service m_form");
		try {
			cargarDatosCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro002Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Lista empresas
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
		logger.debug(map);

		List empresas = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("EMPRESAS", empresas);

		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug(cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias);
		request.setAttribute("CIAS", listacias);

		if (empresas.size() == 1) {
			formdata.put("EMPRESA", ((HashMap) empresas.get(0)).get("CEMPRES"));
		}

		if (!isEmpty(formdata.get("EMPRESA")) && !"null".equals(formdata.get("EMPRESA"))) {
			String tipo = this.getCampoTextual(request, "tipo");
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo,
							new BigDecimal(String.valueOf(formdata.get("EMPRESA"))));
			logger.debug(map);
			request.setAttribute("RAMOS", (List) tratarRETURNyMENSAJES(request, map));
		}

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
		logger.debug(map);
		request.setAttribute("AGRUPACIONES", (List) tratarRETURNyMENSAJES(request, map));

	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que realiza la b�squeda de productos en funci�n de los par�metros de
	 * filtro seleccionados.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisrea046Action thisAction) {
		logger.debug("Axispro002Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaPolizas");

				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERT = getCampoNumerico(request, "NCERT");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				String NNUMIDE = getCampoTextual(request, "NNUMIDE");
				String SNIP = getCampoTextual(request, "SNIP");
				String BUSCAR = getCampoTextual(request, "BUSCAR");
				String CONTRATOINT = getCampoTextual(request, "CONTRATOINT");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				String CMATRIC = getCampoTextual(request, "CMATRICULA");
				String CPOSTAL = getCampoTextual(request, "CPOSTAL");
				String TNATRIE = getCampoTextual(request, "DESCRIPCION");
				String TDOMICI = getCampoTextual(request, "TDOMICI");
				BigDecimal NSOLICI = getCampoNumerico(request, "NSOLICI");
				BigDecimal CSITUAC = getHiddenCampoNumerico(request, "CSITUAC");
				BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
				BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
				BigDecimal CESTSUPL = getCampoNumerico(request, "CESTSUPL");

				BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");
				String CPOLCIA = getCampoTextual(request, "CPOLCIA");

				String CMODO = getCampoTextual(request, "tipo");
				String NPOLINI = getCampoTextual(request, "NPOLINI");
				logger.debug("----" + CMODO + "------------");
				logger.debug("----Buscamos XVM TIPO:" + getCampoTextual(request, "tipo") + "------------");
				logger.debug("filtro-->" + this.getFiltro(request));
				BigDecimal filtro = this.getFiltro(request);

				BigDecimal pcsucursal = getHiddenCampoNumerico(request, "CAGENTE_2");
				BigDecimal pcadn = getHiddenCampoNumerico(request, "CAGENTE_3");
				BigDecimal pcinter = getHiddenCampoNumerico(request, "CAGENTE_4");
				logger.debug("----> pcsucursal:" + pcsucursal + " pcadn:" + pcadn + " pcinter:" + pcinter);

				CAGENTE = isEmpty(CAGENTE) ? pcinter : CAGENTE;

				String CMOTOR = getCampoTextual(request, "CMOTOR");
				String CCHASIS = getCampoTextual(request, "CCHASIS");
				String NBASTID = getCampoTextual(request, "NBASTID");

				// Bug 27766 A�ado campo MODO que valdr� 1 para pignoraciones
				// Bug 27766 07/03/2014
				// No entendemos porque cuando es pignoracion se pasa CMODO = 1 a la funcion
				// this.dbConsultaPoliza
				// En BBDD El CMODO = 1 ataca a la tabla bloqueoseg, que entendemos no procede
				// para pignoraciones.
				// Forzamos CMODO = 0 para evitar el filtro.
				String MODO;
				if (!isEmpty(AbstractDispatchAction.topPila(request, "CMODO"))) {
					MODO = AbstractDispatchAction.topPila(request, "CMODO").toString();
					logger.debug("--CAMPO CMODO VALE: " + MODO);
					if (MODO.equals("CONS_PIGNORACION")) {
						List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, CRAMO, SPRODUC, NPOLIZA,
								NCERT, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, CMATRIC, CPOSTAL, TNATRIE, TDOMICI, CMODO,
								CSITUAC, CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL, filtro,
								NPOLINI, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID, BigDecimal.ONE, thisAction);

						request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
					} else {
						List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, CRAMO, SPRODUC, NPOLIZA,
								NCERT, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, CMATRIC, CPOSTAL, TNATRIE, TDOMICI, CMODO,
								CSITUAC, CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL, filtro,
								NPOLINI, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID, BigDecimal.ZERO, thisAction);

						request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
					}
				} else {
					List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, CRAMO, SPRODUC, NPOLIZA, NCERT,
							NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, CMATRIC, CPOSTAL, TNATRIE, TDOMICI, CMODO, CSITUAC,
							CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL, filtro, NPOLINI,
							pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID, BigDecimal.ZERO, thisAction);

					request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
				}
			}
			/*
			 * try { BigDecimal CEMPRESA=getCampoNumerico(request, "EMPRESA"); BigDecimal
			 * CRAMO=getCampoNumerico(request, "RAMO"); BigDecimal
			 * CAGRPRO=getCampoNumerico(request, "AGRUPACION"); BigDecimal
			 * CACTIVO=getCampoNumerico(request, "ACTIVO"); BigDecimal
			 * CCOMPANI=getCampoNumerico(request, "CCOMPANI"); String
			 * origen=(String)AbstractDispatchAction.topPila(request, "CFORM"); Map
			 * map=null; if (origen!=null&&origen.equals("AXISCAJ002")) map=new
			 * PAC_IAX_MNTPROD((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
			 * )).ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA_FILTRADO(CEMPRESA, CRAMO, CAGRPRO,
			 * CACTIVO, CCOMPANI); else { map=new
			 * PAC_IAX_MNTPROD((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
			 * )).ejecutaPAC_IAX_MNTPROD__F_GET_CONSULTA(CEMPRESA, CRAMO, CAGRPRO, CACTIVO,
			 * CCOMPANI); } logger.debug(map);
			 * 
			 * request.getSession().setAttribute("LISTAPRODUCTOS",
			 * (List)tratarRETURNyMENSAJES(request, map)); }
			 */
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea046Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * Funcion que recupera la lista de los ramos de una empresa
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_ramos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			BigDecimal CVALOR = getCampoNumerico(request, "CVALOR");
			logger.debug("---------- VALOR empresa  :" + CVALOR);
			if (!isEmpty(CVALOR)) {
				String tipo = this.getCampoTextual(request, "tipo");
				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, CVALOR);
				logger.debug(map);

				if (!isEmpty(map)) {
					List ramos = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(ramos);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - m�todo m_ajax_recuperar_modelo", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que, pasando unos parametros, permite la carga de todas las p�lizas
	 * posibles a partir de esta b�squeda.
	 * 
	 * @param request
	 * @param usuario
	 * @param SPRODUC
	 * @param NPOLIZA
	 * @param NCERT
	 * @param NNUMIDE
	 * @param SNIP
	 * @param BUSCAR
	 * @param TIPOPERSONA
	 * @return
	 * @throws Exception
	 */
	private List dbConsultaPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal CRAMO, BigDecimal SPRODUC,
			BigDecimal NPOLIZA, BigDecimal NCERT, String NNUMIDE, String SNIP, String BUSCAR, BigDecimal TIPOPERSONA,
			String CMATRIC, String CPOSTAL, String TNATRIE, String TDOMICI, String PMODO, BigDecimal CSITUAC,
			String PCONTRATOINT, BigDecimal CAGENTE, BigDecimal NSOLICI, String CPOLCIA, BigDecimal CCOMPANI,
			BigDecimal CACTIVI, BigDecimal CESTSUPL, BigDecimal filtro, String NPOLINI, BigDecimal pcsucursal,
			BigDecimal pcadn, String CMOTOR, String CCHASIS, String NBASTID, BigDecimal MODO,
			Axisrea046Action thisAction) throws Exception {

		// Bug 11308 - Si informan el n� de comtrato interno extraemos el n� de poliza y
		// se lo pasamos como tal a la busqueda
		if (PCONTRATOINT != null) {
			Map map = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_EXTRAE_NPOLIZA(PCONTRATOINT);
			BigDecimal NPOLIZA2 = (BigDecimal) map.get("RETURN");
			NPOLIZA = NPOLIZA2;
		}

		HashMap m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_CONSULTAPOLIZA(CRAMO, SPRODUC, NPOLIZA, NCERT, NNUMIDE, SNIP, BUSCAR,
						NSOLICI, TIPOPERSONA, CAGENTE, CMATRIC, CPOSTAL, TDOMICI, TNATRIE, CSITUAC, PMODO, CPOLCIA,
						CCOMPANI, CACTIVI, CESTSUPL, NPOLINI, filtro, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID,
						MODO);
		logger.debug(m);
		List plReturn = (List) tratarRETURNyMENSAJES(request, m);

		// ecg http://mantis.srvcsi.com/view.php?id=23754#c123705 Si tama�o de la lista
		// es mayor o igual a PARINSTALACION.N_MAX_REG, generar aviso de demasaidos
		// registros
		try {
			PAC_IAX_PARAM pacIaxParam = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pacIaxParam.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("N_MAX_REG");
			BigDecimal N_MAX_REG = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(N_MAX_REG) && !isEmpty(plReturn)) {
				if (plReturn.size() >= N_MAX_REG.intValue()) {
					thisAction.guardarMensaje(request, "1000055", new Object[] {}, Constantes.MENSAJE_ERROR);
				}
			}
		} catch (Exception e) {
			logger.error(
					"No se ha pdodio controlar el aviso dedemasiados registros. Lo ignoramos para no parar por eso el flujo de pantallas.",
					e);
		}

		return plReturn;
	}

	/**
	 * Realiza la b�squeda de un siniestro, dados los par�metros del formulario.
	 * Dichos par�metros pueden estar a null. Pone el resultado en una List en
	 * sesi�n llamada AXISSIN_LISTASINIESTROS.
	 * 
	 * @param request    El HttpServletRequest que contiene la petici�n del cliente
	 *                   web.
	 * @param thisAction Una Action abstracta desde donde se ha invocado el servicio
	 *                   (necesaria para el log).
	 */

	public void m_busqueda_poliza(HttpServletRequest request, Axisrea046Action thisAction) {
		// Recuperar siniestro a buscar
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			Date FINIEFE = stringToSqlDate(getCampoTextual(request, "FINIEFE"));
			Date FFINEFE = stringToSqlDate(getCampoTextual(request, "FFINEFE"));

			logger.debug("NPOLIZA " + NPOLIZA);
			logger.debug("NSINIES " + NSINIES);
			logger.debug("NRECIBO " + NRECIBO);
			logger.debug("FINIEFE " + FINIEFE);
			logger.debug("FFINEFE " + FFINEFE);

			PAC_IAX_ESTCESIONESREA pac_iax_estcesionesrea = new PAC_IAX_ESTCESIONESREA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			/*
			 * PAC_IAX_SINIESTROS pac_axis_siniestros = new
			 * PAC_IAX_SINIESTROS((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 */
			Map map = pac_iax_estcesionesrea.ejecutaPAC_IAX_ESTCESIONESREA__F_CONSULTA_CES_MAN(NPOLIZA, NSINIES,
					NRECIBO, FINIEFE, FFINEFE);
			logger.debug(map);
			List listaPolizas = (List) tratarRETURNyMENSAJES(request, map);
			logger.debug(listaPolizas);

			formdata.put("AXISSIN_POLIZAS", listaPolizas);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea046Service - m�todo m_busqueda_siniestro", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			// m_cargarValors(request,thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			this.formattingNumericValues(request);
		}
	}

}
