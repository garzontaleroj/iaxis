package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axiscaj016Action;
import axis.mvc.control.modal.Axiscaj010Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj016Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axiscaj016Action thisAction) {
		logger.debug("Axiscaj016Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, Axiscaj016Action thisAction) {
		logger.debug("Axiscaj016Service m_form");
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			this.m_load_data(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_load_data(HttpServletRequest request, Axiscaj016Action thisAction) {
		logger.debug("Axiscaj001Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {

			String TIPO = request.getParameter("TIPO");
			formdata.put("TIPO", TIPO);

			String SPERSON = request.getParameter("SPERSON");
			formdata.put("SPERSON", SPERSON);
			logger.debug("+++++++SPERSON: " + SPERSON);

			/*
			 * if(TIPO!=null && TIPO.equals("PARTNERS")){
			 * 
			 * String CAGENTE=request.getParameter("CAGENTE"); formdata.put("CAGENTEP",
			 * CAGENTE); logger.debug("+++++++CAGENTEP: "+CAGENTE);
			 * 
			 * }else if(TIPO!=null && TIPO.equals("INTERMEDIARIOS")){ String
			 * CAGENTE=request.getParameter("CAGENTE"); formdata.put("CAGENTEI", CAGENTE);
			 * logger.debug("+++++++CAGENTEI: "+CAGENTE); }
			 */

			String FICHEROS = request.getParameter("FICHEROS");
			formdata.put("FICHEROS", FICHEROS);
			logger.debug("+++++++FICHEROS: " + FICHEROS);

			this.cargarDatos(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj001Service - m�todo m_load_data", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj016Action thisAction, Map formdata) throws Exception {
		try {

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CAGENTEI = this.getCampoNumerico(request, "CAGENTEI");
			BigDecimal CAGENTEP = this.getCampoNumerico(request, "CAGENTEP");
			// CAGENTEI=(BigDecimal)formdata.get("CAGENTEI");
			// CAGENTEP=(BigDecimal)formdata.get("CAGENTEP");
			String CONDICION = "";
			Map mapAgentes = new HashMap();
			Map agenteI = new HashMap();
			Map agenteP = new HashMap();

			if (!isEmpty(CAGENTEI)) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				CONDICION = "INTERMEDIARIO";
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTEI, new BigDecimal(1),
								CONDICION);
				List agentes = (List) mapAgentes.get("RETURN");
				if (!isEmpty(mapAgentes.get("RETURN"))) {
					agenteI = (Map) agentes.get(0);
				}
				logger.debug("+++++++Agente: " + agenteI);
				formdata.put("CAGENTEI", CAGENTEI);
				formdata.put("AGENTEI", agenteI);
			}

			if (!isEmpty(CAGENTEP)) {
				UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
				CONDICION = "PARTNER";
				mapAgentes = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTAGENTES_COND(null, null, CAGENTEP, new BigDecimal(1),
								CONDICION);
				List agentes = (List) mapAgentes.get("RETURN");
				if (!isEmpty(mapAgentes.get("RETURN"))) {
					agenteP = (Map) agentes.get(0);
				}
				logger.debug("+++++++Agente: " + agenteP);
				formdata.put("CAGENTEP", CAGENTEP);
				formdata.put("AGENTEP", agenteP);
			}

			Map map = null;
			PAC_IAX_CAJA pac_axis_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (!isEmpty(CAGENTEI))
				map = pac_axis_caja.ejecutaPAC_IAX_CAJA__F_LEE_PAGOS_PDTES(CAGENTEI);
			else
				map = pac_axis_caja.ejecutaPAC_IAX_CAJA__F_LEE_PAGOS_PDTES(CAGENTEP);

			logger.debug(map);
			List ListaFicheros = (List) tratarRETURNyMENSAJES(request, map, false);
			formdata.put("ListaFicheros", ListaFicheros);

		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj001Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar_sobrantes(HttpServletRequest request, Axiscaj016Action thisAction) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CAGENTE = null;
			String TFICHERO = null;
			if (formdata.get("CAGENTETEXTI") != null && !formdata.get("CAGENTETEXTI").toString().equals(""))
				CAGENTE = new BigDecimal(formdata.get("CAGENTETEXTI").toString());
			else if (formdata.get("CAGENTETEXTP") != null && !formdata.get("CAGENTETEXTP").toString().equals(""))
				CAGENTE = new BigDecimal(formdata.get("CAGENTETEXTP").toString());

			if (formdata.get("TFICHERO") != null && !formdata.get("TFICHERO").toString().equals(""))
				TFICHERO = formdata.get("TFICHERO").toString();

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axiscaj016_lista");

				Map map = new HashMap();
				PAC_IAX_CAJA pac_axis_caja = new PAC_IAX_CAJA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(SPERSON,
				// SPERSON,pCCHEQUE.toString());
				map = pac_axis_caja.ejecutaPAC_IAX_CAJA__F_LEE_SOBRANTE(CAGENTE, TFICHERO);
				/*
				 * map.put("SSERVIC",0); map.put("TDESCRI","descripcion");
				 * map.put("IPRECIO",100); map.put("IMINIMO",0); map.put("FINIVIG",new
				 * Date(20130311));
				 */
				// ArrayList list = new ArrayList();
				// list.add(map);
				// logger.debug(map);
				logger.debug("++++map: " + map);
				List LSTFICHEROS = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug("++++pendientes: " + LSTFICHEROS);

				formdata.put("LSTFICHEROS", LSTFICHEROS);

				// request.getSession().setAttribute("axiscaj007_listaCheques", (ArrayList)
				// tratarRETURNyMENSAJES(request, map, false));
				// request.getSession().setAttribute("axiscaj016_lista", (ArrayList)
				// tratarRETURNyMENSAJES(request, map, false));

				this.cargarDatos(request, thisAction, formdata);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void guardar(HttpServletRequest request, Axiscaj010Action thisAction) {
		logger.debug("Axiscaj010Service guardar");
		// this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal pSPERSON = this.getCampoNumerico(request, "SPERSON");
			formdata.put("SPERSON", pSPERSON);
			logger.debug("++++SPERSON: " + pSPERSON);

			String pFICHEROS = this.getHiddenCampoTextual(request, "FICHEROS");
			formdata.put("FICHEROS", pFICHEROS);
			logger.debug("++++FICHEROS: " + pFICHEROS);

			List listaAutoLiq = new ArrayList();
			Map map = new HashMap();

			for (Enumeration en = request.getParameterNames(); en.hasMoreElements();) {
				String key = (String) en.nextElement();
				if (key.startsWith("AUTOLIQUIDACION") && !key.endsWith("MODIFVISIBLE")) {
					map = new HashMap();
					String[] secc = key.split("-");
					map.put("SPROCES", new BigDecimal(secc[1]));
					map.put("CMONEOP", new BigDecimal(secc[2]));
					map.put("CAGENTE", new BigDecimal(secc[3]));
					map.put("SPRODUC", new BigDecimal(secc[4]));
					map.put("IAUTLIQ", new BigDecimal(request.getParameter(key)));
					listaAutoLiq.add(map);
				}
			}

			request.getSession().setAttribute("LSTAUTLIQ", listaAutoLiq);
			logger.debug("++++LSTAUTLIQ: " + listaAutoLiq);

			request.getSession().setAttribute("CADENA", pFICHEROS);
			logger.debug("CADENA" + listaAutoLiq);

			formdata.put("guardat", "0");
		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj010Service - m�todo guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axiscaj016Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		boolean flagCorrecto = true;
		this.formattingNumericValues(request);
		AjaxContainerService ajax = new AjaxContainerService();
		Map map;

		try {
			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CADENA = this.getCampoTextual(request, "CADENA");
			formdata.put("", CADENA);
			logger.debug("+++++++CADENA: " + CADENA);

			map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_INS_DEVOLUCION(CADENA);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() != 0) {
				flagCorrecto = false;
			}
			m_buscar_sobrantes(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj001Service - m�todo m_aceptar", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
