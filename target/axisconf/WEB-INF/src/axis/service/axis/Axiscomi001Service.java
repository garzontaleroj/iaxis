package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMISIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axiscomi001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisctr148Service.java
 * 
 * @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
 */
public class Axiscomi001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/*****************************************
	 * W****** M�TODOS DE INICIALIZACION
	 *******************************************/

	/*********************************************************************************************************************/
	public

			void m_init(HttpServletRequest request, Axiscomi001Action thisAction) {
		logger.debug("Axiscomi001Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi001Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axiscomi001Action thisAction) {
		logger.debug("Axiscomi001Service m_form");
		try {

			cargarDatosCombos(request);

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
			 * registro.put("DESCRIPCION","Cuadro1"); // registro.put("TIPO","Comisi�n"); //
			 * registro.put("ESTADO","Validado"); // registro.put("FINI","01-01-2010");
			 * registro.put("FFIN","01-12-2010"); lista_falsa.add(registro);
			 * 
			 * HashMap registro1 = new HashMap();
			 * 
			 * registro1.put("DESCRIPCION","Cuadro2"); //
			 * registro1.put("TIPO","Sobre Comisi�n"); //
			 * registro1.put("ESTADO","Validado"); // registro1.put("FINI","01-01-2010");
			 * registro1.put("FFIN",""); lista_falsa.add(registro1);
			 * 
			 * HashMap registro2 = new HashMap();
			 * 
			 * registro2.put("DESCRIPCION","Cuadro3"); // registro2.put("TIPO","Comisi�n");
			 * // registro2.put("ESTADO","Pte. validaci�n"); //
			 * registro2.put("FINI","01-07-2010"); registro2.put("FFIN","");
			 * lista_falsa.add(registro2);
			 */

			/* ********************************************************************* */
			/* ********************************************************************* */
			/* ********************************************************************* */

			/*
			 * request.getSession().setAttribute("listaProcesos", lista_falsa);
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Gesti�n de campos y dependencias
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axiscomi001Action thisAction) {
		logger.debug("Axiscomi001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisctr_listaComisiones");

				BigDecimal CCOMISI = getCampoNumerico(request, "VCCOMISI");
				String TCOMISI = getCampoTextual(request, "VTCOMISI");
				BigDecimal CTIPO = getCampoNumerico(request, "VCTIPO");
				//
				BigDecimal CESTADO = getCampoNumerico(request, "VCESTADO");
				Date FINIVIG = stringToSqlDate(getCampoTextual(request, "VFINIVIG"));
				Date FFINVIG = stringToSqlDate(getCampoTextual(request, "VFFINVIG"));

				formdata.put("VCCOMISI", CCOMISI);
				formdata.put("VTCOMISI", TCOMISI);
				formdata.put("VCTIPO", CTIPO);
				formdata.put("VCESTADO", CESTADO);
				formdata.put("VFINIVIG", FINIVIG);
				formdata.put("VFFINVIG", FFINVIG);

				HashMap map = new HashMap();

				// map = new
				// PAC_IAX_COMISIONES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_COMISIONES__F_SET_OBJ_CUADROCOMISION(CCOMISI,CTIPO,CESTADO,FINIVIG,FFINVIG,MODO);
				// PCCOMISI, PTCOMISI, PCTIPO, PCESTADO, PFFECHAINI, PFFECHAFIN
				map = new PAC_IAX_COMISIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_COMISIONES__F_GET_CUADROSCOMISION(CCOMISI, TCOMISI, CTIPO, CESTADO, FINIVIG,
								FFINVIG);

				logger.debug("----> cuadros:" + map.get("PCUADROS"));
				BigDecimal lista = (BigDecimal) tratarRETURNyMENSAJES(request, map, false);

				request.getSession().setAttribute("listaCuadros", map.get("PCUADROS"));

			} else {
				// Qu� importa esto! No llenaremos el log de debugs por paginaci�n!
				// logger.debug("Axiscomi004 paginando");
			}

		} catch (Exception e) {

			logger.error("Error en el servicio Axiscomi004Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		// Lista retenidos
		Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
		logger.debug(map);
		request.setAttribute("RETENIDO", (List) tratarRETURNyMENSAJES(request, map));

		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	// INI TCS_2 - ACL - 22/01/2019
	public void m_eliminarCUADRO(HttpServletRequest request, Axiscomi001Action thisAction) {
		logger.debug("Axiscomi001Service m_eliminarCUADRO");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CCOMISI = null;
			try {
				CCOMISI = new BigDecimal(String.valueOf(request.getParameter("CCOMISI")));
			} catch (Exception ex) {
				CCOMISI = null;
			}

			PAC_IAX_COMISIONES pac_axis_comisiones = new PAC_IAX_COMISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_comisiones.ejecutaPAC_IAX_COMISIONES__F_ANULAR_CUADRO(CCOMISI);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el mtodo Axiscomi003Service.m_eliminarCUADRO", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
