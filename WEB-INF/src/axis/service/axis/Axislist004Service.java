
package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

/**
 * NOMBRE: Axislist004Service.java
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 23.5.2013 ECG Version inicial
 */
public class Axislist004Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	/**
	 * Para comunicaciones AJAX/JSON
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_miajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist004Service m_miajaxjson");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			Map map = new HashMap();
			String QUE = this.getCampoTextual(request, "QUE");
			map.put("QUE", QUE);
			if (QUE.equals("TSLITERA")) {
				String SLITERA = this.getCampoTextual(request, "SLITERA");
				map.put("TSLITERA", Traductor.getInstance().s_traducir(usuario.getLocale(), SLITERA));
				logger.debug("map:" + map);
			}
			if (QUE.equals("newTSLITERA")) {
				String newSLITERA = this.getCampoTextual(request, "newSLITERA");
				map.put("newTSLITERA", Traductor.getInstance().s_traducir(usuario.getLocale(), newSLITERA));
				logger.debug("map:" + map);
			}
			/*
			 * Object RETURN=this.tratarRETURNyMENSAJES(request, map); if
			 * (RETURN!=null&&RETURN.equals(BigDecimal.ZERO)) {
			 * thisAction.guardarMensaje(request, "111313", new Object[] { },
			 * Constantes.MENSAJE_INFO); }
			 */
			request.setAttribute(Constantes.AJAXCONTAINER, map);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist004Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", "" + usuario.getCempres());
			else
				formdata.put("CEMPRES", "");
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			if (isEmpty(SPRODUC))
				formdata.put("SPRODUC", "0");
			else
				formdata.put("SPRODUC", "" + SPRODUC);

			String TEVENTO = (String) AbstractDispatchAction.topPila(request, "TEVENTO");

			if (isEmpty(TEVENTO)) {
				formdata.put("TEVENTO", "GENERAL"); // CMODO
			} else {
				formdata.put("TEVENTO", TEVENTO.toUpperCase());
			}

			String CCFGFORM = (String) AbstractDispatchAction.topPila(request, "CCFGFORM");

			if (isEmpty(CCFGFORM)) {
				formdata.put("CCFGFORM", "GENERAL");
			} else {
				formdata.put("CCFGFORM", CCFGFORM.toUpperCase());
			}

			formdata.put("CFORM", "AXISLIST003");
			formdata.put("CPATH", "*");
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist004Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Preparamos la pantalla para un registro nuevo. Algunos datos podemos poner
	 * como por defecto
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_nuevo(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist004Service m_nuevo");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal CEMPRES = isEmpty((String) AbstractDispatchAction.topPila(request, "CEMPRES")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "CEMPRES"));
			if (isEmpty(CEMPRES))
				formdata.put("CEMPRES", "" + usuario.getCempres());
			else
				formdata.put("CEMPRES", "");
			BigDecimal SPRODUC = isEmpty((String) AbstractDispatchAction.topPila(request, "SPRODUC")) ? null
					: new BigDecimal((String) AbstractDispatchAction.topPila(request, "SPRODUC"));
			if (isEmpty(SPRODUC))
				formdata.put("SPRODUC", "0");
			else
				formdata.put("SPRODUC", "" + SPRODUC);

			String TEVENTO = (String) AbstractDispatchAction.topPila(request, "TEVENTO");

			if (isEmpty(TEVENTO)) {
				formdata.put("TEVENTO", "GENERAL"); // CMODO
			} else {
				formdata.put("TEVENTO", TEVENTO.toUpperCase());
			}

			String CCFGFORM = (String) AbstractDispatchAction.topPila(request, "CCFGFORM");

			if (isEmpty(CCFGFORM)) {
				formdata.put("CCFGFORM", "GENERAL");
			} else {
				formdata.put("CCFGFORM", CCFGFORM.toUpperCase());
			}

			formdata.put("CFORM", "AXISLIST003");
			formdata.put("CPATH", "*");
			formdata.put("SLITERA", "999");
			// formdata.put("TEVENTO", null);
			formdata.put("CTIPO", "1"); // JAsper
			// formdata.put("CCFGFORM", null);

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist004Service - m�todo m_nuevo", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Recuperamos un registro a base de un parametro IDENTIFICADOR (ver
	 * axislist005.jsp como se monta al IDENTIFICADOR)
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_recuperar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist004Service m_recuperar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			formdata.put("mimodo", "MODIFICACION");
			// IDENTIFICADOR: CCODPLAN | CEMPRES | CFORM | CMAP | TEVENTO | SPRODUC |
			// CCFGFORM | CTIPO
			String IDENTIFICADOR = this.getCampoTextual(request, "IDENTIFICADOR");
			logger.debug("El identificador recuperado es " + IDENTIFICADOR);
			BigDecimal CEMPRES = null;
			String CFORM = null;
			String CMAP = null;
			String TEVENTO = null;
			BigDecimal SPRODUC = null;
			String CCFGFORM = null;
			String CCODPLAN = null;
			BigDecimal CTIPO = null;
			if (!this.isEmpty(IDENTIFICADOR)) { // ver axislist005.jsp como se monta al IDENTIFICADOR
				//// IDENTIFICADOR: CCODPLAN | CEMPRES | CFORM | CMAP | TEVENTO | SPRODUC |
				//// CCFGFORM | ctipo

				logger.debug("IDENTIFICADOR not empty:" + IDENTIFICADOR + " asi que lo parseamos");
				String[] IDENTIFICADORs = StringUtils.splitPreserveAllTokens(IDENTIFICADOR, '|');
				CCODPLAN = IDENTIFICADORs[0];
				CEMPRES = new BigDecimal(IDENTIFICADORs[1]);
				CFORM = IDENTIFICADORs[2];
				CMAP = IDENTIFICADORs[3];
				TEVENTO = IDENTIFICADORs[4];
				SPRODUC = new BigDecimal(IDENTIFICADORs[5]);
				CCFGFORM = IDENTIFICADORs[6];
				if (IDENTIFICADORs[7] != null) {
					CTIPO = new BigDecimal(IDENTIFICADORs[7]);
				}
			}

			// TODO: en vez de SELECTS, han de ser PAC_IAX.....

			// cabecera del reporte
			/*
			 * Object[] objectslistaInformes= { CEMPRES, CFORM, CMAP, TEVENTO, SPRODUC };
			 * String
			 * sql="select * from CFG_LANZAR_INFORMES where CEMPRES=? and CFORM=? and CMAP=? and TEVENTO=? and SPRODUC=?"
			 * ; ArrayList<HashMap> listaInformes=new
			 * AccesoSQL(null).executeQuery((java.sql.Connection)request.getAttribute(
			 * Constantes.DB01CONN), sql, objectslistaInformes);
			 */

			try {
				Map listaInformes = new PAC_IAX_INFORMES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_CFGINFORME(CEMPRES, CFORM, TEVENTO, SPRODUC, CMAP);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, listaInformes))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, listaInformes)).intValue() == 0) {
					logger.debug("map informes  " + listaInformes);
					ArrayList dev = (ArrayList) listaInformes.get("PCURCONFIGSINF");
					if (!dev.isEmpty()) {
						logger.debug("Abns de convertir" + dev.get(0));
						formdata.putAll((Map) dev.get(0));
						logger.debug("Despres de convertir");
					}
				}

				// datos del correspondiente detplantilla
				logger.debug("******* Detalle de la plantilla asciada al report ");
				Map listadetplantillas = new HashMap();
				listadetplantillas = new PAC_IAX_INFORMES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_DETLANZARINFORMES(CEMPRES, CMAP, null, null, null);
				// ejecutaPAC_IAX_INFORMES__F_GET_DETPLANTILLAS(CMAP,null, null, null, null);
				this.tratarRETURNyMENSAJES(request, listadetplantillas);
				logger.debug("map detplantilla  " + listadetplantillas);
				ArrayList det = (ArrayList) listadetplantillas.get("ODETPLANTILLAS");
				if (!det.isEmpty()) {
					logger.debug("map detplantilla arraylist  " + det.get(0));
					request.setAttribute("LISTAPLANTILLAS", det);
				}

				// datos de los parametros del report
				logger.debug("******* Lista de parametros del report");
				Map listaParams = new HashMap();
				listaParams = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_PARAMS_INFORME(CEMPRES, CFORM, TEVENTO, SPRODUC, CMAP,
								CCFGFORM);
				logger.debug("map parametros  " + listaParams);
				ArrayList detparametros = (ArrayList) listaParams.get("OPARAMS");
				if (!detparametros.isEmpty()) {
					logger.debug("DETPARAMETROS  " + detparametros);
					request.setAttribute("INFORMEPARAMS", detparametros);
				}
				logger.debug("Final de la obtencion de los parametros!!!!!!!!!!");

				// datos del correspondiente detplantilla
				/*
				 * Object[] objectsdetplantillas= { CMAP }; String
				 * sql="select * from detplantillas where CCODPLAN=? "; ArrayList<HashMap>
				 * listadetplantillas=new
				 * AccesoSQL(null).executeQuery((java.sql.Connection)request.getAttribute(
				 * Constantes.DB01CONN), sql, objectsdetplantillas);
				 * request.setAttribute("LISTAPLANTILLAS", listadetplantillas);
				 */

				// parametros del reporte
				/*
				 * Object[] objectslistaParams= { CEMPRES, CFORM, CMAP, TEVENTO, SPRODUC,
				 * CCFGFORM }; //"and TPARAM=?\n" + String
				 * sql="select cfg_lanzar_informes_params.*, LITERAL(cfg_lanzar_informes_params.SLITERA) as TLITERA from cfg_lanzar_informes_params where 1=1 \n"
				 * +"and cfg_lanzar_informes_params.CEMPRES=?\n"
				 * +"and cfg_lanzar_informes_params.CFORM=?\n"
				 * +"and cfg_lanzar_informes_params.CMAP=?\n"
				 * +"and cfg_lanzar_informes_params.TEVENTO=?\n"
				 * +"and cfg_lanzar_informes_params.SPRODUC=?\n"
				 * +"and cfg_lanzar_informes_params.CCFGFORM=?\n"
				 * +"order by cfg_lanzar_informes_params.NORDER\n"; ArrayList<HashMap>
				 * listaParams=new
				 * AccesoSQL(null).executeQuery((java.sql.Connection)request.getAttribute(
				 * Constantes.DB01CONN), sql, objectslistaParams);
				 * logger.debug("map parametros  " + listaParams);
				 * request.setAttribute("INFORMEPARAMS", listaParams);
				 */

			} catch (Exception e) {
				logger.error("Error en el servicio Axislist004Service - m�todo m_recuperar", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist004Service - m�todo m_recuperar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Recuperamos datos para completar la pantalla - es decir nodetalles del
	 * registro, sino contenido de los combos
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist004Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			// alimentar CEMPRES
			Map mapEMPRESAS = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("------- mapEMPRESAS:" + mapEMPRESAS);
			request.setAttribute("EMPRESAS", (List) tratarRETURNyMENSAJES(request, mapEMPRESAS, false));

			// alimentar CIDIOMA
			Map mapIDIOMAS = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTIDIOMAS();
			logger.debug("------- mapIDIOMAS:" + mapIDIOMAS);
			request.setAttribute("IDIOMAS", (List) tratarRETURNyMENSAJES(request, mapIDIOMAS, false));

			// TODO: en vez de SELECTS, han de ser PAC_IAX.....

			// alimentar TEVENTO
			/*
			 * Object[] objectsTEVENTO= { }; String
			 * sql="select distinct(TEVENTO) from CFG_LANZAR_INFORMES order by TEVENTO";
			 * ArrayList<HashMap> listaTEVENTO=new
			 * AccesoSQL(null).executeQuery((java.sql.Connection)request.getAttribute(
			 * Constantes.DB01CONN), sql, objectsTEVENTO); request.setAttribute("TEVENTOs",
			 * listaTEVENTO);
			 */

			// alimentar CCFGFORM
			/*
			 * Object[] objectsCFGFORM= { };
			 * sql="select distinct(CCFGFORM) from CFG_LANZAR_INFORMES order by CCFGFORM";
			 * ArrayList<HashMap> listaCFGFORM=new
			 * AccesoSQL(null).executeQuery((java.sql.Connection)request.getAttribute(
			 * Constantes.DB01CONN), sql, objectsCFGFORM); request.setAttribute("CFGFORMs",
			 * listaCFGFORM);
			 */

			// TODO: en vez de hardcoded... ver si se puede hacerlo mejor

			// alimentar opciones de export hardcoded, ver pantalla axislist004 de informes

			// alimentar CTIPO (Null/0.- MAP, 1.- Jasper, etc. VF.XXXXX) hardcoded, ver
			// pantalla axislist004 de informes

			// alimentar CTIPO para paramtros, hardcoded, ver pantalla axislist004 de
			// informes

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist004Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	/**
	 * Damos de alta o modificamos un registro
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guardar(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		logger.debug("Axiscoa004Service m_guardar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {
			String mimodo = this.getCampoTextual(request, "mimodo");
			logger.debug("El modo que llega es " + mimodo);
			String sql = "";
			BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
			String CFORM = this.getCampoTextual(request, "CFORM");
			String CMAP = this.getCampoTextual(request, "CMAP");
			String TEVENTO = this.getCampoTextual(request, "TEVENTO");
			BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
			BigDecimal SLITERA = this.getCampoNumerico(request, "SLITERA");
			String CCFGFORM = this.getCampoTextual(request, "CCFGFORM");
			String CPATH = this.getCampoTextual(request, "CPATH");
			String LEXPORT = null; // this.getCampoTextual(request, "LEXPORT");
			Enumeration parameterNames = request.getParameterNames();
			while (parameterNames.hasMoreElements()) {
				String parameterName = (String) parameterNames.nextElement();
				if (parameterName.startsWith("LEXPORT_")) {
					if (LEXPORT == null)
						LEXPORT = "";
					if (LEXPORT.length() > 0)
						LEXPORT = LEXPORT + "|";
					LEXPORT = LEXPORT + parameterName.substring("LEXPORT_".length());
				}
			}
			BigDecimal CTIPO = new BigDecimal(1); // this.getHiddenCampoNumerico(request, "CTIPO");
			String LPARAMS = null;
			BigDecimal GENERAREPORT = new BigDecimal(1);

			// TODO: por supuesto no vale poner INSERTs y UPDATEs aqui, sino han de venir
			// PAC_IAX's

			String CCODPLAN = CMAP;
			BigDecimal IDCONSULTA = BigDecimal.ZERO;
			String GEDOX = "S";
			BigDecimal IDCAT = BigDecimal.ONE;
			BigDecimal CGENFICH = BigDecimal.ZERO;
			BigDecimal CGENPDF = BigDecimal.ZERO;
			BigDecimal CGENREP = BigDecimal.ZERO;
			BigDecimal CTIPODOC = null;
			String CFDIGITIAL = null;

			if (mimodo == null) {
				mimodo = "ALTA";
			}

			logger.debug("El modo es " + mimodo);

			if (mimodo.equals("ALTA")) {
				// TODO: dar de alta este registro

				logger.debug("******* INICIO INSERCION en CFG_LANZAR_INFORMES ");
				Map m1 = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_SET_CFGLANZARINFORMES(CEMPRES, CFORM, CMAP, TEVENTO, SPRODUC,
								SLITERA, LPARAMS, GENERAREPORT, CCFGFORM, LEXPORT, CTIPO);
				logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_SET_CFGLANZARINFORMES: " + m1);

				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m1))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m1)).intValue() == 0) {
					/*
					 * logger.debug("******* INICIO INSERCION en CODIPLANTILLAS"); // vnumerr :=
					 * pac_informes.f_ins_codiplantilla(pccodplan, pidconsulta, pgedox, pidcat, //
					 * pcgenfich, pcgenpdf, pcgenrep, pctipodoc, // pcfdigital);
					 * 
					 * Map m2 = new
					 * PAC_IAX_INFORMES((java.sql.Connection)request.getAttribute(Constantes.
					 * DB01CONN)).ejecutaPAC_IAX_INFORMES__F_SET_CODIPLANTILLAS(CCODPLAN,
					 * IDCONSULTA,GEDOX,IDCAT,CGENFICH,CGENPDF,CGENREP,CTIPODOC,CFDIGITIAL);
					 * logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_SET_CODIPLANTILLAS: "+m2);
					 * 
					 * if (!isEmpty(this.tratarRETURNyMENSAJES(request, m2)) &&
					 * ((BigDecimal)this.tratarRETURNyMENSAJES(request, m2)).intValue() == 0) {
					 */

					logger.debug("******* INICIO INSERCION en DETPLANTILLAS");

					BigDecimal CFIRMA = BigDecimal.ZERO;
					String CMAPEAD = null;
					String TCONFIRMA = null;
					parameterNames = request.getParameterNames();
					while (parameterNames.hasMoreElements()) {
						String parameterName = (String) parameterNames.nextElement();
						if (parameterName.startsWith("CINFORME_") && request.getParameter(parameterName).length() > 0) {
							BigDecimal CIDIOMA = new BigDecimal(parameterName.substring(9)); // TODO: para cada CIDIOMA
																								// hacer un INSERT
							String CINFORME = this.getCampoTextual(request, "CINFORME_" + CIDIOMA); // TODO: para cada
																									// CIDIOMA hacer un
																									// INSERT
							String TDESCRIP = this.getCampoTextual(request, "TDESCRIP_" + CIDIOMA); // TODO: para cada
																									// CIDIOMA hacer un
																									// INSERT
							Map m3 = new PAC_IAX_INFORMES(
									(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
									.ejecutaPAC_IAX_INFORMES__F_SET_DETLANZARINFORMES(CEMPRES, CCODPLAN, CIDIOMA,
											TDESCRIP, CINFORME);
							// ejecutaPAC_IAX_INFORMES__F_SET_DETPLANTILLAS(CCODPLAN,CIDIOMA,TDESCRIP,CINFORME,CPATH,CMAPEAD,CFIRMA,TCONFIRMA);
							logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_SET_DETLANZARINFORES: " + m3);
							this.tratarRETURNyMENSAJES(request, m3);

						}
					}
					logger.debug("******* INICIO INSERCION en CFG_LANZAR_IMFORMES_PARAMS");
					logger.debug("Borrado de cfg_lanzar_informes_params");
					String TPARAM = null;
					Map m4 = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_INFORMES__F_DEL_CFGLANZARINFORMESPARAMS(CEMPRES, CFORM, CMAP, TEVENTO,
									SPRODUC, CCFGFORM);
					logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_DEL_CFGLANZARINFORMESPARAMS: " + m4);
					if (!isEmpty(this.tratarRETURNyMENSAJES(request, m4))
							&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m4)).intValue() == 0) {

						logger.debug("******* INICIO INSERCION en CFG_LANZZAR_INFORMES_PARAMS");
						parameterNames = request.getParameterNames();
						while (parameterNames.hasMoreElements()) {
							String parameterName = (String) parameterNames.nextElement();
							String miXC = "";
							if (parameterName.startsWith("pTPARAM")) {
								miXC = parameterName.substring(7);
								logger.debug("tratamiento del miXC:" + miXC);

								logger.debug("pTPARAM" + miXC + "=" + request.getParameter("pTPARAM" + miXC));
								String TPARAMP = this.getCampoTextual(request, "pTPARAM" + miXC);
								BigDecimal NORDERP = this.getCampoNumerico(request, "pNORDER" + miXC);
								BigDecimal SLITERAP = this.getCampoNumerico(request, "pSLITERA" + miXC);
								BigDecimal CTIPOP = this.getCampoNumerico(request, "pCTIPO" + miXC);
								BigDecimal NOTNULL = this.getCampoNumerico(request, "pNOTNULL" + miXC);
								String LVALORP = this.getCampoTextual(request, "pLVALOR" + miXC);
								Map m5 = new PAC_IAX_INFORMES(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_INFORMES__F_INS_CFGLANZARINFORMESPARAMS(CEMPRES, CFORM, CMAP,
												TEVENTO, SPRODUC, CCFGFORM, TPARAMP, CTIPOP, NORDERP, SLITERAP, NOTNULL,
												LVALORP);
								logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_INS_CFGLANZARINFORMESPARAMS: " + m5);
								this.tratarRETURNyMENSAJES(request, m5);

							}
						}

					} // FINAL M4

					// } // final m2

				} // final m1

			} else if (mimodo.equals("MODIFICACION")) {
				logger.debug("******* INICIO MODIFICACION en CFG_LANZAR_IMFORMES");
				Map m4 = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_UPD_CFGLANZARINFORMES(CEMPRES, CMAP, TEVENTO, SPRODUC, CCFGFORM,
								LEXPORT, SLITERA);
				logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_UPD_CFGLANZARINFORMES: " + m4);
				if (!isEmpty(this.tratarRETURNyMENSAJES(request, m4))
						&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m4)).intValue() == 0) {
					logger.debug(
							"******* INICIO INSERCION en DETPLANTILLAS - Realizare un borrado y luego una insercion  por idiomas");
					Map m7 = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_INFORMES__F_DEL_DETLANZARINFORMES(CEMPRES, CCODPLAN);
					// ejecutaPAC_IAX_INFORMES__F_DEL_DETALLEPLANTILLAS(CCODPLAN);
					logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_DEL_DETLANZARINFORMES: " + m7);
					if (!isEmpty(this.tratarRETURNyMENSAJES(request, m7))
							&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m7)).intValue() == 0) {

						BigDecimal CFIRMA = BigDecimal.ZERO;
						String CMAPEAD = null;
						String TCONFIRMA = null;
						parameterNames = request.getParameterNames();
						while (parameterNames.hasMoreElements()) {
							String parameterName = (String) parameterNames.nextElement();
							if (parameterName.startsWith("CINFORME_")
									&& request.getParameter(parameterName).length() > 0) {
								BigDecimal CIDIOMA = new BigDecimal(parameterName.substring(9)); // TODO: para cada
																									// CIDIOMA hacer un
																									// INSERT
								String CINFORME = this.getCampoTextual(request, "CINFORME_" + CIDIOMA); // TODO: para
																										// cada CIDIOMA
																										// hacer un
																										// INSERT
								String TDESCRIP = this.getCampoTextual(request, "TDESCRIP_" + CIDIOMA); // TODO: para
																										// cada CIDIOMA
																										// hacer un
																										// INSERT
								Map m3 = new PAC_IAX_INFORMES(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_INFORMES__F_SET_DETLANZARINFORMES(CEMPRES, CCODPLAN, CIDIOMA,
												TDESCRIP, CINFORME);
								// ejecutaPAC_IAX_INFORMES__F_SET_DETPLANTILLAS(CCODPLAN,CIDIOMA,TDESCRIP,
								// CINFORME,CPATH,CMAPEAD,CFIRMA,TCONFIRMA);//
								logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_SET_DETLANZARINFORMES: " + m3);
								this.tratarRETURNyMENSAJES(request, m3);

							}
						} // END DEL WHILE

						logger.debug("******* INICIO INSERCION en CFG_LANZAR_IMFORMES_PARAMS");
						logger.debug("Borrado de cfg_lanzar_informes_params");
						String TPARAM = null;
						Map m6 = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
								.ejecutaPAC_IAX_INFORMES__F_DEL_CFGLANZARINFORMESPARAMS(CEMPRES, CFORM, CMAP, TEVENTO,
										SPRODUC, CCFGFORM);
						logger.debug("Resultado ejecutaPAC_IAX_INFORMES.F_DEL_CFGLANZARINFORMESPARAMS: " + m6);
						if (!isEmpty(this.tratarRETURNyMENSAJES(request, m6))
								&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, m6)).intValue() == 0) {
							logger.debug("******* INICIO INSERCION en CFG_LANZZAR_INFORMES_PARAMS");
							parameterNames = request.getParameterNames();
							while (parameterNames.hasMoreElements()) {
								String parameterNameParam = (String) parameterNames.nextElement();
								String miXC = "";
								if (parameterNameParam.startsWith("pTPARAM")) {
									miXC = parameterNameParam.substring(7);
									logger.debug("tratamiento del miXC:" + miXC);

									logger.debug("pTPARAM" + miXC + "=" + request.getParameter("pTPARAM" + miXC));
									String TPARAMP = this.getCampoTextual(request, "pTPARAM" + miXC);
									BigDecimal NORDERP = this.getCampoNumerico(request, "pNORDER" + miXC);
									BigDecimal SLITERAP = this.getCampoNumerico(request, "pSLITERA" + miXC);
									BigDecimal CTIPOP = this.getCampoNumerico(request, "pCTIPO" + miXC);
									BigDecimal NOTNULL = this.getCampoNumerico(request, "pNOTNULL" + miXC);
									String LVALORP = this.getCampoTextual(request, "pLVALOR" + miXC);
									Map m5 = new PAC_IAX_INFORMES(
											(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
											.ejecutaPAC_IAX_INFORMES__F_INS_CFGLANZARINFORMESPARAMS(CEMPRES, CFORM,
													CMAP, TEVENTO, SPRODUC, CCFGFORM, TPARAMP, CTIPOP, NORDERP,
													SLITERAP, NOTNULL, LVALORP);
									logger.debug(
											"Resultado ejecutaPAC_IAX_INFORMES.F_INS_CFGLANZARINFORMESPARAMS: " + m5);
									this.tratarRETURNyMENSAJES(request, m5);
								}
							}
						} // IF DEL M6

					} // ID DE M7

				} // IF DEL M4

			} // FIN MODIFICACION

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist004Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
