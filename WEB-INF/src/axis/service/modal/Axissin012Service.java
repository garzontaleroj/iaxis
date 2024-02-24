//Revision:# sDZuFbkN3STgkJ/TTTPxlQ== #
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

import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_AUT;
import axis.jdbc.PAC_IAX_LISTVALORES_SIN;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_REDCOMERCIAL;
import axis.jdbc.PAC_IAX_SINIESTROS;
import axis.jdbc.PAC_IAX_SIN_TRAMITE;
import axis.mvc.control.modal.Axissin012Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AjaxContainerService;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

public class Axissin012Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * M�todo que carga los datos de administraci�n del producto
	 * 
	 * @param request
	 * @param thisAction
	 * @throws Exception
	 */
	private void cargarListas(HttpServletRequest request) throws Exception {
		AESUtil encryptedVal = new AESUtil();
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map listValores = new HashMap();
		// Carga de las PAC_IAX PL/SQL
		PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_AUT pac_axis_listValores_AUT = new PAC_IAX_LISTVALORES_AUT(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES_SIN pac_axis_listValores_SIN = new PAC_IAX_LISTVALORES_SIN(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SINIESTROS PAC_IAX_SINIESTROS = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_SIN_TRAMITE pac_axis_sin_tramite = new PAC_IAX_SIN_TRAMITE(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_REDCOMERCIAL pac_iax_redcomercial = new PAC_IAX_REDCOMERCIAL(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
		PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
		BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
		String NSINIES = getCampoTextual(request, "NSINIES");

		BigDecimal encrypt_CBANCAR = getCampoNumerico(request, "encrypt_CBANCAR");
		String CBANCAR = getCampoTextual(request, "CBANCAR");

		if (!isEmpty(CBANCAR) && !isEmpty(encrypt_CBANCAR) && encrypt_CBANCAR.intValue() == 1) {
			formdata.put("CBANCAR", encryptedVal.decrypt(CBANCAR));
		}

		Map map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCTIPPAG();
		listValores.put("lstctippag", (List) tratarRETURNyMENSAJES(request, map, false));

		BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
		if (isEmpty(CTIPPAG)) {
			CTIPPAG = (BigDecimal) formdata.get("CTIPPAG");
		}

		BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");

		if (isEmpty(CTIPPAG)) {
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG(psproduc);
			listValores.put("lstcconpag", (List) tratarRETURNyMENSAJES(request, map, false));
		} else {
			map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(CTIPPAG, psproduc);
			listValores.put("lstcconpag", (List) tratarRETURNyMENSAJES(request, map, false));
		}

		/*
		 * map =
		 * pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCAUIND(
		 * CTIPPAG);
		 */
		listValores.put("lstccauind", (List) tratarRETURNyMENSAJES(request, map, false));

		map = pac_axis_listValores_SIN.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCFORPAG();
		listValores.put("lstcforpag", (List) tratarRETURNyMENSAJES(request, map, false));

		map = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIDESTINATARIS(SSEGURO, NSINIES, NTRAMIT);
		listValores.put("lstdestinataris", (List) tratarRETURNyMENSAJES(request, map, false));

		//
		BigDecimal cagentesini = (BigDecimal) getCampoNumerico(request, "CAGENTESINI");
		BigDecimal spersonage = null;
		if (!isEmpty(cagentesini)) {
			Map m = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_DATOSAGENTE(cagentesini);
			HashMap agente = (HashMap) m.get("AGENTE");

			if (!isEmpty(agente)) {
				spersonage = (BigDecimal) agente.get("SPERSON");
			}
		}
		HashMap MEDIADOR = new HashMap();
		MEDIADOR.put("CMEDIADOR", cagentesini);
		MEDIADOR.put("SPERSON", spersonage);
		MEDIADOR.put("TMEDIADOR", getCampoTextual(request, "TAGENTESINI"));
		ArrayList MEDIADORES = new ArrayList();
		MEDIADORES.add(MEDIADOR);
		listValores.put("lstmediadores", MEDIADORES);

		BigDecimal NTRAMIT9999 = getCampoNumerico(request, "NTRAMIT9999");
		Map m = pac_axis_sin_tramite.ejecutaPAC_IAX_SIN_TRAMITE__F_GET_LISTA_PERSONASREL(NSINIES, NTRAMIT);
		ArrayList perrel = (ArrayList) m.get("PLISTAPERSREL");
		ArrayList perjudicados = new ArrayList();
		for (int i = 0; i < perrel.size(); i++) {
			HashMap perjudicado = new HashMap();
			perjudicado = (HashMap) ((HashMap) perrel.get(i)).get("OB_IAX_SIN_TRAMI_PERSONAREL");
			if (!isEmpty(perjudicado.get("CTIPREL")) && perjudicado.get("CTIPREL").equals(new BigDecimal(1))) {
				HashMap perjudicado2 = new HashMap();

				perjudicado2.put("NPERSREL", perjudicado.get("NPERSREL"));

				String nombre = "";
				if (!isEmpty(perjudicado.get("TNOMBRE")) && !perjudicado.get("TNOMBRE").equals(new String("null")))
					nombre += (String) perjudicado.get("TNOMBRE") + " ";
				if (!isEmpty(perjudicado.get("TNOMBRE2")) && !perjudicado.get("TNOMBRE2").equals(new String("null")))
					nombre += (String) perjudicado.get("TNOMBRE2") + " ";
				if (!isEmpty(perjudicado.get("TAPELLI1")) && !perjudicado.get("TAPELLI1").equals(new String("null")))
					nombre += (String) perjudicado.get("TAPELLI1") + " ";
				if (!isEmpty(perjudicado.get("TAPELLI2")) && !perjudicado.get("TAPELLI2").equals(new String("null")))
					nombre += (String) perjudicado.get("TAPELLI2");
				perjudicado2.put("TNOMBRE", nombre);
				perjudicados.add(perjudicado2);
			}
		}
		listValores.put("lstperjudicados", perjudicados);

		BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
		// BigDecimal SPERSONMED = ( isEmpty(this.getCampoNumerico(request,
		// "SPERSONMED")))?spersonage:this.getCampoNumerico(request, "SPERSONMED");

		BigDecimal CMEDIADOR = getCampoNumerico(request, "MEDIADOR");
		BigDecimal SPERSONMED = null;
		if (!isEmpty(CMEDIADOR))
			SPERSONMED = (isEmpty(this.getCampoNumerico(request, "SPERSONMED"))) ? spersonage
					: this.getCampoNumerico(request, "SPERSONMED");
		else
			SPERSONMED = this.getCampoNumerico(request, "SPERSONMED");

		BigDecimal CAGENTE = usuario.getCagente();
		formdata.put("CAGENTE", CAGENTE);
		String SNIP = this.getCampoTextual(request, "SNIP");
		if (!isEmpty(SPERSON) && !isEmpty(CAGENTE) && isEmpty(SPERSONMED)) {

			/*
			 * map = new
			 * PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN
			 * )).ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			 */

			String PMODE = new String("POL");
			map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSON, CAGENTE, PMODE);

			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			String tipo = "INT";

			Map map2 = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS(SPERSON, CAGENTE, SNIP, tipo, SSEGURO);
			/* listValores.put("cuentasbancarias", tratarRETURNyMENSAJES(request, map2)); */
			listValores.put("cuentasbancarias", map2.get("RETURN"));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSON);
			listValores.put("domicilios", map.get("RETURN"));

		} else if (!isEmpty(SPERSONMED) && !isEmpty(CAGENTE)) {

			String PMODE = new String("POL");
			map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA_AGENTE(SPERSONMED, CAGENTE, PMODE);
			BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			String tipo = "INT";
			HashMap persona = (HashMap) map.get("OBPERSONA");
			String snipmed = (String) persona.get("SNIP");
			Map map2 = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_CCC_HOST_AXIS(SPERSONMED, CAGENTE, snipmed, tipo, SSEGURO);
			/* listValores.put("cuentasbancarias", tratarRETURNyMENSAJES(request, map2)); */
			listValores.put("cuentasbancarias", map2.get("RETURN"));

			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTDOMIPERSON(SPERSONMED);
			listValores.put("domicilios", map.get("RETURN"));

		}
		BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTBANCOS_PAGOS(null, null, CFORPAG);
		listValores.put("lstbancos", map.get("RETURN"));

		if (CFORPAG != null && CFORPAG.equals(new BigDecimal(34))) {
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MUNICIPIOS_PAGOS();
			listValores.put("lstciudades", map.get("RETURN"));
		}

		formdata.put("CAGENTE", usuario.getCagente());

		BigDecimal COFICI = null;
		if (!isEmpty(request.getParameter("COFICI"))) {
			COFICI = new BigDecimal(request.getParameter("COFICI"));
			formdata.put("COFICIN", COFICI);
		}

		String TOFICI = getCampoTextual(request, "TOFICI");
		if (TOFICI == null) {
			TOFICI = getCampoTextual(request, "pTOFICI");
			formdata.put("TOFICI", TOFICI);
		}

		map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800112));
		listValores.put("lstctributa", map.get("RETURN"));

		java.sql.Date d = new java.sql.Date(new java.util.Date().getTime());
		if (!isEmpty(usuario.getCagente())) {
			BigDecimal tipAgente = new BigDecimal(2);
			List listaTipoAgentes = new ArrayList();
			map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(usuario.getCempres(), d, null, null,
					tipAgente, BigDecimal.ONE, null, null, null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null);
			listaTipoAgentes = (List) map.get("RETURN");
			tipAgente = new BigDecimal(3);
			map = pac_iax_redcomercial.ejecutaPAC_IAX_REDCOMERCIAL__F_GET_AGENTES(usuario.getCempres(), d, null, null,
					tipAgente, BigDecimal.ONE, null, null, null, null, null, null, null, null, null, null, null, null,
					null, null, null, null, null, null, null, null, null);
			listaTipoAgentes.addAll((List) map.get("RETURN"));
			listValores.put("listaTipoAgentes", listaTipoAgentes);
		}

		BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
		map = PAC_IAX_SINIESTROS.ejecutaPAC_IAX_SINIESTROS__F_GET_OBJ_SINTRAMIPAGORECOB(SSEGURO, NSINIES, NTRAMIT,
				CTIPPAG, SIDEPAG);
		if (!isEmpty((Map) tratarRETURNyMENSAJES(request, map))) {
			formdata.put("PAGO", (Map) map.get("RETURN"));
		}
		BigDecimal CAGENTE_SELEC = getCampoNumerico(request, "CAGENTE_SELEC");
		formdata.put("CAGENTE_SELEC", CAGENTE_SELEC);

		formdata.put("listvalores", listValores);

	}

	/**
	 * M�todo que se llama al inicio de este flujo. Realiza la carga inicial de los
	 * datos de los combos.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, Axissin012Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			BigDecimal indexTramitacio = getCampoNumerico(request, "indexTramitacio");
			String NSINIES = getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");

			BigDecimal ISINRET = getCampoNumerico(request, "ISINRET");
			String SECCION = getCampoTextual(request, "SECCION");
			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			this.formattingNumericValues(request);

			String isNew = getCampoTextual(request, "isNew");

			if (!isEmpty(isNew) && !isNew.equals("yes")) {
				Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_PAGRECOB(NSINIES, NTRAMIT, SIDEPAG);

				HashMap pago = (HashMap) map.get("OB_PAGRECOB");

				if (!isEmpty((Map) map.get("OB_PAGRECOB"))) {
					formdata.putAll((Map) map.get("OB_PAGRECOB"));

					formdata.put("MEDIADOR", pago.get("CAGENTE"));
					formdata.put("CPERJUDICADO", pago.get("NPERSREL"));

					formdata.put("COFICIN", pago.get("COFICI"));
					formdata.put("CBANCAR", pago.get("CBANCAR"));

					Map mapa_dest = (Map) ((Map) map.get("OB_PAGRECOB")).get("DESTINATARI");
					BigDecimal isinret = (BigDecimal) ((Map) map.get("OB_PAGRECOB")).get("ISINRET");
					Map mapa_persona = (Map) mapa_dest.get("PERSONA");

					BigDecimal SPERSON = (BigDecimal) mapa_persona.get("SPERSON");

					formdata.put("SPERSON", SPERSON);
					formdata.put("ISINRET", isinret);

				}
			}

			formdata.put("NSINIES", NSINIES);
			formdata.put("NTRAMIT", NTRAMIT);
			formdata.put("SIDEPAG", SIDEPAG);
			formdata.put("indexTramitacio", indexTramitacio);
			formdata.put("isNew", isNew);
			formdata.put("SECCION", SECCION);

			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");
			BigDecimal pcactivi = getCampoNumerico(request, "CACTIVI");
			BigDecimal pctramit = getCampoNumerico(request, "CTRAMIT");
			BigDecimal pccausin = getCampoNumerico(request, "CCAUSIN");
			BigDecimal pcmotsin = getCampoNumerico(request, "CMOTSIN");

			formdata.put("SPRODUC", psproduc);
			formdata.put("CACTIVI", pcactivi);
			formdata.put("CTRAMIT", pctramit);
			formdata.put("CCAUSIN", pccausin);
			formdata.put("CMOTSIN", pcmotsin);

			formdata.put("CAGENTESINI", getCampoTextual(request, "CAGENTESINI"));
			formdata.put("TAGENTESINI", getCampoTextual(request, "TAGENTESINI"));
			formdata.put("NTRAMIT9999", getCampoNumerico(request, "NTRAMIT9999"));

			this.cargarListas(request);

		} catch (Exception e) {
			logger.error("Error en el servicio Axissin012Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_guardar(HttpServletRequest request, Axissin012Action thisAction) {

		AESUtil encryptedVal = new AESUtil();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			PAC_IAX_SINIESTROS pac_axis_siniestros = new PAC_IAX_SINIESTROS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			request.setAttribute("OK", "!OK");
			BigDecimal SSEGURO = this.getCampoNumerico(request, "SSEGURO");
			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal NTRAMIT = getCampoNumerico(request, "NTRAMIT");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			BigDecimal SIDEPAG = getCampoNumerico(request, "SIDEPAG");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal CTIPBAN = getCampoNumerico(request, "CTIPBAN");
			String CBANCAR = getCampoTextual(request, "CBANCAR");
			BigDecimal CBANCO = getCampoNumerico(request, "CBANCO");
			BigDecimal COFICI = getCampoNumerico(request, "COFICI");
			BigDecimal CCIUDAD = getCampoNumerico(request, "CCIUDAD");
			BigDecimal encrypt_BANC = getCampoNumerico(request, "encrypt_BANC");

			if (!isEmpty(encrypt_BANC) && encrypt_BANC.intValue() == 1) {
				CBANCAR = encryptedVal.decrypt(CBANCAR);
			}

			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal CCONPAG = getCampoNumerico(request, "CCONPAG");
			BigDecimal CCAUIND = getCampoNumerico(request, "CCAUIND");
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			BigDecimal ISINRET = getCampoNumerico(request, "ISINRET");
			BigDecimal ICONRET = getCampoNumerico(request, "ICONRET");
			BigDecimal IRESRED = getCampoNumerico(request, "IRESRED");
			BigDecimal IRESRCM = getCampoNumerico(request, "IRESRCM");
			BigDecimal ISINRETPAG = getCampoNumerico(request, "ISINRETPAG");
			BigDecimal IFRANQ = getCampoNumerico(request, "IFRANQ");
			BigDecimal ISUPLID = getCampoNumerico(request, "ISUPLID");
			BigDecimal IIVA = getCampoNumerico(request, "IIVA");
			BigDecimal PRETENC = getCampoNumerico(request, "PRETENC");
			BigDecimal ICONRETP = getCampoNumerico(request, "ICONRETP");
			BigDecimal IRETENCPAG = getCampoNumerico(request, "IRETENCPAG");
			BigDecimal IIVAPAG = getCampoNumerico(request, "IIVAPAG");
			BigDecimal ISUPLIDPAG = getCampoNumerico(request, "ISUPLIDPAG");
			BigDecimal IFRANQPAG = getCampoNumerico(request, "IFRANQPAG");
			String NFACREF = getCampoTextual(request, "NFACREF");
			java.sql.Date FORDPAG = this.stringToSqlDate(getCampoTextual(request, "FORDPAG"));
			java.sql.Date FCAMBIO = this.stringToSqlDate(getCampoTextual(request, "FCAMBIO"));
			java.sql.Date FFACREF = this.stringToSqlDate(getCampoTextual(request, "FFACREF"));
			String CMONRES = this.getCampoTextual(request, "CMONRES");
			String CMONPAG = this.getCampoTextual(request, "CMONPAG");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE");
			BigDecimal CULTPAG = getCampoNumerico(request, "CULTPAG");

			if (CULTPAG == null) {
				CULTPAG = new BigDecimal(0);
			}

			BigDecimal CMEDIADOR = getCampoNumerico(request, "MEDIADOR");
			BigDecimal CPERJUDICADO = getCampoNumerico(request, "CPERJUDICADO");
			BigDecimal CDOMICI = getCampoNumerico(request, "CDOMICI");
			BigDecimal CTRIBUTACION = getCampoNumerico(request, "CTRIBUTACION");

			// bug 0024690 de ASN
			BigDecimal IRETENC = getCampoNumerico(request, "IRETENC");

			BigDecimal CAGENTE_SELEC = getCampoNumerico(request, "CAGENTE_SELEC");

			String NCHEQUE = getCampoTextual(request, "NCHEQUE");

			BigDecimal SPERSON_PRESENTADOR = this.getCampoNumerico(request, "SPERSON_REL");
			String TOBSERVA = getCampoTextual(request, "TOBSERVA");

			Map map = pac_axis_siniestros.ejecutaPAC_IAX_SINIESTROS__F_SET_OBJ_SINTRAMI_PAGO_RECOB(SSEGURO, SIDEPAG,
					NSINIES, NTRAMIT, CTIPDES, CTIPPAG, CCONPAG, CCAUIND, CFORPAG, FORDPAG, CTIPBAN, CBANCAR, CMONRES,
					ISINRET, ICONRET, PRETENC, IRETENC, IIVA, ISUPLID, IFRANQ, IRESRED, IRESRCM, CMONPAG, ISINRETPAG,
					ICONRETP, IRETENCPAG, IIVAPAG, ISUPLIDPAG, IFRANQPAG, FCAMBIO, NFACREF, FFACREF, SPERSON, null,
					CULTPAG, NCHEQUE, null, null, null, null, null, null, CMEDIADOR == null ? CAGENTE_SELEC : CMEDIADOR,
					CPERJUDICADO, CDOMICI, CTRIBUTACION, CBANCO, COFICI, CCIUDAD, SPERSON_PRESENTADOR, TOBSERVA, null,
					null, null, null, null, null);

			if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
				String isnew = getCampoTextual(request, "isNew");
				BigDecimal sidepagout = (BigDecimal) map.get("PSIDEPAGOUT");
				request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
				request.setAttribute("PSIDEPAGOUT", sidepagout);
				request.setAttribute("isNew", isnew);

				if (!isEmpty(CBANCAR)) {

					Map map2 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_EXISTE_CCC(SPERSON, CAGENTE, CBANCAR,
							CTIPBAN);

					if (isEmpty(tratarRETURNyMENSAJES(request, map2))) {
						// si no nos devuelve el cnorban, quiere decir que no existe por lo tanto
						// a�adimos la cuenta

						Map map22 = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_SET_CCC(SPERSON, CAGENTE, null, CTIPBAN,
								CBANCAR, new BigDecimal(0));
						if (new BigDecimal(String.valueOf(tratarRETURNyMENSAJES(request, map22))).intValue() == 0) {
							isnew = getCampoTextual(request, "isNew");
							sidepagout = (BigDecimal) map.get("PSIDEPAGOUT");
							request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
							request.setAttribute("PSIDEPAGOUT", sidepagout);
							request.setAttribute("isNew", isnew);
						}
					} else {
						isnew = getCampoTextual(request, "isNew");
						sidepagout = (BigDecimal) map.get("PSIDEPAGOUT");
						request.setAttribute("OK", "OK"); // guardamos, etc y no ha habido error
						request.setAttribute("PSIDEPAGOUT", sidepagout);
						request.setAttribute("isNew", isnew);
					}

				}

			}

		} catch (Exception e) {
			logger.error("Error en el servicio AXISSIN012Service - m�todo m_guardar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_recargar(HttpServletRequest request, Axissin012Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			this.cargarListas(request);
			this.formattingNumericValues(request);
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin011Service - m�todo m_recargar", e);
			thisAction.guardarMensaje(request, "1000052", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public void m_ajax_actualizar_combos(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {

			BigDecimal CTIPPAG = getCampoNumerico(request, "CTIPPAG");
			BigDecimal psproduc = getCampoNumerico(request, "SPRODUC");

			PAC_IAX_LISTVALORES_SIN pacIaxListValoresSin = new PAC_IAX_LISTVALORES_SIN(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map cconpag = pacIaxListValoresSin.ejecutaPAC_IAX_LISTVALORES_SIN__F_GET_LSTCCONPAG_DEP(CTIPPAG, psproduc);
			ArrayList contenido = (ArrayList) tratarRETURNyMENSAJES(request, cconpag);
			ajax.rellenarPlAContenedorAjax(cconpag);
			ajax.guardarContenidoFinalAContenedorAjax(contenido);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea021Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_asegurado", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public void m_ajax_actualizar_aviso(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {

			String NSINIES = this.getCampoTextual(request, "NSINIES");
			BigDecimal CTIPDES = getCampoNumerico(request, "CTIPDES");
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON");
			BigDecimal CCONPAG = getCampoNumerico(request, "CCONPAG");

			PAC_IAX_AVISOS pac_axis_avisos = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map map = new HashMap();
			Map response = new HashMap();

			map = pac_axis_avisos.ejecutaPAC_IAX_AVISOS__F_AVISO_PAGO_TERCERO(NSINIES, CTIPDES, SPERSON, CCONPAG,
					new BigDecimal(8));
			BigDecimal contenido = (BigDecimal) tratarRETURNyMENSAJES(request, map);
			response.put("RETORNO", contenido);
			ajax.rellenarPlAContenedorAjax(map);
			ajax.guardarContenidoFinalAContenedorAjax(response);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisrea021Service - m�todo m_selected_asegurado", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.getSession().setAttribute("axisctr_asegurado", ajax.getAjaxContainer());
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}

	}

	public void m_ajax_buscar_oficina(HttpServletRequest request) {
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			ajax.guardarContenidoFinalAContenedorAjax(this.buscaOficina(request));
		} catch (Exception e) {
			logger.error("Error en el servicio Axissin012Service - m�todo m_ajax_buscar_oficina", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	private List buscaOficina(HttpServletRequest request) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		AjaxContainerService ajax = new AjaxContainerService();

		PAC_IAX_SINIESTROS pac_iax_siniestros = new PAC_IAX_SINIESTROS(
				(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

		BigDecimal pCBANCO = getCampoNumerico(request, "CBANCO");
		BigDecimal pCOFICI = getCampoNumerico(request, "COFICI");

		Map map = pac_iax_siniestros.ejecutaPAC_IAX_SINIESTROS__F_GET_LSTOFICINAS(pCBANCO, pCOFICI, null);

		List listaOficina = (List) ajax.rellenarPlAContenedorAjax(map);

		return listaOficina;
	}

	public void m_ajax_actualizar_presentador(HttpServletRequest request, Axissin012Action thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON_REL");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1");
			CAGENTE = isEmpty(CAGENTE) ? usuario.getCagente() : CAGENTE;
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
			BigDecimal RETURN = (BigDecimal) ajax.rellenarPlAContenedorAjax(map);

			if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {

				Map OB_PERSONA = (Map) map.get("OBPERSONA");

				ajax.rellenarPlAContenedorAjax(map);
				ajax.guardarContenidoFinalAContenedorAjax(OB_PERSONA);
			}

		} catch (Exception e) {
			logger.error("Axissin012Service m_ajax_actualizar_presentador - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}
}
