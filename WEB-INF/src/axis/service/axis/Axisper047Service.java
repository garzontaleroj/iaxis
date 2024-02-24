//Revision:# mRPpcB6DRHxsZLn8iS9H6w== #
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

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisper047Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	Boolean persona_natural = false;
// INI	CP0416M_SYS_PERS  18/12/2018
	String razon_social = "";
	String nit = "";
	String primer_apellido = "";
	String segundo_apellido = "";
	String nombres = "";
	BigDecimal tipo_documento = new BigDecimal(0);
	String documento = "";
	java.sql.Date f_nacimiento; // CP0416M_SYS_PERS 26/12/2018
	java.sql.Date f_expedicion; // CP0416M_SYS_PERS 26/12/2018
	BigDecimal pais_expedicion = new BigDecimal(0);
	String tpais_expedicion = "";
	BigDecimal pais_nacimiento = new BigDecimal(0);
	String tpais_nacimiento = "";
	BigDecimal dep_expedicion = new BigDecimal(0);
	String tdep_expedicion = "";
	BigDecimal dep_nacimiento = new BigDecimal(0);
	String tdep_nacimiento = "";
	BigDecimal lug_expedicion = new BigDecimal(0);
	String tlug_expedicion = "";
	BigDecimal lug_nacimiento = new BigDecimal(0);
	String tlug_nacimiento = "";
	BigDecimal pais_nacionalidad1 = new BigDecimal(0);
	String tpais_nacionalidad1 = "";
	BigDecimal pais_nacionalidad2 = new BigDecimal(0);
	String tpais_nacionalidad2 = "";
	BigDecimal pais_residencia = new BigDecimal(0);
	String tpais_residencia = "";
	BigDecimal dep_residencia = new BigDecimal(0);
	String tdep_residencia = "";
	BigDecimal lug_residencia = new BigDecimal(0);
	String tlug_residencia = "";
	String direccion = "";
	String email = "";
	String email_jur = "";
	String telefono = "";
	String celular = "";
	String direccion_jur = "";
	BigDecimal pais_oficina = new BigDecimal(0);
	String tpais_oficina = "";
	BigDecimal dep_oficina = new BigDecimal(0);
	String tdep_oficina = "";
	BigDecimal lug_oficina = new BigDecimal(0);
	String tlug_oficina = "";
	String telefono_ofic = "";
	String fax_oficina = "";
	// FIN CP0416M_SYS_PERS 18/12/2018
	// Ini TCS_1560 - ACL - 11/02/2019
	BigDecimal codciiu = new BigDecimal(0);
	String descriciiu = "";
	String descriciiu_jur = "";
	String ocupacion = "";
	BigDecimal codciiu_jur = new BigDecimal(0);
	BigDecimal SSARLAFT = new BigDecimal(0);
	// Fin TCS_1560 - ACL - 11/02/2019

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisper047Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisper047Service m_form");
		// IAXIS-4854 SE GUARDA EL MODO DE INGRESO AL MODULO DE PERSONAS
		String modoAct = AbstractDispatchAction.topPila(request, "CMODO").toString();
		AbstractDispatchAction.topPila(request, "CMODO", getCampoTextual(request, "ACTIONMOD"));
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map PERSONA = (Map) request.getSession().getAttribute("PERSONA_SARLAFT");
			request.setAttribute("PERSONA", PERSONA);
			Map listValores = new HashMap();
			Map mapTiposRelacion = new HashMap();
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			if (PERSONA.get("DESCIDENT") != null
					&& PERSONA.get("DESCIDENT").toString().toUpperCase().equals("NATURAL")) {

				Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800087));
				logger.debug(map);
				request.getSession().setAttribute("lstActividadPrincipal", (List) tratarRETURNyMENSAJES(request, map));
				request.getSession().setAttribute("lstActividadSecundaria", (List) tratarRETURNyMENSAJES(request, map));
				formdata.put("PERSONANATURAL", true);
				persona_natural = true;

				mapTiposRelacion = pac_axis_listValores
						.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(790000));

			} else {
				Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002015));
				logger.debug(map);
				request.getSession().setAttribute("lstTipoEmpresa", (List) tratarRETURNyMENSAJES(request, map));
				formdata.put("PERSONANATURAL", false);
				persona_natural = false;

				mapTiposRelacion = pac_axis_listValores
						.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002025));

			}

			List tiposRelacion = (List) tratarRETURNyMENSAJES(request, mapTiposRelacion);
			request.getSession().setAttribute("ls_tipos_relacion",
					!isEmpty(tiposRelacion) ? tiposRelacion : new ArrayList());

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSARLAFT = getCampoNumerico(request, "SSARLAFT");
			String ACTIONMOD = getCampoTextual(request, "ACTIONMOD");
			Date FRADICA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRADICA"), "dd/MM/yyyy");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(828));
			List LS_SI_O_NO = (List) tratarRETURNyMENSAJES(request, mapLs);
			request.getSession().setAttribute("LS_VALORES", !isEmpty(LS_SI_O_NO) ? LS_SI_O_NO : new ArrayList());

			Map lsDocs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			logger.debug(lsDocs);
			request.getSession().setAttribute("LS_TIPOS_DOCUMENTOS", (List) tratarRETURNyMENSAJES(request, lsDocs));

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(null, null, null);
			List plListaProductos = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("axisctr_listaProductos", plListaProductos);

			map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, null);
			List axisctr_listaRamos = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("axisctr_listaRamos", axisctr_listaRamos);

			Map mapa5 = new PAC_IAX_OPERATIVA_FINV((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
			List listaMonedas = (List) tratarRETURNyMENSAJES(request, mapa5, false);
			request.getSession().setAttribute("listaMonedas", listaMonedas);

			Map mapa6 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002014));
			List listaTransacciones = (List) tratarRETURNyMENSAJES(request, mapa6, false);
			request.getSession().setAttribute("listaTransacciones", listaTransacciones);

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPDOCUM_TIPPER(null);
			logger.debug(map);
			request.getSession().setAttribute("ls_identificaciones", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("SPERSON", SPERSON);
			formdata.put("SSARLAFT", SSARLAFT);
			formdata.put("ACTIONMOD", ACTIONMOD);

			Map mapTiposSolicitud = pac_iax_listvalores
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(790001));
			List tiposSolicitud = (List) tratarRETURNyMENSAJES(request, mapTiposSolicitud);
			request.getSession().setAttribute("LS_VALORES_TIPOSOL",
					!isEmpty(tiposSolicitud) ? tiposSolicitud : new ArrayList());

			Map mapResultadoSini = pac_iax_listvalores
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002021));
			List resultadoSini = (List) tratarRETURNyMENSAJES(request, mapResultadoSini);
			request.getSession().setAttribute("LS_VALORES_RESSINI",
					!isEmpty(resultadoSini) ? resultadoSini : new ArrayList());

			Map mapResultadoEntrevista = pac_iax_listvalores
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(790005));
			List resultadoEntrevista = (List) tratarRETURNyMENSAJES(request, mapResultadoEntrevista);
			request.getSession().setAttribute("LS_RESULTADO_ENTREVISTA",
					!isEmpty(resultadoEntrevista) ? resultadoEntrevista : new ArrayList());

			Map mapEstadoConfirmacion = pac_iax_listvalores
					.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(790003));
			List estadoConfirmacion = (List) tratarRETURNyMENSAJES(request, mapEstadoConfirmacion);
			request.getSession().setAttribute("LS_ESTADO_CONFIRMACION",
					!isEmpty(estadoConfirmacion) ? estadoConfirmacion : new ArrayList());

			Map mapRutaFCC = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(790004));
			List rutaFCC = (List) tratarRETURNyMENSAJES(request, mapRutaFCC);
			request.getSession().setAttribute("LS_RUTA_FCC", !isEmpty(rutaFCC) ? rutaFCC : new ArrayList());

			Map mapSector = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(790002));
			List sector = (List) tratarRETURNyMENSAJES(request, mapSector);
			request.getSession().setAttribute("lstSector", !isEmpty(sector) ? sector : new ArrayList());

			Map mapPaises = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
			List paises = (List) tratarRETURNyMENSAJES(request, mapPaises);
			request.getSession().setAttribute("LS_PAIS", !isEmpty(paises) ? paises : new ArrayList());

			// INI CP0838M_SYS_PERS 28/12/2018 AP
			PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());

			if (!isEmpty(usuario.getCagente())) {
				BigDecimal tipAgente = new BigDecimal(2);
				Map maplistaTipoAgentesSuc = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(
						usuario.getCempres(), d, null, null, tipAgente, BigDecimal.ONE, null, null, null, null, null,
						null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

				tipAgente = new BigDecimal(3);

				Map maplistaTipoAgentesAg = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(
						usuario.getCempres(), d, null, null, tipAgente, BigDecimal.ONE, null, null, null, null, null,
						null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

				List listaTipoAgentes = (List) tratarRETURNyMENSAJES(request, maplistaTipoAgentesSuc);
				List listaTipoAgentesAg = (List) tratarRETURNyMENSAJES(request, maplistaTipoAgentesAg);
				listaTipoAgentes.addAll(listaTipoAgentesAg);

				request.getSession().setAttribute("LS_TipoAgentes",
						!isEmpty(listaTipoAgentes) ? listaTipoAgentes : new ArrayList());
				logger.error("maplistaTipoAgentes" + maplistaTipoAgentesAg + " listaTipoAgentes " + listaTipoAgentesAg);

			}
			// FIN CP0838M_SYS_PERS 28/12/2018 AP

			// INI CP0416M_SYS_PERS 18/12/2018

			if (SSARLAFT == null) { // SI NO HAY DATOS CARGADOS
				Map mapSarlaft1 = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_SARLAF(SPERSON); // CAMBIAR
																											// FUNCION X
																											// LA NUEVA
																											// CONSULTA
				List<Map> listaarlaft1 = (List) tratarRETURNyMENSAJES(request, mapSarlaft1);

				Map DET_SARLAFT1 = null;
				if (listaarlaft1 != null) {
					for (Map miop1 : listaarlaft1) {
						DET_SARLAFT1 = miop1;
					}
					SSARLAFT = (DET_SARLAFT1.get("PER_SSARLAFT") == null ? new BigDecimal(0)
							: (BigDecimal) DET_SARLAFT1.get("PER_SSARLAFT"));
					// Ini TCS_1560 - ACL - 11/02/2019 - Se agrega campos codciiu, descriciiu,
					// ocupacion, codciiu_jur
					if (persona_natural) {
						primer_apellido = (DET_SARLAFT1.get("PER_PAPELLIDO") == null ? ""
								: (String) DET_SARLAFT1.get("PER_PAPELLIDO"));
						segundo_apellido = (DET_SARLAFT1.get("PER_SAPELLIDO") == null ? ""
								: (String) DET_SARLAFT1.get("PER_SAPELLIDO"));
						nombres = (DET_SARLAFT1.get("PER_NOMBRES") == null ? ""
								: (String) DET_SARLAFT1.get("PER_NOMBRES"));
						tipo_documento = (DET_SARLAFT1.get("PER_TIPDOCUMENT") == null ? new BigDecimal(1000)
								: (BigDecimal) DET_SARLAFT1.get("PER_TIPDOCUMENT"));
						documento = (DET_SARLAFT1.get("PER_DOCUMENT") == null ? ""
								: (String) DET_SARLAFT1.get("PER_DOCUMENT"));
						f_nacimiento = (DET_SARLAFT1.get("PER_FNACIMI") == null ? null
								: stringToSqlDate(DET_SARLAFT1.get("PER_FNACIMI").toString())); // CP0416M_SYS_PERS
																								// 26/12/2018
						f_expedicion = (DET_SARLAFT1.get("PER_FEXPEDICION") == null ? null
								: stringToSqlDate(DET_SARLAFT1.get("PER_FEXPEDICION").toString())); // CP0416M_SYS_PERS
																									// 26/12/2018
						pais_expedicion = (DET_SARLAFT1.get("PER_PAISEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_PAISEXPEDICION"));
						tpais_expedicion = (DET_SARLAFT1.get("PER_TPAISEXPEDICION") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TPAISEXPEDICION"));
						pais_nacimiento = (DET_SARLAFT1.get("PER_PAISLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_PAISLUGNACIMI"));
						tpais_nacimiento = (DET_SARLAFT1.get("PER_TPAISLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TPAISLUGNACIMI"));
						dep_expedicion = (DET_SARLAFT1.get("PER_DEPEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_DEPEXPEDICION"));
						tdep_expedicion = (DET_SARLAFT1.get("PER_TDEPEXPEDICION") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TDEPEXPEDICION"));
						dep_nacimiento = (DET_SARLAFT1.get("PER_DEPLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_DEPLUGNACIMI"));
						tdep_nacimiento = (DET_SARLAFT1.get("PER_TDEPLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TDEPLUGNACIMI"));
						lug_expedicion = (DET_SARLAFT1.get("PER_LUGEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_LUGEXPEDICION"));
						tlug_expedicion = (DET_SARLAFT1.get("PER_TLUGEXPEDICION") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TLUGEXPEDICION"));
						lug_nacimiento = (DET_SARLAFT1.get("PER_LUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_LUGNACIMI"));
						tlug_nacimiento = (DET_SARLAFT1.get("PER_TLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TLUGNACIMI"));
						pais_nacionalidad1 = (DET_SARLAFT1.get("PER_NACION1") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_NACION1"));
						tpais_nacionalidad1 = (DET_SARLAFT1.get("PER_TNACION1") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TNACION1"));
						pais_nacionalidad2 = (DET_SARLAFT1.get("PER_NACION2") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_NACION2"));
						tpais_nacionalidad2 = (DET_SARLAFT1.get("PER_TNACION2") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TNACION2"));
						pais_residencia = (DET_SARLAFT1.get("PER_PAIS") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_PAIS"));
						tpais_residencia = (DET_SARLAFT1.get("PER_TPAIS") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TPAIS"));
						dep_residencia = (DET_SARLAFT1.get("PER_DEPARTAMENT") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_DEPARTAMENT"));
						tdep_residencia = (DET_SARLAFT1.get("PER_TDEPARTAMENT") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TDEPARTAMENT"));
						lug_residencia = (DET_SARLAFT1.get("PER_CIUDAD") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("PER_CIUDAD"));
						tlug_residencia = (DET_SARLAFT1.get("PER_TCIUDAD") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TCIUDAD"));
						direccion = (DET_SARLAFT1.get("PER_DIRERECI") == null ? ""
								: (String) DET_SARLAFT1.get("PER_DIRERECI"));
						email = (DET_SARLAFT1.get("PER_EMAIL") == null ? "" : (String) DET_SARLAFT1.get("PER_EMAIL"));
						telefono = (DET_SARLAFT1.get("PER_TELEFONO") == null ? ""
								: (String) DET_SARLAFT1.get("PER_TELEFONO"));
						celular = (DET_SARLAFT1.get("PER_CELULAR") == null ? ""
								: (String) DET_SARLAFT1.get("PER_CELULAR"));
						codciiu = (DET_SARLAFT1.get("NCIIUPPAL") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("NCIIUPPAL"));
						descriciiu = (DET_SARLAFT1.get("TCCIIUPPAL") == null ? ""
								: (String) DET_SARLAFT1.get("TCCIIUPPAL"));
						ocupacion = (DET_SARLAFT1.get("TOCUPACION") == null ? ""
								: (String) DET_SARLAFT1.get("TOCUPACION"));

					} else {
						razon_social = (DET_SARLAFT1.get("NRAZONSO") == null ? ""
								: (String) DET_SARLAFT1.get("NRAZONSO"));
						nit = (DET_SARLAFT1.get("TNIT") == null ? "" : (String) DET_SARLAFT1.get("TNIT"));
						direccion_jur = (DET_SARLAFT1.get("TOFICINAPRI") == null ? ""
								: (String) DET_SARLAFT1.get("TOFICINAPRI"));
						pais_oficina = (DET_SARLAFT1.get("TPAIS") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("TPAIS"));
						tpais_oficina = (DET_SARLAFT1.get("EMPTPAIS") == null ? ""
								: (String) DET_SARLAFT1.get("EMPTPAIS"));
						dep_oficina = (DET_SARLAFT1.get("TDEPATAMENTO") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("TDEPATAMENTO"));
						tdep_oficina = (DET_SARLAFT1.get("EMPTDEPATAMENTO") == null ? ""
								: (String) DET_SARLAFT1.get("EMPTDEPATAMENTO"));
						lug_oficina = (DET_SARLAFT1.get("TCIUDAD") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("TCIUDAD"));
						tlug_oficina = (DET_SARLAFT1.get("EMPTCIUDAD") == null ? ""
								: (String) DET_SARLAFT1.get("EMPTCIUDAD"));
						telefono_ofic = (DET_SARLAFT1.get("TTELEFONO") == null ? ""
								: (String) DET_SARLAFT1.get("TTELEFONO"));
						fax_oficina = (DET_SARLAFT1.get("TFAX") == null ? "" : (String) DET_SARLAFT1.get("TFAX"));
						codciiu_jur = (DET_SARLAFT1.get("CCIIU") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("CCIIU")); // TCS_1560 - ACL - 11/02/2019
						descriciiu_jur = (DET_SARLAFT1.get("TCCIIUPPAL") == null ? ""
								: (String) DET_SARLAFT1.get("TCCIIUPPAL"));
						email_jur = (DET_SARLAFT1.get("TMAILJURID") == null ? ""
								: (String) DET_SARLAFT1.get("TMAILJURID"));
						// Representante legal
						primer_apellido = (DET_SARLAFT1.get("TREPRESENTANLE") == null ? ""
								: (String) DET_SARLAFT1.get("TREPRESENTANLE"));
						segundo_apellido = (DET_SARLAFT1.get("TSEGAPE") == null ? ""
								: (String) DET_SARLAFT1.get("TSEGAPE"));
						nombres = (DET_SARLAFT1.get("TNOMBRES") == null ? "" : (String) DET_SARLAFT1.get("TNOMBRES"));
						tipo_documento = (DET_SARLAFT1.get("NTIPDOC") == null ? new BigDecimal(1000)
								: (BigDecimal) DET_SARLAFT1.get("NTIPDOC"));
						documento = (DET_SARLAFT1.get("TNUMDOC") == null ? "" : (String) DET_SARLAFT1.get("TNUMDOC"));
						f_expedicion = (DET_SARLAFT1.get("RL_FEXPEDICION") == null ? null
								: stringToSqlDate(DET_SARLAFT1.get("RL_FEXPEDICION").toString()));
						f_nacimiento = (DET_SARLAFT1.get("RL_FNACIMIENTO") == null ? null
								: stringToSqlDate(DET_SARLAFT1.get("RL_FNACIMIENTO").toString()));
						pais_expedicion = (DET_SARLAFT1.get("RL_PAISEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_PAISEXPEDICION"));
						tpais_expedicion = (DET_SARLAFT1.get("RL_TPAISEXPEDICION") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TPAISEXPEDICION"));
						pais_nacimiento = (DET_SARLAFT1.get("RL_PAISLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_PAISLUGNACIMI"));
						tpais_nacimiento = (DET_SARLAFT1.get("RL_TPAISLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TPAISLUGNACIMI"));
						dep_expedicion = (DET_SARLAFT1.get("RL_DEPEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_DEPEXPEDICION"));
						tdep_expedicion = (DET_SARLAFT1.get("RL_TDEPEXPEDICION") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TDEPEXPEDICION"));
						dep_nacimiento = (DET_SARLAFT1.get("RL_DEPLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_DEPLUGNACIMI"));
						tdep_nacimiento = (DET_SARLAFT1.get("RL_TDEPLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TDEPLUGNACIMI"));
						lug_expedicion = (DET_SARLAFT1.get("RL_LUGEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_LUGEXPEDICION"));
						tlug_expedicion = (DET_SARLAFT1.get("RL_TLUGEXPEDICION") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TLUGEXPEDICION"));
						lug_nacimiento = (DET_SARLAFT1.get("RL_LUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_LUGNACIMI"));
						tlug_nacimiento = (DET_SARLAFT1.get("RL_TLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TLUGNACIMI"));
						pais_nacionalidad1 = (DET_SARLAFT1.get("RL_NACION1") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_NACION1"));
						tpais_nacionalidad1 = (DET_SARLAFT1.get("RL_TNACION1") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TNACION1"));
						pais_nacionalidad2 = (DET_SARLAFT1.get("RL_NACION2") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_NACION2"));
						tpais_nacionalidad2 = (DET_SARLAFT1.get("RL_TNACION2") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TNACION2"));
						pais_residencia = (DET_SARLAFT1.get("RL_PAIS") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_PAIS"));
						tpais_residencia = (DET_SARLAFT1.get("RL_TPAIS") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TPAIS"));
						dep_residencia = (DET_SARLAFT1.get("RL_DEPARTAMENT") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_DEPARTAMENT"));
						tdep_residencia = (DET_SARLAFT1.get("RL_TDEPARTAMENT") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TDEPARTAMENT"));
						lug_residencia = (DET_SARLAFT1.get("RL_CIUDAD") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT1.get("RL_CIUDAD"));
						tlug_residencia = (DET_SARLAFT1.get("RL_TCIUDAD") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TCIUDAD"));
						direccion = (DET_SARLAFT1.get("RL_DIRERECI") == null ? ""
								: (String) DET_SARLAFT1.get("RL_DIRERECI"));
						email = (DET_SARLAFT1.get("RL_EMAIL") == null ? "" : (String) DET_SARLAFT1.get("RL_EMAIL"));
						telefono = (DET_SARLAFT1.get("RL_TELEFONO") == null ? ""
								: (String) DET_SARLAFT1.get("RL_TELEFONO"));
						celular = (DET_SARLAFT1.get("RL_CELULAR") == null ? ""
								: (String) DET_SARLAFT1.get("RL_CELULAR"));
					}
					formdata.put("SSARLAFT", SSARLAFT);
					formdata.put("razon_social", razon_social);
					formdata.put("nit", nit);
					formdata.put("primer_apellido", primer_apellido);
					formdata.put("segundo_apellido", segundo_apellido);
					formdata.put("nombres", nombres.replace("}", ""));
					formdata.put("tipo_documento", tipo_documento);
					formdata.put("documento", documento);
					formdata.put("f_nacimiento", f_nacimiento);
					formdata.put("f_expedicion", f_expedicion);
					formdata.put("pais_expedicion", pais_expedicion);
					formdata.put("tpais_expedicion", tpais_expedicion);
					formdata.put("pais_nacimiento", pais_nacimiento);
					formdata.put("tpais_nacimiento", tpais_nacimiento);
					formdata.put("dep_expedicion", dep_expedicion);
					formdata.put("tdep_expedicion", tdep_expedicion);
					formdata.put("dep_nacimiento", dep_nacimiento);
					formdata.put("tdep_nacimiento", tdep_nacimiento);
					formdata.put("lug_expedicion", lug_expedicion);
					formdata.put("tlug_expedicion", tlug_expedicion);
					formdata.put("lug_nacimiento", lug_nacimiento);
					formdata.put("tlug_nacimiento", tlug_nacimiento);
					formdata.put("pais_nacionalidad1", pais_nacionalidad1);
					formdata.put("tpais_nacionalidad1", tpais_nacionalidad1);
					formdata.put("pais_nacionalidad2", pais_nacionalidad2);
					formdata.put("tpais_nacionalidad2", tpais_nacionalidad2);
					formdata.put("pais_residencia", pais_residencia);
					formdata.put("tpais_residencia", tpais_residencia);
					formdata.put("dep_residencia", dep_residencia);
					formdata.put("tdep_residencia", tdep_residencia);
					formdata.put("lug_residencia", lug_residencia);
					formdata.put("tlug_residencia", tlug_residencia);
					formdata.put("direccion", direccion);
					formdata.put("email", email);
					formdata.put("telefono", telefono);
					formdata.put("celular", celular);
					formdata.put("codciiu", codciiu);
					formdata.put("descriciiu", descriciiu);
					formdata.put("ocupacion", ocupacion);
					formdata.put("direccion_jur", direccion_jur);
					formdata.put("pais_oficina", pais_oficina);
					formdata.put("tpais_oficina", tpais_oficina);
					formdata.put("dep_oficina", dep_oficina);
					formdata.put("tdep_oficina", tdep_oficina);
					formdata.put("lug_oficina", lug_oficina);
					formdata.put("tlug_oficina", tlug_oficina);
					formdata.put("telefono_ofic", telefono_ofic);
					formdata.put("fax_oficina", fax_oficina);
					formdata.put("codciiu_jur", codciiu_jur);
					formdata.put("descriciiu_jur", descriciiu_jur);
					formdata.put("email_jur", email_jur);
					logger.debug(documento);
				}
			}

			// FIN CP0416M_SYS_PERS 18/12/2018
			// Fin TCS_1560 - ACL - 11/02/2019
			// ------------------------------------
			else {
				// if(SSARLAFT!=null){
				Map mapSarlaft = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DATSARLATF(SSARLAFT, FRADICA, SPERSON);

				List<Map> listaarlaft = (List) tratarRETURNyMENSAJES(request, mapSarlaft);

				Map DET_SARLAFT = null;
				if (listaarlaft != null) {
					for (Map miop : listaarlaft) {
						DET_SARLAFT = miop;
					}
					// Ini TCS_1560 - ACL - 11/02/2019 - Se agrega campos para leer los datos que se
					// guardan en BD
					if (persona_natural) {
						primer_apellido = (DET_SARLAFT.get("PER_PAPELLIDO") == null ? ""
								: (String) DET_SARLAFT.get("PER_PAPELLIDO"));
						segundo_apellido = (DET_SARLAFT.get("PER_SAPELLIDO") == null ? ""
								: (String) DET_SARLAFT.get("PER_SAPELLIDO"));
						nombres = (DET_SARLAFT.get("PER_NOMBRES") == null ? ""
								: (String) DET_SARLAFT.get("PER_NOMBRES"));
						tipo_documento = (DET_SARLAFT.get("PER_TIPDOCUMENT") == null ? new BigDecimal(1000)
								: (BigDecimal) DET_SARLAFT.get("PER_TIPDOCUMENT"));
						documento = (DET_SARLAFT.get("PER_DOCUMENT") == null ? ""
								: (String) DET_SARLAFT.get("PER_DOCUMENT"));
						f_nacimiento = (DET_SARLAFT.get("PER_FNACIMI") == null ? null
								: stringToSqlDate(DET_SARLAFT.get("PER_FNACIMI").toString()));
						f_expedicion = (DET_SARLAFT.get("PER_FEXPEDICION") == null ? null
								: stringToSqlDate(DET_SARLAFT.get("PER_FEXPEDICION").toString()));
						pais_expedicion = (DET_SARLAFT.get("PER_PAISEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_PAISEXPEDICION"));
						tpais_expedicion = (DET_SARLAFT.get("PER_TPAISEXPEDICION") == null ? ""
								: (String) DET_SARLAFT.get("PER_TPAISEXPEDICION"));
						pais_nacimiento = (DET_SARLAFT.get("PER_PAISLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_PAISLUGNACIMI"));
						tpais_nacimiento = (DET_SARLAFT.get("PER_TPAISLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT.get("PER_TPAISLUGNACIMI"));
						dep_expedicion = (DET_SARLAFT.get("PER_DEPEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_DEPEXPEDICION"));
						tdep_expedicion = (DET_SARLAFT.get("PER_TDEPEXPEDICION") == null ? ""
								: (String) DET_SARLAFT.get("PER_TDEPEXPEDICION"));
						dep_nacimiento = (DET_SARLAFT.get("PER_DEPLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_DEPLUGNACIMI"));
						tdep_nacimiento = (DET_SARLAFT.get("PER_TDEPLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT.get("PER_TDEPLUGNACIMI"));
						lug_expedicion = (DET_SARLAFT.get("PER_LUGEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_LUGEXPEDICION"));
						tlug_expedicion = (DET_SARLAFT.get("PER_TLUGEXPEDICION") == null ? ""
								: (String) DET_SARLAFT.get("PER_TLUGEXPEDICION"));
						lug_nacimiento = (DET_SARLAFT.get("PER_LUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_LUGNACIMI"));
						tlug_nacimiento = (DET_SARLAFT.get("PER_TLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT.get("PER_TLUGNACIMI"));
						pais_nacionalidad1 = (DET_SARLAFT.get("PER_NACION1") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_NACION1"));
						tpais_nacionalidad1 = (DET_SARLAFT.get("PER_TNACION1") == null ? ""
								: (String) DET_SARLAFT.get("PER_TNACION1"));
						pais_nacionalidad2 = (DET_SARLAFT.get("PER_NACION2") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_NACION2"));
						tpais_nacionalidad2 = (DET_SARLAFT.get("PER_TNACION2") == null ? ""
								: (String) DET_SARLAFT.get("PER_TNACION2"));
						pais_residencia = (DET_SARLAFT.get("PER_PAIS") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_PAIS"));
						tpais_residencia = (DET_SARLAFT.get("PER_TPAIS") == null ? ""
								: (String) DET_SARLAFT.get("PER_TPAIS"));
						dep_residencia = (DET_SARLAFT.get("PER_DEPARTAMENT") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_DEPARTAMENT"));
						tdep_residencia = (DET_SARLAFT.get("PER_TDEPARTAMENT") == null ? ""
								: (String) DET_SARLAFT.get("PER_TDEPARTAMENT"));
						lug_residencia = (DET_SARLAFT.get("PER_CIUDAD") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("PER_CIUDAD"));
						tlug_residencia = (DET_SARLAFT.get("PER_TCIUDAD") == null ? ""
								: (String) DET_SARLAFT.get("PER_TCIUDAD"));
						direccion = (DET_SARLAFT.get("PER_DIRERECI") == null ? ""
								: (String) DET_SARLAFT.get("PER_DIRERECI"));
						email = (DET_SARLAFT.get("PER_EMAIL") == null ? "" : (String) DET_SARLAFT.get("PER_EMAIL"));
						telefono = (DET_SARLAFT.get("PER_TELEFONO") == null ? ""
								: (String) DET_SARLAFT.get("PER_TELEFONO"));
						celular = (DET_SARLAFT.get("PER_CELULAR") == null ? ""
								: (String) DET_SARLAFT.get("PER_CELULAR"));
						codciiu = (DET_SARLAFT.get("NCIIUPPAL") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("NCIIUPPAL"));
						descriciiu = (DET_SARLAFT.get("TCCIIUPPAL") == null ? ""
								: (String) DET_SARLAFT.get("TCCIIUPPAL"));
						ocupacion = (DET_SARLAFT.get("TOCUPACION") == null ? ""
								: (String) DET_SARLAFT.get("TOCUPACION"));
					} else {
						razon_social = (DET_SARLAFT.get("NRAZONSO") == null ? ""
								: (String) DET_SARLAFT.get("NRAZONSO"));
						nit = (DET_SARLAFT.get("TNIT") == null ? "" : (String) DET_SARLAFT.get("TNIT"));
						direccion_jur = (DET_SARLAFT.get("TOFICINAPRI") == null ? ""
								: (String) DET_SARLAFT.get("TOFICINAPRI"));
						pais_oficina = (DET_SARLAFT.get("TPAIS") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("TPAIS"));
						tpais_oficina = (DET_SARLAFT.get("EMPTPAIS") == null ? ""
								: (String) DET_SARLAFT.get("EMPTPAIS"));
						dep_oficina = (DET_SARLAFT.get("TDEPATAMENTO") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("TDEPATAMENTO"));
						tdep_oficina = (DET_SARLAFT.get("EMPTDEPATAMENTO") == null ? ""
								: (String) DET_SARLAFT.get("EMPTDEPATAMENTO"));
						lug_oficina = (DET_SARLAFT.get("TCIUDAD") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("TCIUDAD"));
						tlug_oficina = (DET_SARLAFT.get("EMPTCIUDAD") == null ? ""
								: (String) DET_SARLAFT.get("EMPTCIUDAD"));
						telefono_ofic = (DET_SARLAFT.get("TTELEFONO") == null ? ""
								: (String) DET_SARLAFT.get("TTELEFONO"));
						fax_oficina = (DET_SARLAFT.get("TFAX") == null ? "" : (String) DET_SARLAFT.get("TFAX"));
						email_jur = (DET_SARLAFT.get("TMAILJURID") == null ? ""
								: (String) DET_SARLAFT.get("TMAILJURID"));
						codciiu_jur = (DET_SARLAFT.get("CCIIU") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("CCIIU"));
						descriciiu_jur = (DET_SARLAFT.get("TACTIACA") == null ? ""
								: (String) DET_SARLAFT.get("TACTIACA"));
						primer_apellido = (DET_SARLAFT.get("TREPRESENTANLE") == null ? ""
								: (String) DET_SARLAFT.get("TREPRESENTANLE"));
						segundo_apellido = (DET_SARLAFT.get("TSEGAPE") == null ? ""
								: (String) DET_SARLAFT.get("TSEGAPE"));
						nombres = (DET_SARLAFT.get("TNOMBRES") == null ? "" : (String) DET_SARLAFT.get("TNOMBRES"));
						tipo_documento = (DET_SARLAFT.get("NTIPDOC") == null ? new BigDecimal(1000)
								: (BigDecimal) DET_SARLAFT.get("NTIPDOC"));
						documento = (DET_SARLAFT.get("TNUMDOC") == null ? "" : (String) DET_SARLAFT.get("TNUMDOC"));
						f_expedicion = (DET_SARLAFT.get("FEXPEDICDOC") == null ? null
								: stringToSqlDate(DET_SARLAFT.get("FEXPEDICDOC").toString()));
						f_nacimiento = (DET_SARLAFT.get("FNACIMIENTO") == null ? null
								: stringToSqlDate(DET_SARLAFT.get("FNACIMIENTO").toString()));
						pais_nacimiento = (DET_SARLAFT.get("EMP_PAISLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("EMP_PAISLUGNACIMI"));
						tpais_nacimiento = (DET_SARLAFT.get("EMP_TPAISLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT.get("EMP_TPAISLUGNACIMI"));
						dep_nacimiento = (DET_SARLAFT.get("EMP_DEPLUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("EMP_DEPLUGNACIMI"));
						tdep_nacimiento = (DET_SARLAFT.get("EMP_TDEPLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT.get("EMP_TDEPLUGNACIMI"));
						lug_nacimiento = (DET_SARLAFT.get("EMP_LUGNACIMI") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("EMP_LUGNACIMI"));
						tlug_nacimiento = (DET_SARLAFT.get("EMP_TLUGNACIMI") == null ? ""
								: (String) DET_SARLAFT.get("EMP_TLUGNACIMI"));
						pais_expedicion = (DET_SARLAFT.get("EMP_PAISEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("EMP_PAISEXPEDICION"));
						tpais_expedicion = (DET_SARLAFT.get("EMP_TPAISEXPEDICION") == null ? ""
								: (String) DET_SARLAFT.get("EMP_TPAISEXPEDICION"));
						dep_expedicion = (DET_SARLAFT.get("EMP_DEPEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("EMP_DEPEXPEDICION"));
						tdep_expedicion = (DET_SARLAFT.get("EMP_TDEPEXPEDICION") == null ? ""
								: (String) DET_SARLAFT.get("EMP_TDEPEXPEDICION"));
						lug_expedicion = (DET_SARLAFT.get("EMP_LUGEXPEDICION") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("EMP_LUGEXPEDICION"));
						tlug_expedicion = (DET_SARLAFT.get("EMP_TLUGEXPEDICION") == null ? ""
								: (String) DET_SARLAFT.get("EMP_TLUGEXPEDICION"));
						pais_nacionalidad1 = (DET_SARLAFT.get("TNACIONALI1") == null ? new BigDecimal(0)
								: new BigDecimal((String) DET_SARLAFT.get("TNACIONALI1")));
						tpais_nacionalidad1 = (DET_SARLAFT.get("EMPTNACIONALI1") == null ? ""
								: (String) DET_SARLAFT.get("EMPTNACIONALI1"));
						pais_nacionalidad2 = (DET_SARLAFT.get("TNACIONALI2") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("TNACIONALI2"));
						tpais_nacionalidad2 = (DET_SARLAFT.get("EMPTNACIONALI2") == null ? ""
								: (String) DET_SARLAFT.get("EMPTNACIONALI2"));
						pais_residencia = (DET_SARLAFT.get("CPAIRREPL") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("CPAIRREPL"));
						tpais_residencia = (DET_SARLAFT.get("TPAIRREPL") == null ? ""
								: (String) DET_SARLAFT.get("TPAIRREPL"));
						dep_residencia = (DET_SARLAFT.get("CDEPRREPL") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("CDEPRREPL"));
						tdep_residencia = (DET_SARLAFT.get("TDEPRREPL") == null ? ""
								: (String) DET_SARLAFT.get("TDEPRREPL"));
						lug_residencia = (DET_SARLAFT.get("CCIURREPL") == null ? new BigDecimal(0)
								: (BigDecimal) DET_SARLAFT.get("CCIURREPL"));
						tlug_residencia = (DET_SARLAFT.get("TCIURREPL") == null ? ""
								: (String) DET_SARLAFT.get("TCIURREPL"));
						direccion = (DET_SARLAFT.get("TDIRSREPL") == null ? "" : (String) DET_SARLAFT.get("TDIRSREPL"));
						email = (DET_SARLAFT.get("TMAILREPL") == null ? "" : (String) DET_SARLAFT.get("TMAILREPL"));
						telefono = (DET_SARLAFT.get("TTELREPL") == null ? "" : (String) DET_SARLAFT.get("TTELREPL"));
						celular = (DET_SARLAFT.get("TCELUREPL") == null ? "" : (String) DET_SARLAFT.get("TCELUREPL"));
					}

					formdata.put("razon_social", razon_social);
					formdata.put("nit", nit);
					formdata.put("primer_apellido", primer_apellido);
					formdata.put("segundo_apellido", segundo_apellido);
					formdata.put("nombres", nombres.replace("}", ""));
					formdata.put("tipo_documento", tipo_documento);
					formdata.put("documento", documento);
					formdata.put("f_nacimiento", f_nacimiento);
					formdata.put("f_expedicion", f_expedicion);
					formdata.put("pais_expedicion", pais_expedicion);
					formdata.put("tpais_expedicion", tpais_expedicion);
					formdata.put("pais_nacimiento", pais_nacimiento);
					formdata.put("tpais_nacimiento", tpais_nacimiento);
					formdata.put("dep_expedicion", dep_expedicion);
					formdata.put("tdep_expedicion", tdep_expedicion);
					formdata.put("dep_nacimiento", dep_nacimiento);
					formdata.put("tdep_nacimiento", tdep_nacimiento);
					formdata.put("lug_expedicion", lug_expedicion);
					formdata.put("tlug_expedicion", tlug_expedicion);
					formdata.put("lug_nacimiento", lug_nacimiento);
					formdata.put("tlug_nacimiento", tlug_nacimiento);
					formdata.put("pais_nacionalidad1", pais_nacionalidad1);
					formdata.put("tpais_nacionalidad1", tpais_nacionalidad1);
					formdata.put("pais_nacionalidad2", pais_nacionalidad2);
					formdata.put("tpais_nacionalidad2", tpais_nacionalidad2);
					formdata.put("pais_residencia", pais_residencia);
					formdata.put("tpais_residencia", tpais_residencia);
					formdata.put("dep_residencia", dep_residencia);
					formdata.put("tdep_residencia", tdep_residencia);
					formdata.put("lug_residencia", lug_residencia);
					formdata.put("tlug_residencia", tlug_residencia);
					formdata.put("direccion", direccion);
					formdata.put("email", email);
					formdata.put("telefono", telefono);
					formdata.put("celular", celular);
					formdata.put("codciiu", codciiu);
					formdata.put("descriciiu", descriciiu);
					formdata.put("ocupacion", ocupacion);
					formdata.put("direccion_jur", direccion_jur);
					formdata.put("pais_oficina", pais_oficina);
					formdata.put("tpais_oficina", tpais_oficina);
					formdata.put("dep_oficina", dep_oficina);
					formdata.put("tdep_oficina", tdep_oficina);
					formdata.put("lug_oficina", lug_oficina);
					formdata.put("tlug_oficina", tlug_oficina);
					formdata.put("telefono_ofic", telefono_ofic);
					formdata.put("fax_oficina", fax_oficina);
					formdata.put("codciiu_jur", codciiu_jur);
					formdata.put("descriciiu_jur", descriciiu_jur);
					formdata.put("email_jur", email_jur);
				}
				// Fin TCS_1560 - ACL - 11/02/2019
				formdata.put("DET_SARLAFT", DET_SARLAFT);

				Map mapSarlafta = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DETSARLATF_DEC(null, SPERSON, SSARLAFT);

				List<Map> listaarlafta = (List) tratarRETURNyMENSAJES(request, mapSarlafta);

				Map DET_SARLAFTA = null;
				if (listaarlafta != null)
					for (Map miop : listaarlafta) {
						DET_SARLAFTA = miop;
					}

				formdata.put("LISTAARLAFTA", listaarlafta);

				// ---------------
				Map mapSarlaftb = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DETSARLATF_ACT(null, SPERSON, SSARLAFT);

				List<Map> listaarlaftb = (List) tratarRETURNyMENSAJES(request, mapSarlaftb);

				Map DET_SARLAFTB = null;
				if (listaarlaftb != null)
					for (Map miop : listaarlaftb) {
						DET_SARLAFTB = miop;
					}

				formdata.put("LISTAARLAFTB", listaarlaftb);

				// ---------------
				Map mapSarlaftc = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DETSARLAFT_REC(null, SPERSON, SSARLAFT);

				List<Map> listaarlaftc = (List) tratarRETURNyMENSAJES(request, mapSarlaftc);

				Map DET_SARLAFTC = null;
				if (listaarlaftc != null)
					for (Map miop : listaarlaftc) {
						DET_SARLAFTC = miop;
					}

				formdata.put("LISTAARLAFTC", listaarlaftc);

			}

			String cargaPersona = getCampoTextual(request, "cargaPersona");

			if (cargaPersona != null) {

				String NNUMIDE = getCampoTextual(request, "documentoNuevo");
				String TNIT = getCampoTextual(request, "tnit");
				String BANDERA = getCampoTextual(request, "Bandera");
				String CODIGO = "DATOSBASICOSPERSONA";
				String CONDICION = "";
				if (BANDERA.equals("false"))
					CONDICION = NNUMIDE + "|";
				else
					CONDICION = TNIT + "|";

				Map DATOSPERSONA = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_LISTVALORES__F_GET_CONSULTA(CODIGO, CONDICION);

				if (DATOSPERSONA != null) {
					List<Map> persona = (List) tratarRETURNyMENSAJES(request, DATOSPERSONA, false);

					Map PERSONA_FINAL = null;
					if (persona != null) {
						for (Map miop : persona) {
							PERSONA_FINAL = miop;
							if (BANDERA.equals("false")) {
								primer_apellido = (String) PERSONA_FINAL.get("PRIMER_APELLIDO");
								segundo_apellido = (String) PERSONA_FINAL.get("SEGUNDO_APELLIDO");
								nombres = (String) PERSONA_FINAL.get("NOMBRE");
								tipo_documento = (BigDecimal) PERSONA_FINAL.get("TIPO_DOCUMENTO");
								documento = NNUMIDE;

								formdata.put("primer_apellido", (primer_apellido == null ? "" : primer_apellido));
								formdata.put("segundo_apellido", (segundo_apellido == null ? "" : segundo_apellido));
								formdata.put("nombres", (nombres == null ? "" : nombres.replace("}", "")));
								formdata.put("tipo_documento",
										(tipo_documento == null ? new BigDecimal(1000) : tipo_documento));
								formdata.put("documento", documento);
							} else {
								razon_social = (String) PERSONA_FINAL.get("PRIMER_APELLIDO");
								nit = TNIT;

								formdata.put("razon_social", (razon_social == null ? "" : razon_social));
								formdata.put("nit", nit);
							}
						}
					}
				}
			}

			Map mapSarlaftPEP = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_CPEP_SARLATF(SSARLAFT);
			List<Map> pep = (List) tratarRETURNyMENSAJES(request, mapSarlaftPEP);
			formdata.put("LISTAPEP", pep);

			Map mapSarlaftACC = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_CACCIONISTA_SARLATF(SSARLAFT);
			List<Map> accionistas = (List) tratarRETURNyMENSAJES(request, mapSarlaftACC);

			if (!isEmpty(accionistas)) {
				for (Map m : accionistas) {

					if ((new BigDecimal(0)).equals(m.get("CBOLSA"))) {
						// Obliga el llenado de la secci�n "Conocimiento ampliado de accionistas y
						// beneficiarios finales"
						// si se encuentra a alg�n accionista que no cotice en bolsa.
						formdata.put("oblConAmpAcc", true);
					}

				}
			} else {
				formdata.put("oblConAmpAcc", false);
			}

			formdata.put("LISTAACC", accionistas);

			Map mapSarlaftBEN = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_ACCIONISTA_SARLATF(SSARLAFT);
			List<Map> beneficiarios = (List) tratarRETURNyMENSAJES(request, mapSarlaftBEN);
			formdata.put("LISTABEN", beneficiarios);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			AbstractDispatchAction.topPila(request, "CMODO", modoAct);// IAXIS-4854
		}
	}

	@SuppressWarnings("all")
	public void m_forma(HttpServletRequest request) {
		logger.debug("Axisper047Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSARLAFT = getCampoNumerico(request, "SSARLAFT");

			formdata.put("SPERSON", SPERSON);
			formdata.put("SSARLAFT", SSARLAFT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_formb(HttpServletRequest request) {
		logger.debug("Axisper047Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSARLAFT = getCampoNumerico(request, "SSARLAFT");

			formdata.put("SPERSON", SPERSON);
			formdata.put("SSARLAFT", SSARLAFT);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_formc(HttpServletRequest request) {
		logger.debug("Axisper047Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			Map map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(null, null);
			List axisctr_listaRamos = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("axisctr_listaRamos", axisctr_listaRamos);

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSARLAFT = getCampoNumerico(request, "SSARLAFT");
			BigDecimal NRECLA = getCampoNumerico(request, "NRECLA");
			String MODOSARLAFT = getCampoTextual(request, "MODOSARLAFT");
			if (MODOSARLAFT.equals("CONSULTA")) {
				Map mapSarlaftc = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_DETSARLAFT_REC(NRECLA, SPERSON,
						SSARLAFT);

				List<Map> listaarlaftc = (List) tratarRETURNyMENSAJES(request, mapSarlaftc);

				Map DET_SARLAFTC = null;
				if (listaarlaftc != null)
					for (Map miop : listaarlaftc) {
						DET_SARLAFTC = miop;
					}

				formdata.put("LISTAARLAFTC", DET_SARLAFTC);
			}
			formdata.put("SPERSON", SPERSON);
			formdata.put("SSARLAFT", SSARLAFT);
			formdata.put("NRECLA", NRECLA);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	// CP0727M_SYS_PERS_Val - ACL - 23/11/2018 -- Se agrega el campo pPCORIGENFON
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSSARLAFT = getCampoNumerico(request, "SSARLAFT");
			Date pPFRADICA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRADICA"), "dd/MM/yyyy");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");
			Date pPFDILIGENCIA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FDILIGENCIA"),
					"dd/MM/yyyy");
			BigDecimal pPCAUTTRADAT = getCampoNumerico(request, "CAUTTRADAT");
			BigDecimal pPCRUTFCC = getCampoNumerico(request, "CRUTFCC");
			BigDecimal pPCESTCONF = getCampoNumerico(request, "CESTCONF");
			Date pPFCONFIR = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCONFIR"), "dd/MM/yyyy");
			BigDecimal pPCVINCULACION = getCampoNumerico(request, "CVINCULACION");
			String pPTVINCULACION = getCampoTextual(request, "TVINCULACION");
			BigDecimal pPCVINTOMASE = getCampoNumerico(request, "CVINTOMASE");
			String pPTVINTOMASE = getCampoTextual(request, "TVINTOMASE");
			BigDecimal pPCVINTOMBEN = getCampoNumerico(request, "CVINTOMBEN");
			String pPTVINTOMBEM = getCampoTextual(request, "TVINTOMBEM");
			BigDecimal pPCVINASEBEN = getCampoNumerico(request, "CVINASEBEN");
			String pPTVINASEBEM = getCampoTextual(request, "TVINASEBEM");
			BigDecimal pPCACTIPPAL = getCampoNumerico(request, "CACTIPPAL");
			BigDecimal pPPER_SECTORPPAL = getCampoNumerico(request, "PER_SECTORPPAL");
			BigDecimal pPNCIIUPPAL = getCampoNumerico(request, "NCIIUPPAL");
			String pPTCCIIUPPAL = getCampoTextual(request, "TCCIIUPPAL");
			String pPPERTIPOACTIVPPAL = getCampoTextual(request, "PER_TIPOACTIVPPAL");
			String pPTOCUPACION = getCampoTextual(request, "TOCUPACION");
			String pPTCARGO = getCampoTextual(request, "TCARGO");
			String pPTEMPRESA = getCampoTextual(request, "TEMPRESA");
			String pPTDIREMPRESA = getCampoTextual(request, "TDIREMPRESA");

			BigDecimal pPER_CDEPTOOFIC = getCampoNumerico(request, "PER_CDEPTOOFIC");
			String pPER_TDEPTOOFIC = getCampoTextual(request, "PER_TDEPTOOFIC");
			BigDecimal pPER_CCIUOFIC = getCampoNumerico(request, "PER_CCIUOFIC");
			String pPER_TCIUOFIC = getCampoTextual(request, "PER_TCIUOFIC");

			String pPTTELEMPRESA = getCampoTextual(request, "TTELEMPRESA");
			BigDecimal pPCACTISEC = getCampoNumerico(request, "CACTISEC");
			BigDecimal pPNCIIUSEC = getCampoNumerico(request, "NCIIUSEC");
			String pPTCCIIUSEC = getCampoTextual(request, "TCCIIUSEC");
			String pPTDIRSEC = getCampoTextual(request, "TDIRSEC");
			String pPTTELSEC = getCampoTextual(request, "TTELSEC");
			String pPTPRODSERVCOM = getCampoTextual(request, "TPRODSERVCOM");
			BigDecimal pPIINGRESOS = getCampoNumerico(request, "IINGRESOS");
			BigDecimal pPIACTIVOS = getCampoNumerico(request, "IACTIVOS");
			BigDecimal pPIPATRIMONIO = getCampoNumerico(request, "IPATRIMONIO");
			BigDecimal pPIEGRESOS = getCampoNumerico(request, "IEGRESOS");
			BigDecimal pPIPASIVOS = getCampoNumerico(request, "IPASIVOS");
			BigDecimal pPIOTROINGRESO = getCampoNumerico(request, "IOTROINGRESO");
			String pPTCONCOTRING = getCampoTextual(request, "TCONCOTRING");
			BigDecimal pPCMANRECPUB = getCampoNumerico(request, "CMANRECPUB");
			BigDecimal pPCPODPUB = getCampoNumerico(request, "CPODPUB");
			BigDecimal pPCRECPUB = getCampoNumerico(request, "CRECPUB");
			BigDecimal pPCVINPERPUB = getCampoNumerico(request, "CVINPERPUB");
			String pPTVINPERPUB = getCampoTextual(request, "TVINPERPUB");
			BigDecimal pPCDECTRIBEXT = getCampoNumerico(request, "CDECTRIBEXT");
			String pPTDECTRIBEXT = getCampoTextual(request, "TDECTRIBEXT");
			String pPTORIGFOND = getCampoTextual(request, "TORIGFOND");
			BigDecimal pPCTRAXMODEXT = getCampoNumerico(request, "CTRAXMODEXT");
			String pPTTRAXMODEXT = getCampoTextual(request, "TTRAXMODEXT");
			BigDecimal pPCPRODFINEXT = getCampoNumerico(request, "CPRODFINEXT");
			BigDecimal pPCCTAMODEXT = getCampoNumerico(request, "CCTAMODEXT");
			String pPTOTRASOPER = getCampoTextual(request, "TOTRASOPER");
			BigDecimal pPCRECLINDSEG = getCampoNumerico(request, "CRECLINDSEG");
			BigDecimal pPTCIUDADSUC = getCampoNumerico(request, "TCIUDADSUC");
			BigDecimal pPTPAISUC = getCampoNumerico(request, "TPAISUC");
			BigDecimal pPTDEPATAMENTOSUC = getCampoNumerico(request, "TDEPATAMENTOSUC");
			BigDecimal pPTCIUDAD = getCampoNumerico(request, "TCIUDAD");
			BigDecimal pPTDEPATAMENTO = getCampoNumerico(request, "TDEPATAMENTO");
			BigDecimal pPTPAIS = getCampoNumerico(request, "TPAIS");
			BigDecimal pPTLUGAREXPEDIDOC = getCampoNumerico(request, "TLUGAREXPEDIDOC");
			BigDecimal pPRESOCIEDAD = getCampoNumerico(request, "RESOCIEDAD");
			BigDecimal pPTNACIONALI2 = getCampoNumerico(request, "TNACIONALI2");
			BigDecimal pPNGRADOPOD = getCampoNumerico(request, "NGRADOPOD");
			BigDecimal pPNGOZREC = getCampoNumerico(request, "NGOZREC");
			BigDecimal pPNPARTICIPA = getCampoNumerico(request, "NPARTICIPA");
			BigDecimal pPNVINCULO = getCampoNumerico(request, "NVINCULO");
			BigDecimal pPNTIPDOC = getCampoNumerico(request, "NTIPDOC");
			Date pPFEXPEDICDOC = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEXPEDICDOC"),
					"dd/MM/yyyy");
			Date pPFNACIMIENTO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FNACIMIENTO"),
					"dd/MM/yyyy");
			String pPNRAZONSO = getCampoTextual(request, "NRAZONSO");
			String pPTNIT = getCampoTextual(request, "TNIT");
			String pPTDV = getCampoTextual(request, "TDV");
			String pPTOFICINAPRI = getCampoTextual(request, "TOFICINAPRI");
			String pPTTELEFONO = getCampoTextual(request, "TTELEFONO");
			String pPTFAX = getCampoTextual(request, "TFAX");
			String pPTSUCURSAL = getCampoTextual(request, "TSUCURSAL");
			String pPTTELEFONOSUC = getCampoTextual(request, "TTELEFONOSUC");
			String pPTFAXSUC = getCampoTextual(request, "TFAXSUC");
			String pPCTIPOEMP = getCampoTextual(request, "CTIPOEMP");
			String pPTCUALTEMP = getCampoTextual(request, "TCUALTEMP");
			String pPTSECTOR = getCampoTextual(request, "TSECTOR");
			BigDecimal pPCCIIU = getCampoNumerico(request, "CCIIU");
			String pPTACTIACA = getCampoTextual(request, "TACTIACA");
			String pPTMAILJURID = getCampoTextual(request, "TMAILJURID");
			String pPTREPRESENTANLE = getCampoTextual(request, "TREPRESENTANLE");
			String pPTSEGAPE = getCampoTextual(request, "TSEGAPE");
			String pPTNOMBRES = getCampoTextual(request, "TNOMBRES");
			String pPTNUMDOC = getCampoTextual(request, "TNUMDOC");
			String pPTLUGNACI = getCampoTextual(request, "TLUGNACI");
			String pPTNACIONALI1 = getCampoTextual(request, "TNACIONALI1");
			String pPTINDIQUEVIN = getCampoTextual(request, "TINDIQUEVIN");
			String pPPER_PAPELLIDO = getCampoTextual(request, "PER_PAPELLIDO");
			String pPPER_SAPELLIDO = getCampoTextual(request, "PER_SAPELLIDO");
			String pPPER_NOMBRES = getCampoTextual(request, "PER_NOMBRES");
			BigDecimal pPPER_TIPDOCUMENT = getCampoNumerico(request, "PER_TIPDOCUMENT");
			String pPPER_DOCUMENT = getCampoTextual(request, "PER_DOCUMENT");
			Date pPPER_FEXPEDICION = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "PER_FEXPEDICION"),
					"dd/MM/yyyy");
			BigDecimal pPPER_LUGEXPEDICION = getCampoNumerico(request, "PER_LUGEXPEDICION");
			Date pPPER_FNACIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "PER_FNACIMI"),
					"dd/MM/yyyy");
			BigDecimal pPPER_LUGNACIMI = getCampoNumerico(request, "PER_LUGNACIMI");
			BigDecimal pPPER_NACION1 = getCampoNumerico(request, "PER_NACION1");
			String pPPER_DIRERECI = getCampoTextual(request, "PER_DIRERECI");
			BigDecimal pPPER_PAIS = getCampoNumerico(request, "PER_PAIS");
			BigDecimal pPPER_CIUDAD = getCampoNumerico(request, "PER_CIUDAD");
			BigDecimal pPPER_DEPARTAMENT = getCampoNumerico(request, "PER_DEPARTAMENT");
			String pPPER_EMAIL = getCampoTextual(request, "PER_EMAIL");
			String pPPER_TELEFONO = getCampoTextual(request, "PER_TELEFONO");
			String pPPER_CELULAR = getCampoTextual(request, "PER_CELULAR");
			BigDecimal pPNRECPUB = getCampoNumerico(request, "NRECPUB");
			BigDecimal pPTPRESETRECLAMACI = getCampoNumerico(request, "TPRESETRECLAMACI");
			String pPPER_TLUGEXPEDICION = getCampoTextual(request, "PER_TLUGEXPEDICION");
			String pPPER_TLUGNACIMI = getCampoTextual(request, "PER_TLUGNACIMI");
			String pPPER_TNACION1 = getCampoTextual(request, "PER_TNACION1");
			String pPPER_TNACION2 = getCampoTextual(request, "PER_TNACION2");
			String pPPER_TPAIS = getCampoTextual(request, "PER_TPAIS");
			String pPPER_TDEPARTAMENT = getCampoTextual(request, "PER_TDEPARTAMENT");
			String pPPER_TCIUDAD = getCampoTextual(request, "PER_TCIUDAD");
			String pPEMPTPAIS = getCampoTextual(request, "EMPTPAIS");
			String pPEMPTDEPATAMENTO = getCampoTextual(request, "EMPTDEPATAMENTO");
			String pPEMPTCIUDAD = getCampoTextual(request, "EMPTCIUDAD");
			String pPEMPTPAISUC = getCampoTextual(request, "EMPTPAISUC");
			String pPEMPTDEPATAMENTOSUC = getCampoTextual(request, "EMPTDEPATAMENTOSUC");
			String pPEMPTCIUDADSUC = getCampoTextual(request, "EMPTCIUDADSUC");
			String pPEMPTLUGNACI = getCampoTextual(request, "EMPTLUGNACI");
			String pPEMPTNACIONALI1 = getCampoTextual(request, "EMPTNACIONALI1");
			String pPEMPTNACIONALI2 = getCampoTextual(request, "EMPTNACIONALI2");
			BigDecimal pPCSUJETOOBLIFACION = getCampoNumerico(request, "CSUJETOOBLIFACION");
			String pTINDIQUEOBLIG = getCampoTextual(request, "TINDIQUEOBLIG");

			BigDecimal pPER_CDEPTOSOL = getCampoNumerico(request, "PER_CDEPTOSOL");
			String pPER_TDEPTOSOL = getCampoTextual(request, "PER_TDEPTOSOL");
			BigDecimal pPER_CCIUSOL = getCampoNumerico(request, "PER_CCIUSOL");
			String pPER_TCIUSOL = getCampoTextual(request, "PER_TCIUSOL");

			BigDecimal pPER_PAISEXPEDICION = getCampoNumerico(request, "PER_PAISEXPEDICION");
			String pPER_TPAISEXPEDICION = getCampoTextual(request, "PER_TPAISEXPEDICION");
			BigDecimal pPER_DEPEXPEDICION = getCampoNumerico(request, "PER_DEPEXPEDICION");
			String pPER_TDEPEXPEDICION = getCampoTextual(request, "PER_TDEPEXPEDICION");
			BigDecimal pPER_PAISLUGNACIMI = getCampoNumerico(request, "PER_PAISLUGNACIMI");
			String pPER_TPAISLUGNACIMI = getCampoTextual(request, "PER_TPAISLUGNACIMI");
			BigDecimal pPER_DEPLUGNACIMI = getCampoNumerico(request, "PER_DEPLUGNACIMI");
			String pPER_TDEPLUGNACIMI = getCampoTextual(request, "PER_TDEPLUGNACIMI");
			BigDecimal pEMP_PAISEXPEDICION = getCampoNumerico(request, "EMP_PAISEXPEDICION");
			String pEMP_TPAISEXPEDICION = getCampoTextual(request, "EMP_TPAISEXPEDICION");
			BigDecimal pEMP_DEPEXPEDICION = getCampoNumerico(request, "EMP_DEPEXPEDICION");
			String pEMP_TDEPEXPEDICION = getCampoTextual(request, "EMP_TDEPEXPEDICION");
			BigDecimal pEMP_PAISLUGNACIMI = getCampoNumerico(request, "EMP_PAISLUGNACIMI");
			String pEMP_TPAISLUGNACIMI = getCampoTextual(request, "EMP_TPAISLUGNACIMI");
			BigDecimal pEMP_DEPLUGNACIMI = getCampoNumerico(request, "EMP_DEPLUGNACIMI");
			String pEMP_TDEPLUGNACIMI = getCampoTextual(request, "EMP_TDEPLUGNACIMI");
			BigDecimal pEMP_LUGNACIMI = getCampoNumerico(request, "EMP_LUGNACIMI");
			String pEMP_TLUGNACIMI = getCampoTextual(request, "EMP_TLUGNACIMI");
			Date pEMP_FEXPEDICION = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "EMP_FEXPEDICION"),
					"dd/MM/yyyy");
			BigDecimal pEMP_LUGEXPEDICION = getCampoNumerico(request, "EMP_LUGEXPEDICION");
			String pEMP_TLUGEXPEDICION = getCampoTextual(request, "EMP_TLUGEXPEDICION");
			BigDecimal pPER_NACION2 = getCampoNumerico(request, "PER_NACION2");

			String pPPER_PCSUCURSAL = getCampoTextual(request, "PER_PCSUCURSAL");
			BigDecimal pPPER_PCCIUSOL = getCampoNumerico(request, "PER_PCCIUSOL");
			BigDecimal pPPER_PCTIPSOL = getCampoNumerico(request, "PER_PCTIPSOL");
			BigDecimal pPPER_PCSECTOR = getCampoNumerico(request, "PER_CSECTOR");
			String pPPER_PCTIPACT = getCampoTextual(request, "PER_PCTIPACT");
			BigDecimal pPPER_PCCIUOFC = getCampoNumerico(request, "PER_PCCIUOFC");
			BigDecimal pPPER_PCDEPOFC = getCampoNumerico(request, "PER_PCDEPOFC");
			String pPEMP_TMAILREPL = getCampoTextual(request, "EMP_TMAILREPL");
			String pPEMP_TDIRSREPL = getCampoTextual(request, "EMP_TDIRSREPL");
			BigDecimal pPEMP_CCIURREPL = getCampoNumerico(request, "EMP_CCIURREPL");
			String pPEMP_TCIURREPL = getCampoTextual(request, "EMP_TCIURREPL");
			BigDecimal pPEMP_CDEPRREPL = getCampoNumerico(request, "EMP_CDEPRREPL");
			String pPEMP_TDEPRREPL = getCampoTextual(request, "EMP_TDEPRREPL");
			BigDecimal pPEMP_CPAIRREPL = getCampoNumerico(request, "EMP_CPAIRREPL");
			String pPEMP_TPAIRREPL = getCampoTextual(request, "EMP_TPAIRREPL");
			BigDecimal pPEMP_TTELREPL = getCampoNumerico(request, "TTELREPL");
			BigDecimal pPEMP_TCELUREPL = getCampoNumerico(request, "TCELUREPL");

			BigDecimal pPCDEPTOENTREV = getCampoNumerico(request, "CDEPTOENTREV");
			String pPTDEPTOENTREV = getCampoTextual(request, "TDEPTOENTREV");
			BigDecimal pPCCIUENTREV = getCampoNumerico(request, "CCIUENTREV");
			String pPTCIUENTREV = getCampoTextual(request, "TCIUENTREV");
			Date pPFENTREVISTA = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FENTREVISTA"), "dd/MM/yyyy");
			String pPTHORAENTREV = getCampoTextual(request, "THORAENTREV");
			String pPTAGENENTREV = getCampoTextual(request, "TAGENENTREV");
			String pPTASESENTREV = getCampoTextual(request, "TASESENTREV");
			String pPTOBSEENTREV = getCampoTextual(request, "TOBSEENTREV");
			BigDecimal pPCRESTENTREV = getCampoNumerico(request, "CRESTENTREV");
			String pPTOBSECONFIR = getCampoTextual(request, "TOBSECONFIR");
			String pPTHORACONFIR = getCampoTextual(request, "THORACONFIR");
			String pPTEMPLCONFIR = getCampoTextual(request, "TEMPLCONFIR");
			String pPCORIGENFON = getCampoTextual(request, "CORIGENFON");
			BigDecimal pPCCLAUSULA1 = getCampoNumerico(request, "CCLAUSULA1"); // TCS-9 AP 12/02/2019
			BigDecimal pPCCLAUSULA2 = getCampoNumerico(request, "CCLAUSULA2"); // TCS-9 AP 12/02/2019
			BigDecimal pPCCONFIR = (getCampoNumerico(request, "CCONFIR") == null ? new BigDecimal(0)
					: getCampoNumerico(request, "CCONFIR")); // IAXIS-3287 01/04/2019

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_DATSARLATF(pPSSARLAFT, pPFRADICA, pPSPERSON,
					pPFDILIGENCIA, pPCAUTTRADAT, pPCRUTFCC, pPCESTCONF, pPFCONFIR, pPCVINCULACION, pPTVINCULACION,
					pPER_CDEPTOSOL, pPER_TDEPTOSOL, pPER_CCIUSOL, pPER_TCIUSOL, pPCVINTOMASE, pPTVINTOMASE,
					pPCVINTOMBEN, pPTVINTOMBEM, pPCVINASEBEN, pPTVINASEBEM, pPCACTIPPAL, pPPER_SECTORPPAL, pPNCIIUPPAL,
					pPTCCIIUPPAL, pPPERTIPOACTIVPPAL, pPTOCUPACION, pPTCARGO, pPTEMPRESA, pPTDIREMPRESA,
					pPER_CDEPTOOFIC, pPER_TDEPTOOFIC, pPER_CCIUOFIC, pPER_TCIUOFIC, pPTTELEMPRESA, pPCACTISEC,
					pPNCIIUSEC, pPTCCIIUSEC, pPTDIRSEC, pPTTELSEC, pPTPRODSERVCOM, pPIINGRESOS, pPIACTIVOS,
					pPIPATRIMONIO, pPIEGRESOS, pPIPASIVOS, pPIOTROINGRESO, pPTCONCOTRING, pPCMANRECPUB, pPCPODPUB,
					pPCRECPUB, pPCVINPERPUB, pPTVINPERPUB, pPCDECTRIBEXT, pPTDECTRIBEXT, pPTORIGFOND, pPCTRAXMODEXT,
					pPTTRAXMODEXT, pPCPRODFINEXT, pPCCTAMODEXT, pPTOTRASOPER, pPCRECLINDSEG, pPTCIUDADSUC, pPTPAISUC,
					pPTDEPATAMENTOSUC, pPTCIUDAD, pPTDEPATAMENTO, pPTPAIS, pPTLUGAREXPEDIDOC, pPRESOCIEDAD,
					pPTNACIONALI2, pPNGRADOPOD, pPNGOZREC, pPNPARTICIPA, pPNVINCULO, pPNTIPDOC, pPFEXPEDICDOC,
					pPFNACIMIENTO, pPNRAZONSO, pPTNIT, pPTDV, pPTOFICINAPRI, pPTTELEFONO, pPTFAX, pPTSUCURSAL,
					pPTTELEFONOSUC, pPTFAXSUC, pPCTIPOEMP, pPTCUALTEMP, pPTSECTOR, pPCCIIU, pPTACTIACA, pPTMAILJURID,
					pPTREPRESENTANLE, pPTSEGAPE, pPTNOMBRES, pPTNUMDOC, pPTLUGNACI, pPTNACIONALI1, pPTINDIQUEVIN,
					pPPER_PAPELLIDO, pPPER_SAPELLIDO, pPPER_NOMBRES, pPPER_TIPDOCUMENT, pPPER_DOCUMENT,
					pPPER_FEXPEDICION, pPPER_LUGEXPEDICION, pPPER_FNACIMI, pPPER_LUGNACIMI, pPPER_NACION1,
					pPPER_DIRERECI, pPPER_PAIS, pPPER_CIUDAD, pPPER_DEPARTAMENT, pPPER_EMAIL, pPPER_TELEFONO,
					pPPER_CELULAR, pPNRECPUB, pPTPRESETRECLAMACI, pPPER_TLUGEXPEDICION, pPPER_TLUGNACIMI,
					pPPER_TNACION1, pPPER_TNACION2, pPPER_TPAIS, pPPER_TDEPARTAMENT, pPPER_TCIUDAD, pPEMPTPAIS,
					pPEMPTDEPATAMENTO, pPEMPTCIUDAD, pPEMPTPAISUC, pPEMPTDEPATAMENTOSUC, pPEMPTCIUDADSUC, pPEMPTLUGNACI,
					pPEMPTNACIONALI1, pPEMPTNACIONALI2, pPCSUJETOOBLIFACION, pTINDIQUEOBLIG, pPER_PAISEXPEDICION,
					pPER_TPAISEXPEDICION, pPER_DEPEXPEDICION, pPER_TDEPEXPEDICION, pPER_PAISLUGNACIMI,
					pPER_TPAISLUGNACIMI, pPER_DEPLUGNACIMI, pPER_TDEPLUGNACIMI, pEMP_PAISEXPEDICION,
					pEMP_TPAISEXPEDICION, pEMP_DEPEXPEDICION, pEMP_TDEPEXPEDICION, pEMP_PAISLUGNACIMI,
					pEMP_TPAISLUGNACIMI, pEMP_DEPLUGNACIMI, pEMP_TDEPLUGNACIMI, pEMP_LUGNACIMI, pEMP_TLUGNACIMI,
					pEMP_FEXPEDICION, pEMP_LUGEXPEDICION, pEMP_TLUGEXPEDICION, pPER_NACION2, pPPER_PCCIUSOL,
					pPPER_PCSUCURSAL, pPPER_PCTIPSOL, pPPER_PCSECTOR, pPPER_PCTIPACT, pPPER_PCCIUOFC, pPPER_PCDEPOFC,
					pPEMP_TMAILREPL, pPEMP_TDIRSREPL, pPEMP_CCIURREPL, pPEMP_TCIURREPL, pPEMP_CDEPRREPL,
					pPEMP_TDEPRREPL, pPEMP_CPAIRREPL, pPEMP_TPAIRREPL, pPEMP_TTELREPL, pPEMP_TCELUREPL, pPCDEPTOENTREV,
					pPTDEPTOENTREV, pPCCIUENTREV, pPTCIUENTREV, pPFENTREVISTA, pPTHORAENTREV, pPTAGENENTREV,
					pPTASESENTREV, pPTOBSEENTREV, pPCRESTENTREV, pPTOBSECONFIR, pPTHORACONFIR, pPTEMPLCONFIR,
					pPCORIGENFON, pPCCLAUSULA1, pPCCLAUSULA2, // TCS-9 AP 12/02/2019
					pPCCONFIR);// IAXIS-3287 01/04/2019

			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_aceptara(HttpServletRequest request) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSARLAFT = getCampoNumerico(request, "SSARLAFT");
			BigDecimal PIDENTIFICACION = getCampoNumerico(request, "IDENTIFICACION");
			BigDecimal PPPARTICI = getCampoNumerico(request, "PPARTICI");
			String PTNOMBRE = getCampoTextual(request, "TNOMBRE");
			BigDecimal PCTIPIDEN = getCampoNumerico(request, "CTIPIDEN");
			String PNNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal PCBOLSA = getCampoNumerico(request, "CBOLSA");
			BigDecimal PCPEP = getCampoNumerico(request, "CPEP");
			BigDecimal PCTRIBUEXT = getCampoNumerico(request, "CTRIBUEXT");

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_CACCIONISTA_SARLATF(PSSARLAFT, PIDENTIFICACION,
					PPPARTICI, PTNOMBRE, PCTIPIDEN, PNNUMIDE, PCBOLSA, PCPEP, PCTRIBUEXT);
			this.tratarRETURNyMENSAJES(request, map);

			m_form(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_aceptarb(HttpServletRequest request) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPNACTIVI = getCampoNumerico(request, "NACTIVI");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal pPSSARLAFT = getCampoNumerico(request, "SSARLAFT");
			// BigDecimal pPCTIPOPROD=getCampoNumerico(request, "CTIPOPROD");
			String pPCTIPOPROD = getCampoTextual(request, "CTIPOPROD");
			String pPCIDNUMPROD = getCampoTextual(request, "CIDNUMPROD");
			String pPTENTIDAD = getCampoTextual(request, "TENTIDAD");
			String pPCMONTO = getCampoTextual(request, "CMONTO");
			BigDecimal pPCCIUDAD = getCampoNumerico(request, "CCIUDAD");
			BigDecimal pPCPAIS = getCampoNumerico(request, "CPAIS");
			String pPCMONEDA = getCampoTextual(request, "CMONEDA");
			String pPSCPAIS = getCampoTextual(request, "SCPAIS");
			String pPSTDEPB = getCampoTextual(request, "STDEPB");
			BigDecimal pPTDEPB = getCampoNumerico(request, "TDEPB");
			String pPSCCIUDAD = getCampoTextual(request, "SCCIUDAD");

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_DETSARLATF_ACT(pPNACTIVI, pPSPERSON, pPSSARLAFT,
					pPCTIPOPROD, pPCIDNUMPROD, pPTENTIDAD, pPCMONTO, pPCCIUDAD, pPCPAIS, pPCMONEDA, pPSCPAIS, pPSTDEPB,
					pPTDEPB, pPSCCIUDAD);
			this.tratarRETURNyMENSAJES(request, map);

			m_form(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_aceptarc(HttpServletRequest request) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPNRECLA = getCampoNumerico(request, "NRECLA");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal pPSSARLAFT = getCampoNumerico(request, "SSARLAFT");
			BigDecimal pPCANIO = getCampoNumerico(request, "CANIO");
			String pPCRAMO = getCampoTextual(request, "CRAMO");
			String pPTCOMPANIA = getCampoTextual(request, "TCOMPANIA");
			String pPCVALOR = getCampoTextual(request, "CVALOR");
			String pPTRESULTADO = getCampoTextual(request, "TRESULTADO");

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_DETSARLAFT_REC(pPNRECLA, pPSPERSON, pPSSARLAFT,
					pPCANIO, pPCRAMO, pPTCOMPANIA, pPCVALOR, pPTRESULTADO);
			this.tratarRETURNyMENSAJES(request, map);

			m_form(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_anterior(HttpServletRequest request) {
		logger.debug("Axisctr040Service m_anterior");
		try {
			request.setAttribute(Constantes.FORWARDACTION,
					AxisCodeWizard.findForward(request, Constantes.ANTERIOR, whoami(this), null));
			f_Cargar_Propiedades_Pantalla(request, whoami(this));
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr040Service - metodo m_anterior", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	// --

	@SuppressWarnings("all")
	public void borrar_sarlaft(HttpServletRequest request) {
		logger.debug("Axisper047Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSARLAFT = getCampoNumerico(request, "SSARLAFT");
			String DETSARLAFT = getCampoTextual(request, "DETSARLAFT");
			BigDecimal IDSARLAFT = getCampoNumerico(request, "IDSARLAFT");
			BigDecimal IDENTIFICACION = getCampoNumerico(request, "IDENTIFICACION");
			Date FRADICA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FRADICA"), "dd/MM/yyyy");

			if (DETSARLAFT.equals("0")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DATSARLATF(SSARLAFT, FRADICA, SPERSON);
				this.tratarRETURNyMENSAJES(request, map);

				map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(null, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);

				map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(null, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);

				map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(null, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("1")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_DEC(IDSARLAFT, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("2")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLATF_ACT(IDSARLAFT, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("3")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_DETSARLAFT_REC(IDSARLAFT, SPERSON, SSARLAFT);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("4")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_ACCIONISTA_SARLATF(SSARLAFT, IDENTIFICACION);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("5")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_CPEP_SARLATF(SSARLAFT, IDENTIFICACION);
				this.tratarRETURNyMENSAJES(request, map);
			}
			if (DETSARLAFT.equals("6")) {
				Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DEL_CACCIONISTA_SARLATF(SSARLAFT, IDENTIFICACION);
				this.tratarRETURNyMENSAJES(request, map);
			}

			if (DETSARLAFT != null && !DETSARLAFT.equals("0")) {
				m_form(request);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper047Service - metodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_grabar_beneficiarios(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper052Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSARLAFT = getCampoNumerico(request, "SSARLAFT");
			BigDecimal PIDENTIFICACION = getCampoNumerico(request, "IDENTIFICACION");
			BigDecimal PPPARTICI = getCampoNumerico(request, "PPARTICI");
			String PTNOMBRE = getCampoTextual(request, "TNOMBRE");
			BigDecimal PCTIPIDEN = getCampoNumerico(request, "CTIPIDEN");
			String PNNUMIDE = getCampoTextual(request, "NNUMIDE");
			String PTSOCIEDAD = getCampoTextual(request, "TSOCIEDAD");
			String PNNUMIDESOC = getCampoTextual(request, "NNUMIDESOC");

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_ACCIONISTA_SARLATF(PSSARLAFT, PIDENTIFICACION,
					PPPARTICI, PTNOMBRE, PCTIPIDEN, PNNUMIDE, PTSOCIEDAD, PNNUMIDESOC);
			tratarRETURNyMENSAJES(request, map);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper052Service - metodo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_grabar_expuestas(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper051Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSARLAFT = getCampoNumerico(request, "SSARLAFT");
			BigDecimal PIDENTIFICACION = getCampoNumerico(request, "IDENTIFICACION");
			BigDecimal PCTIPREL = getCampoNumerico(request, "CTIPREL");
			String PTNOMBRE = getCampoTextual(request, "TNOMBRE");
			BigDecimal PCTIPIDEN = getCampoNumerico(request, "CTIPIDEN");
			String PNNUMIDE = getCampoTextual(request, "NNUMIDE");
			BigDecimal PCPAIS = getCampoNumerico(request, "CNACIONALIDAD");
			String PTPAIS = getCampoTextual(request, "TNACIONALIDAD");
			String PTENTIDAD = getCampoTextual(request, "TENTIDAD");
			String PTCARGO = getCampoTextual(request, "HTCARGO");
			Date PFDESVIN = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FDESVIN"), "dd/MM/yyyy");

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_SET_CPEP_SARLATF(PSSARLAFT, PIDENTIFICACION, PCTIPREL,
					PTNOMBRE, PCTIPIDEN, PNNUMIDE, PCPAIS, PTPAIS, PTENTIDAD, PTCARGO, PFDESVIN);
			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper051Service - metodo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	// Inicio IAXIS-3287 01/04/2019
	@SuppressWarnings("all")
	public void m_duplicar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper047Service m_duplicar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSARLAFT = getCampoNumerico(request, "SSARLAFT");

			Map map = pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_DUPLICAR_SARLAFT(PSSARLAFT);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				request.setAttribute("OK_aceptar", "0");

				if (!isEmpty(map.get("MENSAJES")))
					request.getSession().setAttribute("PRETEN_MENSAJES",
							((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES")).get("TERROR"));
				logger.debug(map.get("PSSARLAFTDEST"));
				request.getSession().setAttribute("SARLAFTDUPLIC", map.get("PSSARLAFTDEST"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisper051Service - metodo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_ciiu(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper010Service m_ajax_ciiu");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CCIIU = this.getCampoNumerico(request, "CIIU");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(CCIIU)) {

				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_CIIU(CCIIU);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				Map ciiu = new HashMap();
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					ciiu.put("NCIIUSEC", CCIIU);
					ciiu.put("TCCIIUSEC", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(ciiu);
				} else {
					ciiu.put("NCIIUSEC", "");
					ciiu.put("TCCIIUSEC", "");
					ajax.guardarContenidoFinalAContenedorAjax(ciiu);
				}
			} else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper010Service - mÃ©todo m_ajax_ciiu", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisper047Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);

				String NOMBRE_COMPLETO = "";

				if (OB_PERSONA.get("TNOMBRE") != null) {
					NOMBRE_COMPLETO += OB_PERSONA.get("TNOMBRE").toString() + " ";
				}

				if (OB_PERSONA.get("TAPELLI1") != null) {
					NOMBRE_COMPLETO += OB_PERSONA.get("TAPELLI1").toString() + " ";
				}

				if (OB_PERSONA.get("TAPELLI2") != null) {
					NOMBRE_COMPLETO += OB_PERSONA.get("TAPELLI2").toString();
				}

				if (OB_PERSONA.get("CTIPIDE") != null) {
					OB_PERSONA.put("TIPOID", OB_PERSONA.get("CTIPIDE").toString());
				}

				OB_PERSONA.put("NOMBRE_COMPLETO", NOMBRE_COMPLETO);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axisper047Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	// Fin IAXIS-3287 01/04/2019

}
