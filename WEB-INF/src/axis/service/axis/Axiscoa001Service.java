//Revision:# i+kR/saCKG4b2oWiyI1wcQ== #
package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COA;
import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_COA;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axiscoa001Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * CONSULTA CUENTAS COASEGURO - AXISCOA080 segun analisis!
 */
public class Axiscoa001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_itemchangesjaxjson(HttpServletRequest request, Axiscoa001Action thisAction) {
		logger.debug("Axiscoa080Service m_itemchangesjaxjson");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String itemid = this.getCampoTextual(request, "itemid");
			String itemvalue = this.getCampoTextual(request, "itemvalue");
			logger.debug("itemid:" + itemid + "/" + itemvalue);
			HashMap miDataObject = new HashMap();
			Map map = null;

			if (itemid.equals("CEMPRES")) {
				BigDecimal CEMPRES = this.getCampoNumerico(request, "itemvalue");
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(Connection) request.getAttribute(Constantes.DB01CONN));
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, CEMPRES);
				miDataObject.put("recargarCombo", "CRAMO");
				miDataObject.put("RAMOS", (ArrayList) tratarRETURNyMENSAJES(request, map, false));
			}
			if (itemid.equals("CEMPRES_CRAMO")) {
				String CEMPRES_CRAMO = this.getCampoTextual(request, "itemvalue");
				BigDecimal CEMPRES = new BigDecimal(CEMPRES_CRAMO.substring(0, CEMPRES_CRAMO.indexOf("_")));
				BigDecimal CRAMO = new BigDecimal(CEMPRES_CRAMO.substring(CEMPRES_CRAMO.indexOf("_") + 1));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(Connection) request.getAttribute(Constantes.DB01CONN));
				if (CEMPRES.intValue() < 0) {
					CEMPRES = null;
				}
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRES, CRAMO);
				miDataObject.put("recargarCombo", "SPRODUC");
				miDataObject.put("PRODUCTOS", tratarRETURNyMENSAJES(request, map, false));
			}
			if (itemid.equals("SPRODUC")) {
				BigDecimal SPRODUC = this.getCampoNumerico(request, "itemvalue");
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(Connection) request.getAttribute(Constantes.DB01CONN));
				// Si marcamos la opci�n nula del combo SPRODUC, mostraremos como al iniciar la
				// pantalla -> SPRODUC = 0
				if (SPRODUC == null) {
					SPRODUC = new BigDecimal(0);
				}
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(SPRODUC, new BigDecimal("4"));
				miDataObject.put("recargarCombo", "COMPANIA");
				miDataObject.put("COMPANIAS", tratarRETURNyMENSAJES(request, map, false));
			}

			request.setAttribute(Constantes.AJAXCONTAINER, miDataObject);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_init(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
			if (isEmpty(CEMPRES)) {
				formdata.put("CEMPRES", CEMPRES.toString());
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			SINPAQUETE sinpaquete = new SINPAQUETE((Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = null;
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			java.sql.Date FCIERRE = stringToSqlDate(getCampoTextual(request, "FCIERRE"));
			java.sql.Date FCIERREDESDE = stringToSqlDate(getCampoTextual(request, "FCIERREDESDE"));
			java.sql.Date FCIERREHASTA = stringToSqlDate(getCampoTextual(request, "FCIERREHASTA"));
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			BigDecimal SSEGURO = null;

			if (NPOLIZA != null && NCERTIF != null) {
				map = sinpaquete.ejecutaFF_BUSCASSEGURO(NPOLIZA, NCERTIF);
				SSEGURO = (BigDecimal) map.get("RETURN");
			}

			BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
			BigDecimal COMPANIA = getCampoNumerico(request, "COMPANIA");
			BigDecimal TIPOCOASEGURO = getCampoNumerico(request, "TIPOCOASEGURO");
			BigDecimal INVERFAS = getCampoNumerico(request, "INVERFAS");
			BigDecimal NUMPROCES = getCampoNumerico(request, "NUMPROCES");

			logger.debug(NPOLIZA + " " + NCERTIF + " " + SSEGURO);

			Map mapa_resultado = pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_CTACOASEGURO(CEMPRES, CCOMPANI, CRAMO, SPRODUC,
					FCIERRE, SSEGURO, CESTADO, COMPANIA, TIPOCOASEGURO, NPOLIZA, NCERTIF, INVERFAS, NUMPROCES,
					FCIERREDESDE, FCIERREHASTA);

			logger.debug(mapa_resultado);

			List RETURN = (List) tratarRETURNyMENSAJES(request, mapa_resultado);

			if (!isEmpty(RETURN)) {
				for (int i = 0; i < (int) RETURN.size(); i++) {
					// String trozo=cadena[i];
					Integer valor = new Integer(i);
					HashMap mapa = (HashMap) RETURN.get(valor); // Se busca el registro
					BigDecimal saldo = (BigDecimal) mapa.get("ISALDO");
					mapa.put("ILIQUIDA", saldo);
					mapa.put("NUM_LINEA", 1); // Ponemos el valor de l�nea a 1
				}
			}

			request.setAttribute("setFiltros", 1);

			if (!isEmpty(RETURN)) {
				request.setAttribute("CTACOASEGURO", tratarRETURNyMENSAJES(request, mapa_resultado));
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_buscar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			cargar_listas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void cargar_listas(HttpServletRequest request) {
		logger.debug("Axiscoa001Service cargar_listas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_COA pac_iax_listvalores_coa = new PAC_IAX_LISTVALORES_COA(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES_REA pac_iax_listvalores_rea = new PAC_IAX_LISTVALORES_REA(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
			BigDecimal CRAMO = this.getCampoNumerico(request, "CRAMO");

			Map map = null;

			// Recuperar empresas
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			request.setAttribute("LSTEMPRESAS", tratarRETURNyMENSAJES(request, map));

			// cargar ramos
			if (!isEmpty(CEMPRES)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, CEMPRES);
				request.setAttribute("RAMOS", tratarRETURNyMENSAJES(request, map, false));
			}

			// cargar productos
			if (!isEmpty(CEMPRES) && !isEmpty(CRAMO)) {
				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, CEMPRES, CRAMO);
				request.setAttribute("PRODUCTOS", tratarRETURNyMENSAJES(request, map, false));
			}

			// cargar coaseguradoas
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS();
			request.setAttribute("LSTCIA_REA", tratarRETURNyMENSAJES(request, map, false));

			// cargar compa�ias
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COMPANIAS(new BigDecimal("0"),
					new BigDecimal("4"));
			request.setAttribute("LSTCOMPANIAS", tratarRETURNyMENSAJES(request, map, false));

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			// formdata.put("SPRODUC", SPRODUC);
			// cargar tipos de coaseguradoas
			map = pac_iax_listvalores_coa.ejecutaPAC_IAX_LISTVALORES_COA__F_GET_TIPCOASEGURO(CEMPRES, SPRODUC,
					new BigDecimal(1), new BigDecimal(800109));
			request.setAttribute("TIPCOASEGURO", tratarRETURNyMENSAJES(request, map, false));

			// cargar estados
			map = pac_iax_listvalores_rea.ejecutaPAC_IAX_LISTVALORES_REA__F_GET_ESTADO_CTA();
			request.setAttribute("LSTESTADOS", tratarRETURNyMENSAJES(request, map, false));

			// INVERFAS
			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(307));
			logger.debug(map);
			request.setAttribute("LSTINVERFAS", (List) tratarRETURNyMENSAJES(request, map, false));

			// TODO: saber de donde sacar la lista pata COMPA�IAS

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo cargar_listas", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	@SuppressWarnings("all")
	public void m_recargar_pantalla(HttpServletRequest request) {
		logger.debug("Axiscoa001Service m_recargar_pantalla");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		this.formattingNumericValues(request);
		try {
			PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));
			SINPAQUETE sinpaquete = new SINPAQUETE((Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = null;
			BigDecimal SSEGURO = null;
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = null;
			BigDecimal SPRODUC = null;
			BigDecimal NPOLIZA = null;
			BigDecimal NCERTIF = null;
			BigDecimal CESTADO = null;
			BigDecimal COMPANIA = null;
			BigDecimal CCOMPANI = null;
			BigDecimal TIPOCOASEGURO = null;
			java.sql.Date FCIERRE = null;
			java.sql.Date FCIERREDESDE = null;
			java.sql.Date FCIERREHASTA = null;
			BigDecimal INVERFAS = null;
			BigDecimal CCOMPAPR = null;
			BigDecimal CTIPCOA = null;
			BigDecimal SPROCES = null;
			BigDecimal NUMPROCES = null;
			BigDecimal CMOVIMI = new BigDecimal("99");

			BigDecimal CESTADO_NEW = this.getCampoNumerico(request, "CESTADO_NEW");
			BigDecimal CESTADO_OLD = this.getCampoNumerico(request, "CESTADO_OLD");

			// CCOMPAPR|CCOMPANI|CTIPCOA|FCIERRE|SPROCES
			String[] identificadorArray = (String[]) formdata.get("identificador");
			String identificador = identificadorArray[0];
			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|");
				if (identificadorSplitted[0].trim().length() > 0)
					CCOMPAPR = new BigDecimal(identificadorSplitted[0].trim());
				if (identificadorSplitted[1].trim().length() > 0)
					CCOMPANI = new BigDecimal(identificadorSplitted[1].trim());
				if (identificadorSplitted[2].trim().length() > 0)
					CTIPCOA = new BigDecimal(identificadorSplitted[2].trim());
				if (identificadorSplitted[3].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(identificadorSplitted[3].trim());
				if (identificadorSplitted[4].trim().length() > 0)
					SPROCES = new BigDecimal(identificadorSplitted[4].trim());
			}

			Map mapa_resultado1 = pac_iax_coa.ejecutaPAC_IAX_COA__F_SET_ESTADO_CTACOA(CCOMPANI, CCOMPAPR, CTIPCOA,
					CEMPRES, SPROCES, CMOVIMI, FCIERRE, CESTADO_NEW, CESTADO_OLD);

			CCOMPANI = null;
			FCIERRE = null;

			// Al hacer una recarga de pantalla tenemos en cuenta los Filtros seteados en la
			// �ltima b�squeda, no los seleccionados en el formulario
			String filtros = this.getCampoTextual(request, "filtros");

			if (filtros != null) {
				String[] filtrosSplitted = StringUtils.splitPreserveAllTokens(filtros, "|"); // CEMPRES|CRAMO|SPRODUC|NPOLIZA|NCERTIF|CESTADO
				if (filtrosSplitted[0].trim().length() > 0)
					CEMPRES = new BigDecimal(filtrosSplitted[0].trim());
				if (filtrosSplitted[1].trim().length() > 0)
					CRAMO = new BigDecimal(filtrosSplitted[1].trim());
				if (filtrosSplitted[2].trim().length() > 0)
					SPRODUC = new BigDecimal(filtrosSplitted[2].trim());
				if (filtrosSplitted[3].trim().length() > 0)
					NPOLIZA = new BigDecimal(filtrosSplitted[3].trim());
				if (filtrosSplitted[4].trim().length() > 0)
					NCERTIF = new BigDecimal(filtrosSplitted[4].trim());
				if (filtrosSplitted[5].trim().length() > 0)
					CESTADO = new BigDecimal(filtrosSplitted[5].trim());
				if (filtrosSplitted[6].trim().length() > 0)
					COMPANIA = new BigDecimal(filtrosSplitted[6].trim());
				if (filtrosSplitted[7].trim().length() > 0)
					CCOMPANI = new BigDecimal(filtrosSplitted[7].trim());
				if (filtrosSplitted[8].trim().length() > 0)
					TIPOCOASEGURO = new BigDecimal(filtrosSplitted[8].trim());
				if (filtrosSplitted[9].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(filtrosSplitted[9].trim());
				if (filtrosSplitted[10].trim().length() > 0)
					INVERFAS = new BigDecimal(filtrosSplitted[10].trim());
				if (filtrosSplitted[11].trim().length() > 0)
					NUMPROCES = new BigDecimal(filtrosSplitted[11].trim());
				if (filtrosSplitted[12].trim().length() > 0)
					FCIERREDESDE = this.stringToSqlDate(filtrosSplitted[12].trim());
				if (filtrosSplitted[13].trim().length() > 0)
					FCIERREHASTA = this.stringToSqlDate(filtrosSplitted[13].trim());
			}

			if (NPOLIZA != null && NCERTIF != null) {
				map = sinpaquete.ejecutaFF_BUSCASSEGURO(NPOLIZA, NCERTIF);
				SSEGURO = (BigDecimal) map.get("RETURN");
			}

			logger.debug(NPOLIZA + " " + NCERTIF + " " + SSEGURO);

			Map mapa_resultado2 = pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_CTACOASEGURO(CEMPRES, CCOMPANI, CRAMO, SPRODUC,
					FCIERRE, SSEGURO, CESTADO, COMPANIA, TIPOCOASEGURO, NPOLIZA, NCERTIF, INVERFAS, NUMPROCES,
					FCIERREDESDE, FCIERREHASTA);

			BigDecimal SALDO_TOTAL = new BigDecimal("0");
			String elementos = getCampoTextual(request, "CADENA_VALORES");
			String cadena[] = new String[0];
			if (elementos != null) {
				cadena = elementos.split("x");
			}

			logger.debug(mapa_resultado2);

			List<Map> RETURN = (List<Map>) tratarRETURNyMENSAJES(request, mapa_resultado2);

			// Recomponer registros obtenidos

			logger.debug("cadena:>>>>>>>>>>>>>>>>>>" + cadena);
			for (int i = 0; i < cadena.length; i++) {
				String trozo = cadena[i];
				Integer valor = new Integer(trozo);
				HashMap mapa = (HashMap) RETURN.get(valor); // Se busca el registro
				BigDecimal saldo = (BigDecimal) mapa.get("ISALDO");
				mapa.put("ILIQUIDA", saldo);
				mapa.put("NUM_LINEA", 1); // Ponemos el valor de l�nea a 1
			}

			request.setAttribute("setFiltros", 0);

			if (!isEmpty(RETURN)) {
				request.setAttribute("CTACOASEGURO", RETURN);
			} else {
				// No hay registros
				AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_recargar_pantalla", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Funcionalidad simple de pedir un SPROCES desde PAC_IAX_REA por JSON
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recuperarsprocesajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal LASTCHECK = this.getCampoNumerico(request, "LASTCHECK");
			if (CEMPRES != null) {
				PAC_IAX_COA pac_axis_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

				java.sql.Date FPERFIN = new java.sql.Date(new java.util.Date().getTime());
				String sFPERFIN = this.getCampoTextual(request, "FPERFIN");
				if (sFPERFIN != null && sFPERFIN.trim().length() > 0) {
					FPERFIN = this.stringToSqlDate(sFPERFIN);
				}
				Map map = pac_axis_coa.ejecutaPAC_IAX_COA__F_REGISTRA_PROCESO(FPERFIN, CEMPRES);
				logger.debug("map:" + map);
				Object RETURN = this.tratarRETURNyMENSAJES(request, map);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				}
				request.setAttribute(Constantes.AJAXCONTAINER, map);
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_cancelar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa001Service m_cancelar");
		try {
			PAC_IAX_COA pac_axis_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

			Map map = pac_axis_coa.ejecutaPAC_IAX_COA__F_RESET_ESTADO(CEMPRES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_cancelar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_liquidar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa001Service m_liquida");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_COA pac_axis_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PCEMPRES = this.getCampoNumerico(request, "CEMPRES");
			BigDecimal PCCOMPANI = this.getCampoNumerico(request, "CCOMPANI");
			BigDecimal PCCOMPAPR = this.getCampoNumerico(request, "COMPANIA");
			java.sql.Date PFCIERRE = stringToSqlDate(this.getCampoTextual(request, "FCIERRE"));
			java.sql.Date PFCIERREDESDE = stringToSqlDate(this.getCampoTextual(request, "FCIERREDESDE"));
			java.sql.Date PFCIERREHASTA = stringToSqlDate(this.getCampoTextual(request, "FCIERREHASTA"));
			BigDecimal PCTIPCOA = this.getCampoNumerico(request, "TIPOCOASEGURO");

			String[] identificadorArray = (String[]) formdata.get("identificador");
			String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificadorArray[0], "|");
			BigDecimal PSPROCES_ANT = new BigDecimal(identificadorSplitted[4].trim());

			BigDecimal PSPROCES_NOU = this.getCampoNumerico(request, "SPROCES");

			Map map = null;
			map = pac_axis_coa.ejecutaPAC_IAX_COA__F_LIQUIDA_CTATEC_COA(PCEMPRES, PCCOMPANI, PCCOMPAPR, PFCIERRE,
					PFCIERREDESDE, PFCIERREHASTA, PCTIPCOA, PSPROCES_ANT, PSPROCES_NOU);
			this.tratarRETURNyMENSAJES(request, map);
			logger.debug(map);

			String msg = null;
			if ((map.get("RETURN").equals(BigDecimal.ZERO)))
				msg = Traductor.s_traducir((String) request.getSession().getAttribute("__locale"), "109904");
			else
				msg = Traductor.s_traducir((String) request.getSession().getAttribute("__locale"), "9901850");

			if (msg != null) {
				thisAction.guardarMensaje(request, "verbatim:" + msg, null, Constantes.MENSAJE_INFO);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa001Service - m�todo m_liquida", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_descargar_reporte(HttpServletRequest request, Axiscoa001Action thisAction) {
		logger.debug("Axisrea011aService m_descargar_reporte");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		String CMAP = "reporteFacturaCoaseguradora";

		BigDecimal pCODPROCES = getCampoNumerico(request, "CODPROCES");
		BigDecimal pCODCOMPANI = getCampoNumerico(request, "CODCOMPANI");
		BigDecimal pCODLIQUIDCOA = getCampoNumerico(request, "CODLIQUIDCOA");

		String CEXPORT = "PDF";
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = usuario.getCidioma();
		String CEMAIL = null;

		PARAMETROS__.put("PCODPROCES", "" + pCODPROCES);
		PARAMETROS__.put("PCODCOMPANI", "" + pCODCOMPANI);
		PARAMETROS__.put("PCODLIQUIDCOA", "" + pCODLIQUIDCOA);

		TPARAMETROS__.put("TPCODPROCES", "1");
		TPARAMETROS__.put("TPCODCOMPANI", "1");
		TPARAMETROS__.put("TPCODLIQUIDCOA", "1");

		// BigDecimal pPCTIPO = getCampoNumerico(request, "CEXCEPCION1");
		try {

			TIaxInfo params = this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__);
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, usuario.getCempres(), CEXPORT, params, CIDIOMA,
							batch, CEMAIL, new BigDecimal(0));
			logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
			map.put("LIST_FICHEROS", mapINFORME);
			logger.debug("map:" + map);

			request.setAttribute(Constantes.AJAXCONTAINER, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea011aService - m�todo m_generar_list", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[3];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

	public void m_tunnel_doc(HttpServletRequest request, HttpServletResponse response) {
		logger.debug("Axisrea037Service m_tunnel_doc");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String fileAbsolutePath = this.getCampoTextual(request, "fileAbsolutePath");
			this.tunnelFichero(request, response, fileAbsolutePath);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfis001Service - m�todo m_tunnel_doc", e);
			AbstractDispatchAction.guardarMensaje(request, "1000053", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
