package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPRESION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axisimpr002Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisimpr002Service extends AxisBaseService {
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
		logger.debug("Axisimpr002Service m_form");
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

				// PAC_IAX_IMPRESION pac_iax_impresion = new
				// PAC_IAX_IMPRESION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));

				BigDecimal filtro = this.getFiltro(request);

				/*
				 * Map map = pac_iax_preavisos.ejecutaPAC_IAX_PREAVISOS__F_BUSCARECIBOS(
				 * CEMPRES, CRAMO, SPRODUC, DOMICILIADO, MEDIADOR, PADFIN, PADCOM, SPERSON,
				 * FEMISIOINI, FEMISIOFIN);
				 * logger.debug("F_BUSCARECIBOS -----------------------> "+map);
				 * 
				 * List LSTRECIBOS = (List <Map>) tratarRETURNyMENSAJES(request, map); if
				 * (isEmpty(LSTRECIBOS)) // No se han encontrado datos
				 * AbstractDispatchAction.guardarMensaje(request, "120135", null,
				 * Constantes.MENSAJE_INFO);
				 * 
				 * 
				 * request.getSession().setAttribute("REC_LSTRECIBOS", LSTRECIBOS);
				 */
			} else {
				BigDecimal IDCATEGORIA = getCampoNumerico(request, "IDCATEGORIA");
				logger.debug("IDCATEGORIA:" + IDCATEGORIA);
				PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_IMPDET((BigDecimal) new BigDecimal(0),
						IDCATEGORIA, null, null, null, null, null, null, (BigDecimal) new BigDecimal(0), null, null,
						null, null, null, null);
				logger.debug("F_GET_IMPDET2 -----------------------> " + map);

				BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, map))) ? new BigDecimal(0)
						: (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
				if (ok.intValue() == 0) {
					logger.debug("F_GET_IMPDET2 mas -----------------------> " + map);
					// List LSTIMPAGRUP = (List <Map>) map.get("PCURCAT");
					ArrayList LSTIMPDET = (ArrayList) map.get("PCURDOCS");
					// formdata.putAll((Map)dev.get(0));
					logger.debug("F_GET_IMPDET2 mas -----------------------> " + LSTIMPDET);
					formdata.put("REC_LSTIMPDET", LSTIMPDET);

				}

			}

			PAC_IAX_IMPRESION pac_iax_impresionlist = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map maplist = pac_iax_impresionlist.ejecutaPAC_IAX_IMPRESION__F_GET_IMPRESORAS();
			logger.debug("F_GET_IMPRESORAS -----------------------> " + maplist);

			formdata.put("lstimpresoras", (List) tratarRETURNyMENSAJES(request, maplist));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimpr002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisimpr002Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");

			BigDecimal CUENTA1 = getCampoNumerico(request, "CUENTA1");

			BigDecimal IDIMPRESORA = getCampoNumerico(request, "IDIMPRESORA");

			PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// logger.debug("cuenta1"+CUENTA1);
			// logger.debug("idimpresora"+IDIMPRESORA);

			String LISTA_CATEGORIAS = "";
			String LISTA_DOCS = "";

			for (int i = 0; i < CUENTA.intValue(); i++) {

				BigDecimal SELEC = getCampoNumerico(request, "BSELEC_" + i);
				logger.debug("bselec" + SELEC);
				if (SELEC.intValue() != 0) { // La casilla est� seleccionada

					String NRECIBO = getCampoTextual(request, "BNREC_" + i);
					// logger.debug("nrecibo"+NRECIBO);
					LISTA_DOCS = LISTA_DOCS + NRECIBO + ";";
				}

			}

			Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_ENVIA_IMPRESORA(LISTA_CATEGORIAS, LISTA_DOCS,
					IDIMPRESORA);

			logger.debug(map);

			/*
			 * BigDecimal resultado = (BigDecimal)tratarRETURNyMENSAJES(request, mapa);
			 * 
			 * if (resultado.intValue() == 0) { BigDecimal PREAVISOOK = new BigDecimal(1);
			 * request.setAttribute("PREAVISOOK", PREAVISOOK);
			 * request.getSession().setAttribute("REC_LSTRECIBOS", null); }else{ BigDecimal
			 * PREAVISOOK = new BigDecimal(0); request.setAttribute("PREAVISOOK",
			 * PREAVISOOK); }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimpr002Service - m�todo m_imprimir", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
