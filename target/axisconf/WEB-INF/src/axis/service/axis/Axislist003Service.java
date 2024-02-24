//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #

package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_INFORMES;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * NOMBRE: Axislist003Service.java
 *
 * REVISIONES: Ver Fecha Autor Descripci�n --------- ---------- ---------------
 * ------------------------------------ 1.0 ecg Version inicial
 * 
 * Para a�adir registros de pruebasa en CFG_LANZAR_INFORMES insert into
 * CFG_LANZAR_INFORMES (CEMPRES,CFORM,CMAP,TEVENTO,SPRODUC,SLITERA,CCFGFORM,
 * LEXPORT, CTIPO) values
 * (12,'AXISLIST003',338,'LST_PRODUCCION',0,9901800,'GENERAL','PDF',1);
 */
public class Axislist003Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());

	public void m_miajaxjson(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String ACCION = "," + request.getParameter("ACCION") + ",";
			Map map = new HashMap();
			logger.debug("Accion de la request " + ACCION);
			map.put("ACCION", ACCION);

			if (ACCION.indexOf(",EJECUTAR,") >= 0) {
				// ejecutar report
				logger.debug("****  Accion EJECUTAR map: " + map);
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

				String CEXPORT = "" + this.getCampoTextual(request, "CEXPORT") + "";
				String CMAP = new String(formdata.get("CMAP").toString());
				Enumeration parameters = request.getParameterNames();
				String p = null;
				HashMap<String, String> PARAMETROS__ = new HashMap();
				HashMap<String, String> TPARAMETROS__ = new HashMap();
				BigDecimal batch = new BigDecimal(0);

				BigDecimal CIDIOMA = this.getCampoNumerico(request, "CIDIOMA");
				String CEMAIL = new String(formdata.get("CEMAIL").toString());
				BigDecimal CHECKREC = this.getCampoNumerico(request, "CHECKREC");
				while (parameters.hasMoreElements()) {
					p = parameters.nextElement().toString();
					if (p.indexOf("PARAMETRO__") == 0) {
						PARAMETROS__.put(p.substring(11), request.getParameter(p));
						String tipoParamero = "T" + p.substring(11);
						TPARAMETROS__.put(tipoParamero, request.getParameter("T" + p));
					}
				}
				// Kaio-tarea4113
				try {
					PAC_IAX_INFORMES pii = new PAC_IAX_INFORMES(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mapINFORMEWARNING = pii
							.ejecutaPAC_IAX_INFORMES__F_EJECUTA_VALIDA_INFORME(PARAMETROS__.get("PNPOLIZA"), CIDIOMA);
					map.put("warning", mapINFORMEWARNING);
				} catch (Exception e) {

					logger.error("ERROR EN VALIDAR INFORME: " + e);
					thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
							Constantes.MENSAJE_ERROR);
				}
				// Fin Kaio-tarea4113

				Map mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
								this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
								CEMAIL, CHECKREC);
				logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
				map.put("LIST_FICHEROS", mapINFORME);
				logger.debug("map:" + map);

			}

			if (ACCION.indexOf(",BATCH,") > 0) {
				// ejecutar report
				logger.debug("****  Accion EJECUTAR_BATCH map: " + map);
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

				String CEXPORT = "" + this.getCampoTextual(request, "CEXPORT") + "";
				String CMAP = new String(formdata.get("CMAP").toString());
				Enumeration parameters = request.getParameterNames();
				String p = null;
				HashMap<String, String> PARAMETROS__ = new HashMap();
				HashMap<String, String> TPARAMETROS__ = new HashMap();
				BigDecimal batch = new BigDecimal(1);

				BigDecimal CIDIOMA = this.getCampoNumerico(request, "CIDIOMA");
				String CEMAIL = new String(formdata.get("CEMAIL").toString());
				BigDecimal CHECKREC = this.getCampoNumerico(request, "CHECKREC");

				while (parameters.hasMoreElements()) {
					p = parameters.nextElement().toString();
					if (p.indexOf("PARAMETRO__") == 0) {
						PARAMETROS__.put(p.substring(11), request.getParameter(p));
						String tipoParamero = "T" + p.substring(11);
						TPARAMETROS__.put(tipoParamero, request.getParameter("T" + p));
					}
				}
				Map mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
								this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
								CEMAIL, CHECKREC);
				logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
				map.put("LIST_FICHEROS", mapINFORME);
				logger.debug("map:" + map);

			}
			// Va a buscar los parametros asociados a la ejecucion del listado
			if (ACCION.indexOf(",DETALLE_LISTADO,") >= 0) {
				logger.debug("****  Accion DETALLE_LISTADO map: " + map);
				BigDecimal CEMPRES = null;
				try {
					CEMPRES = new BigDecimal(formdata.get("CEMPRES").toString());
				} catch (Exception e) {
					logger.error("CEMPRES no parseable");
				}
				BigDecimal SPRODUC = null;
				try {
					SPRODUC = new BigDecimal(formdata.get("SPRODUC").toString());
				} catch (Exception e) {
					logger.error("SPRODUC no parseable");
				}

				String TEVENTO = null;
				try {
					TEVENTO = new String(formdata.get("CMODO").toString());
				} catch (Exception e) {
					logger.error("CMODO no parseable");
				}

				String CMAP = null;
				try {
					CMAP = new String(formdata.get("CMAP").toString());
				} catch (Exception e) {
					logger.error("CMAP no parseable");
				}

				BigDecimal CGENREC = this.getCampoNumerico(request, "CGENREC");
				map.put("CGENREC", CGENREC);

				HashMap mapParametros;
				HashMap mapParametrosIdiomas;
				Map mapExport = new HashMap();
				Map mapOPARAMS = new HashMap();
				Map mapIDIIOMAS = new HashMap();
				Map parametros = new HashMap();
				HashMap mapSelect = new HashMap();

				mapParametros = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_PARAMS(CEMPRES, whoami(this).toUpperCase(),
								TEVENTO.toUpperCase(), SPRODUC, CMAP.toUpperCase());

				logger.debug("Resultado accion: DETALLE_LISTADO  mapParametros: " + mapParametros);
				mapExport.put("LEXPORT", mapParametros.get("OCEXPORT"));
				mapOPARAMS.put("OPARAMS", mapParametros.get("OPARAMS"));

				// Debo obtener la lista de idiomas en los cuales puede ejecutarse el map
				mapParametrosIdiomas = new PAC_IAX_INFORMES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_IDIOMASINFORME(CEMPRES, CMAP.toUpperCase(),
								whoami(this).toUpperCase());
				logger.debug("Resultado accion: DETALLE_LISTADO  mapParametrosIdiomas: " + mapParametrosIdiomas);
				mapIDIIOMAS.put("LIDIOMAS", mapParametrosIdiomas.get("PCURSORIDIOMAS"));

				logger.debug("EL mapIDIIOMAS : " + mapIDIIOMAS);
				ArrayList<HashMap> params;
				params = new ArrayList();

				BigDecimal ok = (isEmpty(this.tratarRETURNyMENSAJES(request, mapParametros))) ? new BigDecimal(0)
						: (BigDecimal) this.tratarRETURNyMENSAJES(request, mapParametros);
				if (ok.intValue() == 0) {
					logger.debug("Va a obtener los parametros -----------------------> " + mapParametros);
					// RECOGER DATOS DEL VDETRECIBO
					if (!isEmpty(mapOPARAMS)) {
						ArrayList lista_param = (ArrayList) mapOPARAMS.get("OPARAMS");
						if (!isEmpty(lista_param) && lista_param.size() >= 1) {
							int k;
							for (k = 0; k < lista_param.size(); k++) {
								HashMap LLISTAPARAMS = (HashMap) lista_param.get(k);
								HashMap miParam = new HashMap();
								String tparams = (String) LLISTAPARAMS.get("TPARAM");
								miParam.put("TPARAM", tparams);
								miParam.put("NORDER", LLISTAPARAMS.get("NORDER"));
								miParam.put("SLITERA", LLISTAPARAMS.get("SLITERA"));
								miParam.put("TLITERA", LLISTAPARAMS.get("TLITERA"));
								miParam.put("CTIPO", LLISTAPARAMS.get("CTIPO"));
								miParam.put("NOTNULL", LLISTAPARAMS.get("NOTNULL"));
								miParam.put("LVALOR", LLISTAPARAMS.get("LVALOR"));
								if (!isEmpty(LLISTAPARAMS.get("LVALOR"))) {
									if (LLISTAPARAMS.get("LVALOR").toString().toUpperCase().indexOf("SELECT") == 0) {
										// Debe lanzar la consulta para
										mapSelect = new PAC_IAX_INFORMES(
												(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
												.ejecutaPAC_IAX_INFORMES__F_GET_PARLIST(CEMPRES,
														whoami(this).toUpperCase(), TEVENTO.toUpperCase(), SPRODUC,
														CMAP.toUpperCase(), tparams);
										BigDecimal okSelect = (isEmpty(this.tratarRETURNyMENSAJES(request, mapSelect)))
												? new BigDecimal(0)
												: (BigDecimal) this.tratarRETURNyMENSAJES(request, mapSelect);

										logger.debug("ERROR mapSelect " + mapSelect);
										miParam.put("CONSULTA", mapSelect);

									}
								}
								params.add(miParam);
							}
						}
					}
					parametros.put("RETURN", BigDecimal.ZERO);
					parametros.put("PARAMS", params);

				}

				Object RETURN = this.tratarRETURNyMENSAJES(request, map);
				if (RETURN != null && RETURN.equals(BigDecimal.ZERO)) {
					thisAction.guardarMensaje(request, "111313", new Object[] {}, Constantes.MENSAJE_INFO);
				} else {
					map.put("PARAMETROS", parametros.get("PARAMS"));
					map.put("EXPORTOPTIONS", mapExport.get("LEXPORT"));
					map.put("IDIOMAS", mapIDIIOMAS.get("LIDIOMAS"));
				}
				logger.debug("map:" + map);
			}

			// Recupera los listados asciados a la empresa
			if (ACCION.indexOf(",LISTADOS,") >= 0) {
				logger.debug("****  Accion LISTADOS map: " + map);
				BigDecimal CEMPRES = null;
				try {
					CEMPRES = new BigDecimal(formdata.get("CEMPRES").toString());
				} catch (Exception e) {
					logger.error("CEMPRES no parseable");

				}
				String CMODO = null;
				try {
					CMODO = new String(formdata.get("CMODO").toString());
				} catch (Exception e) {
					logger.error("CMODO no parseable");
				}

				BigDecimal SPRODUC = null;
				try {
					SPRODUC = new BigDecimal(formdata.get("SPRODUC").toString());
				} catch (Exception e) {
					logger.error("SPRODUC no parseable");
				}

				BigDecimal CTIPO = null;
				try {
					CTIPO = new BigDecimal(formdata.get("CTIPO").toString());
				} catch (Exception e) {
					logger.error("CTIPO no parseable");
				}
				BigDecimal CAREA = null;
				try {
					CAREA = new BigDecimal(formdata.get("CAREA").toString());
				} catch (Exception e) {
					logger.error("CAREA no parseable");

				}
				Map mapLISTADOS;

				mapLISTADOS = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_GET_INFORMES(CEMPRES, whoami(this).toUpperCase(),
								CMODO.toUpperCase(), SPRODUC, CTIPO, CAREA);

				logger.debug("Resultado accion ejecutar LISTADOS: " + mapLISTADOS);
				map.put("LISTADOS", mapLISTADOS);
				// map.put("LISTADOS", mapLISTADOS.get("PCURCONFIGSINF"));
				logger.debug("map:" + map);
			}
			// Recupera las Areas asciados a la empresa
			if (ACCION.indexOf(",AREAS,") >= 0) {
				logger.debug("map:" + map);
				Map listValores = new HashMap();
				PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map mapAREAS;
				mapAREAS = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800075));
				logger.debug(mapAREAS);
				// listValores.put("AREAS", (List)tratarRETURNyMENSAJES(request, mapAREAS));
				map.put("AREAS", mapAREAS);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, map);
		} catch (Exception e) {
			logger.error("Error.", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ejecutarulea(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String ACCION = "," + request.getParameter("ACCION") + ",";
			Map map = new HashMap();
			logger.debug("Accion de la request " + ACCION);
			map.put("ACCION", ACCION);

			if (ACCION.indexOf(",ULEA,") > 0) {
				// ejecutar report
				logger.debug("****  Accion EJECUTAR_BATCH map: " + map);
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

				String CEXPORT = "" + this.getCampoTextual(request, "CEXPORT") + "";
				String CMAP = new String(formdata.get("CMAP").toString());
				Enumeration parameters = request.getParameterNames();
				String p = null;
				HashMap<String, String> PARAMETROS__ = new HashMap();
				HashMap<String, String> TPARAMETROS__ = new HashMap();
				BigDecimal batch = new BigDecimal(2);

				BigDecimal CIDIOMA = this.getCampoNumerico(request, "CIDIOMA");
				String CEMAIL = new String(formdata.get("CEMAIL").toString());
				BigDecimal CHECKREC = this.getCampoNumerico(request, "CHECKREC");

				while (parameters.hasMoreElements()) {
					p = parameters.nextElement().toString();
					if (p.indexOf("PARAMETRO__") == 0) {
						PARAMETROS__.put(p.substring(11), request.getParameter(p));
						String tipoParamero = "T" + p.substring(11);
						TPARAMETROS__.put(tipoParamero, request.getParameter("T" + p));
					}
				}
				Map mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
								this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
								CEMAIL, CHECKREC);
				logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);

				map = mapINFORME;
				logger.debug("map:" + map);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error.", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_ejetcutarcierresin(HttpServletRequest request, AbstractDispatchAction thisAction) throws Exception {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);

		try {
			String ACCION = "," + request.getParameter("ACCION") + ",";
			Map map = new HashMap();
			logger.debug("Accion de la request " + ACCION);
			map.put("ACCION", ACCION);

			if (ACCION.indexOf(",CIERRESIN,") > 0) {
				// ejecutar report
				logger.debug("****  Accion EJECUTAR_BATCH map: " + map);
				BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");

				String CEXPORT = "" + this.getCampoTextual(request, "CEXPORT") + "";
				String CMAP = new String(formdata.get("CMAP").toString());
				Enumeration parameters = request.getParameterNames();
				String p = null;
				HashMap<String, String> PARAMETROS__ = new HashMap();
				HashMap<String, String> TPARAMETROS__ = new HashMap();
				BigDecimal batch = new BigDecimal(3);

				BigDecimal CIDIOMA = this.getCampoNumerico(request, "CIDIOMA");
				String CEMAIL = new String(formdata.get("CEMAIL").toString());
				BigDecimal CHECKREC = this.getCampoNumerico(request, "CHECKREC");

				while (parameters.hasMoreElements()) {
					p = parameters.nextElement().toString();
					if (p.indexOf("PARAMETRO__") == 0) {
						PARAMETROS__.put(p.substring(11), request.getParameter(p));
						String tipoParamero = "T" + p.substring(11);
						TPARAMETROS__.put(tipoParamero, request.getParameter("T" + p));
					}
				}
				Map mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
								this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
								CEMAIL, CHECKREC);
				logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);

				map = mapINFORME;
				logger.debug("map:" + map);

			}

			request.setAttribute(Constantes.AJAXCONTAINER, map);
			tratarRETURNyMENSAJES(request, map);
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		} catch (Exception e) {
			logger.error("Error.", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}
	}

	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist003Service m_init");
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
			if (!isEmpty(SPRODUC)) {
				formdata.put("SPRODUC", "" + SPRODUC);
			} else {
				formdata.put("SPRODUC", "0");
			}
			formdata.put("CIDIOMA", "" + usuario.getCidioma());

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");

			if (isEmpty(CMODO)) {
				formdata.put("CMODO", "GENERAL");
			} else {
				formdata.put("CMODO", CMODO.toUpperCase());
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axislist003Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		try {

			Map mapEMPRESAS = new PAC_IAX_LISTVALORES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_LISTVALORES__F_GET_LSTEMPRESAS();
			logger.debug("------- mapEMPRESAS:" + mapEMPRESAS);
			request.setAttribute("EMPRESAS", (List) tratarRETURNyMENSAJES(request, mapEMPRESAS, false));

		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public void m_ejecutar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_ejecutar");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();
		Map mapINFORMEWARNING = new HashMap(); // Kaio-tarea4113

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
		String CEXPORT = "" + this.getCampoTextual(request, "CEXPORT") + "";
		String CMAP = new String(formdata.get("CMAP").toString());
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = this.getCampoNumerico(request, "CIDIOMA");
		String CEMAIL = "" + this.getCampoTextual(request, "CEMAIL") + "";
		BigDecimal CHECKREC = this.getCampoNumerico(request, "CHECKREC");

		while (parameters.hasMoreElements()) {
			p = parameters.nextElement().toString();
			if (p.indexOf("PARAMETRO__") == 0) {
				PARAMETROS__.put(p.substring(11), request.getParameter(p));
				String tipoParamero = "T" + p.substring(11);
				TPARAMETROS__.put(tipoParamero, request.getParameter("T" + p));
			}
		}

		// Kaio-tarea4113
		try {
			mapINFORMEWARNING = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_VALIDA_INFORME(PARAMETROS__.get("PNPOLIZA"), CIDIOMA);
		} catch (Exception e) {
			// TODO: handle exception
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		// Fin Kaio-tarea4113

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, CHECKREC);
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
		map.put("LIST_FICHEROS", mapINFORME);
		map.put("warning", mapINFORMEWARNING);// Kaio-tarea4113
		logger.debug("map:" + map);

		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	public void m_batch(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axiscoa002Service m_ejecutar_batch");
		Map map = new HashMap();
		Map mapINFORME = new HashMap();

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		BigDecimal CEMPRES = this.getCampoNumerico(request, "CEMPRES");
		String CEXPORT = "" + this.getCampoTextual(request, "CEXPORT") + "";
		String CMAP = new String(formdata.get("CMAP").toString());
		Enumeration parameters = request.getParameterNames();
		String p = null;
		HashMap<String, String> PARAMETROS__ = new HashMap();
		HashMap<String, String> TPARAMETROS__ = new HashMap();
		BigDecimal batch = new BigDecimal(0);
		BigDecimal CIDIOMA = this.getCampoNumerico(request, "CIDIOMA");
		String CEMAIL = new String(formdata.get("CEMAIL").toString());
		BigDecimal CHECKREC = this.getCampoNumerico(request, "CHECKREC");
		while (parameters.hasMoreElements()) {
			p = parameters.nextElement().toString();
			if (p.indexOf("PARAMETRO__") == 0) {
				PARAMETROS__.put(p.substring(11), request.getParameter(p));
				String tipoParamero = "T" + p.substring(11);
				TPARAMETROS__.put(tipoParamero, request.getParameter("T" + p));
			}
		}

		try {
			mapINFORME = new PAC_IAX_INFORMES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_INFORMES__F_EJECUTA_INFORME(CMAP, CEMPRES, CEXPORT,
							this.generarT_IAX_Info(request, usuario, PARAMETROS__, TPARAMETROS__), CIDIOMA, batch,
							CEMAIL, CHECKREC);
		} catch (Exception e) {
			logger.error("Error en el servicio Axislist003Service - m�todo m_ejecutar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		logger.debug("Resultado accion ejecutar mapINFORME: " + mapINFORME);
		map.put("LIST_FICHEROS", mapINFORME);
		logger.debug("map:" + map);

		// ver m_form: this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, HashMap PARAMETROS__,
			HashMap TPARAMETROS__) throws Exception {
		logger.debug("******** GENERART_IAX_INFO ****************");
		Object[] keyArray = PARAMETROS__.keySet().toArray();

		ArrayList tinfo = null;

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ObIaxInfo[] paramsList = new ObIaxInfo[PARAMETROS__.keySet().toArray().length];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < keyArray.length; i++) {
				if (PARAMETROS__.get(keyArray[i].toString()).toString().length() > 0) {
					String valorParametro = "T" + keyArray[i].toString();
					String tipoParametro = TPARAMETROS__.get(valorParametro).toString();
					paramObj = new ObIaxInfo(keyArray[i].toString(),
							PARAMETROS__.get(keyArray[i].toString()).toString(), tipoParametro, BigDecimal.ONE);
					paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
					paramsList[i] = paramObj;
				}

			}
		}

		// con la lista de parametros llenar el ojeto table
		TIaxInfo params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
		logger.debug("*********** VA A DEVOLVER LOS PARAMETROS ***************");
		return params;

	}

}
