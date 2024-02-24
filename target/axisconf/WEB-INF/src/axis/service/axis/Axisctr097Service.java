package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMMON;
import axis.jdbc.PAC_IAX_LISTADO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MAP;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr097Service.java 17/12/2009
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axisctr097Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr097Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarCombos(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr097Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.configForm(request, this.whoami(this));
	}

	/**
	 * M�todo que ejecuta la funci�n de F_GENERAR y prepara el flujo de datos a
	 * devolver via ajax
	 * 
	 * @param request
	 */
	public void m_ajax_generar_resultados_map(HttpServletRequest request) {
		logger.debug("Axisctr097Service m_ajax_generar_resultados_map");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			// BigDecimal CEMPRES =usuario.getCempres();
			BigDecimal CIDIOMA = usuario.getCidioma();
			BigDecimal CMAP = getCampoNumerico(request, "CMAP");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGRPRO = getCampoNumerico(request, "CAGRPRO");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal CVINCU = getCampoNumerico(request, "CVINCU");
			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CESTREC = getCampoNumerico(request, "CESTREC");
			BigDecimal CTIPREC = getCampoNumerico(request, "CTIPREC");

			java.sql.Date FDESDE = null;
			java.sql.Date FHASTA = null;
			FDESDE = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FDESDE"));
			FHASTA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FHASTA"));

			Calendar cal = Calendar.getInstance();
			cal.setTime(FDESDE);
			Integer dia = cal.get(Calendar.DATE);
			Integer mes = cal.get(Calendar.MONTH) + 1;
			Integer anyo = cal.get(Calendar.YEAR);

			String Dia;
			if (dia < 10)
				Dia = '0' + dia.toString();
			else
				Dia = dia.toString();

			String Mes;
			if (mes < 10)
				Mes = '0' + mes.toString();
			else
				Mes = mes.toString();

			String fdesde = Dia + Mes + anyo.toString();

			cal.setTime(FHASTA);
			dia = cal.get(Calendar.DATE);
			mes = cal.get(Calendar.MONTH) + 1;
			anyo = cal.get(Calendar.YEAR);

			if (dia < 10)
				Dia = '0' + dia.toString();
			else
				Dia = dia.toString();

			if (mes < 10)
				Mes = '0' + mes.toString();
			else
				Mes = mes.toString();

			String fhasta = Dia + Mes + anyo.toString();
			String[] C_FICHERO_OUT = { "RETURN" };

			String CPARAMETROS = null;

			String cempres;
			if (CEMPRES != null)
				cempres = CEMPRES.toString();
			else
				cempres = new String();
			String cestrec;
			if (CESTREC != null)
				cestrec = CESTREC.toString();
			else
				cestrec = new String();
			String ctiprec;
			if (CTIPREC != null)
				ctiprec = CTIPREC.toString();
			else
				ctiprec = new String();
			String cestado;
			if (CESTADO != null)
				cestado = CESTADO.toString();
			else
				cestado = new String();
			String vincu;
			if (CVINCU != null)
				vincu = CVINCU.toString();
			else
				vincu = new String();
			String estado;
			if (CESTADO != null)
				estado = CESTADO.toString();
			else
				estado = new String();

			String agente;
			if (CAGENTE != null)
				agente = CAGENTE.toString();
			else
				agente = new String();

			if (CMAP.intValue() == 344) {
				// Idioma|Empresa|Cestrec|FInicial|FFinal|Ctiprec|Agente|Cestado
				CPARAMETROS = CIDIOMA.toString() + '|' + cempres + '|' + cestrec + '|' + fdesde + '|' + fhasta + '|'
						+ ctiprec + '|' + agente + '|' + cestado;
			} else if (CMAP.intValue() == 345) {
				// Idioma|Empresa|Producto|FInicial|FFinal|Ramo|Vinculo|Agrupacion
				CPARAMETROS = CIDIOMA.toString() + '|' + cempres + '|' + cestrec + '|' + fdesde + '|' + fhasta + '|'
						+ ctiprec + '|' + agente + '|' + cestado;
			} else if (CMAP.intValue() == 346) {
				// Idioma|Empresa|Agrupacion|Producto|Ramo|Agente|Estado|Fecha_inicio|Fecha_fin
				CPARAMETROS = CIDIOMA.toString() + '|' + cempres + '|' + cestrec + '|' + fdesde + '|' + fhasta + '|'
						+ ctiprec + '|' + agente + '|' + cestado;
			}

			Map map = new PAC_IAX_MAP((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MAP__F_EJECUTA(CMAP.toString(), CPARAMETROS);

			logger.debug("ejecutaPAC_IAX_MAP__F_EJECUTAR" + map);

			ajax.guardarContenidoFinalAContenedorAjax(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map, C_FICHERO_OUT);

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map resultado = new HashMap();
				resultado.put("VALOR", resultadoAjax[0]);
				if (!isEmpty(resultadoAjax[1])) {
					resultado.put("FICHERO", resultadoAjax[1]);
					request.getSession().setAttribute("CFICHERO", resultadoAjax[1]);
				}
				ajax.guardarContenidoFinalAContenedorAjax(resultado);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr097Service - m�todo m_ajax_generar_resultados_map", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void cargarCombos(HttpServletRequest request) {
		logger.debug("Axisctr097Service cargarCombos");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map map = new HashMap();

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			request.setAttribute("EMPRESAS", tratarRETURNyMENSAJES(request, map));
			logger.debug("------- EMPRESAS:" + map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr097Service - m�todo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000075", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see buscaRamos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_busqueda_liquidaciones(HttpServletRequest request) {
		logger.debug("Axisctr097Service m_ajax_busqueda_ramos");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			if (!isEmpty(this.getCampoNumerico(request, "CEMPRES"))) {
				BigDecimal PCEMPRES = getCampoNumerico(request, "CEMPRES");
				BigDecimal PCAGENTE = getCampoNumerico(request, "CAGENTE");

				Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CIERES_TIPO17(PCEMPRES, PCAGENTE);
				logger.debug("------- liquidaciones:" + map);

				ajax.guardarContenidoFinalAContenedorAjax(map);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr097Service - m�todo m_ajax_busqueda_ramos", e);
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
	private void cargaAgente(HttpServletRequest request) throws Exception {
		if (isEmpty(request.getSession().getAttribute("axisctr_agente"))) {
			// Cargar Agente de la BD
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map mapCX = new PAC_IAX_COMMON((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_COMMON__F_GET_CXTAGENTE();

			HashMap map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, String.valueOf(mapCX.get("RETURN")),
							new BigDecimal(1));
			Map agente = new HashMap();
			logger.debug("agentes --> " + map);
			if (!isEmpty(tratarRETURNyMENSAJES(request, map))) {
				List listaAgentes = (List) tratarRETURNyMENSAJES(request, map, false);
				agente = getObjetoDeLista(listaAgentes, String.valueOf(mapCX.get("RETURN")), "CODI");
			}
			request.getSession().setAttribute("axisctr_agente", agente);

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
			mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES(null, null, CAGENTE, new BigDecimal(1));
			logger.debug(mapAgentes);
			List agentes = (List) mapAgentes.get("RETURN");

			if (!isEmpty(mapAgentes.get("RETURN")))
				agente = (Map) agentes.get(0);
		}

		request.getSession().setAttribute("axisctr_agente", agente);

		return mapAgentes;
	}

	/**
	 * Realiza una b�squeda de productos por Ajax.
	 * 
	 * @see Axisctr001Service#buscaProductos
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_ajax_actualizar_agente(HttpServletRequest request) {
		logger.debug("Axisctr097Service m_ajax_busqueda_productos");
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

	public void m_ajax_generar_resultado(HttpServletRequest request) {
		logger.debug("Axisctr097Servicem_ajax_generar_resultado");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// HashMap formdata = (HashMap)request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal CPROCES = this.getCampoNumerico(request, "SSPROCES");
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CCEMPRES");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CCAGENTE");

			logger.debug("proceso:" + CPROCES);
			logger.debug("empresa:" + CEMPRES);
			logger.debug("agente :" + CAGENTE);

			Map map = new PAC_IAX_LISTADO((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTADO__F_GENERAR_LISTADO(CEMPRES, CPROCES, CAGENTE);
			logger.debug(map);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(map,
					new String[] { "P_FITXER1", "P_FITXER2", "P_FITXER3", "P_FITXER4" });

			Map P_FITXER1 = new HashMap();
			P_FITXER1.put("P_FITXER1", map.get("P_FITXER1"));

			Map P_FITXER2 = new HashMap();
			P_FITXER2.put("P_FITXER2", resultadoAjax[2]);

			Map P_FITXER3 = new HashMap();
			P_FITXER3.put("P_FITXER3", resultadoAjax[3]);

			Map P_FITXER4 = new HashMap();
			P_FITXER4.put("P_FITXER4", resultadoAjax[4]);

			List RESULTADO = new ArrayList();
			RESULTADO.add(P_FITXER1);
			RESULTADO.add(P_FITXER2);
			RESULTADO.add(P_FITXER3);
			RESULTADO.add(P_FITXER4);

			ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);

			// ajax.rellenarPlAContenedorAjax(map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm029Service - m�todo m_domiciliar", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			// ajax.guardarContenidoFinalAContenedorAjax(ajaxResponse);
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

}
