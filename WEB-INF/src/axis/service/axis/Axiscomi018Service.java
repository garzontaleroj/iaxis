package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_COMCONVENIOS;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.mvc.control.axis.Axiscomi018Action;
import axis.mvc.model.ObIaxInfo;
import axis.mvc.model.TIaxInfo;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;

/**
 * Axiscomi018Service.java
 * 
 * @since Java 5.0
 */
public class Axiscomi018Service extends AxisBaseService {
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
	public void m_init(HttpServletRequest request, Axiscomi018Action thisAction) {
		logger.debug("Axiscomi018Service m_init");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}

	}

	public void m_form(HttpServletRequest request, Axiscomi018Action thisAction) {
		logger.debug("Axiscomi018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_COMCONVENIOS pac_iax_comconvenios = new PAC_IAX_COMCONVENIOS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CONVENIO = getCampoNumerico(request, "CONVENIO");
			Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			BigDecimal CAGENTE = usuario.getCagente();
			String MODO = getCampoTextual(request, "MODO");

			logger.debug("---> FINIVIG:" + FINIVIG);
			if (!isEmpty(CONVENIO) && !isEmpty(FINIVIG) && (MODO.equals(new String("MODIFICAR"))
					|| MODO.equals(new String("NUEVAVIG")) || MODO.equals(new String("CONSULTAR")))) {

				Map m = pac_iax_comconvenios.ejecutaPAC_IAX_COMCONVENIOS__F_GET_CONVENIO_VIG(CONVENIO, FINIVIG);
				logger.debug("-->busqueda:" + m);
				tratarRETURNyMENSAJES(request, m);

				formdata.put("CONVENIO", CONVENIO);
				formdata.put("CONVENIO_TEXT", m.get("PTCONVENIO"));
				formdata.put("CAGENTE", m.get("PCAGENTE"));
				formdata.put("SPERSON", m.get("PSCOMCONV_IN"));
				formdata.put("NOMBRE_TEXT", m.get("PTNOMAGE"));
				formdata.put("MONTO", m.get("PIIMPORTE"));
				formdata.put("FANULACION", m.get("PFANUL"));

				Date FFINVIG = (Date) m.get("PFFINVIG");
				String CALCULARFIN = getCampoTextual(request, "CALCULARFIN");
				logger.debug("---> CALCULARFIN:" + CALCULARFIN);
				if (MODO.equals(new String("NUEVAVIG")) && isEmpty(CALCULARFIN)) {
					Calendar calendarDate = Calendar.getInstance();
					calendarDate.setTime(FFINVIG);
					calendarDate.add(Calendar.MINUTE, 60 * 24);
					formdata.put("FINIVIG", calendarDate.getTime());
					formdata.put("FFINVIG", null);
				} else {
					formdata.put("FINIVIG", FINIVIG);
					formdata.put("FFINVIG", m.get("PFFINVIG"));
				}

				m = pac_iax_comconvenios.ejecutaPAC_IAX_COMCONVENIOS__F_GET_PRODCONVENIO(CONVENIO);
				logger.debug("-->productos:" + m);

				ArrayList lstprod = (ArrayList) m.get("RETURN");
				logger.debug("---> lstprod:" + lstprod);
				ArrayList prod = new ArrayList();
				HashMap lstpro = new HashMap();
				HashMap OB_IAX_INFO = new HashMap();
				if (!isEmpty(lstprod)) {
					logger.debug("---> lstprod:" + lstprod);
					for (int i = 0; i < lstprod.size(); i++) {
						logger.debug("---> producto:" + lstprod.get(i));
						// String[] producto = productos[i].split("/");
						// OB_IAX_INFO = new HashMap();
						lstpro = new HashMap();
						// OB_IAX_INFO =(HashMap) ((HashMap)lstprod.get(i)).get("OB_IAX_INFO");
						lstpro.put("SPRODUC", ((HashMap) lstprod.get(i)).get("SPRODUC"));
						lstpro.put("TPRODUC", ((HashMap) lstprod.get(i)).get("TPRODUC"));
						prod.add(lstpro);
					}
				}

				logger.debug("---> prod:" + prod);
				formdata.put("LSTPRODUCTOS", prod);
				request.getSession().setAttribute("LSTPRODUCTOS", prod);

				if (request.getParameter("NoRecargarLstComi") == null) {

					m = pac_iax_comconvenios.ejecutaPAC_IAX_COMCONVENIOS__F_GET_MODCOM_CONV(CONVENIO, FINIVIG);

					ArrayList c = (ArrayList) m.get("RETURN");
					ArrayList LTSCOMI = new ArrayList();
					logger.debug("---> comi:" + c);
					for (int i = 0; i < c.size(); i++) {
						Map comi = new HashMap();
						Map OB_IAX_COMISION = new HashMap();
						HashMap r = (HashMap) c.get(i);
						// OB_IAX_GSTCOMISION = (HashMap)r.get("OB_IAX_GSTCOMISION");
						// logger.debug("---> OB_IAX_GSTCOMISION:"+OB_IAX_GSTCOMISION);
						// HashMap r = (HashMap)OB_IAX_GSTCOMISION.get(i);
						comi.put("CATRIBU", r.get("CMODCOM"));
						comi.put("TATRIBU", r.get("TMODCOM"));
						comi.put("PCCOMISI", r.get("PCOMISI"));
						logger.debug("compani: " + comi);
						OB_IAX_COMISION.put("OB_IAX_COMISION", comi);
						LTSCOMI.add(OB_IAX_COMISION);
					}
					logger.debug("LTSCOMI: " + LTSCOMI);
					request.getSession().setAttribute("LTSCOMI", LTSCOMI);
				}

			}

			if (isEmpty(CONVENIO) && (!isEmpty(MODO) && MODO.equals(new String("NUEVO")))) {

				Map m = pac_iax_comconvenios.ejecutaPAC_IAX_COMCONVENIOS__F_GET_NEXT_CONV();
				logger.debug(m);
				tratarRETURNyMENSAJES(request, m);

				formdata.put("CONVENIO", m.get("RETURN"));

				formdata.put("CONVENIO_TEXT", null);
				formdata.put("TDESCONV", null);
				formdata.put("FINIVIG", null);
				formdata.put("FFINVIG", null);
				formdata.put("CAGENTE", null);
				formdata.put("SPERSON", null);
				formdata.put("NOMBRE_TEXT", null);
				formdata.put("NNUMIDE", null);
				formdata.put("TNOMBRE", null);
				formdata.put("MONTO", null);

			}

			ArrayList lstcomi = (ArrayList) request.getSession().getAttribute("LTSCOMI");
			if (isEmpty(lstcomi)) {

				Map m = pac_iax_comconvenios.ejecutaPAC_IAX_COMCONVENIOS__F_GET_MODCOM_CONV(null, null);
				logger.debug(m);
				tratarRETURNyMENSAJES(request, m);
				ArrayList c = (ArrayList) m.get("RETURN");

				ArrayList LTSCOMI = new ArrayList();

				for (int i = 0; i < c.size(); i++) {
					Map comi = new HashMap();
					Map OB_IAX_COMISION = new HashMap();
					HashMap r = (HashMap) c.get(i);
					comi.put("CATRIBU", r.get("CMODCOM"));
					comi.put("TATRIBU", r.get("TMODCOM"));
					comi.put("PCCOMISI", isEmpty(r.get("PCCOMISI")) ? new BigDecimal(0) : r.get("PCCOMISI"));
					logger.debug("compani: " + comi);
					OB_IAX_COMISION.put("OB_IAX_COMISION", comi);
					LTSCOMI.add(OB_IAX_COMISION);
				}
				logger.debug("LTSCOMI: " + LTSCOMI);
				request.getSession().setAttribute("LTSCOMI", LTSCOMI);

			} else {
				lstcomi = (ArrayList) request.getSession().getAttribute("LTSCOMI"); // [{OB_IAX_COMISION={CATRIBU=1,
																					// PCCOMISI=3,56, TATRIBU=Dire

				logger.debug("ANTES " + lstcomi);
				for (int i = 0; i < lstcomi.size(); i++) {

					HashMap r = (HashMap) lstcomi.get(i);
					HashMap OB_IAX_COMISION = (HashMap) r.get("OB_IAX_COMISION");
					logger.debug("OB_IAX_COMISION?" + OB_IAX_COMISION);
					if (OB_IAX_COMISION.get("PCCOMISI") != null) {
						logger.debug("OB_IAX_COMISION antes" + OB_IAX_COMISION);
						OB_IAX_COMISION.put("PCCOMISI", OB_IAX_COMISION.get("PCCOMISI").toString().replace(',', '.'));
						logger.debug("OB_IAX_COMISION despues" + OB_IAX_COMISION);
						// lstcomi.set(i,OB_IAX_COMISION);
					}

				}
				request.getSession().setAttribute("LTSCOMI", lstcomi);
				logger.debug("DESPUES " + lstcomi);
			}

			ArrayList lstprods = (ArrayList) request.getSession().getAttribute("LSTPRODUCTOS");
			String recprod = getCampoTextual(request, "RECPROD");
			if (isEmpty(lstprods) || (!isEmpty(recprod) && recprod.equals(new String("RECARGAR")))) {
				String LISTAPRODUCTOS = getCampoTextual(request, "LISTAPRODUCTOS");
				logger.debug("---> LISTAPRODUCTOS:" + LISTAPRODUCTOS);
				HashMap lstprod = new HashMap();
				ArrayList prod = new ArrayList();
				if (!isEmpty(LISTAPRODUCTOS)) {
					String[] productos = LISTAPRODUCTOS.split("x");
					logger.debug("---> productos:" + productos);
					for (int i = 0; i < productos.length; i++) {
						logger.debug("---> producto:" + productos[i]);
						String[] producto = productos[i].split("/");

						lstprod = new HashMap();
						if (!isEmpty(producto) && producto.length > 0) {
							lstprod.put("SPRODUC", producto[0]);
							if (producto.length > 1)
								lstprod.put("TPRODUC", producto[1]);
							prod.add(lstprod);
						}
					}
				}
				logger.debug("---> prod:" + prod);
				formdata.put("LSTPRODUCTOS", prod);
				request.getSession().setAttribute("LSTPRODUCTOS", prod);
			} else if (!isEmpty(recprod) && recprod.equals(new String("RECARGAR2"))) {
				String LISTAPRODUCTOS = getCampoTextual(request, "LISTAPRODUCTOS2");
				logger.debug("---> LISTAPRODUCTOS:" + LISTAPRODUCTOS);
				HashMap lstprod = new HashMap();
				ArrayList prod = new ArrayList();
				if (!isEmpty(LISTAPRODUCTOS)) {
					String[] productos = LISTAPRODUCTOS.split("x");
					logger.debug("---> productos:" + productos);
					for (int i = 0; i < productos.length; i++) {
						logger.debug("---> producto:" + productos[i]);
						String[] producto = productos[i].split("/");

						lstprod = new HashMap();
						if (!isEmpty(producto) && producto.length > 0) {
							lstprod.put("SPRODUC", producto[0]);
							if (producto.length > 1)
								lstprod.put("TPRODUC", producto[1]);
							prod.add(lstprod);
						}
					}
				}
				logger.debug("---> prod:" + prod);
				formdata.put("LSTPRODUCTOS", prod);
				request.getSession().setAttribute("LSTPRODUCTOS", prod);
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_aceptar(HttpServletRequest request, Axiscomi018Action thisAction) {
		logger.debug("Axiscomi018Service m_aceptar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_COMCONVENIOS pac_iax_comconvenios = new PAC_IAX_COMCONVENIOS(
					(Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal CONVENIO = getCampoNumerico(request, "CONVENIO");
			String TDESCONV = getCampoTextual(request, "CONVENIO_TEXT");
			String MODO = getCampoTextual(request, "MODO");
			Date FINIVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FINIVIG"));
			Date FFINVIG = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FFINVIG"));
			Date FANUL = AxisBaseService.stringToSqlDate(getCampoTextual(request, "FANULACION"));

			BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
			BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
			BigDecimal MONTO = getCampoNumerico(request, "MONTO");
			ArrayList lstcomi = (ArrayList) request.getSession().getAttribute("LTSCOMI");
			ArrayList lstprod = (ArrayList) request.getSession().getAttribute("LSTPRODUCTOS");

			logger.debug("-->CONVENIO:" + CONVENIO);
			logger.debug("-->TDESCONV:" + TDESCONV);
			logger.debug("-->FINIVIG:" + FINIVIG);
			logger.debug("-->FFINVIG:" + FFINVIG);
			logger.debug("-->CAGENTE:" + CAGENTE);
			logger.debug("-->SPERSON:" + SPERSON);
			logger.debug("-->lstcomi:" + lstcomi);
			logger.debug("-->lstprod:" + lstprod);

			BigDecimal CMODO = null;
			if (MODO.equals(new String("NUEVO")))
				CMODO = new BigDecimal(1);
			else if (MODO.equals(new String("MODIFICAR")))
				CMODO = new BigDecimal(2);
			else if (MODO.equals(new String("NUEVAVIG")))
				CMODO = new BigDecimal(3);

			Map m = pac_iax_comconvenios.ejecutaPAC_IAX_COMCONVENIOS__F_ALTA_CONVENIO_WEB(CMODO, CONVENIO, TDESCONV,
					CAGENTE, FINIVIG, FFINVIG, FANUL, MONTO, generarT_IAX_Info(request, usuario, new BigDecimal(2)),
					generarT_IAX_Info(request, usuario, new BigDecimal(1)));

			logger.debug(m);
			tratarRETURNyMENSAJES(request, m);

			if (m.get("RETURN").equals(new BigDecimal(0))) {

				if (!isEmpty(m.get("PFINIVIG_OUT")))
					formdata.put("FINIVIG", m.get("PFINIVIG_OUT"));

				// String MODO=this.getCampoTextual(request,"MODO");
				if (MODO != null && (MODO.equals("NUEVO") || MODO.equals("NUEVAVIG") || MODO.equals("MODIFICAR"))) {
					formdata.put("MODO", "CONSULTAR");

				}

				if (MODO != null && MODO.equals("NUEVAVIG")) {
					formdata.put("CALCULARFIN", "NO");
				}
			} else {
				formdata.put("RECPROD", "RECARGAR2");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi018Service - m�todo m_aceptar", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

	public void m_buscar(HttpServletRequest request, Axiscomi018Action thisAction) {
		logger.debug("Axiscomi018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
			BigDecimal SRECREN = getCampoNumerico(request, "SRECREN");

			Map mapa_cabecera = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_GET_CAB_RENTA(SRECREN);
			logger.debug(mapa_cabecera);
			HashMap cabecera = (HashMap) mapa_cabecera.get("OOCABRENTA");
			// formdata.putAll(cabecera);
			formdata.put("OOCABRENTA", cabecera);

			Map mapa_cuerpo = new PAC_IAX_RENTAS((Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_RENTAS__F_GET_PAGORENTA(SRECREN);
			logger.debug(mapa_cuerpo);
			HashMap cuerpo = (HashMap) mapa_cuerpo.get("OOPAGORENTA");
			// formdata.putAll(cuerpo);
			formdata.put("OOPAGORENTA", cuerpo);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {

			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

		}
	}

	public void m_ajax_actualizar_persona(HttpServletRequest request, Axiscomi018Action thisAction) {
		logger.debug("Axiscomi015Service m_ajax_actualizar_persona");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal SPERSON = this.getCampoNumerico(request, "SPERSON"); // (BigDecimal)
																			// AbstractDispatchAction.topPila(request,
																			// "SSEGURO");
			BigDecimal CAGENTE = this.getCampoNumerico(request, "CAGENTE1"); // (BigDecimal)
																				// AbstractDispatchAction.topPila(request,
																				// "SSEGURO");
			Map map = new PAC_IAX_PERSONA((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON, CAGENTE);
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
			logger.error("Axiscomi018Service m_ajax_actualizar_persona - Excepcion", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	public void m_ajax_insertpor(HttpServletRequest request) {
		logger.debug("Axiscomi018Service m_ajax_insertpor");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();
		try {

			BigDecimal PCCOMISI = getCampoNumerico(request, "PCCOMISI");
			BigDecimal PCMODCOM = getCampoNumerico(request, "PCMODCOM");

			ArrayList lstcomi = (ArrayList) request.getSession().getAttribute("LTSCOMI");
			logger.debug("---> lstcomi:" + lstcomi);
			if (!isEmpty(lstcomi)) {

				HashMap r = new HashMap();
				for (int i = 0; i < lstcomi.size(); i++) {
					r = (HashMap) lstcomi.get(i);
					HashMap rr = (HashMap) r.get("OB_IAX_COMISION");
					logger.debug("---> rr:" + rr);
					BigDecimal catribu = (BigDecimal) rr.get("CATRIBU");
					if (catribu.equals(PCMODCOM)) {
						rr.put("PCCOMISI", PCCOMISI.toString().replace('.', ',')); // ver si con esto arreglamos el
																					// error numerico cuando pasamos a
																					// ala bbdd
						Map OB_IAX_COMISION = new HashMap();
						OB_IAX_COMISION.put("OB_IAX_COMISION", rr);
						lstcomi.set(i, OB_IAX_COMISION);
						logger.debug("---> lstcompanias:" + lstcomi);
					}
				}
			}

			request.getSession().setAttribute("LTSCOMI", lstcomi);
			ajax.guardarContenidoFinalAContenedorAjax(lstcomi);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr004Service - m�todo m_ajax_insertval", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private TIaxInfo generarT_IAX_Info(HttpServletRequest request, UsuarioBean usuario, BigDecimal cual)
			throws Exception {

		String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData().getUserName();

		ArrayList tinfo = null;
		if (cual.equals(new BigDecimal(1)))
			tinfo = (ArrayList) request.getSession().getAttribute("LTSCOMI");
		else
			tinfo = (ArrayList) request.getSession().getAttribute("LSTPRODUCTOS");

		TIaxInfo params = null;
		int count = 0;

		// if(!isEmpty(tinfo)){
		int n = tinfo.size(); // numero de parametros
		logger.debug("n-->" + n);
		ObIaxInfo[] paramsList = new ObIaxInfo[n];
		// primero, llenar los parametros
		{
			ObIaxInfo paramObj = null;
			for (int i = 0; i < tinfo.size(); i++) {
				HashMap xx = (HashMap) tinfo.get(i);

				if (cual.equals(new BigDecimal(1))) {
					HashMap mm = (HashMap) xx.get("OB_IAX_COMISION");
					logger.debug("mm-->" + mm);
					if (!isEmpty(mm.get("PCCOMISI"))) {
						count++;
						logger.debug(mm.get("PCCOMISI").toString());
						paramObj = new ObIaxInfo(String.valueOf(mm.get("CATRIBU")),
								mm.get("PCCOMISI").toString().replace('.', ','), "", new BigDecimal(1));
						paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
						paramsList[i] = paramObj;
					}
				} else {
					// HashMap mm =(HashMap) xx.get("OB_IAX_DESCCUADROCOMISION");

					if (!isEmpty(xx.get("SPRODUC"))) {
						count++;
						paramObj = new ObIaxInfo("SPRODUC", String.valueOf(xx.get("SPRODUC")), "", new BigDecimal(1));
						paramObj._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "OB_IAX_INFO");
						paramsList[i] = paramObj;
					}
				}
			}
		}

		if (count == 0)
			paramsList = new ObIaxInfo[count];

		// con la lista de parametros llenar el ojeto table
		params = new TIaxInfo(paramsList);
		params._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_INFO");
//        }
		// if(count > 0)
		return params;
		// else
		// return null;
	}

	public void m_recargar(HttpServletRequest request, Axiscomi018Action thisAction) {
		logger.debug("Axiscomi018Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			String LISTAPRODUCTOS = getCampoTextual(request, "LISTAPRODUCTOS");
			logger.debug("---> LISTAPRODUCTOS:" + LISTAPRODUCTOS);
			HashMap lstprod = new HashMap();
			ArrayList prod = new ArrayList();
			if (!isEmpty(LISTAPRODUCTOS)) {
				String[] productos = LISTAPRODUCTOS.split("x");
				logger.debug("---> productos:" + productos);
				for (int i = 0; i < productos.length; i++) {
					logger.debug("---> producto:" + productos[i]);
					String[] producto = productos[i].split("/");

					lstprod = new HashMap();
					if (!isEmpty(producto) && producto.length > 0) {
						lstprod.put("SPRODUC", producto[0]);
						if (producto.length > 1)
							lstprod.put("TPRODUC", producto[1]);
						prod.add(lstprod);
					}
				}
			}
			logger.debug("---> prod:" + prod);
			formdata.put("LSTPRODUCTOS", prod);
			request.getSession().setAttribute("LSTPRODUCTOS", prod);

		} catch (Exception e) {
			logger.error("Error en el servicio Axiscomi018Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
		}
	}

}
