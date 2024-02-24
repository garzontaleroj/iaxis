package axis.service.modal;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_MARCAS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisper046Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxismprxxxService;
import axis.util.Constantes;

public class Axisper046Service extends AxismprxxxService {
	static Log logger = LogFactory.getLog(Axisper046Service.class);

	public void m_init(HttpServletRequest request, Axisper046Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			this.initxxx(request, thisAction);
			if (!isEmpty(this.getCampoTextual(request, "AXISMPRXXX_EST"))) {
				String EST = this.getCampoTextual(request, "AXISMPRXXX_EST");
				request.getSession().setAttribute("AXISMPRXXX_EST", EST);
			}
			request.getSession().setAttribute("AXISMPRXXX", "axisper046");
		} catch (Exception e) {
			logger.error("Error en el servicio Axisper046Service - m�todo m_init", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}
	}

	public void m_form(HttpServletRequest request, Axisper046Action thisAction) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {
			BigDecimal SPERSON = null;
			BigDecimal CEMPRES = usuario.getCempres();
			String CMARCA = (String) request.getParameter("CMARCA");

			if (isEmpty(SPERSON) && !isEmpty(request.getParameter("SPERSON")))
				SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));

			formdata.put("SPERSON", SPERSON);
			PAC_IAX_MARCAS pac_iax_marcas = new PAC_IAX_MARCAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map marcaHistorico = pac_iax_marcas.ejecutaPAC_IAX_MARCAS__F_MARCAS_HISTORICO(CEMPRES, SPERSON, CMARCA);

			logger.debug(marcaHistorico);
			tratarRETURNyMENSAJES(request, marcaHistorico);
			if (!isEmpty(marcaHistorico)) {
				request.setAttribute("HISTORICO_MARCAS", (List) marcaHistorico.get("RETURN"));

			}

		}

		catch (Exception e) {
			logger.error("Error en el m�todo Axisper009Service.m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
		}

	}

}
