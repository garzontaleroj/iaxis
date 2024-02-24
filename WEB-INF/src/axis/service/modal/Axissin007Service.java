//Revision:# 1rsv6fno5v81oOQJGONIWA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_VALIDACIONES_SIN;
import axis.mvc.control.modal.Axissin007Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin007Service extends AxisBaseService {

	/**
	 * Método que carga los datos de administración del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 * 
	 * 
	 */
	public

			void m_init(HttpServletRequest request, Axissin007Action thisAction) {
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin006Service - método m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	private void cargarListas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		// Datos Tipo tramitacion
		// Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
		// BigDecimal(800));

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
		BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
		BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
		BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
		BigDecimal CTRAMTE = getCampoNumerico(request, "CTRAMTE");
		BigDecimal CESTSIN = getCampoNumerico(request, "CESTSIN");
		BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");
		String CUNITRA = getCampoTextual(request, "CUNITRA");
		String CTRAMITAD = getCampoTextual(request, "CTRAMITAD");
		// 16297
		BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
		// 16297

		Map DETALLE = (Map) formdata.get("DETALLE");

		formdata.put("SPRODUC", SPRODUC);
		formdata.put("SSEGURO", SSEGURO);
		formdata.put("CCAUSIN", CCAUSIN);
		formdata.put("CMOTSIN", CMOTSIN);
		formdata.put("CACTIVI", CACTIVI);
		formdata.put("NRIESGO", NRIESGO);

		request.getSession().setAttribute("indexTramitacio", indexTramitacio);

		String PMODO = getCampoTextual(request, "MOD_TRAM");

		Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_TIPTRAMI(SSEGURO, CACTIVI, CCAUSIN,
				CMOTSIN, SPRODUC, PMODO, CTRAMTE, CESTSIN// OGQ Adicionar para sesgar lista.
				, NSINIES);// 16297
		listValores.put("tipo_tramitacion", (List) tratarRETURNyMENSAJES(request, map));

		// Datos Tipo Danyo
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(815));
		listValores.put("tipo_dano", (List) tratarRETURNyMENSAJES(request, map));

		// Tramitacion informativa
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(326));
		listValores.put("tipo_informativa", (List) tratarRETURNyMENSAJES(request, map));

		// Estado
		// IAXIS 3595 AABC Insert automatico del detalle tramitacion Judicial.
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002016));
		listValores.put("tipo_estado", (List) tratarRETURNyMENSAJES(request, map));

		// Estado persona
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(811));
		listValores.put("tipo_estado_persona", (List) tratarRETURNyMENSAJES(request, map));

		// Tipo documento
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(672));
		listValores.put("tipo_documento", (List) tratarRETURNyMENSAJES(request, map));

		// Tipo matricula
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(290));
		listValores.put("tipo_matricula", (List) tratarRETURNyMENSAJES(request, map));

		// tipo cia
		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_TCOMPANIA();
		listValores.put("tipo_cia", (List) tratarRETURNyMENSAJES(request, map, false));
		////////////////////////////////// Valores
		////////////////////////////////// Autos//////////////////////////////////////

		// Marcas
		BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
		map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMARCAS(CTRAMIT);
		listValores.put("MARCAS", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista tipo vías
		map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTTIPOVIA();
		listValores.put("lstTipoVia", (List) tratarRETURNyMENSAJES(request, map, false));

		BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

		if (isEmpty(getCampoNumerico(request, "CEMPRES"))) {
			BigDecimal index = new BigDecimal(String.valueOf(formdata.get("indexTramitacio")));
			ArrayList tramitacio = ((ArrayList) request.getSession().getAttribute("tramitaciones_min"));
			CEMPRES = (BigDecimal) ((HashMap) tramitacio.get(index.intValue())).get("CEMPRES");
		}

		formdata.put("CEMPRES", CEMPRES);

		// Subestado
		// BUG CONF-513 - 12/01/2017 - OJSO
		PAC_IAX_PARAM pacIaxParam = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map mapResult = pacIaxParam.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("SUBESTADOS_DEP");
		BigDecimal N_SUBESTADOS_DEP = (BigDecimal) tratarRETURNyMENSAJES(request, mapResult);
		if (!isEmpty(N_SUBESTADOS_DEP) && N_SUBESTADOS_DEP.equals(new BigDecimal(1))) {
			BigDecimal TIPOTRAM = (BigDecimal) request.getAttribute("tipo_tram");
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(CEMPRES, new BigDecimal(665),
					TIPOTRAM, new BigDecimal(665));
		} else {
			map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(665));
		}
		// BUG CONF-513 - 12/01/2017 - OJSO
		listValores.put("tipo_subestado", (List) tratarRETURNyMENSAJES(request, map)); // BUG CONF-513 - 12/01/2017 -
																						// OJSO

		if (isEmpty(CUNITRA) && isEmpty(CTRAMITAD)) {

			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAM");
			// 16297
			// BigDecimal NSINIES = getCampoNumerico(request, "NSINIES");
			// 16297
			Map m =
					// bug 0022099 (2) new
					// PAC_IAX_SINIESTROS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_DEFECTO(usuario.getCusuari(),
					// SSEGURO, CCAUSIN, CMOTSIN,NSINIES,NTRAMIT);
					new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR(NSINIES, null, NTRAMIT);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				// bug 0022099 (2)
				// CUNITRA = String.valueOf(m.get("P_CUNITRA"));
				// formdata.put("CUNITRA", CUNITRA);
				// formdata.put("CTRAMITAD", m.get("P_CTRAMITAD"));

				CUNITRA = String.valueOf(m.get("PCUNITRA"));
				formdata.put("CUNITRA", CUNITRA);
				formdata.put("CTRAMITAD", m.get("PCTRAMITAD"));

			}

		}
		String CMARCA = getCampoTextual(request, "CMARCA");

		Map m = new HashMap();
		if (!isEmpty(CMARCA)) {

			m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH_PORMARCA(CMARCA, CTRAMIT);

		} else {
			m = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCTIPVEH();
		}

		request.setAttribute("LSTCTIPVEH", (List) tratarRETURNyMENSAJES(request, m));

		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		String CTIPVEH = this.getHiddenCampoTextual(request, "CTIPVEH");
		if (!isEmpty(CTIPVEH)) {
			Map map2 = new HashMap();
			// Lista Clase vehiculos
			if (!isEmpty(CMARCA)) {
				// Lista Clase vehiculos
				map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH_PORMARCA(CMARCA, CTIPVEH);
			} else {
				// Lista Clase vehiculos
				map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTCLAVEH(CTIPVEH);

			}
			request.setAttribute("LSTCCLAVEH", (List) tratarRETURNyMENSAJES(request, map2));
		}
		String CVERSION = this.getHiddenCampoTextual(request, "CVERSION");
		String f_CVERSION = null;
		BigDecimal f_CMARCA = null;
		String f_cmarca_string = null;

		if (DETALLE != null) {
			f_CVERSION = (String) DETALLE.get("CVERSION");
			if (DETALLE.get("CMARCA") instanceof String) {
				f_CMARCA = new BigDecimal((String) DETALLE.get("CMARCA"));
			} else {
				f_CMARCA = (BigDecimal) DETALLE.get("CMARCA");
			}
			if (f_CMARCA != null) {
				if (f_CMARCA.intValue() < 100) {
					if (f_CMARCA.intValue() < 10) {
						String z = new String();
						z = "00";
						f_cmarca_string = z + f_CMARCA.toString();
					} else {
						String z = new String();
						z = "0";
						f_cmarca_string = z + f_CMARCA.toString();
					}
				} else {
					f_cmarca_string = f_CMARCA.toString();
				}
			}
		}

		if (!isEmpty(CVERSION) || !isEmpty(f_CVERSION)) {
			Map map2 = new HashMap();
			// Lista Clase vehiculos
			if (CVERSION == null) {
				CVERSION = f_CVERSION;
			}
			map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_ANYOS_VERSION(CVERSION, NRIESGO);
			request.setAttribute("LSTANYOS", (List) tratarRETURNyMENSAJES(request, map2));
		}
		if (!isEmpty(f_CMARCA)) {
			Map map2 = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(null, null, f_cmarca_string, CTRAMIT);
			request.setAttribute("MODELOS", (List) tratarRETURNyMENSAJES(request, map2));
		}
		// ini bug 0023536
		// subtipo_tramitacion
		Map map_subtiptra = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTSUBTIPTRA(CEMPRES,
				CTRAMIT);
		List listsubtiptra = (List) tratarRETURNyMENSAJES(request, map_subtiptra);
		listValores.put("subtipo_tramitacion", listsubtiptra);
		if (!isEmpty(listsubtiptra) && listsubtiptra.size() > 0) {
			formdata.put("OCULCSUBTIPTRA", new BigDecimal(0));
		} else {
			formdata.put("OCULCSUBTIPTRA", new BigDecimal(1));
		}
		// fin bug 0023536

		List getCunitraIni = this.dbGetCunitraIni(request, usuario, CEMPRES);
		listValores.put("lstcunitra", (List) getCunitraIni);

		Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);

		listValores.put("lsttramit", (List) tratarRETURNyMENSAJES(request, GectramitadIni, false));

		request.setAttribute("listValores", listValores);

		formdata.put("SPRODUC", SPRODUC);
		formdata.put("CACTIVI", CACTIVI);

		List getResponsabilidadIniReturn = this.dbGetResponsabilidadIni(request, usuario);
		formdata.put("T_IAX_RESPONSABILIDAD", getResponsabilidadIniReturn);

	}

	/**
	 * Método que llama a la función pl correspondiente para cargar las
	 * responsabilidades de una póliza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetResponsabilidadIni(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABILIDASINI();
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * Método que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin007Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.getSession().getAttribute("tramitaciones_min");

			// Si recimbimos en MOD_TRAM tenemos que diferenciar si se protegen o no ciertos
			// campos
			// Si MOD_TRAM==MOD o MOD_TRAM==CONS
			String MOD_TRAM = getCampoTextual(request, "MOD_TRAM");
			if (MOD_TRAM != null) {
				formdata.put("MOD_TRAM", MOD_TRAM);

			} else {
				formdata.put("MOD_TRAM", new String("ALTA"));
			}
			// Dependiendo del NTRAM miramos si se trata de un alta o de una modificacion
			BigDecimal NTRAM = getCampoNumerico(request, "NTRAM");
			if (NTRAM != null) {
				formdata.put("NMOVTRA", NTRAM);
			}
			String NSINIES = getCampoTextual(request, "NSINIES");

			if (NTRAM != null) { // && (NSINIES!=null && !NSINIES.equals(""));
				this.cargarDatosTramitacion(request, thisAction, NSINIES, NTRAM);
			}
			cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_guardar(HttpServletRequest request, Axissin007Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - método m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_guardar_cambios(HttpServletRequest request, Axissin007Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			// Recogemos todos los campos necesarios para el alta /modificacion de la
			// pantalla
			// se utilizarán los que sean necesarios para uno u otro tipo

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO"); /* hidden */
			String NSINIES = getCampoTextual(request, "NSINIES"); /* hidden */
			String CPOLCIA = getCampoTextual(request, "CPOLCIA"); /* persona */

			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAM");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT"); /* persona */
			String DESCTRAMIT = getCampoTextual(request, "DESCTRAMIT"); /* persona */
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			String DESCDIRECCION = getCampoTextual(request, "TLOCALI");

			// Datos cabecera
			BigDecimal CTIPTRA = getCampoNumerico(request, "CTIPTRA");
			BigDecimal CTCAUSIN = getCampoNumerico(request, "CTCAUSIN");
			BigDecimal CINFORM = getCampoNumerico(request, "CINFORM");
			BigDecimal NTRAMTE = getCampoNumerico(request, "NTRAMTE");

			// bug 0023536
			BigDecimal CSUBTIPTRA = getCampoNumerico(request, "CSUBTIPTRA");

			if (CINFORM == null) {
				CINFORM = new BigDecimal(0);
			}
			BigDecimal TCAUSIN = getCampoNumerico(request, "TCAUSIN");
			// Documento
			BigDecimal CTIPIDE = getCampoNumerico(request, "CTIPIDE"); /* persona */
			BigDecimal NNUMIDE = getCampoNumerico(request, "NNUMIDE"); /* persona */
			String NOMBRE = getCampoTextual(request, "NOMBRE"); /* persona */

			BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI"); /* persona */

			if (!isEmpty(CCOMPANI)) {
				if (CCOMPANI.intValue() < 0) {
					CCOMPANI = null;
				}
			}

			String NSINCIA = getCampoTextual(request, "NSINCIA");

			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA"); /* persona */
			BigDecimal IPERIT = getCampoNumerico(request, "IPERIT"); /* persona */
			BigDecimal CESTPER = getCampoNumerico(request, "CESTPER"); /* persona */
			// Direccion
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			String TTIPDIR = getCampoTextual(request, "TTIPDIR");
			BigDecimal CTIPDIR = getCampoNumerico(request, "CTIPDIR");
			String TNOMVIA = getCampoTextual(request, "TNOMVIA");
			BigDecimal NNUMVIA = getCampoNumerico(request, "NNUMVIA");
			BigDecimal CSIGLAS = getCampoNumerico(request, "CSIGLAS");
			String TCOMPLE = getCampoTextual(request, "TCOMPLE");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			String TPAIS = getCampoTextual(request, "TPAIS");
			BigDecimal CPOBLAC = getCampoNumerico(request, "CPOBLAC");
			String TPOBLAC = getCampoTextual(request, "TPOBLAC");
			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			String TPROVIN = getCampoTextual(request, "TPROVIN");
			String CPOSTAL = getCampoTextual(request, "CPOSTAL");
			if (!isEmpty(CPOSTAL))
				CPOSTAL = CPOSTAL.toUpperCase();

			BigDecimal FGISX = getCampoNumerico(request, "FGISX");
			BigDecimal FGISY = getCampoNumerico(request, "FGISY");
			BigDecimal FGISZ = getCampoNumerico(request, "FGISZ");

			// Vehiculo
			Map detalle = new HashMap();

			String CMARCA_s = request.getParameter("CMARCA");
			BigDecimal CMARCA = null;
			if (CMARCA_s != null) {
				try {
					CMARCA = new BigDecimal(CMARCA_s);
					detalle.put("CMARCA", CMARCA);
				} catch (NumberFormatException e) {
					CMARCA = null;
				}
			}

			String CMODELO_s = request.getParameter("CMODELO");
			BigDecimal CMODELO = null;
			if (CMODELO_s != null) {
				try {
					CMODELO = new BigDecimal(CMODELO_s);
					detalle.put("CMODELO", CMODELO);
				} catch (NumberFormatException e) {
					CMODELO = null;
				}
			}

			String CVERSION = request.getParameter("CVERSION");
			if (CVERSION != null)
				detalle.put("CVERSION", CVERSION);

			String TVERSION = request.getParameter("TVERSION");
			if (TVERSION != null)
				detalle.put("TVERSION", TVERSION);

			String NANYO_s = request.getParameter("ANYO");
			BigDecimal NANYO = null;
			if (NANYO_s != null) {
				try {
					NANYO = new BigDecimal(NANYO_s);
					detalle.put("NANYO", NANYO);
				} catch (NumberFormatException e) {
					NANYO = null;
				}
			}

			String CTIPMAT_s = request.getParameter("CTIPMAT");
			BigDecimal CTIPMAT = null;
			if (CTIPMAT_s != null) {
				try {
					CTIPMAT = new BigDecimal(CTIPMAT_s);
					detalle.put("CTIPMAT", CTIPMAT);
				} catch (NumberFormatException e) {
					CTIPMAT = null;
				}
			}

			String CMATRIC = request.getParameter("CMATRIC");
			if (CMATRIC != null)
				detalle.put("CMATRIC", CMATRIC);

			String CODMOTOR = request.getParameter("CODMOTOR");
			if (CODMOTOR != null)
				detalle.put("CODMOTOR", CODMOTOR);

			String CCILINDRAJE_s = request.getParameter("CCILINDRAJE");
			BigDecimal CCILINDRAJE = null;
			if (CCILINDRAJE_s != null) {
				try {
					CCILINDRAJE = new BigDecimal(CCILINDRAJE_s);
					detalle.put("CCILINDRAJE", CCILINDRAJE);
				} catch (NumberFormatException e) {
					CCILINDRAJE = null;
				}
			}
			String CTIPVEH = request.getParameter("CTIPVEH");
			if (CTIPVEH != null)
				detalle.put("CTIPVEH", CTIPVEH);

			String CCHASIS = request.getParameter("CCHASIS");
			if (CCHASIS != null)
				detalle.put("CCHASIS", CCHASIS);

			String NBASTID = request.getParameter("NBASTID");
			if (NBASTID != null)
				detalle.put("NBASTID", NBASTID);

			formdata.put("DETALLE", detalle);

			BigDecimal CALCOHOL = getCampoNumerico(request, "CALCOHOL");
			BigDecimal CTIPCON = getCampoNumerico(request, "CTIPCON");
			BigDecimal CTIPCAR = getCampoNumerico(request, "CTIPCAR");
			Date FCARNET = stringToSqlDate(getCampoTextual(request, "FCARNET")); /* Si */

			// Movimiento
			BigDecimal NMOVTRA = getCampoNumerico(request, "NMOVTRA");
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			String CTRAMITAD = getCampoTextual(request, "CTRAMITAD");
			BigDecimal CESTTRA = getCampoNumerico(request, "CESTTRA");
			String NRADICA = getCampoTextual(request, "NRADICA");
			BigDecimal CSUBTRA = getCampoNumerico(request, "CSUBTRA");
			BigDecimal CCAUEST = getCampoNumerico(request, "CCAUEST"); // bug 0021196
			BigDecimal CCULPAB = getCampoNumerico(request, "CCULPAB");
			java.sql.Date FESTTRA = this.stringToSqlDate(getCampoTextual(request, "FESTRA"));

			request.setAttribute("tipo_tram", CTIPTRA);

			if (isEmpty(FESTTRA))
				FESTTRA = new java.sql.Date(new java.util.Date().getTime());

			// bug 0023536
			BigDecimal IRECLAM = getCampoNumerico(request, "IRECLAM");
			BigDecimal IINDEMN = getCampoNumerico(request, "IINDEMN");
			if (CTRAMIT.equals(new BigDecimal(20)) || CTRAMIT.equals(new BigDecimal(21))) {
				CTCAUSIN = new BigDecimal(0);
			}
			/* Validamos los datos */
			Map map3 = new PAC_IAX_VALIDACIONES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES_SIN__F_TRASINI(CTIPTRA, CTCAUSIN, CINFORM, null, SPERSON,
							isEmpty(CMARCA) ? null : CMARCA.toString(), isEmpty(CMODELO) ? null : CMODELO.toString(),
							TNOMVIA, CSIGLAS, CPOBLAC, CPROVIN, CPAIS, DESCDIRECCION, CCOMPANI, CPOLCIA);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map3)).intValue() == 0) {
				/* Grabamos el cuerpo */
				Map map1 = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMITACION(NSINIES, NTRAMIT, CTRAMIT, CTCAUSIN,
								CINFORM, CTIPTRA, CCULPAB, CCOMPANI, CPOLCIA, IPERIT, NSINCIA, NTRAMTE, CSUBTIPTRA,
								NRADICA);

				BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map1);

				if (resultado.intValue() == 0) {

					NTRAMIT = (BigDecimal) map1.get("PNTRAMITOUT");
					formdata.put("indexTramitacio", NTRAMIT);

					/* Grabamos el detalle de la tramitacion */
					Map map = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINTRAMIDETALLE(SSEGURO, NSINIES, NTRAMIT, CTRAMIT,
									CTIPTRA,

									DESCTRAMIT, SPERSON, CESTPER, DESCDIRECCION, CDOMICI, CPOSTAL, CPROVIN, CPOBLAC,
									CPAIS, CTIPDIR, CSIGLAS, TNOMVIA, NNUMVIA, TCOMPLE, null, FGISX, FGISY, FGISZ, null,
									CTIPCON, CTIPCAR, FCARNET, CALCOHOL, CTIPMAT, CMATRIC, CMARCA, CMODELO, CVERSION,
									NANYO, CCHASIS, CODMOTOR, NBASTID, CCILINDRAJE, IRECLAM, IINDEMN);

					if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
						request.setAttribute("OK", "OK"); // OK No ha habido error

						/* Grabamos el movimiento de la tramitacion */
						// bug 0021196 afegir CCAUEST
						Map map2 = new PAC_IAX_SINIESTROS(
								(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJETO_SINMOVTRAMIT(NSINIES, NTRAMIT, NMOVTRA,
										CUNITRA, CTRAMITAD + "", CESTTRA, CSUBTRA, FESTTRA, CCAUEST, null);

						if (((BigDecimal) tratarRETURNyMENSAJES(request, map2)).intValue() == 0) {
							request.setAttribute("OK", "OK"); // OK No ha habido error
							// SE HA GRABADO CORRECTAMENTE
							request.removeAttribute("box_error");

						} else {
							request.setAttribute("OK", "KO"); // ERROR
							// ponemos los datos si existen en sesion
							Map mapa_box = (Map) request.getSession().getAttribute("box_error");
							if (mapa_box != null) {
								formdata.putAll(mapa_box);

							}
						}

					} else {
						request.setAttribute("OK", "KO"); // ERROR

						// ponemos los datos si existen en sesion
						Map mapa_box = (Map) request.getSession().getAttribute("box_error");
						if (mapa_box != null) {
							formdata.putAll(mapa_box);

						}
					}

				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_guardar_cambios", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_cargar_seccion(HttpServletRequest request, Axissin007Action thisAction) {
		try {

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");
			request.getSession().setAttribute("indexTramitacio", indexTramitacio);

			BigDecimal CTCAUSIN = getCampoNumerico(request, "CTCAUSIN");
			BigDecimal CTIPTRA = getCampoNumerico(request, "CTIPTRA");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT"); // SECCION DE LA PANTALLA

			// TODO:Quitar cuando se recuperen todos del __formdata.
			BigDecimal indexTramitacion = (BigDecimal) request.getSession().getAttribute("indexTramitacion");
			if (indexTramitacion == null) {
				indexTramitacion = new BigDecimal(0);
			}

			request.setAttribute("tipo_tram", CTIPTRA);
			formdata.put("SPRODUC", SPRODUC);
			formdata.put("CTIPTRA", CTIPTRA);
			formdata.put("CACTIVI", CACTIVI);
			formdata.put("CTRAMIT", CTRAMIT);
			formdata.put("CTCAUSIN", CTCAUSIN);

			if (CTIPTRA.equals(new BigDecimal(1))) {
				BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
				BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

				Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SINIESTROS__F_GET_VEHICULO_ASEGURADO(SSEGURO, NRIESGO);
				List l = (List) tratarRETURNyMENSAJES(request, m);
				Map datosVehiculo = (Map) l.get(0);
				Map detalle = new HashMap();

				if (datosVehiculo.get("TVERSION") != null) {
					detalle.put("TVERSION", (String) datosVehiculo.get("TVERSION"));
				}
				if (datosVehiculo.get("CODMOTOR") != null) {
					detalle.put("CODMOTOR", (String) datosVehiculo.get("CODMOTOR"));
				}
				if (datosVehiculo.get("ANYO") != null) {
					detalle.put("NANYO", (BigDecimal) datosVehiculo.get("ANYO"));
				}
				if (datosVehiculo.get("CCILINDRAJE") != null) {
					if (datosVehiculo.get("CCILINDRAJE") instanceof BigDecimal) {
						detalle.put("CCILINDRAJE", (BigDecimal) datosVehiculo.get("CCILINDRAJE"));
					} else {
						detalle.put("CCILINDRAJE", (String) datosVehiculo.get("CCILINDRAJE"));
					}
				}
				if (datosVehiculo.get("CTIPMAT") != null) {
					detalle.put("CTIPMAT", (BigDecimal) datosVehiculo.get("CTIPMAT"));
				}
				if (datosVehiculo.get("CMATRIC") != null) {
					detalle.put("CMATRIC", (String) datosVehiculo.get("CMATRIC"));
				}
				if (datosVehiculo.get("CMODELO") != null) {
					detalle.put("CMODELO", (String) datosVehiculo.get("CMODELO"));
				}
				if (datosVehiculo.get("CTIPVEH") != null) {
					detalle.put("CTIPVEH", (String) datosVehiculo.get("CTIPVEH"));
				}
				if (datosVehiculo.get("CMARCA") != null) {
					detalle.put("CMARCA", (String) datosVehiculo.get("CMARCA"));
				}
				if (datosVehiculo.get("CCHASIS") != null) {
					detalle.put("CCHASIS", (String) datosVehiculo.get("CCHASIS"));
				}
				if (datosVehiculo.get("TRIESGO") != null) {
					detalle.put("TRIESGO", (String) datosVehiculo.get("TRIESGO"));
				}
				if (datosVehiculo.get("CVERSION") != null) {
					detalle.put("CVERSION", (String) datosVehiculo.get("CVERSION"));
				}
				if (datosVehiculo.get("NBASTID") != null) {
					detalle.put("NBASTID", (String) datosVehiculo.get("NBASTID"));
				}
				formdata.put("DETALLE", detalle);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_cargar_seccion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * MÉTODOS AJAX
	 *******************************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 **/
	public

			void m_ajax_cargar_modelos(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CMARCA = getCampoTextual(request, "CMARCA");

			// Modelos
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			Map map = pac_axis_listValores_AUT.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTMODELOS(null, null, CMARCA,
					CTRAMIT);
			List modelos = (List) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(modelos) && modelos.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) modelos);
				request.getSession().setAttribute("axisadm_listaModelos", modelos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_ajax_cargar_modelos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * 
	 * @param request
	 **/
	public

			void m_ajax_obtener_version(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String CVERSION = getCampoTextual(request, "CVERSION");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			Map map = pac_axis_listValores_AUT.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(CVERSION,
					new BigDecimal(0), CTRAMIT);
			List modelos = (List) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(modelos) && modelos.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) modelos);
				request.getSession().setAttribute("axisadm_listaModelos", modelos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_ajax_cargar_modelos", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_cargar_versiones(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			String MARCA = getCampoTextual(request, "CMARCA");
			String MODELO = getCampoTextual(request, "CMODELO");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");
			// TODO: Desascteriscar
			// Modelos
			Map map = pac_axis_listValores_AUT.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_LSTVERSIONES(MARCA, MODELO, null,
					null, null, null, null, CTRAMIT); // num puertas //motor
			List versiones = (List) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(versiones) && versiones.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) versiones);
				request.getSession().setAttribute("axisadm_listaAsientos", versiones);
			}
			// TODO: Desascteriscar

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_ajax_cargar_versiones", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void cargarDatosTramitacion(HttpServletRequest request, Axissin007Action thisAction, String NSINIES,
			BigDecimal NTRAMIT) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap MOVIMIENTOS = new HashMap();
		try {

			/* Obtiene los valores del ultimo movimiento */
			PAC_IAX_SINIESTROS pac_axis_tram = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_mov = pac_axis_tram.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_ULT_SINMOVTRAMIT(NSINIES, NTRAMIT);
			Map map_mov_resultado = (Map) tratarRETURNyMENSAJES(request, map_mov);

			if (map_mov_resultado != null) {
				request.setAttribute("CTRAMITAD", map_mov_resultado.get("CTRAMITAD"));
				formdata.put("CTRAMITAD", map_mov_resultado.get("CTRAMITAD"));
				request.setAttribute("CUNITRA", map_mov_resultado.get("CUNITRA"));
				formdata.put("CUNITRA", map_mov_resultado.get("CUNITRA"));
				MOVIMIENTOS.put("MOVIMIENTO", map_mov_resultado);
				formdata.putAll(MOVIMIENTOS);
			}

			/* Obtiene los valores de la tramitacion */
			pac_axis_tram = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_tram.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJETO_SINTRAMITACION(NSINIES, NTRAMIT);

			Map campos = (Map) tratarRETURNyMENSAJES(request, map);
			// BigDecimal CTRAMIT = (BigDecimal)campos.get("CTRAMIT");
			// request.getSession().setAttribute("");
			if (campos != null) {

				BigDecimal recargar = (BigDecimal) request.getAttribute("REC");

				if (recargar == null) {
					Map detalle = (Map) campos.get("DETALLE");

					if (!isEmpty(detalle)) {

						formdata.put("DETALLE", detalle);

						if (!isEmpty(detalle.get("CVERSION"))) {
							Map mapv = new PAC_IAX_LISTVALORES_AUT(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION((String) detalle.get("CVERSION"),
											new BigDecimal(0), (BigDecimal) campos.get("CTRAMIT"));
							String CTIPVEH = null;
							if (!isEmpty(mapv)) {
								List ret = (List) mapv.get("RETURN");
								Map det = (Map) ret.get(0);
								CTIPVEH = (String) det.get("CTIPVEH");
								formdata.put("CTIPVEH", CTIPVEH);
							}
						}
						if (!isEmpty(detalle.get("DIRECCION"))) {
							Map dir = (Map) detalle.get("DIRECCION");
							// Map d = (Map)dir.get(0);
							formdata.put("DIRECCION", dir);
						}

						if (!isEmpty(detalle.get("PERSONA"))) {
							Map per = (Map) detalle.get("PERSONA");
							// Map d = (Map)dir.get(0);
							formdata.put("PERSONA", per);
						}
					}
				}

				// formdata.putAll(campos);
				formdata.put("OB_IAX_SIN_TRAMITACION", campos);
				request.setAttribute("tipo_tram", campos.get("CTIPTRA"));

				// bug 23536
				request.setAttribute("CTRAMIT", campos.get("CTRAMIT"));
				formdata.put("CTRAMIT", campos.get("CTRAMIT"));

			}
			// guardamos estos datos por si existe error al modificicarlos
			request.getSession().setAttribute("box_error", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método cargarDatosTramitacion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_ajax_actualiza_persona(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");

			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				if (!isEmpty(map.get("OBPERSONA"))) {
					Map OB_PERSONA = (Map) map.get("OBPERSONA");
					if (!isEmpty(OB_PERSONA.get("CCC"))) {
						List<Map> ccc = (List) OB_PERSONA.get("CCC");
						Map hMccc = (Map) ccc.get(ccc.size() - 1);

						ArrayList comptes = new ArrayList();
						for (Map hm : ccc) {

							Map p = (Map) hm.get("OB_IAX_CCC");
							comptes.add(p);
						}

						Set<Map.Entry> set = hMccc.entrySet();

						Iterator it = hMccc.entrySet().iterator();
						while (it.hasNext()) {
							Map.Entry e = (Map.Entry) it.next();
						}

						map.put("COMPTES", comptes);
					}
					ajax.rellenarPlAContenedorAjax(map);

					ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método m_ajax_actualiza_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * Funcion que recupera la versión
	 * 
	 * @param request El HttpServletRequest que contiene la petición del cliente
	 *                web.
	 */
	public void m_ajax_recuperar_version(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {
			String CVERSION = getCampoTextual(request, "CVERSION");
			BigDecimal CTRAMIT = getCampoNumerico(request, "CTRAMIT");

			if (!isEmpty(CVERSION)) {
				Map map = new PAC_IAX_LISTVALORES_AUT((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES_AUT__F_GET_VERSION(CVERSION, new BigDecimal(0), CTRAMIT);
				if (!isEmpty(map)) {
					List version = (List) (List) ajax.rellenarPlAContenedorAjax(map);
					ajax.guardarContenidoFinalAContenedorAjax(version);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr148Service - método m_ajax_recuperar_version", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/* FUNCION PARA BORRAR UNA CABECERA DE TRAMITACION */

	public void deleteTramitacion(HttpServletRequest request, Axissin007Action thisAction, String NSINIES,
			BigDecimal NTRAMIT, BigDecimal CTIPTRA) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_tram = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_axis_tram.ejecutaPAC_IAX_SINIESTROS__F_DEL_OBJETO_SINTRAMITACION(NSINIES, NTRAMIT, CTIPTRA);

			Map campos = (Map) tratarRETURNyMENSAJES(request, map);

			if (campos != null) {
				formdata.putAll(campos);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - método cargarDatosTramitacion", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	/**
	 * Método que llama a la función pl correspondiente para cargar los motivos
	 * (según la causa seleccionada) de una póliza seleccionada.
	 * 
	 * @param usuario
	 * @param pcempres
	 * @param pctramitpad
	 * @return
	 * @throws Exception
	 */
	private

			Map dbGectramitadIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES,
					String CTRAMITPAD) throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CTRAMITAD(CCEMPRES, CTRAMITPAD);
		return m;
	}

	/**
	 * Método que llama a la función pl correspondiente para cargar las unidades de
	 * tramitacion.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCunitraIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCEMPRES)
			throws Exception {
		Map m = new PAC_IAX_LISTVALORES_SIN((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_CUNITRA(CCEMPRES);
		return (List) tratarRETURNyMENSAJES(request, m);

	}

	/**
	 * Método que se llama al seleccionar una unidad de tramitacion de la lista. Con
	 * ello se pretende carga una lista de tramitadores.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_cunitra(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			String CUNITRA = getCampoTextual(request, "CUNITRA");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			if (!isEmpty(CUNITRA)) {
				Map GectramitadIni = this.dbGectramitadIni(request, usuario, CEMPRES, CUNITRA);
				List tramitadIni = (List) ajax.rellenarPlAContenedorAjax(GectramitadIni);
				ajax.guardarContenidoFinalAContenedorAjax((List) tramitadIni);
			}
		} catch (Exception e) {
			logger.error("axissin007Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// BUG CONF-513 - 12/01/2017 - OJSO
	public void m_ajax_cargar_subestados(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map listValores = new HashMap();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		try {
			PAC_IAX_PARAM pacIaxParam = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mapResult = pacIaxParam.ejecutaPAC_IAX_PARAM__F_PARINSTALACION_NN("SUBESTADOS_DEP");
			BigDecimal N_SUBESTADOS_DEP = (BigDecimal) tratarRETURNyMENSAJES(request, mapResult);
			if (!isEmpty(N_SUBESTADOS_DEP) && N_SUBESTADOS_DEP.equals(new BigDecimal(1))) {
				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
				BigDecimal CTIPTRA = getCampoNumerico(request, "CTIPTRA");

				Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(CEMPRES,
						new BigDecimal(665), CTIPTRA, new BigDecimal(665));
				List listaSubestados = (List) ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax((List) listaSubestados);
			}
		} catch (Exception e) {
			logger.error("axissin007Service m_ajax_cargar_subestados - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
	// BUG CONF-513 - 12/01/2017 - OJSO

	public void m_datossitriesgo(HttpServletRequest request, Axissin007Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal psseguro = getCampoNumerico(request, "SSEGURO");
			BigDecimal pnriesgo = getCampoNumerico(request, "NRIESGO");

			Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_GET_DATSITRIESGO(psseguro, pnriesgo);

			ArrayList s = (ArrayList) tratarRETURNyMENSAJES(request, m);
			if (!isEmpty(s)) {
				request.setAttribute("REC", new BigDecimal(1));
				formdata.put("DIRECCION", s.get(0));
			}
			request.setAttribute("tipo_tram", new BigDecimal(5));

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - método m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_get_vehiculo_asegurado(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_SINIESTROS__F_GET_VEHICULO_ASEGURADO(SSEGURO, NRIESGO);
			List datos = (List) ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax((List) datos);
		} catch (Exception e) {
			logger.error("axissin007Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}
}
