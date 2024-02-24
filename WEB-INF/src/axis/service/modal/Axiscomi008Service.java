//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi008Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

//import axis.jdbc.PAC_IAX_LISTVALORES;

/**
 * Axiscomi008Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axiscomi008Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_init(HttpServletRequest request, Axiscomi008Action thisAction) {
		logger.debug("Axiscomi008Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi008Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axiscomi008Action thisAction) {
		logger.debug("Axiscomi008Service m_form");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGRUPPROD();
			logger.debug(map);

			request.setAttribute("AGRUPACIONES", (List) tratarRETURNyMENSAJES(request, map));

			this.m_cargarValors(request, thisAction);
			// this.m_buscar(request,thisAction);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

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

	private void m_cargarValors(HttpServletRequest request, Axiscomi008Action thisAction) {
		logger.debug("Axisctr019Service m_cargarValors");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
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

			PAC_IAX_COMISIONES pac_comisiones = new PAC_IAX_COMISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal PSPRODUC = getCampoNumerico(request, "VSPRODUC");
			if (!isEmpty(PSPRODUC)) {
				Map lsfechasProd = pac_comisiones.ejecutaPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA(PSPRODUC,
						new BigDecimal(4));
				logger.debug("ejecutaPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA return: " + lsfechasProd);
				List lsfechas = (List) tratarRETURNyMENSAJES(request, lsfechasProd);
				request.setAttribute("lsfechasProd", lsfechas);

				if ((getCampoTextual(request, "FINIVIG") == null)
						|| (this.isEmpty(getCampoTextual(request, "FINIVIG")))) {
					if ((lsfechas != null) && (lsfechas.size() > 0)) {
						java.sql.Date data = seleccionarData(lsfechas);
						request.setAttribute("FINIVIG", this.datePrintfddMMyyyy(data));
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr019Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private java.sql.Date seleccionarData(List lsfechas) {
		java.sql.Date data = new java.sql.Date(new java.util.Date().getTime());
		java.sql.Date temp = new java.sql.Date(new java.util.Date().getTime());
		java.sql.Date sysdate = new java.sql.Date(new java.util.Date().getTime());
		String finiVigencia;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Calendar calendarData = Calendar.getInstance();

		for (Object o : lsfechas) {
			if (o != null) {
				HashMap hm = (HashMap) o;
				if (hm.get("FINIVIG") != null) {
					finiVigencia = hm.get("FINIVIG").toString();

					try {
						calendarData.setTime(sdf.parse(finiVigencia));
					} catch (ParseException e) {
						e.printStackTrace();
					}

					temp = new java.sql.Date(calendarData.getTime().getTime());

					if (sysdate.after(temp)) {
						data = temp;
					}
				}

			}
		}
		if (data.getTime() == sysdate.getTime()) {
			if ((lsfechas != null) && (lsfechas.size() > 0)) {

				String fecha = ((HashMap) lsfechas.get(lsfechas.size() - 1)).get("FINIVIG").toString();

				try {
					calendarData.setTime(sdf.parse(fecha));
				} catch (ParseException e) {
					e.printStackTrace();
				}

				data = new java.sql.Date(calendarData.getTime().getTime());
			}
		}
		return data;
	}

	private String seleccionarData2(List lsfechas) {

		Calendar calendarData = Calendar.getInstance();
		java.sql.Date dataSql = new java.sql.Date(new java.util.Date().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String fecha = new String();

		try {

			// java.sql.Timestamp timeStamp = new
			// java.sql.Timestamp(System.currentTimeMillis());
			if ((lsfechas != null) && (lsfechas.size() > 0)) {
				fecha = ((HashMap) lsfechas.get(0)).get("FINIVIG").toString();

				calendarData.setTime(sdf.parse(fecha));

				dataSql = new java.sql.Date(calendarData.getTime().getTime());

			}

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return fecha;

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

	public void m_buscar(HttpServletRequest request, Axiscomi008Action thisAction) {
		logger.debug("Axiscomi008Service m_buscar");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal PAGRPROD = getCampoNumerico(request, "AGRUPACION");
			BigDecimal PCRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal PSPRODUC = getCampoNumerico(request, "VSPRODUC");
			Date FINIVIG = this.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			String FINIVIG2 = new String();
			if ((FINIVIG == null) && (request.getAttribute("FINIVIG") != null)) {
				FINIVIG = this.stringToSqlDate((String) request.getAttribute("FINIVIG"));
			}

			if (FINIVIG == null) {
				if (!isEmpty(PSPRODUC)) {
					Map lsfechasProd = new PAC_IAX_COMISIONES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA(PSPRODUC, new BigDecimal(4));
					logger.debug("ejecutaPAC_IAX_COMISIONES__F_GET_LSFECHASVIGENCIA return: " + lsfechasProd);
					List lsfechas = (List) tratarRETURNyMENSAJES(request, lsfechasProd);
					if ((lsfechas != null) && (lsfechas.size() > 0)) {
						FINIVIG2 = seleccionarData2(lsfechas);
						FINIVIG = this.stringToSqlDate(FINIVIG2);
					}
				}
			}

			Map map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMISIONES__F_GET_DETALLE_COMISION_PROD(null, PAGRPROD, PCRAMO, PSPRODUC, null,
							null, FINIVIG);
			logger.debug(map);

			formdata.put("listaCuadros", map.get("PT_COMISION"));
			// formdata.put("FINIVIG",FINIVIG);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi008Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
