package axis.service.axis;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.json.JSONObject;

import axis.jdbc.AccesoSQL;
import axis.jdbc.PAC_IAX_CODIGOS;
import axis.mvc.control.axis.Axislit001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axislit001Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Autor creaci�n</a> Fecha:
 *         DD/MM/YYYY PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 DD/MM/YYYY
 *         XXX(iniciales) 1. Creaci�n del Service. Bug.9296 2.0 DD/MM/YYYY
 *         XXX(iniciales) 2. Ejemplo : A�adir funcionalidad Ramo - Producto .
 *         Bug.: XXXX
 */
public class Axislit001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

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
	public void m_init(HttpServletRequest request, Axislit001Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axislit001Action thisAction) {
		logger.debug("Axislit001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislit001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. XPL 03052010 BUG XXX
	 * 
	 * @param request
	 */
	private void m_cargarCombos(HttpServletRequest request, Axislit001Action thisAction) {
		logger.debug("Axislit001Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

			PAC_IAX_CODIGOS pac_axis_listCodigos = new PAC_IAX_CODIGOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listCodigos.ejecutaPAC_IAX_CODIGOS__F_GET_IDIOMAS_ACTIVOS();
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);
			listValores.put("lstIdiomas", map.get("PCURIDIOMAS"));

			formdata.put("listValores", listValores);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislit001Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla. XPL 03052010 BUG XXX
	 * 
	 * @param request
	 */
	public void m_buscar(HttpServletRequest request, Axislit001Action thisAction) {
		logger.debug("Axislit001Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		JSONObject miJSONObject = new JSONObject();
		JSONObject jsonO = new JSONObject();
		try {
			String TLITERA = this.getCampoTextual(request, "TLITERA");
			logger.debug("TLITERA : " + TLITERA);

			Connection cnx = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);
			ArrayList resultats = new ArrayList();
			if (!isEmpty(TLITERA)) {
				System.err.println("axislits/hotspot.jsp, TLITERA:" + TLITERA);
				TLITERA = StringUtils.replace(TLITERA, "'", "''");
				TLITERA = TLITERA.toUpperCase();
				String sql = "select * from AXIS_LITERALES where CIDIOMA=" + usuario.getCidioma()
						+ " and upper(TLITERA) like '%" + TLITERA + "%' order by TLITERA";
				// probar si no tb hemos de buscar por SLITERA
				try {
					int SLITERA = Integer.parseInt(TLITERA);
					sql = "select * from AXIS_LITERALES where CIDIOMA=" + usuario.getCidioma()
							+ " and (upper(TLITERA) like '%" + TLITERA + "%' or SLITERA=" + SLITERA
							+ ") order by TLITERA";
				} catch (Exception e) {
					// pues no
				}
				jsonO = new JSONObject();
				AccesoSQL sqlStmnt = new AccesoSQL(cnx);
				ArrayList miResultado = sqlStmnt.executeQuery(cnx, sql);
				logger.debug("resultado : " + miResultado);
				jsonO.put("resultats", miResultado);
				jsonO.put("size", miResultado.size());
				// miJSONObject.put("toptareas", formatejatToptareas);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axislit001Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		logger.debug("jsonO : " + jsonO);
		request.setAttribute("JSONOBJECT", jsonO);
		request.getSession().setAttribute("JSONOBJECT", jsonO);
		request.setAttribute(Constantes.AJAXCONTAINER, jsonO);
	}

	public void m_guardar(HttpServletRequest request, Axislit001Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String pparams = this.getInfoStringConcatenar(request);

			PAC_IAX_CODIGOS pac_iax_codigos = new PAC_IAX_CODIGOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_iax_codigos.ejecutaPAC_IAX_CODIGOS__F_GET_CODIGOS(pparams);
			logger.debug(m);
			this.tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	protected String getInfoStringConcatenar(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

}
