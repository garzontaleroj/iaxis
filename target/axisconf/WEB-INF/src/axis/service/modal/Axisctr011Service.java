package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axisctr011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr011Action thisAction) {
		logger.debug("Axisctr011Service m_init");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr011Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * importes de las garantia seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr011Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("Axisctr011Service m_form");
		try {
			// Borrar garant�a de session si hemos estado editando alguna
			request.getSession().removeAttribute("axisctr_garantia");
			// Recuperar garant�a seleccionada y sus par�metros de importes
			initImportesGarantia(request);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr011Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// Gesti�n de campos y dependencias
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * M�todo que recupera de BD los campos de Importe Garant�a.
	 * 
	 * @param request
	 * @throws Exception
	 */
	private void initImportesGarantia(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");

		if (!isEmpty(CGARANT)
				&& (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini"))
						|| !isEmpty(request.getSession().getAttribute("axisctr_garantias")))
				&& isEmpty(request.getSession().getAttribute("axisctr_garantia"))) {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			List g = null;
			if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
				g = (List) request.getSession().getAttribute("axisctr_garantias_ini");
			else
				g = (List) request.getSession().getAttribute("axisctr_garantias");

			Map garantia = getObjetoDeLista(g, bigDecimalToString(CGARANT), "CGARANT", "OB_IAX_GARANTIAS");
			logger.debug("GARANTIA->" + garantia);

			if (!isEmpty(garantia)) {
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
				if (isEmpty(NRIESGO))
					NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_DETAILPRIMASGARANT(NRIESGO, CGARANT);
				Map detalle = (Map) tratarRETURNyMENSAJES(request, map);
				logger.debug(detalle);

				if (!isEmpty(detalle)) {
					garantia.putAll(detalle);
				}

				Map revalValor = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_REVALVALOR(NRIESGO, CGARANT);

				logger.debug(revalValor);
				if (revalValor.get("CREVALI") != null)
					garantia.put("CREVALI", revalValor.get("CREVALI"));
				if (revalValor.get("PREVALI") != null)
					garantia.put("PREVALI", revalValor.get("PREVALI"));

				/* Recoger el objeto de garant�a seleccionado **/
				Map objeto_garantia = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_DETALLEGARANTIA(NRIESGO, CGARANT, new BigDecimal("0"));
				logger.debug(objeto_garantia);
				if (!isEmpty(objeto_garantia)) {
					Map valores = (Map) tratarRETURNyMENSAJES(request, objeto_garantia);
					if (!isEmpty(valores)) {
						ArrayList lista_primas = (ArrayList) valores.get("DETPRIMAS");

						// A�adida precisi�n segun tabla det_primas.

						if (lista_primas != null && lista_primas.size() > 0) {
							for (int i = 0; i < lista_primas.size(); i++) {

								Map detPrimas = (Map) lista_primas.get(i);
								if (!isEmpty(detPrimas)) {
									Map detGarFormula = (Map) detPrimas.get("OB_IAX_DETPRIMAS");
									if (!isEmpty(detGarFormula)) {
										String pattern = "###,##0.000000";
										BigDecimal decvis = (BigDecimal) detGarFormula.get("NDECVIS");

										if (decvis != null) {
											pattern = "###,##0";
											if (!decvis.equals(BigDecimal.ZERO)) {
												pattern += ".";
												int j = decvis.intValue();
												while (j > 0) {
													pattern += "0";
													j--;
												}

											}
										}
										detGarFormula.put("PDECVIS", pattern);
									}
								}
							}

						}
						request.setAttribute("DETPRIMAS", lista_primas);
					}
				}
				/* ** ** ** ** ** ** ** ** ** ** ** ** ** ** ** */
			}

			request.getSession().setAttribute("axisctr_garantia", garantia);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que actualiza la pantalla en funci�n de los cambios producidos en una
	 * garantia.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guardarCambios(HttpServletRequest request, Axisctr011Action thisAction) {
		logger.debug("Axisctr011Service m_guardarCambios");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// Recuperamos garant�a a procesar
			Map garantia = (Map) request.getSession().getAttribute("axisctr_garantia");

			if (!isEmpty(garantia)) {
				// Procesamos actualizaciones
				BigDecimal zero = new BigDecimal(0);
				BigDecimal CREVALI = getCampoNumerico(request, "tipoRevalorizacion") == null ? zero
						: getCampoNumerico(request, "tipoRevalorizacion");
				BigDecimal PREVALI = getCampoNumerico(request, "valorRevalorizacion") == null ? zero
						: getCampoNumerico(request, "valorRevalorizacion");
				BigDecimal PRECARG = getCampoNumerico(request, "sobreprima") == null ? zero
						: getCampoNumerico(request, "sobreprima");
				BigDecimal PDTOCOM = getCampoNumerico(request, "dto") == null ? zero : getCampoNumerico(request, "dto");
				BigDecimal IEXTRAP = getCampoNumerico(request, "extraprima") == null ? zero
						: getCampoNumerico(request, "extraprima");
				// ETM 21657
				BigDecimal PDTOTEC = getCampoNumerico(request, "dto_tecnico") == null ? zero
						: getCampoNumerico(request, "dto_tecnico");
				BigDecimal PRECCOM = getCampoNumerico(request, "por_recargocomercial") == null ? zero
						: getCampoNumerico(request, "por_recargocomercial");

				BigDecimal CREVALI2 = (BigDecimal) garantia.get("CREVALI");
				BigDecimal PREVALI2 = (BigDecimal) garantia.get("PREVALI");
				BigDecimal PRECARG2 = (BigDecimal) garantia.get("PRECARG");
				BigDecimal PDTOCOM2 = (BigDecimal) garantia.get("PDTOCOM");
				BigDecimal IEXTRAP2 = (BigDecimal) garantia.get("IEXTRAP");
				BigDecimal PDTOTEC2 = (BigDecimal) garantia.get("PDTOTEC");
				BigDecimal PRECCOM2 = (BigDecimal) garantia.get("PRECCOM");

				garantia.put("CREVALI", CREVALI);
				garantia.put("PREVALI", PREVALI);
				garantia.put("PRECARG", PRECARG);
				garantia.put("PDTOCOM", PDTOCOM);
				garantia.put("IEXTRAP", IEXTRAP);
				// ETM 21657
				garantia.put("PDTOTEC", PDTOTEC);
				garantia.put("PRECCOM", PRECCOM);
				logger.debug("etm  PDTOTEC->" + PDTOTEC);
				logger.debug("etm  PRECCOM->" + PRECCOM);

				// Si no hay cambios no hago nada.
				if (CREVALI.doubleValue() != CREVALI2.doubleValue() || PREVALI.doubleValue() != PREVALI2.doubleValue()
						|| PRECARG.doubleValue() != PRECARG2.doubleValue()
						|| PDTOCOM.doubleValue() != PDTOCOM2.doubleValue()
						|| IEXTRAP.doubleValue() != IEXTRAP2.doubleValue()
						|| PDTOTEC.doubleValue() != PDTOTEC2.doubleValue()
						|| PRECCOM.doubleValue() != PRECCOM2.doubleValue()) {
					// TODO: Es la forma correcta de recuperar NRIESGO?
					BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
					logger.debug(new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_GRABATIPREVALVAL(NRIESGO,
									(BigDecimal) garantia.get("CGARANT"), CREVALI, PREVALI, PRECARG, PDTOCOM, IEXTRAP,
									PDTOTEC, PRECCOM));

					List g = null;
					if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
						g = (List) request.getSession().getAttribute("axisctr_garantias_ini");
					else
						g = (List) request.getSession().getAttribute("axisctr_garantias");
					// Actualizamos lista de garant�as en session
					List garantiasActualizadas = setObjetoALista(g, garantia, "OB_IAX_GARANTIAS");

					if (!isEmpty(request.getSession().getAttribute("axisctr_garantias_ini")))
						request.getSession().setAttribute("axisctr_garantias_ini", garantiasActualizadas);
					else
						request.getSession().setAttribute("axisctr_garantias", garantiasActualizadas);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr011Service - m�todo m_guardarCambios", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// Borrar garant�a de session si hemos estado editando alguna
			request.getSession().removeAttribute("axisctr_garantia");
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * Valida mediante la llamada a la funci�n que se bloquee o no el combo de
	 * revalorizaciones en la pantalla 007
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_validar_reval(HttpServletRequest request, Axisctr011Action thisAction) {
		logger.debug("Axisctr011Service m_validar_reval");

		try {
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal CREVALI = getCampoNumerico(request, "tipoRevalorizacion");
			BigDecimal IREVALI = null;
			BigDecimal PREVALI = null;
			if (CREVALI.intValue() == 1)
				IREVALI = getCampoNumerico(request, "valorRevalorizacion");
			else
				PREVALI = getCampoNumerico(request, "valorRevalorizacion");

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALGAR(CGARANT, CREVALI, PREVALI, IREVALI);
			logger.debug(m);
			BigDecimal valor_reval = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (valor_reval.intValue() == 0) {
				request.getSession().setAttribute("valida_reval", "0");
			} else {
				request.getSession().setAttribute("valida_reval", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr007Service - m�todo m_valida_reval", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
