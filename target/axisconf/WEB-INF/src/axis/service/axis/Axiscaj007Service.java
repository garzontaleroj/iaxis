//Revision:# j630rRoSTaNUzwAglX2zcg== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA_CHEQUE;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PROF;
import axis.mvc.control.axis.Axiscaj007Action;
import axis.util.Constantes;

public class Axiscaj007Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_form(HttpServletRequest request, Axiscaj007Action thisAction) {
		logger.debug("Axiscaj007Service m_load_data");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		PAC_IAX_PROF pac_iax_prof = new PAC_IAX_PROF((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		try {
			BigDecimal SPERSON = null;
			if (formdata.get("SPERSON") != null) {
				String[] sp = (String[]) formdata.get("SPERSON");
				SPERSON = new BigDecimal(sp[0]);
			}
			if (SPERSON == null && request.getParameter("SPERSON") != null) {
				SPERSON = new BigDecimal(request.getParameter("SPERSON"));
			}
			logger.debug("++++SPERSON: " + SPERSON);
			formdata.put("SPERSON", SPERSON);

			this.cargarDatos(request, thisAction, formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj007Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargarDatos(HttpServletRequest request, Axiscaj007Action thisAction, Map formdata) throws Exception {
		try {
			Map OBPERSONA = new HashMap();
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			if (SPERSON == null) {
				if (formdata.get("SPERSON") instanceof BigDecimal) {
					SPERSON = (BigDecimal) formdata.get("SPERSON");
				} else if (!isEmpty(formdata.get("SPERSON"))) {
					SPERSON = new BigDecimal((String) formdata.get("SPERSON"));
				}

			}
			BigDecimal CAGENTE = null;
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			logger.debug("++++SPERSON: " + SPERSON);

			if (!isEmpty(SPERSON)) {
				OBPERSONA.put("isNew", Boolean.valueOf(false));
				if (isEmpty(request.getAttribute("agents_visio"))) {
					Map mapAg = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_AGENTES_VISION(SPERSON);
					logger.debug(mapAg);
					request.setAttribute("agents_visio", tratarRETURNyMENSAJES(request, mapAg));
					if (!isEmpty(tratarRETURNyMENSAJES(request, mapAg)) && isEmpty(CAGENTE)) {
						List retornAgentesVision = (List) tratarRETURNyMENSAJES(request, mapAg);
						if (retornAgentesVision.size() > 0) {
							HashMap inicialitzaPersona = (HashMap) retornAgentesVision.get(0);
							CAGENTE = new BigDecimal(String.valueOf(inicialitzaPersona.get("CAGENTE")));
							formdata.put("CAGENTE", inicialitzaPersona.get("CAGENTE"));
						}
					}
				}

				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONA = (Map) map.get("OBPERSONA");
					BigDecimal CTIPPER = (BigDecimal) OBPERSONA.get("CTIPPER");
					if (!isEmpty(OBPERSONA)) {
						formdata.put("TTIPIDE", OBPERSONA.get("TTIPIDE"));
						formdata.put("NNUMIDE", OBPERSONA.get("NNUMIDE"));
						logger.debug("++++NNUMIDE: " + OBPERSONA.get("NNUMIDE"));

						if (new BigDecimal(2).equals(CTIPPER)) {
							formdata.put("TNOMBRE", OBPERSONA.get("TSIGLAS"));
						} else {
							String nombre = "", apelli1 = "", apelli2 = "";
							if (OBPERSONA.get("TNOMBRE") != null)
								nombre = (String) OBPERSONA.get("TNOMBRE");
							if (OBPERSONA.get("TAPELLI1") != null)
								apelli1 = (String) OBPERSONA.get("TAPELLI1");
							if (OBPERSONA.get("TAPELLI2") != null)
								apelli2 = (String) OBPERSONA.get("TAPELLI2");

							String nombreCompleto = nombre + " " + apelli1 + " " + apelli2;
							logger.debug("++++TNOMBRE: " + nombreCompleto);

							formdata.put("TNOMBRE", nombreCompleto);
						}
					}
				}
			}
		} catch (Exception e) {
			logger.error("Error en el m�todo Axiscaj007Service.cargarDatos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_busqueda_cheques(HttpServletRequest request, Axiscaj007Action thisAction, BigDecimal STARIFA) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = null;
			logger.debug("++++formdata.get(\"SPERSON\")" + formdata.get("SPERSON"));
			if (formdata.get("SPERSON") != null && !isEmpty(formdata.get("SPERSON"))) {
				SPERSON = new BigDecimal((String) formdata.get("SPERSON"));
			}
			if (SPERSON == null && request.getParameter("SPERSON") != null
					&& !isEmpty(request.getParameter("SPERSON"))) {
				SPERSON = new BigDecimal(request.getParameter("SPERSON"));
			}
			logger.debug("++++SPERSON: " + SPERSON);

			String pCCHEQUE = getCampoTextual(request, "CCHEQUE") == null ? null
					: getCampoTextual(request, "CCHEQUE").toString();
			BigDecimal pSEQCAJA = null;

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axiscaj007_listaCheques");

				Map map = new HashMap();
				PAC_IAX_CAJA_CHEQUE pac_axis_caja = new PAC_IAX_CAJA_CHEQUE(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(SPERSON,
				// SPERSON,pCCHEQUE.toString());
				map = pac_axis_caja.ejecutaPAC_IAX_CAJA_CHEQUE__F_LEE_CHEQUES(SPERSON, pCCHEQUE, pSEQCAJA);
				/*
				 * map.put("SSERVIC",0); map.put("TDESCRI","descripcion");
				 * map.put("IPRECIO",100); map.put("IMINIMO",0); map.put("FINIVIG",new
				 * Date(20130311));
				 */
				ArrayList list = new ArrayList();
				list.add(map);
				logger.debug(map);

				// request.getSession().setAttribute("axiscaj007_listaCheques", (ArrayList)
				// tratarRETURNyMENSAJES(request, map, false));
				request.getSession().setAttribute("axiscaj007_listaCheques",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));

				this.cargarDatos(request, thisAction, formdata);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_listar_estados(HttpServletRequest request, Axiscaj007Action thisAction, BigDecimal STARIFA) {
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = null;
			logger.debug("++++formdata.get(\"SPERSON\")" + formdata.get("SPERSON"));
			if (formdata.get("SPERSON") != null && !isEmpty(formdata.get("SPERSON"))) {
				SPERSON = new BigDecimal((String) formdata.get("SPERSON"));
			}
			if (SPERSON == null && request.getParameter("SPERSON") != null
					&& !isEmpty(request.getParameter("SPERSON"))) {
				SPERSON = new BigDecimal(request.getParameter("SPERSON"));
			}
			logger.debug("++++SPERSON: " + SPERSON);

			String pCCHEQUE = getCampoNumerico(request, "CCHEQUE") == null ? null
					: getCampoNumerico(request, "CCHEQUE").toString();
			BigDecimal pSEQCAJA = null;

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("Axiscaj007_listaCheques");
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("694"));
				List gestion = (List) tratarRETURNyMENSAJES(request, map3);
				logger.debug(gestion);

				Map map = new HashMap();
				PAC_IAX_CAJA_CHEQUE pac_axis_caja = new PAC_IAX_CAJA_CHEQUE(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// map = PAC_IAX_PROF.ejecutaPAC_IAX_PROF__F_GET_SERVICIOS(SPERSON,
				// SPERSON,pCCHEQUE.toString());
				map = pac_axis_caja.ejecutaPAC_IAX_CAJA_CHEQUE__F_LEE_CHEQUES(SPERSON, pCCHEQUE, pSEQCAJA);
				/*
				 * map.put("SSERVIC",0); map.put("TDESCRI","descripcion");
				 * map.put("IPRECIO",100); map.put("IMINIMO",0); map.put("FINIVIG",new
				 * Date(20130311));
				 */
				ArrayList list = new ArrayList();
				list.add(map);
				logger.debug(map);

				// request.getSession().setAttribute("axiscaj007_listaCheques", (ArrayList)
				// tratarRETURNyMENSAJES(request, map, false));
				request.getSession().setAttribute("axiscaj007_listaCheques",
						(ArrayList) tratarRETURNyMENSAJES(request, map, false));

				this.cargarDatos(request, thisAction, formdata);
			}
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}
}
