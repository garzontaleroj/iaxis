//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm002Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisadm002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			boolean buscar = false;

			if (!isEmpty(getCampoTextual(request, "buscar")))
				buscar = "true".equals(getCampoTextual(request, "buscar"));
			else if (!isEmpty(request.getAttribute("buscar")))
				buscar = "true".equals(String.valueOf(request.getAttribute("buscar")));

			if (buscar) {

				logger.debug("---------------------------> BUSCO");

				// TODO: Permitir b�squedas sin NRECIBO? Es una query larga, se queda tirado
				BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
				if (isEmpty(NRECIBO) && !isEmpty(request.getAttribute("NRECIBO")))
					NRECIBO = new BigDecimal(String.valueOf(request.getAttribute("NRECIBO")));
				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
				BigDecimal CTIPREC = getCampoNumerico(request, "CTIPREC");
				BigDecimal CESTREC = getCampoNumerico(request, "CESTREC");
				BigDecimal CESTIMP = getCampoNumerico(request, "CESTIMP");
				Date FEMISIOINI = stringToSqlDate(getCampoTextual(request, "FEMISIOINI"));
				Date FEMISIOFIN = stringToSqlDate(getCampoTextual(request, "FEMISIOFIN"));
				Date FEFEINI = stringToSqlDate(getCampoTextual(request, "FEFEINI"));
				Date FEFEFIN = stringToSqlDate(getCampoTextual(request, "FEFEFIN"));
				String CRECCIA = getCampoTextual(request, "CRECCIA");
				String CPOLCIA = getCampoTextual(request, "CPOLCIA");
				BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
				BigDecimal LIQUIDAD = getCampoNumerico(request, "LIQUIDAD");
				BigDecimal PRECUNIF = new BigDecimal("0");

				BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

				// Inici Bug 20326/99335 - BFP 05/12/2011
				BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
				BigDecimal CTIPCUENTA = this.getCampoNumerico(request, "CTIPCUENTA");
				// Fi Bug 20326/99335 - BFP 05/12/2011

				String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
				String CMODO_ANT = (String) AbstractDispatchAction.topPila(request, "CMODO_ANT");

				/*
				 * Si despu�s de unificar (una vez unificado se cambia el modo a consulta)
				 * vuelven a buscar recibos, se vuelve a activar el modo unificiac�n
				 */
				BigDecimal PCBUSCADOR = getCampoNumerico(request, "CBUSCADOR");
				if (PCBUSCADOR != null && PCBUSCADOR.equals(new BigDecimal(1))) {
					if (CMODO_ANT != null && "UNIFICACION".equals(CMODO_ANT)) {
						AbstractDispatchAction.topPila(request, "CMODO", CMODO_ANT);
						AbstractDispatchAction.topPila(request, "CMODO_ANT", null);
					}
				}
				/*
				 * if(CMODO!=null && ("UNIFICACION".equals(CMODO) ||
				 * "DESUNIFICACION".equals(CMODO)) && isEmpty(CTIPREC)){ CESTREC = new
				 * BigDecimal("0"); }
				 */
				if (CMODO != null && "UNIFICACION".equals(CMODO)) {
					PRECUNIF = new BigDecimal("1");
				} else if (CMODO != null && "DESUNIFICACION".equals(CMODO)) {
					PRECUNIF = new BigDecimal("2");
				}

				// Bug 18908/90150 - 05/08/2011 - AMC
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal LSAGENTESTIPO = getCampoNumerico(request, "LSAGENTESTIPO");
				BigDecimal LSAGENTE = getCampoNumerico(request, "LSAGENTE");
				BigDecimal LSMEDIO = getCampoNumerico(request, "LSMEDIO");
				BigDecimal DOMICILIADO = getCampoNumerico(request, "DOMICILIADO");

				BigDecimal COBBAN = getCampoNumerico(request, "COBBAN");
				String REBUT_INI = getCampoTextual(request, "REBUT_INI");

				BigDecimal PNANUALI = getHiddenCampoNumerico(request, "NANUALI");
				BigDecimal PNFRACCI = getHiddenCampoNumerico(request, "NFRACCI");

				String CCONDICION = getHiddenCampoTextual(request, "TCONDICION");

				BigDecimal CTIPNEGOC = getHiddenCampoNumerico(request, "CTIPNEGOC");
				String PTIPNEGOC = getHiddenCampoTextual(request, "TIPNEGOC");

				BigDecimal PTIPREGIO = getHiddenCampoNumerico(request, "TIPREGIO");

				BigDecimal vctipmegoc = null;
				if (isEmpty(CTIPNEGOC) && !isEmpty(PTIPNEGOC)) {
					vctipmegoc = new BigDecimal(PTIPNEGOC);
				} else {
					vctipmegoc = CTIPNEGOC;
				}

				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				// -- Bug 0012679 - 18/02/2010 - JMF
				// Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS(NRECIBO,
				// CEMPRES, SPRODUC, NPOLIZA,
				// NCERTIF, CTIPREC, CESTREC, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CTIPO,
				// SPERSON);
				BigDecimal filtro = this.getFiltro(request);
				// INI BUG IAXIS-13049 JRVG 15/07/2020
				String NRECCAJ = getCampoTextual(request, "NRECCAJ"); // BUG CONF-441 - 14/12/2016 - JAEG
				// FIN BUG IAXIS-13049 JRVG 15/07/2020
				BigDecimal CMRECA = getCampoNumerico(request, "CMRECA"); // BUG CONF-441 - 14/12/2016 - JAEG

				logger.debug("tipregio" + PTIPREGIO);
				Map map = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_CONSULTARECIBOS_MV(NRECIBO, CEMPRES, SPRODUC, NPOLIZA,
						NCERTIF, CTIPREC, CESTREC, FEMISIOINI, FEMISIOFIN, FEFEINI, FEFEFIN, CTIPO, SPERSON, PRECUNIF,
						CESTIMP, CRECCIA, CPOLCIA, CCOMPANI, LIQUIDAD, filtro, CRAMO, LSAGENTESTIPO, LSAGENTE, LSMEDIO,
						DOMICILIADO, CBANCO, CTIPCUENTA, COBBAN, REBUT_INI, PNANUALI, PNFRACCI, vctipmegoc, CCONDICION,
						PTIPREGIO, // Bug 20326/99335 afegits els par�metres CBANCO i CTIPCUENTA - BFP 05/12/2011
						NRECCAJ, CMRECA); // BUG CONF-441 - 14/12/2016 - JAEG

				logger.debug("F_GET_CONSULTARECIBOS_MV -----------------------> " + map);

				List LSTRECIBOS = (List<Map>) tratarRETURNyMENSAJES(request, map);
				if (isEmpty(LSTRECIBOS))
					// No se han encontrado datos
					AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);

				request.getSession().setAttribute("REC_LSTRECIBOS", LSTRECIBOS);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_desunificar_recibos(HttpServletRequest request) {
		logger.debug("Axisadm002Service m_desunificar_recibos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String LISTA_REC = "";
			for (int i = 0; i < CUENTA.intValue(); i++) {

				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);
				if (!isEmpty(SELEC)) {
					if (SELEC.intValue() != 0) { // La casilla est� seleccionada

						BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
						LISTA_REC = LISTA_REC + NRECIBO + ";";
					}
				}
			}

			logger.debug("---> LISTA_REC:" + LISTA_REC);

			Map m = pac_iax_adm.ejecutaPAC_IAX_ADM__F_DESAGRUPARECIBO(LISTA_REC, null, null);
			logger.debug("--> map:" + m);
			if (m.get("RETURN").equals(new BigDecimal(0))) {
				// formdata.put("buscar",true);
				request.setAttribute("buscar", true);
			}
			tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm003Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_unificar_recibos(HttpServletRequest request) {
		logger.debug("Axisadm002Service m_unificar_recibos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");

			PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String LISTA_REC = "";
			for (int i = 0; i < CUENTA.intValue(); i++) {

				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);
				if (!isEmpty(SELEC)) {
					if (SELEC.intValue() != 0) { // La casilla est� seleccionada

						BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
						LISTA_REC = LISTA_REC + NRECIBO + ";";
					}
				}
			}

			Map mapa = pac_iax_adm.ejecutaPAC_IAX_ADM__F_AGRUPARECIBO(LISTA_REC);
			logger.debug(mapa);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {
				List LSTRECIBOS = (List<Map>) mapa.get("P_LSTRECIBOSUNIF");
				if (isEmpty(LSTRECIBOS)) {
					// No se han encontrado datos
					AbstractDispatchAction.guardarMensaje(request, "9901222", null, Constantes.MENSAJE_ERROR);
				} else {
					AbstractDispatchAction.topPila(request, "CMODO", null);
					AbstractDispatchAction.topPila(request, "CMODO_ANT", "UNIFICACION");
				}

				request.getSession().setAttribute("REC_LSTRECIBOS", LSTRECIBOS);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm002Service - m�todo m_unificar_recibos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
