package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_GFI;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisgfi002Action;
import axis.mvc.model.ObIaxGfiform;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisgfi002Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisgfi002Service.class);

	public void m_init(HttpServletRequest request, Axisgfi002Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi002Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_form(HttpServletRequest request, Axisgfi002Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*
	 * Recarga la pantalla con los datos de la f�rmula seleccionada en el arbol de
	 * la parte izquierda de la pantalla
	 **/

	public void m_recargar(HttpServletRequest request, Axisgfi002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datos_formula = new HashMap();
		Map mapa = new HashMap();
		try {

			BigDecimal PCLAVE = (BigDecimal) getCampoNumerico(request, "PCLAVE");
			/* Recuperamos el �rbol de f�rmulas */

			if (PCLAVE != null) {
				Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_GFI__F_GET_FORMULA(PCLAVE);
				logger.debug(map);
				mapa = (Map) tratarRETURNyMENSAJES(request, map);
			}
			/* recuperar combos */
			this.recuperarCombos(request, thisAction);

			request.setAttribute("axisgfi002_detalle_formula", mapa);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void recuperarCombos(HttpServletRequest request, Axisgfi002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map datos_formula = new HashMap();
		try {
			/* Recuperamos el combo RAMO */
			String tipo = this.getCampoTextual(request, "tipo");
			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(tipo, null);
			List comboRamo = (List) tratarRETURNyMENSAJES(request, map, false);
			datos_formula.put("RAMO", comboRamo);
			logger.debug(comboRamo);

			/* Recuperamos el combo RASTRO */

			map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_RASTRO();
			List comboRastro = (List) tratarRETURNyMENSAJES(request, map, false);
			datos_formula.put("RASTRO", comboRastro);
			logger.debug(comboRastro);

			/* Recurpermos el combo UTILIZADO */
			map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GET_UTILI();
			List comboUtil = (List) tratarRETURNyMENSAJES(request, map, false);
			datos_formula.put("UTIL", comboUtil);
			logger.debug(comboUtil);

			/* Guardamos el arbol de f�rmulas y los datos */
			request.setAttribute("axisgfi002_datos_formula", datos_formula);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_bucar_formula(HttpServletRequest request, Axisgfi002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String PFORMULA = getCampoTextual(request, "PFORMULA");
			BigDecimal PCLAVE = getCampoNumerico(request, "PCLAVE");
			// String PCODIGO = "CUMTRAMO";
			// String PCODIGO = "PRIMA_PURA_VIDA_FAMILIAR";
			// String PCODIGO = "PRIMA_COMERCIAL_VIDA_FAMILIAR";
			// String PCODIGO = "PRIMA_COMER_FALL_CRE_REA";
			String PCODIGO = getCampoTextual(request, "PCODIGO");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal CRASTRO = getCampoNumerico(request, "CRASTRO");
			BigDecimal CUTILI = getCampoNumerico(request, "CUTILI");

			/* Recuperar combos */
			this.recuperarCombos(request, thisAction);
			/* Recuperamos el �rbol de f�rmulas */

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_SET_CONSULTA(PCLAVE, PCODIGO, PFORMULA, CRAMO, CRASTRO, CUTILI);
			logger.debug(map);
			List lista = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("axisgfi002_arbol_formula", lista);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*
	 * private void mockme() throws Exception { UsuarioBean usuario=new
	 * UsuarioBean("pim","pam"); String
	 * USERNAME=((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).
	 * getMetaData().getUserName();
	 * 
	 * int n=1; // numero de parametros ObIaxGfiparam[] paramsList=new
	 * ObIaxGfiparam[n]; // primero, llenar los parametros { ObIaxGfiparam
	 * paramObj=null; java.math.BigDecimal clave=null; String parametro=null; String
	 * tparam=null; for (int i=0;i<n;i++) { paramObj=new ObIaxGfiparam(clave,
	 * parametro, tparam); paramObj._SQL_NAME=UsuarioBean.fixOwner(USERNAME,
	 * "OB_IAX_GFIPARAM"); // ! paramsList[i]=paramObj; } }
	 * 
	 * // con la lista de parametros llenar el ojeto table TIaxGfiparam params=new
	 * TIaxGfiparam(paramsList); params._SQL_NAME=UsuarioBean.fixOwner(USERNAME,
	 * "T_IAX_GFIPARAM"); // !
	 * 
	 * // finalmente, llenar el objeto form ObIaxGfiform ForMula=null; {
	 * java.math.BigDecimal clave=null; String codigo=null; String descripcion=null;
	 * String formula=null; java.math.BigDecimal cramo=null; java.math.BigDecimal
	 * cutili=null; java.math.BigDecimal crastro=null; java.math.BigDecimal
	 * sumatorio=null; ForMula=new ObIaxGfiform(clave, codigo, descripcion, formula,
	 * cramo, cutili, crastro, sumatorio, params);
	 * ForMula._SQL_NAME=UsuarioBean.fixOwner(USERNAME, "OB_IAX_GFIFORM"); // !
	 * 
	 * } Connection conn=null; new
	 * PAC_IAX_GFI(conn).ejecutaPAC_IAX_GFI__F_GRABAR_FORMULA(ForMula);
	 * 
	 * }
	 */

	public void m_grabar_formula(HttpServletRequest request, Axisgfi002Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		ObIaxGfiform ForMula = null;

		try {

			String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData()
					.getUserName();

			/* crear objeto */
			BigDecimal clave = getCampoNumerico(request, "CLAVE");
			String codigo = getCampoTextual(request, "CODIGO");
			String descripcion = getCampoTextual(request, "DESCRIPCION");
			String formula = getCampoTextual(request, "FORMULA");
			BigDecimal cramo = getCampoNumerico(request, "CRAMO");
			BigDecimal cutili = getCampoNumerico(request, "CUTILI");
			BigDecimal crastro = getCampoNumerico(request, "CRASTRO");
			java.math.BigDecimal sumatorio = getCampoNumerico(request, "SUMATORIO");
			ForMula = new ObIaxGfiform(clave, codigo, descripcion, formula, cramo, cutili, crastro, sumatorio, null);
			ForMula._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_GFIFORM"); // !

			Map map = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_GRABAR_FORMULA(ForMula);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisgfi002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*
	 * ******************************* NAVEGACI�N A DIFERENTES PANTALLAS
	 * ********************
	 */

	public void m_consultar_tramos(HttpServletRequest request, Axisgfi002Action thisAction) {
		logger.debug("axisgfi002Service m_consultar_pol");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisgfi002", formdata);
			// BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

		} catch (Exception e) {
			logger.error("Error en el servicio axisrmb002Service - m�todo m_consultar_pol", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_consultar_terminos(HttpServletRequest request, Axisgfi002Action thisAction) {
		logger.debug("axisgfi002Service m_consultar_pol");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila
			thisAction.topPila(request, "formdata_axisgfi002", formdata);
			// BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

		} catch (Exception e) {
			logger.error("Error en el servicio axisrmb002Service - m�todo m_consultar_pol", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver_tramos(HttpServletRequest request, Axisgfi002Action thisAction) {
		logger.debug("Axisgfi002Service m_volver_pol");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axisgfi002 = (Map) thisAction.removeTopPila(request, "formdata_axisgfi002");
			if (!isEmpty(formdata_axisgfi002))
				formdata.putAll(formdata_axisgfi002);

		} catch (Exception e) {
			logger.error("Error en el servicio axisgfi002Service - m�todo m_volver_pol", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_volver_terminos(HttpServletRequest request, Axisgfi002Action thisAction) {
		logger.debug("Axisgfi002Service m_volver_pol");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map formdata_axisgfi002 = (Map) thisAction.removeTopPila(request, "formdata_axisgfi002");
			if (!isEmpty(formdata_axisgfi002))
				formdata.putAll(formdata_axisgfi002);

		} catch (Exception e) {
			logger.error("Error en el servicio axisgfi002Service - m�todo m_volver_pol", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_ejecutar_formula(HttpServletRequest request) {
		logger.debug("Axisgfi002Service ajax_ejecutar_formula");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// oracle.sql.StructDescriptor structDescriptor
			// =oracle.sql.StructDescriptor.createDescriptor("OB_IAX_GFIPARAMVALOR",(java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			// oracle.sql.ArrayDescriptor arrayDescriptor
			// =oracle.sql.ArrayDescriptor.createDescriptor("T_IAX_GFIPARAMSVALOR",(java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			List listaParams = new ArrayList();
			Map<String, String[]> map = request.getParameterMap();
			StringBuffer buf = new StringBuffer();

			for (Map.Entry<String, String[]> entry : map.entrySet()) {
				String name = (String) entry.getKey();
				if (name.indexOf("PARAM_") >= 0) {
					// seccion parametros
					// Object[] attributes = new Object[3];
					// attributes[0]=2;
					// attributes[1]=name.substring(name.indexOf("_")+1,name.length());
					// String[] v= entry.getValue();
					// try{
					// attributes[2]= new BigDecimal(v[0]);
					// STRUCT struct = new STRUCT(structDescriptor,
					// (java.sql.Connection)request.getAttribute(Constantes.DB01CONN), attributes);
					// listaParams.add(struct);
					// }catch(Exception e){
					// attributes[2]=null;
					// }
					String[] v = entry.getValue();
					if (!isEmpty(v[0])) {
						String s = "2:" + name.substring(name.indexOf("_") + 1, name.length()) + ":" + v[0];
						buf.append(s + '|');
					} else {
						SINPAQUETE sinpaquete = new SINPAQUETE(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
						HashMap map2 = sinpaquete.ejecutaF_AXIS_LITERALES(new BigDecimal(9000480),
								usuario.getCidioma());
						ajax.guardarErrorAContenedorAjax((String) map2.get("RETURN"));
						return;
					}

				} else {
					if (name.indexOf("PREGUN_") >= 0) {
						// seccion preguntas.
						// Object[] attributes = new Object[3];
						// attributes[0]=1;
						// String[] v= entry.getValue();
						// attributes[1]=v[0];
						// String numPreg = name.substring(name.indexOf("_"),name.length());
						// v = map.get("PREG_VALOR"+numPreg);
						// try{
						// attributes[2]=new BigDecimal(v[0]);
						// STRUCT struct = new STRUCT(structDescriptor,
						// (java.sql.Connection)request.getAttribute(Constantes.DB01CONN), attributes);
						// listaParams.add(struct);
						// }catch(Exception e){
						// attributes[2]=null;
						// }
						String[] v = entry.getValue();
						if (!isEmpty(v[0])) {
							String s = "1:" + v[0];
							String numPreg = name.substring(name.indexOf("_"), name.length());
							v = map.get("PREG_VALOR" + numPreg);
							if (!isEmpty(v[0])) {
								s = s + ":" + v[0];
								// listaParams.add(s);
								buf.append(s + '|');
							} else {
								SINPAQUETE sinpaquete = new SINPAQUETE(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
								HashMap map2 = sinpaquete.ejecutaF_AXIS_LITERALES(new BigDecimal(9000480),
										usuario.getCidioma());
								ajax.guardarErrorAContenedorAjax((String) map2.get("RETURN"));
								return;
							}
						}
					}
				}
			}
			// ARRAY array = new ARRAY(arrayDescriptor,
			// (java.sql.Connection)request.getAttribute(Constantes.DB01CONN),
			// listaParams.toArray());
			logger.debug("axisgfi002Service m_ajax_ejecutar_formula" + listaParams);
			BigDecimal PCLAVE = getCampoNumerico(request, "PCLAVE");
			// HashMap mapResult=new
			// PAC_IAX_GFI((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_GFI__F_EVALUAR_FORMULA(null,PCLAVE,new
			// BigDecimal(0),array);
			HashMap mapResult = new PAC_IAX_GFI((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_GFI__F_EVALUAR_FORMULA(null, PCLAVE, new BigDecimal(0), buf.toString());
			ajax.guardarContenidoFinalAContenedorAjax(mapResult);

		} catch (Exception e) {
			logger.error("Error en el servicio ajax_ejecutar_formula - m�todo m_ajax_ejecutar_formula", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
