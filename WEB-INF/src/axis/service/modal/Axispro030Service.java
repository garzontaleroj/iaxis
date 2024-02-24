package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PROVISIONES;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro030Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a> 12/11/2008
 * @since Java 5.0
 */
public class Axispro030Service extends AxisBaseService {
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
		logger.debug("Axispro030Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");

			Map LISTVALORES = new HashMap();

			SINPAQUETE sinPaquete = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = sinPaquete.ejecutaF_DESEMPRESA(CEMPRES, null, null);
			logger.debug(map);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				formdata.put("TEMPRES", map.get("PTEMPRES"));
			}

			PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if ("true".equals(getCampoTextual(request, "isNew"))) {
				// Nueva Provisi�n
				// Recuperar todas las provisiones + la nueva
				map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_NUEVA();
			} else {
				// Modificaci�n de Provisi�n
				// Recuperar todas las provisiones
				map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES();
			}

			logger.debug(map);
			List lstProvisiones = (List) tratarRETURNyMENSAJES(request, map);
			LISTVALORES.put("LSTPROVISIONES", lstProvisiones);

			BigDecimal CPROVIS = getCampoNumerico(request, "CPROVIS");

			if (!isEmpty(CPROVIS)) {
				// Hacer esta historia (b�squeda en la lista de provisiones de la provisi�n
				// actual)
				// Para recuperar el TIPOPROV de la provisi�n.
				Map provision = getObjetoDeLista(lstProvisiones, bigDecimalToString(CPROVIS), "CPROVIS");

				if (!isEmpty(provision)) {
					formdata.put("TIPOPROV", provision.get("TIPOPROV"));
				}

				// Recuperar tipos de provisi�n
				map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_PROVISIONES_TIPO(CPROVIS);
				logger.debug(map);
				LISTVALORES.put("LSTTIPOPROVISION", tratarRETURNyMENSAJES(request, map));

				if ("false".equals(getCampoTextual(request, "existeProvision"))) {
					// No hay descripciones (es una nueva provisi�n).
					PAC_IAX_LISTVALORES paxIaxListValores = new PAC_IAX_LISTVALORES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					map = paxIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
					logger.debug(map);
					List lstIdiomas = (List) tratarRETURNyMENSAJES(request, map);
					List LSTDESPROVISIONES = new ArrayList();

					if (!isEmpty(lstIdiomas)) {
						Collections.sort(lstIdiomas, new Comparador("CIDIOMA", null));
						LSTDESPROVISIONES.addAll(lstIdiomas);
						formdata.put("LSTDESPROVISIONES", LSTDESPROVISIONES);
					}

				} else {
					// Recuperar las descripciones de la provisi�n
					map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GET_DESPROVISIONES(CPROVIS);
					logger.debug(map);
					formdata.put("LSTDESPROVISIONES", tratarRETURNyMENSAJES(request, map));
				}
			}

			formdata.put("LISTVALORES", LISTVALORES);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro030Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACI�N
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_validar(HttpServletRequest request) {
		logger.debug("Axispro030Service m_validar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CPROVIS = getCampoNumerico(request, "CPROVIS");
			PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_VALIDAR_PROVISION(CPROVIS);
			logger.debug(map);

			if (BigDecimal.ONE.equals(tratarRETURNyMENSAJES(request, map)))
				// F_VALIDAR_PROVISION == 1, la provisi�n ya existe para esta empresa
				formdata.put("existeProvision", "true");
			else
				// F_VALIDAR_PROVISION == 0, la provisi�n NO existe para esta empresa
				formdata.put("existeProvision", "false");

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro030Service - m�todo m_validar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axispro030Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CPROVIS = getCampoNumerico(request, "CPROVIS");
			java.sql.Date FBAJA = stringToSqlDate(getCampoTextual(request, "FBAJA"));
			BigDecimal TIPOPROV = getCampoNumerico(request, "TIPOPROV");
			String CREPORT = getCampoTextual(request, "CREPORT");
			PAC_IAX_PROVISIONES pacIaxProvisiones = new PAC_IAX_PROVISIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GRABAR_PROVISIONES(CEMPRES, CPROVIS, FBAJA,
					TIPOPROV, CREPORT);
			logger.debug(map);

			request.setAttribute("grabarOK", false);

			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map))) {
				// Grabar las descripciones
				// Recuperar todos los idiomas presentes en la pantalla
				String LSTCIDIOMAS = getCampoTextual(request, "LSTCIDIOMAS");

				if (!isEmpty(LSTCIDIOMAS)) {
					String[] arrayIDIOMAS = LSTCIDIOMAS.split("@");

					for (int i = 0; i < arrayIDIOMAS.length; i++) {
						// Para cada idioma, recuperar el TCPROVIS y TLPROVIS y grabarlo
						BigDecimal CIDIOMA = new BigDecimal(arrayIDIOMAS[i]);
						String TCPROVIS = getCampoTextual(request, "TCPROVIS_" + CIDIOMA);
						String TLPROVIS = getCampoTextual(request, "TLPROVIS_" + CIDIOMA);

						if (!isEmpty(TCPROVIS) && !isEmpty(TLPROVIS)) {
							map = pacIaxProvisiones.ejecutaPAC_IAX_PROVISIONES__F_GRABAR_DESPROVISIONES(CPROVIS,
									CIDIOMA, TCPROVIS, TLPROVIS);
							logger.debug(map);

							if (BigDecimal.ONE.equals(tratarRETURNyMENSAJES(request, map)))
								// La grabaci�n de alguna descripci�n no ha ido bien, salir
								return;
						}

					}

					// Si estamos aqu�, todas las grabaciones han ido OK
					request.setAttribute("grabarOK", true);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro030Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * Comparador propio para ordenar una tabla en orden natural.
	 */
	class Comparador implements Comparator {
		String campo;
		String outerMap;

		Comparador(String campo, String outerMap) {
			this.campo = campo;
			this.outerMap = outerMap;
		}

		public int compare(Object o1, Object o2) {
			try {
				if (isEmpty(campo)) {
					return o1.toString().compareTo(o2.toString());
				} else {
					Map map1 = (Map) o1;
					Map map2 = (Map) o2;

					if (!isEmpty(outerMap)) {
						map1 = (Map) map1.get(outerMap);
						map2 = (Map) map2.get(outerMap);
					}

					if (map1.get(campo) == null)
						return -1;
					else if (map2.get(campo) == null)
						return 1;
					else if (map1.get(campo) instanceof Comparable && map2.get(campo) instanceof Comparable)
						return ((Comparable) map1.get(campo)).compareTo(map2.get(campo));
					else
						return map1.get(campo).toString().compareTo(map2.get(campo).toString());
				}
			} catch (Exception e) {
				return 0;
			}
		}
	}

}
