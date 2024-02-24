package axis.service.axis;

import java.math.BigDecimal;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axissin001Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.ConversionUtil;
import oracle.sql.DATE;

/* Ventana buscador de siniestros:
 * Al entrar en consulta de siniestros nos salta la pantalla modal axissin002 de
 * b�squeda de siniestro. Se podr� buscar por los siguientes par�metros:
 *   DATOS POLIZA
 *   ?	Num. P�liza - NPOLIZA
 *   ?	Certificado - NCERTIF
 *   ?  Fecha efecto - FEFECTO
 *   ?  Fecha vencimiento - FVENCIM
 *   ?  Fecha anulacion - FANULAC
 *   ?  Situaci�n - CSITUAC
 *   DATOS RECIBO
 *   ?  Num recibo - NRECIBO
 *   ?  Fecha efecto - FEFECTO_REC   real:FEFECTO
 *   ?  Fecha vencimiento - FVENCIM_REC
 *   ?  Importe - ICONCEP
 *   ?  Situaci�n - CESTREC
 *   DATOS SINIESTRO
 *   ?	Siniestro - NSINIES
 *   ?  Tramitador - CTRAINT / CTRAEXT
 *   ?	Situaci�n - CESTSIN
 *   ?  Fecha Ocurrecia - FSINIES
 *   ?  Hora de ocurrencia - HSINIES???
 *   ?  Fecha recepcion - FNOTIFI
 *   ?  Causas - CCAUSIN
 *   ?  Motivo - CMOTSIN
 *   ?  Responsabilidad - CCULPAB???
 *   ?  Zona de ocurrencia - ???
 *
 * ninguno de estos par�metros de b�squeda es obligatorio.
 * Si no se introduce ninguno de estos par�metros, el buscador mostrar� toda
 * la lista de p�lizas-siniestros
 *                                                               (**) Nombres a�n por establecer

*/

public class Axissin001Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los datos de una
	 * p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetDatPoliza(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
		logger.debug("PRIMERA PARTE DE LA PANTALLA axissin001---------------------------------------->" + m);
		return (Map) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * 
	 * M�todo que llama a la funci�n pl correspondiente para cargar los TOMADORES de
	 * una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolTomadores(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLTOMADORES_OLD(SSEGURO);
		logger.debug("TOMADORES DE POLIZA axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los RIESGOS de
	 * una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolRiesgos(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLRIESGOS_OLD(SSEGURO);
		logger.debug("RIESGOS DE POLIZA axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los datos del
	 * �ltimo recibo cargado una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetPolLastRecibo(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLLASTRECIBO_OLD(SSEGURO);
		logger.debug("�LTIMO RECIBO axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar el tramitador de
	 * una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param tmp
	 * @throws Exception
	 */
	private void dbGetTramitador(HttpServletRequest request, UsuarioBean usuario, Map tmp) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_TRAMITADOR_OLD();
		logger.debug("TRAMITADOR axissin001---------------------------------------->" + m);
		BigDecimal plReturn = (BigDecimal) tratarRETURNyMENSAJES(request, m);
		if (plReturn.equals(new BigDecimal(0))) {
			tmp.put("PCTRAMI", m.get("PCTRAMI"));
			tmp.put("PTTRAMI", m.get("PTTRAMI"));
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las causas de
	 * una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetCausasIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_CAUSASINI(SPRODUC);
		logger.debug("CAUSAS INI axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los motivos
	 * (seg�n la causa seleccionada) de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param CCAUSA
	 * @param CRAMO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetMotivosIni(HttpServletRequest request, UsuarioBean usuario, BigDecimal CCAUSA, BigDecimal SPRODUC,
			BigDecimal CRAMO, BigDecimal SSEGURO) throws Exception {
		// Map m = new
		// PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MOTIVOSSINI
		// (CCAUSA, SPRODUC);
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_MOTIVOSSINI(CCAUSA, CRAMO, SPRODUC, SSEGURO);
		logger.debug("MOTIVOS INI axissin001---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las
	 * responsabilidades de una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetResponsabilidadIni(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_GET_RESPONSABILIDASINI();
		logger.debug("RESPONSABILIDADES INI axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las
	 * garantias(seg�n el riesgo seleccionado y la fecha de ocurrencia a�adida) de
	 * una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param SSEGURO
	 * @param NRIESGO
	 * @param FSINIES
	 * @return
	 * @throws Exception
	 */
	private Map dbGetPolGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, DATE FSINIES) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_POLGARANTIAS_OLD(SSEGURO, NRIESGO,
						new java.sql.Date(FSINIES.dateValue().getTime()));
		logger.debug("POL GARANTIAS axissin001---------------------------------------->" + m);

		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la documentaci�n
	 * de una p�liza seleccionada.
	 * 
	 * @param request
	 * @param usuario
	 * @param SSEGURO
	 * @return
	 * @throws Exception
	 */
	private List dbGetDocumentacion(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_GET_DOCUMENTACION_OLD(SSEGURO);
		logger.debug("GET DOCUMENTACION axissin001---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar los datos de
	 * la p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param SSEGURO
	 * @param NRIESGO
	 * @param FSINIES
	 * @param HSINIES
	 * @param FNOTIFI
	 * @param CTRAMI
	 * @param CMOTSIN
	 * @param CCAUSIN
	 * @param CCULPAB
	 * @param TZONAOCU
	 * @param TSINIES
	 * @return
	 * @throws Exception
	 */
	private Map dbSetDatSiniestro(HttpServletRequest request, UsuarioBean usuario, BigDecimal SSEGURO,
			BigDecimal NRIESGO, DATE FSINIES, String HSINIES, DATE FNOTIFI, String CTRAMI, BigDecimal CMOTSIN,
			BigDecimal CCAUSIN, BigDecimal CCULPAB, String TZONAOCU, String TSINIES) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_SET_DATSINIESTRO_OLD(SSEGURO, NRIESGO,
						new java.sql.Date(FSINIES.dateValue().getTime()), HSINIES,
						new java.sql.Date(FNOTIFI.dateValue().getTime()), CTRAMI, TSINIES, CMOTSIN, CCAUSIN, CCULPAB,
						TZONAOCU);
		logger.debug("SET_DATSINIESTRO axissin001---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar las
	 * garantias seleccionadas de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param CGARANT
	 * @return
	 * @throws Exception
	 */
	private Map dbSetGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal CGARANT) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_SET_GARANTIAS_OLD(CGARANT);
		logger.debug("SET_GARANTIAS axissin001---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar la
	 * documentaci�n seleccionada de una p�liza seleccionada.
	 * 
	 * @param usuario
	 * @param CDOCUME
	 * @return
	 * @throws Exception
	 */
	private Map dbSetDocumentacion(HttpServletRequest request, UsuarioBean usuario, BigDecimal CDOCUME)
			throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_SET_DOCUMENTACION_OLD(CDOCUME);
		logger.debug("SET_DOCUMENTACION axissin001---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para dar de alta el
	 * siniestro realcionado con la p�liza seleccionada.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbAltaSiniestro(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_SINIESTROS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_SINIESTROS__F_ALTASINIESTRO_OLD();
		logger.debug("ALTA_SINIESTRO axissin001---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que se llama al inicio de este flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axissin001Action thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En ella cargamos todos los
	 * campos de la p�liza seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin001Action thisAction) {

		logger.debug("Axissin001Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		request.getSession().setAttribute("SSEGURO", SSEGURO);

		BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
		request.getSession().setAttribute("SPRODUC", SPRODUC);
		Map objetoPantalla = new HashMap();

		try {
			if ("true".equals(getCampoTextual(request, "LIMPIAR_DATOS"))) {
				// Reinicializar formdata
				Object[] keySet = formdata.keySet().toArray();
				for (int i = 0; i < keySet.length; i++) {
					formdata.remove(keySet[i]);
				}
				formdata.put("SSEGURO", SSEGURO);
				formdata.put("SPRODUC", SPRODUC);
				request.getSession().removeAttribute("T_IAX_MOTIVOS");
				request.getSession().removeAttribute("T_IAX_GARANTIAS");
			}

			Map datPolizaReturn = this.dbGetDatPoliza(request, usuario, SSEGURO);

			if (!isEmpty(datPolizaReturn))
				objetoPantalla.putAll(datPolizaReturn);

			List polTomadoresReturn = this.dbGetPolTomadores(request, usuario, SSEGURO);
			objetoPantalla.put("T_IAX_TOMADORES", polTomadoresReturn);

			List polRiesgosReturn = this.dbGetPolRiesgos(request, usuario, SSEGURO);

			objetoPantalla.put("T_IAX_RIESGOS", polRiesgosReturn);
			objetoPantalla.put("SIZE_RIESGOS",
					((isEmpty(polRiesgosReturn)) ? new Integer(0) : new Integer(polRiesgosReturn.size())));
			objetoPantalla.put("NRIESGO",
					((!isEmpty(polRiesgosReturn) && polRiesgosReturn.size() == 1))
							? ((Map) ((Map) polRiesgosReturn.get(0)).get("OB_IAX_RIESGOS")).get("NRIESGO")
							: null);

			List polLastRecibo = this.dbGetPolLastRecibo(request, usuario, SSEGURO);
			objetoPantalla.put("T_IAX_LASTRECIBO", polLastRecibo);

			if (isEmpty(formdata.get("FNOTIFI")))
				objetoPantalla.put("FNOTIFI", new Date());

			if (isEmpty(formdata.get("HSINIES")))
				objetoPantalla.put("HSINIES", new String());

			this.dbGetTramitador(request, usuario, objetoPantalla);

			// Borrar sesi�n de causa seleccionada si ya existe
			// if(!isEmpty(request.getSession().getAttribute ("axissin_selected_causa")))
			// request.getSession().removeAttribute ("axissin_selected_causa");

			List getCausasIniReturn = this.dbGetCausasIni(request, usuario, (BigDecimal) objetoPantalla.get("SPRODUC"));
			objetoPantalla.put("T_IAX_CAUSAS", getCausasIniReturn);

			// Inicialmente no hay motivos (depende de una causa seleccionada)
			if (formdata.get("motivos") == null || formdata.get("motivos") == "null")
				objetoPantalla.put("T_IAX_MOTIVOS", null);

			List getResponsabilidadIniReturn = this.dbGetResponsabilidadIni(request, usuario);
			objetoPantalla.put("T_IAX_RESPONSABILIDAD", getResponsabilidadIniReturn);

			if (!isEmpty(request.getSession().getAttribute("T_IAX_GARANTIAS"))
					&& !isEmpty(getCampoTextual(request, "selectedGarantias"))) {
				// Establecer seleccionados
				List T_IAX_GARANTIAS = (List) request.getSession().getAttribute("T_IAX_GARANTIAS");
				String[] CGARANT = getCampoTextual(request, "selectedGarantias").split("-");
				for (int i = 0; i < T_IAX_GARANTIAS.size(); i++) {
					inner: for (int j = 0; i < CGARANT.length; i++) {
						if (((BigDecimal) ((Map) T_IAX_GARANTIAS.get(i)).get("CGARANT")).intValue() == Integer
								.valueOf(CGARANT[j]).intValue()) {
							((Map) T_IAX_GARANTIAS.get(i)).put("SELECTEDGARANTIA", new Boolean(true));
							break inner;
						}
					}
				}

			}

			List getDocumentacionReturn = this.dbGetDocumentacion(request, usuario, SSEGURO);
			if (!isEmpty(getDocumentacionReturn) && !isEmpty(getCampoTextual(request, "selectedDocumentacion"))) {
				// Establecer seleccionados
				String[] CDOCUME = getCampoTextual(request, "selectedDocumentacion").split("-");
				for (int i = 0; i < getDocumentacionReturn.size(); i++) {
					inner: for (int j = 0; i < CDOCUME.length; i++) {
						if (((BigDecimal) ((Map) getDocumentacionReturn.get(i)).get("CDOCUME")).intValue() == Integer
								.valueOf(CDOCUME[j]).intValue()) {
							((Map) getDocumentacionReturn.get(i)).put("SELECTEDDOCUME", new Boolean(true));
							break inner;
						}
					}
				}
			}

			objetoPantalla.put("T_IAX_DOCUMENTACION", getDocumentacionReturn);

			formdata.putAll(objetoPantalla);

			// actualizarFormatoFechas(request, new String[] {"FEMISIO", "FEFECTO",
			// "FVENCIM", "FANULAC", "FSINIES", "FNOTIFI"});

		} catch (Exception e) {
			logger.error("Error en el servicio axissin001Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		if (isEmpty(SPRODUC) && !isEmpty(formdata.get("SPRODUC"))) {
			SPRODUC = (BigDecimal) formdata.get("SPRODUC");
		}
		logger.debug("aaa->" + SPRODUC);
		if (!isEmpty(SPRODUC))
			AbstractDispatchAction.topPila(request, "SPRODUC", SPRODUC);

		this.configForm(request, whoami(this));

	}

	/**
	 * TODO -Para efectuar la demo del dia 08-01-08, este m�todo pasa temporalmente
	 * a ser de http request/response. Deberemos en js vaciar todo el displayTag
	 * para evitar que las garantias antiguas continuen en pantalla (cuando queramos
	 * cambiar fecha).
	 * 
	 * M�todo que se llama al cambiar la fecha de siniestro si y s�lo si hay un
	 * riesgo seleccionado. Con �sto, cargamos las garantias asociadas a la p�liza
	 * seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_cambiar_fecha_siniestro(HttpServletRequest request, Axissin001Action thisAction) {
		logger.debug("Axissin001Service m_ajax_cambiar_fecha_siniestro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "SRIESGO");
			DATE FSINIES = new DATE(ConversionUtil.getTimeStamp(getCampoTextual(request, "FSINIES")));

			Map plGetPolGarantiasReturn = this.dbGetPolGarantias(request, usuario, SSEGURO, NRIESGO, FSINIES);
			List getPolGarantiasReturn = (List) ajax.rellenarPlAContenedorAjax(plGetPolGarantiasReturn);

			request.getSession().removeAttribute("T_IAX_GARANTIAS");
			if (!isEmpty(getPolGarantiasReturn)) {
				ajax.guardarContenidoFinalAContenedorAjax(getPolGarantiasReturn);
				request.getSession().setAttribute("T_IAX_GARANTIAS", getPolGarantiasReturn);
			}
		} catch (Exception e) {
			logger.error("Axissin001Service m_ajax_cambiar_fecha_siniestro - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que se llama para actualizar todos los cambio porducidos en la
	 * pantalla y, posteriormente, dar de alta el nuevo siniestro.
	 * 
	 * @param request
	 */
	public void m_aceptar_siniestro(HttpServletRequest request) {
		logger.debug("Axissin001Service m_aceptar_siniestro");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		String[] sg = null;
		String[] sd = null;

		try {
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			DATE FSINIES = ((!isEmpty(getCampoTextual(request, "FSINIES")))
					? new DATE(ConversionUtil.getTimeStamp(getCampoTextual(request, "FSINIES")))
					: null);
			DATE FNOTIFI = ((!isEmpty(getCampoTextual(request, "FNOTIFI")))
					? new DATE(ConversionUtil.getTimeStamp(getCampoTextual(request, "FNOTIFI")))
					: null);
			String HSINIES = getCampoTextual(request, "HSINIES");
			String CTRAMI = getCampoTextual(request, "CTRAMI");
			BigDecimal CMOTSIN = getCampoNumerico(request, "CMOTSIN");
			BigDecimal CCAUSIN = getCampoNumerico(request, "CCAUSIN");
			BigDecimal CCULPAB = getCampoNumerico(request, "CCULPAB");
			String TZONAOCU = getCampoTextual(request, "TZONAOCU");
			String TSINIES = getCampoTextual(request, "TSINIES");

			String SELECTEDGARANTIAS = getCampoTextual(request, "SELECTEDGARANTIAS");
			if (SELECTEDGARANTIAS != null)
				sg = SELECTEDGARANTIAS.split("-");

			String SELECTEDDOCUMENTACION = getCampoTextual(request, "SELECTEDDOCUMENTACION");
			if (SELECTEDDOCUMENTACION != null)
				sd = SELECTEDDOCUMENTACION.split("-");

			Map plSetDatSiniestroReturn = this.dbSetDatSiniestro(request, usuario, SSEGURO, NRIESGO, FSINIES, HSINIES,
					FNOTIFI, CTRAMI, CMOTSIN, CCAUSIN, CCULPAB, TZONAOCU, TSINIES);
			BigDecimal setDatSiniestroReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(plSetDatSiniestroReturn);

			if (setDatSiniestroReturn.equals(new BigDecimal(0))) {
				// Comprobamos que garantias seleccionadas hay
				if (sg != null) {
					for (int i = 0; i < sg.length; i++) {
						Map plSetGarantiasReturn = this.dbSetGarantias(request, usuario, stringToBigDecimal(sg[i]));
						BigDecimal setGarantiasReturn = (BigDecimal) ajax
								.rellenarPlAContenedorAjax(plSetGarantiasReturn);
					}
				}
				// Comprobamos que documentacion seleccionada hay
				if (sd != null) {
					for (int i = 0; i < sd.length; i++) {
						Map plSetDocumentacionReturn = this.dbSetDocumentacion(request, usuario,
								stringToBigDecimal(sd[i]));
						BigDecimal setDocumentacionReturn = (BigDecimal) ajax
								.rellenarPlAContenedorAjax(plSetDocumentacionReturn);
					}
				}

				// Damos de alta el siniestro
				String[] varAlt = { "ONSINIES" };
				Map plAltaSiniestroReturn = this.dbAltaSiniestro(request, usuario);
				Object[] altaSiniestroReturn = (Object[]) ajax.rellenarPlAContenedorAjax(plAltaSiniestroReturn, varAlt);
				if (((BigDecimal) altaSiniestroReturn[0]).equals(new BigDecimal(0))) {
					ajax.guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
					// ajax.guardarInformacionAContenedorAjax("Siniestro dado de alta correctamente.
					// El nuevo n�mero de siniestro es: "+ (BigDecimal)altaSiniestroReturn[1]);
					request.getSession().setAttribute("NSINIESINI", (BigDecimal) altaSiniestroReturn[1]);
				}
			} // FI if inicial
		} catch (Exception e) {
			logger.error("Error", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/**
	 * M�todo que se llama al seleccionar una causa de la lista de causas. Con ello
	 * se pretende carga una lista de motivos.
	 * 
	 * @param request
	 */
	public void m_ajax_selected_causa(HttpServletRequest request) {
		logger.debug("Axissin001Service AJAX m_ajax_selected_causa");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CCAUSA = getCampoNumerico(request, "CODI");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");

			Map plReturn = dbGetMotivosIni(request, usuario, CCAUSA, SPRODUC, CRAMO, SSEGURO);
			List getMotivosIniReturn = (List) ajax.rellenarPlAContenedorAjax(plReturn);
			request.getSession().removeAttribute("T_IAX_MOTIVOS");

			if (!isEmpty(getMotivosIniReturn) && getMotivosIniReturn.size() > 0) {
				ajax.guardarContenidoFinalAContenedorAjax((List) getMotivosIniReturn);
				request.getSession().setAttribute("T_IAX_MOTIVOS", getMotivosIniReturn);
			}
		} catch (Exception e) {
			logger.error("Axissin001Service m_ajax_selected_causa - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * NAVEGACION ENTRE FLUJOS
	 *********************************************/
	/*********************************************************************************************************************/

	public void m_consultar(HttpServletRequest request, Axissin001Action thisAction) {
		logger.debug("Axissin001Service m_consultar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			// 1. push de los datos necesarios a la pila

			/*
			 * BigDecimal NSINIES = this.getCampoNumerico(request, "NSINIES"); BigDecimal
			 * SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			 * thisAction.topPila(request, "NSINIES", NSINIES); thisAction.topPila(request,
			 * "SSEGURO", SSEGURO);
			 */

			thisAction.topPila(request, "formdata_axissin001", formdata);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin001Service - m�todo m_consultar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_volver(HttpServletRequest request, Axissin001Action thisAction) {
		logger.debug("Axissin001Service m_volver");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			/*
			 * formdata.put("NSINIES", bigDecimalToString ((BigDecimal)
			 * thisAction.removeTopPila(request, "NSINIES"))); formdata.put("SSEGURO",
			 * bigDecimalToString ((BigDecimal) thisAction.removeTopPila(request,
			 * "SSEGURO")));
			 */

			Map formdata_axissin001 = (Map) thisAction.removeTopPila(request, "formdata_axissin001");
			if (!isEmpty(formdata_axissin001))
				formdata.putAll(formdata_axissin001);

			// actualizarFormatoFechas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin001Service - m�todo m_volver", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

}
