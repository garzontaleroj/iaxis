package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import axis.util.Constantes;
import axis.util.Traductor;

public class AjaxContainerService {
	private Object ajaxContainer = null;
	private List ajaxErrorContainer = new ArrayList();
	private List ajaxInfoContainer = new ArrayList();
	private HttpServletRequest request = null;

	public AjaxContainerService() {
	}

	/* RKV bug 10467 */
	public AjaxContainerService(HttpServletRequest request) {
		this.request = request;
	}
	/* RKV bug 10467 */

	public void setAjaxContainer(Object ajaxContainer) {
		this.ajaxContainer = ajaxContainer;
	}

	public Object getAjaxContainer() {
		return ajaxContainer;
	}

	public void setAjaxErrorContainer(List ajaxErrorContainer) {
		this.ajaxErrorContainer = ajaxErrorContainer;
	}

	public List getAjaxErrorContainer() {
		return ajaxErrorContainer;
	}

	public void setAjaxInfoContainer(List ajaxInfoContainer) {
		this.ajaxInfoContainer = ajaxInfoContainer;
	}

	public List getAjaxInfoContainer() {
		return ajaxInfoContainer;
	}

	/**
	 * M�todo que se encarga de gestionar los objetos devueltos por pl. Si hay
	 * mensajes de error, estos seran acumulables
	 * 
	 * @param map Lo que devuelve pl
	 * @return Devuelve el objeto para procesar. S�lo si hay errores, se devolver�
	 *         un objeto vacio. �stos son tratados mas adelante por el sistema ajax.
	 */
	public Object rellenarPlAContenedorAjax(Map map) {
		return rellenarPlAContenedorAjax(map, null);
	}

	/**
	 * M�todo que se encarga de gestionar los objetos devueltos por pl. Si hay
	 * mensajes de error, estos seran acumulables
	 * 
	 * @param map       Lo que devuelve pl
	 * @param returnAlt String que hace referencia a cualquier HAshMap que devuelva
	 *                  el objeto pl de m�s, es decir, si adem�s de RETURN y
	 *                  MENSAJES, devuelve mas cosas. Si no existe, ponerlo como
	 *                  null.
	 * @return Devuelve el objeto para procesar. S�lo si hay errores, se devolver�
	 *         un objeto vacio. �stos son tratados mas adelante por el sistema ajax.
	 */
	public Object rellenarPlAContenedorAjax(Map map, String[] returnAlt) {
		Object plReturn = null;
		Map m_tmp = new HashMap();

		// Si hay un error pero ese error es de informaci�n (es decir no es un error)
		boolean esMensajeInfo = !AxisBaseService.isEmpty(map.get("MENSAJES"))
				&& !AxisBaseService.isEmpty(((List) map.get("MENSAJES")).get(0))
				&& !AxisBaseService.isEmpty(((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
				&& !AxisBaseService.isEmpty(
						((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES")).get("TIPERROR"))
				&& (((BigDecimal) ((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
						.get("TIPERROR")).intValue() == 2);

		// Si hay errores (generales+fatales)
		if (!AxisBaseService.isEmpty(map.get("MENSAJES")) && !esMensajeInfo) {
			tratarMensajesParaAjax(map, m_tmp, this.getAjaxErrorContainer(), esMensajeInfo);
			plReturn = tratarReturnParaAjax(returnAlt, map);
			// Si no hay errores (info+RETURN)
		} else {
			if (esMensajeInfo)
				tratarMensajesParaAjax(map, m_tmp, this.getAjaxInfoContainer(), esMensajeInfo);

			plReturn = tratarReturnParaAjax(returnAlt, map);

		}

		return plReturn;
	}

	/**
	 * M�todo que a�ade una excepci�n al contenedor de mensajes de error para AJAX
	 * 
	 * @param e La excepci�n a a�adir
	 */
	public void rellenarExcepcionAContenedorAjax(Exception e) {
		Map m_errores = new HashMap();

		if (AxisBaseService.isEmpty(this.getAjaxErrorContainer())) {
			m_errores.put("m__errores", new Integer(1));
			this.getAjaxErrorContainer().add(m_errores);
		}
		this.getAjaxErrorContainer().add((Map) guardarExcepcionParaAjaxContainer("1000050",
				new Object[] { e.toString() }, Constantes.MENSAJE_ERROR));
	}

	/**
	 * M�todo que devuelve un objeto de tipo RETURN (Object) de pl u otro con ese
	 * mismo mas otros que la funci�n pl pueda devolver (Object[]).
	 * 
	 * @param returnAlt Posibles KeyCodes que pueda devolver el map de la funci�n pl
	 * @param map       Map que devuelve la funci�n pl.
	 * @return el objeto RETURN o bi�n el objeto[]->RETURN + otros keyCodes. Si
	 *         existe mensajes de info en el paquete map, se a�aden tb.
	 */
	private Object tratarReturnParaAjax(String[] returnAlt, Map map) {
		// Aqui guardamos los mensajes de info
		Object plReturn = null;

		if (AxisBaseService.isEmpty(returnAlt)) {
			plReturn = map.get("RETURN");
		} else {
			// Si adem�s de RETURN devuelve otros HASHMAPS
			Object[] arrPl = new Object[(returnAlt.length + 1)];
			arrPl[0] = map.get("RETURN");
			for (int i = 0; i < returnAlt.length; i++)
				arrPl[i + 1] = map.get(returnAlt[i]);

			plReturn = arrPl;
		}

		return plReturn;
	}

	/**
	 * M�todo que guarda los mensajes de error y de info en contenedores por
	 * separado. �stos son acumulativos respectivamente.
	 * 
	 * @param map           Map que proviene de la consulta pl.
	 * @param m_tmp         Map temporal para tratar de que tipo �s el mensaje que
	 *                      llega.
	 * @param tmp           Map temporal que guarda la informaci�n del mensaje
	 *                      correspondiente.
	 * @param ajaxMensajes  Contenedor que guarda el tipo de mensaje que llega.
	 *                      Representan dos contenedores (el de errores o el de
	 *                      info)
	 * @param esMensajeInfo Bool que nos dice si el mensaje es de info o de error.
	 */
	private void tratarMensajesParaAjax(Map map, Map m_tmp, List ajaxMensajes, boolean esMensajeInfo) {
		Integer tipError = null;
		BigDecimal cError = null;
		String tError = null;

		if (AxisBaseService.isEmpty(ajaxMensajes)) {
			if (esMensajeInfo)
				m_tmp.put("m__infos", new Integer(1));
			else
				m_tmp.put("m__errores", new Integer(1));
			ajaxMensajes.add(m_tmp);
		}

		List<Map> MENSAJES = (List<Map>) map.get("MENSAJES");

		if (!AxisBaseService.isEmpty(MENSAJES)) {

			for (Map mensaje : MENSAJES) {

				Map tmp = new HashMap();

				if (!AxisBaseService.isEmpty(mensaje) && !AxisBaseService.isEmpty(mensaje.get("OB_IAX_MENSAJES"))) {

					if (!AxisBaseService.isEmpty(((Map) mensaje.get("OB_IAX_MENSAJES")).get("TIPERROR"))) {
						tipError = guardarTipErrorParaAjaxContainer(
								(BigDecimal) ((Map) mensaje.get("OB_IAX_MENSAJES")).get("TIPERROR"));
					} else
						tipError = null;

					if (!AxisBaseService.isEmpty(((Map) mensaje.get("OB_IAX_MENSAJES")).get("CERROR"))) {
						cError = (BigDecimal) ((Map) mensaje.get("OB_IAX_MENSAJES")).get("CERROR");
					} else
						cError = null;

					if (!AxisBaseService.isEmpty(((Map) mensaje.get("OB_IAX_MENSAJES")).get("TERROR"))) {
						tError = (String) ((Map) mensaje.get("OB_IAX_MENSAJES")).get("TERROR");
					} else
						tError = null;

					if (esMensajeInfo) {
						tmp.put("TIPINFO", tipError);
						tmp.put("CINFO", cError);
						tmp.put("TINFO", tError);
					} else {
						tmp.put("TIPERROR", tipError);
						tmp.put("CERROR", cError);
						tmp.put("TERROR", tError);
					}

					ajaxMensajes.add(tmp);

				}
			}
		}
	}

	/**
	 * M�todo que devuelve el objeto real para ser tratado por el sistema AJAX
	 * 
	 * @return Devuelve la Collection correspondiente al tipo de contenedor
	 *         rellenado.
	 */
	public Object procesarContenedorAjax() {
		Object ajaxDef = null;
		List ajax = new ArrayList();

		/* RKV bug 10467 */
		if (request != null && AxisBaseService.isEmpty(this.getAjaxErrorContainer())) {
			String requestURI = request.getRequestURI();
			String whoami = requestURI.contains("axis_")
					? requestURI.substring(requestURI.indexOf("axis_") + 5, requestURI.indexOf(".do"))
					: requestURI.substring(requestURI.indexOf("modal_") + 5, requestURI.indexOf(".do"));

			if ("axisctr026".equals(whoami))
				whoami = "axisctr002";

			/*
			 * System.out.println(requestURI); System.out.println(whoami);
			 */

			String MENSAJE_INI = (String) request.getSession().getAttribute(whoami + "_MENSAJE_INI");

			if (MENSAJE_INI != null) {
				try {
					guardarInformacionAContenedorAjax(
							Traductor.traducir(AxisBaseService.getLocale(request).toString(), MENSAJE_INI));
				} catch (Exception e) {
				}
			}
		}
		/* RKV bug 10467 */

		if (!AxisBaseService.isEmpty(this.getAjaxErrorContainer()))
			ajaxDef = this.getAjaxErrorContainer();
		else
			ajaxDef = ((AxisBaseService.isEmpty(this.getAjaxContainer())) ? null : this.getAjaxContainer());

		if (ajaxDef instanceof List)
			ajaxDef = (List) ajaxDef;
		else if (ajaxDef instanceof Map)
			ajaxDef = (Map) ajaxDef;
		else if (ajaxDef instanceof BigDecimal)
			ajaxDef = (BigDecimal) ajaxDef;
		else if (AxisBaseService.isEmpty(ajaxDef))
			// Fiquem per defecte una colecci�
			ajaxDef = new HashMap();

		if (!AxisBaseService.isEmpty(this.getAjaxInfoContainer())) {
			ajax.add(ajaxDef);
			ajax.add(this.getAjaxInfoContainer());

			// Vaciamos las var de instancia una vez hemos procesado el contenedor
			this.vaciarContenedores();
			return ajax;
		}

		// Vaciamos las var de instancia una vez hemos procesado el contenedor
		this.vaciarContenedores();
		return ajaxDef;
	}

	/**
	 * M�todo que genera un hashMap de error con la finalidad de printearlo en
	 * xml-ajax
	 * 
	 * @param mensajeClave
	 * @param mensajeInfos
	 * @param mensajeTipo
	 * @return EL map resultante
	 */
	public Map guardarExcepcionParaAjaxContainer(String mensajeClave, Object[] mensajeInfos, Integer mensajeTipo) {
		return guardarExcepcionParaAjaxContainer(mensajeClave, mensajeInfos, mensajeTipo.intValue());
	}

	/**
	 * M�todo que genera un hashMap de error con la finalidad de printearlo en
	 * xml-ajax
	 * 
	 * @param mensajeClave
	 * @param mensajeInfos
	 * @param mensajeTipo
	 * @return El map resultante
	 */
	public Map guardarExcepcionParaAjaxContainer(String mensajeClave, Object[] mensajeInfos, int mensajeTipo) {
		Map mensajeTotal = new HashMap();

		mensajeTotal.put("m" + "__clave", mensajeClave);
		mensajeTotal.put("TIPERROR", new Integer(mensajeTipo));

		if (mensajeInfos != null && mensajeInfos.length > 0) {
			String mensajeInfosS = new String();
			for (int i = 0; i < mensajeInfos.length; i++) {
				if (i == 0)
					mensajeInfosS = ((String) mensajeInfos[i]);
				else
					mensajeInfosS = " ," + ((String) mensajeInfos[i]);
			}
			mensajeTotal.put("TERROR", mensajeInfosS);
		}

		return mensajeTotal;
	}

	private Integer guardarTipErrorParaAjaxContainer(BigDecimal TIPERROR) {
		int mensajeTipo = Constantes.MENSAJE_INFO;

		switch (TIPERROR.intValue()) {
		case 1:
			mensajeTipo = Constantes.MENSAJE_ERROR;
			break;
		case 3:
			mensajeTipo = Constantes.MENSAJE_WARN;
			break;
		case 4:
			mensajeTipo = Constantes.MENSAJE_FATAL;
			break;
		}

		return new Integer(mensajeTipo);
	}

	/**
	 * M�todo que rellena el xml de proceso AJAX cuando no necesitamos
	 * explicitamente rellenar el xml de respuesta. De esta manera tenemos mayor
	 * acceso a la validaci�n de la llamada
	 * 
	 * @param texto ->Podemos poner el Constantes.OPERACION_AJAX_OK o el
	 *              OPERACION_AJAX_ERROR
	 * @return
	 */
	public void guardarContenidoFinalAContenedorAjax(String texto) {
		Map infoMsg = new HashMap();
		infoMsg.put(texto, new BigDecimal(1));
		this.setAjaxContainer(infoMsg);
	}

	/**
	 * M�todo que rellena el xml de proceso AJAX con el Objeto correspondiente al
	 * Object valor
	 * 
	 * @param plReturn Lo que retorna el RETURN de pl (el que se quiere procesar en
	 *                 el jsp)
	 * @return
	 */
	public void guardarContenidoFinalAContenedorAjax(Object plReturn) {
		this.setAjaxContainer(plReturn);
	}

	/**
	 * M�todo con el que crearemos un nuevo mensaje de informaci�n
	 * 
	 * @param msgInfo Mensaje que metemos en el contenedor de informaci�n
	 */
	public void guardarInformacionAContenedorAjax(String msgInfo) {
		Map m_tmp = new HashMap();
		Map tmp = new HashMap();

		if (AxisBaseService.isEmpty(this.getAjaxInfoContainer())) {
			m_tmp.put("m__infos", new Integer(1));
			this.getAjaxInfoContainer().add(m_tmp);
		}
		tmp.put("TIPINFO", new BigDecimal(2));
		tmp.put("CINFO", new Integer(0));
		tmp.put("TINFO", msgInfo);

		this.getAjaxInfoContainer().add(tmp);
	}

	/**
	 * M�todo con el que crearemos un nuevo mensaje de error
	 * 
	 * @param msgError List de info para rellenar
	 */
	public void guardarErrorAContenedorAjax(String msgError) {
		Map m_tmp = new HashMap();
		Map tmp = new HashMap();

		if (AxisBaseService.isEmpty(this.getAjaxErrorContainer())) {
			m_tmp.put("m__errores", new Integer(1));
			this.getAjaxErrorContainer().add(m_tmp);
		}
		tmp.put("TIPERROR", new Integer(2001));
		tmp.put("CERROR", new Integer(0));
		tmp.put("TERROR", msgError);

		this.getAjaxErrorContainer().add(tmp);
	}

	/**
	 * M�todo que vacia los contenedores ajax. As� aseguramos que en cada servicio
	 * se empieza con los contenedores vacios.
	 */
	private void vaciarContenedores() {
		if (!AxisBaseService.isEmpty(this.getAjaxContainer()))
			this.setAjaxContainer(null);
		if (!AxisBaseService.isEmpty(this.getAjaxErrorContainer()))
			this.setAjaxErrorContainer(new ArrayList());
		if (!AxisBaseService.isEmpty(this.getAjaxInfoContainer()))
			this.setAjaxInfoContainer(new ArrayList());
	}
}
