package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_RELACIONES;
import axis.mvc.control.axis.Axisadm076Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axisadm076Service.java
 * 
 * @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a> Fecha:
 *         30/07/2012 PROP�SITO (descripci�n Service): Ejemplo : Gesti�n de
 *         relaciones
 * 
 *         REVISIONES: Ver Fecha Autor Descripci�n --------- ----------
 *         --------------- ------------------------------------ 1.0 30/07/2012
 *         XPL 1. 22494: MDP_A001- Modulo de relacion de recibos
 * 
 */
public class Axisadm076Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axisadm076Action thisAction) {
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
	public void m_form(HttpServletRequest request, Axisadm076Action thisAction) {
		logger.debug("Axisadm076Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm076Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private void m_cargarCombos(HttpServletRequest request, Axisadm076Action thisAction) {
		logger.debug("Axisadm076Service m_cargarCombos");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		HashMap listValores = new HashMap();
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm076Service - m�todo m_cargarCombos", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_anadir(HttpServletRequest request, Axisadm076Action thisAction) {
		logger.debug("Axisadm076Service m_anadir");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_RELACIONES pacIaxRel = new PAC_IAX_RELACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBO");
			BigDecimal CTIPO = this.getCampoNumerico(request, "CTIPO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal SRELACION = this.getCampoNumerico(request, "SRELACION");

			BigDecimal MODCONSULTA = this.getHiddenCampoNumerico(request, "MODCONSULTA");

			if (!isEmpty(MODCONSULTA))
				request.getSession().removeAttribute("resultado");

			Map m = (Map) pacIaxRel.ejecutaPAC_IAX_RELACIONES__F_SET_RECIBOS_RELACION(CAGENTE, SRELACION, NRECIBO,
					CTIPO);
			logger.debug(m);

			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {
				// request.getSession().setAttribute("resultado", m.get("PTOB_IAX_RELACIONES")
				// );

				if (!isEmpty(request.getSession().getAttribute("resultado"))) {
					ArrayList lista = (ArrayList) request.getSession().getAttribute("resultado");

					ArrayList relbd = (ArrayList) m.get("PTOB_IAX_RELACIONES");

					logger.debug("lista.size()," + lista.size());
					logger.debug("relbd.size()," + relbd.size());

					for (int i = 0; i < relbd.size(); i++) {
						logger.debug("i," + i);
						HashMap mm = (HashMap) relbd.get(i);
						HashMap relx = (HashMap) mm.get("OB_IAX_RELACIONES");
						BigDecimal NRECIBO_bd = (BigDecimal) relx.get("NRECIBO");
						logger.debug("NRECIBO_bd," + NRECIBO_bd);
						if (!estaReptido(lista, NRECIBO_bd))
							lista.add(mm);
					}

				} else
					request.getSession().setAttribute("resultado", m.get("PTOB_IAX_RELACIONES"));

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm076Service - m�todo m_anadir", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private boolean estaReptido(ArrayList lista, BigDecimal NRECIBO) {

		for (int i = 0; i < lista.size(); i++) {
			HashMap m = (HashMap) lista.get(i);
			HashMap rel = (HashMap) m.get("OB_IAX_RELACIONES");
			BigDecimal NRECIBO_REL = (BigDecimal) rel.get("NRECIBO");
			if (NRECIBO.intValue() == NRECIBO_REL.intValue())
				return true;
		}
		return false;
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_limpiar(HttpServletRequest request, Axisadm076Action thisAction) {
		logger.debug("Axisadm076Service m_limpiar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			request.getSession().removeAttribute("resultado");
			request.getSession().removeAttribute("axisctr_agente");
			formdata.clear();

			// this.m_cargarCombos(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm076Service - m�todo m_limpiar", e);
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
	public void m_marcar_desmarcar(HttpServletRequest request, Axisadm076Action thisAction) {
		logger.debug("Axisadm076Service m_marcar_desmarcar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal NRECIBO = this.getCampoNumerico(request, "NRECIBOsel");
			BigDecimal seleccionar = this.getCampoNumerico(request, "MARCAR_DESMARCAR");
			BigDecimal todos = this.getCampoNumerico(request, "TODOS");

			if (!isEmpty(request.getSession().getAttribute("resultado"))) {
				ArrayList lista = (ArrayList) request.getSession().getAttribute("resultado");

				if (isEmpty(seleccionar)) {

					for (int i = 0; i < lista.size(); i++) {
						HashMap m = (HashMap) lista.get(i);
						HashMap rel = (HashMap) m.get("OB_IAX_RELACIONES");
						rel.put("COBLIGA", todos);
					}

				} else {
					for (int i = 0; i < lista.size(); i++) {
						HashMap m = (HashMap) lista.get(i);
						HashMap rel = (HashMap) m.get("OB_IAX_RELACIONES");
						BigDecimal NRECIBO_REL = (BigDecimal) rel.get("NRECIBO");
						if (NRECIBO.intValue() == NRECIBO_REL.intValue())
							rel.put("COBLIGA", seleccionar);
					}

				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm076Service - m�todo m_anadir", e);
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
	public void m_guardar(HttpServletRequest request, Axisadm076Action thisAction) {
		logger.debug("Axisadm076Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_RELACIONES pacIaxRel = new PAC_IAX_RELACIONES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			Map m = (Map) pacIaxRel.ejecutaPAC_IAX_RELACIONES__F_GUARDAR_RECIBO_EN_RELACION(
					generarT_IAX_Info(request, usuario), CAGENTE);
			logger.debug(m);
			if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0)
				formdata.put("SRELACION_OUT", m.get("PSRELACION"));

			// Recargamos el objeto con los recibos de la relacion creada
			if (m.get("PSRELACION") != null) {
				m = (Map) pacIaxRel.ejecutaPAC_IAX_RELACIONES__F_SET_RECIBOS_RELACION(CAGENTE,
						(BigDecimal) m.get("PSRELACION"), null, new BigDecimal(1));
				logger.debug(m);

				if (((BigDecimal) this.tratarRETURNyMENSAJES(request, m)).intValue() == 0) {

					ArrayList relbd = (ArrayList) m.get("PTOB_IAX_RELACIONES");

					logger.debug("relbd.size()," + relbd.size());

					// Los marcamos todos como seleccionados
					for (int i = 0; i < relbd.size(); i++) {
						logger.debug("i," + i);
						HashMap mm = (HashMap) relbd.get(i);
						HashMap relx = (HashMap) mm.get("OB_IAX_RELACIONES");
						relx.put("COBLIGA", new BigDecimal(1));
					}

					request.getSession().setAttribute("resultado", relbd);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm076Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ArrayList lista = (ArrayList) request.getSession().getAttribute("resultado");
		int n = lista.size(); // numero de parametros

		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			int x = 0;
			for (int i = 0; i < lista.size(); i++) {
				HashMap mm = (HashMap) lista.get(i);
				HashMap rel = (HashMap) mm.get("OB_IAX_RELACIONES");
				BigDecimal NRECIBO = (BigDecimal) rel.get("NRECIBO");
				BigDecimal COBLIGA = (BigDecimal) rel.get("COBLIGA");

				if (!isEmpty(COBLIGA) && COBLIGA.intValue() == 1) {
					logger.debug("NRECIBO," + NRECIBO);
					logger.debug("String.valueOf(NRECIBO)," + String.valueOf(NRECIBO));
					paramObj = new ObIaxInfo("NRECIBO", String.valueOf(NRECIBO), "", COBLIGA);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[x] = paramObj;
					x++;
				}
			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");

		return params;
	}
}
