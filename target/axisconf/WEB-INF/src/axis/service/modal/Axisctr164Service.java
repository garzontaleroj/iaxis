package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.modal.Axisctr164Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * AxisXXXModalplantillaAction.java 04/06/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr164Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisctr164Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisctr164Action thisAction) {
		logger.debug("Axisctr164ervice m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SCLAGEN;
		BigDecimal NORDCLA;
		BigDecimal MULT;
		try {
			SCLAGEN = this.getHiddenCampoNumerico(request, "SCLAGEN");
			NORDCLA = this.getHiddenCampoNumerico(request, "NORDCLA");
			MULT = this.getHiddenCampoNumerico(request, "MULT");
			formdata.put("MULT", MULT);
			if (SCLAGEN != null && NORDCLA != null) {
				getClausulaMult(request, SCLAGEN, NORDCLA);
			} else if (SCLAGEN != null) {
				getClausula(request, SCLAGEN);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr164Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Inicializa las cl�usulas y las mete en el objeto de request
	 * axisctr_clausulasDefinidas.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */
	private void getClausula(HttpServletRequest request, BigDecimal SCLAGEN) throws Exception {
		// Recuperamos formData
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Inicializamos los ArrayList de HashMaps de Cl�usulas definidas y espec�ficas
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Recuperamos el objeto ob_iaxpar_clausulas por sclagen
		Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAM(SCLAGEN);
		logger.debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAM return: " + map);

		Map map2 = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(SCLAGEN);
		logger.debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD return: " + map2);

		HashMap OB_IAXPAR_CLAUSULA = (HashMap) tratarRETURNyMENSAJES(request, map);
		if (OB_IAXPAR_CLAUSULA != null) {
			ArrayList<HashMap> parametros = (ArrayList) OB_IAXPAR_CLAUSULA.get("PARAMETROS");
			if (parametros != null) {
				for (HashMap obj : parametros) {
					if (obj.get("OB_IAX_CLAUSUPARA") != null) {
						if (((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME") != null) {
							((HashMap) obj.get("OB_IAX_CLAUSUPARA")).put("TTEXTO", getTTEXTOClausual((HashMap) map2,
									(BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME"), request));
						}

					}
				}
			}

		}
		// Si hay clausulas para el prodcuto
		if (!isEmpty(OB_IAXPAR_CLAUSULA)) {
			formdata.put("axisctr_clausula", !isEmpty(OB_IAXPAR_CLAUSULA) ? OB_IAXPAR_CLAUSULA : new HashMap());
		}

		// {RETURN={CTIPO=4, FFINCLAU=null, CPARAMS=2, CIDENTITY=0, FINICLAU=2010-11-16
		// 00:00:00.0, SCLAGEN=28, PARAMETROS=[{OB_IAX_CLAUSUPARA={CFORMAT=2, NPARAME=1,
		// TTEXTO=Hola, TPARAME=N�mero de Pr�stamo, SCLAGEN=28}},
		// {OB_IAX_CLAUSUPARA={CFORMAT=2, NPARAME=2, TTEXTO=null, TPARAME=Entidad
		// Financiera, SCLAGEN=28}}], TCLAESP=null, TCLAGEN=null}, MENSAJES=null}

	}

	/**
	 * Inicializa las cl�usulas y las mete en el objeto de request
	 * axisctr_clausulasDefinidas.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @throws Exception
	 */
	private void getClausulaMult(HttpServletRequest request, BigDecimal SCLAGEN, BigDecimal NORDCLA) throws Exception {
		// Recuperamos formData
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Inicializamos los ArrayList de HashMaps de Cl�usulas definidas y espec�ficas
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Recuperamos el objeto ob_iaxpar_clausulas por sclagen
		Map map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAMMULT(SCLAGEN, NORDCLA);
		logger.debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GETCLAUSULAPARAM return: " + map);

		/*
		 * Map map2 =
		 * pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD(SCLAGEN);
		 * logger.
		 * debug("pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEECLAUSULAPROD return: "
		 * +map2);
		 */

		HashMap OB_IAXPAR_CLAUSULA = (HashMap) tratarRETURNyMENSAJES(request, map);
		/*
		 * if (OB_IAXPAR_CLAUSULA != null){ ArrayList<HashMap> parametros =
		 * (ArrayList)OB_IAXPAR_CLAUSULA.get("PARAMETROS"); if (parametros!=null){ for
		 * (HashMap obj : parametros){ if (obj.get("OB_IAX_CLAUSUPARA")!=null){ if
		 * (((HashMap)obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME")!=null){
		 * ((HashMap)obj.get("OB_IAX_CLAUSUPARA")).put("TTEXTO",
		 * getTTEXTOClausual((HashMap)map2,(BigDecimal)((HashMap)obj.get(
		 * "OB_IAX_CLAUSUPARA")).get("NPARAME"), request )); }
		 * 
		 * } } }
		 * 
		 * }
		 */
		// Si hay clausulas para el prodcuto
		if (!isEmpty(OB_IAXPAR_CLAUSULA)) {
			formdata.put("axisctr_clausula", !isEmpty(OB_IAXPAR_CLAUSULA) ? OB_IAXPAR_CLAUSULA : new HashMap());
		}

		// {RETURN={CTIPO=4, FFINCLAU=null, CPARAMS=2, CIDENTITY=0, FINICLAU=2010-11-16
		// 00:00:00.0, SCLAGEN=28, PARAMETROS=[{OB_IAX_CLAUSUPARA={CFORMAT=2, NPARAME=1,
		// TTEXTO=Hola, TPARAME=N�mero de Pr�stamo, SCLAGEN=28}},
		// {OB_IAX_CLAUSUPARA={CFORMAT=2, NPARAME=2, TTEXTO=null, TPARAME=Entidad
		// Financiera, SCLAGEN=28}}], TCLAESP=null, TCLAGEN=null}, MENSAJES=null}

	}

	private String getTTEXTOClausual(HashMap map, BigDecimal NPARAME, HttpServletRequest request) {
		HashMap OB_IAX_CLAUSULA = (HashMap) tratarRETURNyMENSAJES(request, map);
		BigDecimal nparame_temp = null;
		String ttextot = "";
		if (OB_IAX_CLAUSULA != null) {
			ArrayList<HashMap> parametros = (ArrayList) OB_IAX_CLAUSULA.get("PARAMETROS");
			if (parametros != null) {
				for (HashMap obj : parametros) {
					if (obj.get("OB_IAX_CLAUSUPARA") != null) {
						nparame_temp = (BigDecimal) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("NPARAME");
						if (nparame_temp.equals(NPARAME)) {
							ttextot = (String) ((HashMap) obj.get("OB_IAX_CLAUSUPARA")).get("TTEXTO");
							if (ttextot == null)
								ttextot = "";
							return ttextot;
						}
					}
				}
			}

		}
		return ttextot;

	}

	/**
	 * Permite a�adir o modificar los parametros de las clausulas de request
	 * CIDENTITY. Graba la nueva cl�usula a BD.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void ajax_setParametros(HttpServletRequest request) throws Exception {
		logger.debug("Axisctr008Service ajax_setParametros");
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		// Inicializamos los ArrayList de HashMaps de Cl�usulas definidas y espec�ficas
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		BigDecimal NPARAME_temp, sclagen, nordcla;
		String TPARAME_temp;
		ArrayList<HashMap<BigDecimal, String>> parametros;
		try {
			// Recuperem els parametres que comencem per NPARAME_
			sclagen = this.getHiddenCampoNumerico(request, "SCLAGEN");
			nordcla = this.getHiddenCampoNumerico(request, "NORDCLA");
			BigDecimal mult = this.getHiddenCampoNumerico(request, "MULT");
			parametros = getListaParametros((Map<String, String>) formdata);
			for (HashMap<BigDecimal, String> m : parametros) {
				Iterator<BigDecimal> it = m.keySet().iterator();
				while (it.hasNext()) {
					NPARAME_temp = it.next();
					TPARAME_temp = m.get(NPARAME_temp);
					Map rmap = null;
					if (mult != null) {
						rmap = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULAMULT(sclagen, nordcla,
								NPARAME_temp, TPARAME_temp);
					} else {
						rmap = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GRABACLAUSULA(sclagen, NPARAME_temp,
								TPARAME_temp);
					}
					ajax.rellenarPlAContenedorAjax(rmap);
					ajax.guardarContenidoFinalAContenedorAjax(rmap);
					BigDecimal retorno = (BigDecimal) tratarRETURNyMENSAJES(request, rmap);
					if (!"0".equals(retorno.toString())) {
						return;
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr008Service - m�todo m_anadir", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private ArrayList<HashMap<BigDecimal, String>> getListaParametros(Map<String, String> formdata) {
		HashMap<BigDecimal, String> parametro_temp;
		ArrayList<HashMap<BigDecimal, String>> retorno = new ArrayList<HashMap<BigDecimal, String>>();
		Iterator i = formdata.keySet().iterator();
		String key;
		while (i.hasNext()) {
			key = i.next().toString();
			if ((key.startsWith("NPARAME_")) && (key.indexOf("_MODIFVISIBLE") == -1) && (key.indexOf("joined") == -1)) {
				parametro_temp = new HashMap<BigDecimal, String>();
				parametro_temp.put(new BigDecimal(key.substring(key.indexOf("_") + 1)), formdata.get(key));
				retorno.add(parametro_temp);
			}
		}
		return retorno;
	}
}
