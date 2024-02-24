//Revision:# qsKr7n1cpv9R7K71X6nAIg== #
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

import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisfic004Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisfic004Service extends AxisBaseService {
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
	public void m_form(HttpServletRequest request, Axisfic004Action thisAction) {
		logger.debug("Axisfic004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			/* Cargar direcci�n (s�lo si hay CDOMICI) */
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}
			formdata.put("SPERSON", bigDecimalToString(SPERSON));

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}
			formdata.put("SFINANCI", bigDecimalToString(SFINANCI));

			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (NMOVIMI == null) {
				try {
					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			formdata.put("NMOVIMI", bigDecimalToString(NMOVIMI));

			Date FCONSULTA = stringToSqlDate(request.getParameter("FCONSULTA"));
			if (FCONSULTA == null) {
				try {
					FCONSULTA = stringToSqlDate(String.valueOf(request.getParameter("FCONSULTA")));
				} catch (Exception ex) {
					FCONSULTA = null;
				}
			}

			formdata.put("FCONSULTA", FCONSULTA);

			BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
			if (CFUENTE == null) {
				try {
					CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
				} catch (Exception ex) {
					CFUENTE = null;
				}
			}
			formdata.put("CFUENTE", new BigDecimal("1"));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			if (CAGENTE == null) {
				try {
					CAGENTE = new BigDecimal(String.valueOf(request.getParameter("CAGENTE")));
				} catch (Exception ex) {
					CAGENTE = null;
				}
			}
			formdata.put("CAGENTE", bigDecimalToString(CAGENTE));
          			String CMODO = getCampoTextual(request, "CMODO"); //POST-123
			if (CMODO == null) {
				try {
					CMODO = new String(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
			}
			formdata.put("CMODO", CMODO);
			// formdata.put("CFUENTE", new BigDecimal("1"));
			// CP0455M_SYS_PERS - ACL - 28/12/2018 -- Se activa la condicion
//			if (SFINANCI != null && (CMODO.equals(new BigDecimal("1")) || CMODO.equals(new BigDecimal("2")))) {
				m_buscar(request, thisAction);
//			}
			// else if(SPERSON != null && (CMODO.equals(new BigDecimal("0")))){
			// m_buscar_cifin_intermedio(request, thisAction);
			// }

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic004Service.m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * Realiza una carga de BD de los valores est�ticos que contiene cada
	 * desplegable de la pantalla.
	 * 
	 * @param request  El HttpServletRequest que contiene la petici�n del cliente
	 *                 web.
	 * @param usuario  El UsuarioBean activo.
	 * @param formdata HashMap que contiene los valores de los request parameters.
	 * @throws Exception
	 */

	private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata)
			throws Exception {
		// Carga de valores de los desplegables
		Map listValores = new HashMap();
		try {
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Lista de valores
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001076));
			logger.debug(map);
			listValores.put("lstFuenteInformacion", (List) tratarRETURNyMENSAJES(request, map));

			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001077));
			logger.debug(map);
			listValores.put("lstClienteRestringido", (List) tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el m�todo Axisfic004Service.cargarValoresDesplegables", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			formdata.put("listValores", listValores);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que busca el endeudamiento sector financiero.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, Axisfic004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic004Service m_buscar");

		try {

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

			Date FCONSULTA = stringToSqlDate(getCampoTextual(request, "FCONSULTA"));

			BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
			if (CFUENTE == null) {
				try {
					CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
				} catch (Exception ex) {
					CFUENTE = null;
				}
			}

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_ENDEUDA(SFINANCI, FCONSULTA, CFUENTE);
			List<Map> lstEndeuda = (List<Map>) tratarRETURNyMENSAJES(request, map);
			logger.debug(map);
			formdata.put("lstEndeuda", lstEndeuda);
			if (!isEmpty(map) && lstEndeuda != null) {
				for (Map iLstEndeuda : lstEndeuda) {
					if (SFINANCI.equals(iLstEndeuda.get("SFINANCI"))) {
						formdata.putAll(iLstEndeuda);
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic004Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que almacena el endeudamiento sector financiero
	 * 
	 * @param request
	 * @param thisAction
	 */
	// CP0455M_SYS_PERS - ACL - 28/12/2018 -- Se ajusta la funci�n m_aceptar
	public void m_aceptar(HttpServletRequest request, Axisfic004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic004Service m_aceptar");

		try {

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			HashMap m = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
				if (SFINANCI == null) {
					try {
						SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
					} catch (Exception ex) {
						SFINANCI = null;
					}
				}

				BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
				if (CFUENTE == null) {
					try {
						CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
					} catch (Exception ex) {
						CFUENTE = null;
					}
				}

				String CMODO = getCampoTextual(request, "CMODO");
				if (CMODO == null) {
					try {
						CMODO = "CMODOF";
					} catch (Exception ex) {
						CMODO = null;
					}
				}

				Date FCONSULTA = stringToSqlDate(getCampoTextual(request, "FCONSULTA"));
				// BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
				BigDecimal IMINIMO = getCampoNumerico(request, "IMINIMO");
				BigDecimal ICAPPAG = getCampoNumerico(request, "ICAPPAG");
				BigDecimal ICAPEND = getCampoNumerico(request, "ICAPEND");
				BigDecimal IENDTOT = getCampoNumerico(request, "IENDTOT");
				BigDecimal NCALIFA = getCampoNumerico(request, "NCALIFA");
				BigDecimal NCALIFB = getCampoNumerico(request, "NCALIFB");
				BigDecimal NCALIFC = getCampoNumerico(request, "NCALIFC");
				BigDecimal NCALIFD = getCampoNumerico(request, "NCALIFD");
				BigDecimal NCALIFE = getCampoNumerico(request, "NCALIFE");
				BigDecimal NCONSUL = getCampoNumerico(request, "NCONSUL");
				BigDecimal NSCORE = getCampoNumerico(request, "NSCORE");
				BigDecimal NMORA = getCampoNumerico(request, "NMORA");
				BigDecimal ICUPOG = getCampoNumerico(request, "ICUPOG");
				BigDecimal ICUPOS = getCampoNumerico(request, "ICUPOS");
				Date FCUPO = stringToSqlDate(getCampoTextual(request, "FCUPO"));
				String TCUPOR = getCampoTextual(request, "TCUPOR");
				BigDecimal CRESTRIC = getCampoNumerico(request, "CRESTRIC");
				String TCONCEPC = getCampoTextual(request, "TCONCEPC");
				String TCONCEPS = getCampoTextual(request, "TCONCEPS");
				String TCBUREA = getCampoTextual(request, "TCBUREA");
				String TCOTROS = getCampoTextual(request, "TCOTROS");

				Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_ENDEUDA(SFINANCI, FCONSULTA, CMODO,
						CFUENTE, IMINIMO, ICAPPAG, ICAPEND, IENDTOT, NCALIFA, NCALIFB, NCALIFC, NCALIFD, NCALIFE,
						NCONSUL, NSCORE, NMORA, ICUPOG, ICUPOS, FCUPO, TCUPOR, CRESTRIC, TCONCEPC, TCONCEPS, TCBUREA,
						TCOTROS);

				logger.debug(map);

				request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic004Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que realiza calculos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_calcular(HttpServletRequest request, Axisfic004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic004Service m_calcular");

		try {

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (NMOVIMI == null) {
				try {
					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}

			BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
			if (CFUENTE == null) {
				try {
					CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
				} catch (Exception ex) {
					CFUENTE = null;
				}
			}

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_CALCULA_MODELO(SFINANCI, NMOVIMI, CFUENTE, null,
					null);
			logger.debug(map);
			if (map.get("RETURN").equals(new BigDecimal("0"))) {
				BigDecimal PCUPOSUG = (BigDecimal) map.get("PCUPOSUG");
				BigDecimal PCUPOGAR = (BigDecimal) map.get("PCUPOGAR");
				formdata.put("ICUPOS", PCUPOSUG);
				formdata.put("ICUPOG", PCUPOGAR);
				thisAction.guardarMensaje(request, "111313", new Object[] { map.get("MENSAJES") },
						Constantes.MENSAJE_INFO);
			} else {
				BigDecimal PCUPOSUG = new BigDecimal("0");
				BigDecimal PCUPOGAR = new BigDecimal("0");
				formdata.put("ICUPOS", PCUPOSUG);
				formdata.put("ICUPOG", PCUPOGAR);
				thisAction.guardarMensaje(request, "1000254", new Object[] { map.get("MENSAJES") },
						Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic004Service - m�todo m_calcular", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que se conecta con CIFIN
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_conectar(HttpServletRequest request, Axisfic004Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic002Service m_conectar");

		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic004Service - m�todo m_conectar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que busca la informacion de la tabla de cifin intermedio
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar_cifin_intermedio(HttpServletRequest request, Axisfic004Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		logger.debug("Axisfic002Service m_buscar_cifin_intermedio");

		Map OBPERSONACI = new HashMap();
		OBPERSONACI.put("isNew", Boolean.valueOf(true));

		try {

			/* Desplegables */
			cargarValoresDesplegables(request, usuario, formdata);

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			if (SPERSON == null) {
				try {
					SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
				} catch (Exception ex) {
					SPERSON = null;
				}
			}

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");

			if (CAGENTE == null) {
				try {
					CAGENTE = new BigDecimal(String.valueOf(request.getParameter("CAGENTE")));
				} catch (Exception ex) {
					CAGENTE = null;
				}
			}

			/* Estado persona */
			if (!isEmpty(SPERSON)) {
				OBPERSONACI.put("isNew", Boolean.valueOf(false));

				PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
				logger.debug(map);
				BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

				if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
					OBPERSONACI = (Map) map.get("OBPERSONA");
					BigDecimal CTIPIDE = (BigDecimal) OBPERSONACI.get("CTIPIDE");
					String NNUMIDE = (String) OBPERSONACI.get("NNUMIDE");

					PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapA = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_CIFIN_INTERMEDIO(CTIPIDE, NNUMIDE);
					// Map mapA =
					// pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_CIFIN_INTERMEDIO(new
					// BigDecimal("1"), "13014650");
					List lstCifinIntermedio = (List) tratarRETURNyMENSAJES(request, mapA);
					logger.debug(mapA);
					if (lstCifinIntermedio != null && !lstCifinIntermedio.isEmpty()) {
						for (Object iLstCifinIntermedio1 : lstCifinIntermedio) {
							// if(NNUMIDE.equals(iLstCifinIntermedio.get("NO_ID"))){
							Map iLstCifinIntermedio = (Map) iLstCifinIntermedio1;
							formdata.put("IMINIMO", iLstCifinIntermedio.get("INGRESO_MIN_PROBABLE"));
							formdata.put("ICAPPAG", iLstCifinIntermedio.get("CAPACIDAD_PAGO"));
							formdata.put("ICAPEND", iLstCifinIntermedio.get("CAPACIDAD_ENDEUDA"));
							formdata.put("IENDTOT", iLstCifinIntermedio.get("ENDEUDA_TOTAL_SFINANCIERO"));
							formdata.put("NCALIFA", iLstCifinIntermedio.get("SUMATORIA_CALIF_A"));
							formdata.put("NCALIFB", iLstCifinIntermedio.get("SUMATORIA_CALIF_B"));
							formdata.put("NCALIFC", iLstCifinIntermedio.get("SUMATORIA_CALIF_C"));
							formdata.put("NCALIFD", iLstCifinIntermedio.get("SUMATORIA_CALIF_D"));
							formdata.put("NCALIFE", iLstCifinIntermedio.get("SUMATORIA_CALIF_E"));
							formdata.put("NCONSUL", iLstCifinIntermedio.get("SUM_CON_ULT_6_MESES"));
							formdata.put("NSCORE", iLstCifinIntermedio.get("PUNTAJE_SCORE"));
							formdata.put("NMORA", iLstCifinIntermedio.get("PROB_MORA"));
							formdata.put("CFUENTE", new BigDecimal("1"));

							Date FECHAAUX1 = (Date) iLstCifinIntermedio.get("FECHA_ULT1_REPORTE_1");
							Date FECHAAUX2 = (Date) iLstCifinIntermedio.get("FECHA_ULT1_REPORTE_2");
							Date FECHAAUX3 = (Date) iLstCifinIntermedio.get("FECHA_ULT1_REPORTE_3");
							Date FECHAAUX4 = (Date) iLstCifinIntermedio.get("FECHA_ULT2_REPORTE_1");
							Date FECHAAUX5 = (Date) iLstCifinIntermedio.get("FECHA_ULT2_REPORTE_2");
							Date FECHAAUX6 = (Date) iLstCifinIntermedio.get("FECHA_ULT2_REPORTE_3");
							Date FECHAAUX7 = (Date) iLstCifinIntermedio.get("FECHA_ULT3_REPORTE_1");
							Date FECHAAUX8 = (Date) iLstCifinIntermedio.get("FECHA_ULT3_REPORTE_2");
							Date FECHAAUX9 = (Date) iLstCifinIntermedio.get("FECHA_ULT3_REPORTE_3");
							Date FECHAAUX10 = (Date) iLstCifinIntermedio.get("FECHA_ULT4_REPORTE_1");
							Date FECHAAUX11 = (Date) iLstCifinIntermedio.get("FECHA_ULT4_REPORTE_2");
							Date FECHAAUX12 = (Date) iLstCifinIntermedio.get("FECHA_ULT4_REPORTE_3");

							List<Date> listaFechas = new ArrayList<Date>();
							if (FECHAAUX1 != null) {
								listaFechas.add(FECHAAUX1);
							}
							if (FECHAAUX2 != null) {
								listaFechas.add(FECHAAUX2);
							}
							if (FECHAAUX3 != null) {
								listaFechas.add(FECHAAUX3);
							}
							if (FECHAAUX4 != null) {
								listaFechas.add(FECHAAUX4);
							}
							if (FECHAAUX5 != null) {
								listaFechas.add(FECHAAUX5);
							}
							if (FECHAAUX6 != null) {
								listaFechas.add(FECHAAUX6);
							}
							if (FECHAAUX7 != null) {
								listaFechas.add(FECHAAUX7);
							}
							if (FECHAAUX8 != null) {
								listaFechas.add(FECHAAUX8);
							}
							if (FECHAAUX9 != null) {
								listaFechas.add(FECHAAUX9);
							}
							if (FECHAAUX10 != null) {
								listaFechas.add(FECHAAUX10);
							}
							if (FECHAAUX11 != null) {
								listaFechas.add(FECHAAUX11);
							}
							if (FECHAAUX12 != null) {
								listaFechas.add(FECHAAUX12);
							}

							int i = 0;
							java.sql.Date FCONSULTA = null;
							for (Date iListaFechas : listaFechas) {
								if (i == 0) {
									FCONSULTA = iListaFechas;
								} else if (FCONSULTA.before(iListaFechas)) {
									FCONSULTA = iListaFechas;
								}
								i++;
								if (i == listaFechas.size()) {
									formdata.put("FCONSULTTA", seleccionarData2(FCONSULTA));
								}
							}

							// }
						}
					}
					if (lstCifinIntermedio == null || lstCifinIntermedio.size() == 0) {
						thisAction.guardarMensaje(request, "1000254", new Object[] { map.get("MENSAJES") },
								Constantes.MENSAJE_INFO);
					} else {
						thisAction.guardarMensaje(request, "1000094", new Object[] { map.get("MENSAJES") },
								Constantes.MENSAJE_INFO);
					}
				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic002Service - m�todo m_buscar_cifin_intermedio", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private java.sql.Date seleccionarData2(Date fechaE) {

		Calendar calendarData = Calendar.getInstance();
		java.sql.Date dataSql = new java.sql.Date(new java.util.Date().getTime());
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		String fecha = new String();

		try {

			// java.sql.Timestamp timeStamp = new
			// java.sql.Timestamp(System.currentTimeMillis());
			fecha = fechaE.toString();

			calendarData.setTime(sdf.parse(fecha));

			dataSql = new java.sql.Date(calendarData.getTime().getTime());

		} catch (ParseException e) {
			e.printStackTrace();
		}
		return dataSql;

	}

}
