//Revision:# Cnwbz29hDo5NuDBskjUoaQ== #
package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import com.csi_ti.security.aes.AESUtil;

import axis.jdbc.PAC_IAX_ANULACIONES;
import axis.jdbc.PAC_IAX_GESTIONES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.modal.Axissin011Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin011Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private Axissin017Service axissin017Service = new Axissin017Service();

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		AESUtil encryptedVal = new AESUtil();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
		BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
		request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

		// if (pRETURN != null && pRETURN.intValue() != 1) {

		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listvalores_sin = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_ANULACIONES pac_axis_anulaciones = new PAC_IAX_ANULACIONES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SIN_TRAMITE pac_axis_sin_tramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		Map listValores = new HashMap();
		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		String NSINIES = getCampoTextual(request, "NSINIES");
		if (NSINIES == null && isEmpty(NSINIES)) {
			NSINIES = request.getParameter("NSINIES");
		}
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		if (NTRAMIT == null && isEmpty(NTRAMIT)) {
			NTRAMIT = getCampoNumerico(request, "indexTramitacio");
		}

		Map OBPERSONA = new HashMap();

		Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_TOMADORES(SSEGURO);
		listValores.put("lsttomadores", (List) tratarRETURNyMENSAJES(request, map, false));
		logger.debug("===>lsttomadores:" + map);

		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_ASEGURADOS(SSEGURO);
		listValores.put("lstasegurados", (List) tratarRETURNyMENSAJES(request, map, false));
		logger.debug("===>lstasegurados:" + map);
		// Bug 27766
		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LISPIGNORADOS(SSEGURO);
		listValores.put("lstpignorados", (List) tratarRETURNyMENSAJES(request, map, false));
		logger.debug("===>map_lstpignorados:" + map);

		java.sql.Date FSINIES = this.stringToSqlDate(getCampoTextual(request, "FSINIES"));
		logger.debug("===>1:" + FSINIES);
		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_BENEFICIARIOS_NOMINALES(SSEGURO, FSINIES);
		listValores.put("lstbeneficiariosnominales", (List) tratarRETURNyMENSAJES(request, map, false));
		// logger.debug("===>2:"+map);
		// Fin Bug 27766

		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_ASEGINNOMINADO(NSINIES, NTRAMIT);
		listValores.put("lstaseginnominados", (List) tratarRETURNyMENSAJES(request, map, false));
		logger.debug("===>map_lstaseginnominados:" + map);

		map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_BENEFICIARIO_DESIGNADO(NSINIES, SSEGURO);
		logger.debug("+++beneficiario designado: " + map);
		listValores.put("lstbendesig", (List) tratarRETURNyMENSAJES(request, map, false));
		logger.debug(map);

		// Datos Tipo destinatari
//        map = 
//pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(10));
//        listValores.put("lsttipdest",(List)tratarRETURNyMENSAJES(request, map));

		BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");
		BigDecimal pcactivi = getCampoNumerico(request, "CACTIVI");
		BigDecimal pctramit = getCampoNumerico(request, "CTRAMIT");
		BigDecimal pccausin = getCampoNumerico(request, "CCAUSIN");
		BigDecimal pcmotsin = getCampoNumerico(request, "CMOTSIN");

		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LISTTIPDES(psproduc, pcactivi, pctramit,
				pccausin, pcmotsin, SSEGURO);
		logger.debug("--> destinatarios:" + map);

		listValores.put("lsttipdest", (List) tratarRETURNyMENSAJES(request, map));

		formdata.put("SPRODUC", psproduc);
		formdata.put("CACTIVI", pcactivi);
		formdata.put("CTRAMIT", pctramit);
		formdata.put("CCAUSIN", pccausin);
		formdata.put("CMOTSIN", pcmotsin);

		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCACTPROF();
		listValores.put("lstcactpro", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista pa�ses
		map = pac_axis_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTPAISES();
		logger.debug(map);
		listValores.put("lstPaises", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista rel con asegurado
		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPRELASE();
		logger.debug(map);
		listValores.put("lstRelAse", (List) tratarRETURNyMENSAJES(request, map, false));

		// Lista formas cobro prestacion
		// -- Bug 0017970 - 16/03/2011 - JMF
		// map =
		// pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPCAP();
		map = pac_axis_listvalores_sin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTTIPCAP(NSINIES);
		logger.debug(map);
		listValores.put("lstCobPres", (List) tratarRETURNyMENSAJES(request, map, false));

		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		logger.debug("++getParameter(\"SPERSON\")" + request.getParameter("SPERSON"));
		if (SPERSON == null && !isEmpty(request.getParameter("SPERSON"))) {
			SPERSON = new BigDecimal(request.getParameter("SPERSON"));
		}
		logger.debug("++SPERSON" + SPERSON);

		String CBANCAR = getCampoTextual(request, "CBANCAR");
		BigDecimal encrypt_CBANCAR = getCampoNumerico(request, "encrypt_CBANCAR");

		if (!isEmpty(encrypt_CBANCAR) && !isEmpty(CBANCAR)) {
			logger.debug("encrypt_CBANCAR --> " + encrypt_CBANCAR);
			logger.debug("CBANCAR --> " + CBANCAR);
			if (encrypt_CBANCAR.intValue() == 1) {
				CBANCAR = encryptedVal.decrypt(CBANCAR);
			}
		}

		logger.debug("CBANCAR --> " + CBANCAR);
		formdata.put("CBANCAR", CBANCAR);

		BigDecimal CAGENTE = usuario.getCagente();
		formdata.put("CAGENTE", CAGENTE);
		logger.debug("CAGENTE-- :" + CAGENTE);
		if (SPERSON != null) {
			map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			logger.debug(map);
			OBPERSONA = (Map) map.get("OBPERSONA");
			BigDecimal NANO_CHANGE = this.getCampoNumerico(request, "NANO_CHANGE");

			if (!isEmpty(OBPERSONA.get("IRPF"))) {
				List<Map> lstIrpfs = (List) OBPERSONA.get("IRPF");
				// Collections.sort(lstIrpfs);
				for (Map irpf : lstIrpfs) {
					Map OB_IAX_IRPF = (Map) irpf.get("OB_IAX_IRPF");

					if (isEmpty(NANO_CHANGE) && !isEmpty(formdata.get("NANO")) && !isEmpty(OB_IAX_IRPF.get("NANO"))) {
						BigDecimal formNANO = new BigDecimal(String.valueOf(formdata.get("NANO")));
						BigDecimal IRPFNANO = new BigDecimal(String.valueOf(OB_IAX_IRPF.get("NANO")));
						formdata.put("NANO", new BigDecimal(Math.max(formNANO.intValue(), IRPFNANO.intValue())));
					} else
						formdata.put("NANO", isEmpty(NANO_CHANGE) ? OB_IAX_IRPF.get("NANO") : NANO_CHANGE);
				}

			}
		}
		/*
		 * if (isEmpty(CAGENTE)) { CAGENTE = isEmpty(this.getCampoNumerico(request,
		 * "CAGENTE_VISIO")) ? this.getCampoNumerico(request, "CAGENTE"):
		 * this.getCampoNumerico(request, "CAGENTE_VISIO");
		 * logger.debug("agente vision :"+this.getCampoNumerico(request,
		 * "CAGENTE_VISIO")); logger.debug("CAGENTE :"+CAGENTE);
		 * logger.debug("request.getSession().getAttribute(\"CAGENTE\") :"+request.
		 * getSession().getAttribute("CAGENTE"));
		 * 
		 * 
		 * 
		 * if (isEmpty(request.getSession().getAttribute("CAGENTE")))
		 * request.getSession().setAttribute("CAGENTE",CAGENTE);
		 * 
		 * if (!isEmpty (request.getSession().getAttribute("CAGENTE")) && isEmpty
		 * (CAGENTE)){ CAGENTE = (BigDecimal)
		 * request.getSession().getAttribute("CAGENTE");
		 * formdata.put("CAGENTE",CAGENTE); } }
		 */
		String SNIP = this.getCampoTextual(request, "SNIP");
		if (!isEmpty(SPERSON)) {

			String PMODE = new String("POL");
			map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			Map OB_PERSONA = (Map) map.get("OBPERSONA");
			formdata.putAll(OB_PERSONA);

			String nomComplet = !isEmpty(OB_PERSONA.get("TNOMBRE")) ? (String) OB_PERSONA.get("TNOMBRE") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI1")) ? (String) OB_PERSONA.get("TAPELLI1") + " " : " ";
			nomComplet += !isEmpty(OB_PERSONA.get("TAPELLI2")) ? (String) OB_PERSONA.get("TAPELLI2") + " " : " ";

			logger.debug("++++NOMBRE: " + nomComplet);
			formdata.put("NOMBRE", nomComplet);

			if (isEmpty(SNIP))
				SNIP = (String) OB_PERSONA.get("SNIP");

			tratarRETURNyMENSAJES(request, map);

			String PORIGEN = this.getCampoTextual(request, "ORIGEN");
			if (isEmpty(PORIGEN))
				PORIGEN = "INT";

			// request.getSession().setAttribute("ORIGEN_"+SPERSON,PORIGEN);

			Map map2 = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS(SPERSON, CAGENTE, SNIP, PORIGEN, SSEGURO);
			logger.debug("ccc--->" + map2);
			// if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
			// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
			// Map OB_PERSONA = (Map)map.get("OBPERSONA");
			listValores.put("cuentasbancarias", tratarRETURNyMENSAJES(request, map2));
			// }

		}

		BigDecimal NTRAMIT9999 = getCampoNumerico(request, "NTRAMIT9999");
		Map m = pac_axis_sin_tramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(NSINIES, pctramit);
		logger.debug("---> personas rel del 9999:" + m);
		ArrayList perrel = (ArrayList) m.get("PLISTAPERSREL");
		logger.debug("---> lista personas rel del 9999:" + perrel);
		ArrayList perjudicados = new ArrayList();
		for (int i = 0; i < perrel.size(); i++) {
			HashMap perjudicado = new HashMap();
			perjudicado = (HashMap) ((HashMap) perrel.get(i)).get("OB_IAX_SIN_TRAMI_PERSONAREL");
			logger.debug("---> perjudicado:" + perjudicado);
			if (!isEmpty(perjudicado.get("CTIPREL")) && perjudicado.get("CTIPREL").equals(new BigDecimal(1))) {
				HashMap perjudicado2 = new HashMap();

				perjudicado2.put("SPERSON", perjudicado.get("SPERSON"));

				String nombre = "";
				if (!isEmpty(perjudicado.get("TNOMBRE")) && !perjudicado.get("TNOMBRE").equals(new String("null")))
					nombre += (String) perjudicado.get("TNOMBRE") + " ";
				if (!isEmpty(perjudicado.get("TNOMBRE2")) && !perjudicado.get("TNOMBRE2").equals(new String("null")))
					nombre += (String) perjudicado.get("TNOMBRE2") + " ";
				if (!isEmpty(perjudicado.get("TAPELLI1")) && !perjudicado.get("TAPELLI1").equals(new String("null")))
					nombre += (String) perjudicado.get("TAPELLI1") + " ";
				if (!isEmpty(perjudicado.get("TAPELLI2")) && !perjudicado.get("TAPELLI2").equals(new String("null")))
					nombre += (String) perjudicado.get("TAPELLI2");
				logger.debug("---> nombre:" + nombre);
				perjudicado2.put("TNOMBRE", nombre);
				perjudicados.add(perjudicado2);
			}
		}
		logger.debug("---> perjudicados:" + perjudicados);
		listValores.put("lstperjudicados", perjudicados);

		formdata.put("listvalores", listValores);
		formdata.put("CAGENTE", usuario.getCagente());

		formdata.put("SPERSON", SPERSON);
		BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");
		logger.debug("++++request.getParameter(\"SPROFES\")" + request.getParameter("SPROFES"));
		if (SPROFES == null && !isEmpty(request.getParameter("SPROFES"))) {
			SPROFES = new BigDecimal(request.getParameter("SPROFES"));
		}
		logger.debug("++SPROFES" + SPROFES);
		formdata.put("SPROFES", SPROFES);
		String NNUMIDE = getCampoTextual(request, "NNUMIDE");
		logger.debug("++NNUMIDE" + NNUMIDE);
		formdata.put("NNUMIDE", NNUMIDE);
		String TNOMBRE = getCampoTextual(request, "TNOMBRE");
		logger.debug("++TNOMBRE" + TNOMBRE);
		formdata.put("TNOMBRE", TNOMBRE);

		PAC_IAX_GESTIONES pac_axis_gestiones = new PAC_IAX_GESTIONES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		if (SPROFES != null) {
			Map m6 = pac_axis_gestiones.ejecutaPAC_IAX_GESTIONES__F_GET_LSTSEDES(SPROFES);
			logger.debug("ejecutaPAC_IAX_GESTIONES__F_GET_LSTSEDES devuelve:" + m6);
			List lstsedes = (List<Map>) tratarRETURNyMENSAJES(request, m6);
			formdata.put("lstsedes", lstsedes);
			selectFirstItem(lstsedes, "SPERSON", "SPERSED", formdata);
			BigDecimal pPSPERSED = getCampoNumerico(request, "SPERSED");
			logger.debug("++++spersed: " + pPSPERSED);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		// }
	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin011Action thisAction) {
		logger.debug("Axissin011Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal SPRODUC = getCampoNumerico(request, "SPRODUC");
			BigDecimal CACTIVI = getCampoNumerico(request, "CACTIVI");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			if (isEmpty(NTRAMIT))
				NTRAMIT = getCampoNumerico(request, "indexTramitacio");

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			formdata.put("CTIPDES", CTIPDES);

			String NSINIES = getCampoTextual(request, "NSINIES");
			String isNew = getCampoTextual(request, "isNew");
			logger.debug(isNew);

			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_parempresa = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("RETEN_PROVINCIAS",
					usuario.getCempres());
			logger.debug("RETEN_PROVINCIAS" + map_parempresa);
			BigDecimal RETEN_PROVINCIAS = (BigDecimal) map_parempresa.get("RETURN");
			formdata.put("RETEN_PROVINCIAS", RETEN_PROVINCIAS);

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARI(SSEGURO, NSINIES,
						NTRAMIT, CTIPDES, SPERSON);

				logger.debug(map);
				if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
					formdata.putAll((Map) map.get("RETURN"));
				}
			}

			logger.debug("--" + getCampoNumerico(request, "NTRAMIT"));
			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axispro004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_recargar(HttpServletRequest request, Axissin011Action thisAction) {

		logger.debug("Axissin011Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			/*
			 * BigDecimal CAGENTE_PROD = getCampoNumerico(request,"CAGE");
			 * logger.debug("CAGENTE_PROD ---> "+CAGENTE_PROD);
			 * formdata.put("CAG_AUX",CAGENTE_PROD);
			 */
			PAC_IAX_PARAM pac_iax_param = new PAC_IAX_PARAM(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map_parempresa = pac_iax_param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("RETEN_PROVINCIAS",
					usuario.getCempres());
			logger.debug("RETEN_PROVINCIAS" + map_parempresa);
			BigDecimal RETEN_PROVINCIAS = (BigDecimal) map_parempresa.get("RETURN");
			formdata.put("RETEN_PROVINCIAS", RETEN_PROVINCIAS);

			this.cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_traspasar(HttpServletRequest request, Axissin011Action thisAction) {

		logger.debug("Axissin011Service m_recargar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			BigDecimal CAGENTE_VISIO = getCampoNumerico(request, "CAGENTE_VISIO");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CAGENTE_PROD = getCampoNumerico(request, "CAGE");
			logger.debug("CAGENTE_PROD ---> " + CAGENTE_PROD);
			logger.debug("CAGENTE_VISIO ---> " + CAGENTE_VISIO);

			formdata.put("CAG_AUX", CAGENTE_PROD);

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map m = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_INSERTA_DETALLE_PER(SPERSON, CAGENTE_VISIO,
					CAGENTE_PROD);
			this.tratarRETURNyMENSAJES(request, m);
			logger.debug(m);

			this.cargarListas(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin011Action thisAction) {

		AESUtil encryptedVal = new AESUtil();
		logger.debug("Axissin011Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			logger.debug(SSEGURO);
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			logger.debug(NSINIES);
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			logger.debug(NTRAMIT);
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			logger.debug(CTIPDES);
			BigDecimal CPAGDES = getCampoNumerico(request, "CPAGDES");
			logger.debug(CPAGDES);
			BigDecimal CACTPRO = getCampoNumerico(request, "CACTPRO");
			logger.debug(CACTPRO);
			BigDecimal PASIGNA = getCampoNumerico(request, "PASIGNA");
			logger.debug(PASIGNA);
			BigDecimal CPAISRE = getCampoNumerico(request, "CPAISRE");
			logger.debug(CPAISRE);
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			logger.debug(SPERSON);
			BigDecimal SPROFES = getCampoNumerico(request, "SPROFES");
			logger.debug(SPROFES);
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			logger.debug(CTIPBAN);
			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			logger.debug(CAGENTE);
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			logger.debug(CBANCAR);
			BigDecimal encrypt_BANC = getCampoNumerico(request, "encrypt_BANC");
			logger.debug(encrypt_BANC);

			BigDecimal CPROVIN = getCampoNumerico(request, "CPROVIN");
			logger.debug(CPROVIN);

			if (!isEmpty(encrypt_BANC) && encrypt_BANC.intValue() == 1) {
				CBANCAR = encryptedVal.decrypt(CBANCAR);
				logger.debug(CBANCAR);
			}

			BigDecimal PCTIPCAP = getCampoNumerico(request, "PCTIPCAP");
			BigDecimal PCRELASE = getCampoNumerico(request, "PCRELASE");

			if (isEmpty(CPAGDES))
				CPAGDES = new BigDecimal(0);

			if (!this.isEmpty("CTIPDES") && CTIPDES.intValue() < 0)
				CTIPDES = null;

			/*
			 * if (isEmpty(request.getSession().getAttribute("CAGENTE")))
			 * request.getSession().setAttribute("CAGENTE",CAGENTE);
			 * 
			 * if (!isEmpty (request.getSession().getAttribute("CAGENTE")) && isEmpty
			 * (CAGENTE)){ CAGENTE = (BigDecimal)
			 * request.getSession().getAttribute("CAGENTE");
			 * formdata.put("CAGENTE",CAGENTE); }
			 */

			HashMap aviso = this.f_Get_Avisos(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, aviso);
			logger.debug("PLSTAVISOS" + aviso.get("PLSTAVISOS"));
			request.setAttribute("PLSTAVISOS", aviso.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {

				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMIDESTINATARI(SSEGURO, NSINIES,
						NTRAMIT, CTIPDES, CPAGDES, CACTPRO, PASIGNA, CPAISRE, SPERSON, CTIPBAN, CBANCAR, PCTIPCAP,
						PCRELASE, SPROFES, CPROVIN);

				logger.debug(map);

				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
					if (!isEmpty(CBANCAR)) {
						Map map2 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_CCC(SPERSON, CAGENTE, CBANCAR,
								CTIPBAN);
						logger.debug(map2);

						if (isEmpty(tratarRETURNyMENSAJES(request, map2))) {
							// si no nos devuelve el cnorban, quiere decir que no existe por lo tanto
							// a�adimos la cuenta

							Map map22 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_CCC(SPERSON, CAGENTE, null,
									CTIPBAN, CBANCAR, new BigDecimal(0));
							if (new BigDecimal(String.valueOf(tratarRETURNyMENSAJES(request, map22))).intValue() == 0) {
								request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
							}
						} else {
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
						}
					}
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ajax_actualiza_persona(HttpServletRequest request) {
		logger.debug("Axissin007Service m_ajax_actualiza_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");

			/*
			 * if (isEmpty(request.getSession().getAttribute("CAGENTE")))
			 * request.getSession().setAttribute("CAGENTE",CAGENTE);
			 * 
			 * if (!isEmpty (request.getSession().getAttribute("CAGENTE")) && isEmpty
			 * (CAGENTE)){ CAGENTE = (BigDecimal)
			 * request.getSession().getAttribute("CAGENTE");
			 * formdata.put("CAGENTE",CAGENTE); }
			 */
			logger.debug("act. person : " + CAGENTE);
			String PMODE = new String("POL");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			logger.debug("get PERSONA()" + map);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
				// ajax.rellenarPlAContenedorAjax((Map)map.get("OBPERSONA"));
				Map OB_PERSONA = (Map) map.get("OBPERSONA");
				logger.debug(OB_PERSONA);
				ajax.rellenarPlAContenedorAjax(map);

				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin007Service - m�todo m_ajax_actualiza_persona", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_direccion(HttpServletRequest request) {

		axissin017Service.m_ajax_direccion(request, null);
	}

	private void selectFirstItem(List llista, String atribute, String inputName, Map formdata) {
		Map map = null;
		if ((llista != null) && (llista.size() == 1)) {
			if (llista.get(0) != null) {
				map = (Map) llista.get(0);
				formdata.put(inputName, map.get(atribute));
			}
		}
	}
}
