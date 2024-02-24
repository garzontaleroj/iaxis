package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Connection;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FONDOS;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import oracle.sql.ARRAY;
import oracle.sql.ArrayDescriptor;
import oracle.sql.STRUCT;
import oracle.sql.StructDescriptor;

/**
 * Axisfinv017Service.java 07/10/2015
 * 
 * @author <a href="lmurillo@csi-ti.com">Leonardo Murillo</a>
 * @since Java 5.0
 */
public class Axisfinv017Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * 
	 * @param request
	 */
	public void m_form(HttpServletRequest request) {
		logger.debug("Axisfinv007Service m_form");
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal PCEMPRES = usuario.getCempres();
			BigDecimal PCCODFON = null;
			String PTFONCMP = null;
			BigDecimal PCMONEDA = null;
			BigDecimal PCMANAGER = null;
			BigDecimal PCDIVIDEND = null;

			if (formdata.get("paginar") == null) {
				request.getSession().removeAttribute("axisfinv017_fondos");
				PAC_IAX_FONDOS pacIaxFondos = new PAC_IAX_FONDOS(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
				Map retMap = pacIaxFondos.ejecutaPAC_IAX_FONDOS__F_BUSCAR_FONDOS(PCEMPRES, PCCODFON, PTFONCMP, PCMONEDA,
						PCMANAGER, PCDIVIDEND);
				List<HashMap> cursor = (ArrayList) tratarRETURNyMENSAJES(request, retMap, false);
				request.getSession().setAttribute("axisfinv017_fondos", cursor);

				List<HashMap> T_IAX_INFO = new ArrayList<HashMap>();

				if (cursor != null) {
					for (HashMap registro : cursor) {
						HashMap OB_IAX_INFO = new HashMap();
						OB_IAX_INFO.put("SELECCIONADO", "0");
						OB_IAX_INFO.put("NOMBRE_COLUMNA", registro.get("CCODFON"));
						OB_IAX_INFO.put("VALOR_COLUMNA", registro.get("TFONCMP"));
						OB_IAX_INFO.put("TIPO_COLUMNA", "");
						T_IAX_INFO.add(OB_IAX_INFO);
					}
				}

				request.getSession().setAttribute("T_IAX_INFO", T_IAX_INFO);
				System.out.println("RETORNO T_IAX_INFO ===============> " + T_IAX_INFO);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisfinv017Service - m�todo m_form", e);
			AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
	}

	public boolean m_ejecutar(HttpServletRequest request) {
		System.out.println("m_ejecutar ..............................................");

		List<HashMap> T_IAX_INFO = new ArrayList<HashMap>();

		// 1. Tomar T_IAX_INFO de la sesi�n
		//
		Object t_iax_info = request.getSession().getAttribute("T_IAX_INFO");

		if (t_iax_info != null) {
			T_IAX_INFO = (ArrayList<HashMap>) t_iax_info;
		}

		// 2. Con cada selecci�n tomada de la web, actualizar variable para que tome los
		// valores seleccionados. selection contiene una cadena separa por punto y coma
		// as�:
		// 600-1;601-0; cada campo separado por gui�n contiene el c�digo y el valor de
		// selecci�n
		//
		String sel = request.getParameter("selection");
		List<String> fields = new ArrayList<String>();

		if (sel != null) {
			StringTokenizer st = new StringTokenizer(sel, ";");
			while (st.hasMoreElements()) {
				fields.add(st.nextElement().toString());
			}
		}

		int i = 0;
		for (String field : fields) {
			StringTokenizer st = new StringTokenizer(field, "-");
			String code = st.nextElement().toString();
			String check = st.nextElement().toString();

			for (HashMap OB_IAX_INFO : T_IAX_INFO) { // Ejemplo: code = 600, check = 0
				String nombreColumna = OB_IAX_INFO.get("NOMBRE_COLUMNA").toString();

				if (nombreColumna.equals(code)) {
					OB_IAX_INFO.put("SELECCIONADO", check);
					break;
				}
			}
		}

		// 3. Procesar los cambios en la base de datos.
		//
		try {
			Connection conn = (java.sql.Connection) request.getAttribute(Constantes.DB01CONN);

			StructDescriptor recDescriptor = StructDescriptor.createDescriptor("OB_IAX_INFO", conn);
			ArrayDescriptor arrayDescriptor = ArrayDescriptor.createDescriptor("T_IAX_INFO", conn);
			STRUCT[] array_of_records = new STRUCT[T_IAX_INFO.size()];

			i = 0;
			for (HashMap OB_IAX_INFO : T_IAX_INFO) {
				String nombre_columna = OB_IAX_INFO.get("NOMBRE_COLUMNA").toString();
				BigDecimal seleccionado = new BigDecimal(OB_IAX_INFO.get("SELECCIONADO").toString());

				array_of_records[i] = new STRUCT(recDescriptor, conn,
						new Object[] { nombre_columna, OB_IAX_INFO.get("VALOR_COLUMNA").toString(),
								OB_IAX_INFO.get("TIPO_COLUMNA").toString(), seleccionado });
				i = i + 1;
			}

			// Setear par�metros
			String MODO = request.getParameter("MODO");
			ARRAY LSTFONDOS = new ARRAY(arrayDescriptor, conn, array_of_records); // Cast Java array to Oracle array
			java.sql.Date FVALMOV = this.stringToSqlDate(this.getCampoTextual(request, "FVALMOV"));
			java.sql.Date FVIGENCIA = this.stringToSqlDate(this.getCampoTextual(request, "FVIGENCIA"));
			BigDecimal IIMPDIV = this.stringToBigDecimal(this.getCampoTextual(request, "IIMPDIV")); // Dividends per
																									// unit

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			System.out.println("MODO      =================================> " + MODO);
			System.out.println("FVIGENCIA =================================> " + FVIGENCIA);
			System.out.println("FVALMOV   =================================> " + FVALMOV);
			System.out.println("IIMPDIV   =================================> " + IIMPDIV);

			// Test information received.

			PAC_IAX_FONDOS pacIaxFondos = new PAC_IAX_FONDOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			Map retMap = pacIaxFondos.ejecutaPAC_IAX_FONDOS__F_ASIGN_DIVIDENDS(MODO, LSTFONDOS, FVIGENCIA, FVALMOV,
					IIMPDIV);

			BigDecimal retorno = (BigDecimal) tratarRETURNyMENSAJES(request, retMap);

			if (!retorno.equals(BigDecimal.ZERO)) {
				return false;
			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisfinv017Service - m_ejecutar", e);
			AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
					Constantes.MENSAJE_ERROR);
			return false;
		}

		request.getSession().setAttribute("T_IAX_INFO", T_IAX_INFO);

		return true;
	}
}
