package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axisrea002Service.java 20/08/2008
 * 
 * @author <a href="jtorres@csi-ti.com">Jorge Torres</a>
 * @since Java 5.0
 */
public class Axisrea002Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	private int f_indice_contrato(ArrayList pLista, BigDecimal pSCONTRA, BigDecimal pNVERSIO) {
		int vIndice = 0;
		boolean vTrobat = false;
		BigDecimal auxSCONTRA;
		BigDecimal auxNVERSIO;

		while (!vTrobat && vIndice < pLista.size()) {
			auxSCONTRA = (BigDecimal) ((HashMap) ((HashMap) pLista.get(vIndice)).get("OB_IAX_CONTRATO_REA"))
					.get("SCONTRA");
			auxNVERSIO = (BigDecimal) ((HashMap) ((HashMap) pLista.get(vIndice)).get("OB_IAX_CONTRATO_REA"))
					.get("NVERSIO");
			if (auxSCONTRA.equals(pSCONTRA) && auxNVERSIO.equals(pNVERSIO)) {
				vTrobat = true;
			} else {
				vIndice++;
			}
		}

		if (vTrobat)
			return vIndice;
		else
			return -1;
	}

	private int f_indice_tramo(ArrayList pLista, BigDecimal pSCONTRA, BigDecimal pNVERSIO, BigDecimal pCTRAMO) {
		int vIndice = 0;
		boolean vTrobat = false;
		BigDecimal auxSCONTRA;
		BigDecimal auxNVERSIO;
		BigDecimal auxCTRAMO;

		while (!vTrobat && vIndice < pLista.size()) {
			auxSCONTRA = (BigDecimal) ((HashMap) ((HashMap) pLista.get(vIndice)).get("OB_IAX_TRAMOS_REA"))
					.get("SCONTRA");
			auxNVERSIO = (BigDecimal) ((HashMap) ((HashMap) pLista.get(vIndice)).get("OB_IAX_TRAMOS_REA"))
					.get("NVERSIO");
			auxCTRAMO = (BigDecimal) ((HashMap) ((HashMap) pLista.get(vIndice)).get("OB_IAX_TRAMOS_REA")).get("CTRAMO");
			if (auxSCONTRA.equals(pSCONTRA) && auxNVERSIO.equals(pNVERSIO) && auxCTRAMO.equals(pCTRAMO)) {
				vTrobat = true;
			} else {
				vIndice++;
			}
		}

		if (vTrobat)
			return vIndice;
		else
			return -1;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public

			void m_form(HttpServletRequest request) {
		logger.debug("Axisrea002Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal vSCONTRA = getCampoNumerico(request, "SCONTRA");
			BigDecimal vobtenerDatos = getCampoNumerico(request, "obtenerDatos");
			BigDecimal vNVERSIO = getCampoNumerico(request, "NVERSIO");
			BigDecimal vCTRAMO = getCampoNumerico(request, "CTRAMO");

			/*
			 * var hayLSTRECIBOS = ${!empty sessionScope.REC_LSTRECIBOS};
			 */

			int indiceContrato;
			int indiceTramo;
			ArrayList listaContratos;

			if (vSCONTRA != null) {
				formdata.remove("SCONTRA");

				formdata.put("SCONTRA", vSCONTRA);

				// if(vobtenerDatos.intValue()==0){
				Map map = pac_iax_rea.ejecutaPAC_IAX_REA__F_GET_DETALLECAB_REA(vSCONTRA, null);

				logger.debug(map);
				Map OB_IAX_CODICONTRATO_REA = (Map) tratarRETURNyMENSAJES(request, map, false);
				request.setAttribute("OB_IAX_CODICONTRATO_REA", OB_IAX_CODICONTRATO_REA);

				listaContratos = (ArrayList) OB_IAX_CODICONTRATO_REA.get("CONTRATOS");

				// }
				// else{
				// Map OB_IAX_CODICONTRATO_REA =
				// (Map)request.getSession().getAttribute("OB_IAX_CODICONTRATO_REA");
				// listaContratos = (ArrayList)OB_IAX_CODICONTRATO_REA.get("CONTRATOS");
				// }

				request.setAttribute("listaContratos", listaContratos);

				if (vSCONTRA != null && vNVERSIO != null) {
					indiceContrato = f_indice_contrato(listaContratos, vSCONTRA, vNVERSIO);
					if (indiceContrato == -1) {
						indiceContrato = 0;
					}
				} else {
					indiceContrato = 0;
				}

				HashMap OB_IAX_CONTRATO_REA = (HashMap) ((HashMap) listaContratos.get(indiceContrato))
						.get("OB_IAX_CONTRATO_REA");
				vNVERSIO = (BigDecimal) OB_IAX_CONTRATO_REA.get("NVERSIO");

				formdata.remove("OB_IAX_CONTRATO_REA");
				formdata.put("OB_IAX_CONTRATO_REA", OB_IAX_CONTRATO_REA);

				ArrayList listaTramos = (ArrayList) ((HashMap) ((HashMap) listaContratos.get(indiceContrato))
						.get("OB_IAX_CONTRATO_REA")).get("TTRAMOS");
				request.setAttribute("listaTramos", listaTramos);

				if (vSCONTRA != null && vNVERSIO != null && vCTRAMO != null) {
					indiceTramo = f_indice_tramo(listaTramos, vSCONTRA, vNVERSIO, vCTRAMO);
					if (indiceTramo == -1)
						indiceTramo = 0;
				} else {
					indiceTramo = 0;
				}

				if (listaTramos.size() > 0) {
					HashMap OB_IAX_TRAMOS_REA = (HashMap) ((HashMap) listaTramos.get(indiceTramo))
							.get("OB_IAX_TRAMOS_REA");
					vCTRAMO = (BigDecimal) OB_IAX_TRAMOS_REA.get("CTRAMO");

					formdata.remove("OB_IAX_TRAMOS_REA");
					formdata.put("OB_IAX_TRAMOS_REA", OB_IAX_TRAMOS_REA);

					ArrayList listaCuadroces = (ArrayList) ((HashMap) ((HashMap) listaTramos.get(indiceTramo))
							.get("OB_IAX_TRAMOS_REA")).get("CUADROCES");
					request.setAttribute("listaCuadroces", listaCuadroces);

					ArrayList listaTramosinbono = (ArrayList) ((HashMap) ((HashMap) listaTramos.get(indiceTramo))
							.get("OB_IAX_TRAMOS_REA")).get("TRAMOSINBONO");
					request.setAttribute("listaTramosinbono", listaTramosinbono);

					logger.debug("################" + listaTramosinbono);
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	/**
	 * METODO PARA ACTIVAR CONTRATO 4559 - ML ACTIVA CONTRATO BASANDOSE EN LA ULTIMA
	 * VERSION DEL CONTRATO
	 */
	public void activarContrato(HttpServletRequest request) {
		logger.debug("Axisrea002Service activarContrato");

		try {
			PAC_IAX_REA pac_iax_rea = new PAC_IAX_REA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal vSCONTRA = getCampoNumerico(request, "SCONTRA");
			Map<?, ?> resp = pac_iax_rea.ejecutaPAC_IAX_REA__F_ACTIVAR_CONTRATO(vSCONTRA);
			logger.debug(resp);
			tratarRETURNyMENSAJES(request, resp, false);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea002Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}
}
