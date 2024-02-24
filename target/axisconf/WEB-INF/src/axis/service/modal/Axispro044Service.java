package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_IMPUESTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axispro044Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axispro044Service.java
 * 
 * @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
 * @since Java 5.0
 */
public class Axispro044Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Carga inicial de la pantalla. Carga de BD: - Los datos t�cnicos. - Los
	 * diferentes valores de los combos. - Llama a #m_cargarCuadroInteres
	 * 
	 * @param request
	 */

	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axispro044Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map OB_IAX_PRODUCTO = new HashMap();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");

			String MODO = getCampoTextual(request, "VMODO");
			logger.debug("---> MODO:" + MODO);
			formdata.put("VMODO", MODO);

			BigDecimal PCCONCEP = getCampoNumerico(request, "PCCONCEP");
			BigDecimal PNCONCEP = getCampoNumerico(request, "PNCONCEP");
			BigDecimal PCFORPAG = getCampoNumerico(request, "PCFORPAG");
			java.sql.Date PFINIVIG = this.stringToSqlDate(getCampoTextual(request, "PFINIVIG"));

			request.setAttribute("CGARANTIA", CGARANT);

			if (!isEmpty(SPRODUC)) {
				Map map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_INICIALIZA(SPRODUC, null, usuario.getCempres(),
								usuario.getCidioma(), null, null, null);

				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_PRODUCTO(SPRODUC);
				logger.debug(map);
				OB_IAX_PRODUCTO = (Map) tratarRETURNyMENSAJES(request, map);

				if (MODO.equals("PROD")) {
					request.setAttribute("PREGUNTAS", OB_IAX_PRODUCTO.get("PREGUNTAS"));
				}

				if (MODO.equals("ACT")) {
					// logger.debug(ConversionUtil.printAsXML(OB_IAX_PRODUCTO, "OB_IAX_PRODUCTO"));
					List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

					if (!isEmpty(ACTIVID)) {
						recuperarDatosActividades(SPRODUC, OB_IAX_PRODUCTO, usuario, request);
					}
				}

				if (MODO.equals("GAR")) {

					map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILGARAN(SPRODUC, CACTIVI, CGARANT);
					HashMap mntgaran = (HashMap) tratarRETURNyMENSAJES(request, map);
					logger.debug(mntgaran);
					request.setAttribute("mntgaran", mntgaran);
					request.setAttribute("TGARANTIA", mntgaran.get("TGARANT"));

				}

				cargarDatosCombos(request, SPRODUC, CACTIVI, CGARANT);

				if (!isEmpty(PCCONCEP) || !isEmpty(PNCONCEP) || !isEmpty(PFINIVIG)) {

					map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_IMPUESTOS__F_GET_RECARGO(PCCONCEP, usuario.getCempres(), PNCONCEP,
									PFINIVIG);
					logger.debug("----> recargo:" + map);

					tratarRETURNyMENSAJES(request, map);

					formdata.put("CFORPAG", PCFORPAG);
					formdata.put("FINIVIG", PFINIVIG);
					formdata.put("NCONCEP", PNCONCEP);
					formdata.put("CTIPCON", map.get("PCTIPCON"));
					formdata.put("NVALCON", map.get("PNVALCON"));
					formdata.put("CBONIFI", map.get("PCBONIFI"));
					formdata.put("CFRACCI", map.get("PCFRACCI"));
					formdata.put("CRECFRA", map.get("PCRECFRA"));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro033Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			request.setAttribute("mntproducto", OB_IAX_PRODUCTO);
			this.configForm(request, whoami(this));
		}
	}

	private void recuperarDatosActividades(BigDecimal SPRODUC, Map OB_IAX_PRODUCTO, UsuarioBean usuario,
			HttpServletRequest request) throws Exception {
		/* Recuperar datos de actividades */
		List ACTIVID = (List) OB_IAX_PRODUCTO.get("ACTIVID");

		if (ACTIVID != null) {
			// existen valores para cada una
			BigDecimal CACTIVI = (BigDecimal) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES"))
					.get("CACTIVI");
			String TACTIVI = (String) ((Map) ((Map) ACTIVID.get(0)).get("OB_IAX_PRODACTIVIDADES")).get("TACTIVI");

			request.getSession().setAttribute("ACTIVIDAD", CACTIVI);
			request.getSession().setAttribute("TACTIVIDAD", TACTIVI);

			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILACTIVID(SPRODUC, CACTIVI);
			logger.debug(map);
			Map actividades = (Map) tratarRETURNyMENSAJES(request, map);
			logger.debug("---> actividades:" + actividades);

			request.setAttribute("PREGUNTAS", actividades.get("PREGUNACTI"));
		}
	}

	private void cargarDatosCombos(HttpServletRequest request, BigDecimal SPRODUC, BigDecimal PCACTIVI,
			BigDecimal PCGARANT) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		HashMap combos = new HashMap();
		Map map = null;

		map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
		logger.debug(map);
		combos.put("LSTCFORPAG", (List) tratarRETURNyMENSAJES(request, map, false));

		map = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(313));
		logger.debug(map);
		combos.put("LSTCTIPCON", (List) tratarRETURNyMENSAJES(request, map, false));

		formdata.put("COMBOS", combos);

	}

	public void m_aceptar(HttpServletRequest request, Axispro044Action thisAction) {
		logger.debug("Axispro016Service m_aceptar");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			BigDecimal PSPRODUC = getCampoNumerico(request, "VSPRODUC");
			BigDecimal PCACTIVI = getCampoNumerico(request, "VCACTIVI");
			BigDecimal PCGARANT = getCampoNumerico(request, "VCGARANT");

			BigDecimal CBONIFI = isEmpty(getCampoNumerico(request, "CBONIFI")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CBONIFI");
			BigDecimal CFRACCI = isEmpty(getCampoNumerico(request, "CFRACCI")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CFRACCI");
			BigDecimal CRECFRA = isEmpty(getCampoNumerico(request, "CRECFRA")) ? new BigDecimal(0)
					: getCampoNumerico(request, "CRECFRA");

			BigDecimal CFORPAG = isEmpty(getCampoNumerico(request, "CFORPAG")) ? getCampoNumerico(request, "VCFORPAG")
					: getCampoNumerico(request, "CFORPAG");

			java.sql.Date FINIVIG = isEmpty(this.stringToSqlDate(getCampoTextual(request, "FINIVIG")))
					? this.stringToSqlDate(getCampoTextual(request, "VFINIVIG"))
					: this.stringToSqlDate(getCampoTextual(request, "FINIVIG"));

			BigDecimal CTIPCON = isEmpty(getCampoNumerico(request, "CTIPCON")) ? getCampoNumerico(request, "VCTIPCON")
					: getCampoNumerico(request, "CTIPCON");
			BigDecimal NVALCON = getCampoNumerico(request, "NVALCON");

			BigDecimal NCONCEP = getCampoNumerico(request, "NCONCEP");

			Map map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPUESTOS__F_SET_IMPREC(new BigDecimal(8), usuario.getCempres(), NCONCEP, CFORPAG,
							null, PSPRODUC, PCACTIVI, PCGARANT, FINIVIG, CTIPCON, NVALCON, CFRACCI, CBONIFI, CRECFRA);

			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", 0);
			}

			tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro016Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}
}
