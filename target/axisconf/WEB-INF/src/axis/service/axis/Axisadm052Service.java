package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CONTABILIDAD;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm052Service.java 01/09/2008
 * 
 * @author <a href="jcolldeforns@csi-ti.com">Joan Colldeforns</a>
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm052Service extends AxisBaseService {
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
		logger.debug("Axisadm052Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// Lista Empresas
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map LISTVALORES = new HashMap();
			Map map2 = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map2));
			formdata.put("LISTVALORES", LISTVALORES);

			formdata.put("LINK_INFORME", null);
			formdata.put("LINK_TRASPASAR", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm052Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	@SuppressWarnings("all")
	public void m_montar_fichero(HttpServletRequest request) {
		logger.debug("Axisadm052Service m_montar_fichero");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_RECERCA");
			BigDecimal CHECKTRASPAS = new BigDecimal((String) formdata.get("traspaso_check"));

			java.sql.Date FCONTABINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABINI"));
			java.sql.Date FCONTABFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABFIN"));
			java.sql.Date FTRASPASINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTRASPASINI"));
			java.sql.Date FTRASPASFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTRASPASFIN"));

			java.sql.Date FADMININI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FADMININI"));
			java.sql.Date FADMINFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FADMINFIN"));

			PAC_IAX_CONTABILIDAD pacIaxContabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxContabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_MONTAR_FICHERO(CEMPRES, FCONTABINI, FCONTABFIN,
					FTRASPASINI, FTRASPASFIN, FADMININI, FADMINFIN, CHECKTRASPAS);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("LINK_INFORME", map.get("PNOMFICHERO"));
			this.m_buscar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm052Service - m�todo m_montar_fichero", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	@SuppressWarnings("all")
	public void m_traspasar(HttpServletRequest request) {
		logger.debug("Axisadm052Service m_traspasar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_RECERCA");
			Date FCONTABINI = stringToSqlDate(getCampoTextual(request, "FCONTABINI"));
			Date FCONTABFIN = stringToSqlDate(getCampoTextual(request, "FCONTABFIN"));
			Date FADMININI = stringToSqlDate(getCampoTextual(request, "FADMININI"));
			Date FADMINFIN = stringToSqlDate(getCampoTextual(request, "FADMINFIN"));

			PAC_IAX_CONTABILIDAD pacIaxContabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxContabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_TRASPASAR(CEMPRES, FCONTABINI, FCONTABFIN,
					FADMININI, FADMINFIN);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("LINK_TRASPASAR", map.get("PNOMFICHERO"));

			this.m_buscar(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm052Service - m�todo m_traspasar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	@SuppressWarnings("all")
	public void m_contabiliza_diario(HttpServletRequest request) {
		logger.debug("Axisadm052Service m_contabiliza_diario");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			java.sql.Date FCONTAB = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTAB"));
			PAC_IAX_CONTABILIDAD pacIaxContabilidad = new PAC_IAX_CONTABILIDAD(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxContabilidad.ejecutaPAC_IAX_CONTABILIDAD__F_CONTABILIZA_DIARIO(CEMPRES, FCONTAB);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map);

			this.m_buscar(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm052Service - m�todo m_contabiliza_diario", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axisadm052Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES_RECERCA");
			BigDecimal CHECKTRASPAS = new BigDecimal((String) formdata.get("traspaso_check"));

			// AxisBaseService.stringToSqlDate((String)formdata.get("FCONTABINI"));
			java.sql.Date FCONTABINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABINI"));
			java.sql.Date FCONTABFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONTABFIN"));
			java.sql.Date FTRASPASINI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTRASPASINI"));
			java.sql.Date FTRASPASFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FTRASPASFIN"));

			java.sql.Date FADMININI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FADMININI"));
			java.sql.Date FADMINFIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FADMINFIN"));

			Map map = new PAC_IAX_CONTABILIDAD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_CONTABILIDAD__F_GET_CONTABILIDAD_DIARIA(CEMPRES, FCONTABINI, FCONTABFIN,
							FTRASPASINI, FTRASPASFIN, FADMININI, FADMINFIN, CHECKTRASPAS);
			logger.debug(map);
			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {

				if (!isEmpty(map)) {
					request.setAttribute("LISTA_CONT", map.get("PCONTDIARIAS"));
					request.getSession().setAttribute("LISTA_CONT_ORIG", map.get("PCONTDIARIAS"));
				}
			}
			// Lista Empresas
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map LISTVALORES = new HashMap();
			Map map2 = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("llega3");
			logger.debug(map2);
			logger.debug("llega4");
			LISTVALORES.put("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map2));
			formdata.put("LISTVALORES", LISTVALORES);
			formdata.put("CCUENTA", null);
			formdata.put("CPROCES", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm051Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_filtrar_buscar(HttpServletRequest request) {
		logger.debug("Axisadm052Service m_filtrar_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String CCUENTA = getCampoTextual(request, "CCUENTA");
			String CPROCES = getCampoTextual(request, "CPROCES");
			List<HashMap> listaCont = (List<HashMap>) request.getSession().getAttribute("LISTA_CONT_ORIG");
			List<HashMap> listaContResult = new ArrayList<HashMap>();
			if (!isEmpty(CCUENTA) || !isEmpty(CPROCES)) {
				if (!isEmpty(listaCont)) {
					for (HashMap hmLista : listaCont) {
						if (!isEmpty(CCUENTA) && !isEmpty(CPROCES)) {
							// Si estan informats els dos filtres...
							String cCuenta = (String) hmLista.get("CCUENTA");
							BigDecimal cProces = (BigDecimal) hmLista.get("CPROCES");
							if (cCuenta.contains(CCUENTA) && cProces.toString().contains(CPROCES))
								listaContResult.add(hmLista);
						} else {
							// Si nomes hi ha un dels dos...
							if (!isEmpty(CCUENTA)) {
								String cCuenta = (String) hmLista.get("CCUENTA");
								if (cCuenta.contains(CCUENTA))
									listaContResult.add(hmLista);
							} else if (!isEmpty(CPROCES)) {
								BigDecimal cProces = (BigDecimal) hmLista.get("CPROCES");
								if (cProces.toString().contains(CPROCES))
									listaContResult.add(hmLista);
							}
						}
					}
					request.setAttribute("LISTA_CONT", listaContResult);
				}
			} else {
				request.setAttribute("LISTA_CONT", listaCont);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm051Service - m�todo m_filtrar_buscar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
