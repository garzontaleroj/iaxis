package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MANDATOS;
import axis.mvc.control.axis.Axisman003Action;
import axis.util.Constantes;

public class Axisman003Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisman003Service.class);

	public void m_form(HttpServletRequest request, Axisman003Action thisAction) {
		logger.debug("Axisman003Service m_form");

		this.formattingNumericValues(request);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			request.getSession().setAttribute("CONSULTA", "1");
			BigDecimal pPMANDATO = this.getCampoNumerico(request, "NUMEROFOLIO");
			if (pPMANDATO != null) {
				PAC_IAX_MANDATOS pac_iax_mandatos = new PAC_IAX_MANDATOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				procesaForm(request, pac_iax_mandatos, pPMANDATO);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	public void m_upload_file(HttpServletRequest request, Axisman003Action thisAction) {
		logger.debug("Axisman003Service m_form");
		this.formattingNumericValues(request);

		try {
			PAC_IAX_MANDATOS pac_iax_mandatos = new PAC_IAX_MANDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// subir fichero
			BigDecimal idFichero = (BigDecimal) request.getSession().getAttribute("IDFICHERO");
			BigDecimal pPMANDATO = this.getCampoNumerico(request, "NUMEROFOLIO");
			Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_SET_MANDATOS_DOCUMENTOS(idFichero, pPMANDATO);
			tratarRETURNyMENSAJES(request, map);

			// recargar formulario
			procesaForm(request, pac_iax_mandatos, pPMANDATO);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisman003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
			this.gestionarOrdenacionTablas(request);
		}
	}

	private void procesaForm(HttpServletRequest request, PAC_IAX_MANDATOS pac_iax_mandatos, BigDecimal pPMANDATO)
			throws Exception {
		this.formattingNumericValues(request);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		getDatosMandato(request, formdata, pPMANDATO, pac_iax_mandatos);
		getDocumentosMandato(request, formdata, pPMANDATO, pac_iax_mandatos);
		getEstadosMandato(request, formdata, pPMANDATO, pac_iax_mandatos);
		getPolizasMandato(request, formdata, pPMANDATO, pac_iax_mandatos);
		getGestionesMandato(request, formdata, pPMANDATO, pac_iax_mandatos);
	}

	private void getDatosMandato(HttpServletRequest request, Map formdata, BigDecimal pPMANDATO,
			PAC_IAX_MANDATOS pac_iax_mandatos) throws java.lang.Exception {
		Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_CONSULTA_MANDATOS(null, null, null, null, null, null,
				null, null, null, null, pPMANDATO, null, null, null, null);
		logger.debug(map);
		List plReturn = (List) tratarRETURNyMENSAJES(request, map);

		if (!plReturn.isEmpty()) {
			Map mandatoMap = (Map) plReturn.get(0);

			formdata.put("NUMEROFOLIO", pPMANDATO);

			String CMANDATO = (String) mandatoMap.get("CODMANDATO");
			formdata.put("CMANDATO", CMANDATO);

			String DDEUDOR = (String) mandatoMap.get("RUTDEUDOR");
			formdata.put("DDEUDOR", DDEUDOR);

			String NDEUDOR = (String) mandatoMap.get("NOMBREDEUDOR");
			formdata.put("NDEUDOR", NDEUDOR);

			String DMANDANTE = (String) mandatoMap.get("RUTMANDANTE");
			formdata.put("DMANDANTE", DMANDANTE);

			String NMANDANTE = (String) mandatoMap.get("NOMBREMANDANTE");
			formdata.put("NMANDANTE", NMANDANTE);

			String TELEFONOS = (String) mandatoMap.get("TELEFONOS");
			formdata.put("TELEFONOS", TELEFONOS);

			BigDecimal CMETMOV = (BigDecimal) mandatoMap.get("COBRADORBANC");
			formdata.put("CMETMOV", CMETMOV);

			String CFORPAG = (String) mandatoMap.get("FORMAPAGO");
			formdata.put("CFORPAG", CFORPAG);

			String CBANCO = (String) mandatoMap.get("BANCO");
			formdata.put("CBANCO", CBANCO);

			String CSUCURSAL = (String) mandatoMap.get("SUCURSAL");
			formdata.put("CSUCURSAL", CSUCURSAL);

			String CNCTACTE = (String) mandatoMap.get("CUENTABANCARIA");
			formdata.put("CNCTACTE", CNCTACTE);

			String CTIPCC = (String) mandatoMap.get("TIPOTARJETA");
			formdata.put("CTIPCC", CTIPCC);

			String CNUMTAR = (String) mandatoMap.get("CUENTABANCARIA");
			formdata.put("CNUMTAR", CNUMTAR);

			// la institucion emisora es el banco
			String CINSEMI = (String) mandatoMap.get("BANCO");
			formdata.put("CINSEMI", CINSEMI);

			String FVENCIM = (String) mandatoMap.get("FVENCIM");
			formdata.put("FVENCIM", FVENCIM);

			Date CFECMAN = (Date) mandatoMap.get("FECHAMANDATO");
			formdata.put("CFECMAN", CFECMAN);

			BigDecimal PERMGESTION = getPermGestion(request, CMANDATO, pPMANDATO, pac_iax_mandatos);
			formdata.put("PERMGESTION", PERMGESTION);

			Date FFINVIG = (Date) mandatoMap.get("FFINVIG");
			formdata.put("FFINVIG", FFINVIG);
		}
	}

	private BigDecimal getPermGestion(HttpServletRequest request, String codMandato, BigDecimal numFolio,
			PAC_IAX_MANDATOS pac_iax_mandatos) throws java.lang.Exception {
		BigDecimal PERMGESTION = BigDecimal.ZERO;
		Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_USUPERMISOGESTION(codMandato, numFolio);
		logger.debug(map);
		PERMGESTION = (BigDecimal) tratarRETURNyMENSAJES(request, map);
		return PERMGESTION;
	}

	private void getDocumentosMandato(HttpServletRequest request, Map formdata, BigDecimal pPMANDATO,
			PAC_IAX_MANDATOS pac_iax_mandatos) throws Exception {
		Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_CONS_DOC_MANDATO(pPMANDATO);
		logger.debug(map);
		List plReturn = (List) tratarRETURNyMENSAJES(request, map);
		List documentosList = new ArrayList();

		boolean existeDocGeneral = false;

		// a�adimos documento general vacio en la primera posicion
		Map documentoGeneralVacio = new HashMap();
		documentoGeneralVacio.put("NOMBREDOC", null);
		documentoGeneralVacio.put("FDOCCREA", null);
		documentoGeneralVacio.put("DOCEDITA", "1");
		documentoGeneralVacio.put("IDDOCUMENTO", null);
		documentosList.add(documentoGeneralVacio);

		// rellenamos la lista con los objetos devueltos por PL
		if (plReturn != null && !plReturn.isEmpty()) {
			for (Object documentoPLMap : plReturn) {
				Map documento = getDocumento((Map) documentoPLMap);
				if (documento.get("DOCEDITA").equals("1"))
					existeDocGeneral = true; // solo hay un documento editable: el general
				documentosList.add(documento);
			}
		}

		// si el PL ha devuelto un documento general eliminamos el documento vacio
		// insertado al principio
		if (existeDocGeneral) {
			documentosList.remove(0);
		}

		formdata.put("documentos", documentosList);
	}

	private Map getDocumento(Map documentoPLMap) {
		Map documento = new HashMap();

		documento.put("NOMBREDOC", documentoPLMap.get("DESCGEDOX"));
		documento.put("FDOCCREA", documentoPLMap.get("FECHACREACION"));
		documento.put("IDDOCUMENTO", documentoPLMap.get("IDDOCGEDOX"));

		BigDecimal rechazo = (BigDecimal) documentoPLMap.get("RECHAZO");
		boolean isDocRechazo = rechazo.equals(BigDecimal.ZERO) ? false : true;

		if (isDocRechazo) {
			documento.put("DOCEDITA", "0");
		} else {
			documento.put("DOCEDITA", "1");
		}

		return documento;
	}

	private void getEstadosMandato(HttpServletRequest request, Map formdata, BigDecimal pPMANDATO,
			PAC_IAX_MANDATOS pac_iax_mandatos) throws Exception {
		Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_GETESTADOSMANDATO(pPMANDATO);
		logger.debug(map);
		List plReturn = (List) tratarRETURNyMENSAJES(request, map);

		if (!plReturn.isEmpty()) {
			List estadosList = new ArrayList();
			String estadoActual = null;
			String subEstadoActual = null;

			if (!plReturn.isEmpty()) {
				for (Object estadosPLMap : plReturn) {
					Map estadoMap = getEstado((Map) estadosPLMap);
					estadosList.add(estadoMap);

					// informamos el estado actual y el subestado para la cabecera de la secci�n
					if (estadoActual == null) {
						estadoActual = (String) estadoMap.get("ESTADO");
						subEstadoActual = (String) estadoMap.get("SUBESTA");
					}
				}
			}

			formdata.put("estados", estadosList);
			formdata.put("estadoActual", estadoActual);
			formdata.put("subEstadoActual", subEstadoActual);
		}
	}

	private Map getEstado(Map estadosPLMap) {
		Map estadoMap = new HashMap();
		estadoMap.put("ESTADO", estadosPLMap.get("ESTADO"));
		estadoMap.put("SUBESTA", estadosPLMap.get("SUBESTADO"));
		estadoMap.put("FCANEST", estadosPLMap.get("FECHAESTADO"));
		estadoMap.put("UCANEST", estadosPLMap.get("USUARIOALTA"));
		return estadoMap;
	}

	private void getPolizasMandato(HttpServletRequest request, Map formdata, BigDecimal pPMANDATO,
			PAC_IAX_MANDATOS pac_iax_mandatos) throws Exception {
		Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_GETPOLIZASMANDATO(pPMANDATO);
		logger.debug(map);
		List plReturn = (List) tratarRETURNyMENSAJES(request, map);

		if (!plReturn.isEmpty()) {
			List polizasList = new ArrayList();
			for (Object polizaPLMap : plReturn) {
				Map polizaMap = getPolizaMap((Map) polizaPLMap);
				polizasList.add(polizaMap);
			}

			formdata.put("polizas", polizasList);
		}
	}

	private Map getPolizaMap(Map polizaPLMap) {
		Map polizaMap = new HashMap();

		polizaMap.put("POLIZA", polizaPLMap.get("NPOLIZA"));
		polizaMap.put("ITEM", polizaPLMap.get("NCERTIF"));
		polizaMap.put("ESTADO", polizaPLMap.get("ESTADOMANDATO"));
		polizaMap.put("ESTPOL", polizaPLMap.get("ESTADOPOLIZA"));
		polizaMap.put("FASIGNA", polizaPLMap.get("FECHASIGNA"));
		polizaMap.put("UASIGNA", polizaPLMap.get("USUASIGNA"));
		polizaMap.put("FDESASI", polizaPLMap.get("FECHADESASIGNA"));
		polizaMap.put("UDESASI", polizaPLMap.get("USUDESASIGNA"));

		return polizaMap;
	}

	private void getGestionesMandato(HttpServletRequest request, Map formdata, BigDecimal pPMANDATO,
			PAC_IAX_MANDATOS pac_iax_mandatos) throws Exception {
		Map map = pac_iax_mandatos.ejecutaPAC_IAX_MANDATOS__F_GETGESTIONESMANDATO(pPMANDATO);
		logger.debug(map);
		List plReturn = (List) tratarRETURNyMENSAJES(request, map);

		if (plReturn != null && !plReturn.isEmpty()) {
			List gestionesList = new ArrayList();
			String accionActual = null;
			Date fechaRevision = null;

			for (Object gestionPLMap : plReturn) {
				Map gestionMap = getGestionMap((Map) gestionPLMap);
				gestionesList.add(gestionMap);

				if (accionActual == null) {
					accionActual = (String) gestionMap.get("ACCION");
					fechaRevision = (Date) gestionMap.get("FREVISI");
				}
			}

			formdata.put("gestiones", gestionesList);
			formdata.put("accionActual", accionActual);
			formdata.put("fechaRevision", fechaRevision);
		}
	}

	private Map getGestionMap(Map gestionPLMap) {
		Map gestionMap = new HashMap();

		gestionMap.put("FACCION", gestionPLMap.get("FECHAACCION"));
		gestionMap.put("ACCION", gestionPLMap.get("DESCACCION"));
		gestionMap.put("MOTRECH", gestionPLMap.get("MOTIVORECHAZO"));
		gestionMap.put("COMENT", gestionPLMap.get("COMENTARIO"));
		gestionMap.put("FREVISI", gestionPLMap.get("FECHAREVISION"));

		return gestionMap;
	}
}
