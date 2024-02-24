package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPUESTOS;
import axis.jdbc.PAC_IAX_MNTPROD;
import axis.mvc.control.modal.Axispro001_garantiasAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axispro001_garantiasService extends AxisBaseService {
	static Log logger = LogFactory.getLog(Axispro001_garantiasService.class);

	public void m_init(HttpServletRequest request, Axispro001_garantiasAction thisAction) {
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001_garantiasService - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			// this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_form(HttpServletRequest request, Axispro001_garantiasAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPRODUC = this.stringToBigDecimal(getCampoTextual(request, "SPRODUC"));
			BigDecimal CACTIVI = this.stringToBigDecimal(getCampoTextual(request, "CACTIVI"));
			BigDecimal CGARANT = this.stringToBigDecimal(getCampoTextual(request, "CGARANT"));
			HashMap mntgaran = (HashMap) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPROD__F_GET_DETAILGARAN(SPRODUC, CACTIVI, CGARANT));
			logger.debug(mntgaran);
			request.setAttribute("mntgaran", mntgaran);
			Map map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES();
			logger.debug(map);
			formdata.put("GARANPROCAP", map.get("RETURN"));
			if (isEmpty(map.get("RETURN"))) {
				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_INICIALIZA_CAPITAL(SPRODUC, CGARANT, CACTIVI);
				logger.debug(map);
				map = new PAC_IAX_MNTPROD((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_MNTPROD__F_GET_OBJ_CAPITALES();
				logger.debug(map);
				formdata.put("GARANPROCAP", map.get("RETURN"));
			}
			map = new PAC_IAX_IMPUESTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_IMPUESTOS__F_GET_IMPREC(usuario.getCempres(), new BigDecimal(8), null, null,
							SPRODUC, null, CACTIVI, CGARANT, null, null);
			tratarRETURNyMENSAJES(request, map);
			formdata.put("FORPAGRECGARAN", map.get("RETURN"));

			if (!isEmpty(mntgaran.get("FORMULAS"))) {
				List formulasTarif = new ArrayList();
				List x = (List) mntgaran.get("FORMULAS");
				for (int i = 0; i < x.size(); i++) {
					if (((Map) ((Map) x.get(i)).get("OB_IAX_PRODGARFORMULAS")).get("CUTILI")
							.equals(new BigDecimal(0))) {
						formulasTarif.add(((Map) x.get(i)).get("OB_IAX_PRODGARFORMULAS"));
					}
				}
				formdata.put("FORMULASTARIF", formulasTarif);
				List formulasProv = new ArrayList();
				x = (List) mntgaran.get("FORMULAS");
				for (int i = 0; i < x.size(); i++) {
					if (((Map) ((Map) x.get(i)).get("OB_IAX_PRODGARFORMULAS")).get("CUTILI")
							.equals(new BigDecimal(8))) {
						formulasProv.add(((Map) x.get(i)).get("OB_IAX_PRODGARFORMULAS"));
					}
				}
				formdata.put("FORMULASPROV", formulasProv);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001_garantiasService - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			// this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_consultarParametrosGar(HttpServletRequest request, Axispro001_garantiasAction thisAction) {
		logger.debug("Axispro001_garantiasActionService m_consultarParametros");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// Push de los datos necesarios a la pila
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			thisAction.topPila(request, "SPRODUC", SPRODUC);
			thisAction.topPila(request, "CACTIVI", CACTIVI);
			thisAction.topPila(request, "CGARANT", CGARANT);
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001_garantiasService - m�todo m_consultarParametrosGar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			// this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
		}
	}

	public void m_volverParamGar(HttpServletRequest request, Axispro001_garantiasAction thisAction) {
		logger.debug("Axispro001_garantiasActionService m_volver");
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("SPRODUC", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "SPRODUC")));
			formdata.put("CACTIVI", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CACTIVI")));
			formdata.put("CGARANT", bigDecimalToString((BigDecimal) thisAction.removeTopPila(request, "CGARANT")));
			// renovarLista( request, thisAction); // por si las moscas
		} catch (Exception e) {
			logger.error("Error en el servicio Axispro001_garantiasService - m�todo m_volverParamGar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.configForm(request, whoami(this));
			// this.cargaDependencias(request, (List)request.getAttribute("DEPENDENCIAS"));
		}
	}
}