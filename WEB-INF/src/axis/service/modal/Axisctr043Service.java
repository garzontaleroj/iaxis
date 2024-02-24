//Revision:# +Mf7ry5IwPKdooMSoHZJmA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_SUPLEMENTOS;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;
import axis.util.ConversionUtil;

/**
 * Axispro043Service.java 25/08/2008
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisctr043Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Recupera los datos de un riesgo si viene un NRIESGO informado, si no, no hace
	 * nada.
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisctr043Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		formdata.put("NNRIESGO", 0);
		try {

			String MODO = (String) request.getParameter("CMODO"); // .getAttribute("CMODO");
			logger.debug("----> MODO:" + MODO);
			formdata.put("CMODO", MODO);

			BigDecimal pPCMOTMOV = (BigDecimal) AbstractDispatchAction.topPila(request, "CMOTMOV");

			if (pPCMOTMOV != null) {
				Map map2 = new PAC_IAX_SUPLEMENTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_SUPLEMENTOS__F_GET_DESCMOTMOV(pPCMOTMOV, usuario.getCidioma());
				formdata.put("PTMOTMOV", map2.get("PTMOTMOV"));
			}
			if (!isEmpty(this.getCampoTextual(request, "origen"))
					&& this.getCampoTextual(request, "origen").equals("axisctr009"))
				AbstractDispatchAction.topPila(request, "CMODO", "GENERAL");

			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PRODUCCION pac_axis_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map listValores = new HashMap();

			// Cargar tipo de sexo
			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_TIPSEXO();
			logger.debug(map);
			listValores.put("tipSexo", (List) tratarRETURNyMENSAJES(request, map));

			formdata.put("listValores", listValores);

			/* Recogemos de nuevo los datos de la p�liza */
			BigDecimal SSEGURO = null;
			map = pac_axis_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
			logger.debug(map);
			Map datosPoliza = (Map) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(datosPoliza)) {
				formdata.putAll(datosPoliza);
			}
			/* Si NRIESGO viene informado, estamos editando, recuperar datos del riesgo */
			if (!isEmpty(NRIESGO) && !NRIESGO.equals(new BigDecimal("0"))) {
				map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
				logger.debug(map);
				Map OB_IAX_RIESGO = (Map) tratarRETURNyMENSAJES(request, map);
				logger.debug(ConversionUtil.printAsXML(OB_IAX_RIESGO, "OB_IAX_RIESGO"));

				/* Recuperar su RIESDESCRIPCION y NRIESGO y ponerlos en formdata */
				if (!isEmpty(OB_IAX_RIESGO)) {
					Map RIESDESCRIPCION = (Map) OB_IAX_RIESGO.get("RIESDESCRIPCION");
					if (!isEmpty(RIESDESCRIPCION))
						formdata.putAll(RIESDESCRIPCION);
				}

				formdata.put("NRIESGO", NRIESGO);
				formdata.put("TNATRIE", OB_IAX_RIESGO.get("TNATRIE"));
				formdata.put("TDESCRIE", OB_IAX_RIESGO.get("TDESCRIE"));
			} else {
				BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
				String TDESCRIPCION = null;
				map = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("DESC_RIES_DEF", SPRODUC);
				Map Literal;
				if (map.get("RETURN") != null && map.get("RETURN").toString() != "0") {
					logger.debug("viene literal:" + map.get("RETURN").toString());
					Literal = new SINPAQUETE((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaF_AXIS_LITERALES(new BigDecimal(map.get("RETURN").toString()),
									new BigDecimal("-1"));
					logger.debug(Literal);
					if (Literal.get("RETURN") != null)
						formdata.put("TNATRIE", Literal.get("RETURN").toString());
				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr043Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * Graba el riesgo descripci�n.
	 * 
	 * @param request
	 * @return boolean indicando si la grabaci�n ha sido correcta o no.
	 */
	@SuppressWarnings("all")
	public boolean m_grabarRieDescripcion(HttpServletRequest request) {
		logger.debug("Axisctr043Service m_grabarRieDescripcion");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map map = new HashMap();
		PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
				((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)));
		HashMap m = null;

		try {

			/* Recuperar campos formulario */
			BigDecimal NRIESGO = getCampoNumerico(request, "NRIESGO");
			if (!isEmpty(NRIESGO) && NRIESGO.equals(new BigDecimal("0"))) {
				NRIESGO = null;
			}
			String TDESCRIPCION = getCampoTextual(request, "TNATRIE");
			String NASEGUR = getCampoTextual(request, "NASEGUR");

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			if (SPRODUC.equals(new BigDecimal("8063"))) {
				NASEGUR = "1";
			}

			BigDecimal NEDADCOL = getCampoNumerico(request, "NEDADCOL");
			BigDecimal SEXCOL = getCampoNumerico(request, "SEXCOL");

			/* Grabar datos */

			/* Traer el numero de riesgo */
			map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GRABARIEDESCRIPCIONIN(NRIESGO, TDESCRIPCION, NASEGUR, NEDADCOL,
							SEXCOL);
			logger.debug(map);

			m = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_GESTRIESGOS();

			List axisctr100_datosRiesgos = (List) tratarRETURNyMENSAJES(request, m, false);

			for (int i = 0; i < axisctr100_datosRiesgos.size(); i++) {

				HashMap p = (HashMap) axisctr100_datosRiesgos.get(i);
				HashMap q = (HashMap) p.get("OB_IAX_GESTRIESGOS");
				NRIESGO = (BigDecimal) q.get("NRIESGO");

			}
			;

			formdata.put("NNRIESGO", NRIESGO);
			return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr043Service - m�todo m_grabarRieDescripcion", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			return BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map));
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
