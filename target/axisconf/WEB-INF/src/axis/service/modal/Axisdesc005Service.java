package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_DESCUENTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axisdesc005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisdesc005Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisdesc005Service.class);

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

	private void dbBuscarProductos(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CDESC = getCampoNumerico(request, "CDESC");

		HashMap m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_NIVEL(SPRODUC, CACTIVI, CGARANT, new BigDecimal("1"), CDESC);
		logger.debug(m);
		BigDecimal plReturn = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

		ArrayList lista = (ArrayList) m.get("PT_DESCUENTO");

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/*
		 * ArrayList lista_falsa = new ArrayList();
		 * 
		 * HashMap registro = new HashMap();
		 * 
		 * 
		 * registro.put("PRODUCTO","Comunidades"); // registro.put("NPOLIZA",new
		 * BigDecimal(1)); // registro.put("MODALIDAD","Directo Nueva Producci�n");
		 * registro.put("PORCENTAJE",new BigDecimal(8)); lista_falsa.add(registro);
		 * 
		 * HashMap registro1 = new HashMap();
		 * 
		 * registro1.put("PRODUCTO","Comunidades"); // registro1.put("NPOLIZA",new
		 * BigDecimal(2)); // registro1.put("MODALIDAD","Directo Carteras sucesivas");
		 * registro1.put("PORCENTAJE",new BigDecimal(8)); lista_falsa.add(registro1);
		 * 
		 * HashMap registro2 = new HashMap();
		 * 
		 * registro2.put("PRODUCTO","Hogar"); // registro2.put("NPOLIZA",new
		 * BigDecimal(3)); // registro2.put("MODALIDAD","Directo Nueva Producci�n");
		 * registro2.put("PORCENTAJE",new BigDecimal(7)); lista_falsa.add(registro2);
		 * 
		 * HashMap registro3 = new HashMap();
		 * 
		 * registro3.put("PRODUCTO","Hogar"); // registro3.put("NPOLIZA",new
		 * BigDecimal(4)); // registro3.put("MODALIDAD","Directo Carteras sucesivas");
		 * registro3.put("PORCENTAJE",new BigDecimal(7)); lista_falsa.add(registro3);
		 */

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */

		request.getSession().setAttribute("axisctr_listaProductos", lista);

		// request.getSession().setAttribute("axisctr_listaProductos",
		// lista_falsa);

	}

	private void dbBuscarActividades(HttpServletRequest request, UsuarioBean usuario, BigDecimal selectedProducto)
			throws Exception {

		BigDecimal SPRODUC = selectedProducto;// getCampoNumerico(request, "SPRODUC");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CDESC = getCampoNumerico(request, "CDESC");

		HashMap m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_NIVEL(SPRODUC, CACTIVI, CGARANT, new BigDecimal("2"), CDESC);
		logger.debug(m);
		ArrayList consultaActividadesReturn = (ArrayList) m.get("PT_DESCUENTO");

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */
		/*
		 * ArrayList lista_falsa = new ArrayList();
		 * 
		 * HashMap registro = new HashMap();
		 * 
		 * 
		 * registro.put("ACTIVIDAD","Comunidad"); // registro.put("NPOLIZA",new
		 * BigDecimal(1)); // registro.put("MODALIDAD","Directo Nueva Producci�n");
		 * registro.put("PORCENTAJE",new BigDecimal(0)); lista_falsa.add(registro);
		 * 
		 * HashMap registro1 = new HashMap();
		 * 
		 * registro1.put("ACTIVIDAD","Comunidad"); // registro1.put("NPOLIZA",new
		 * BigDecimal(2)); // registro1.put("MODALIDAD","Directo Carteras sucesivas");
		 * registro1.put("PORCENTAJE",new BigDecimal(0)); lista_falsa.add(registro1);
		 */

		/* ********************************************************************* */
		/* ********************************************************************* */
		/* ********************************************************************* */

		request.getSession().setAttribute("axisctr_listaActividades", consultaActividadesReturn);

	}

	private void dbBuscarGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal selectedProducto,
			BigDecimal selectedActividad) throws Exception {

		BigDecimal SPRODUC = selectedProducto; // getCampoNumerico(request, "SPRODUC");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal CACTIVI = selectedActividad; // getCampoNumerico(request, "CACTIVI");
		BigDecimal CDESC = getCampoNumerico(request, "CDESC");

		HashMap m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_NIVEL(SPRODUC, CACTIVI, CGARANT, new BigDecimal("3"), CDESC);
		logger.debug(m);

		ArrayList consultaGarantiasReturn = (ArrayList) m.get("PT_DESCUENTO");

		request.getSession().setAttribute("axisctr_listaGarantias", consultaGarantiasReturn);

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
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMPRODUCTOS(getCampoTextual(request, "tipo"),
						getCampoNumerico(request, "CRAMO"), new BigDecimal(0));
		logger.debug(m);
		List productos = (List) tratarRETURNyMENSAJES(request, m, false);

		return productos;
	}

	/**
	 * Carga la lista inicial de ramos en la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	private void cargaListaRamos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
		List listaRamos = (List) tratarRETURNyMENSAJES(request, map);
		request.setAttribute("axisctr_listaRamos", listaRamos != null ? listaRamos : new ArrayList());
		listaRamos = null;
	}

	/**
	 * M�todo inicial al llamar a �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_init");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			// Inicializaci�n de valores campos
			request.getSession().removeAttribute("axisctr_listaDescuentos");
			this.m_cargarValors(request, thisAction);
			BigDecimal CDESC = getCampoNumerico(request, "CDESC");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			formdata.clear();

			HashMap map = new HashMap();
			map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(CDESC, FINIVIG, FFINVIG);

			if (map != null) {
				HashMap PCUADRODESCUENTO = (HashMap) map.get("PCUADRODESCUENTO");
				logger.debug(PCUADRODESCUENTO);
				formdata.putAll(PCUADRODESCUENTO);
			}

			/* Inicialar los registros */
			HashMap m = new HashMap();

			m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO(CDESC, null, null, null, null, null,
							new BigDecimal(1), FINIVIG, null);
			logger.debug("HALO");
			// m = new
			// PAC_IAX_DESCUENTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO(CDESC,null,null,null,null,null);
			logger.debug("PAC_IAX_DESCUENTOS__F_GET_DETALLE_DESCUENTO :" + m); // CRAMO,SPRODUC,CACTIVI,CGARANT
			tratarRETURNyMENSAJES(request, m, false);

			request.getSession().setAttribute("axisctr_detalledesc", m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc005Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
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
	public void m_form(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			if (request.getSession().getAttribute("selectedProducto") != null) {
				request.setAttribute("selectedProducto",
						(BigDecimal) request.getSession().getAttribute("selectedProducto"));
			}
			if (request.getSession().getAttribute("selectedActividad") != null) {
				request.setAttribute("selectedActividad",
						(BigDecimal) request.getSession().getAttribute("selectedActividad"));
			}
			if (request.getSession().getAttribute("selectedModProducto") != null) {
				request.setAttribute("selectedModProducto",
						(BigDecimal) request.getSession().getAttribute("selectedModProducto"));
			}
			if (request.getSession().getAttribute("selectedModActividad") != null) {
				request.setAttribute("selectedModActividad",
						(BigDecimal) request.getSession().getAttribute("selectedModActividad"));
			}

			HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

			formdata.put("selectedProducto", (BigDecimal) request.getSession().getAttribute("selectedProducto"));
			formdata.put("selectedModProducto", (BigDecimal) request.getSession().getAttribute("selectedModProducto"));
			formdata.put("selectedActividad", (BigDecimal) request.getSession().getAttribute("selectedActividad"));
			formdata.put("selectedModActividad",
					(BigDecimal) request.getSession().getAttribute("selectedModActividad"));

			request.setAttribute(Constantes.FORMDATA, formdata);

			this.m_buscar_productos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se llama al principio del flujo. Se encarga de realizar la carga
	 * de productos para realizar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_actualizar(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			BigDecimal selectedModProducto = getCampoNumerico(request, "selectedModProducto");
			BigDecimal selectedActividad = getCampoNumerico(request, "selectedActividad");
			BigDecimal selectedModActividad = getCampoNumerico(request, "selectedModActividad");
			request.setAttribute("selectedProducto", selectedProducto);
			request.setAttribute("selectedModProducto", selectedModProducto);
			request.setAttribute("selectedActividad", selectedActividad);
			request.setAttribute("selectedModActividad", selectedModActividad);

			this.m_buscar_productos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	private void m_cargarValors(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			/* ************************************ */

			BigDecimal CDESC = getCampoNumerico(request, "CDESC");
			Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			formdata.clear();

			HashMap map = new HashMap();
			map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_DESCUENTOS__F_GET_CUADRODESCUENTO(CDESC, FINIVIG, FFINVIG);

			if (map != null) {
				HashMap PCUADRODESCUENTO = (HashMap) map.get("PCUADRODESCUENTO");
				logger.debug(PCUADRODESCUENTO);
				formdata.putAll(PCUADRODESCUENTO);
				// BUG 20826_0103303,0103318-20120130-JLTS-Evaluaci�n de cest y sfinvig para
				// ocultar el bot�n
				BigDecimal cest = (BigDecimal) PCUADRODESCUENTO.get("CESTADO");
				String sfinvig = ((PCUADRODESCUENTO.get("FFINVIG") != null) ? PCUADRODESCUENTO.get("FFINVIG").toString()
						: null);
				if ((cest.equals(new BigDecimal(2)) || sfinvig != null)) {
					formdata.put("OCULTAR_EDITAR", true);
				} else {
					formdata.put("OCULTAR_EDITAR", false);
				}
			}

			/* ************************************ */
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			logger.debug("CRAM-->" + CRAMO);

			this.cargaListaRamos(request);
			if (!isEmpty(request.getAttribute("axisctr_listaRamos"))) {
				ArrayList lista = (ArrayList) request.getAttribute("axisctr_listaRamos");
				if (lista.size() == 1)
					CRAMO = (BigDecimal) (((HashMap) lista.get(0)).get("CRAMO"));
			}
			formdata.put("CRAMO", CRAMO);
			List productos = new ArrayList();
			if (isEmpty(CRAMO))
				productos = dbGetProductos(request, usuario);
			else
				productos = dbGetRamProductos(request);

			if (!isEmpty(productos)) {
				if (productos.size() == 1)
					formdata.put("SPRODUC", (BigDecimal) (((HashMap) productos.get(0)).get("SPRODUC")));
			}

			request.getSession().setAttribute("productos", ((productos == null) ? new ArrayList() : productos));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc005Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que se encarga de procesar la b�squeda de una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {

			logger.error("Error en el servicio Axisdesc005Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_productos(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_buscar_productos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			// request.setAttribute("selectedproducto",selectedProducto);

			if (request.getSession().getAttribute("selectedProducto") != null && selectedProducto == null) {
				selectedProducto = (BigDecimal) request.getSession().getAttribute("selectedProducto");
				formdata.put("selectedProducto", selectedProducto);
				formdata.put("selectedModProducto", request.getSession().getAttribute("selectedModProducto"));
			}

			request.setAttribute("selectedProducto", selectedProducto);

			this.dbBuscarProductos(request, usuario);

			ArrayList listaProductos = (ArrayList) request.getSession().getAttribute("axisctr_listaProductos");

			if (listaProductos != null && selectedProducto == null && listaProductos.size() > 0) {
				if (request.getSession().getAttribute("selectedProducto") != null
						&& request.getSession().getAttribute("selectedModProducto") != null) {
					formdata.put("selectedProducto", request.getSession().getAttribute("selectedProducto"));
					formdata.put("selectedModProducto", request.getSession().getAttribute("selectedModProducto"));
				} else {
					HashMap mapa = (HashMap) listaProductos.get(0);
					HashMap mapa_ob = (HashMap) mapa.get("OB_IAX_DETDESCUENTO");
					BigDecimal SPRODUC = (BigDecimal) mapa_ob.get("SPRODUC");
					BigDecimal CMODDESC = (BigDecimal) mapa_ob.get("CMODDESC");
					// request.setAttribute("selectedProducto",NPOLIZA);
					formdata.put("selectedProducto", SPRODUC);
					formdata.put("selectedModProducto", CMODDESC);
					request.getSession().setAttribute("selectedProducto", SPRODUC);
					request.getSession().setAttribute("selectedModProducto", CMODDESC);
				}

			}
			m_buscar_actividades(request, thisAction);
		}

		catch (Exception e) {

			logger.error("Error en el servicio Axisdesc005Service - m�todo m_buscar_productos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_actividades(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_buscar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			BigDecimal selectedModProducto = getCampoNumerico(request, "selectedModProducto");
			BigDecimal selectedActividad = getCampoNumerico(request, "selectedActividad");
			BigDecimal selectedModActividad = getCampoNumerico(request, "selectedModActividad");

			if (selectedModProducto == null) {
				selectedModProducto = (BigDecimal) request.getSession().getAttribute("selectedModProducto");
			}

			request.setAttribute("selectedProducto", selectedProducto);
			request.setAttribute("selectedModProducto", selectedModProducto);
			request.setAttribute("selectedActividad", selectedActividad);
			request.setAttribute("selectedModActividad", selectedModActividad);

			if (selectedProducto != null) {
				this.dbBuscarActividades(request, usuario, selectedProducto);
			}

			if (request.getSession().getAttribute("selectedActividad") != null && selectedActividad == null) {
				selectedActividad = (BigDecimal) request.getSession().getAttribute("selectedActividad");
				formdata.put("selectedActividad", selectedProducto);
				formdata.put("selectedModActividad", request.getSession().getAttribute("selectedModProducto"));
			}

			ArrayList lista_actividades = (ArrayList) request.getSession().getAttribute("axisctr_listaActividades");

			if (lista_actividades != null && selectedActividad == null && lista_actividades.size() > 0) {

				HashMap mapa = (HashMap) lista_actividades.get(0);
				HashMap mapa_ob = (HashMap) mapa.get("OB_IAX_DETDESCUENTO");
				BigDecimal CACTIVI = (BigDecimal) mapa_ob.get("CACTIVI");
				BigDecimal CMODACT = (BigDecimal) mapa_ob.get("CMODCOM");

				formdata.remove("selectedActividad");
				formdata.remove("selectedModActividad");
				formdata.put("selectedActividad", CACTIVI);
				formdata.put("selectedModActividad", CMODACT);

				request.getSession().setAttribute("selectedProducto", selectedProducto);
				request.getSession().setAttribute("selectedModProducto", selectedModProducto);
				request.getSession().setAttribute("selectedActividad", CACTIVI);
				request.getSession().setAttribute("selectedModActividad", CMODACT);

			}

			m_buscar_garantias(request, thisAction);

		} catch (Exception e) {

			logger.error("Error en el servicio Axisdesc005Service - m�todo m_buscar_actividades", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_garantias(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_buscar_actividades");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal selectedActividad = getCampoNumerico(request, "selectedActividad");
			BigDecimal selectedModActividad = getCampoNumerico(request, "selectedModActividad");
			BigDecimal selectedProducto = getCampoNumerico(request, "selectedProducto");
			BigDecimal selectedModProducto = getCampoNumerico(request, "selectedModProducto");

			if (selectedProducto == null) {
				selectedProducto = (BigDecimal) request.getSession().getAttribute("selectedProducto");
			}
			if (selectedModProducto == null) {
				selectedModProducto = (BigDecimal) request.getSession().getAttribute("selectedModProducto");
			}
			request.setAttribute("selectedActividad", selectedActividad);
			request.setAttribute("selectedModActividad", selectedModActividad);
			request.setAttribute("selectedProducto", selectedProducto);
			request.setAttribute("selectedModProducto", selectedModProducto);
			request.getSession().setAttribute("selectedActividad", selectedActividad);
			request.getSession().setAttribute("selectedModActividad", selectedModActividad);
			request.getSession().setAttribute("selectedProducto", selectedProducto);
			request.getSession().setAttribute("selectedModProducto", selectedModProducto);
			// formdata.put("selectedProducto",selectedProducto);
			// formdata.put("selectedActividad",selectedActividad);

			// if(selectedActividad!=null){

			this.dbBuscarGarantias(request, usuario, selectedProducto, selectedActividad);
			// ArrayList lista_garantias =
			// (ArrayList)request.getSession().getAttribute("axisctr_listaGarantias");
			// }

		} catch (Exception e) {

			logger.error("Error en el servicio Axisdesc005Service - m�todo m_buscar_actividades", e);
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
	 * M�todo que se llama al cerrar el modal.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_cerrar(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_cerrar");
		try {
			request.getSession().removeAttribute("axisctr_listaPolizas");
			request.getSession().removeAttribute("axisctr_listaProductos");
			request.getSession().removeAttribute("axisctr_listaActividades");
			request.getSession().removeAttribute("axisctr_listaGarantias");
			request.getSession().removeAttribute("selectedProducto");
			request.getSession().removeAttribute("selectedActividad");
			request.getSession().removeAttribute("selectedModProducto");
			request.getSession().removeAttribute("selectedModActividad");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc005Service - m�todo m_cerrar", e);
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
	public void m_ajax_busqueda_descuentos(HttpServletRequest request) {
		logger.debug("Axisdesc005Service m_ajax_busqueda_productos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CRAMO"))) {

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
	public void m_ajax_guardar_porcentaje(HttpServletRequest request) {
		logger.debug("Axisdesc007Service m_ajax_guardar_procentaje");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			ajax.guardarContenidoFinalAContenedorAjax(this.dbGuardarPorcentaje(request));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_busqueda_productos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private BigDecimal dbGuardarPorcentaje(HttpServletRequest request) throws Exception {
		// TODO: PCTERMFIN a hard-code
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("----Buscamos productos TIPO:" + getCampoTextual(request, "tipo") + "------------");

		BigDecimal CDESC = getCampoNumerico(request, "CDESC");
		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal NIVEL = getCampoNumerico(request, "NIVEL");
		BigDecimal MODALIDAD = getCampoNumerico(request, "MODALIDAD");
		BigDecimal PORCENTAJE = getCampoNumerico(request, "PORCENTAJE");
		Date FINIVIG = stringToSqlDate(getCampoTextual(request, "FINIVIG"));
		BigDecimal NINIALT = getCampoNumerico(request, "NINIALT");
		BigDecimal NFINALT = getCampoNumerico(request, "NFINALT");
		BigDecimal NINDICE = getCampoNumerico(request, "NINDICE");
		BigDecimal ELIMINAR = new BigDecimal(0);
		// BUG 20826_0103306-20120111-JLTS-se agrega el campo NINDICE al final del
		// paquete PAC_IAX_DESCUENTOS

		Map m;

		m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_DEL_DETDESC_ALT(CDESC, SPRODUC, CACTIVI, CGARANT, null, MODALIDAD,
						FINIVIG, NINIALT, ELIMINAR);
		logger.debug(m);

		m = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_SET_DETALLE_DESCUENTO(CDESC, SPRODUC, CACTIVI, CGARANT, NIVEL, MODALIDAD,
						FINIVIG, PORCENTAJE, NINIALT, NFINALT, NINDICE);
		logger.debug(m);
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, m, false);

		return resultado;

	}

	private void guardarListaCom(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		String tipo = this.getCampoTextual(request, "tipo");
		// Carga de ramos de la BD
		HashMap map = new HashMap();

		map = new PAC_IAX_DESCUENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_DESCUENTOS__F_SET_TRASPASO_DETALLE_OBJ_BD();
		BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		if (resultado.intValue() == 0)
			request.setAttribute("resultadoOK", "OK");
		else
			request.setAttribute("resultadoOK", "KO");

	}

	/**
	 * M�todo que se llama cuando se selecciona una p�liza.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_aceptar(HttpServletRequest request, Axisdesc005Action thisAction) {
		logger.debug("Axisdesc005Service m_aceptar");
		try {
			this.guardarListaCom(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc005Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// m_cargarValors(request, thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
