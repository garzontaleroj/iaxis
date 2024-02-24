//Revision:# BpUmR7owJTeaD/bG4bg3dA== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_PARAM;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisfic006Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class Axisfic006Service extends AxismprxxxService {
	static Log logger = LogFactory.getLog(Axisfic006Service.class);

	public void m_init(HttpServletRequest request, Axisfic006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.initxxx(request, thisAction);
			if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
				String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
				request.getSession().setAttribute("AXISMPRXXX_EST", EST);
			}
			request.getSession().setAttribute("AXISMPRXXX", "axisfic006");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic006Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisfic006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		request.getSession().setAttribute("AXISMPRXXX", "axisfic006");
		if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
			String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
			request.getSession().setAttribute("AXISMPRXXX_EST", EST);
		}
		try {

			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map m = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("PARAGRUPA", usuario.getCempres());
			tratarRETURNyMENSAJES(request, m);
			formdata.put("PARAGRUPA", m.get("RETURN"));
			this.getXXXparam(request, thisAction);
			try {
				BigDecimal SFINANCI = this.getCampoNumerico(request, "SFINANCI");
				if (SFINANCI != null) {
					request.getSession().setAttribute("SFINANCI", SFINANCI);
				} else
					SFINANCI = (BigDecimal) (request.getSession().getAttribute("SFINANCI"));
			} catch (Exception e) {
				logger.warn("No se ha podido recuperar un SFINANCI  del request");
			}
			try {
				BigDecimal NMOVIMI = this.getCampoNumerico(request, "NMOVIMI");
				if (NMOVIMI != null) {
					request.getSession().setAttribute("NMOVIMI", NMOVIMI);
				} else
					NMOVIMI = (BigDecimal) (request.getSession().getAttribute("NMOVIMI"));
			} catch (Exception e) {
				logger.warn("No se ha podido recuperar un NMOVIMI  del request");
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_borrar(HttpServletRequest request, Axisfic006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		if (formdata.get("paginar") != null)
			return; // ignorar si es un paginar

		try {

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (NMOVIMI == null) {
				try {

					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			if (SFINANCI == null && NMOVIMI == null) {
				SFINANCI = (BigDecimal) request.getSession().getAttribute("SFINANCI");
				NMOVIMI = (BigDecimal) request.getSession().getAttribute("NMOVIMI");
			}
			BigDecimal resultado = this.elimXXXparam(request, thisAction);
			if (resultado.intValue() == 0) {
				formdata.put("eliminarOK", "1");
			} else
				formdata.put("eliminarOK", "0");

			request.getSession().removeAttribute("axismprxxx_lista"); // asi aseguramos una actualizacion de la lista

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	// 34989-207442
	// ///////////////////////////////////////////////////////////////////////////////

	protected String TABLAS = "";
	protected BigDecimal SFINANCI = null;
	protected BigDecimal NMOVIMI = null;

	/**
	 * Ajax version
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_validar_parfinanciera(HttpServletRequest request, Axisfic006Action thisAction) {

		logger.error("Axisfic006Service m_validar_parpersona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		SFINANCI = null;
		try {
			SFINANCI = new BigDecimal(request.getSession().getAttribute("SFINANCI").toString());
		} catch (Exception e) {
			logger.warn(
					"m_validar_parfinanciera(): No se ha podido recuperar un SFINANCI de la session. Se toma de SFINANCI");
			Object financieraRapida = request.getSession().getAttribute("SFINANCI");

			if (financieraRapida != null)
				SFINANCI = new BigDecimal(financieraRapida.toString());
			else
				SFINANCI = new BigDecimal(0);
		}

		NMOVIMI = null;
		try {
			NMOVIMI = new BigDecimal(request.getSession().getAttribute("NMOVIMI").toString());
		} catch (Exception e) {
			logger.warn(
					"m_validar_parfinanciera(): No se ha podido recuperar un NMOVIMI de la session. Se toma de NMOVIMI");
			Object movimientoRapido = request.getSession().getAttribute("NMOVIMI");

			if (movimientoRapido != null)
				NMOVIMI = new BigDecimal(movimientoRapido.toString());
			else
				NMOVIMI = new BigDecimal(0);
		}

		TABLAS = "";
		if (!isEmpty(request.getSession().getAttribute("AXISMPRXXX_EST"))
				&& (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper005")
						|| (request.getSession().getAttribute("AXISMPRXXX_EST").equals("axisper022")))) {
			TABLAS = "EST";
		} else {
			TABLAS = "SEG";
		}

		try {
			HashMap aviso = this.F_GET_AVISOS(request, this.whoami(this));
			// BigDecimal pRETURN = (BigDecimal)this.tratarRETURNyMENSAJES(request,aviso);
			ArrayList vavisos = (ArrayList) aviso.get("PLSTAVISOS");
			String mensajeError = "";

			for (int i = 0; i < vavisos.size(); i++) {
				mensajeError = mensajeError
						+ (String) ((HashMap) ((HashMap) vavisos.get(i)).get("OB_IAX_AVISO")).get("TMENSAJE");
				break;
			}

			if ("".equals(mensajeError)) { // No hay yaviso de error
				Map mensajeOk = new HashMap();
				mensajeOk.put("MENSAJE_OK", "1");
				ajax.guardarContenidoFinalAContenedorAjax(mensajeOk);
			} else {
				ajax.guardarErrorAContenedorAjax(mensajeError); // Hay aviso de error
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic006Service - m�todo m_validar_persona", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	protected HashMap F_GET_AVISOS(HttpServletRequest request, String whoami) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			// se ha detectado que a veces llega el literal "null" en el modo
			if (CMODO != null && CMODO.equalsIgnoreCase("null")) {
				CMODO = null;
			}

			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			String pparams = this.getInfoStringConcatenate(request);

			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			logger.debug(m);

			return m;
		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos " + whoami + " ha causado un error", e);
			return null;
		}
	}

	protected String getInfoStringConcatenate(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();

			Enumeration enumera = request.getParameterNames();
			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}
				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			cadena.append("#").append("TABLAS").append(";").append(TABLAS);
			cadena.append("#").append("SFINANCI").append(";").append(SFINANCI);
			cadena.append("#").append("NMOVIMI").append(";").append(NMOVIMI);

			System.out.println("Axisfic006Service.F_GET_AVISOS(cadena) ...... " + cadena);

			return cadena.append("#").toString();
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	// 34989-207442
	// ///////////////////////////////////////////////////////////////////////////////

	public void m_actualizar(HttpServletRequest request, Axisfic006Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		if (formdata.get("paginar") != null)
			return; // ignorar si es un paginar

		try {
			BigDecimal RETURN = this.setXXXparam(request, thisAction);

			request.getSession().removeAttribute("axismprxxx_lista"); // asi aseguramos una actualizacion de la lista
			String ajaxpmessage = "" + RETURN.intValue();// +"\n"+CPARAM+"\n"+CTIPO.intValue()+"\n"+XVALPAR;
			request.setAttribute(Constantes.AJAXPCONTAINER, ajaxpmessage);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic006Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Ajax version
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_vPatrimonial(HttpServletRequest request, Axisfic006Action thisAction) {
		logger.error("Axisfic006Service m_vPatrimonial");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
			if (SFINANCI == null) {
				try {
					SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
				} catch (Exception ex) {
					SFINANCI = null;
				}
			}

			BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
			if (NMOVIMI == null) {
				try {

					NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
				} catch (Exception ex) {
					NMOVIMI = null;
				}
			}
			if (SFINANCI == null && NMOVIMI == null) {
				SFINANCI = (BigDecimal) request.getSession().getAttribute("SFINANCI");
				NMOVIMI = (BigDecimal) request.getSession().getAttribute("NMOVIMI");
			}

			PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map resultado = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_VPATRIMONIAL(SFINANCI, NMOVIMI);
			if (BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, resultado, false))) {
				formdata.put("grabarOK", "1");
			} else
				formdata.put("grabarOK", "0");

		} catch (Exception e) {
			logger.error("Error en el servicio Axisfic006Service - m�todo m_vPatrimonial", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this.getClass()));
		}
	}

}