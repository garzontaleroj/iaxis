package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr188Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr188Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	// f_get_detallegarantia
	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr188Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			String cform = getCampoTextual(request, "CFORM");
			if (isEmpty(cform) || !cform.equals(new String("AXISCTR004"))) {
				this.dbGrabarObjetoDb(request, usuario);
			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private ArrayList getInfo(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			HashMap info = new HashMap();
			request.setAttribute("CIDIOMA", usuario.getCidioma());
			ArrayList p = new ArrayList();
			Enumeration enumera = request.getParameterNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (fieldName.indexOf("COLUMNA") != -1 && fieldName.indexOf("MODIFVISIBLE") == -1) {
						info = new HashMap();
						if (i == 0) {
							info.put("NOMBRE_COLUMNA", fieldName);
							info.put("VALOR_COLUMNA", fieldValue);

						} else {
							info.put("NOMBRE_COLUMNA", fieldName + "__" + i);
							info.put("VALOR_COLUMNA", fieldValue);
						}
						if (!isEmpty(this.getCampoNumerico(request, fieldName))) {
							info.put("VALOR_COLUMNA", String.valueOf(this.getCampoNumerico(request, fieldName)));
							logger.debug(this.getCampoNumerico(request, fieldName));
						}
						p.add(info);
					}

				}

			}

			enumera = request.getAttributeNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String fieldValue = String.valueOf(request.getAttribute(fieldName));

				if (fieldName.indexOf("COLUMNA") != -1 && fieldName.indexOf("MODIFVISIBLE") == -1) {
					info = new HashMap();
					info.put("NOMBRE_COLUMNA", fieldName);
					info.put("VALOR_COLUMNA", fieldValue);
					if (!isEmpty(this.getCampoNumerico(request, fieldName))) {
						info.put("VALOR_COLUMNA", String.valueOf(this.getCampoNumerico(request, fieldName)));
						logger.debug(this.getCampoNumerico(request, fieldName));
					}
					p.add(info);
				}

			}

			return p;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return null;
		}

	}

	public void m_guardar(HttpServletRequest request, Axisctr188Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");
			// JLB
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASTAB(TIPO, NRIESGO, CPREGUN, CGARANT,
							generarT_IAX_Info(request, usuario));
			logger.debug(map);
			BigDecimal RETURN = (BigDecimal) map.get("RETURN");

			// logger.debug("Axisctr188 antes m_guardar");
			HashMap ma = this.f_Get_Avisos(request, this.whoami(this));
			// logger.debug("Axisctr188 despues m_guardar");
			// logger.debug("Axisctr188 despues m_guardar_detalle"+ma);

			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, ma);
			request.setAttribute("PLSTAVISOS", ma.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) { /////////// AVISOS
				if (RETURN.intValue() == 0)
					formdata.put("ok", this.tratarRETURNyMENSAJES(request, map));

			}

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ArrayList tinfo = this.getInfo(request);

		int n = tinfo.size(); // numero de parametros

		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < tinfo.size(); i++) {
				HashMap mm = (HashMap) tinfo.get(i);

				paramObj = new ObIaxInfo((String) mm.get("NOMBRE_COLUMNA"), (String) mm.get("VALOR_COLUMNA"), "",
						new BigDecimal(1));
				paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
				paramsList[i] = paramObj;

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr188Action thisAction) {
		logger.debug("Axiscrt163Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			if (isEmpty(NRIESGO)) {
				NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			}

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(TIPO, CPREGUN, CGARANT);
			logger.debug(map);
			formdata.put("lstcabecera", this.tratarRETURNyMENSAJES(request, map));

			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_PREGUNTAB(TIPO, NRIESGO, CGARANT, CPREGUN);
			logger.debug(map);

			// si se ha producido algun aviso elimina las lineas a�adidas.
			ArrayList aviso = (ArrayList) request.getAttribute("PLSTAVISOS");
			logger.debug(aviso);

			if (aviso != null && aviso.size() > 0) {
				Map map2 = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(TIPO, NRIESGO, CPREGUN, CGARANT, null);
				logger.debug(map2);
			}
			// contiene las lineas que se cargan en pantalla
			ArrayList<HashMap> lstpreguntab = (ArrayList) this.tratarRETURNyMENSAJES(request, map);
			if (lstpreguntab != null && lstpreguntab.size() > 0) {
				Collections.sort(lstpreguntab, new Comparator() {
					public int compare(Object hashA, Object hashB) {
						HashMap OB_IAX_PREGUNTASTAB_1 = (HashMap) ((HashMap) hashA).get("OB_IAX_PREGUNTASTAB");
						HashMap OB_IAX_PREGUNTASTAB_2 = (HashMap) ((HashMap) hashB).get("OB_IAX_PREGUNTASTAB");
						BigDecimal lineaA = (BigDecimal) OB_IAX_PREGUNTASTAB_1.get("NLINEA");
						BigDecimal lineaB = (BigDecimal) OB_IAX_PREGUNTASTAB_2.get("NLINEA");
						return lineaA.compareTo(lineaB);
					}
				});
			}

			// INI IAXIS 5326 AABG: Se eliminan itemas repetidos
			if (lstpreguntab != null) {
				for (HashMap hashMap : lstpreguntab) {
					HashMap OB_IAX_PREGUNTASTAB = (HashMap) ((HashMap) hashMap).get("OB_IAX_PREGUNTASTAB");
					ArrayList<HashMap> OB_IAX_COLUMNAS = (ArrayList<HashMap>) OB_IAX_PREGUNTASTAB.get("TCOLUMNAS");
					for (HashMap hashMapCols : OB_IAX_COLUMNAS) {
						HashMap OB_IAX_PREGUNTASTAB_COLS = (HashMap) ((HashMap) hashMapCols)
								.get("OB_IAX_PREGUNTASTAB_COLUMNS");
						ArrayList<HashMap> OB_IAX_LISTA = (ArrayList<HashMap>) OB_IAX_PREGUNTASTAB_COLS.get("TLISTA");
						ArrayList<HashMap> lstFinal = new ArrayList<HashMap>();
						for (HashMap hashItem : OB_IAX_LISTA) {
							eliminarItemsRepetidos(lstFinal, hashItem);
						}
						OB_IAX_PREGUNTASTAB_COLS.remove("TLISTA");
						OB_IAX_PREGUNTASTAB_COLS.put("TLISTA", lstFinal);
						break;
					}
					break;
				}
			}
			// FIN IAXIS 5326 AABG: Se eliminan itemas repetidos
			formdata.put("lstpreguntab", lstpreguntab);

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}
	}

	// INI IAXIS 5326 AABG: Se eliminan itemas repetidos
	public void eliminarItemsRepetidos(ArrayList<HashMap> lstFinal, HashMap item) {
		boolean existe = false;
		for (HashMap map : lstFinal) {
			HashMap OB_IAX_PREGUNTASTAB_COLS = (HashMap) ((HashMap) map).get("OB_IAX_PREGLISTATAB");
			HashMap OB_IAX_PREGUNTASTAB_COLS_ITEM = (HashMap) ((HashMap) item).get("OB_IAX_PREGLISTATAB");
			if (OB_IAX_PREGUNTASTAB_COLS.get("CLISTA").toString()
					.equals(OB_IAX_PREGUNTASTAB_COLS_ITEM.get("CLISTA").toString())) {
				existe = true;
				break;
			}
		}
		if (!existe)
			lstFinal.add(item);
	}
	// FIN IAXIS 5326 AABG: Se eliminan itemas repetidos

	public void m_ajax_rellenacabecera(HttpServletRequest request) {
		logger.debug("Axisctr019Service m_ajax_rellenacabecera");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CABECERA_PREGUNTAB(TIPO, CPREGUN, CGARANT);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(this.tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_rellenacabecera", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_delpreguntasb(HttpServletRequest request) {
		logger.debug("Axisctr188Service m_ajax_delpreguntasb");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CPREGUN = this.getHiddenCampoNumerico(request, "CPREGUN");
			BigDecimal NLINEA = this.getHiddenCampoNumerico(request, "NLINEA");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");// Nom�s si estem a preguntes de
																					// garantia
			String TIPO = this.getCampoTextual(request, "TIPO_PREGUNTA");

			Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_DEL_PREGUNTASTAB(TIPO, NRIESGO, CPREGUN, CGARANT, NLINEA);
			logger.debug(map);
			ajax.guardarContenidoFinalAContenedorAjax(this.tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr001Service - m�todo m_ajax_rellenacabecera", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla.
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axisctr188Action thisAction) {
		logger.debug("Axiscrt163Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			/*
			 * Combo de ejemplo :
			 * 
			 * PAC_IAX_LISTVALORES pac_axis_listValores = new
			 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * 
			 * 
			 * Cargar la lista de Conceptos
			 */
			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscrt163Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	public void m_ajax_del_detalle(HttpServletRequest request) {
		logger.debug("Axisctr188Service m_ajax_del_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");

			BigDecimal NMOVIMI = this.getHiddenCampoNumerico(request, "NMOVIMI");
			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_DEL_DESGLOSEGAR(SSEGURO, CGARANT, NRIESGO, NMOVIMI, NORDEN);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr188Service - m�todo m_ajax_del_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_guardar_detalle(HttpServletRequest request) {
		logger.debug("Axisctr188 m_guardar_detalle");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal CGARANT = this.getHiddenCampoNumerico(request, "CGARANT");

			BigDecimal NMOVIMI = this.getHiddenCampoNumerico(request, "NMOVIMI");
			BigDecimal NORDEN = this.getHiddenCampoNumerico(request, "NORDEN");
			BigDecimal CCONCEPTO = this.getHiddenCampoNumerico(request, "CCONCEPTO");
			String TDESCRIPCION = this.getHiddenCampoTextual(request, "TDESCRIPCION");
			BigDecimal ICAPITAL = this.getHiddenCampoNumerico(request, "ICAPITAL");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_SET_DESGLOSEGAR(SSEGURO, CGARANT, NRIESGO, NMOVIMI, NORDEN, CCONCEPTO,
							TDESCRIPCION, ICAPITAL);
			logger.debug(m);

			Object[] resultadoAjax = (Object[]) ajax.rellenarPlAContenedorAjax(m, new String[] { "PNSEQ_OUT" });

			if (resultadoAjax[0].equals(new BigDecimal(0))) {
				Map PNSEQ_OUT = new HashMap();
				PNSEQ_OUT.put("PNSEQ_OUT", resultadoAjax[1]);
				logger.debug(resultadoAjax[1]);
				List RESULTADO = new ArrayList();
				RESULTADO.add(PNSEQ_OUT);

				ajax.guardarContenidoFinalAContenedorAjax(RESULTADO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm036Service - m�todo m_guardar_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cancelar_desglose(HttpServletRequest request) {
		logger.debug("Axisctr188Service m_ajax_cancelar_desglose");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_GARANTIAS_BD(NRIESGO);
			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);

			ajax.guardarContenidoFinalAContenedorAjax(m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr188Service - m�todo m_ajax_cancelar_desglose", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

}
