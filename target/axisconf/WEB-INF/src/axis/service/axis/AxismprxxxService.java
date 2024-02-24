//Revision:# VW1wZ7bQbw8049PIu5Un3A== #
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_AGE_PROPIEDADES;
import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTPARAM;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Funcionalidades comunes para las pantallas de mantenimientode parametros:
 * <ul>
 * <li><code>axismpr001</code>: Buscador de productos (modal)
 * <li><code>axismpr002</code>: Mantenimiento de parametros de producto
 * <li><code>axismpr003</code>: Mantenimiento de parametros de actividad
 * <li><code>axismpr004</code>: Mantenimiento de parametros de garant�a
 * <li><code>axismpr005</code>: Mantenimiento de parametros de instalaci�n
 * <li><code>axismpr006</code>: Buscador de empresas (modal)
 * <li><code>axismpr007</code>: Mantenimiento de parametros de empresa
 * <li><code>axismpr008</code>: Mantenimiento de parametros de conexi�n
 * </ul>
 * 
 * @author <a href="mailto:echristen@csi-ti.com">Elmar Christen (CSI)</a>
 */
public class AxismprxxxService extends AxisBaseService {
	static Log logger = LogFactory.getLog(AxismprxxxService.class);

	/**
	 * retorba para cada token del parametro CUTILICTIPOCPARAM (separados por ",")
	 * la lista de valores a partir de F_GET_DETPARAM el resultado de la lista viene
	 * en un "fichero plano" a traves de AXAJP de la estructura siguiente:<br />
	 * para cada CUTILICTIPOCPARAM-token<br />
	 * c:CUTILICTIPOCPARAM-token\n para cada pareja codigo/valor de este token<br />
	 * v:$CVALPAR\n t:$TVALPAR\n el final de fichero se signaliza con un "e:"
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_listavalores(HttpServletRequest request, AbstractDispatchAction thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			if (formdata.get("CUTILICTIPOCPARAM") == null)
				return;

			StringBuffer ajaxpvalor = new StringBuffer();
			String[] CUTILICTIPOCPARAMs = ((String) formdata.get("CUTILICTIPOCPARAM")).split(","); // "valCUTILI_CTIPO_CPARAM"*
			HashMap parsedVal = null;
			String CPARAM = null;
			HashMap m = null;
			ArrayList milistavalores = null;
			for (int i = 0; i < CUTILICTIPOCPARAMs.length; i++) {
				if (CUTILICTIPOCPARAMs[i].trim().length() == 0)
					continue;
				parsedVal = AxismprxxxService.parseVal(CUTILICTIPOCPARAMs[i]);
				ajaxpvalor.append("c:" + CUTILICTIPOCPARAMs[i]).append("\n");
				CPARAM = (String) parsedVal.get("CPARAM");
				milistavalores = (ArrayList) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_GET_DETPARAM(CPARAM));
				if (milistavalores != null) {
					logger.debug("milistavalores:" + milistavalores);
					// cvalpar,tvalpar
					for (int j = 0; j < milistavalores.size(); j++) {
						m = (HashMap) milistavalores.get(j);
						ajaxpvalor.append("v:" + m.get("CVALPAR").toString()).append("\n");
						ajaxpvalor.append("t:" + m.get("TVALPAR").toString()).append("\n");
					}
				}
			}
			ajaxpvalor.append("e:");
			request.setAttribute(Constantes.AJAXPCONTAINER, ajaxpvalor);
		} catch (Exception e) {
			logger.error("Error en el servicio AxismprxxxService - m�todo m_listavalores", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * parsea
	 * val<c:out value="${XCUTILI}" />_1_<c:out value="${miListaId.CPARAM}" />
	 * 
	 * @param val
	 * @return
	 */
	public static HashMap parseVal(String val) {
		HashMap retVal = new HashMap();
		if (val == null)
			return null;
		String[] fraxis = StringUtils.split(val.substring(3), "_");
		retVal.put("CUTILI", new BigDecimal(fraxis[0]));
		retVal.put("CTIPO", new BigDecimal(fraxis[1]));
		retVal.put("CPARAM", val.substring(("val" + fraxis[0] + "_" + fraxis[1] + "_").length()));
		return retVal;
	}

	/**
	 * limpia session y formdata las entradas que podrian estar en conflicto con el
	 * funcionamiento correcto de las paginas
	 * 
	 * @param request
	 * @param abstractAction
	 */
	protected void initxxx(HttpServletRequest request, AbstractDispatchAction abstractAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		formdata.put("CACTIVI", "-1");
		formdata.remove("CGARANT");

		request.getSession().removeAttribute("axismprxxx_lista");

	}

	/**
	 * M�todo a llamar cuando se quiere hacer un "set" (grabar/actualizar) de un
	 * parametro. Ya que la funcion PL depende de la pantalla - se hace internamente
	 * un "if" sobre el atributo "AXISMPRXXX" (que deberia contener el valor de
	 * whoami del servicio) y actua.
	 * 
	 * @param request
	 * @param abstractAction
	 * @return
	 * @throws Exception
	 */
	protected BigDecimal setXXXparam(HttpServletRequest request, AbstractDispatchAction abstractAction)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SPRODUC = this.stringToBigDecimal((String) formdata.get("SPRODUC"));
		String CUTILI = (String) formdata.get("CUTILI");
		if (CUTILI.length() == 0)
			CUTILI = null;
		BigDecimal CTIPO = this.stringToBigDecimal((String) formdata.get("CTIPO"));
		String CPARAM = (String) formdata.get("CPARAM");
		BigDecimal CACTIVI = this.stringToBigDecimal((String) formdata.get("CACTIVI"));
		if (CACTIVI != null && CACTIVI.intValue() == -1)
			CACTIVI = null;
		BigDecimal CGARANT = this.stringToBigDecimal((String) formdata.get("CGARANT"));
		BigDecimal CEMPRES = this.stringToBigDecimal((String) formdata.get("CEMPRES"));

		BigDecimal SPERSON = null; // 14196: MDP eso causaba un NullPointer en el mantenimiento de parametros new
									// BigDecimal(request.getSession().getAttribute("SPERSON").toString());
		try {
			SPERSON = new BigDecimal(request.getSession().getAttribute("SPERSON").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un SPERSON de la session");
		}

		BigDecimal SFINANCI = null; // 14196: MDP eso causaba un NullPointer en el mantenimiento de parametros new
									// BigDecimal(request.getSession().getAttribute("SFINANCI").toString());
		try {
			SFINANCI = new BigDecimal(request.getSession().getAttribute("SFINANCI").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un SFINANCI de la session");
		}

		BigDecimal NMOVIMI = null; // 14196: MDP eso causaba un NullPointer en el mantenimiento de parametros new
									// BigDecimal(request.getSession().getAttribute("NMOVIMI").toString());
		try {
			NMOVIMI = new BigDecimal(request.getSession().getAttribute("NMOVIMI").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un NMOVIMI de la session");
		}

		// this.stringToBigDecimal(getCampoTextual (request, "SPERSON"));
		BigDecimal CAGENTE = null; // 14196: MDP eso causaba un NullPointer en el mantenimiento de parametros new
									// BigDecimal(request.getSession().getAttribute("CAGENTE").toString());
									// //this.stringToBigDecimal(getCampoTextual (request, "CAGENTE"));

		try {
			CAGENTE = new BigDecimal(request.getSession().getAttribute("CAGENTE").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un CAGENTE de la session");
		}

		BigDecimal CTIPPER = null; // 14196: MDP eso causaba un NullPointer en el mantenimiento de parametros new
									// BigDecimal(request.getSession().getAttribute("CAGENTE").toString());
									// //this.stringToBigDecimal(getCampoTextual (request, "CAGENTE"));

		try {
			CTIPPER = new BigDecimal(request.getSession().getAttribute("CTIPPER").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un CTIPPER de la session");
		}

		BigDecimal CVALPAR = null;
		String TVALPAR = null;
		java.sql.Date FVALPAR = null;

		boolean esNulo = false;
		switch (CTIPO.intValue()) {
		case 1: // texto
			TVALPAR = (String) formdata.get("XVALPAR");
			TVALPAR = TVALPAR.length() == 0 ? null : TVALPAR;
			break;
		case 2: // numerico
			CVALPAR = this.stringToBigDecimal((String) formdata.get("XVALPAR"), null);
			break;
		case 3: // fecha
			// if(XVALPAR.length()>0) FVALPAR=this.stringToSqlDate(XVALPAR,"dd/MM/yyyy");
			if (formdata.get("XVALPAR") != null) {
				if (formdata.get("XVALPAR") != null && formdata.get("XVALPAR") instanceof java.util.Date) {
					FVALPAR = new java.sql.Date(((java.util.Date) formdata.get("XVALPAR")).getTime());
				}
			}
			break;
		case 4: // lista
			CVALPAR = this.stringToBigDecimal((String) formdata.get("XVALPAR"), null);
			break;
		case 5: // numerico
			CVALPAR = this.stringToBigDecimal((String) formdata.get("XVALPAR"), null);
			break;
		}

		BigDecimal RETURN = null;
		// si XVALPAR resulta nulo o de longitud 0, es porque queremos eliminar!
		if (TVALPAR == null && CVALPAR == null && FVALPAR == null) { // hay que eliminar!
			RETURN = this.elimXXXparam(request, abstractAction);
		} else {
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr002")) {
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_SET_PRODPARAM(SPRODUC, CPARAM, CVALPAR, TVALPAR, FVALPAR));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr003")) {
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_SET_ACTPARAM(SPRODUC, CACTIVI, CPARAM, CVALPAR, TVALPAR,
										FVALPAR));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr004")) {
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_SET_GARPARAM(SPRODUC, CACTIVI, CGARANT, CPARAM, CVALPAR,
										TVALPAR, FVALPAR));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr005")) {
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_SET_INSPARAM(CPARAM, CVALPAR, TVALPAR, FVALPAR));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr007")) {
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_SET_EMPPARAM(CEMPRES, CPARAM, CVALPAR, TVALPAR, FVALPAR));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr008")) {
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_MNTPARAM__F_SET_CONPARAM(CPARAM, CVALPAR, TVALPAR, FVALPAR));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axisper023")) {
				if (!isEmpty(request.getSession().getAttribute("AXISMPRXXX_EST"))
						&& (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper005")
								|| (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper022"))))
					RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_PERSONA__F_INS_ESTPARPERSONA(SPERSON, CAGENTE, CPARAM, CVALPAR,
											TVALPAR, FVALPAR));
				else
					RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_PERSONA__F_INS_PARPERSONA(SPERSON, CAGENTE, CPARAM, CVALPAR,
											TVALPAR, FVALPAR));

			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axisfic006")) {
				// RETURN=(BigDecimal)this.tratarRETURNyMENSAJES(request, new
				// PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PERSONA__F_INS_PARPERSONA(SPERSON,
				// CAGENTE, CPARAM, CVALPAR, TVALPAR, FVALPAR));
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_FINANCIERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_FINANCIERA__F_INS_PARCUENTA(SFINANCI, NMOVIMI, CPARAM, CVALPAR, TVALPAR,
										FVALPAR));

			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axisage022")) {
				// RETURN=(BigDecimal)this.tratarRETURNyMENSAJES(request, new
				// PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PERSONA__F_INS_PARPERSONA(SPERSON,
				// CAGENTE, CPARAM, CVALPAR, TVALPAR, FVALPAR));
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_AGE_PROPIEDADES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_AGE_PROPIEDADES__F_INS_PARAGENTE(CAGENTE, CPARAM, CVALPAR, TVALPAR,
										FVALPAR));
			}
		}

		return RETURN;
	}

	/**
	 * M�todo a llamar cuando se quiere hacer un "elim" (eliminar/borrar) de un
	 * parametro. Ya que la funcion PL depende de la pantalla - se hace internamente
	 * un "if" sobre el atributo "AXISMPRXXX" (que deberia contener el valor de
	 * whoami del servicio) y actua.
	 * 
	 * @param request
	 * @param abstractAction
	 * @throws Exception
	 */
	protected BigDecimal elimXXXparam(HttpServletRequest request, AbstractDispatchAction abstractAction)
			throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPRODUC = this.stringToBigDecimal(getCampoTextual(request, "SPRODUC"));
		String CPARAM = getCampoTextual(request, "CPARAM");
		BigDecimal CACTIVI = this.stringToBigDecimal(getCampoTextual(request, "CACTIVI"));
		BigDecimal CGARANT = this.stringToBigDecimal(getCampoTextual(request, "CGARANT"));
		BigDecimal CEMPRES = this.stringToBigDecimal(getCampoTextual(request, "CEMPRES"));
		// INI - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial

		BigDecimal SFINANCI = null;
		BigDecimal NMOVIMI = null;

		if (!request.getSession().getAttribute("AXISMPRXXX").equals("axisper023")) {
			SFINANCI = new BigDecimal(request.getSession().getAttribute("SFINANCI").toString());
			NMOVIMI = new BigDecimal(request.getSession().getAttribute("NMOVIMI").toString());
		}

		// FIN - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
		BigDecimal SPERSON = null; // 14196: MDP eso causaba un NullPointer en el mantenimiento de parametros new
									// BigDecimal(request.getSession().getAttribute("SPERSON").toString());
		try {
			SPERSON = new BigDecimal(request.getSession().getAttribute("SPERSON").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un SPERSON de la session");
		}
		// this.stringToBigDecimal(getCampoTextual (request, "SPERSON"));
		BigDecimal CAGENTE = null; // 14196: MDP DEMOCOL008 eso causaba un NullPointer en el mantenimiento de
									// parametros new
									// BigDecimal(request.getSession().getAttribute("CAGENTE").toString());
									// //this.stringToBigDecimal(getCampoTextual (request, "CAGENTE"));
		try {
			CAGENTE = new BigDecimal(request.getSession().getAttribute("CAGENTE").toString());
		} catch (Exception e) {
			logger.warn("No se ha podido recuperar un CAGENTE de la session");
		}
		BigDecimal RETURN = null;
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr002")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMPRODPARAM(SPRODUC, CPARAM));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr003")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMACTPARAM(SPRODUC, CACTIVI, CPARAM));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr004")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMGARPARAM(SPRODUC, CACTIVI, CGARANT, CPARAM));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr005")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMINSPARAM(CPARAM));
		}
		// INI -IAXIS-14438 -- 04/02/2021
		// INI - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axisfic006")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_FINANCIERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_FINANCIERA__F_DEL_PARAMETRO(SFINANCI, NMOVIMI, CPARAM));
		}
		// FIN - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
		// FIN -IAXIS-14438 -- 04/02/2021
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr007")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMEMPPARAM(CEMPRES, CPARAM));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr008")) {
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_MNTPARAM__F_SET_ELIMCONPARAM(CPARAM));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axisper023")) {
			if (!isEmpty(request.getSession().getAttribute("AXISMPRXXX_EST"))
					&& (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper005")
							|| (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper022"))))
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PERSONA__F_DEL_ESTPARPERSONA(SPERSON, CAGENTE, CPARAM));
			else
				RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
						new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PERSONA__F_DEL_PARPERSONA(SPERSON, CAGENTE, CPARAM));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axisage022")) {
			// RETURN=(BigDecimal)this.tratarRETURNyMENSAJES(request, new
			// PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_PERSONA__F_DEL_PARPERSONA(SPERSON,
			// CAGENTE, CPARAM));
			RETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request,
					new PAC_IAX_AGE_PROPIEDADES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_AGE_PROPIEDADES__F_DEL_PARAGENTE(CAGENTE, CPARAM));
		}
		return RETURN;
	}

	/**
	 * M�todo a llamar cuando se quiere hacer un "get" (recuperar: headers y lista).
	 * Ya que la funcion PL depende de la pantalla - se hace internamente un "if"
	 * sobre el atributo "AXISMPRXXX" (que deberia contener el valor de whoami del
	 * servicio) y actua. se devide el metodo en dos grupos de instruccion: en la
	 * recuperacion de datos para el header (headeritem1, ...2 ,...3 ,...) y (si
	 * fuera necesario) la recuperacion de la lista de parametros
	 * 
	 * @param request
	 * @param abstractAction
	 * @throws Exception
	 */
	protected void getXXXparam(HttpServletRequest request, AbstractDispatchAction abstractAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		BigDecimal SPRODUC = this.stringToBigDecimal(getCampoTextual(request, "SPRODUC"));
		BigDecimal CACTIVI = this.stringToBigDecimal(getCampoTextual(request, "CACTIVI"));
		if (CACTIVI != null && CACTIVI.intValue() == -1)
			CACTIVI = null;
		BigDecimal CGARANT = this.stringToBigDecimal(getCampoTextual(request, "CGARANT"));
		BigDecimal CEMPRES = this.stringToBigDecimal(getCampoTextual(request, "CEMPRES"));

		BigDecimal SPERSON = this.stringToBigDecimal(getCampoTextual(request, "SPERSON"));
		BigDecimal CAGENTE = this.stringToBigDecimal(getCampoTextual(request, "CAGENTE"));
		CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
		BigDecimal CTIPPER = this.stringToBigDecimal(getCampoTextual(request, "CTIPPER"));

		BigDecimal SFINANCI = this.stringToBigDecimal(getCampoTextual(request, "SFINANCI"));
		BigDecimal NMOVIMI = this.stringToBigDecimal(getCampoTextual(request, "NMOVIMI"));
		// INI - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
		if (isEmpty(SFINANCI) && isEmpty(NMOVIMI)) {
			SFINANCI = (BigDecimal) request.getSession().getAttribute("SFINANCI");
			NMOVIMI = (BigDecimal) request.getSession().getAttribute("NMOVIMI");
		}
		// FIN - IAXIS-3673 - JLTS - 15/04/2019. Validaci�n de la ecuaci�n patrimonial
		// request.getSession().setAttribute("SFINANCI", SFINANCI);
		// request.getSession().setAttribute("NMOVIMI", NMOVIMI);

		request.getSession().setAttribute("SPERSON", SPERSON);
		request.getSession().setAttribute("CAGENTE", CAGENTE);

		logger.debug(
				"request.getSession().getAttribute(\"AXISMPRXXX\"):" + request.getSession().getAttribute("AXISMPRXXX"));

		// Bug 0030975 - 11-04-2014 - jmf - si no tiene actividad, asignamos la generica
		// para poder consultar
		if (CACTIVI == null)
			CACTIVI = new BigDecimal("0");

		// 1.info para el header
		if (SPRODUC != null && request.getSession().getAttribute("AXISMPRXXX").equals("axismpr002")) {
			// headeritem1: descripcion producto
			request.setAttribute("headeritem1",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));
		}
		if (SPRODUC != null && request.getSession().getAttribute("AXISMPRXXX").equals("axismpr003")) {
			// headeritem1: descripcion producto, headeritem2: lista de actividades
			request.setAttribute("headeritem1",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));
			request.setAttribute("headeritem2",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_MNTPARAM__F_GET_ACTPROD(SPRODUC)));
		}
		if (SPRODUC != null && request.getSession().getAttribute("AXISMPRXXX").equals("axismpr004")) {
			// headeritem1: descripcion producto, headeritem2: lista de actividades,
			// headeritem3: lista de garantias
			request.setAttribute("headeritem1",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DESCPRODUCTO(SPRODUC)));
			request.setAttribute("headeritem2",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_MNTPARAM__F_GET_ACTPROD(SPRODUC)));
			if (CACTIVI != null)
				request.setAttribute("headeritem3", this.tratarRETURNyMENSAJES(request,
						new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_LSTGARANTIAS(SPRODUC, CACTIVI)));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr005")) {
			// sin headeritems
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr007")) {
			// headeritem1: lista de empresas, para recuperar el TEMPRES a partir del
			// CEMPRES
			request.setAttribute("headeritem1",
					this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS())); // .ejecutaPAC_IAX_LISTVALORES__
																						// __F_GET_DESCPRODUCTO(SPRODUC)));
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr008")) {
			// sin headeritems
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axisper023")) {
			// sin headeritems
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axisage022")) {
			// sin headeritems
		}
		if (request.getSession().getAttribute("AXISMPRXXX").equals("axisfic006")) {
			// sin headeritems
		}

		// 2.info para la lista
		if (formdata.get("paginar") == null || request.getSession().getAttribute("axismprxxx_lista") == null) {

			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr002")) {
				if (SPRODUC != null)
					request.getSession().setAttribute("axismprxxx_lista", this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_MNTPARAM__F_GET_PRODPARAM(SPRODUC)));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr003")) {
				if (SPRODUC != null && CACTIVI != null)
					request.getSession().setAttribute("axismprxxx_lista", this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_MNTPARAM__F_GET_ACTPARAM(SPRODUC, CACTIVI)));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr004")) {
				if (SPRODUC != null && CACTIVI != null && CGARANT != null)
					request.getSession().setAttribute("axismprxxx_lista", this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_MNTPARAM__F_GET_GARPARAM(SPRODUC, CACTIVI, CGARANT)));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr005")) {
				request.getSession().setAttribute("axismprxxx_lista",
						this.tratarRETURNyMENSAJES(request,
								new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_MNTPARAM__F_GET_INSPARAM()));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr007")) {
				if (CEMPRES != null)
					request.getSession().setAttribute("axismprxxx_lista", this.tratarRETURNyMENSAJES(request,
							new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_MNTPARAM__F_GET_EMPPARAM(CEMPRES)));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axismpr008")) {
				request.getSession().setAttribute("axismprxxx_lista",
						this.tratarRETURNyMENSAJES(request,
								new PAC_IAX_MNTPARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_MNTPARAM__F_GET_CONPARAM()));
			}
			if (request.getSession().getAttribute("AXISMPRXXX").equals("axisper023")) {
				if (!isEmpty(request.getSession().getAttribute("AXISMPRXXX_EST"))
						&& (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper005")
								|| request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper022"))) {
					Map m = new HashMap();
					// 34989-207442
					// ///////////////////////////////////////////////////////////////////////////////
					if (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper022")) {
						m = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(SPERSON, CAGENTE, new BigDecimal(0),
										new BigDecimal(1), CTIPPER);
					} else {
						m = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_PERSONA__F_GET_ESTPARPERSONA(SPERSON, CAGENTE, new BigDecimal(0),
										new BigDecimal(1), CTIPPER);
					}

					BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
					ArrayList<HashMap> lista = new ArrayList();
					if (!isEmpty(ok) && ok.intValue() == 0) {
						if (!isEmpty(m.get("PPARPER")))
							lista = (ArrayList<HashMap>) m.get("PPARPER");

						ArrayList axismprxxx_lista = new ArrayList();
						for (HashMap prop : lista) {
							HashMap mm = new HashMap();
							mm.putAll((HashMap) prop.get("OB_IAX_PAR_PERSONAS"));
							axismprxxx_lista.add(mm);
						}

						request.getSession().setAttribute("axismprxxx_lista", axismprxxx_lista);

					}
					//

				} else
					request.getSession().setAttribute("axismprxxx_lista",
							this.tratarRETURNyMENSAJES(request,
									new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_PERSONA__F_GET_PARPERSONA(SPERSON, CAGENTE,
													new BigDecimal(1), new BigDecimal(1))));
			}

			if (request.getSession().getAttribute("AXISMPRXXX").equals("axisage022")) {
				Map m = new HashMap();
				m = new PAC_IAX_AGE_PROPIEDADES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_AGE_PROPIEDADES__F_GET_PARAGENTE_OB(CAGENTE, new BigDecimal(1));
				logger.debug("----> parametros:" + m.get("PPARAGE"));

				BigDecimal ok = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
				ArrayList<HashMap> lista = new ArrayList();
				if (!isEmpty(ok) && ok.intValue() == 0) {
					if (!isEmpty(m.get("PPARAGE")))
						lista = (ArrayList<HashMap>) m.get("PPARAGE");

					ArrayList axismprxxx_lista = new ArrayList();
					for (HashMap prop : lista) {
						HashMap mm = new HashMap();
						mm.putAll((HashMap) prop.get("OB_IAX_PAR_AGENTES"));
						axismprxxx_lista.add(mm);
					}

					request.getSession().setAttribute("axismprxxx_lista", axismprxxx_lista);

				}

			}

			if (request.getSession().getAttribute("AXISMPRXXX").equals("axisfic006")) {
				// -- INI IAXIS-15657 - JLTS - 09/06/2021. Se adiciona null del parametro
				// pPCOBLIGA
				request.getSession().setAttribute("axismprxxx_lista",
						this.tratarRETURNyMENSAJES(request,
								new PAC_IAX_FINANCIERA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_FINANCIERA__F_GET_CONPARAM(SFINANCI, NMOVIMI, null, null,
												null)));
				// -- FIN IAXIS-15657 - JLTS - 09/06/2021
			}

			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("ELIMINAPAR", usuario.getCempres());
			tratarRETURNyMENSAJES(request, m);
			formdata.put("ELIMINAPAR", m.get("RETURN"));
			logger.debug("return ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N: " + m);
			logger.debug("getxxxParam : " + request.getSession().getAttribute("axismprxxx_lista"));

		}

	}

}
