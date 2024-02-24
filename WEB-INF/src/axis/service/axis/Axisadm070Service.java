package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_PREAVISOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisadm070Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisadm070Service extends AxisBaseService {
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
		logger.debug("Axisadm070Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			boolean buscar = false;

			if (!isEmpty(getCampoTextual(request, "buscar")))
				buscar = "true".equals(getCampoTextual(request, "buscar"));
			else if (!isEmpty(request.getAttribute("buscar")))
				buscar = "true".equals(String.valueOf(request.getAttribute("buscar")));

			if (buscar) {

				logger.debug("---------------------------> BUSCO");

				BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
				Date FEMISIOINI = stringToSqlDate(getCampoTextual(request, "FEMISIOINI"));
				Date FEMISIOFIN = stringToSqlDate(getCampoTextual(request, "FEMISIOFIN"));
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal DOMICILIADO = getCampoNumerico(request, "DOMICILIADO");
				BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
				BigDecimal MEDIADOR = getCampoNumerico(request, "MEDIADOR");
				BigDecimal PADFIN = this.getCampoNumerico(request, "PADFIN");
				BigDecimal PADCOM = this.getCampoNumerico(request, "PADCOM");

				PAC_IAX_PREAVISOS pac_iax_preavisos = new PAC_IAX_PREAVISOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal filtro = this.getFiltro(request);

				Map map = pac_iax_preavisos.ejecutaPAC_IAX_PREAVISOS__F_BUSCARECIBOS(CEMPRES, CRAMO, SPRODUC,
						DOMICILIADO, MEDIADOR, PADFIN, PADCOM, SPERSON, FEMISIOINI, FEMISIOFIN);
				logger.debug("F_BUSCARECIBOS -----------------------> " + map);

				List LSTRECIBOS = (List<Map>) tratarRETURNyMENSAJES(request, map);
				if (isEmpty(LSTRECIBOS))
					// No se han encontrado datos
					AbstractDispatchAction.guardarMensaje(request, "120135", null, Constantes.MENSAJE_INFO);

				request.getSession().setAttribute("REC_LSTRECIBOS", LSTRECIBOS);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm070Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_preavisar(HttpServletRequest request) {
		logger.debug("Axisadm070Service m_preavisar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");

			PAC_IAX_PREAVISOS pac_iax_preavisos = new PAC_IAX_PREAVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String LISTA_REC = "";
			for (int i = 0; i < CUENTA.intValue(); i++) {

				BigDecimal SELEC = getCampoNumerico(request, "SELEC_" + i);
				if (SELEC.intValue() != 0) { // La casilla est� seleccionada

					BigDecimal NRECIBO = getCampoNumerico(request, "NREC_" + i);
					LISTA_REC = LISTA_REC + NRECIBO + ";";
				}

			}

			Map mapa = pac_iax_preavisos.ejecutaPAC_IAX_PREAVISOS__F_REALIZAPREAVISO(LISTA_REC);
			logger.debug(mapa);
			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, mapa);

			if (resultado.intValue() == 0) {
				BigDecimal PREAVISOOK = new BigDecimal(1);
				request.setAttribute("PREAVISOOK", PREAVISOOK);
				request.getSession().setAttribute("REC_LSTRECIBOS", null);
				BigDecimal NSPROCES = (BigDecimal) mapa.get("OSPROCES");
				request.setAttribute("NSPROCES", NSPROCES);
			} else {
				BigDecimal PREAVISOOK = new BigDecimal(0);
				request.setAttribute("PREAVISOOK", PREAVISOOK);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm070Service - m�todo m_preavisar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
