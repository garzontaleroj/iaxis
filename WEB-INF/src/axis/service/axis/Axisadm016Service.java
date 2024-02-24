package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_ADM;
import axis.jdbc.PAC_IAX_GESTION_REC;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisadm016Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

public class Axisadm016Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request) {
		logger.debug("Axisadm016Service m_form");
		try {
		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm016Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * 
	 * @param request
	 */
	@SuppressWarnings("all")
	public void m_form(HttpServletRequest request, Axisadm016Action thisAction) {
		logger.debug("Axisadm016Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal COBBANCARIO = getCampoNumerico(request, "list_COBBANCARIO");
			BigDecimal DELEGACI = getCampoNumerico(request, "list_DELEGACI");

			Date FMOVIMI = stringToSqlDate(getCampoTextual(request, "FMOVIMI"));
			// Si la fecha es null, rellenamos con la fecha de hoy
			Date hoy = new Date(new java.util.Date().getTime());
			FMOVIMI = ((!isEmpty(FMOVIMI)) ? FMOVIMI : hoy);

			// Datos que provienen de un flujo externo para controlar:
			// a- Si queremos ver el modal
			// b- A que pantalla de vuelta se dirige cuando se cancela.
			boolean acceso_externo = ((!isEmpty(thisAction.topPila(request, "acceso_externo")))
					? (Boolean) thisAction.topPila(request, "acceso_externo")
					: false);
			String pantalla_origen = ((!isEmpty(thisAction.topPila(request, "pantalla_origen")))
					? (String) thisAction.topPila(request, "pantalla_origen")
					: "axisctr020");

			request.setAttribute("acceso_externo", acceso_externo);
			request.setAttribute("pantalla_origen", pantalla_origen);

			if (!isEmpty(NRECIBO)) {
				PAC_IAX_ADM pac_iax_adm = new PAC_IAX_ADM(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

				// Info del recibo
				Map map1 = pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO, new BigDecimal(0));
				Map OB_IAX_RECIBOS = (Map) tratarRETURNyMENSAJES(request, map1);
				logger.debug(OB_IAX_RECIBOS);

				// ReFormateo el valor de CBANCAR
				if (!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CBANCAR"))) {
					String CBANCAR_TMP = (String) OB_IAX_RECIBOS.get("CBANCAR");
					CBANCAR_TMP = CBANCAR_TMP.replaceAll("-", "");
					OB_IAX_RECIBOS.put("CBANCAR", CBANCAR_TMP);
					logger.debug(OB_IAX_RECIBOS);
				}

				// Info. general de la p�liza
				BigDecimal SSEGURO = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("SSEGURO")))
						? (BigDecimal) OB_IAX_RECIBOS.get("SSEGURO")
						: null);
				Map map2 = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				Map OB_IAX_GENPOLIZA = (Map) tratarRETURNyMENSAJES(request, map2);
				logger.debug(OB_IAX_GENPOLIZA);

				// Solo recargamos si no realizamos correctamente la acci�n final
				if (!estaReciboCobrado(request)) {
					// Carga de empresa
					BigDecimal CEMPRES = ((!isEmpty(OB_IAX_RECIBOS) && !isEmpty(OB_IAX_RECIBOS.get("CEMPRES")))
							? (BigDecimal) OB_IAX_RECIBOS.get("CEMPRES")
							: null);
					Map map3 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOBRADORES(CEMPRES);
					List T_IAX_COBRADORES = (List) tratarRETURNyMENSAJES(request, map3);
					logger.debug(T_IAX_COBRADORES);

					// Carga de delegaciones
					Map map4 = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDELEGACIONES(CEMPRES);
					List T_IAX_DELEGACIONES = (List) tratarRETURNyMENSAJES(request, map4);
					logger.debug(T_IAX_DELEGACIONES);

					// Lo guardamos en sesi�n para no perder nunca sus valores
					request.setAttribute("REC_IAX_COBRADORES", !isEmpty(T_IAX_COBRADORES) ? T_IAX_COBRADORES : null);
					request.setAttribute("REC_IAX_DELEGACIONES",
							!isEmpty(T_IAX_DELEGACIONES) ? T_IAX_DELEGACIONES : null);

					// Si estan seleccionados los combos, para cargarlos en pantalla
					request.setAttribute("selected_COBBANCARIO", !isEmpty(COBBANCARIO) ? COBBANCARIO : null);

					request.setAttribute("selected_DELEGACI", !isEmpty(DELEGACI) ? DELEGACI : null);

					request.setAttribute("FMOVIMI", !isEmpty(FMOVIMI) ? FMOVIMI : null);
				} else {
					// Limpiamos objetos de sesi�n
					m_salir(request);
				}

				request.setAttribute("NRECIBO", !isEmpty(NRECIBO) ? NRECIBO : null);
				request.setAttribute("OB_IAX_RECIBOS", !isEmpty(OB_IAX_RECIBOS) ? OB_IAX_RECIBOS : new HashMap());
				request.setAttribute("OB_IAX_GENPOLIZA", !isEmpty(OB_IAX_GENPOLIZA) ? OB_IAX_GENPOLIZA : new HashMap());
				/*
				 * PAC_IAX_ADM pac_iax_adm=new
				 * PAC_IAX_ADM((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
				 * PAC_IAX_PRODUCCION pac_iax_produccion=new
				 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
				 * DB01CONN)); //Info del recibo Map
				 * map=pac_iax_adm.ejecutaPAC_IAX_ADM__F_GET_DATOSRECIBO(NRECIBO); Map
				 * OB_IAX_RECIBOS=(Map)tratarRETURNyMENSAJES(request, map);
				 * logger.debug(OB_IAX_RECIBOS);
				 * 
				 * //ReFormateo el valor de CBANCAR if
				 * (!isEmpty(OB_IAX_RECIBOS)&&!isEmpty(OB_IAX_RECIBOS.get("CBANCAR"))) { String
				 * CBANCAR_TMP=(String)OB_IAX_RECIBOS.get("CBANCAR");
				 * CBANCAR_TMP=CBANCAR_TMP.replaceAll("-", ""); OB_IAX_RECIBOS.put("CBANCAR",
				 * CBANCAR_TMP); logger.debug(OB_IAX_RECIBOS); }
				 * 
				 * //Info. general de la p�liza BigDecimal
				 * SSEGURO=((!isEmpty(OB_IAX_RECIBOS)&&!isEmpty(OB_IAX_RECIBOS.get("SSEGURO")))?
				 * (BigDecimal)OB_IAX_RECIBOS.get("SSEGURO"):null); Map
				 * map1=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DATPOLIZA(SSEGURO);
				 * Map OB_IAX_GENPOLIZA=(Map)tratarRETURNyMENSAJES(request, map1);
				 * logger.debug(OB_IAX_GENPOLIZA);
				 * 
				 * if(!estaReciboCobrado(request)){ //Configuramos el objeto p�liza Map
				 * map11=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_SET_CONSULTAPOLIZA(
				 * SSEGURO); BigDecimal
				 * returnConsultaPoliza=(BigDecimal)tratarRETURNyMENSAJES(request, map11);
				 * logger.debug(returnConsultaPoliza);
				 * 
				 * //Info del tomador BigDecimal
				 * SPERSON=((!isEmpty(OB_IAX_GENPOLIZA)&&!isEmpty(OB_IAX_GENPOLIZA.get("SPERTOM"
				 * )))?(BigDecimal)OB_IAX_GENPOLIZA.get("SPERTOM"):null); Map
				 * map2=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_TOMADOR(SPERSON);
				 * Map OB_IAX_TOMADORES=(Map)tratarRETURNyMENSAJES(request, map2);
				 * logger.debug(OB_IAX_TOMADORES);
				 * 
				 * //Cuenta banc�ria BigDecimal
				 * NNUMIDE=((!isEmpty(OB_IAX_TOMADORES)&&!isEmpty(OB_IAX_TOMADORES.get("SPERSON"
				 * )))?((BigDecimal)OB_IAX_TOMADORES.get("SPERSON")):null); String
				 * SNIP=((!isEmpty(OB_IAX_TOMADORES)&&!isEmpty(OB_IAX_TOMADORES.get("SNIP")))?(
				 * String)OB_IAX_TOMADORES.get("SNIP"):null); String PORIGEN="POL"; Map
				 * map3=pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_CCC_HOST(NNUMIDE,
				 * SNIP, PORIGEN); List cuentas=(List)tratarRETURNyMENSAJES(request, map3);
				 * logger.debug(cuentas);
				 * 
				 * request.setAttribute("OB_IAX_TOMADORES",
				 * !isEmpty(OB_IAX_TOMADORES)?OB_IAX_TOMADORES:new HashMap());
				 * request.setAttribute("cuentas", !isEmpty(cuentas)?cuentas:new ArrayList()); }
				 * 
				 * request.setAttribute("NRECIBO", !isEmpty(NRECIBO)?NRECIBO:null);
				 * request.setAttribute("OB_IAX_RECIBOS",
				 * !isEmpty(OB_IAX_RECIBOS)?OB_IAX_RECIBOS:new HashMap());
				 * request.setAttribute("OB_IAX_GENPOLIZA",
				 * !isEmpty(OB_IAX_GENPOLIZA)?OB_IAX_GENPOLIZA:new HashMap());
				 */
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm016Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que limpia los elementos en sesi�n que no necesarios
	 * 
	 * @param request
	 */
	public void m_salir(HttpServletRequest request) {
		logger.debug("Axisadm016Service m_salir");
		Enumeration<String> attributeNames = request.getSession().getAttributeNames();

		while (attributeNames.hasMoreElements()) {
			String attribute = attributeNames.nextElement();
			if (attribute.startsWith("REC_"))
				request.getSession().removeAttribute(attribute);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_aceptar(HttpServletRequest request) {
		logger.debug("Axisadm016Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal NRECIBO = getCampoNumerico(request, "NRECIBO");
			BigDecimal CEMPRES = getCampoNumerico(request, "CEMPRES");
			Date FMOVIMI = stringToSqlDate(getCampoTextual(request, "FMOVIMI"), "dd/MM/yyyy");
			BigDecimal COBBAN = isEmpty(getCampoNumerico(request, "list_COBBANCARIO"))
					? getCampoNumerico(request, "CCOBBANCARIOselected")
					: getCampoNumerico(request, "list_COBBANCARIO");
			BigDecimal DELEGA = getCampoNumerico(request, "list_DELEGACI");
			/*
			 * BigDecimal COBBAN= getCampoNumerico(request, "OB_IAX_RECIBOS.CCOBBAN");
			 * BigDecimal DELEGA=getCampoNumerico(request, "OB_IAX_RECIBOS.CDELEGA");
			 */
			BigDecimal PHOST = new BigDecimal(1);
			BigDecimal PTIPCOB = new BigDecimal(1);

			PAC_IAX_GESTION_REC pac_iax_gestion_rec = new PAC_IAX_GESTION_REC(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// Cobro el recibo
			Map map3 = pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_COBRO_RECIBO(CEMPRES, NRECIBO, FMOVIMI, COBBAN,
					DELEGA, PHOST, PTIPCOB);
			BigDecimal returnCobroOnline = (BigDecimal) tratarRETURNyMENSAJES(request, map3);
			logger.debug(returnCobroOnline);

			if (BigDecimal.ZERO.equals(returnCobroOnline)) {
				List T_IAX_COBRADO = new ArrayList();
				Map OB_IAX_COBRADO = new HashMap();
				String TPRODUC = getCampoTextual(request, "TPRODUC");
				BigDecimal NPOLIZA = getCampoNumerico(request, "NPOLIZA");
				String TAGENTE = getCampoTextual(request, "TAGENTE");
				BigDecimal ICOMISI = getCampoNumerico(request, "ICOMISI");
				BigDecimal IMPORTE = getCampoNumerico(request, "IMPORTE");

				OB_IAX_COBRADO.put("NRECIBO", NRECIBO);
				OB_IAX_COBRADO.put("TPRODUC", TPRODUC);
				OB_IAX_COBRADO.put("NPOLIZA", NPOLIZA);
				OB_IAX_COBRADO.put("TAGENTE", TAGENTE);
				OB_IAX_COBRADO.put("ICOMISI", ICOMISI);
				OB_IAX_COBRADO.put("IMPORTE", IMPORTE);

				T_IAX_COBRADO.add(OB_IAX_COBRADO);

				logger.debug(T_IAX_COBRADO);

				request.setAttribute("T_IAX_COBRADO", !isEmpty(T_IAX_COBRADO) ? T_IAX_COBRADO : new ArrayList());
				// Para evitar repetir el proceso de cobro, en pantalla, con la misma p�liza
				request.setAttribute("COBRADO", true);
			}
			/*
			 * BigDecimal NRECIBO=getCampoNumerico(request, "NRECIBO"); String
			 * CBANCAR=getCampoTextual(request, "list_CBANCAR"); BigDecimal
			 * CTIPCOB=BigDecimal.ONE; BigDecimal CTIPBAN=getCampoNumerico(request,
			 * "CTIPBAN");
			 * 
			 * PAC_IAX_GESTION_REC pac_iax_gestion_rec=new
			 * PAC_IAX_GESTION_REC((java.sql.Connection)request.getAttribute(Constantes.
			 * DB01CONN));
			 * 
			 * request.setAttribute("selected_CBANCAR", getCampoNumerico(request,
			 * "list_CBANCAR"));
			 * 
			 * Map
			 * map1=pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_COBRO_RECIBO_ONLINE(
			 * NRECIBO); BigDecimal
			 * returnCobroRecibo=(BigDecimal)tratarRETURNyMENSAJES(request, map1);
			 * logger.debug(returnCobroRecibo);
			 * 
			 * if (BigDecimal.ZERO.equals(returnCobroRecibo)) { Map
			 * map=pac_iax_gestion_rec.ejecutaPAC_IAX_GESTION_REC__F_COBRO_RECIBO_HOST(
			 * NRECIBO, CBANCAR, CTIPCOB, CTIPBAN); BigDecimal
			 * returnCobroHost=(BigDecimal)tratarRETURNyMENSAJES(request, map);
			 * logger.debug(returnCobroHost);
			 * 
			 * if (!isEmpty(returnCobroHost)&&BigDecimal.ZERO.equals(returnCobroHost)) {
			 * List T_IAX_COBRADO=new ArrayList(); Map OB_IAX_COBRADO=new HashMap(); String
			 * TPRODUC=getCampoTextual(request, "TPRODUC"); BigDecimal
			 * NPOLIZA=getCampoNumerico(request, "NPOLIZA"); String
			 * TAGENTE=getCampoTextual(request, "TAGENTE"); BigDecimal
			 * ICOMISI=getCampoNumerico(request, "ICOMISI"); BigDecimal
			 * IMPORTE=getCampoNumerico(request, "IMPORTE");
			 * 
			 * OB_IAX_COBRADO.put("NRECIBO", NRECIBO); OB_IAX_COBRADO.put("TPRODUC",
			 * TPRODUC); OB_IAX_COBRADO.put("NPOLIZA", NPOLIZA);
			 * OB_IAX_COBRADO.put("TAGENTE", TAGENTE); OB_IAX_COBRADO.put("ICOMISI",
			 * ICOMISI); OB_IAX_COBRADO.put("IMPORTE", IMPORTE); //cargamos en pantalla el
			 * proceso de cobro if (!isEmpty(map1.get("PSINTERF"))) {
			 * OB_IAX_COBRADO.put("SINTERF", (BigDecimal)map1.get("PSINTERF")); }
			 * 
			 * T_IAX_COBRADO.add(OB_IAX_COBRADO);
			 * 
			 * logger.debug(T_IAX_COBRADO);
			 * 
			 * request.setAttribute("T_IAX_COBRADO",
			 * !isEmpty(T_IAX_COBRADO)?T_IAX_COBRADO:new ArrayList()); //Para evitar repetir
			 * el proceso de cobro, en pantalla, con la misma p�liza
			 * request.setAttribute("COBRADO", true); } }
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisadm016Service - m�todo m_aceptar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	/**
	 * M�todo que comprueba si un recibo ha sido cobrado
	 * 
	 * @param request
	 * @return
	 * @throws Exception
	 */
	private boolean estaReciboCobrado(HttpServletRequest request) throws Exception {
		boolean estaCobrado = true;

		if (!isEmpty(request) && isEmpty(request.getAttribute("COBRADO")))
			estaCobrado = false;

		return estaCobrado;
	}
}
