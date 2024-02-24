//Revision:# /G2RDWchyy0IZQN86UcIyA== #
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

import axis.jdbc.PAC_IAX_CONTRAGARAN;
import axis.jdbc.PAC_IAX_DESCVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axiscga002Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axiscga002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	private Map dbLeePoliza(HttpServletRequest request) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("OBJETO POLIZA  BBDD ->" + map);
		Map mapPoliza = (HashMap) map.get("RETURN");
		// Map mapPoliza
		return mapPoliza;
	}

	@SuppressWarnings("all")
	public void m_init(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_init");
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_form");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			request.getSession().removeAttribute("ACEPTAR"); // IAXIS-3004 DFR - 21/03/2019

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CONTRAGARAN();
			Map mapGenPoliza = this.dbLeePoliza(request);

			BigDecimal pPSCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal TOMADOR_SPERSON = getCampoNumerico(request, "TOMADOR_SPERSONX");

			String NRADICA_BUSQ = getHiddenCampoTextual(request, "NRADICA_BUSQ");// BARTOLO
			formdata.put("NRADICA_BUSQ", NRADICA_BUSQ);// BARTOLO

			m_detalle(request, pPSCONTGAR, pPNMOVIMI);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_detalle(HttpServletRequest request, BigDecimal mapCONTGAR, BigDecimal mapNMOVIMI) {
		logger.debug("Axiscga002Service m_detalle");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			String CMODOP = getHiddenCampoTextual(request, "CMODOP");// BARTOLO
			formdata.put("CMODOP", CMODOP);// BARTOLO

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_IAX_PERSONA = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal SSEGUROPRODUCCION = getCampoNumerico(request, "SSEGUROPRODUCCION");
			BigDecimal CONTRA_DET_POLIZA = getCampoNumerico(request, "CONTRA_DET_POLIZA");
			if (SCONTGAR == null && NMOVIMI == null) {
				SCONTGAR = mapCONTGAR;
				NMOVIMI = mapNMOVIMI;
			}

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1");
			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;

			// String CMODO = getHiddenCampoTextual(request, "CMODO");

			if (SCONTGAR != null) {
				Map mapContragarantia = pac_IAX_CONTRAGARAN
						.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DET(SCONTGAR, SPERSON);
				Map mapListaCodeudor = pac_IAX_CONTRAGARAN
						.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_CODE(SCONTGAR);
				Map mapListaSeguros = pac_IAX_CONTRAGARAN
						.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_POL(SCONTGAR);
				Map mapListaMov = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_MOV(SCONTGAR);
				Map mapListaDoc = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GET_CONTRAGARAN_DOC(SCONTGAR);

				List<Map> listaContragaran = (List) tratarRETURNyMENSAJES(request, mapContragarantia);
				List CODEUDORES = (List) tratarRETURNyMENSAJES(request, mapListaCodeudor);
				List ASOCIACION_POLIZA = (List) tratarRETURNyMENSAJES(request, mapListaSeguros);
				List MOVIMIENTOS = (List) tratarRETURNyMENSAJES(request, mapListaMov);
				List DOCUMENTOS = (List) tratarRETURNyMENSAJES(request, mapListaDoc);

				// Map mapPersona =
				// pac_IAX_PERSONA.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON,CAGENTE);
				// BigDecimal RETURN =
				// (BigDecimal)tratarRETURNyMENSAJES(request, mapPersona);
				// Map OB_PERSONA=null;
				// if (!isEmpty(mapPersona) && new BigDecimal(0).equals(RETURN))
				// {
				// OB_PERSONA = (Map)mapPersona.get("OBPERSONA");
				// }

				Map CONTRAGARANTIA = null;
				if (listaContragaran != null)
					for (Map map : listaContragaran) {
						CONTRAGARANTIA = map;
					}

				// CODEUDORES

				logger.debug(CONTRAGARANTIA);
				logger.debug(CODEUDORES);
				logger.debug(ASOCIACION_POLIZA);
				logger.debug(MOVIMIENTOS);

				logger.debug(SCONTGAR);
				logger.debug(NMOVIMI);
				logger.debug(DOCUMENTOS);
				// logger.debug(OB_PERSONA);
				// TCS_826 - ACL - 25/02/2019 Se agregan los campos TITCDT y NITTIT
				// TCS_309 - ACL - 14/03/2019 Se agregan los campos NSINIES, PORCENTAJE, FOBLIG,
				// CCUENTA, NCUENTA
				// TCS_309 - ACL - 1803/2019 Se agrega el campo TEXPAGARE, TEXIDEN
				if (getCampoNumerico(request, "btnAceptar") == null) {
					formdata.put("NNUMIDE", CONTRAGARANTIA.get("NNUMIDE"));
					formdata.put("NOMBRE", CONTRAGARANTIA.get("NOMBRE"));
					formdata.put("CONTRAGARANTIA", CONTRAGARANTIA);
					formdata.put("CODEUDORES", CODEUDORES);
					formdata.put("ASOCIACION_POLIZA", ASOCIACION_POLIZA);
					formdata.put("MOVIMIENTOS", MOVIMIENTOS);

					formdata.put("SCONTGAR", SCONTGAR);
					formdata.put("NMOVIMI", NMOVIMI);
					formdata.put("DOCUMENTOS", DOCUMENTOS);

					formdata.put("FEXPEDIC", CONTRAGARANTIA.get("FEXPEDIC"));
					formdata.put("SSEGURO", CONTRAGARANTIA.get("SSEGURO"));
					formdata.put("FVENCIMI", CONTRAGARANTIA.get("FVENCIMI"));
					formdata.put("FVENCIMI_CLASE", CONTRAGARANTIA.get("FVENCIMI_CLASE"));
					formdata.put("FESCRITURA", CONTRAGARANTIA.get("FESCRITURA"));
					formdata.put("FVENCIMI2", CONTRAGARANTIA.get("FVENCIMI2"));
					formdata.put("NSERIE", CONTRAGARANTIA.get("NSERIE"));
					formdata.put("FVENCIMI1", CONTRAGARANTIA.get("FVENCIMI1"));
					formdata.put("TSUCURSAL", CONTRAGARANTIA.get("TSUCURSAL"));
					formdata.put("FCERTLIB", CONTRAGARANTIA.get("FCERTLIB"));
					formdata.put("NPLAZO", CONTRAGARANTIA.get("NPLAZO"));
					formdata.put("CMARCA", CONTRAGARANTIA.get("CMARCA"));

					formdata.put("CCLASE", CONTRAGARANTIA.get("CCLASE"));
					formdata.put("CESTADO", CONTRAGARANTIA.get("CESTADO"));
					formdata.put("CASEGURA", CONTRAGARANTIA.get("CASEGURA"));
					formdata.put("IASEGURA", CONTRAGARANTIA.get("IASEGURA"));

					formdata.put("NMOTOR", CONTRAGARANTIA.get("NMOTOR"));
					formdata.put("CTENEDOR", CONTRAGARANTIA.get("CTENEDOR"));
					formdata.put("IINTERES", CONTRAGARANTIA.get("IINTERES"));
					formdata.put("TDIRECCION", CONTRAGARANTIA.get("TDIRECCION"));
					formdata.put("NMOVIMI", CONTRAGARANTIA.get("NMOVIMI"));
					formdata.put("SPERSON", CONTRAGARANTIA.get("SPERSON"));
					formdata.put("CAGENTE", CONTRAGARANTIA.get("CAGENTE"));
					formdata.put("TOMADOR_SPERSONX", null);
					formdata.put("SCONTGAR", CONTRAGARANTIA.get("SCONTGAR"));
					formdata.put("NCOLOR", CONTRAGARANTIA.get("NCOLOR"));

					formdata.put("NNUMESCR", CONTRAGARANTIA.get("NNUMESCR"));
					formdata.put("CBANCO", CONTRAGARANTIA.get("CBANCO"));
					formdata.put("SPERFIDE", CONTRAGARANTIA.get("SPERFIDE"));
					formdata.put("NOMBREFIDE", CONTRAGARANTIA.get("NOMBREFIDE"));
					formdata.put("IINTCAP", CONTRAGARANTIA.get("IINTCAP"));
					formdata.put("TITCDT", CONTRAGARANTIA.get("TITCDT"));
					formdata.put("NITTIT", CONTRAGARANTIA.get("NITTIT"));
					formdata.put("NSINIES", CONTRAGARANTIA.get("NSINIES"));
					formdata.put("PORCENTAJE", CONTRAGARANTIA.get("PORCENTAJE"));
					formdata.put("FOBLIG", CONTRAGARANTIA.get("FOBLIG"));
					formdata.put("CCUENTA", CONTRAGARANTIA.get("CCUENTA"));
					formdata.put("NCUENTA", CONTRAGARANTIA.get("NCUENTA"));
					formdata.put("TEXPAGARE", CONTRAGARANTIA.get("TEXPAGARE"));
					formdata.put("TEXIDEN", CONTRAGARANTIA.get("TEXIDEN"));

					formdata.put("NOTARIA", CONTRAGARANTIA.get("NOTARIA")); // IAXIS-15586 -- 01/06/2021
					formdata.put("MATRICULA", CONTRAGARANTIA.get("MATRICULA")); // IAXIS-15586 -- 01/06/2021

					formdata.put("NPLACA", CONTRAGARANTIA.get("NPLACA"));
					formdata.put("TDESCRIPCION", CONTRAGARANTIA.get("TDESCRIPCION"));
					formdata.put("TDESCRIPCION_CLASE", CONTRAGARANTIA.get("TDESCRIPINM"));

					formdata.put("CTIPO", CONTRAGARANTIA.get("CTIPO"));

					formdata.put("CAREA", CONTRAGARANTIA.get("CAREA"));// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053
					formdata.put("MODELO", CONTRAGARANTIA.get("MODELO"));// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053

					formdata.put("IVALOR", CONTRAGARANTIA.get("IVALOR"));
					// INI TCS 309 08/03/2019 AP
					formdata.put("TASA", CONTRAGARANTIA.get("TASA"));
					formdata.put("IVA", CONTRAGARANTIA.get("IVA"));
					formdata.put("CPOBLACPAG", CONTRAGARANTIA.get("CPOBLACPAG"));
					formdata.put("TCPOBLACPAG", CONTRAGARANTIA.get("TCPOBLACPAG"));
					formdata.put("CPOBLACPAR", CONTRAGARANTIA.get("CPOBLACPAR"));
					formdata.put("TCPOBLACPAR", CONTRAGARANTIA.get("TCPOBLACPAR"));
					formdata.put("CPOBLACFIR", CONTRAGARANTIA.get("CPOBLACFIR"));
					formdata.put("TCPOBLACFIR", CONTRAGARANTIA.get("TCPOBLACFIR"));
					formdata.put("FINIPAG", CONTRAGARANTIA.get("FINIPAG"));
					formdata.put("FFINPAG", CONTRAGARANTIA.get("FFINPAG"));

					formdata.put("CPROVINPAG", CONTRAGARANTIA.get("CPROVINPAG"));
					formdata.put("CPROVINPAR", CONTRAGARANTIA.get("CPROVINPAR"));
					formdata.put("CPROVINFIR", CONTRAGARANTIA.get("CPROVINFIR"));
					// FIN TCS 309 08/03/2019 AP

					BigDecimal cPais = null;
					BigDecimal cProvincia = null;// Bartolo Herrera 20/03/2019 IAXIS-3243
					BigDecimal cPoblacion = null;// Bartolo Herrera 20/03/2019 IAXIS-3243

					if (CONTRAGARANTIA.get("CPAISINM") != null) {
						formdata.put("CPAIS", CONTRAGARANTIA.get("CPAISINM"));
						cPais = (BigDecimal) CONTRAGARANTIA.get("CPAISINM");// Bartolo Herrera 20/03/2019 IAXIS-3243
					}
					if (CONTRAGARANTIA.get("CPAIS") != null) {
						formdata.put("CPAIS", CONTRAGARANTIA.get("CPAIS"));
						cPais = (BigDecimal) CONTRAGARANTIA.get("CPAIS");// Bartolo Herrera 20/03/2019 IAXIS-3243
					}
					formdata.put("TITCDT", CONTRAGARANTIA.get("TITCDT"));
					formdata.put("NITTIT", CONTRAGARANTIA.get("NITTIT"));
					formdata.put("NSINIES", CONTRAGARANTIA.get("NSINIES"));
					formdata.put("PORCENTAJE", CONTRAGARANTIA.get("PORCENTAJE"));
					formdata.put("FOBLIG", CONTRAGARANTIA.get("FOBLIG"));
					formdata.put("CCUENTA", CONTRAGARANTIA.get("CCUENTA"));
					formdata.put("NCUENTA", CONTRAGARANTIA.get("NCUENTA"));
					formdata.put("TEXPAGARE", CONTRAGARANTIA.get("TEXPAGARE"));
					formdata.put("TEXIDEN", CONTRAGARANTIA.get("TEXIDEN"));

					Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
					logger.debug(map);
					List lpais = (List) tratarRETURNyMENSAJES(request, map, false);

					for (int x = 0; x < lpais.size(); x++) {
						Map p = (Map) lpais.get(x);

						if (p.get("CPAIS").equals(CONTRAGARANTIA.get("CPAIS"))) {
							formdata.put("TPAIS", p.get("TPAIS"));
							break;
						}
					}

					if (CONTRAGARANTIA.get("CPAISVEH") != null) {
						formdata.put("CPAIS", CONTRAGARANTIA.get("CPAISVEH"));
						cPais = (BigDecimal) CONTRAGARANTIA.get("CPAIS");// Bartolo Herrera 20/03/2019 IAXIS-3243
					}

					if (CONTRAGARANTIA.get("CPROVINVEH") != null) {
						formdata.put("CPROVIN", CONTRAGARANTIA.get("CPROVINVEH"));
						cProvincia = (BigDecimal) CONTRAGARANTIA.get("CPROVINVEH");// Bartolo Herrera 20/03/2019
																					// IAXIS-3243
					}
					if (CONTRAGARANTIA.get("CPROVININM") != null) {
						formdata.put("CPROVIN", CONTRAGARANTIA.get("CPROVININM"));
						cProvincia = (BigDecimal) CONTRAGARANTIA.get("CPROVININM");// Bartolo Herrera 20/03/2019
																					// IAXIS-3243
					}

					if (CONTRAGARANTIA.get("CPOBLACVEH") != null) {
						formdata.put("CPOBLAC", CONTRAGARANTIA.get("CPOBLACVEH"));
						cPoblacion = (BigDecimal) CONTRAGARANTIA.get("CPOBLACVEH");// Bartolo Herrera 20/03/2019
																					// IAXIS-3243
					}
					if (CONTRAGARANTIA.get("CPOBLACINM") != null) {
						formdata.put("CPOBLAC", CONTRAGARANTIA.get("CPOBLACINM"));
						cPoblacion = (BigDecimal) CONTRAGARANTIA.get("CPOBLACINM");// Bartolo Herrera 20/03/2019
																					// IAXIS-3243
					}

					PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));// Bartolo Herrera
																								// 20/03/2019 IAXIS-3243

					Map mapProvincia = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROVINCIA(cProvincia,
							cPais);// Bartolo Herrera 20/03/2019 IAXIS-3243

					Map mapPoblacion = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(cProvincia,
							cPoblacion);// Bartolo Herrera 20/03/2019 IAXIS-3243

					formdata.put("TPROVIN", mapProvincia.get("RETURN"));// Bartolo Herrera 20/03/2019 IAXIS-3243
					formdata.put("TPOBLAC", mapPoblacion.get("RETURN"));// Bartolo Herrera 20/03/2019 IAXIS-3243

					formdata.put("CMONEDA", CONTRAGARANTIA.get("CMONEDA"));
					formdata.put("TCAUSA", CONTRAGARANTIA.get("TCAUSA"));
					formdata.put("CORIGEN", CONTRAGARANTIA.get("CORIGEN"));
					formdata.put("DOCUMENTO", CONTRAGARANTIA.get("DOCUMENTO"));
					formdata.put("FCREA", CONTRAGARANTIA.get("FCREA"));
					formdata.put("NEMPRESA", CONTRAGARANTIA.get("NEMPRESA"));
					formdata.put("NRADICA", CONTRAGARANTIA.get("NRADICA"));
					formdata.put("TAUXILIA", CONTRAGARANTIA.get("TAUXILIA"));
					formdata.put("TOBSTEN", CONTRAGARANTIA.get("TOBSTEN"));
					formdata.put("CTIPOV", CONTRAGARANTIA.get("CTIPOVEH"));
				} else {

					llenarDatos(request, formdata, mapCONTGAR, mapNMOVIMI);
					// INI TCS 309 08/03/2019 AP
					formdata.put("IVALOR", CONTRAGARANTIA.get("IVALOR"));
					formdata.put("IINTERES", CONTRAGARANTIA.get("IINTERES"));
					formdata.put("NPLAZO", CONTRAGARANTIA.get("NPLAZO"));
					// FIN TCS 309 08/03/2019 AP
					Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
					List lpais = (List) tratarRETURNyMENSAJES(request, map, false);
					for (int x = 0; x < lpais.size(); x++) {
						Map p = (Map) lpais.get(x);

						if (p.get("CPAIS").equals(CONTRAGARANTIA.get("CPAIS"))) {
							formdata.put("TPAIS", p.get("TPAIS"));
							break;
						}
					}
				}

			} else {
				llenarDatos(request, formdata, mapCONTGAR, mapNMOVIMI);

			}

			formdata.put("CMODO", AbstractDispatchAction.topPila(request, "CMODO"));
			formdata.put("SSEGUROPRODUCCION", SSEGUROPRODUCCION);
			formdata.put("CONTRA_DET_POLIZA", CONTRA_DET_POLIZA);
			cargarCombos(request, formdata);
			// CMODO = getCampoTextual(request, "CMODO");
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	// TCS_826 - ACL - 25/02/2019 Se agregan los campos TITCDT y NITTIT
	// TCS_319 - ACL - 14/03/2019 Se agregan los campos NSINIES, PORCENTAJE, FOBLIG,
	// CCUENTA, NCUENTA
	// TCS_309 - ACL - 18/03/2019 Se agrega el campo TEXPAGARE, TEXIDEN
//onkeypress="return isNumberKey(event)"
	public void llenarDatos(HttpServletRequest request, Map formdata, BigDecimal mapCONTGAR, BigDecimal mapNMOVIMI) {
		BigDecimal SCONTGAR = getCampoNumerico(request, "SCONTGAR");
		BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
		BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
		String TNOMBRE = getCampoTextual(request, "TNOMBRE");

		BigDecimal pPCASEGURA = getCampoNumerico(request, "CASEGURA");
		BigDecimal pPCBANCO = getCampoNumerico(request, "CBANCO");
		BigDecimal pPCCLASE = getHiddenCampoNumerico(request, "CCLASE");// BARTOLO HERRERA 21/03/2019
		BigDecimal pPCCOLOR = getCampoNumerico(request, "NCOLOR");
		BigDecimal pPCESTADO = getCampoNumerico(request, "CESTADO");
		BigDecimal pPCMARCA = getCampoNumerico(request, "CMARCA");
		String pPCMONEDA = getCampoTextual(request, "CMONEDA");
		BigDecimal pPCORIGEN = getCampoNumerico(request, "CORIGEN");
		String pPTCAUSA = getCampoTextual(request, "TCAUSA");
		BigDecimal pPCPAIS = getCampoNumerico(request, "CPAIS");
		BigDecimal pPCPROVIN = getCampoNumerico(request, "CPROVIN");
		BigDecimal pPCPOBLAC = getCampoNumerico(request, "CPOBLAC");
		BigDecimal pPCTENEDOR = getCampoNumerico(request, "CTENEDOR");
		BigDecimal pPCTIPO = getHiddenCampoNumerico(request, "CTIPO");// BARTOLO HERRERA 21/03/2019
		BigDecimal pPCTIPOVEH = getCampoNumerico(request, "CTIPOV");
		String pPDOCUMENTO = getCampoTextual(request, "DOCUMENTO");
		Date pPFCERTLIB = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCERTLIB"), "dd/MM/yyyy");
		Date pPFCREA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCREA"), "dd/MM/yyyy");
		Date pPFESCRITURA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FESCRITURA"), "dd/MM/yyyy");
		Date pPFEXPEDIC = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEXPEDIC"), "dd/MM/yyyy");
		Date pPFVENCIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI"), "dd/MM/yyyy");
		Date pPFVENCIMI_CLASE = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI_CLASE"),
				"dd/MM/yyyy");
		Date pPFVENCIMI1 = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI1"), "dd/MM/yyyy");
		Date pPFVENCIMI2 = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI2"), "dd/MM/yyyy");
		BigDecimal pPIASEGURA = getCampoNumerico(request, "IASEGURA");
		BigDecimal pPIVALOR2 = getCampoNumerico(request, "IVALOR2");
		BigDecimal pPIINTCAP = getCampoNumerico(request, "IINTCAP");
		String pPTITCDT = getCampoTextual(request, "TITCDT");
		String pPNITTIT = getCampoTextual(request, "NITTIT");
		BigDecimal pPNSINIES = getCampoNumerico(request, "NSINIES");
		BigDecimal pPPORCENTAJE = getCampoNumerico(request, "PORCENTAJE");
		Date pPFOBLIG = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FOBLIG"), "dd/MM/yyyy");
		BigDecimal pPCCUENTA = getCampoNumerico(request, "CCUENTA");
		String pPNCUENTA = getCampoTextual(request, "NCUENTA");
		String pPTEXPAGARE = getCampoTextual(request, "TEXPAGARE");
		String pPTEXIDEN = getCampoTextual(request, "TEXIDEN");

		String pPNOTARIA = getCampoTextual(request, "NOTARIA"); // IAXIS-15586 -- 01/06/2021
		logger.debug(pPNOTARIA);
		String pPMATRICULA = getCampoTextual(request, "MATRICULA"); // IAXIS-15586 -- 01/06/2021
		logger.debug(pPMATRICULA);

		BigDecimal pPIINTERES = getCampoNumerico(request, "IINTERES");
		BigDecimal pPIINTERES2 = getCampoNumerico(request, "IINTERES2");
		BigDecimal pPIVALOR = getCampoNumerico(request, "IVALOR");
		BigDecimal pPNEMPRESA = getCampoNumerico(request, "NEMPRESA");
		String pPNMOTOR = getCampoTextual(request, "NMOTOR");
		BigDecimal pPNNUMESCR = getCampoNumerico(request, "NNUMESCR");
		String pPNPLACA = getCampoTextual(request, "NPLACA");// BARTOLO HERRERA
		BigDecimal pPNCOLOR = getCampoNumerico(request, "NCOLOR");
		BigDecimal pPNPLAZO = getCampoNumerico(request, "NPLAZO");
		BigDecimal pPNPLAZO2 = getCampoNumerico(request, "NPLAZO2");
		BigDecimal pPNRADICA = getHiddenCampoNumerico(request, "NRADICA");// BARTOLO
		String pPNSERIE = getCampoTextual(request, "NSERIE");
		String pPSPERFIDE = getCampoTextual(request, "SPERFIDE"); // TCS_823 - ACL - 04/03/2019 Se ajusta el parmetro
																	// SPERFIDE a campo texto

		BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");
		String pPTABLAS = "POL";
		String pPTAUXILIA = getCampoTextual(request, "TAUXILIA");
		String NOMBREFIDE = getCampoTextual(request, "NOMBREFIDE");
		BigDecimal pPCIMPRESO = null;
		String pPTDESCRIPCION = getCampoTextual(request, "TDESCRIPCION");
		String pPTDESCRIPCION_CLASE = getCampoTextual(request, "TDESCRIPCION_CLASE");
		String pPTDIRECCION = getCampoTextual(request, "TDIRECCION");
		String pPTOBSTEN = getCampoTextual(request, "TOBSTEN");
		String pPTSUCURSAL = getCampoTextual(request, "TSUCURSAL");
		String NOMBRE = getCampoTextual(request, "NOMBRE");
		BigDecimal NNUMIDE = getCampoNumerico(request, "NNUMIDE");

		BigDecimal TOMADOR_SPERSON = getCampoNumerico(request, "TOMADOR_SPERSONX");
		String TOMADOR_NNUMIDE = getCampoTextual(request, "TOMADOR_NNUMIDEX");
		String TOMADOR_TNOMBRE1 = getCampoTextual(request, "TOMADOR_TNOMBRE1X");
		String TOMADOR_TAPELLI1 = getCampoTextual(request, "TOMADOR_TAPELLI1X");
		BigDecimal CONTRA_DET_POLIZA = getCampoNumerico(request, "CONTRA_DET_POLIZA");
		String TASA = getCampoTextual(request, "TASA");
		String IVA = getCampoTextual(request, "IVA");
		BigDecimal CPOBLACPAG = getCampoNumerico(request, "CPOBLACPAG");
		Date MODELO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "MODELO"), "dd/MM/yyyy");// BARTOLO
																												// HERRERA
																												// 08/03/2019
																												// ---
																												// IAXIS-3053
		Date FINIPAG = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FINIPAG"), "dd/MM/yyyy");
		Date FFINPAG = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FFINPAG"), "dd/MM/yyyy");
		BigDecimal CPOBLACPAR = getCampoNumerico(request, "CPOBLACPAR");
		BigDecimal CPOBLACFIR = getCampoNumerico(request, "CPOBLACFIR");
		BigDecimal CAREA = getHiddenCampoNumerico(request, "CAREA");// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053

		if (SCONTGAR == null && NMOVIMI == null) {
			SCONTGAR = mapCONTGAR;
			NMOVIMI = mapNMOVIMI;
		}

		formdata.put("CONTRA_DET_POLIZA", CONTRA_DET_POLIZA);
		formdata.put("TOMADOR_SPERSONX", TOMADOR_SPERSON);
		formdata.put("TOMADOR_NNUMIDEX", TOMADOR_NNUMIDE);
		formdata.put("TOMADOR_TNOMBRE1X", TOMADOR_TNOMBRE1);
		formdata.put("TOMADOR_TAPELLI1X", TOMADOR_TAPELLI1);

		formdata.put("NNUMIDE", NNUMIDE);
		formdata.put("NOMBRE", NOMBRE);

		formdata.put("SSEGURO", pPSSEGURO);
		formdata.put("NOMBRE", TNOMBRE);
		formdata.put("CCLASE", pPCCLASE);
		formdata.put("CTIPO", pPCTIPO);
		formdata.put("SCONTGAR", SCONTGAR);
		formdata.put("NMOVIMI", NMOVIMI);
		formdata.put("CASEGURA", pPCASEGURA);
		formdata.put("CBANCO", pPCBANCO);

		formdata.put("NCOLOR", pPCCOLOR);
		formdata.put("CESTADO", pPCESTADO);
		formdata.put("CMARCA", pPCMARCA);
		formdata.put("CMONEDA", pPCMONEDA);
		formdata.put("CORIGEN", pPCORIGEN);
		formdata.put("TCAUSA", pPTCAUSA);
		formdata.put("CPAIS", pPCPAIS);
		formdata.put("CPROVIN", pPCPROVIN);
		formdata.put("CPOBLAC", pPCPOBLAC);
		formdata.put("CTENEDOR", pPCTENEDOR);

		formdata.put("CTIPOV", pPCTIPOVEH);
		formdata.put("DOCUMENTO", pPDOCUMENTO);
		formdata.put("FCERTLIB", pPFCERTLIB);
		formdata.put("FCREA", pPFCREA);
		formdata.put("FESCRITURA", pPFESCRITURA);
		formdata.put("FEXPEDIC", pPFEXPEDIC);
		formdata.put("FVENCIMI", pPFVENCIMI);
		formdata.put("FVENCIMI_CLASE", pPFVENCIMI_CLASE);
		formdata.put("FVENCIMI1", pPFVENCIMI1);
		formdata.put("FVENCIMI2", pPFVENCIMI2);
		formdata.put("IASEGURA", pPIASEGURA);
		formdata.put("IVALOR2", pPIVALOR2);
		formdata.put("IINTCAP", pPIINTCAP);
		formdata.put("TITCDT", pPTITCDT);
		formdata.put("NITTIT", pPNITTIT);
		formdata.put("NSINIES", pPNSINIES);
		formdata.put("PORCENTAJE", pPPORCENTAJE);
		formdata.put("FOBLIG", pPFOBLIG);
		formdata.put("CCUENTA", pPCCUENTA);
		formdata.put("NCUENTA", pPNCUENTA);
		formdata.put("TEXPAGARE", pPTEXPAGARE);
		formdata.put("TEXIDEN", pPTEXIDEN);
		formdata.put("IINTERES", pPIINTERES);
		formdata.put("IINTERES2", pPIINTERES2);
		formdata.put("NEMPRESA", pPNEMPRESA);
		formdata.put("IVALOR", pPIVALOR);
		formdata.put("NMOTOR", pPNMOTOR);
		formdata.put("NNUMESCR", pPNNUMESCR);
		formdata.put("NPLACA", pPNPLACA);
		formdata.put("NCOLOR", pPNCOLOR);
		formdata.put("NPLAZO", pPNPLAZO);
		formdata.put("NPLAZO2", pPNPLAZO2);
		formdata.put("NRADICA", pPNRADICA);
		formdata.put("NSERIE", pPNSERIE);
		formdata.put("SPERFIDE", pPSPERFIDE);
		formdata.put("NOMBREFIDE", NOMBREFIDE);
		formdata.put("SPERSON", pPSPERSON);
		formdata.put("TAUXILIA", pPTAUXILIA);
		formdata.put("TDESCRIPCION", pPTDESCRIPCION);
		formdata.put("TDESCRIPCION_CLASE", pPTDESCRIPCION_CLASE);
		formdata.put("TDIRECCION", pPTDIRECCION);
		formdata.put("TOBSTEN", pPTOBSTEN);
		formdata.put("TSUCURSAL", pPTSUCURSAL);
		formdata.put("TASA", TASA);
		formdata.put("IVA", IVA);
		formdata.put("CPOBLACPAG", CPOBLACPAG);
		formdata.put("FINIPAG", FINIPAG);
		formdata.put("FFINPAG", FFINPAG);
		formdata.put("CPOBLACPAR", CPOBLACPAR);
		formdata.put("CPOBLACFIR", CPOBLACFIR);
		formdata.put("CAREA", CAREA);// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053
		formdata.put("MODELO", MODELO);// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053

		formdata.put("NOTARIA", pPNOTARIA); // IAXIS-15586 -- 01/06/2021
		formdata.put("MATRICULA", pPMATRICULA); // IAXIS-15586 -- 01/06/2021

	}

	@SuppressWarnings("all")
	public void cargarCombos(HttpServletRequest request, Map formdata) {
		logger.debug("Axiscga002Service cargarCombos");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal SCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");

			BigDecimal pPCTIPO = getCampoNumerico(request, "CTIPO");

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map mapLs = null;
			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001035));
			List LS_TIPO_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_TIPO_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_TIPO_CONTRAGARANTIA",
					!isEmpty(LS_TIPO_CONTRAGARANTIA) ? LS_TIPO_CONTRAGARANTIA : new ArrayList());

			if (pPCTIPO == null)
				pPCTIPO = new BigDecimal(1);

			// mapLs=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			// BigDecimal(8001036));--
			// mapLs=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(pCLAVE)
			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES_DEP(usuario.getCempres(), pPCTIPO,
					new BigDecimal(1), new BigDecimal(8001036));
			List LS_CLASE_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_CLASE_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_CLASE_CONTRAGARANTIA",
					!isEmpty(LS_CLASE_CONTRAGARANTIA) ? LS_CLASE_CONTRAGARANTIA : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS_COND("FILTRO_MONEDAS");
			List LS_MONEDAS = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_MONEDAS -----------------> " + mapLs);
			request.setAttribute("LS_MONEDAS", !isEmpty(LS_MONEDAS) ? LS_MONEDAS : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001037));
			List LS_TENEDOR = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_TENEDOR -----------------> " + mapLs);
			request.setAttribute("LS_TENEDOR", !isEmpty(LS_TENEDOR) ? LS_TENEDOR : new ArrayList());

			// TCS_818 - ACL - 20/02/2019 - Se aade condicion para la lista
			// LS_ESTADO_CONTRAGARANTIA
			// mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new
			// BigDecimal(8001038));
			if (SCONTGAR == null) {
				mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001182));
			} else {
				mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001038));
			}
			List LS_ESTADO_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_ESTADO_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_ESTADO_CONTRAGARANTIA",
					!isEmpty(LS_ESTADO_CONTRAGARANTIA) ? LS_ESTADO_CONTRAGARANTIA : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001039));
			List LS_ORIGEN_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_ORIGEN_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_ORIGEN_CONTRAGARANTIA",
					!isEmpty(LS_ORIGEN_CONTRAGARANTIA) ? LS_ORIGEN_CONTRAGARANTIA : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS(null, null);
			List LS_BANCOS = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_BANCOS -----------------> " + mapLs);
			request.setAttribute("LS_BANCOS", !isEmpty(LS_BANCOS) ? LS_BANCOS : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001040));
			List LS_MARCA_VEHICULO = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_MARCA_VEHICULO -----------------> " + mapLs);
			request.setAttribute("LS_MARCA_VEHICULO",
					!isEmpty(LS_MARCA_VEHICULO) ? LS_MARCA_VEHICULO : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001041));
			List LS_TIPO_SERVICIO_VEHICULO = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_TIPO_SERVICIO_VEHICULO -----------------> " + mapLs);
			request.setAttribute("LS_TIPO_SERVICIO_VEHICULO",
					!isEmpty(LS_TIPO_SERVICIO_VEHICULO) ? LS_TIPO_SERVICIO_VEHICULO : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(440));
			List LS_COLOR_VEHICULO = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_COLOR_VEHICULO -----------------> " + mapLs);
			request.setAttribute("LS_COLOR_VEHICULO",
					!isEmpty(LS_COLOR_VEHICULO) ? LS_COLOR_VEHICULO : new ArrayList());

			// ACL - TCS_309 - 18/03/2019 - Se agrega listado de clase de cuenta
			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002012));
			List LS_CLASE_CUENTA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_CLASE_CUENTA -----------------> " + mapLs);
			request.setAttribute("LS_CLASE_CUENTA", !isEmpty(LS_CLASE_CUENTA) ? LS_CLASE_CUENTA : new ArrayList());
			// inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053

			// PAC_IAX_COMPANIAS pac_axis_companias = new
			// PAC_IAX_COMPANIAS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			// Map map = pac_axis_companias.ejecutaPAC_IAX_COMPANIAS__F_GET_COMPANIAS();
			// logger.debug(map);

			// List LS_ASEGURADORA = (List)tratarRETURNyMENSAJES(request,map,false);

			Map mapAseg = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_COASEGURADORAS();
			List LS_ASEGURADORA = (List) tratarRETURNyMENSAJES(request, mapAseg, false);
			// formdata.put("companias", companias);

			// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053

			request.setAttribute("LS_ASEGURADORA", !isEmpty(LS_ASEGURADORA) ? LS_ASEGURADORA : new ArrayList());

			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001043));
			List LS_TIPO_DOCUMENTO_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_TIPO_DOCUMENTO_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_TIPO_DOCUMENTO_CONTRAGARANTIA",
					!isEmpty(LS_TIPO_DOCUMENTO_CONTRAGARANTIA) ? LS_TIPO_DOCUMENTO_CONTRAGARANTIA : new ArrayList());

			// inicio Bartolo Herrera 11-03-2019 --- IAXIS-3053
			mapLs = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002011));
			List LS_AREA_CONTRAGARANTIA = (List) tratarRETURNyMENSAJES(request, mapLs);
			logger.debug("LS_AREA_CONTRAGARANTIA -----------------> " + mapLs);
			request.setAttribute("LS_AREA_CONTRAGARANTIA",
					!isEmpty(LS_AREA_CONTRAGARANTIA) ? LS_AREA_CONTRAGARANTIA : new ArrayList());
			// fin Bartolo Herrera 11-03-2019 --- IAXIS-3053

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo cargarCombos", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	// TCS_826 - ACL - 25/02/2019 Se agregan los campos TITCDT y NITTIT
	// TCS_309 - ACL - 14/03/2019 Se agregan los campos NSINIES, PORCENTAJE, FOBLIG,
	// CCUENTA, NCUENTA
	// TCS_309 - ACL - 18/03/2019 Se agrega el campo TEXPAGARE Y TEXIDEN
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_aceptar");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal SSEGUROPRODUCCION = getCampoNumerico(request, "SSEGUROPRODUCCION");
			BigDecimal pPSSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal pPSCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "NMOVIMI");
			BigDecimal pPCASEGURA = getCampoNumerico(request, "CASEGURA");
			BigDecimal pPCBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal pPCCLASE = getHiddenCampoNumerico(request, "CCLASE");// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053
			BigDecimal pPCCOLOR = getCampoNumerico(request, "NCOLOR");
			BigDecimal pPCESTADO = getHiddenCampoNumerico(request, "CESTADO");
			BigDecimal pPCMARCA = getCampoNumerico(request, "CMARCA");
			String pPCMONEDA = getCampoTextual(request, "CMONEDA");
			BigDecimal pPCORIGEN = getCampoNumerico(request, "CORIGEN");
			String pPTCAUSA = getCampoTextual(request, "TCAUSA");
			BigDecimal pPCPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal pPCPROVIN = getCampoNumerico(request, "CPROVIN");
			BigDecimal pPCPOBLAC = getCampoNumerico(request, "CPOBLAC");
			BigDecimal pPCTENEDOR = getHiddenCampoNumerico(request, "CTENEDOR");
			BigDecimal pPCTIPO = getHiddenCampoNumerico(request, "CTIPO");// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053
			Date MODELO = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "MODELO"), "dd/MM/yyyy");// BARTOLO
																													// HERRERA
																													// 08/03/2019
																													// ---
																													// IAXIS-3053
			BigDecimal CAREA = getHiddenCampoNumerico(request, "CAREA");// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053
			BigDecimal pPCTIPOVEH = getCampoNumerico(request, "CTIPOV");
			String pPDOCUMENTO = getCampoTextual(request, "DOCUMENTO");
			Date pPFCERTLIB = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCERTLIB"), "dd/MM/yyyy");
			Date pPFCREA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FCREA"), "dd/MM/yyyy");
			Date pPFESCRITURA = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FESCRITURA"),
					"dd/MM/yyyy");
			Date pPFEXPEDIC = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FEXPEDIC"), "dd/MM/yyyy");
			Date pPFVENCIMI = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI"), "dd/MM/yyyy");
			Date pPFVENCIMI_CLASE = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI_CLASE"),
					"dd/MM/yyyy");
			Date pPFVENCIMI1 = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI1"),
					"dd/MM/yyyy");
			Date pPFVENCIMI2 = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FVENCIMI2"),
					"dd/MM/yyyy");
			BigDecimal pPIASEGURA = getCampoNumerico(request, "IASEGURA");
			BigDecimal pPIVALOR2 = getCampoNumerico(request, "IVALOR2");
			BigDecimal pPIINTCAP = getCampoNumerico(request, "IINTCAP");
			String pPTITCDT = getCampoTextual(request, "TITCDT");
			String pPNITTIT = getCampoTextual(request, "NITTIT");
			BigDecimal pPNSINIES = getCampoNumerico(request, "NSINIES");
			BigDecimal pPPORCENTAJE = getCampoNumerico(request, "PORCENTAJE");
			Date pPFOBLIG = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FOBLIG"), "dd/MM/yyyy");
			BigDecimal pPCCUENTA = getCampoNumerico(request, "CCUENTA");
			String pPNCUENTA = getCampoTextual(request, "NCUENTA");
			String pPTEXPAGARE = getCampoTextual(request, "TEXPAGARE");
			String pPTEXIDEN = getCampoTextual(request, "TEXIDEN");
			String pPNOTARIA = getCampoTextual(request, "NOTARIA"); // -- IAXIS-15586 -- 01/06/2021
			logger.debug(pPNOTARIA);
			String pPMATRICULA = getCampoTextual(request, "MATRICULA"); // -- IAXIS-15586 -- 01/06/2021
			logger.debug(pPMATRICULA);
			BigDecimal pPIINTERES = getCampoNumerico(request, "IINTERES");
			BigDecimal pPIINTERES2 = getCampoNumerico(request, "IINTERES2");
			BigDecimal pPIVALOR = getCampoNumerico(request, "IVALOR");
			BigDecimal pPNEMPRESA = getCampoNumerico(request, "NEMPRESA");
			String pPNMOTOR = getCampoTextual(request, "NMOTOR");
			BigDecimal pPNNUMESCR = getCampoNumerico(request, "NNUMESCR");
			String pPNPLACA = getCampoTextual(request, "NPLACA");// BARTOLO HERRERA 08/03/2019 --- IAXIS-3053
			BigDecimal pPNCOLOR = getCampoNumerico(request, "NCOLOR");
			BigDecimal pPNPLAZO = getCampoNumerico(request, "NPLAZO");
			BigDecimal pPNPLAZO2 = getCampoNumerico(request, "NPLAZO2");
			BigDecimal pPNRADICA = getCampoNumerico(request, "NRADICA");
			String pPNSERIE = getCampoTextual(request, "NSERIE");
			String pPSPERFIDE = getCampoTextual(request, "SPERFIDE"); // TCS_823 - ACL - 04/03/2019 Se ajusta el
																		// parmetro SPERFIDE a campo texto
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON");

			BigDecimal TOMADOR_SPERSON = getCampoNumerico(request, "TOMADOR_SPERSONX");
			String TOMADOR_NNUMIDE = getCampoTextual(request, "TOMADOR_NNUMIDEX");
			String TOMADOR_TNOMBRE1 = getCampoTextual(request, "TOMADOR_TNOMBRE1X");
			String TOMADOR_TAPELLI1 = getCampoTextual(request, "TOMADOR_TAPELLI1X");

			if (pPSPERSON == null && TOMADOR_SPERSON == null) {

				AbstractDispatchAction.guardarMensaje(request,
						Traductor.traducir(AxisBaseService.getLocale(request).toString(), "1000063"), null,
						Constantes.MENSAJE_INFO);
				m_detalle(request, pPSCONTGAR, pPNMOVIMI);
			} else {
				String pPTABLAS = "POL";
				if (pPSPERSON == null)
					pPSPERSON = TOMADOR_SPERSON;
				String pPTAUXILIA = getCampoTextual(request, "TAUXILIA");
				BigDecimal pPCIMPRESO = null;
				String pPTDESCRIPCION = getCampoTextual(request, "TDESCRIPCION");
				String pPTDESCRIPCION_CLASE = getCampoTextual(request, "TDESCRIPCION_CLASE");
				String pPTDIRECCION = getCampoTextual(request, "TDIRECCION");
				String pPTOBSTEN = getCampoTextual(request, "TOBSTEN");
				String pPTSUCURSAL = getCampoTextual(request, "TSUCURSAL");
				String pPTASA = getCampoTextual(request, "TASA");
				String pPIVA = getCampoTextual(request, "IVA");
				Date pPFINIPAG = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FINIPAG"),
						"dd/MM/yyyy");
				Date pPFFINPAG = AxisBaseService.stringToSqlDate(this.getCampoTextual(request, "FFINPAG"),
						"dd/MM/yyyy");
				BigDecimal pPCPOBLACPAG = getCampoNumerico(request, "CPOBLACPAG");
				BigDecimal pPCPROVINPAG = getCampoNumerico(request, "CPROVINPAG");
				BigDecimal pPCPOBLACPAR = getCampoNumerico(request, "CPOBLACPAR");
				BigDecimal pPCPROVINPAR = getCampoNumerico(request, "CPROVINPAR");
				BigDecimal pPCPOBLACFIR = getCampoNumerico(request, "CPOBLACFIR");
				BigDecimal pPCPROVINFIR = getCampoNumerico(request, "CPROVINFIR");
				Object pMENSAJES = new Object();
				if (pPNPLAZO == null && pPNPLAZO2 != null) {
					pPNPLAZO = pPNPLAZO2;
				}
				if (pPIVALOR == null && pPIVALOR2 != null) {
					pPIVALOR = pPIVALOR2;
				}
				if (pPIINTERES == null && pPIINTERES2 != null) {
					pPIINTERES = pPIINTERES2;
				}

				PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_GRABAR_CONTRAGARANTIA(pPSCONTGAR,
						pPCASEGURA, pPCBANCO, pPCCLASE, pPCESTADO, pPCMARCA, pPCTIPOVEH, pPCMONEDA, pPCORIGEN, pPTCAUSA,
						pPCPAIS, pPCPROVIN, pPCPOBLAC, pPCTENEDOR, pPCTIPO, CAREA, pPDOCUMENTO, pPFCERTLIB, pPFCREA, // BARTOLO
																														// HERRERA
																														// 08/03/2019
																														// ---
																														// IAXIS-3053
						pPFESCRITURA, pPFEXPEDIC, pPFVENCIMI, pPFVENCIMI1, pPFVENCIMI2, pPIASEGURA, pPIINTCAP,
						pPIINTERES, pPIVALOR, pPNEMPRESA, pPNMOTOR, pPNNUMESCR, pPNPLACA, pPNCOLOR, pPNPLAZO, pPNRADICA,
						pPNSERIE, pPSPERFIDE, pPSPERSON, pPTABLAS, pPTAUXILIA, pPCIMPRESO, pPTDESCRIPCION,
						pPTDESCRIPCION_CLASE, pPTDIRECCION, pPTOBSTEN, pPTSUCURSAL, pPTITCDT, pPNITTIT, MODELO, pPTASA,
						pPIVA, pPFINIPAG, pPFFINPAG, pPCPOBLACPAG, pPCPROVINPAG, pPCPOBLACPAR, pPCPROVINPAR,
						pPCPOBLACFIR, pPCPROVINFIR, pPNSINIES, pPPORCENTAJE, pPFOBLIG, pPCCUENTA, pPNCUENTA,
						pPTEXPAGARE, pPTEXIDEN, pPNOTARIA, pPMATRICULA);
				this.tratarRETURNyMENSAJES(request, map);
				formdata.put("NRADICA", map.get("PSCONTGAR_OUT"));
				if (map.get("PSCONTGAR_OUT") != null && map.get("PNMOVIMI_OUT") != null) {
					if (SSEGUROPRODUCCION != null) {
						Map mapPol = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_POL(
								new BigDecimal(map.get("PSCONTGAR_OUT").toString()), SSEGUROPRODUCCION,
								new BigDecimal(map.get("PNMOVIMI_OUT").toString()), "EST");
						this.tratarRETURNyMENSAJES(request, mapPol);
					}
					formdata.put("CMODOP", "GENERAL");
					m_detalle(request, new BigDecimal(map.get("PSCONTGAR_OUT").toString()),
							new BigDecimal(map.get("PNMOVIMI_OUT").toString()));
					request.getSession().setAttribute("ACEPTAR", 1); // IAXIS-3004 DFR - 21/03/2019
				} else {
					m_detalle(request, pPSCONTGAR, pPNMOVIMI);
					request.getSession().setAttribute("ACEPTAR", 1); // IAXIS-3004 DFR - 21/03/2019
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_ins_codeu(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_ins_codeu");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPSCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal pPSPERSON = getCampoNumerico(request, "SPERSON_CODEUDORES");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "NMOVIMI");

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_CODEU(pPSCONTGAR, pPSPERSON,
					pPNMOVIMI);
			this.tratarRETURNyMENSAJES(request, map);
			// Map INS_CONTRAGARAN_CODEU =(Map)tratarRETURNyMENSAJES(request,
			// map);
			// List CODEUDORES =(List)tratarRETURNyMENSAJES(request, map);
			logger.debug("INS_CONTRAGARAN_CODEU -----------------> " + map);
			// request.setAttribute("CODEUDORES",
			// !isEmpty(CODEUDORES)?CODEUDORES:new ArrayList());

			m_detalle(request, pPSCONTGAR, pPNMOVIMI);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_ins_codeu", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_del_codeu(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_del_codeu");
		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			BigDecimal SCONTGAR = getCampoNumerico(request, "__SCONTGAR");
			BigDecimal SPERSON = getCampoNumerico(request, "__SPERSON");
			BigDecimal NMOVIMI = getCampoNumerico(request, "__NMOVIMI");

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_CODEU(SCONTGAR, SPERSON,
					NMOVIMI);
			this.tratarRETURNyMENSAJES(request, map);

			m_detalle(request, SCONTGAR, NMOVIMI);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_del_codeu", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_ins_pol(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_ins_pol");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPSCONTGAR = getCampoNumerico(request, "SCONTGAR");
			BigDecimal PSSEGURO = getHiddenCampoNumerico(request, "SSEGPOL2");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "NMOVIMI");

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_INS_CONTRAGARAN_POL(pPSCONTGAR, PSSEGURO,
					pPNMOVIMI, "POL");
			this.tratarRETURNyMENSAJES(request, map);
			// Map INS_CONTRAGARAN_CODEU =(Map)tratarRETURNyMENSAJES(request,
			// map);
			// List CODEUDORES =(List)tratarRETURNyMENSAJES(request, map);
			logger.debug("INS_CONTRAGARAN_CODEU -----------------> " + map);
			// request.setAttribute("CODEUDORES",
			// !isEmpty(CODEUDORES)?CODEUDORES:new ArrayList());

			m_detalle(request, pPSCONTGAR, pPNMOVIMI);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_ins_pol", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	@SuppressWarnings("all")
	public void m_del_pol(HttpServletRequest request) {
		logger.debug("Axiscga002Service m_ins_pol");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			BigDecimal pPSCONTGAR = getCampoNumerico(request, "X__SCONTGAR");
			BigDecimal PSSEGURO = getHiddenCampoNumerico(request, "X__SSEGURO");
			BigDecimal pPNMOVIMI = getCampoNumerico(request, "X__NMOVIMI");

			PAC_IAX_CONTRAGARAN pac_IAX_CONTRAGARAN = new PAC_IAX_CONTRAGARAN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_IAX_CONTRAGARAN.ejecutaPAC_IAX_CONTRAGARANTIAS__F_DEL_CONTRAGARAN_POL(pPSCONTGAR, PSSEGURO,
					pPNMOVIMI);
			this.tratarRETURNyMENSAJES(request, map);
			// Map INS_CONTRAGARAN_CODEU =(Map)tratarRETURNyMENSAJES(request,
			// map);
			// List CODEUDORES =(List)tratarRETURNyMENSAJES(request, map);
			logger.debug("INS_CONTRAGARAN_CODEU -----------------> " + map);
			// request.setAttribute("CODEUDORES",
			// !isEmpty(CODEUDORES)?CODEUDORES:new ArrayList());

			m_detalle(request, pPSCONTGAR, pPNMOVIMI);
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscga002Service - mtodo m_ins_pol", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/*****
	 * Ajax
	 */

	public void m_ajax_get_persona(HttpServletRequest request) {
		logger.debug("Axiscga002Service AJAX m_ajax_get_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");

			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug("--> persona:" + OB_PERSONA);

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axiscga002Service m_ajax_existe_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[2];
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
	/*
	 * public void m_descargar_reporte(HttpServletRequest request, Axiscga002Action
	 * thisAction) { logger.debug("Axisctr193Service m_descargar_reporte"); Map map
	 * = new HashMap(); Map mapINFORME = new HashMap();
	 * 
	 * UsuarioBean usuario = (UsuarioBean)
	 * request.getSession().getAttribute(Constantes.USUARIO); HashMap formdata =
	 * (HashMap) request.getAttribute(Constantes.FORMDATA);
	 * 
	 * String CMAP = "pagareContragaran"; BigDecimal pPSCONTGAR =
	 * getCampoNumerico(request, "SCONTGARIMP"); String CEXPORT = "PDF"; Enumeration
	 * parameters = request.getParameterNames(); String p = null; HashMap<String,
	 * String> PARAMETROS__ = new HashMap(); HashMap<String, String> TPARAMETROS__ =
	 * new HashMap(); BigDecimal batch = new BigDecimal(0); BigDecimal CIDIOMA =
	 * usuario.getCidioma(); String CEMAIL = null;
	 * 
	 * if (pPSCONTGAR != null) { PARAMETROS__.put("PSCONTGAR", "" + pPSCONTGAR);
	 * TPARAMETROS__.put("TPSCONTGAR", "1"); } // BigDecimal pPCTIPO =
	 * getCampoNumerico(request, "CEXCEPCION1"); try {
	 * 
	 * TIaxInfo params = this.generarT_IAX_Info(request, usuario, PARAMETROS__,
	 * TPARAMETROS__); mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection)
	 * request.getAttribute(Constantes.DB01CONN))
	 * .ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, usuario.getCempres(),
	 * CEXPORT, params, CIDIOMA, batch, CEMAIL, new BigDecimal(0));
	 * logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
	 * map.put("LIST_FICHEROS", mapINFORME); logger.debug("map:" + map);
	 * request.setAttribute(Constantes.AJAXCONTAINER, map);
	 * 
	 * } catch (Exception e) {
	 * logger.error("Error en el servicio Axiscga002Service - mtodo m_generar_list",
	 * e); thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString()
	 * }, Constantes.MENSAJE_ERROR); } finally {
	 * this.f_Cargar_Propiedades_Pantalla(request, whoami(this)); } }
	 */

	// INI TCS 309 08/03/2019 AP
	public void m_ajax_poblacion(HttpServletRequest request, Axiscga002Action thisAction) {
		logger.debug("Axiscga002Service m_ajax_poblacion");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String op = this.getCampoTextual(request, "op");

			BigDecimal pPCPOBLACPAG = this.getCampoNumerico(request, "CPOBLACPAG");
			BigDecimal pPCPROVINPAG = this.getCampoNumerico(request, "CPROVINPAG");

			BigDecimal pPCPOBLACPAR = this.getCampoNumerico(request, "CPOBLACPAR");
			BigDecimal pPCPROVINPAR = this.getCampoNumerico(request, "CPROVINPAR");

			BigDecimal pPCPOBLACFIR = this.getCampoNumerico(request, "CPOBLACFIR");
			BigDecimal pPCPROVINFIR = this.getCampoNumerico(request, "CPROVINFIR");

			PAC_IAX_DESCVALORES pac_axis_persona = new PAC_IAX_DESCVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLACPAG")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(pPCPROVINPAG, pPCPOBLACPAG);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();

					poblacion.put("CPOBLACPAG", pPCPOBLACPAG);
					poblacion.put("TCPOBLACPAG", map.get("RETURN"));
					formdata.put("CPOBLACPAG", pPCPOBLACPAG);
					formdata.put("TCPOBLACPAG", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLACPAG", pPCPOBLACPAG);
					formdata.put("CPOBLACPAG", pPCPOBLACPAG);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLACPAR")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(pPCPROVINPAR, pPCPOBLACPAR);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();

					poblacion.put("CPOBLACPAR", pPCPOBLACPAR);
					poblacion.put("TCPOBLACPAR", map.get("RETURN"));
					formdata.put("CPOBLACPAR", pPCPOBLACPAR);
					formdata.put("TCPOBLACPAR", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLACPAR", pPCPOBLACPAR);
					formdata.put("CPOBLACPAR", pPCPOBLACPAR);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			} else if (!isEmpty(op) && op.equalsIgnoreCase("CPOBLACFIR")) {
				Map map = pac_axis_persona.ejecutaPAC_IAX_DESCVALORES__F_GET_DESCPROBLACION(pPCPROVINFIR, pPCPOBLACFIR);
				logger.debug(map);
				ajax.rellenarPlAContenedorAjax(map);
				if (!isEmpty(map) && !isEmpty(map.get("RETURN")) && !"**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();

					poblacion.put("CPOBLACFIR", pPCPOBLACFIR);
					poblacion.put("TCPOBLACFIR", map.get("RETURN"));
					formdata.put("CPOBLACFIR", pPCPOBLACFIR);
					formdata.put("TCPOBLACFIR", map.get("RETURN"));
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				} else if ("**".equals((String) map.get("RETURN"))) {
					Map poblacion = new HashMap();
					poblacion.put("CPOBLACFIR", pPCPOBLACFIR);
					formdata.put("CPOBLACFIR", pPCPOBLACFIR);
					poblacion.put(Constantes.OPERACION_AJAX_ERROR, Constantes.OPERACION_AJAX_ERROR);
					ajax.guardarContenidoFinalAContenedorAjax(poblacion);
				}
			}

			else {
				ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper005Service - m�todo m_ajax_direccion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
	// FIN TCS 309 08/03/2019 AP
}
