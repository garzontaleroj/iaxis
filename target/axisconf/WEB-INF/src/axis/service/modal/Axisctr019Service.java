//Revision:# efO2rvmGVlb+Jxy1rIrcrg== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr019Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr019Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr019Service.class);

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// TODO: PCTERMFIN a hard-code
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(getCampoTextual(request, "tipo"), null, null);
		logger.debug(m);
		List primas = (List) tratarRETURNyMENSAJES(request, m, false);

		return primas;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de productos para
	 * seleccionar una p�liza.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetRamProductos(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		Map m;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOSCOMPANIA(pCOMPANI, getCampoNumerico(request, "CRAMO"));
		} else {
			m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
							getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		}

		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente a la carga de actividades
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetActividades(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		BigDecimal pPSPRODUC = this.getCampoNumerico(request, "SPRODUC");
		BigDecimal pPCRAMO = this.getCampoNumerico(request, "CRAMO");
		List productos;
		if (!this.isEmpty(pPSPRODUC)) {
			// Map m=new
			// PAC_IAX_MNTPROD((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_MNTPROD__F_GET_ACTIVID(pPSPRODUC);
			Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_CACTIVI(pPSPRODUC, null);
			logger.debug(m);
			productos = (List) tratarRETURNyMENSAJES(request, m, false);
		} else {
			productos = new ArrayList();
		}

		return productos;
	}

	private List dbGetCompaniRams(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		BigDecimal pCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
		// Carga de ramos de la BD
		Map map;
		if ((pCOMPANI != null) && (pCOMPANI.intValue() > 0)) {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOSCOMPANIA(pCOMPANI);
		} else {
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		}
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map, false);

		return listaRamos;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		List listaRamos = dbGetCompaniRams(request);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
	}

	/**
	 * Carga la lista inicial de situaciones en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaSituaciones(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("61"));
		List listaSituaciones = (List) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("situaciones", listaSituaciones != null ? listaSituaciones : new ArrayList());
		listaSituaciones = null;
	}

	/**
	 * Carga la lista inicial de estados de suplementos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaEstadosSupl(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("800025"));
		List listaSituaciones = (List) tratarRETURNyMENSAJES(request, map, false);
		request.setAttribute("estadossuplementos", listaSituaciones != null ? listaSituaciones : new ArrayList());
		listaSituaciones = null;
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
	 * @param BUSCARASE
	 * @param NNUMIDEASE
	 * @param CUSUARIO
	 * @param FEFEFIN
	 * @param FEFEINI
	 * @param FEMISIOFIN
	 * @param FEMISIOINI
	 * @param FEMISIOINI
	 * @return
	 * @throws Exception
	 */
	private List dbConsultaPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal CRAMO, BigDecimal SPRODUC,
			BigDecimal NPOLIZA, BigDecimal NCERT, String NNUMIDE, String SNIP, String BUSCAR, BigDecimal TIPOPERSONA,
			String CMATRIC, String CPOSTAL, String TNATRIE, String TDOMICI, String PMODO, BigDecimal CSITUAC,
			String PCONTRATOINT, BigDecimal CAGENTE, BigDecimal NSOLICI, String CPOLCIA, BigDecimal CCOMPANI,
			BigDecimal CACTIVI, BigDecimal CESTSUPL, BigDecimal NPOLRELACIONADA, BigDecimal filtro, String NPOLINI,
			BigDecimal pcsucursal, BigDecimal pcadn, String CMOTOR, String CCHASIS, String NBASTID, BigDecimal MODO,
			String NCONTRATO, java.sql.Date FEMISIOINI, java.sql.Date FEMISIOFIN, java.sql.Date FEFEINI,
			java.sql.Date FEFEFIN, String CUSUARIO, String NNUMIDEASE, String BUSCARASE, Axisctr019Action thisAction)
			throws Exception {

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
						CCOMPANI, CACTIVI, CESTSUPL, NPOLRELACIONADA, NPOLINI, filtro, pcsucursal, pcadn, CMOTOR,
						CCHASIS, NBASTID, MODO, NCONTRATO, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CUSUARIO,
						NNUMIDEASE, BUSCARASE);
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
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr019Action thisAction) {
		logger.debug("Axisctr019Service m_init");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr019Action thisAction) {
		logger.debug("Axisctr019Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
			this.m_cargarValors(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargarValors(HttpServletRequest request, Axisctr019Action thisAction) {
		logger.debug("Axisctr019Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
			logger.debug("CRAM-->" + CRAMO);
			this.cargaSituaciones(request);
			this.cargaEstadosSupl(request);
			this.cargaListaRamos(request);
			this.cargaComboTRiesgo(request);
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			List productos = new ArrayList();

			if (isEmpty(CRAMO) && isEmpty(CCOMPANI))
				productos = dbGetProductos(request, usuario);
			else
				productos = dbGetRamProductos(request);

			if (!isEmpty(productos)) {
				if (productos.size() == 1)
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
			}

			cargaComboCompania(request);
			List actividades = this.dbGetActividades(request);
			request.setAttribute("actividades", ((actividades == null) ? new ArrayList() : actividades));
			request.getSession().setAttribute("productos", ((productos == null) ? new ArrayList() : productos));

			// INI CJMR 22/03/2019 IAXIS-3195
			Map mSuc = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_AGENTESTIPO(new BigDecimal(2), null, null);
			List sucursales = (List) tratarRETURNyMENSAJES(request, mSuc, false);
			request.getSession().setAttribute("sucursales", sucursales);
			// FIN CJMR 22/03/2019 IAXIS-3195

			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_NIVELES(null, null);
			logger.debug(map);

			request.getSession().setAttribute("AGENIVELES", tratarRETURNyMENSAJES(request, map, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisctr019Action thisAction) {
		logger.debug("Axisctr019Service m_buscar");
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
				BigDecimal NPOLRELACIONADA = getCampoNumerico(request, "NPOLRELACIONADA");

				BigDecimal TIPOPERSONA = getCampoNumerico(request, "TIPOPERSONA");
				String CPOLCIA = getCampoTextual(request, "CPOLCIA");

				String CMODO = getCampoTextual(request, "tipo");
				String NPOLINI = getCampoTextual(request, "NPOLINI");
				logger.debug("----" + CMODO + "------------");
				logger.debug("----Buscamos XVM TIPO:" + getCampoTextual(request, "tipo") + "------------");
				logger.debug("filtro-->" + this.getFiltro(request));
				BigDecimal filtro = this.getFiltro(request);

				BigDecimal pcsucursal = (getHiddenCampoNumerico(request, "CAGENTE_2") == null)
						? getCampoNumerico(request, "CSUCURSAL")
						: getHiddenCampoNumerico(request, "CAGENTE_2");
				BigDecimal pcadn = getHiddenCampoNumerico(request, "CAGENTE_3");
				BigDecimal pcinter = getHiddenCampoNumerico(request, "CAGENTE_4");
				logger.debug("----> pcsucursal:" + pcsucursal + " pcadn:" + pcadn + " pcinter:" + pcinter);

				CAGENTE = isEmpty(CAGENTE) ? pcinter : CAGENTE;

				String CMOTOR = getCampoTextual(request, "CMOTOR");
				String CCHASIS = getCampoTextual(request, "CCHASIS");
				String NBASTID = getCampoTextual(request, "NBASTID");
				String NCONTRATO = getCampoTextual(request, "NCONTRATO");

				// INI CJMR 22/03/2019 IAXIS-3195
				java.sql.Date FEMISIOINI = stringToSqlDate(getCampoTextual(request, "FEMISIOINI"));
				java.sql.Date FEMISIOFIN = stringToSqlDate(getCampoTextual(request, "FEMISIOFIN"));
				java.sql.Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
				java.sql.Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
				String CUSUARIO = getCampoTextual(request, "CUSUARIO");
				String NNUMIDEASE = getCampoTextual(request, "NNUMIDEASE");
				String BUSCARASE = getCampoTextual(request, "BUSCARASE");
				// FIN CJMR 22/03/2019 IAXIS-3195

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
								CSITUAC, CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL,
								NPOLRELACIONADA, filtro, NPOLINI, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID,
								BigDecimal.ONE, NCONTRATO, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CUSUARIO,
								NNUMIDEASE, BUSCARASE, thisAction);

						request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
					} else {
						List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, CRAMO, SPRODUC, NPOLIZA,
								NCERT, NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, CMATRIC, CPOSTAL, TNATRIE, TDOMICI, CMODO,
								CSITUAC, CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL,
								NPOLRELACIONADA, filtro, NPOLINI, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID,
								BigDecimal.ZERO, NCONTRATO, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CUSUARIO,
								NNUMIDEASE, BUSCARASE, thisAction);

						request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
					}
				} else {
					List consultaPolizaReturn = this.dbConsultaPoliza(request, usuario, CRAMO, SPRODUC, NPOLIZA, NCERT,
							NNUMIDE, SNIP, BUSCAR, TIPOPERSONA, CMATRIC, CPOSTAL, TNATRIE, TDOMICI, CMODO, CSITUAC,
							CONTRATOINT, CAGENTE, NSOLICI, CPOLCIA, CCOMPANI, CACTIVI, CESTSUPL, NPOLRELACIONADA,
							filtro, NPOLINI, pcsucursal, pcadn, CMOTOR, CCHASIS, NBASTID, BigDecimal.ZERO, NCONTRATO,
							FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CUSUARIO, NNUMIDEASE, BUSCARASE, thisAction);

					request.getSession().setAttribute("axisctr_listaPolizas", consultaPolizaReturn);
				}
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axisctr019Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama cuando se selecciona una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisctr019Action thisAction) {
		logger.debug("Axisctr019Service m_aceptar");
		try {
			List listaPolizas = (List) request.getSession().getAttribute("axisctr_listaPolizas");
			String SPOLIZA = getCampoTextual(request, "SPOLIZA");

			if (!isEmpty(listaPolizas) && !isEmpty(SPOLIZA)) {
				Map poliza = getObjetoDeLista(listaPolizas, SPOLIZA, "idPoliza");
				if (!isEmpty(poliza))
					request.getSession().setAttribute("axisctr_poliza", poliza);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	/**
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisctr019Action thisAction) {
		logger.debug("Axisctr019Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_cerrar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_productos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if ((!isEmpty(this.getCampoNumerico(request, "CRAMO")))
					|| (!isEmpty(this.getCampoNumerico(request, "CCOMPANI")))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetRamProductos(request));
			} else
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetProductos(request, usuario));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_actividades(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_actividades");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.dbGetActividades(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_actividades", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_ramos(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CCOMPANI"))) {
				ajax.guardarContenidoFinalAContenedorAjax(this.dbGetCompaniRams(request));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_ramos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Dado un agente seleccionado en el modal de selecci�n de agentes (axisctr014),
	 * �ste m�todo recibe el atributo CODI del agente y lo pone en el par�metro de
	 * sesi�n axisctr_agente.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_ver_agente(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CODI = getCampoTextual(request, "CODI");

			if (request.getSession().getAttribute("axisctr014_listaAgentes") != null) {
				List listaAgentes = (List) request.getSession().getAttribute("axisctr014_listaAgentes");
				Map agente = getObjetoDeLista(listaAgentes, CODI, "CODI");

				if (!isEmpty(agente)) {
					ajax.guardarContenidoFinalAContenedorAjax(agente);
					request.getSession().setAttribute("axisctr_agente", agente);
				}
				listaAgentes = null;
			}
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr001Service m_ajax_actualizar_agente");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CAGENTE = getCampoTextual(request, "CAGENTE");
			Map m = (Map) this.ActualizaAgente(request, CAGENTE);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_actualizar_agente", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Carga el agente inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private Map ActualizaAgente(HttpServletRequest request, String CAGENTE) throws Exception {
		Map mapAgentes = new HashMap();
		// Cargar Agente de la BD
		Map agente = new HashMap();
		if (!isEmpty(CAGENTE)) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			String CONDICION = this.getCampoTextual(request, "CONDICION");
			try {
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(CAGENTE),
								new BigDecimal(1), CONDICION);
			} catch (NumberFormatException e) {
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, new BigDecimal(-999),
								new BigDecimal(1), CONDICION);
			}

			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_cobjase(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_busqueda_cobjase");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaCobjase(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr0719Service - m�todo m_ajax_busqueda_cobjase", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Realiza una b�squeda de cobjase seleccionado (SPRODUC).
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @return
	 * @throws Exception
	 */
	private Map buscaCobjase(HttpServletRequest request) throws Exception {
		// Recuperar Productos segun ramo seleccionado
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");

		Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DEFPRODUCTO(SPRODUC);
		Map plCOBJASE = (HashMap) ajax.rellenarPlAContenedorAjax(map);

		logger.debug((List) request.getSession().getAttribute("LST_PRODUCTOS"));

		return plCOBJASE;

	}

	private void cargaComboCompania(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map cias = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS();
		logger.debug("ejecutaPAC_IAX_LISTVALORES__F_GET_CIAPRODUCTOS: devuelve" + cias);
		List listacias = (List) tratarRETURNyMENSAJES(request, cias, false);
		formdata.put("CIAS", listacias);
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_cargar_url(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_cargar_url");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			String NPOLIZA = getCampoTextual(request, "NPOLIZA");

			logger.debug("----Cargamos URL:" + SPRODUC + "------------" + NPOLIZA);

			// Variable que devuelve la url
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_URL_PRODEXTERNO(SPRODUC, "CONSULTA", NPOLIZA);
			logger.debug(m);

			String URL = (String) m.get("PURL");

			// Guardamos lo que sea que haya devuelto al contenedor Ajax.
			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m, new String[] { "PURL" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map OURL = new HashMap();
				OURL.put("URL", resultadoAjax[1]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(OURL);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());

		}
	}

	private void cargaComboTRiesgo(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map tipriesg = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPORIESGO();
		logger.debug(tipriesg);
		request.setAttribute("LST_TIPRIESGO", (List) tratarRETURNyMENSAJES(request, tipriesg, false));

	}

}
