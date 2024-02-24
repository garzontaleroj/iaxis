package axis.service.axis;

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
import axis.util.Constantes;

/**
 * Axisimpr001Service.java
 * 
 * @author <a href="rkirchner@csi-ti.com">Roger Kirchner</a>
 * @since Java 5.0
 */
public class Axisimpr001Service extends AxisBaseService {
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
		logger.debug("Axisimpr001Service m_form");
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

				BigDecimal CCATEGORIA = getCampoNumerico(request, "CCATEGORIA");
				BigDecimal CTIPO = getCampoNumerico(request, "CTIPO");
				String TFICHERO = getCampoTextual(request, "TFICHERO");
				Date FCREA = stringToSqlDate(getCampoTextual(request, "FCREA"));
				String CUSER = getCampoTextual(request, "CUSER");
				Date FULTIM = stringToSqlDate(getCampoTextual(request, "FULTIM"));
				String CULTUSERIMP = getCampoTextual(request, "CULTUSERIMP");
				BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");
				BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");

				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
				BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				// PAC_IAX_IMPRESION pac_iax_impresion = new
				// PAC_IAX_IMPRESION((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));

				BigDecimal filtro = this.getFiltro(request);

				PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_IMPDET((BigDecimal) new BigDecimal(0),
						CCATEGORIA, CTIPO, TFICHERO, FCREA, CUSER, FULTIM, CULTUSERIMP, CESTADO, SPROCES, NPOLIZA,
						NCERTIF, CAGENTE, SPRODUC, CRAMO);
				logger.debug("F_GET_IMPDET -----------------------> " + map);

				BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, map))) ? new BigDecimal(0)
						: (BigDecimal) this.tratarRETURNyMENSAJES(request, map);
				if (ok.intValue() == 0) {
					logger.debug("F_GET_IMPDET mas -----------------------> " + map);
					ArrayList LSTIMPDET = (ArrayList) map.get("PCURDOCS");
					logger.debug("F_GET_IMPDET mas -----------------------> " + LSTIMPDET);
					formdata.put("REC_LSTIMPDET", LSTIMPDET);

					formdata.put("LIST_FICHEROS", map.get("PLISTZIPS"));

				}

			} else {
				/*
				 * PAC_IAX_IMPRESION pac_iax_impresion = new
				 * PAC_IAX_IMPRESION((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)); Map map =
				 * pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_IMPAGRUP();
				 * logger.debug("F_GET_IMPAGRUP -----------------------> "+map);
				 * 
				 * BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, map))) ? new
				 * BigDecimal(0) : (BigDecimal)this.tratarRETURNyMENSAJES(request, map); if
				 * (ok.intValue() == 0) {
				 * logger.debug("F_GET_IMPAGRUP mas -----------------------> "+map); //List
				 * LSTIMPAGRUP = (List <Map>) map.get("PCURCAT"); ArrayList LSTIMPAGRUP =
				 * (ArrayList)map.get("PCURCAT"); //formdata.putAll((Map)dev.get(0));
				 * logger.debug("F_GET_IMPAGRUP mas -----------------------> "+LSTIMPAGRUP);
				 * formdata.put("REC_LSTIMPAGRUP", LSTIMPAGRUP);
				 * 
				 * }
				 * 
				 * map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_GET_IMPDET((BigDecimal)
				 * new
				 * BigDecimal(1),null,null,null,null,null,null,null,null,null,null,null,null,
				 * null); logger.debug("F_GET_IMPDET -----------------------> "+map);
				 * 
				 * ok = (isEmpty(this.tratarRETURNyMENSAJES(request, map))) ? new BigDecimal(0)
				 * : (BigDecimal)this.tratarRETURNyMENSAJES(request, map); if (ok.intValue() ==
				 * 0) { logger.debug("F_GET_IMPDET mas -----------------------> "+map); //List
				 * LSTIMPAGRUP = (List <Map>) map.get("PCURCAT"); ArrayList LSTIMPDET =
				 * (ArrayList)map.get("PCURDOCS"); //formdata.putAll((Map)dev.get(0));
				 * logger.debug("F_GET_IMPDET mas -----------------------> "+LSTIMPDET);
				 * formdata.put("REC_LSTIMPDET", LSTIMPDET);
				 * 
				 * }
				 * 
				 * 
				 * 
				 * 
				 * /* List LSTIMPAGRUP = (List <Map>) tratarRETURNyMENSAJES(request, map); if
				 * (isEmpty(LSTIMPAGRUP)) // No se han encontrado datos
				 * AbstractDispatchAction.guardarMensaje(request, "120135", null,
				 * Constantes.MENSAJE_INFO);
				 * 
				 * 
				 * request.getSession().setAttribute("REC_LSTIMPAGRUP", LSTIMPAGRUP);
				 */
			}

			PAC_IAX_IMPRESION pac_iax_impresionlist = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map maplist = pac_iax_impresionlist.ejecutaPAC_IAX_IMPRESION__F_GET_IMPRESORAS();
			logger.debug("F_GET_IMPRESORAS -----------------------> " + maplist);

			formdata.put("lstimpresoras", (List) tratarRETURNyMENSAJES(request, maplist));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimpr001Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_imprimir(HttpServletRequest request) {
		logger.debug("Axisimpr001Service m_imprimir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal CUENTA1 = getCampoNumerico(request, "CUENTA1");
			BigDecimal CUENTA = getCampoNumerico(request, "CUENTA");
			BigDecimal IDIMPRESORA = getCampoNumerico(request, "IDIMPRESORA");

			PAC_IAX_IMPRESION pac_iax_impresion = new PAC_IAX_IMPRESION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// logger.debug("cuenta1"+CUENTA1);
			logger.debug("idimpresora" + IDIMPRESORA);

			if (!isEmpty(IDIMPRESORA)) {
				if (IDIMPRESORA.intValue() < 0)
					IDIMPRESORA = null;
			} else {
				IDIMPRESORA = null;
			}

			String LISTA_CATEGORIAS = "";
			String LISTA_DOCS = "";
			if (!isEmpty(CUENTA1)) {
				for (int i = 0; i < CUENTA1.intValue(); i++) {
					BigDecimal SELEC = getCampoNumerico(request, "ASELEC_" + i);
					logger.debug("aselec" + SELEC);
					if (!isEmpty(SELEC)) {
						if (SELEC.intValue() != 0) { // La casilla est� seleccionada
							String NRECIBO = getCampoTextual(request, "ANREC_" + i);
							// logger.debug("nrecibo"+NRECIBO);
							LISTA_CATEGORIAS = LISTA_CATEGORIAS + NRECIBO + ";";
						}
					}
				}
			}

			if (!isEmpty(CUENTA)) {
				for (int i = 0; i < CUENTA.intValue(); i++) {
					BigDecimal SELEC = getCampoNumerico(request, "BSELEC_" + i);
					logger.debug("bselec" + SELEC);
					if (!isEmpty(SELEC)) {
						if (SELEC.intValue() != 0) { // La casilla est� seleccionada
							String NRECIBO = getCampoTextual(request, "BNREC_" + i);
							LISTA_DOCS = LISTA_DOCS + NRECIBO + ";";
						}
					}
				}
			}

			Map map = pac_iax_impresion.ejecutaPAC_IAX_IMPRESION__F_ENVIA_IMPRESORA(LISTA_CATEGORIAS, LISTA_DOCS,
					IDIMPRESORA);

			logger.debug(map);

			BigDecimal resultado = (BigDecimal) tratarRETURNyMENSAJES(request, map);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisimpr001Service - m�todo m_imprimir", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}
