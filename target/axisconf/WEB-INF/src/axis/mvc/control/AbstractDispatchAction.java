//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.mvc.control;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.actions.DispatchAction;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class AbstractDispatchAction extends DispatchAction {
	private static boolean ayudaAbierta;

	public static boolean isAyudaAbierta() {
		return ayudaAbierta;
	}

	public static void setAyudaAbierta(boolean ayudaAbierta) {
		AbstractDispatchAction.ayudaAbierta = ayudaAbierta;
	}

	public static void pushPila(HttpServletRequest request) {
		pushPila(request, null);
	}

	public static void pushPila(HttpServletRequest request, Map passTopPila) {
//        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList pila = getPila(request);
		pila.add(passTopPila != null ? passTopPila : new HashMap());
		storePila(request, pila);
	}

	public static HashMap popPila(HttpServletRequest request) {
//        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList pila = getPila(request);
		if (!AxisBaseService.isEmpty(pila)) {
			HashMap tempM = (HashMap) pila.get(pila.size() - 1);
			pila.remove(pila.size() - 1);
			return tempM;
		}
		storePila(request, pila);
		return null;
	}

	public static void topPila(HttpServletRequest request, String nombre, Object valor) {
//        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList pila = getPila(request);
		HashMap tempM = (HashMap) pila.get(pila.size() - 1);
		tempM.put(nombre, valor);
		storePila(request, pila);

	}

	public static Object removeTopPila(HttpServletRequest request, String nombre) {
//        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList pila = getPila(request);
		if (!AxisBaseService.isEmpty(pila)) {
			HashMap tempM = (HashMap) pila.get(pila.size() - 1);
			Object retVal = tempM.get(nombre);
			tempM.remove(nombre);
			return retVal;
		}
		storePila(request, pila);
		return null;
	}

	public static Object topPila(HttpServletRequest request, String nombre) {
//        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList pila = getPila(request);
		if (!AxisBaseService.isEmpty(pila)) {
			HashMap tempM = (HashMap) pila.get(pila.size() - 1);
			return tempM.get(nombre);
		}
		storePila(request, pila);
		return null;
	}

	public static HashMap topPila(HttpServletRequest request) {
//        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
		ArrayList pila = getPila(request);
		if (!AxisBaseService.isEmpty(pila)) {
			return (HashMap) pila.get(pila.size() - 1);
		}
		storePila(request, pila);
		return null;
	}

	public static ArrayList getPila(HttpServletRequest request) {
		ArrayList pila = (ArrayList) request.getSession().getAttribute(Constantes.PILA);
		if (pila == null) {
			pila = new ArrayList();
		}
		return pila;
	}

	public static void storePila(HttpServletRequest request, ArrayList pila) {
		request.getSession().setAttribute(Constantes.PILA, pila);
	}

	public static ActionForward navegar(HttpServletRequest request, ActionForward quedarForward) {
		int maxisTipo = AbstractDispatchAction.maxistipoMENSAJE(request).intValue();
		if (maxisTipo < Constantes.MENSAJE_ERROR) {
			return (ActionForward) request.getAttribute(Constantes.FORWARDACTION);
		} else {
			return quedarForward;
		}
	}

	/**
	 * Retorna del objeto de la session Const.FLUJODETRABJO el dato asociado a la
	 * clave.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 * @param clave
	 * @return
	 */
	public static Object flujodetrabajoObject(HttpServletRequest request, String clave) {
		HashMap flujodetrabajo = (HashMap) request.getSession().getAttribute(Constantes.FLUJODETRABAJO);
		return flujodetrabajo.get(clave);
	}

	public static void guardarMensaje(HttpServletRequest request, String mensajeClave, Object[] mensajeInfos,
			Integer mensajeTipo) {
		guardarMensaje(request, mensajeClave, mensajeInfos, mensajeTipo.intValue());
	}

	/**
	 * Converte el array de posibles mensajes mensajeInfosS a un ArrayList para que
	 * sea mas facil de imprimir/leer en consola.
	 * 
	 * @param mensajeInfosS
	 * @return
	 */
	public static ArrayList mensajeInfos2List(Object[] mensajeInfosS) {
		ArrayList retVal = new ArrayList();
		if (mensajeInfosS == null)
			return null;
		for (int i = 0; i < mensajeInfosS.length; i++) {
			retVal.add(mensajeInfosS[i]);
		}
		return retVal;
	}

	/**
	 * Genera un ActionForward a partir de par�metros del mapping para recuperar la
	 * url del mismo form al recargarlo en caso de que haya errores.
	 */
	public static ActionForward recargarThisForm(ActionMapping mapping) {

		String url = mapping.getPath() + ".do?" + mapping.getParameter() + "=form";

		return new ActionForward(url);

	}

	/**
	 * Genera un ActionForward a partir de un String para recuperar la url del mismo
	 * form al recargarlo en caso de que haya errores.
	 */
	public static ActionForward recargarThisForm(String url) {

		return new ActionForward(url);

	}

	public static void guardarMensaje(HttpServletRequest request, String mensajeClave, Object[] mensajeInfos,
			int mensajeTipo) {
		HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
		if (mensajes.get("m" + "__maxistipo") == null)
			mensajes.put("m" + "__maxistipo", new Integer(Constantes.MENSAJE_INFO));

		if (mensajes.get("m" + "__clave") == null)
			mensajes.put("m" + "__clave", new Vector());
		if (mensajes.get("m" + "__infos") == null)
			mensajes.put("m" + "__infos", new Vector());
		if (mensajes.get("m" + "__nivel") == null)
			mensajes.put("m" + "__nivel", new Vector());

		Integer mensajeTipoActual = (Integer) mensajes.get("m" + "__maxistipo");

		Vector mensajeClaveVector = (Vector) mensajes.get("m" + "__clave");
		Vector mensajeInfosVector = (Vector) mensajes.get("m" + "__infos");
		Vector mensajeNivelVector = (Vector) mensajes.get("m" + "__nivel");

		mensajeClaveVector.addElement(mensajeClave);
		mensajeInfosVector.addElement(mensajeInfos);
		mensajeNivelVector.addElement(new Integer(mensajeTipo));

		if (mensajeTipo > mensajeTipoActual.intValue()) {
			mensajes.put("m" + "__maxistipo", new Integer(mensajeTipo));
		}
	}

	/**
	 * M�todo que genera un hashMap de error con la finalidad de printearlo en
	 * xml-ajax
	 * 
	 * @param request
	 * @param mensajeClave
	 * @param mensajeInfos
	 * @param mensajeTipo
	 * @return EL map resultante
	 */
	public static Map guardarMensajeToXml(HttpServletRequest request, String mensajeClave, Object[] mensajeInfos,
			Integer mensajeTipo) {
		return guardarMensajeToXml(request, mensajeClave, mensajeInfos, mensajeTipo.intValue());
	}

	/**
	 * M�todo que genera un hashMap de error con la finalidad de printearlo en
	 * xml-ajax
	 * 
	 * @param request
	 * @param mensajeClave
	 * @param mensajeInfos
	 * @param mensajeTipo
	 * @return El map resultante
	 */
	public static Map guardarMensajeToXml(HttpServletRequest request, String mensajeClave, Object[] mensajeInfos,
			int mensajeTipo) {
		Map mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
		Map mensajeTotal = new HashMap();
		List mensajesInfo = new ArrayList();
		Map mensajesInfoCampos = new HashMap();

		mensajeTotal.put("m" + "__excepciones", "1");
		mensajeTotal.put("m" + "__clave", mensajeClave);
		mensajeTotal.put("m" + "__nivel", new Integer(mensajeTipo));
		mensajeTotal.put("m" + "__maxistipo", new Integer(Constantes.MENSAJE_INFO));

		// Si hay descripcion de mensajes
		if (mensajeTipo > Constantes.MENSAJE_INFO) {
			String mensajeInfosS = "[" + mensajeInfos + "]";
			if (mensajeInfos != null && mensajeInfos.length > 0) {
				for (int i = 0; i < mensajeInfos.length; i++) {
					mensajeInfosS = ((String) mensajeInfos[i]);
					mensajesInfoCampos.put("m" + "__info", mensajeInfosS);
				}
				mensajesInfo.add(mensajesInfoCampos);
			}
		}

		mensajeTotal.put("m" + "__infos", mensajesInfo);

		return mensajeTotal;
	}

	public static Integer maxistipoMENSAJE(HttpServletRequest request) {
		HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
		if (mensajes.get("m" + "__maxistipo") == null)
			mensajes.put("m" + "__maxistipo", new Integer(Constantes.MENSAJE_INFO));
		Integer mensajeTipoActual = (Integer) mensajes.get("m" + "__maxistipo");
		return mensajeTipoActual;
	}

	public static boolean maxistipoMENSAJEesERROR(HttpServletRequest request) {
		HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
		if (mensajes.get("m" + "__maxistipo") == null)
			mensajes.put("m" + "__maxistipo", new Integer(Constantes.MENSAJE_INFO));
		Integer mensajeTipoActual = (Integer) mensajes.get("m" + "__maxistipo");
		if (mensajeTipoActual.intValue() == Constantes.MENSAJE_ERROR
				|| mensajeTipoActual.intValue() == Constantes.MENSAJE_ERROR) {
			return true;
		} else {
			return false;
		}
	}

	public static boolean hayMensajes(HttpServletRequest request) {
		HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);
		return (mensajes.size() > 0);
	}

	public static void parsearMensajes(HttpServletRequest request, List MENSAJES) {
		if (MENSAJES == null || MENSAJES.size() == 0)
			return;

		HashMap mensajes = (HashMap) request.getAttribute(Constantes.MENSAJES);

		for (int i = 0; i < MENSAJES.size(); i++) {
			HashMap mensaje = (HashMap) MENSAJES.get(i);
			// System.out.println("MENSAJES:"+i+" "+mensaje.get("OB_IAX_MENSAJES"));
			HashMap OB_IAX_MENSAJES = (HashMap) mensaje.get("OB_IAX_MENSAJES");
			BigDecimal TIPERROR = (BigDecimal) OB_IAX_MENSAJES.get("TIPERROR");
			BigDecimal CERROR = (BigDecimal) OB_IAX_MENSAJES.get("CERROR");
			String TERROR = (String) OB_IAX_MENSAJES.get("TERROR");

			int mensajeTipo = Constantes.MENSAJE_INFO;
//System.out.println("CERROR.intValue():"+CERROR.intValue());
			switch (TIPERROR.intValue()) {
			case 1:
				mensajeTipo = Constantes.MENSAJE_ERROR;
				break;
			case 2:
				mensajeTipo = Constantes.MENSAJE_INFO;
				break;
			case 3:
				mensajeTipo = Constantes.MENSAJE_WARN;
				break;
			}

			guardarMensaje(request, "verbatim:" + TERROR, null, mensajeTipo);

		}

	}

}
