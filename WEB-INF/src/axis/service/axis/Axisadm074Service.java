package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_IMPAGA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.axis.Axisadm074Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axisadm074Service.java
 * 
 * @author <a href = "mailto:autor@csi-ti.com">Autor creaci�n</a> Fecha:
 *         DD/MM/YYYY PROP�SITO (descripci�n Service): Ejemplo : Pantalla de
 *         Busqueda de p�lizas
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 DD/MM/YYYY
 *         XXX(iniciales) 1. Creaci�n del Service. Bug.9296 2.0 DD/MM/YYYY
 *         XXX(iniciales) 2. Ejemplo : A�adir funcionalidad Ramo - Producto .
 *         Bug.: XXXX
 */
public class Axisadm074Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisadm074Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisadm074Action thisAction) {
		logger.debug("Axisadm074Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		// Metode que ens formatejar� tots els imports, Sistema europeo o americ�
		// En el cas que no hi hagi cap import per pantalla millor treure aquesta crida
		this.formattingNumericValues(request);

		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map LISTVALORES = new HashMap();

			BigDecimal pPSSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			BigDecimal pPCACTIMP_BUSC = getHiddenCampoNumerico(request, "CACTIMP_BUSC");
			java.sql.Date pPFACCION = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FACCION"));

			Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_LSTCARTAS();
			logger.debug(map);
			LISTVALORES.put("LSTCARTAS", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(204));
			logger.debug(map);
			LISTVALORES.put("LSTACCION", (List<Map>) tratarRETURNyMENSAJES(request, map, false));

			formdata.put("LISTVALORES", LISTVALORES);

			if (!isEmpty(pPSSEGURO)) {
				map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_GET_IMPAGADOS(pPSSEGURO, null, null, null, pPFACCION,
						pPFACCION, null, null, pPNRECIBO, null, null, null, null, null, pPCACTIMP_BUSC);
				logger.debug(map);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, map))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					if (!isEmpty(map.get("PCURSOR"))) {
						ArrayList imp = (ArrayList) map.get("PCURSOR");
						formdata.putAll((Map) imp.get(0));
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm074Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axisadm074Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_IMPAGA pac_iax_impaga = new PAC_IAX_IMPAGA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal pPSSEGURO = getHiddenCampoNumerico(request, "SSEGURO");
			BigDecimal pPNRECIBO = getHiddenCampoNumerico(request, "NRECIBO");
			BigDecimal pPCACTIMP_BUSC = getHiddenCampoNumerico(request, "CACTIMP_BUSC");
			java.sql.Date pPFACCION = this.stringToSqlDate(this.getHiddenCampoTextual(request, "FACCION"));

			BigDecimal pPCACTIMP = getHiddenCampoNumerico(request, "CACTIMP");
			BigDecimal pPCTIPCAR = getHiddenCampoNumerico(request, "CTIPCAR");

			Map map = pac_iax_impaga.ejecutaPAC_IAX_IMPAGA__F_SET_ACCCARTA(pPSSEGURO, pPNRECIBO, pPCACTIMP_BUSC,
					pPFACCION, pPCACTIMP, pPCTIPCAR);
			logger.debug(map);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, map))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				formdata.put("CACTIMP_BUSC", pPCACTIMP);
				formdata.put("OK", 0);
				this.m_form(request, thisAction);
			} else {
				formdata.put("OK", 1);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm074Service - m�todo m_buscar", e);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}
}
