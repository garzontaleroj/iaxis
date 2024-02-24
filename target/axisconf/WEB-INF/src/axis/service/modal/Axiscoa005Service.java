package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COA;
import axis.jdbc.SINPAQUETE;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * ecg 21/08/2012 bug/[A] en http://mantis.srvcsi.com/view.php?id=22076#c121481
 * CONSULTA CUENTAS COASEGURO - AXISCOA080 segun analisis!
 */
public class Axiscoa005Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_init(HttpServletRequest request) {
		logger.debug("Axiscoa005Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			if (isEmpty(CEMPRES)) {
				CEMPRES = usuario.getCempres();
			}
			if (isEmpty(CEMPRES)) {
				formdata.put("CEMPRES", CEMPRES.toString());
			}

		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_form(HttpServletRequest request) {
		logger.debug("Axiscoa005Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			// El campo IDENTIFICADOR contiene informaci�n por cada registro del listado
			String identificador = this.getCampoTextual(request, "identificador");
			if (identificador != null) {
				String[] identificadorSplitted = StringUtils.splitPreserveAllTokens(identificador, "|"); // CCOMPAPR|CCOMPANI|SSEGURO|FCIERRE//ej:12|1|262310|31/10/2011
				BigDecimal CCOMPAPR = null;
				if (identificadorSplitted[0].trim().length() > 0)
					CCOMPAPR = new BigDecimal(identificadorSplitted[0].trim());
				BigDecimal CCOMPANI = null;
				if (identificadorSplitted[1].trim().length() > 0)
					CCOMPANI = new BigDecimal(identificadorSplitted[1].trim());
				BigDecimal CTIPCOA = null;
				if (identificadorSplitted[2].trim().length() > 0)
					CTIPCOA = new BigDecimal(identificadorSplitted[2].trim());
				Date FCIERRE = null;
				if (identificadorSplitted[3].trim().length() > 0)
					FCIERRE = this.stringToSqlDate(identificadorSplitted[3].trim());
				BigDecimal SPROCES = null;
				if (identificadorSplitted[4].trim().length() > 0)
					SPROCES = new BigDecimal(identificadorSplitted[4].trim());
				BigDecimal ES_LIQUIDABLE = null;
				if (identificadorSplitted[5].trim().length() > 0)
					ES_LIQUIDABLE = new BigDecimal(identificadorSplitted[5].trim());

				// Vamos a pillar tambi�n los filtros aplicados sobre la pantalla axicoa001 y
				// que no forman parte del campo IDENTIFICADOR
				String filtros = this.getCampoTextual(request, "filtros");
				BigDecimal CEMPRES = null;
				BigDecimal CRAMO = null;
				BigDecimal SPRODUC = null;
				BigDecimal NPOLIZA = null;
				BigDecimal NCERTIF = null;
				BigDecimal CESTADO = null;
				BigDecimal INVERFAS = null;
				BigDecimal NUMPROCES = null;
				if (filtros != null) {
					String[] filtrosSplitted = StringUtils.splitPreserveAllTokens(filtros, "|"); // CEMPRES|CRAMO|SPRODUC|NPOLIZA|NCERTIF|CESTADO|INVERFAS|NUMPROCES
					if (filtrosSplitted[0].trim().length() > 0)
						CEMPRES = new BigDecimal(filtrosSplitted[0].trim());
					if (filtrosSplitted[1].trim().length() > 0)
						CRAMO = new BigDecimal(filtrosSplitted[1].trim());
					if (filtrosSplitted[2].trim().length() > 0)
						SPRODUC = new BigDecimal(filtrosSplitted[2].trim());
					if (filtrosSplitted[3].trim().length() > 0)
						NPOLIZA = new BigDecimal(filtrosSplitted[3].trim());
					if (filtrosSplitted[4].trim().length() > 0)
						NCERTIF = new BigDecimal(filtrosSplitted[4].trim());
					if (filtrosSplitted[5].trim().length() > 0)
						CESTADO = new BigDecimal(filtrosSplitted[5].trim());

					if (filtrosSplitted[10].trim().length() > 0)
						INVERFAS = new BigDecimal(filtrosSplitted[10].trim());
					if (filtrosSplitted[11].trim().length() > 0)
						NUMPROCES = new BigDecimal(filtrosSplitted[11].trim());
				}

				BigDecimal SSEGURO = null;
				if (NPOLIZA != null && NCERTIF != null) {
					Map map = null;
					SINPAQUETE sinpaquete = new SINPAQUETE((Connection) request.getAttribute(Constantes.DB01CONN));
					map = sinpaquete.ejecutaFF_BUSCASSEGURO(NPOLIZA, NCERTIF);
					SSEGURO = (BigDecimal) map.get("RETURN");
				}

				PAC_IAX_COA pac_iax_coa = new PAC_IAX_COA((Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapa_resultado = pac_iax_coa.ejecutaPAC_IAX_COA__F_GET_CTACOASEGURO_DET(CCOMPANI, FCIERRE, CCOMPAPR,
						CTIPCOA, CEMPRES, CRAMO, SPRODUC, NPOLIZA, NCERTIF, CESTADO, SSEGURO, INVERFAS, NUMPROCES,
						ES_LIQUIDABLE);

				logger.debug(mapa_resultado);

				List RETURN = (List) tratarRETURNyMENSAJES(request, mapa_resultado);
				if (!isEmpty(RETURN)) {
					request.setAttribute("CTACOASEGURO", tratarRETURNyMENSAJES(request, mapa_resultado));
				} else {
					// No hay registros
					AbstractDispatchAction.guardarMensaje(request, "1000254", null, Constantes.MENSAJE_INFO);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axiscoa005Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
