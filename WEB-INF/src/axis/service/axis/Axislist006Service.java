
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axislist006Service.java
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 29.05.2013 ECG Version inicial
 */
public class Axislist006Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Datos por defecto
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist006Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", "" + usuario.getCempres());
			else
				formdata.put("CEMPRES", "");

			// formdata.put("CUSER", usuario.getCusuari().toUpperCase());
			formdata.put("FINI", new java.util.Date(new java.util.Date().getTime() - (864000000))); // hace unos 10 dias
			formdata.put("FFIN", new java.util.Date());
			// formdata.put("CESTADO", null);
			formdata.put("CBATCH", "1"); // 0 online, 1 batch

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist006Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Aqui solo se preparan los datos para poder pintar la pantalla, menos los
	 * resultados de la busqueda. Eso se hace en m_buscar
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist006Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map mapEMPRESAS = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("------- mapEMPRESAS:" + mapEMPRESAS);
			request.setAttribute("EMPRESAS", (List) tratarRETURNyMENSAJES(request, mapEMPRESAS, false));

			Map mapUSUARIOS = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_GET_USUARIOS(usuario.getCempres());
			logger.debug("------- mapUSUARIOS:" + mapUSUARIOS);
			ArrayList listUusuarios = (ArrayList) mapUSUARIOS.get("PCURSORUSUARIOS");
			logger.debug("------- listUusuarios:" + listUusuarios);
			request.setAttribute("USUARIOS", listUusuarios);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist006Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Buscamos en la BBDD aplicando el filtro que nos viene de la pantalla
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_buscar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_buscar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String paginar = this.getCampoTextual(request, "paginar");
			if (paginar != null) {
				// basta lo que hay en session
			} else {
				request.getSession().removeAttribute("INFORMES");
				String CMAP = this.getCampoTextual(request, "CMAP");
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
				BigDecimal CESTADO = this.getCampoNumerico(request, "CESTADO");
				String CUSER = this.getCampoTextual(request, "CUSER");

				String fechaI = this.getCampoTextual(request, "FINI");
				java.sql.Date SFINI = this.stringToSqlDate(fechaI);

				String fechaF = this.getCampoTextual(request, "FFIN");
				java.sql.Date SFFIN = this.stringToSqlDate(fechaF);

				BigDecimal CBATCH = this.getCampoNumerico(request, "CBATCH");

				Map INFORMES = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_LISTAINFORMES(CEMPRES, CMAP, CESTADO, CUSER, SFINI, SFFIN,
								CBATCH);

				logger.debug("map listaInformes" + INFORMES);
				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, INFORMES)).equals(BigDecimal.ZERO)) {
					request.getSession().setAttribute("INFORMES", (List) INFORMES.get("PCURSONINFORMES"));
					logger.debug("map listaInformes CURSOR ES " + (List) INFORMES.get("PCURSONINFORMES"));

				}

			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist006Service - m�todo m_buscar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/*
	 * public static void main(String[] args) throws Exception { long
	 * unMesEnMS=1000*60*60*24*30; java.util.Date FINI=new java.util.Date(new
	 * java.util.Date().getTime()-(864000000)); //hoy menos un mes
	 * System.out.println(FINI); }
	 */

}
