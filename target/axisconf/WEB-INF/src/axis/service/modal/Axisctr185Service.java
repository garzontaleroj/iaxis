package axis.service.modal;

import java.io.InputStream;
import java.math.BigDecimal;
import java.net.HttpURLConnection;
import java.net.URL;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jdom.Document;
import org.jdom.Element;
import org.jdom.Namespace;
import org.jdom.input.SAXBuilder;
import org.jdom.output.Format;
import org.jdom.output.XMLOutputter;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.jdbc.PAC_INT_ONLINE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisctr185Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.JDomUtil;

public class Axisctr185Service extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axisctr185Service.class);

	public static int readTimeout = 5000;
	public static Namespace soapenv = Namespace.getNamespace("soapenv", "http://schemas.xmlsoap.org/soap/envelope/");
	public static Namespace soap = Namespace.getNamespace("soap", "http://schemas.xmlsoap.org/soap/envelope/");
	public static Namespace xsi = Namespace.getNamespace("xsi", "http://www.w3.org/2001/XMLSchema-instance");

	private static String BS_BON_NS_URL;
	private static String BS_SOAPACTION;
	private static String BS_WSURL;
	private static String BS_AESINITIALVECTOR;
	private static String BS_AESKEY;
	private static String BS_XSDURL;
	private static String BS_AXISLISTENERURL;
	private static SimpleDateFormat sdf_YYYY_MM_DD = new SimpleDateFormat("yyyy-MM-dd");
	private static Namespace bon;

	private static void init_variables(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CEMPRES = usuario.getCempres();

		Map m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_BON_NS_URL", CEMPRES);
		BS_BON_NS_URL = (String) m.get("RETURN");
		logger.debug("BS_BON_NS_URL=" + BS_BON_NS_URL);

		m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_SOAPACTION", CEMPRES);
		BS_SOAPACTION = (String) m.get("RETURN");
		logger.debug("BS_SOAPACTION=" + BS_SOAPACTION);

		m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_WSURL", CEMPRES);
		BS_WSURL = (String) m.get("RETURN");
		logger.debug("BS_WSURL=" + BS_WSURL);

		m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_AESINITIALVECTOR", CEMPRES);
		BS_AESINITIALVECTOR = (String) m.get("RETURN");
		logger.debug("BS_AESINITIALVECTOR=" + BS_AESINITIALVECTOR);

		m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_AESKEY", CEMPRES);
		BS_AESKEY = (String) m.get("RETURN");
		logger.debug("BS_AESKEY=" + BS_AESKEY);

		m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_XSDURL", CEMPRES);
		BS_XSDURL = (String) m.get("RETURN");
		logger.debug("BS_XSDURL=" + BS_XSDURL);

		m = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_T("BS_AXISLISTENERURL", CEMPRES);
		BS_AXISLISTENERURL = (String) m.get("RETURN");
		logger.debug("BS_AXISLISTENERURL=" + BS_AXISLISTENERURL);

		bon = Namespace.getNamespace("bon", BS_BON_NS_URL);
		logger.debug("bon=" + bon);
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axisctr185Action thisAction) {
		logger.debug("Axisctr185Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			// Inicializaci�n de las variables
			init_variables(request);

			// obtener datos de AXIS
			Map datosPoliza = this.dbLeeDatosPoliza(request);
			request.setAttribute("datosPoliza", datosPoliza);

			Map datosAgente = this.dbLeeAgente(request, (BigDecimal) datosPoliza.get("CAGENTE"));
			request.setAttribute("datosAgente", datosAgente);

			logger.debug("NRIESGO=" + NRIESGO);
			logger.debug("SPRODUC=" + SPRODUC);

			List listaAsegurados = this.dbLeeAsegurados(request, NRIESGO, SPRODUC);
			request.setAttribute("listaAsegurados", listaAsegurados);

			List listaGarantias = this.dbLeeGarantias(request, NRIESGO, new BigDecimal(0));
			request.setAttribute("listaGarantias", listaGarantias);

			// montaje XML inicial (deberiar ser con lo datos correctos), pero por el
			// momento vale
			Document xmlDoc = this.generarDocument(request, datosPoliza, datosAgente, listaAsegurados, listaGarantias);
			logger.debug("xmlDoc=" + JDomUtil.documentoToString(xmlDoc));

			// encriptamos (falta ver si pasamos bien los parametros de AES), pero por el
			// momento vale
			String payLoad = this.encriptarDoc(xmlDoc);
			logger.debug("payLoad=" + payLoad);

			// montamos el SOAP
			Document soapDoc = this.generarSoap(payLoad);
			logger.debug("soapDoc=" + JDomUtil.documentoToString(soapDoc));

			// enviamos SOAP
			Document soapResponse = this.launchDoc(soapDoc, Axisctr185Service.BS_WSURL, null);
			logger.debug("soapResponse=" + JDomUtil.documentoToString(soapResponse));

			// parseamos soap
			HashMap respuestaParseada = this.parseSoapreponse(soapResponse);
			logger.debug("respuestaParseada:" + respuestaParseada);

			String URLCuestionario = (String) respuestaParseada.get("MENSAJE");
			request.setAttribute("URLCuestionario", URLCuestionario);
			logger.debug("URLCuestionario=" + URLCuestionario);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr185Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Lanza un documento XML a una URL. Opcionalmente, permite a�adir request
	 * properties
	 * 
	 * @param doc
	 * @param urlAsString
	 * @return
	 * @throws Exception
	 */
	public Document launchDoc(Document doc, String urlAsString, Properties requestProperties) throws Exception {

		logger.debug("launchDoc " + doc + " a " + urlAsString + " con " + requestProperties);
		URL url = new URL(urlAsString);

		if (requestProperties == null)
			requestProperties = new Properties();

		/*
		 * if (url.getProtocol().equalsIgnoreCase("https")) { TrustManager[]
		 * trustAllCerts=new TrustManager[] { new NaiveX509TrustManager() }; SSLContext
		 * sc=SSLContext.getInstance("SSL"); sc.init(null, trustAllCerts, new
		 * java.security.SecureRandom());
		 * HttpsURLConnection.setDefaultSSLSocketFactory(sc.getSocketFactory()); }
		 */

		HttpURLConnection urlConn = (HttpURLConnection) url.openConnection();
		urlConn.setDoInput(true);
		urlConn.setDoOutput(true);
		urlConn.setRequestMethod("POST");
		urlConn.setAllowUserInteraction(false);
		urlConn.setRequestProperty("Content-Type", "text/xml;charset=utf-8"); // ; charset=ISO-8859-1");
																				// //"text/xml;charset=utf-8");
		urlConn.setRequestProperty("Accept", "*/*");
		urlConn.setRequestProperty("Accept-Encoding", "gzip,deflate");
		urlConn.setRequestProperty("SOAPAction", requestProperties.getProperty("SOAPAction", BS_SOAPACTION));
		urlConn.setRequestProperty("User-Agent", "iAXIS");
		urlConn.setReadTimeout(readTimeout);
		urlConn.setConnectTimeout(readTimeout + 3000);

		XMLOutputter out = new XMLOutputter(Format.getPrettyFormat());
		logger.debug("enviando:" + JDomUtil.documentoToString(doc));

		out.output(doc, urlConn.getOutputStream());

		// recibir
		SAXBuilder builder = new SAXBuilder();
		builder.setValidation(false);
		builder.setIgnoringElementContentWhitespace(true);

		InputStream _is = null;

		if (urlConn.getResponseCode() > 400) {
			logger.warn("Response code " + urlConn.getResponseCode());
			_is = urlConn.getErrorStream();
		} else {
			logger.debug("Response code " + urlConn.getResponseCode());
			_is = urlConn.getInputStream();
		}

		Document docIn = builder.build(_is); // urlConn.getInputStream());
		_is.close(); // urlConn.getInputStream().close();

		urlConn.disconnect();

		logger.debug("recibido:" + JDomUtil.documentoToString(docIn));

		return docIn;
	}

	/**
	 * Encripta el XML de datos (payload) con AES y lo expresa en base64
	 * 
	 * @param doc
	 * @return String en base 64 del XML enscriptado con AES
	 * @throws Exception
	 */
	public String encriptarDoc(Document doc) throws Exception {

		logger.debug("encriptarDoc " + doc);

		String aes_initialVector = BS_AESINITIALVECTOR; // "@1B2c3D4e5F6g7H8"; //segun mail De: Francesc Estanyol
														// [mailto:festanyol@microart.cat] Enviado el: mi�rcoles, 21 de
														// diciembre de 2011 10:56
		String aes_key = BS_AESKEY; // "P4ssw0rD"; //segun mail De: Francesc Estanyol
									// [mailto:festanyol@microart.cat] Enviado el: mi�rcoles, 21 de diciembre de
									// 2011 10:56
		AESUtil aesUtil = null;

		if (aes_initialVector != null && aes_key != null) {
			aesUtil = new AESUtil(aes_initialVector, aes_key);
		} else {
			aesUtil = new AESUtil();
		}

		String texto_cifrado = aesUtil.encrypt(JDomUtil.documentoToString(doc));

		return texto_cifrado;
	}

	/**
	 * Genera un soap document conforme al
	 * http://213.229.152.3/BonsaiCA2/WebService.asmx?WSDL (SOAP 1.1, funci�n
	 * PutString), y como valor de //strParam se pone el del payload.
	 * 
	 * @param payload
	 * @return
	 * @throws Exception
	 */
	public Document generarSoap(String payload) throws Exception {

		logger.debug("generarSoap con payload:" + StringUtils.substring(payload, 0, 30) + "[..]");

		Document soapDoc = new Document();
		Element Envelope = new Element("Envelope", soapenv);
		soapDoc.setRootElement(Envelope);
		{
			Envelope.addNamespaceDeclaration(bon);
		}

		Element Header = new Element("Header", soapenv);
		Envelope.addContent(Header);
		{
			// vacio
		}

		Element Body = new Element("Body", soapenv);
		Envelope.addContent(Body);
		{
			Element PutString = new Element("PutString", bon);
			Body.addContent(PutString);
			{
				Element strParam = new Element("strParam", bon);
				PutString.addContent(strParam);
				{
					strParam.addContent(payload);
				}
			}
		}

		return soapDoc;
	}

	/**
	 * Parsea la respuesta SOAP que viene de Bonsai, y retorna un HashMap con
	 * ERROR=true|false, MENSAJE=(mensaje de error)|URL Bonsai
	 */
	public HashMap parseSoapreponse(Document soapResponse) throws Exception {

		logger.debug("parseSoapreponse de " + soapResponse);
		HashMap retVal = new HashMap();
		String MENSAJE = "ERROR";
		retVal.put("ERROR", true);
		retVal.put("MENSAJE", MENSAJE);
		// se trata de un soap-Fault?
		Element Fault = (Element) JDomUtil.getXpathObject(soapResponse, "//soap:Fault", soap);

		if (Fault != null) {
			logger.warn("se trata de un soap-Fault");
			Element faultcode = (Element) JDomUtil.getXpathObject(Fault, "faultcode"); // , soap);
			Element faultstring = (Element) JDomUtil.getXpathObject(Fault, "faultstring");
			logger.debug("faultcode/faultstring:" + faultcode + "/" + faultstring);
			MENSAJE = "";

			if (faultcode != null) {
				MENSAJE = MENSAJE + " " + faultcode.getTextTrim();
			}

			if (faultstring != null) {
				MENSAJE = MENSAJE + " " + faultstring.getTextTrim();
			}

			if (MENSAJE.trim().length() == 0) {
				MENSAJE = "soap:Fault?";
			}

			if (MENSAJE.toLowerCase().indexOf("decrypt") >= 0 && MENSAJE.toLowerCase().indexOf("base64") >= 0) {
				logger.debug("Payload no se ha podido decriptar");
			}

			if (MENSAJE.toLowerCase().indexOf("xmltextreaderimpl") >= 0
					&& MENSAJE.toLowerCase().indexOf("parse") >= 0) {
				logger.debug("Payload no se ha podido parsear como un documento XML");
			}

			retVal.put("MENSAJE", MENSAJE);
		} else {
			logger.debug("Buscamos por un PutStringResponse");

			// Buscamos por el PutStringResponse, hijo del Body. Problema: PutStringResponse
			// viene con un NS raro, que parece ser dinamico y no me atrevo de ponerlo como
			// un NS
			// predefinido, asi que "miro" que hay como hijos, y si uno de ellos se llama
			// casualmente "PutStringResponse"
			Element Body = (Element) JDomUtil.getXpathObject(soapResponse, "//soap:Body", soap);
			List BodyChildren = Body.getChildren();
			boolean PutStringResponseFound = false;

			for (int i = 0; i < BodyChildren.size(); i++) {
				if (BodyChildren.get(i) instanceof Element) {
					if (((Element) BodyChildren.get(i)).getName().equals("PutStringResponse")) {
						PutStringResponseFound = true;
						Element PutStringResponse = (Element) BodyChildren.get(i);
						Namespace PutStringResponseNS = PutStringResponse.getNamespace();
						String bonsaiURL = PutStringResponse.getChildText("PutStringResult", PutStringResponseNS);

						if (bonsaiURL != null && bonsaiURL.trim().length() > 0) {
							retVal.put("ERROR", false);
							retVal.put("MENSAJE", bonsaiURL);
							break;
						} else {
							logger.error("PutStringResult vacio o nulo");
						}
					}
				}
			}

			if (!PutStringResponseFound) {
				logger.error("PutStringResponse no localizado");
			}
		}

		return retVal;
	}

	/**
	 * Genera XML de datos (payload)
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public Document generarDocument(HttpServletRequest request, Map datosPoliza, Map datosAgente, List listaAsegurados,
			List listaGarantias) throws Exception {

		logger.debug("generarDocument");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CEMPRES = usuario.getCempres();

		Document retVal = new Document();
		Element mensaje_iAxis_bonsai = new Element("mensaje_iAxis_bonsai");

		PAC_IAX_PERSONA pac_iax_persona = new PAC_IAX_PERSONA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		if (BS_XSDURL != null && BS_XSDURL.trim().length() > 0) {
			mensaje_iAxis_bonsai.addNamespaceDeclaration(xsi); //
			mensaje_iAxis_bonsai.setAttribute("noNamespaceSchemaLocation", BS_XSDURL, xsi);
		}

		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (isEmpty(NRIESGO))
			NRIESGO = new BigDecimal(1);

		retVal.setRootElement(mensaje_iAxis_bonsai);
		Element bloque_cabecera = new Element("bloque_cabecera"); // 1..1
		mensaje_iAxis_bonsai.addContent(bloque_cabecera);
		{
			Element url_retorno = new Element("url_retorno");
			bloque_cabecera.addContent(url_retorno);
			{
				url_retorno.addContent(BS_AXISLISTENERURL); // url del CALIAxisListener
			}

			Element codi_company = new Element("codi_company");
			bloque_cabecera.addContent(codi_company);
			{
				codi_company.addContent("" + 235); // Para 'Cr�dit Andorr� es 235
			}

			Element codi_cone = new Element("codi_cone");
			bloque_cabecera.addContent(codi_cone);
			{
				codi_cone.addContent("A0"); // Por el momento, para 'Cr�dit Andorr�' s�lo se utilizar�n A0
											// (iAxis->Bonsai) y B0 (Bonsai->iAxis) , de A0 B0 C0 D0
			}

			Element nume_refe = new Element("nume_refe");
			bloque_cabecera.addContent(nume_refe);
			{
				nume_refe.addContent(StringUtils.leftPad(String.valueOf(datosPoliza.get("SSEGURO")), 16, '0')); // Bonsai
																												// debe
																												// informar
																												// en
																												// este
																												// campo
																												// el
																												// mismo
																												// n�mero
																												// de
																												// referencia
																												// enviado
																												// por
																												// iAXIS
																												// al
																												// llamar
																												// a
																												// Bonsai
			}

			Element contextid = new Element("contextid");
			if (!isEmpty(request.getSession().getId())) {
				bloque_cabecera.addContent(contextid);
				{
					contextid.addContent(request.getSession().getId()); // DBCONTEXTID, alfanum, hasta 120chars aprox
				}
			}

			Element nriesgo = new Element("nriesgo");
			if (!isEmpty(NRIESGO)) {
				bloque_cabecera.addContent(nriesgo);
				{
					nriesgo.addContent(String.valueOf(NRIESGO)); // numerico entero 1..n
				}
			}

		} // fin Element bloque_cabecera

		Element bloque_extra_info_solicitud = new Element("bloque_extra_info_solicitud"); // 0..1

		if (!isEmpty(datosPoliza.get("NPOLIZA")) || !isEmpty(datosPoliza.get("FEFECTO"))) {
			mensaje_iAxis_bonsai.addContent(bloque_extra_info_solicitud);
			{
				Element num_expediente = new Element("num_expediente"); // 0..1 String
				// opcional, no se sabe que es
				// bloque_extra_info_solicitud.addContent(num_expediente);
				{
					num_expediente.addContent(String.valueOf(datosPoliza.get("NPOLIZA")));
				}

				Element fecha_efectividad = new Element("fecha_efectividad"); // 0..1 yyyy-MM-dd
				bloque_extra_info_solicitud.addContent(fecha_efectividad);
				{
					fecha_efectividad.addContent(sdf_YYYY_MM_DD.format((Date) datosPoliza.get("FEFECTO")));
				}

				Element fecha_solicitud = new Element("fecha_solicitud"); // 0..1 yyyy-MM-dd
				bloque_extra_info_solicitud.addContent(fecha_solicitud);
				{
					fecha_solicitud.addContent(sdf_YYYY_MM_DD.format(new java.util.Date()));
				}

				Element prima = new Element("prima"); // 0..1
				// opcional, no se sabe si hay que enviarlo
				// bloque_extra_info_solicitud.addContent(prima); //positiveInteger, solo EUROS
				// sin decimales, ver mail del 7.2.
				{
					// prima.addContent(""+1200);
					prima.addContent("");
				}
			}
		}

		Element bloque_sucursal = new Element("bloque_sucursal"); // 0..1
		mensaje_iAxis_bonsai.addContent(bloque_sucursal);
		{
			Element sucursal_agente = new Element("sucursal_agente");
			if (!isEmpty(datosAgente.get("CAGENTE"))) {
				bloque_sucursal.addContent(sucursal_agente);
				{
					sucursal_agente.addContent(String.valueOf(datosAgente.get("CAGENTE")));
				}
			}

			Element sucursal_nombre = new Element("sucursal_nombre");
			bloque_sucursal.addContent(sucursal_nombre);
			{
				if (!isEmpty(datosAgente.get("TNOMBRE"))) {
					sucursal_nombre.addContent(String.valueOf(datosAgente.get("TNOMBRE")));
				} else {
					if (!isEmpty(datosAgente.get("TAPELLI1"))) {
						sucursal_nombre.addContent(String.valueOf(datosAgente.get("TAPELLI1")));
					}
				}
			}

			Map mapContactosAgente = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOTLFFIJO(
					(BigDecimal) datosAgente.get("SPERSON"), (BigDecimal) datosAgente.get("CAGENTE"));
			logger.debug("mapContactosAgente sucursal_telefono: " + mapContactosAgente);
			tratarRETURNyMENSAJES(request, mapContactosAgente);

			Element sucursal_telefono = new Element("sucursal_telefono"); // string max 10
			if (!isEmpty(mapContactosAgente.get("TVALCON"))) {
				bloque_sucursal.addContent(sucursal_telefono);
				{
					sucursal_telefono.addContent(StringUtils.substring(
							this.convertTlfNumber(String.valueOf(mapContactosAgente.get("TVALCON"))), 0, 10));
				}
			}

			mapContactosAgente = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_CONTACTOMAIL(
					(BigDecimal) datosAgente.get("SPERSON"), (BigDecimal) datosAgente.get("CAGENTE"));
			logger.debug("mapContactosAgente sucursal_email: " + mapContactosAgente);
			tratarRETURNyMENSAJES(request, mapContactosAgente);

			Element sucursal_email = new Element("sucursal_email");
			if (!isEmpty(mapContactosAgente.get("TVALCON"))) {
				bloque_sucursal.addContent(sucursal_email);
				{
					sucursal_email.addContent(String.valueOf(mapContactosAgente.get("TVALCON")));
				}
			}

			/* Direcciones del agente */
			Map mapDirecciones = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_DIRECCION(
					(BigDecimal) datosAgente.get("SPERSON"), new BigDecimal(1));
			logger.debug("mapDirecciones: " + mapDirecciones);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, mapDirecciones);

			if (RETURN.intValue() == 0) {

				Map datosDireccionAge = (Map) mapDirecciones.get("PDIRECCIONES");
				logger.debug("datosDireccionAge: " + datosDireccionAge);

				Element sucursal_direccion = new Element("sucursal_direccion");
				bloque_sucursal.addContent(sucursal_direccion);
				{

					Element part_domi = new Element("part_domi"); // 0..1
					if (!isEmpty(datosDireccionAge.get("TSIGLAS"))) {
						sucursal_direccion.addContent(part_domi);
						{
							part_domi.addContent(String.valueOf(datosDireccionAge.get("TSIGLAS"))); // ttipo domicilio,
																									// string 2
						}
					}

					Element nomb_domi = new Element("nomb_domi"); // 1..1
					if (!isEmpty(datosDireccionAge.get("TNOMVIA"))) {
						sucursal_direccion.addContent(nomb_domi);
						{
							nomb_domi.addContent(String.valueOf(datosDireccionAge.get("TNOMVIA"))); // string max 42
						}
					}

					Element nume_domi = new Element("nume_domi"); // 0..1
					sucursal_direccion.addContent(nume_domi);
					{
						nume_domi.addContent(String.valueOf(datosDireccionAge.get("NNUMVIA"))); // positive integer
					}

					Element rest_domi = new Element("rest_domi"); // 0..1
					if (!isEmpty(datosDireccionAge.get("TCOMPLE"))) {
						sucursal_direccion.addContent(rest_domi); // string 50
						{
							rest_domi.addContent(String.valueOf(datosDireccionAge.get("TCOMPLE")));
						}
					}

					Element pobl_domi = new Element("pobl_domi"); // 0..1
					if (!isEmpty(datosDireccionAge.get("TPOBLAC"))) {
						sucursal_direccion.addContent(pobl_domi);
						{
							pobl_domi.addContent(String.valueOf(datosDireccionAge.get("TPOBLAC"))); // poblacion 30
																									// string
						}
					}

					Element copo_domi = new Element("copo_domi"); // 0..1
					if (!isEmpty(datosDireccionAge.get("CPOSTAL"))) {
						sucursal_direccion.addContent(copo_domi);
						{
							copo_domi.addContent(String.valueOf(datosDireccionAge.get("CPOSTAL"))); // codio postal
																									// integer de max 5,
																									// leading 0
						}
					}

					Element provincia_domi = new Element("provincia_domi"); // 0..1
					if (!isEmpty(datosDireccionAge.get("TPROVIN"))) {
						sucursal_direccion.addContent(provincia_domi);
						{
							provincia_domi.addContent(String.valueOf(datosDireccionAge.get("TPROVIN"))); // provincia
						}
					}

					Element codi_domi = new Element("codi_domi");
					if (!isEmpty(datosDireccionAge.get("CPAIS"))) {
						sucursal_direccion.addContent(codi_domi);
						{
							codi_domi.addContent(
									this.paisISO(request, CEMPRES, String.valueOf(datosDireccionAge.get("CPAIS")))); // 020
						}
					}

				}

			}
		}

		for (int j = 0; j < listaAsegurados.size(); j++) {

			Map Asegurado = (Map) listaAsegurados.get(j);
			Map datosAsegurado = (Map) Asegurado.get("OB_IAX_ASEGURADOS");
			logger.debug("datosAsegurado=" + datosAsegurado);

			Element bloque_asegurado = new Element("bloque_asegurado"); //
			mensaje_iAxis_bonsai.addContent(bloque_asegurado);
			{
				Element tipo_pers = new Element("tipo_pers");
				if (!isEmpty(datosAsegurado.get("CTIPPER"))) {
					bloque_asegurado.addContent(tipo_pers);
					{
						if (String.valueOf(datosAsegurado.get("CTIPPER")).equals("1")) {
							tipo_pers.addContent("F"); // tipo_persona: F|J
						} else {
							if (String.valueOf(datosAsegurado.get("CTIPPER")).equals("2")) {
								tipo_pers.addContent("J"); // tipo_persona: F|J
							}
						}
					}
				}

				Element nomb_pers = new Element("nomb_pers");
				bloque_asegurado.addContent(nomb_pers);
				{
					if (!isEmpty(datosAsegurado.get("TNOMBRE"))) {
						nomb_pers.addContent(String.valueOf(datosAsegurado.get("TNOMBRE"))); // string 30
					} else {
						if (!isEmpty(datosAsegurado.get("TAPELLI1"))) {
							nomb_pers.addContent(String.valueOf(datosAsegurado.get("TAPELLI1"))); // string 30
						}
					}
				}

				Element ape1_pers = new Element("ape1_pers");
				bloque_asegurado.addContent(ape1_pers);
				{
					ape1_pers.addContent(String.valueOf(datosAsegurado.get("TAPELLI1"))); // string 30
				}

				Element ape2_pers = new Element("ape2_pers");
				if (!isEmpty(datosAsegurado.get("TAPELLI2"))) {
					bloque_asegurado.addContent(ape2_pers);
					{
						ape2_pers.addContent(String.valueOf(datosAsegurado.get("TAPELLI2"))); // string 30
					}
				}

				Element id_pers = new Element("id_pers");
				bloque_asegurado.addContent(id_pers);
				{
					Element tipo_id = new Element("tipo_id");
					id_pers.addContent(tipo_id);
					{
						if (String.valueOf(datosAsegurado.get("CTIPPER")).equals("1")) {
							tipo_id.addContent("N"); // string 1: N|R
						} else {
							if (String.valueOf(datosAsegurado.get("CTIPPER")).equals("4")) {
								tipo_id.addContent("R"); // string 1: N|R
							}
						}
					}

					Element num_id = new Element("num_id");
					id_pers.addContent(num_id);
					{
						num_id.addContent(StringUtils.substring(String.valueOf(datosAsegurado.get("NNUMIDE")), 0, 10)); // string
																														// 10
					}
				}

				Element fnac_pers = new Element("fnac_pers");
				bloque_asegurado.addContent(fnac_pers);
				{
					fnac_pers.addContent(sdf_YYYY_MM_DD.format((Date) (datosAsegurado.get("FNACIMI"))));
				}

				Element sexo_pers = new Element("sexo_pers");
				bloque_asegurado.addContent(sexo_pers);
				{
					if (String.valueOf(datosAsegurado.get("CSEXPER")).equals("1")) {
						sexo_pers.addContent("H"); // H|M Hombre Mujer
					} else {
						if (String.valueOf(datosAsegurado.get("CSEXPER")).equals("2")) {
							sexo_pers.addContent("M"); // H|M Hombre Mujer
						}
					}
				}

				Map mapContactosAseg = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFFIJO(
						(BigDecimal) datosAsegurado.get("SPERSON"), (BigDecimal) datosAsegurado.get("CAGENTE"));
				logger.debug("mapContactosAseg tlfn_pers: " + mapContactosAseg);
				tratarRETURNyMENSAJES(request, mapContactosAseg);

				Element tlfn_pers = new Element("tlfn_pers");
				bloque_asegurado.addContent(tlfn_pers);
				{
					tlfn_pers.addContent(StringUtils
							.substring(this.convertTlfNumber(String.valueOf(mapContactosAseg.get("TVALCON"))), 0, 10)); // string
																														// 10
				}

				mapContactosAseg = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOTLFMOVIL(
						(BigDecimal) datosAsegurado.get("SPERSON"), (BigDecimal) datosAsegurado.get("CAGENTE"));
				logger.debug("mapContactosAseg tlfn_movil_pers: " + mapContactosAseg);
				tratarRETURNyMENSAJES(request, mapContactosAseg);

				Element tlfn_movil_pers = new Element("tlfn_movil_pers");
				if (!isEmpty(mapContactosAseg.get("TVALCON"))) {
					bloque_asegurado.addContent(tlfn_movil_pers); // string 10
					{
						tlfn_movil_pers.addContent(StringUtils.substring(
								this.convertTlfNumber(String.valueOf(mapContactosAseg.get("TVALCON"))), 0, 10));
					}
				}

				mapContactosAseg = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTCONTACTOMAIL(
						(BigDecimal) datosAsegurado.get("SPERSON"), (BigDecimal) datosAsegurado.get("CAGENTE"));
				logger.debug("mapContactosAseg email_pers: " + mapContactosAseg);
				tratarRETURNyMENSAJES(request, mapContactosAseg);

				Element email_pers = new Element("email_pers");
				if (!isEmpty(mapContactosAseg.get("TVALCON"))) {
					bloque_asegurado.addContent(email_pers);
					email_pers.addContent(String.valueOf(mapContactosAseg.get("TVALCON")));
				}

				/* Direcciones del Asegurado */
				Map mapDireccionesAseg = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTDIRECCION(
						(BigDecimal) datosAsegurado.get("SPERSON"), new BigDecimal(1));
				logger.debug("mapDireccionesAseg: " + mapDireccionesAseg);
				tratarRETURNyMENSAJES(request, mapDireccionesAseg);

				Map datosDireccionAseg = (Map) mapDireccionesAseg.get("PDIRECCIONES");
				logger.debug("datosDireccionAseg: " + datosDireccionAseg);

				Element domicilio_pers = new Element("domicilio_pers");
				bloque_asegurado.addContent(domicilio_pers);
				{
					Element part_domi = new Element("part_domi");
					if (!isEmpty(datosDireccionAseg.get("TSIGLAS"))) {
						domicilio_pers.addContent(part_domi);
						part_domi.addContent(String.valueOf(datosDireccionAseg.get("TSIGLAS")));
					}

					Element nomb_domi = new Element("nomb_domi");
					domicilio_pers.addContent(nomb_domi);
					{
						nomb_domi.addContent(
								StringUtils.substring(String.valueOf(datosDireccionAseg.get("TNOMVIA")), 0, 42));
					}

					Element nume_domi = new Element("nume_domi");
					if (!isEmpty(datosDireccionAseg.get("NNUMVIA"))) {
						domicilio_pers.addContent(nume_domi);
						nume_domi.addContent(String.valueOf(datosDireccionAseg.get("NNUMVIA")));
					}

					Element rest_domi = new Element("rest_domi");
					if (!isEmpty(datosDireccionAseg.get("TCOMPLE"))) {
						domicilio_pers.addContent(rest_domi);
						rest_domi.addContent(
								StringUtils.substring(String.valueOf(datosDireccionAseg.get("TCOMPLE")), 0, 50));
					}

					Element pobl_domi = new Element("pobl_domi");
					if (!isEmpty(datosDireccionAseg.get("TPOBLAC"))) {
						domicilio_pers.addContent(pobl_domi);
						pobl_domi.addContent(
								StringUtils.substring(String.valueOf(datosDireccionAseg.get("TPOBLAC")), 0, 30));
					}

					Element copo_domi = new Element("copo_domi");
					if (!isEmpty(datosDireccionAseg.get("CPOSTAL"))) {
						domicilio_pers.addContent(copo_domi);
						copo_domi.addContent(String.valueOf(datosDireccionAseg.get("CPOSTAL")));
					}

					Element provincia_domi = new Element("provincia_domi");
					if (!isEmpty(datosDireccionAseg.get("TPROVIN"))) {
						domicilio_pers.addContent(provincia_domi);
						provincia_domi.addContent(String.valueOf(datosDireccionAseg.get("TPROVIN")));
					}

					Element codi_domi = new Element("codi_domi");
					if (!isEmpty(datosDireccionAseg.get("CPAIS"))) {
						domicilio_pers.addContent(codi_domi);
						codi_domi.addContent(
								this.paisISO(request, CEMPRES, String.valueOf(datosDireccionAseg.get("CPAIS"))));
					}
				}

				Map mapPaisAseg = pac_iax_persona.ejecutaPAC_IAX_PERSONA__F_GET_ESTNACIONALIDADDEFECTO(
						(BigDecimal) datosAsegurado.get("SPERSON"), (BigDecimal) datosAsegurado.get("CAGENTE"));
				logger.debug("mapPaisAseg : " + mapPaisAseg);
				tratarRETURNyMENSAJES(request, mapPaisAseg);

				Element pais_origen = new Element("pais_origen");
				if (!isEmpty(datosAsegurado.get("CPAIS"))) {
					bloque_asegurado.addContent(pais_origen);
					pais_origen.addContent(this.paisISO(request, CEMPRES, String.valueOf(datosAsegurado.get("CPAIS")))); // string
																															// 3
																															// ad
																															// es
																															// pt
				}

				Element nacionalidad_pers = new Element("nacionalidad_pers");
				if (!isEmpty(datosAsegurado.get("TPAIS"))) {
					bloque_asegurado.addContent(nacionalidad_pers);
					nacionalidad_pers
							.addContent(StringUtils.substring(String.valueOf(datosAsegurado.get("TPAIS")), 0, 30)); // string
																													// 30
				}
			}
		}

		// Coberturas 0..17
		for (int i = 0; i < listaGarantias.size(); i++) {
			BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) listaGarantias.get(i)).get("OB_IAX_GARANTIAS"))
					.get("CGARANT");
			Map seleccionado = getObjetoDeLista(listaGarantias, CGARANT_SELECT.toString(), "CGARANT",
					"OB_IAX_GARANTIAS");
			BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL"))) ? (BigDecimal) seleccionado.get("ICAPITAL")
					: null);

			String CGARANT = this.buscarMapDeEquivalenciasParaHOST(request, CEMPRES, "CODIGO_GARAN",
					String.valueOf(CGARANT_SELECT));
			if ((!isEmpty(ICAPITAL)) && (!isEmpty(CGARANT))) {
				Element cobertura = new Element("cobertura"); //

				if (!isEmpty(CGARANT)) {
					mensaje_iAxis_bonsai.addContent(cobertura);
					cobertura.setAttribute("codi_cobe", CGARANT);
					Element impo_capi = new Element("impo_capi"); // positiveInteger, OJO: Bonsai solo trata enteros,
																	// ver mail 7.2.2012
					cobertura.addContent(impo_capi);
					{
						BigDecimal importGar = new BigDecimal(ICAPITAL.intValue());
						impo_capi.addContent(this.bigdecimal2intAsString(importGar)); // positiveInteger, OJO: Bonsai
																						// solo trata enteros, ver mail
																						// 7.2.2012
					}
				}
			}
		}

		return retVal;
	}

	/***************************************************
	 * private String descPais (HttpServletRequest request, String codPais) throws
	 * Exception { String retVal="";
	 * 
	 * PAC_IAX_LISTVALORES pac_iax_listvalores = new
	 * PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
	 * Map
	 * listaPaises=pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
	 * tratarRETURNyMENSAJES(request, listaPaises);
	 * 
	 * logger.debug ("codPais="+codPais); for (int i=0; i<listaPaises.size(); i++) {
	 * if (codPais.equals((String)(((Map)listaPaises.get(i)).get("CPAIS"))))
	 * retVal=(String)(((Map)listaPaises.get(i)).get("CPAIS")); }
	 * 
	 * return retVal; }
	 ****************************************************/

	private String paisISO(HttpServletRequest request, BigDecimal CEMPRES, String codPais) {
		String retVal = "";

		String paisAxis = this.buscarMapDeEquivalenciasParaHOST(request, CEMPRES, "PAISES", codPais);
		if (!isEmpty(paisAxis))
			retVal = paisAxis;
		else {
			logger.debug("codPais=" + codPais);
			retVal = "724";
		}

		return retVal;
	}

	public static String bigdecimal2intAsString(BigDecimal b) {

		String retVal = "";

		if (b != null)
			retVal = "" + b.intValue();

		return retVal;
	}

	public static String convertTlfNumber(String numTeleFax) {
		String retVal = "";

		for (int i = 0; i < numTeleFax.length(); i++) {
			String posChar = "" + numTeleFax.charAt(i);
			if (StringUtils.isNumeric(posChar))
				retVal = retVal + posChar;
		}

		return retVal;
	}

	private Map dbLeeDatosPoliza(HttpServletRequest request) throws Exception {
		Map datosPoliza = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(null);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA return: " + datosPoliza);

		return (Map) tratarRETURNyMENSAJES(request, datosPoliza);
	}

	private List dbLeeAsegurados(HttpServletRequest request, BigDecimal NRIESGO, BigDecimal SPRODUC) throws Exception {
		Map mapAsegurados = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS(NRIESGO, SPRODUC);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEASEGURADOS return: " + mapAsegurados);

		return (List) tratarRETURNyMENSAJES(request, mapAsegurados);
	}

	private List dbLeeGarantias(HttpServletRequest request, BigDecimal NRIESGO, BigDecimal CPARTIDA) throws Exception {
		Map mapGarantias = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS(NRIESGO, CPARTIDA);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS return: " + mapGarantias);

		return (List) tratarRETURNyMENSAJES(request, mapGarantias);
	}

	private Map dbLeeAgente(HttpServletRequest request, BigDecimal CAGENTE) throws Exception {
		Map mapAgente = new PAC_IAX_REDCOMERCIAL((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(CAGENTE);
		logger.debug("mapAgente: " + mapAgente);
		tratarRETURNyMENSAJES(request, mapAgente);

		BigDecimal SPERSON_AGENTE = !isEmpty(mapAgente) ? (BigDecimal) ((Map) mapAgente.get("AGENTE")).get("SPERSON")
				: null;
		logger.debug("SPERSON_AGENTE: " + SPERSON_AGENTE);

		Map mapPersonaAgente = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_PUBLICA(SPERSON_AGENTE);
		logger.debug("mapPersonaAgente: " + mapPersonaAgente);
		tratarRETURNyMENSAJES(request, mapPersonaAgente);

		return (Map) mapPersonaAgente.get("OBPERSONA");
	}

	/**
	 * Recupera un Properties-objeto con la relaci�n entre el codigo de AXIS como
	 * origen, y equivalente en el HOST. Los valores estan agrupados por
	 * INT_CODIGOS_EMP.CCODIGO - una buena colecci�n de CCODIGO hay en esa clase
	 * como String final's. Aqui NO se cierra la conexion!
	 * 
	 * @param PEMP
	 * @param PCAMPO
	 * @param PVALAXIS
	 * @return
	 */

	private String buscarMapDeEquivalenciasParaHOST(HttpServletRequest request, BigDecimal PEMP, String PCAMPO,
			String PVALAXIS) {
		String retVal = "";

		try {
			HashMap m = new PAC_INT_ONLINE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_INT_ONLINE__F_OBTENER_VALOR_EMP(String.valueOf(PEMP), PCAMPO, PVALAXIS);
			logger.debug("m: " + m);
			tratarRETURNyMENSAJES(request, m);

			retVal = (String) m.get("RETURN");
		} catch (Exception e) {
			logger.error("No se ha podido montar el MAP de equivalencias", e);
		}

		return retVal;
	}
}
