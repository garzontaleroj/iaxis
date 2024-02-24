package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_CAJA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.mvc.control.axis.Axiscaj018Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axiscaj018Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que inicializa los valores de la pantalla: recuperar lista de idiomas
	 * y recuperar Datos de Usuario.
	 * 
	 * @param request El HttpServletRequest que contiene la petici�n del cliente
	 *                web.
	 */
	public void m_form(HttpServletRequest request, Axiscaj018Action thisAction) {
		logger.debug("Axiscaj018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			leerCamposFormulario(request);

		} catch (Exception e) {
			logger.error("Error en el servicio axiscaj018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	/**
	 * M�todo de inicializaci�n de los campos de formulario: usuario y lista de
	 * idiomas.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void leerCamposFormulario(HttpServletRequest request) throws Exception {
		logger.debug("Axiscaj018Service leerCamposFormulario");

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		/*
		 * formdata.put("CUSUARI", null); formdata.put("LISTA_APUNTES", null);
		 * formdata.put("CTIPMOV", null); formdata.put("LISTA_MONEDAS", null);
		 * formdata.put("CMONEOP", null); formdata.put("IMOVIMI", null);
		 * formdata.put("TMOTAPU", null);
		 */
		BigDecimal IMOVIMI = null;
		if (!this.isEmpty(request.getParameter("IMOVIMI"))) {
			String IMOVIMI_s = request.getParameter("IMOVIMI");
			logger.debug("++++IMOVIMI_s.contains(\".\"): " + IMOVIMI_s.contains("."));
			if (IMOVIMI_s.contains(".")) {
				IMOVIMI_s = IMOVIMI_s.replace("/./", "");
			}
			logger.debug("++++IMOVIMI_s: " + IMOVIMI_s);
			IMOVIMI = new BigDecimal(IMOVIMI_s);
		}
		logger.debug("++++IMOVIMI: " + IMOVIMI);
		formdata.put("IMOVIMI", IMOVIMI);

		/* Recuperar datos del usuario actual */
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		logger.debug("**************************************** usuario: " + usuario);
		formdata.put("CUSUARI", usuario.getCusuari());

		// Apuntes Manuales Caja visibles de (482)
		Map map3 = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("492"));
		logger.debug(map3);
		List LISTA_APUNTES = (List) tratarRETURNyMENSAJES(request, map3);
		formdata.put("LISTA_APUNTES", LISTA_APUNTES);

		PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		Map map = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS();
		logger.debug(map);
		List LISTA_MONEDAS = (List) tratarRETURNyMENSAJES(request, map, false);
		formdata.put("LISTA_MONEDAS", LISTA_MONEDAS);

	}

	/*********************************************************************************************************************/
	/************************************************
	 * M�TODOS DE ACTUALIZACI�N
	 *******************************************/
	/*********************************************************************************************************************/

	public void m_guardar(HttpServletRequest request, Axiscaj018Action thisAction) {
		logger.debug("Axiscaj018Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CTIPMOV = getCampoNumerico(request, "CTIPMOV");
			String CUSUARI = getCampoTextual(request, "CUSUARI");
			String CUSUARI2 = getCampoTextual(request, "CUSUARI");
			String CMONEOP = getCampoTextual(request, "CMONEOP");
			BigDecimal IMOVIMI = getCampoNumerico(request, "IMOVIMI");
			Date FFECMOV = new Date(new java.util.Date().getTime());
			String TMOTAPU = getCampoTextual(request, "TMOTAPU");

			PAC_IAX_CAJA pac_iax_caja = new PAC_IAX_CAJA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_caja.ejecutaPAC_IAX_CAJA__F_APUNTEMANUAL(CTIPMOV, CUSUARI, CUSUARI2, CMONEOP, IMOVIMI,
					FFECMOV, TMOTAPU);

			logger.debug("ejecutaPAC_IAX_CAJA__F_APUNTEMANUAL " + map);

			if (!this.isEmpty(((BigDecimal) tratarRETURNyMENSAJES(request, map)))) {
				// List lstRet=new ArrayList();
				// lstRet.add(map.get("RETURN"));
				logger.debug("++++map2 ejecutaPAC_IAX_CAJA__F_APUNTEMANUAL " + map);
			}

			formdata.put("CUSUARI", null);
			formdata.put("LISTA_APUNTES", null);
			formdata.put("CTIPMOV", null);
			formdata.put("LISTA_MONEDAS", null);
			formdata.put("CMONEOP", null);
			formdata.put("IMOVIMI", null);
			formdata.put("TMOTAPU", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscaj018Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

}