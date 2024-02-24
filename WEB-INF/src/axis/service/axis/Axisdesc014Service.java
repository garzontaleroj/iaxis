package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MNTDTOSESPECIALES;
import axis.mvc.control.axis.Axisdesc014Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisdesc014Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request, Axisdesc014Action thisAction) {
		logger.debug("Axispen003Service m_init");
		// Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			logger.debug("m_init");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc014Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_form(HttpServletRequest request, Axisdesc014Action thisAction) {
		logger.debug("Axisdesc014Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {
			formdata.put("CIDIOMA_USU", usuario.getCidioma());
		} catch (Exception e) {
			logger.error("Error en el servicio Axisppro047Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

	}

	public void m_busqueda_descuentos(HttpServletRequest request, Axisdesc014Action thisAction) {
		logger.debug("Axisdesc014Service m_busqueda_descuentos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("NCONTADOR", 0);

			PAC_IAX_MNTDTOSESPECIALES pac_iax_mntdtosespeciales = new PAC_IAX_MNTDTOSESPECIALES(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = null;
			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			java.sql.Date FINICIO = stringToSqlDate(getCampoTextual(request, "FINICIO"));
			java.sql.Date FFIN = stringToSqlDate(getCampoTextual(request, "FFIN"));

			logger.debug("--> CCAMPANYA:" + CCAMPANYA + " FINICIO:" + FINICIO + " FFIN:" + FFIN);

			Map mapa_resultado_p = pac_iax_mntdtosespeciales
					.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_GET_DTOSESPECIALES(CCAMPANYA, FINICIO, FFIN);
			logger.debug(mapa_resultado_p);
			// Si la crida retorna error llencem excepcio.
			if (((BigDecimal) (tratarRETURNyMENSAJES(request, mapa_resultado_p))).compareTo(new BigDecimal(0)) != 0) {
				throw new Exception();
			}
			// Preparem llista de campanyas
			ArrayList listaDescuentos = (ArrayList<Map>) mapa_resultado_p.get("PDTOSESPE");
			logger.debug(listaDescuentos);
			request.getSession().setAttribute("AXIS_DESCUENTOS", listaDescuentos);

			ArrayList listaDetDescuentos = new ArrayList();
			if (listaDescuentos.size() != 0) {
				BigDecimal CCAMPAN = (BigDecimal) ((HashMap) ((HashMap) listaDescuentos.get(0))
						.get("OB_IAX_DTOSESPECIALES")).get("CCAMPANYA");
				String TCAMPAN = (String) ((HashMap) ((HashMap) listaDescuentos.get(0)).get("OB_IAX_DTOSESPECIALES"))
						.get("TCAMPANYA");
				listaDetDescuentos = (ArrayList) ((HashMap) ((HashMap) listaDescuentos.get(0))
						.get("OB_IAX_DTOSESPECIALES")).get("DETDTOS");

				formdata.put("CCAMPANYA", CCAMPAN);
				formdata.put("TCAMPANYA", TCAMPAN);
				logger.debug("-->" + listaDetDescuentos);

			}
			request.setAttribute("listaDetDescuentos", listaDetDescuentos);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen003Service - m�todo m_busqueda_fondos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_borrarDescuento(HttpServletRequest request, Axisdesc014Action thisAction) {
		logger.debug("Axisdesc014Service m_borrar_garantias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new HashMap();
		try {

			PAC_IAX_MNTDTOSESPECIALES pac_iax_mntdtosespeciales = new PAC_IAX_MNTDTOSESPECIALES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CDPTO = getCampoNumerico(request, "CDPTO");
			BigDecimal CCIUDAD = getCampoNumerico(request, "CCIUDAD");
			String CAGRUPACION = getCampoTextual(request, "CAGRUPACION");
			BigDecimal CSUCURSAL = getCampoNumerico(request, "CSUCURSAL");
			BigDecimal CINTERMEDIARIO = getCampoNumerico(request, "CINTERMEDIARIO");

			Map mapa_resultado_p = pac_iax_mntdtosespeciales
					.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES(CCAMPANYA);
			logger.debug(mapa_resultado_p);

			if (new BigDecimal(0).equals(tratarRETURNyMENSAJES(request, mapa_resultado_p, false))) {
				logger.debug(mapa_resultado_p);
			}

			// Inici Bug 0028012 - 10/10/2013 - RCL - Validaci�n Campos Campa�as/Dtos
			// especiales
			formdata.remove("CCAMPANYA");
			request.removeAttribute("CCAMPANYA");
			// Fi Bug 0028012 - 10/10/2013 - RCL - Validaci�n Campos Campa�as/Dtos
			// especiales

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc014Service - m�todo m_borrarCampanya", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_borrarDescuentoLin(HttpServletRequest request, Axisdesc014Action thisAction) {
		logger.debug("Axisdesc014Service m_borrar_garantias_hijas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_MNTDTOSESPECIALES pac_iax_mntdtosespeciales = new PAC_IAX_MNTDTOSESPECIALES(
					(Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CCAMPANYA = getCampoNumerico(request, "CCAMPANYA");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CPAIS = getCampoNumerico(request, "CPAIS");
			BigDecimal CDPTO = getCampoNumerico(request, "CDPTO");
			BigDecimal CCIUDAD = getCampoNumerico(request, "CCIUDAD");
			String CAGRUPACION = getCampoTextual(request, "CAGRUPACION");
			BigDecimal CSUCURSAL = getCampoNumerico(request, "CSUCURSAL");
			BigDecimal CINTERMEDIARIO = getCampoNumerico(request, "CINTERMEDIARIO");

			Map mapa_resultado_p = pac_iax_mntdtosespeciales.ejecutaPAC_IAX_MNTDTOSESPECIALES__F_DEL_DTOSESPECIALES_LIN(
					CCAMPANYA, SPRODUC, CPAIS, CDPTO, CCIUDAD, CAGRUPACION, CSUCURSAL, CINTERMEDIARIO);
			logger.debug(mapa_resultado_p);
			tratarRETURNyMENSAJES(request, mapa_resultado_p);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisdesc014Service - m�todo m_borrarCampanyaLin", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_busqueda_detalle(HttpServletRequest request, Axisdesc014Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			ArrayList listaDescuentos = new ArrayList();
			int NCONTADOR;
			if (getCampoNumerico(request, "NCONTADOR") != null)
				NCONTADOR = ((BigDecimal) getCampoNumerico(request, "NCONTADOR")).intValue();
			else
				NCONTADOR = 0;

			listaDescuentos = (ArrayList) request.getSession().getAttribute("AXIS_DESCUENTOS");
			ArrayList listaDetalle = new ArrayList();
			// Si la llista de fons no es buida
			if (listaDescuentos.size() != 0) {
				listaDetalle = (ArrayList) ((HashMap) ((HashMap) listaDescuentos.get((int) NCONTADOR))
						.get("OB_IAX_DTOSESPECIALES")).get("DETDTOS");
				// BigDecimal xxx = (BigDecimal)
				// ((HashMap)((HashMap)listaDescuentos.get((int)NCONTADOR)).get("OB_IAX_CODIGARAN")).get("CGARANT");
				// request.setAttribute("CGARANT", xxx);

				BigDecimal CCAMPAN = (BigDecimal) ((HashMap) ((HashMap) listaDescuentos.get((int) NCONTADOR))
						.get("OB_IAX_DTOSESPECIALES")).get("CCAMPANYA");
				String TCAMPAN = (String) ((HashMap) ((HashMap) listaDescuentos.get((int) NCONTADOR))
						.get("OB_IAX_DTOSESPECIALES")).get("TCAMPANYA");
				formdata.put("CCAMPANYA", CCAMPAN);
				formdata.put("TCAMPANYA", TCAMPAN);
			}
			logger.debug(listaDetalle);
			request.setAttribute("listaDetDescuentos", listaDetalle);
			// request.setAttribute("CGARANT", listaDetalle.);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispen003Service - m�todo m_busqueda_cuerpo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			logger.debug("fin metodo");
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

}
