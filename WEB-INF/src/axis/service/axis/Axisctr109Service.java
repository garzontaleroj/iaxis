package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
//import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FE_VIDA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisctr109Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axisctr109Service.java
 * 
 * @author <a href = "mailto:pfeliu@csi-ti.com">Autor creaci�n</a> Fecha:
 *         15/09/2010 PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 15/09/2010
 *         PFA(iniciales) 1. Creaci�n del Service. Bug.16000
 */
public class Axisctr109Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de este flujo. Puede servirnos para inicializar
	 * variables.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, Axisctr109Action thisAction) {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

		} catch (Exception e) {
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		}

	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisctr109Action thisAction) {
		logger.debug("Axisctr109Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		// this.formattingNumericValues(request);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			this.m_cargarCombos(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr109Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	/**
	 * Metodo que cargar� la lista de valores de la pantalla.
	 * 
	 * @param request
	 */
	public void m_cargarCombos(HttpServletRequest request, Axisctr109Action thisAction) {
		logger.debug("Axisctr109Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("EMPRESAS->" + map);
			List lstEmpresas = (List) tratarRETURNyMENSAJES(request, map);
			formdata.put("LSTEMPRESAS", lstEmpresas);
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			if (!isEmpty(CEMPRES)) {
				formdata.put("CEMPRES", CEMPRES);
				String TIPO = "FE_DE_VIDA";
				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_RAMOS(TIPO, CEMPRES);
				List lstRamos = (List) tratarRETURNyMENSAJES(request, map);
				formdata.put("axisctr_listaRamos", lstRamos);
				BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
				if (!isEmpty(CRAMO))
					formdata.put("CRAMO", CRAMO);

				map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PRODUCTOS(TIPO, CEMPRES, CRAMO);
				List lstProductos = (List) tratarRETURNyMENSAJES(request, map, false);
				logger.debug("PRODUCTOS->" + map);
				formdata.put("productos", lstProductos);
				BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
				if (!isEmpty(SPRODUC))
					formdata.put("SPRODUC", SPRODUC);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr110Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axisctr109Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CEMP_BUS = getCampoNumerico(request, "CEMP_BUS");
			logger.debug("CEMPRES -------------> " + CEMPRES);

			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NGENERAR = BigDecimal.ZERO;
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			logger.debug("FEFECTO -------------> " + FEFECTO);

			Map map = new PAC_IAX_FE_VIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FE_VIDA__F_GET_DATOS_FE_VIDA(SPROCES, CEMPRES, CRAMO, SPRODUC, CAGENTE, NPOLIZA,
							NCERTIF, FEFECTO, NGENERAR, new BigDecimal(1));

			logger.debug("DATOS FE_VIDA ------------------------> " + map);
			request.setAttribute("listaCampos", (List) tratarRETURNyMENSAJES(request, map, false));

			// this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr109Service - m�todo m_buscar", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	@SuppressWarnings("all")
	public void m_montar_fichero(HttpServletRequest request, Axisctr109Action thisAction) {
		logger.debug("Axisctr109Service m_montar_fichero");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
			Map mapCartas = new HashMap();

			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			BigDecimal CRAMO = getCampoNumerico(request, "CRAMO");
			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal NGENERAR = BigDecimal.ZERO;
			BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
			BigDecimal NCERTIF = getCampoNumerico(request, "NCERTIF");
			Date FEFECTO = stringToSqlDate(getCampoTextual(request, "FEFECTO"));
			BigDecimal SPROCES = getCampoNumerico(request, "SPROCES");
			BigDecimal PNGENERAR = getCampoNumerico(request, "PNGENERAR");

			mapCartas = new PAC_IAX_FE_VIDA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_FE_VIDA__F_GENERAR_FE_VIDA(SPROCES, CEMPRES, CRAMO, SPRODUC, CAGENTE, NPOLIZA,
							NCERTIF, FEFECTO, PNGENERAR);
			tratarRETURNyMENSAJES(request, mapCartas, false);
			logger.debug("MAP CARTAAAAAAAAAS -------->" + mapCartas);

			if (!isEmpty(mapCartas.get("SPROCES")))
				formdata.put("SPROCES", mapCartas.get("SPROCES"));

			formdata.put("PNOMFICH", mapCartas.get("PNOMFICH"));
			logger.debug("PNOMFICH ----------> " + mapCartas.get("PNOMFICH"));
			formdata.put("LIST_FICHEROS", mapCartas.get("VTIMP"));
			logger.debug("LIST_FICHEROS ----------> " + mapCartas.get("PNOMFICH"));

			this.m_buscar(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr109Service - m�todo m_montar_fichero", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
