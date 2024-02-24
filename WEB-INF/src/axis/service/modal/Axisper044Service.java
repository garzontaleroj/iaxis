package axis.service.modal;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MARCAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper044Action;
import axis.mvc.model.ObIaxMarcas;
import axis.mvc.model.TIaxMarcas;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class Axisper044Service extends AxismprxxxService {
	static Log logger = LogFactory.getLog(Axisper044Service.class);

	public void m_init(HttpServletRequest request, Axisper044Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.initxxx(request, thisAction);
			if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
				String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
				request.getSession().setAttribute("AXISMPRXXX_EST", EST);
			}
			request.getSession().setAttribute("AXISMPRXXX", "axisper044");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper044Service - mtodo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisper044Action thisAction) {
		List<Map> T_IAX_MARCAS = new ArrayList<Map>();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		request.getSession().setAttribute("AXISMPRXXX", "axisper044");
		try {
			BigDecimal SPERSON = null;
			BigDecimal CEMPRES = usuario.getCempres();
			request.getSession().removeAttribute("LSTMARCASMODIFICADAS");
			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON")))
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

			formdata.put("SPERSON", SPERSON);
			PAC_IAX_MARCAS pac_iax_marcas = new PAC_IAX_MARCAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map marcasReturn = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_OBTIENE_MARCAS(CEMPRES, SPERSON);
			T_IAX_MARCAS = (List<Map>) tratarRETURNyMENSAJES(request, marcasReturn);
			logger.debug(T_IAX_MARCAS);

			request.setAttribute("MARCAS", !isEmpty(T_IAX_MARCAS) ? T_IAX_MARCAS : new ArrayList());

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper044Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

	public BigDecimal crearMarca(HttpServletRequest request, Axisper044Action thisAction) {
		logger.debug("Axisper044Service m_grabarMarcas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal CEMPRES = usuario.getCempres();

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
		try {
			String cmarca = (String) formdata.get("CMARCA");
			formdata.put("SPERSON", SPERSON);
			BigDecimal vmarca = this.stringToBigDecimal((String) formdata.get("VMARCA"));
			String vcampo = (String) formdata.get("VCAMPO");
			Map lstMarcasModificadas = (Map) request.getSession().getAttribute("LSTMARCASMODIFICADAS");
			ObIaxMarcas objMarca = null;
			if (isEmpty(lstMarcasModificadas)) {
				System.out.println("LA LISTA ESTA VACIA Y SE VA A CREAR");
				lstMarcasModificadas = new HashMap<String, ObIaxMarcas>();
				objMarca = new ObIaxMarcas();
			} else {
				objMarca = (ObIaxMarcas) lstMarcasModificadas.get(cmarca);
				if (isEmpty(objMarca))
					objMarca = new ObIaxMarcas();
			}

			if (vcampo.equalsIgnoreCase("TODOS")) {
				System.out.println("en el TODOS");
				objMarca.setCempres(CEMPRES);
				objMarca.setCmarca(cmarca);
				objMarca.setSperson(SPERSON);
				objMarca.setCtipo(new BigDecimal(0));
				objMarca.setCtomador(vmarca);
				objMarca.setCasegurado(vmarca);
				objMarca.setCintermed(vmarca);
				objMarca.setCconsorcio(vmarca);
				objMarca.setCcodeudor(vmarca);
				objMarca.setCbenef(vmarca);
				objMarca.setCaccionista(vmarca);
				objMarca.setCrepresen(vmarca);
				objMarca.setCapoderado(vmarca);
				objMarca.setCpagador(vmarca);
				// INI TCS-344 CJMR 19/02/2019
				objMarca.setCproveedor(vmarca);
				// FIN TCS-344 CJMR 19/02/2019
				objMarca.setCgrupoecon(vmarca);

			} else {
				objMarca.setCempres(CEMPRES);
				objMarca.setCmarca(cmarca);
				objMarca.setSperson(SPERSON);
				objMarca.setCtipo(new BigDecimal(0));

				if (vcampo.equalsIgnoreCase("TOMADOR"))
					objMarca.setCtomador(vmarca);
				if (vcampo.equalsIgnoreCase("ASEGURADO"))
					objMarca.setCasegurado(vmarca);
				if (vcampo.equalsIgnoreCase("INTERMEDIARIO"))
					objMarca.setCintermed(vmarca);
				if (vcampo.equalsIgnoreCase("CONSORCIO"))
					objMarca.setCconsorcio(vmarca);
				if (vcampo.equalsIgnoreCase("CODEUDOR"))
					objMarca.setCcodeudor(vmarca);
				if (vcampo.equalsIgnoreCase("BENEFICIARIO"))
					objMarca.setCbenef(vmarca);
				if (vcampo.equalsIgnoreCase("ACCIONISTA"))
					objMarca.setCaccionista(vmarca);
				if (vcampo.equalsIgnoreCase("REPRESENTANTE"))
					objMarca.setCrepresen(vmarca);
				if (vcampo.equalsIgnoreCase("APODERADO"))
					objMarca.setCapoderado(vmarca);
				if (vcampo.equalsIgnoreCase("PAGADOR"))
					objMarca.setCpagador(vmarca);
				// INI TCS-344 CJMR 19/02/2019
				if (vcampo.equalsIgnoreCase("PROVEEDOR"))
					objMarca.setCproveedor(vmarca);
				// FIN TCS-344 CJMR 19/02/2019
				if (vcampo.equalsIgnoreCase("GRUPOECON"))
					objMarca.setCgrupoecon(vmarca);
			}

			lstMarcasModificadas.put(cmarca, objMarca);
			request.getSession().setAttribute("LSTMARCASMODIFICADAS", lstMarcasModificadas);

			return new BigDecimal(0);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper026Service.m_grabarRegimen", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

	public BigDecimal m_grabarMarcas(HttpServletRequest request, Axisper044Action thisAction) {
		logger.debug("Axisper044Service m_grabarMarcas");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

		try {
			String USERNAME = ((java.sql.Connection) request.getAttribute(Constantes.DB01CONN)).getMetaData()
					.getUserName();
			PAC_IAX_MARCAS pac_iax_marcas = new PAC_IAX_MARCAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			boolean todoOk = true;
			BigDecimal CEMPRES = usuario.getCempres();
			BigDecimal SPERSON = new BigDecimal(String.valueOf(formdata.get("SPERSON")));
			TIaxMarcas tmarcas = null;
			int count = 0;

			Map<String, ObIaxMarcas> mapMarcas = (Map) request.getSession().getAttribute("LSTMARCASMODIFICADAS");

			if (mapMarcas != null) {
				int n = mapMarcas.size(); // numero de parametros
				ObIaxMarcas[] marcasList = new ObIaxMarcas[n];
				String cmarca = (String) formdata.get("CMARCA");

				int i = 0;
				for (Map.Entry<String, ObIaxMarcas> entry : mapMarcas.entrySet()) {
					ObIaxMarcas ob = (ObIaxMarcas) entry.getValue();
					marcasList[i] = ob;
					i++;
				}

				tmarcas = new TIaxMarcas(marcasList);
				tmarcas._SQL_NAME = UsuarioBean.fixOwner(USERNAME, "T_IAX_MARCAS");

				Map map = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_SET_MARCAS(CEMPRES, SPERSON, tmarcas);

				// Inicio IAXIS-4832(6) 04/09/2019
				if (((BigDecimal) tratarRETURNyMENSAJES(request, map)).intValue() == 0) {
					// Fue todo bien en la fijacin de las marcas
					request.setAttribute("OK", "1");
				} else {
					// Ocurri algn error
					request.setAttribute("OK", "0");
					if (!isEmpty(map.get("MENSAJES")))
						request.getSession().setAttribute("PRETEN_MENSAJES",
								((Map) ((Map) ((List) map.get("MENSAJES")).get(0)).get("OB_IAX_MENSAJES"))
										.get("TERROR"));
				}
				// Fin IAXIS-4832(6) 04/09/2019

				request.getSession().removeAttribute("LSTMARCASMODIFICADAS");
			}
			m_form(request, thisAction);
			return new BigDecimal(0);

		} catch (Exception e) {
			logger.error("Error en el mtodo Axisper026Service.m_grabarRegimen", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
		// this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
	}

}
