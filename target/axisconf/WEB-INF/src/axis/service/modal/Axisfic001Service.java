//Revision:# CeIiB8Tw0mwhW5CZWv8G2g== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisfic001Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfic001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE INICIALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Realiza la carga inicial de la pantalla.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request, Axisfic001Action thisAction) {
		logger.debug("Axisfic001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			/* m_buscar */
			m_buscar(request, thisAction);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}

			formdata.put("SPERSON", bigDecimalToString(SPERSON));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			if (CAGENTE == null) {
				try {
					CAGENTE = new BigDecimal(String.valueOf(request.getParameter("CAGENTE")));
				} catch (Exception ex) {
					CAGENTE = null;
				}
			}

			formdata.put("CAGENTE", bigDecimalToString(CAGENTE));

			// INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
			BigDecimal CTIPPER = getCampoNumerico(request, "CTIPPER");
			if (CTIPPER == null) {
				try {
					CTIPPER = new BigDecimal(String.valueOf(request.getParameter("CTIPPER")));
				} catch (Exception ex) {
					CTIPPER = null;
				}
			}
			formdata.put("CTIPPER", CTIPPER);
			// FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic001Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));// IAXIS-4854
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisfic001Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic001Service m_buscar");

		try {

			Date FRENTA = stringToSqlDate(getCampoTextual(request, "FRENTA"));
			Date FCONSULTA = stringToSqlDate(getCampoTextual(request, "FCONSULTA"));
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
			BigDecimal NMOVIMI = getCampoNumerico(request, "CFUENTE");
	           	String CMODO = getCampoTextual(request, "CMODO"); //POST-123);
			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}
			if (CFUENTE == null) {
				try {
					CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
				} catch (Exception ex) {
					CFUENTE = null;
				}
			}
			if (NMOVIMI == null) {
				try {
					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			 if (CMODO == null){
	                try{
	                	CMODO = new String(String.valueOf(request.getParameter("CMODO")));
	                }catch(Exception ex){  CMODO = null;}
	            }
			formdata.put("CMODO", CMODO);

			// SFINANCI = new BigDecimal("1");
			// if (SFINANCI != null){

			// PAC_IAX_FINANCIERA pac_axis_financiera = new
			// PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			// Map map =
			// pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL(SFINANCI);
			// List <Map> lstGeneral = (List<Map>) tratarRETURNyMENSAJES(request, map);

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			List<Map> lstGeneral = null;
			if (SPERSON != null) {
				// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se ajusta la funci�n y los
				// par�metros
				map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_GENERAL_PERSONA_DET(SPERSON, null);
				// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019
				lstGeneral = (List<Map>) tratarRETURNyMENSAJES(request, map);
			}

			logger.debug(map);
			formdata.put("lstGeneral", lstGeneral);

			if (!isEmpty(map) && lstGeneral != null) {
				formdata.put("lstGeneral", lstGeneral);
				for (Map iLstGeneral : lstGeneral) {
					if (SPERSON.equals(iLstGeneral.get("SPERSON"))) {
						formdata.putAll(iLstGeneral);
					}
					// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se incluye condici�n de FRUT para
					// el primer registro
					if (lstGeneral.size() == 1) {
						java.sql.Timestamp FRUT = (java.sql.Timestamp) iLstGeneral.get("FRUT");
						java.sql.Timestamp FCCOMER = (java.sql.Timestamp) iLstGeneral.get("FCCOMER");

						formdata.put("FRUT", FRUT);
						formdata.put("FCCOMER", FCCOMER);
					}
					// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019
				}
			}

			if (SFINANCI != null) {
				map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_RENTA(SFINANCI, FRENTA);
				List<Map> lstRenta = (List<Map>) tratarRETURNyMENSAJES(request, map);

				logger.debug(map);
				formdata.put("lstRenta", lstRenta);

				// CP0455M_SYS_PERS - ACL - 28/12/2018 -- Se inicializa el parametro FCONSULTA
				FCONSULTA = null;
				map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_ENDEUDA(SFINANCI, FCONSULTA, CFUENTE);
				List<Map> lstEndeuda = (List<Map>) tratarRETURNyMENSAJES(request, map);

				logger.debug(map);
				formdata.put("lstEndeuda", lstEndeuda);
				if (!isEmpty(map) && lstEndeuda != null) {
					formdata.put("lstParCuenta", lstEndeuda);
					for (Map ilstEndeuda : lstEndeuda) {
						BigDecimal NTCALIF = new BigDecimal("0");
						if (ilstEndeuda.get("NCALIFA") != null) {
							NTCALIF = NTCALIF.add((BigDecimal) ilstEndeuda.get("NCALIFA"));
						}
						if (ilstEndeuda.get("NCALIFB") != null) {
							NTCALIF = NTCALIF.add((BigDecimal) ilstEndeuda.get("NCALIFB"));
						}
						if (ilstEndeuda.get("NCALIFC") != null) {
							NTCALIF = NTCALIF.add((BigDecimal) ilstEndeuda.get("NCALIFC"));
						}
						ilstEndeuda.put("NTCALIF", NTCALIF);
					}
				}
				// CP0433M_SYS_PERS - ACL - 28/11/2018 -- Se inicializa el par�metro NMOVIMI
				NMOVIMI = null;
				map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_INDICADOR(SFINANCI, NMOVIMI);
				List<Map> lstIndicador = (List<Map>) tratarRETURNyMENSAJES(request, map);

				logger.debug(map);
				formdata.put("lstIndicador", lstIndicador);

				map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_DOC(SFINANCI, NMOVIMI);
				List<Map> lstDoc = (List<Map>) tratarRETURNyMENSAJES(request, map);

				logger.debug(map);
				formdata.put("lstDoc", lstDoc);
			}
			// }

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic001Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));// IAXIS-4854
		}
	}

	// INI TCS_11;IAXIS-2119 - JLTS - 10/03/2019 - Se crea la funci�n
	// m_eliminar_fin_general
	/**
	 * M�todo que elimina la declaraci�n de renta.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar_fin_general(HttpServletRequest request, Axisfic001Action thisAction) {

		logger.debug("Axisfic001Service m_eliminar_fin_geeral");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic001Service m_eliminar_fin_general");

		try {

			BigDecimal SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
			BigDecimal NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_DEL_FIN_GENERAL_DET(SFINANCI, NMOVIMI);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				request.setAttribute("resultado_del", "OK");
			} else {
				request.setAttribute("resultado_del", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic001Service - m�todo m_eliminar_renta", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}
	// FIN TCS_11;IAXIS-2119 - JLTS - 10/03/2019

	/**
	 * M�todo que elimina la declaraci�n de renta.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar_renta(HttpServletRequest request, Axisfic001Action thisAction) {

		logger.debug("Axisfic001Service m_eliminar_renta");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic001Service m_eliminar_renta");

		try {

			// String NSINIES = getCampoTextual(request,"NSINIES");
			BigDecimal SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
			BigDecimal CESVALOR = new BigDecimal(String.valueOf(request.getParameter("CESVALOR")));
			BigDecimal IPATRILIQ = new BigDecimal(String.valueOf(request.getParameter("IPATRILIQ")));
			BigDecimal IRENTA = new BigDecimal(String.valueOf(request.getParameter("IRENTA")));
			Date FCORTE = stringToSqlDate(getCampoTextual(request, "FCORTE"));

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_DEL_RENTA(SFINANCI, FCORTE, CESVALOR, IPATRILIQ,
					IRENTA);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				request.setAttribute("resultado_del", "OK");
			} else {
				request.setAttribute("resultado_del", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic001Service - m�todo m_eliminar_renta", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * M�todo que elimina el endeudamiento sector financiero.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar_endeuda(HttpServletRequest request, Axisfic001Action thisAction) {

		logger.debug("Axisfic001Service m_eliminar_endeuda");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic001Service m_eliminar_endeuda");

		try {

			// String NSINIES = getCampoTextual(request,"NSINIES");
			BigDecimal SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
			BigDecimal CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
			Date FCONSULTA = stringToSqlDate(getCampoTextual(request, "FCONSULTA"));

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_DEL_ENDEUDA(SFINANCI, FCONSULTA, CFUENTE);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				request.setAttribute("resultado_del", "OK");
			} else {
				request.setAttribute("resultado_del", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic001Service - m�todo m_eliminar_endeuda", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	/**
	 * M�todo que elimina la informacion financiera.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_eliminar_indica(HttpServletRequest request, Axisfic001Action thisAction) {

		logger.debug("Axisfic001Service m_eliminar_indica");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic001Service m_eliminar_indica");

		try {

			// String NSINIES = getCampoTextual(request,"NSINIES");
			BigDecimal SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
			BigDecimal NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_DEL_INDICADOR(SFINANCI, NMOVIMI);
			logger.debug(map);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (resultado.intValue() == 0) {
				request.setAttribute("resultado_del", "OK");
			} else {
				request.setAttribute("resultado_del", "KO");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic001Service - m�todo m_eliminar_indica", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

}
