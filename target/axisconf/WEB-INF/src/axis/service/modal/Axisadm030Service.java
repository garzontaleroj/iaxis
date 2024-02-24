package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CODA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisadm030Service.java 06/03/2009
 * 
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisadm030Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		request.getSession().setAttribute("IMPCODAsessio", request.getParameter("IMPCODA"));

	}

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal IMPCODAini = new BigDecimal(String.valueOf(request.getSession().getAttribute("IMPCODAsessio")));
			BigDecimal CISGNO = (IMPCODAini.floatValue() > 0) ? new BigDecimal(0) : new BigDecimal(1);

			Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_BUSCA_RECIBOS(SPERSON, CISGNO);
			logger.debug(map);

			// Bug 9951-05/04/2009-AMC- Tratamiento para que seleccione los recibos cuando
			// se recargue la pantalla.
			List marcados = (List) request.getAttribute("MARCADOS");
			List<Map> recibos = (List<Map>) map.get("P_REFCURSOR");
			if (!isEmpty(marcados)) {

				for (int i = 0; i < marcados.size(); i++) {
					boolean marcado = false;
					for (int j = 0; j < recibos.size() && marcado == false; j++) {
						HashMap a = (HashMap) recibos.get(j);
						BigDecimal recmarcado = new BigDecimal((String) marcados.get(i).toString());
						BigDecimal reclista = new BigDecimal((String) a.get("NRECIBO").toString());

						if (recmarcado.intValue() == reclista.intValue()) {
							((HashMap) recibos.get(j)).put("MARCADO", 1);
							marcado = true;
						}
					}
				}
			}

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				// request.setAttribute("LST_RECIBOS", map.get("P_REFCURSOR"));
				logger.debug("1");
				request.getSession().setAttribute("LST_RECIBOS", recibos);
				List<Map> LST_RECIBOS = recibos;
				logger.debug("2-->" + LST_RECIBOS);
				for (Map m : LST_RECIBOS) {
					BigDecimal NREC = (BigDecimal) m.get("NRECIBO");
					map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NREC, null);
					logger.debug(map);
					if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
						BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
						float pendiente = IMPPEN.floatValue();
						if (!isEmpty(m.get("IPAGO")))
							pendiente = IMPPEN.floatValue() - ((BigDecimal) m.get("IPAGO")).floatValue();
						m.put("IMPPENDIENTE", new BigDecimal(pendiente));
					}

				}
			}

			formdata.put("IMPTOTAL", new BigDecimal(getItotalPagados(request)));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm030Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * @param request
	 */
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm030Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal NNUMLIN = getCampoNumerico(request, "NNUMLIN");
			String CBANCAR1 = getCampoTextual(request, "CBANCAR1");
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal NNUMORD = getCampoNumerico(request, "NNUMORD");

			BigDecimal OK = getCampoNumerico(request, "OK");
			String RECIBOS = getCampoTextual(request, "recibos");

			String recibo = new String();
			int con = 0;
			List lstrecibos = new ArrayList();
			for (int i = 0; i < RECIBOS.length(); i++) {
				char a = RECIBOS.charAt(i);
				if (a == ';') {
					lstrecibos.add(con, recibo);
					con++;
					recibo = "";
				} else {
					recibo = recibo.toString() + a;
				}
			}
			logger.debug("lista recibos:" + lstrecibos);
			request.setAttribute("MARCADOS", lstrecibos);

			Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CODA__F_GESTION_RECIBOS(SPROCES, NNUMLIN, CBANCAR1, NNUMORD, RECIBOS, OK);
			logger.debug(map);

			request.setAttribute("F_GESTION_RECIBOS_RETURN", tratarRETURNyMENSAJES(request, map));
			request.setAttribute("P_REDO", map.get("P_REDO"));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm030Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void m_actualitzarImports(HttpServletRequest request) {
		logger.debug("Axisadm030Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBOseleccionat");
			BigDecimal IPAGO = getCampoNumerico(request, "IPAGOintr");
			BigDecimal IMPCODA = getCampoNumerico(request, "IMPCODA");
			BigDecimal CMARCADO = getCampoNumerico(request, "CMARCADO");
			BigDecimal IMPCODAini = new BigDecimal(String.valueOf(request.getSession().getAttribute("IMPCODAsessio")));
			formdata.put("IMPCODA", IMPCODA);
			// formdata.put("IMPCODAinicial",formdata.get("IMPCODAinicial"));
			logger.debug(request.getSession().getAttribute("IMPCODAsessio"));
			/*
			 * if (!isEmpty(IPAGO) && !isEmpty(IMPCODA) && IMPCODA.intValue() <
			 * IPAGO.intValue()){ IPAGO = new BigDecimal(0); }
			 */

			ArrayList<Map> LST_RECIBOS = (ArrayList<Map>) request.getSession().getAttribute("LST_RECIBOS");

			if (!isEmpty(NRECIBO)) {
				for (Map m : LST_RECIBOS) {
					BigDecimal NREC = (BigDecimal) m.get("NRECIBO");
					if (NREC.intValue() == NRECIBO.intValue()) {

						if (CMARCADO.intValue() == 1) {
							m.put("MARCADO", new BigDecimal(1));
							BigDecimal ITOTALR = (BigDecimal) m.get("ITOTALR");

							Map map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_CODA__F_VALIDA_IMPORTE(NRECIBO, null, ITOTALR, IPAGO);
							logger.debug(map);
							if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
								m.put("IPAGO", map.get("P_IMPORTE"));

								float itotalpagado = getItotalPagados(request);// + new
																				// BigDecimal(String.valueOf(map.get("P_IMPORTE"))).floatValue();

								logger.debug("itotalpagado" + itotalpagado);
								logger.debug("IMPCODA" + IMPCODA);
								float ipendientedecoda = IMPCODAini.floatValue() - itotalpagado;
								logger.debug(ipendientedecoda);
								logger.debug(CMARCADO);

								if (ipendientedecoda < 0) {
									logger.debug(new BigDecimal(itotalpagado).compareTo(IMPCODAini));
									if (new BigDecimal(itotalpagado).compareTo(IMPCODAini) == 1) {
										BigDecimal tt = new BigDecimal(0);
										if (!isEmpty(m.get("IPAGO")))
											tt = ((BigDecimal) m.get("IPAGO")).subtract(new BigDecimal(itotalpagado));

										if (!isEmpty(IPAGO))
											tt = IPAGO.subtract(new BigDecimal(itotalpagado));
										logger.debug("IMPCODAini :" + IMPCODAini);
										logger.debug(
												"IMPCODAini.floatValue() :" + this.roundNum(IMPCODAini.floatValue()));
										logger.debug("tt.abs().floatValue() : " + tt.abs().floatValue());
										logger.debug(
												"tt.abs().floatValue()  : " + this.roundNum(tt.abs().floatValue()));
										logger.debug(this.roundNum(
												IMPCODAini.floatValue() - this.roundNum(tt.abs().floatValue())));
										if (this.roundNum(IMPCODAini.floatValue()
												- this.roundNum(tt.abs().floatValue())) == new Float(0).floatValue()) {

											m.put("IPAGO", null);
											m.put("MARCADO", new BigDecimal(0));
											itotalpagado = getItotalPagados(request);
											formdata.put("IMPCODA",
													new BigDecimal(IMPCODAini.floatValue() - itotalpagado));
											logger.debug("coda resta : "
													+ new BigDecimal(IMPCODAini.floatValue() - itotalpagado));
											float pendiente = ITOTALR.floatValue();
											map = new PAC_IAX_CODA(
													(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
													.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NREC, null);
											logger.debug(map);
											if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
												BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
												pendiente = IMPPEN.floatValue();
											}
											if (!isEmpty(m.get("IPAGO")))
												pendiente = pendiente - ((BigDecimal) m.get("IPAGO")).floatValue();

											m.put("IMPPENDIENTE", new BigDecimal(pendiente));
											break;

										} else
											m.put("IPAGO", IMPCODAini.subtract(tt.abs()));

									} else
										m.put("IPAGO", IMPCODAini);
									// if (IMPCODA.intValue()==0){
									/*
									 * m.put("IPAGO",null); m.put("MARCADO",new BigDecimal(0)); itotalpagado =
									 * getItotalPagados(request); formdata.put("IMPCODA",new
									 * BigDecimal(IMPCODAini.floatValue() - itotalpagado));
									 * logger.debug("coda resta : "+new BigDecimal(IMPCODAini.floatValue() -
									 * itotalpagado)); float pendiente = ITOTALR.floatValue(); map = new
									 * PAC_IAX_CODA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).
									 * ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NREC,null); logger.debug(map); if
									 * (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) { BigDecimal
									 * IMPPEN = (BigDecimal)map.get("P_IMPORTE"); pendiente = IMPPEN.floatValue(); }
									 * if (!isEmpty(m.get("IPAGO"))) pendiente = pendiente -
									 * ((BigDecimal)m.get("IPAGO")).floatValue();
									 * 
									 * m.put("IMPPENDIENTE",new BigDecimal(pendiente)); break; // }
									 */
								} else if (ipendientedecoda > 0) {
									logger.debug("22 = " + ipendientedecoda);
									m.put("IPAGO", map.get("P_IMPORTE"));
								}

								itotalpagado = getItotalPagados(request);
								formdata.put("IMPCODA", new BigDecimal(IMPCODAini.floatValue() - itotalpagado));

							}

							logger.debug("arrayu-->" + m);
							float pendiente = ITOTALR.floatValue();
							map = new PAC_IAX_CODA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NREC, null);
							logger.debug(map);
							if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
								BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
								pendiente = IMPPEN.floatValue();
							}

							if (!isEmpty(m.get("IPAGO")))
								pendiente = pendiente - ((BigDecimal) m.get("IPAGO")).floatValue();

							m.put("IMPPENDIENTE", new BigDecimal(pendiente));

						} else {
							if (((BigDecimal) m.get("MARCADO")).intValue() == 1) {
								m.put("MARCADO", new BigDecimal(0));
								m.put("IPAGO", null);
								float itotalpagado = getItotalPagados(request);
								// formdata.put("IMPCODA" , new BigDecimal(ipendientedecoda+
								// ((BigDecimal)m.get("IPAGO")).floatValue()));
								formdata.put("IMPCODA", new BigDecimal(IMPCODAini.floatValue() - itotalpagado));

								Map map = new PAC_IAX_CODA(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_CODA__FF_IMPORTE_PENDIENTE(NREC, null);
								logger.debug(map);
								if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
									BigDecimal IMPPEN = (BigDecimal) map.get("P_IMPORTE");
									float pendiente = IMPPEN.floatValue();

									if (!isEmpty(m.get("IPAGO")))
										pendiente = IMPPEN.floatValue() - ((BigDecimal) m.get("IPAGO")).floatValue();

									m.put("IMPPENDIENTE", new BigDecimal(pendiente));
								}
							}
						}
					}

				}

			}

			formdata.put("IMPTOTAL", new BigDecimal(getItotalPagados(request)));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm030Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	private float getItotalPagados(HttpServletRequest request) {
		ArrayList<Map> LST_RECIBOS = (ArrayList<Map>) request.getSession().getAttribute("LST_RECIBOS");
		float itotal = 0;
		for (Map m : LST_RECIBOS) {
			if (!isEmpty(m.get("MARCADO"))) {
				BigDecimal CMARCADO = (BigDecimal) m.get("MARCADO");
				if (CMARCADO.intValue() == 1) {
					if (!isEmpty(m.get("IPAGO"))) {
						itotal += ((BigDecimal) m.get("IPAGO")).floatValue();
						logger.debug("nrecibo-->" + m.get("NRECIBO"));
						logger.debug("IPAGO-->" + m.get("IPAGO"));
					}
				}
			}
		}
		double d = this.roundNum(itotal);

		return new Float(d).floatValue();

	}

}
