package axis.service.modal;

import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_MNTUSER;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axismnt020Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * NOMBRE: Axismnt020Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Autor creaci�n</a> Fecha:
 *         DD/MM/YYYY PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 DD/MM/YYYY
 *         XXX(iniciales) 1. Creaci�n del Service. Bug.9296
 */
public class Axismnt020Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axismnt020Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axismnt020Action thisAction) {
		logger.debug("Axismnt020Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PCIDCFG = getCampoNumerico(request, "PCIDCFG");

			BigDecimal PCEMPRES = getCampoNumerico(request, "PCEMPRES");
			String PCFORM = getCampoTextual(request, "PCODFORM");
			String PCMODO = getCampoTextual(request, "PCMODO");
			String PCCFGFORM = getCampoTextual(request, "PCCFGFORM");
			BigDecimal PSPRODUC = getCampoNumerico(request, "PSPRODUC");

			Map map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CABCFGFORM(PCIDCFG, PCEMPRES, PCFORM, PCMODO,
					PCCFGFORM, PSPRODUC);
			logger.debug(map);
			tratarRETURNyMENSAJES(request, map, false);
			formdata.put("CABCFG", (List<Map>) map.get("PCURSOR"));

			Map LISTVALORES = new HashMap();

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(550));
			logger.debug(map);
			LISTVALORES.put("LSTPROPIEDADES", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
			logger.debug(map);
			LISTVALORES.put("LSTSINO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800012));
			logger.debug(map);
			LISTVALORES.put("LSTENMASCARA", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			formdata.put("PCEMPRES", PCEMPRES);
			formdata.put("PCFORM", PCFORM);
			formdata.put("PCMODO", PCMODO);
			formdata.put("PCCFGFORM", PCCFGFORM);
			formdata.put("PSPRODUC", PSPRODUC);

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt020Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axismnt020Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal CEMPRES = isEmpty(this.getCampoNumerico(request, "CEMPRESCAB"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRESCAB")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRESCAB")))
					: this.getCampoNumerico(request, "CEMPRESCAB");

			BigDecimal CIDCFG = isEmpty(this.getCampoNumerico(request, "CIDCFG"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CIDCFG")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CIDCFG")))
					: this.getCampoNumerico(request, "CIDCFG");

			String CFORM = isEmpty(this.getCampoTextual(request, "CFORMCAB"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CFORMCAB")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "CFORMCAB")))
					: this.getCampoTextual(request, "CFORMCAB");

			BigDecimal CPRPTY = isEmpty(this.getCampoNumerico(request, "CPRPTY"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CPRPTY")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CPRPTY")))
					: this.getCampoNumerico(request, "CPRPTY");

			String CITEM = isEmpty(this.getCampoTextual(request, "CITEM"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CITEM")) ? null
							: new String((String) AbstractDispatchAction.topPila(request, "CITEM")))
					: this.getCampoTextual(request, "CITEM");

			BigDecimal CVALUE_LLIURE = isEmpty(this.getCampoNumerico(request, "CVALUE_LLIURE"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CVALUE_LLIURE")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CVALUE_LLIURE")))
					: this.getCampoNumerico(request, "CVALUE_LLIURE");

			BigDecimal CVALUE_SINO = isEmpty(this.getCampoNumerico(request, "CVALUE_SINO"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CVALUE_SINO")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CVALUE_SINO")))
					: this.getCampoNumerico(request, "CVALUE_SINO");

			BigDecimal CVALUE_MASC = isEmpty(this.getCampoNumerico(request, "CVALUE_MASC"))
					? (isEmpty((String) AbstractDispatchAction.topPila(request, "CVALUE_MASC")) ? null
							: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CVALUE_MASC")))
					: this.getCampoNumerico(request, "CVALUE_MASC");

			BigDecimal CVALUE = isEmpty(CVALUE_LLIURE) ? isEmpty(CVALUE_SINO) ? CVALUE_MASC : CVALUE_SINO
					: CVALUE_LLIURE;

			PAC_IAX_MNTUSER pac_iax_mntuser = new PAC_IAX_MNTUSER(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_SET_CFGFORMPROPERTY(CEMPRES, CIDCFG, CFORM, CITEM,
					CPRPTY, CVALUE);
			logger.debug(map);

			tratarRETURNyMENSAJES(request, map, false);
			if (map.get("RETURN").equals(new BigDecimal(0))) {
				formdata.put("OK", new BigDecimal(1));
			} else {
				formdata.put("OK", new BigDecimal(0));

				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				BigDecimal PCEMPRES = getCampoNumerico(request, "PCEMPRES");
				String PCFORM = getCampoTextual(request, "PCFORM");
				String PCMODO = getCampoTextual(request, "PCMODO");
				String PCCFGFORM = getCampoTextual(request, "PCCFGFORM");
				BigDecimal PSPRODUC = getCampoNumerico(request, "PSPRODUC");

				map = pac_iax_mntuser.ejecutaPAC_IAX_MNTUSER__F_GET_CABCFGFORM(CIDCFG, PCEMPRES, PCFORM, PCMODO,
						PCCFGFORM, PSPRODUC);
				logger.debug(map);
				tratarRETURNyMENSAJES(request, map, false);
				formdata.put("CABCFG", (List<Map>) map.get("PCURSOR"));

				Map LISTVALORES = new HashMap();

				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(550));
				logger.debug(map);
				LISTVALORES.put("LSTPROPIEDADES", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(108));
				logger.debug(map);
				LISTVALORES.put("LSTSINO", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

				map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800012));
				logger.debug(map);
				LISTVALORES.put("LSTENMASCARA", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

				formdata.put("LISTVALORES", LISTVALORES);
			}

			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axismnt020Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
