//Revision:# NNx6WkGadDDdCeF8z4hH1g== #
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

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_AVISOS;
import axis.jdbc.PAC_IAX_BASESTECNICAS;
import axis.jdbc.PAC_IAX_DATOSCTASEGURO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_RENTAS;
import axis.jdbc.PAC_IAX_UNDERWRITING;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.mvc.view.VisibleTag;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisctr031Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String CMODO = "";
	private boolean paso2 = false;

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las preguntas
	 * del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private List dbLeePreguntasRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO(NRIESGO);
		logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los anyos del
	 * combor de la secci�n de garant�as irregulares.
	 * 
	 * @param request
	 * @param usuario
	 * @param SPRODUC
	 * @return
	 * @throws Exception
	 */
	private List dbLeeAnyosRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__GET_ANYOSRENTASIRREG(SPRODUC);
		logger.debug("Map de preguntas riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las garantias
	 * del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private List dbLeeGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CPARTIDA) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS(NRIESGO, CPARTIDA);
		logger.debug("ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS return: " + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * Garantias determinadas por el producto seleccionado
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetGarantias(BigDecimal pNRIESGO, HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_GARANTIAS(pNRIESGO);
		logger.debug("Map de garantias riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * Rentas irregulares determinadas por la garantia CTIPO=11
	 * 
	 * @param reques
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private List dbLeeRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(NRIESGO);
		logger.debug("Map de garantias riesgo---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para generar los totales de
	 * las primas/garantias del riesgo seleccionado. �sto se calcula cuando
	 * tarificamos todos los capitales de cada una de las garantias.
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private Map dbPrimasGarantTot(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(NRIESGO);
		logger.debug("Map de Primas/Garantias/totales---------------------------------------->" + m);
		return (Map) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar los datos del
	 * riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetDatosRiesgos(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS();
		logger.debug("Map de Datos/Riesgos---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	public void m_actualizaDecuentosRecargosRiesgoGaran(HttpServletRequest request) {
		logger.debug("Axisctr031Service m_actualizaPdtocomRiesgoGaran");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal PDTOCOM = getCampoNumerico(request, "PDTOCOM");
			BigDecimal PRECARG = getCampoNumerico(request, "PRECARG");
			BigDecimal PDTOTEC = getCampoNumerico(request, "PDTOTEC");
			BigDecimal PRECCOM = getCampoNumerico(request, "PRECCOM");

			Map m = null;
			if (!isEmpty(PDTOCOM)) {
				m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_SET_PDTOCOM_RIESGOGARAN(SSEGURO, NRIESGO, PDTOCOM, null);
				ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			}

			if (!isEmpty(PRECARG)) {
				m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_SET_PRECARG_RIESGOGARAN(SSEGURO, NRIESGO, PRECARG, null);
				ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			}

			if (!isEmpty(PDTOTEC)) {
				m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_SET_PDTOTEC_RIESGOGARAN(SSEGURO, NRIESGO, PDTOTEC, null);
				ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			}

			if (!isEmpty(PRECCOM)) {
				m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_SET_PRECCOM_RIESGOGARAN(SSEGURO, NRIESGO, PRECCOM, null);
				ajax.guardarContenidoFinalAContenedorAjax(ajax.rellenarPlAContenedorAjax(m));
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_actualizaPdtocomRiesgoGaran", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr007Service.class));
		}
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista
	 * correspondiente a la forma de pago.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbFormaPago(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_FORMAPAGO();
		logger.debug("Map de Combo Forma de pago de garantias---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar la lista de
	 * revalorizaciones del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private List dbGetTipReval(HttpServletRequest request, BigDecimal SPRODUC, UsuarioBean usuario) throws Exception {

		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_TIPREVAL(SPRODUC);
		logger.debug("Map de Combo Tipo revalorizacion de garantias---------------------------------------->" + m);
		return (List) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar el tipo de
	 * revalorizaci�n cambiado.
	 * 
	 * @param usuario
	 * @param NRIESGO
	 * @param CREVALI
	 * @param PREVALI
	 * @param IREVALI
	 * @return
	 * @throws Exception
	 */
	private Map dbSetRevalRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CREVALI, BigDecimal PREVALI, BigDecimal IREVALI) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_REVALRIESGO(NRIESGO, CREVALI, PREVALI, IREVALI);
		logger.debug("HAN CAMBIADO LAS GARANTIAS?(0->ok/1->error)---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar las
	 * garantias del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @param CGARANT
	 * @param SELGAR
	 * @param ICAPITAL
	 * @param CREVALI
	 * @param PREVALI
	 * @param IREVALI
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGrabarGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CGARANT, BigDecimal SELGAR, BigDecimal ICAPITAL, BigDecimal CREVALI, BigDecimal PREVALI,
			BigDecimal IREVALI) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(NRIESGO, CGARANT, SELGAR, ICAPITAL, CREVALI, PREVALI,
						IREVALI);
		logger.debug("GARANTIA SELECCIONADA?(0->ok/1->error)---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para grabar los datos
	 * introducidos de renta irregular.
	 * 
	 * @param request
	 * @param usuario
	 * @param ANYO
	 * @param MES_1
	 * @param MES_2
	 * @param MES_3
	 * @param MES_4
	 * @param MES_5
	 * @param MES_6
	 * @param MES_7
	 * @param MES_8
	 * @param MES_9
	 * @param MES_10
	 * @param MES_11
	 * @param MES_12
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGrabarRentaIrregular(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal ANYO, BigDecimal MES_1, BigDecimal MES_2, BigDecimal MES_3, BigDecimal MES_4, BigDecimal MES_5,
			BigDecimal MES_6, BigDecimal MES_7, BigDecimal MES_8, BigDecimal MES_9, BigDecimal MES_10,
			BigDecimal MES_11, BigDecimal MES_12) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARRENTAIRREGULAR(NRIESGO, ANYO, MES_1, MES_2, MES_3, MES_4, MES_5,
						MES_6, MES_7, MES_8, MES_9, MES_10, MES_11, MES_12);
		logger.debug("GARANTIA SELECCIONADA?(0->ok/1->error)---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para grabar los datos
	 * introducidos de renta irregular.
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private void guardarRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {

		// Recogemos el n�mero de filas introducidas
		BigDecimal FILAS = getCampoNumerico(request, "FILAS_IRREGULARES");

		if (FILAS != null) {
			for (int i = 0; i < FILAS.intValue(); i++) {
				if (!isEmpty(getCampoNumerico(request, "ANYO_" + i))) {
					BigDecimal ANYO = getCampoNumerico(request, "ANYO_" + i);
					BigDecimal ENERO = getCampoNumerico(request, "ENERO_" + i);
					BigDecimal FEBRERO = getCampoNumerico(request, "FEBRERO_" + i);
					BigDecimal MARZO = getCampoNumerico(request, "MARZO_" + i);
					BigDecimal ABRIL = getCampoNumerico(request, "ABRIL_" + i);
					BigDecimal MAYO = getCampoNumerico(request, "MAYO_" + i);
					BigDecimal JUNIO = getCampoNumerico(request, "JUNIO_" + i);
					BigDecimal JULIO = getCampoNumerico(request, "JULIO_" + i);
					BigDecimal AGOSTO = getCampoNumerico(request, "AGOSTO_" + i);
					BigDecimal SEPTIEMBRE = getCampoNumerico(request, "SEPTIEMBRE_" + i);
					BigDecimal OCTUBRE = getCampoNumerico(request, "OCTUBRE_" + i);
					BigDecimal NOVIEMBRE = getCampoNumerico(request, "NOVIEMBRE_" + i);
					BigDecimal DICIEMBRE = getCampoNumerico(request, "DICIEMBRE_" + i);

					this.dbGrabarRentaIrregular(request, usuario, NRIESGO, ANYO, ENERO, FEBRERO, MARZO, ABRIL, MAYO,
							JUNIO, JULIO, AGOSTO, SEPTIEMBRE, OCTUBRE, NOVIEMBRE, DICIEMBRE);
				}
			}
		}

	}

	/**
	 * M�todo que llama a la funci�n pl para inicializar las rentas irregulares.
	 * Previo a la grabaci�n de Rentas irregulares
	 * 
	 * @param request
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbInicRentasIrregulares(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_INICRENTASIRREGULARES(NRIESGO);
		logger.debug("INICIALIZACION RENTAS IRREGULARES?(0->ok/1->error)---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para actualizar las
	 * preguntas del riesgo seleccionado.
	 * 
	 * @param usuario
	 * @param NRIESGO
	 * @param CPREGUN
	 * @param CRESPUE
	 * @return
	 * @throws Exception
	 */
	private Map dbGrabarPreguntasRiesgo(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO,
			BigDecimal CPREGUN, BigDecimal CRESPUE, String TRESPUE) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO(NRIESGO, CPREGUN, CRESPUE, TRESPUE);
		logger.debug("PREGUNTAS RIESGO GRABADAS?(0->ok/1->error)---------------------------------------->" + m);
		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para validar las
	 * preguntas/respuestas realizadas.
	 * 
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private Map dbValidaDPregGarant(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_VALIDACIONES__F_VALIDADPREGGARANTRIESGO(NRIESGO);
		logger.debug("VALIDACIONES PREGUNTAS GARANTIAS?(0->ok/1->error)---------------------------------------->" + m);

		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para tarificar el riesgo.
	 * Cuando a�adimos capitales a las garantias, tenemos la opc�on de tarificar
	 * para actualizar todo el riesgo (sus datos)
	 * 
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private Map dbTarificar(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_TARIFICAR(NRIESGO);
		logger.debug("TARIFICACION CORRECTA?(0->ok/1->error)---------------------------------------->" + m);

		return m;
	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar las primas de
	 * las garantias seleccionadas.
	 * 
	 * @param usuario
	 * @param NRIESGO
	 * @return
	 * @throws Exception
	 */
	private Map dbGetPrimasGarantTot(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO)
			throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_PRIMASGARANTTOT(NRIESGO);
		logger.debug("PRIMAS DE GARANTIA---------------------------------------->" + m);

		return m;
	}

	/**
	 * M�todo que carga el tipo de forma de pago seleccionado por el usuario
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGetGarForPag(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_GARFORPAG();
		logger.debug(map);
		return (BigDecimal) tratarRETURNyMENSAJES(request, map);
	}

	/**
	 * M�todo que modifica el tipo de forma de pago modificado por el usuario
	 * 
	 * @param usuario
	 * @param CFORPAG
	 * @return
	 * @throws Exception
	 */
	private Map dbSetGarForPag(HttpServletRequest request, UsuarioBean usuario, BigDecimal CFORPAG) throws Exception {
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_SET_GARFORPAG(CFORPAG);
		logger.debug(map);
		return map;
	}

	/**
	 * M�todo que se llama la primera vez que entramos en la p�gina
	 * 
	 * @param request
	 * @param usuario
	 * @return
	 * @throws Exception
	 */
	private BigDecimal dbGrabarObjetoDb(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABAROBJETODB();
		logger.debug("Map de grabarObjeto a DB---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	/**
	 * M�todo que obtiene las garantias de entrada a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasEntrada(List lista_garantias, BigDecimal tipoCalcul) {

		// CMODO =
		// String.valueOf(((Map)AbstractDispatchAction.topPila(request)).get("CMODO"));
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPO");
				BigDecimal cgarant = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"))
						.get("CGARANT");
				if (ctipo != null
						&& (ctipo.intValue() == 3 || (!CMODO.equals("SUPLEMENTO_281") && ctipo.intValue() == 4))) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"));
				}
			}
		}

		// Simular el capital a partir de la renta.
		if (new BigDecimal(2).equals(tipoCalcul)) {
			if (!isEmpty(lista_garantias)) {
				lista_aux = new ArrayList();
				for (int i = 0; i < lista_garantias.size(); i++) {
					BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i))
							.get("OB_IAXPAR_GARANTIAS")).get("CTIPO");
					BigDecimal cgarant = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i))
							.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
					if (ctipo != null && (ctipo.intValue() == 8)) {
						lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"));
					}
				}
			}
		}

		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSalida(List lista_garantias, BigDecimal tipoCalcul) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 5 || ctipo.intValue() == 8 || ctipo.intValue() == 9)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"));
				}
			}
		}

		// Simular el capital a partir de la renta.
		if (new BigDecimal(2).equals(tipoCalcul)) {
			if (!isEmpty(lista_garantias)) {
				lista_aux = new ArrayList();
				for (int i = 0; i < lista_garantias.size(); i++) {
					BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i))
							.get("OB_IAXPAR_GARANTIAS")).get("CTIPO");
					if (ctipo != null && (ctipo.intValue() == 3) || (ctipo.intValue() == 9)) {
						lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"));
					}
				}
			}
		}

		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�as
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasGenerales(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPO");
				if (ctipo.intValue() != 5 && ctipo.intValue() != 8 && ctipo.intValue() != 9 && ctipo.intValue() != 3
						&& ctipo.intValue() != 4) {
					lista_aux.add(((HashMap) lista_garantias.get(i)));
				}

			}
		}
		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de entrada a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecEntrada(List lista_garantias, BigDecimal tipoCalcul) {

		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 3 || ctipo.intValue() == 4)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		// Simular el capital a partir de la renta.
		if (new BigDecimal(2).equals(tipoCalcul)) {
			if (!isEmpty(lista_garantias)) {
				lista_aux = new ArrayList();
				for (int i = 0; i < lista_garantias.size(); i++) {
					BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
							.get("CTIPO");
					if (ctipo != null && (ctipo.intValue() == 8)) {
						lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
					}
				}
			}
		}

		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�a
	 * inicial
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecSalida(List lista_garantias, BigDecimal tipoCalcul) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo != null && (ctipo.intValue() == 5 || ctipo.intValue() == 8 || ctipo.intValue() == 9)) {
					lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
				}
			}
		}
		// Simular el capital a partir de la renta.
		if (new BigDecimal(2).equals(tipoCalcul)) {
			if (!isEmpty(lista_garantias)) {
				lista_aux = new ArrayList();
				for (int i = 0; i < lista_garantias.size(); i++) {
					BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
							.get("CTIPO");
					if (ctipo != null && (ctipo.intValue() == 3 || ctipo.intValue() == 9)) {
						lista_aux.add(((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"));
					}
				}
			}
		}

		return lista_aux;
	}

	/**
	 * M�todo que obtiene las garantias de salida a partir de la lista de garant�as
	 * 
	 * @param listaGarantias
	 * @return
	 * @throws Exception
	 */
	private List getGarantiasSelecGenerales(List lista_garantias) {
		Map aux = new HashMap();
		ArrayList lista_aux = new ArrayList();

		if (!isEmpty(lista_garantias)) {
			for (int i = 0; i < lista_garantias.size(); i++) {
				BigDecimal ctipo = (BigDecimal) ((Map) ((HashMap) lista_garantias.get(i)).get("OB_IAX_GARANTIAS"))
						.get("CTIPO");
				if (ctipo.intValue() != 5 && ctipo.intValue() != 8 && ctipo.intValue() != 9 && ctipo.intValue() != 3
						&& ctipo.intValue() != 4) {
					lista_aux.add(((HashMap) lista_garantias.get(i)));
				}

			}
		}
		return lista_aux;
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE INICIALIZACION
	 *******************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se llama al inicio de �ste flujo.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_init(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_init");
		try {

			m_form(request, thisAction);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr031Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En �l hacemos la carga inicial
	 * del riesgo con sus preguntas y garantias.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		try {

			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_BASESTECNICAS pac_iax_basestec = new PAC_IAX_BASESTECNICAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

			logger.debug("SSEGURO:" + SSEGURO);
			logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);

			formdata.put("SSEGURO", SSEGURO);
			formdata.put("SSEGURO_OUT", SSEGURO_OUT);
			request.getSession().setAttribute("SSEGURO", SSEGURO);
			if (SSEGURO_OUT == null) {
				SSEGURO_OUT = SSEGURO; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este valor
			} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO
			request.getSession().setAttribute("SSEGURO_OUT", SSEGURO_OUT);
			/* Datos fecha vencimiento Bug12485 */
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			logger.debug("NMOVMIMI : " + NMOVIMI);
			if (NMOVIMI == null) {
				NMOVIMI = new BigDecimal("1");
			}

			String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug("VMODO : " + VMODO);
			request.getSession().setAttribute("MODO", VMODO);

			// etm ini 21657
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
				if (mtuyo.get("PDTOCOM") != null) {
					formdata.put("PDTOCOM", mtuyo.get("PDTOCOM"));
				}

				if (mtuyo.get("PRECARG") != null) {
					formdata.put("PRECARG", mtuyo.get("PRECARG"));
				}

				if (mtuyo.get("PDTOTEC") != null) {
					formdata.put("PDTOTEC", mtuyo.get("PDTOTEC"));
				}

				if (mtuyo.get("PRECCOM") != null) {
					formdata.put("PRECCOM", mtuyo.get("PRECCOM"));
				}
			}
			// etm ini 21657

			initGarantias(request, usuario);
			initPreguntas(request, usuario);
			initParametrosGarantias(request, usuario);
			initParametrosRentasIrregulares(request, usuario);
			m_validar_reval(request, thisAction);

			BigDecimal num_garantias = obtiene_filas(request, usuario, SPRODUC);
			request.getSession().setAttribute("num_garantias", num_garantias);
			// BUG9426-12032009-XVM
			// m_validar_reval_pendientes(request);

			/* Inicializar los par�metros revalorizacion */

			if (SSEGURO_OUT == null) {
				SSEGURO_OUT = SSEGURO; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este valor
			} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO

			Map m = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA("EST", SSEGURO);
			// Map revalorizacion = (Map)tratarRETURNyMENSAJES(request,m);
			BigDecimal PREVALI = (BigDecimal) m.get("PREVALI");
			BigDecimal CREVALI = (BigDecimal) m.get("PCREVALI");
			if (CREVALI != null) {
				request.getSession().setAttribute("axisctr_CREVALI", CREVALI);
			}
			if (PREVALI != null) {
				Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_SET_REVALRIESGO(NRIESGO, CREVALI, PREVALI, null);
				request.getSession().setAttribute("axisctr_PREVALI", PREVALI);
			}

			/* Fin inicializar parametros revalorizacion */

			m_recuperarMeses(request);

			// RKV - Bug 9416
			if (VisibleTag.esComponenteVisible(request, "axisctr031", "DSP_MODELOSINV"))
				m_recuperarModelosInversion(request);

			/* Datos gesti�n */

			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
			Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map);
			logger.debug(datosGestion);
			request.setAttribute("CFORPAGREN", datosGestion.get("CFORPAGREN"));
			request.setAttribute("CMONPOL", datosGestion.get("CMONPOL"));
			request.setAttribute("TMONPOL", datosGestion.get("TMONPOL"));

			// Bug 20995 - RSC - 06/03/2012
			request.setAttribute("POLISSA_INI", datosGestion.get("POLISSA_INI"));
			// Fin Bug 20995

			PAC_IAX_LISTVALORES pac_iax_listvalores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			map = pac_iax_listvalores.ejecutaPAC_IAX_LISTVALORES__F_GET_MONEDAS();
			List monedas = (List) tratarRETURNyMENSAJES(request, map);
			request.setAttribute("monedasPago", monedas);
			monedas = null;
			logger.debug("monedas -----------------> " + map);

			Map bases = pac_iax_basestec.ejecutaPAC_IAX_BASESTECNICAS__F_OBTBASESTECNICAS(SSEGURO_OUT, NRIESGO, NMOVIMI,
					"EST");
			Map datos_base = (Map) tratarRETURNyMENSAJES(request, bases);
			logger.debug(datos_base);
			request.setAttribute("DATOSBASICOS", datos_base);

			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

			}
			// etm ini 21657
			mtuyo = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			logger.debug("*********************etm***************" + mtuyo);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
				request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
				request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
				request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
				request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));
			}
			// etm fin 21657
			BigDecimal pnescena = null;
			Object obj = request.getSession().getAttribute("PNESCENA");
			request.getSession().setAttribute("SSEGURO_OUT", SSEGURO_OUT);
			request.setAttribute("SSEGURO_OUT", SSEGURO_OUT);
			try {
				this.cargarcombos(request, thisAction, SSEGURO_OUT);
			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
			if (obj != null) {
				pnescena = (BigDecimal) obj;
				request.setAttribute("PNESCENA", pnescena);
				recupera_evoluprov(request, SSEGURO_OUT, pnescena);
			} else {
				if (SSEGURO_OUT != null) {
					PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map mesce = pac_iax_obtenerdatos
							.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(SSEGURO_OUT, "EST");
					BigDecimal minesce = (BigDecimal) tratarRETURNyMENSAJES(request, mesce, false);
					formdata.put("NESCENA", minesce);
				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	/*
	 * Funci�n que llena en un string todos los parametros de la request
	 */
	private String getInfoStringConcatenar_031(HttpServletRequest request) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			StringBuffer cadena = new StringBuffer();
			request.setAttribute("CIDIOMA", usuario.getCidioma());

			Enumeration enumera = request.getParameterNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName -->" + fieldName);
				String[] todos_valores = request.getParameterValues(fieldName);
				for (int i = 0; i < todos_valores.length; i++) {
					String fieldValue = todos_valores[i];

					if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
							&& !fieldValue.equals("undefined")) {
						if (i == 0)
							cadena.append("#").append(fieldName).append(";").append(fieldValue);
						else
							cadena.append("#").append(fieldName).append("__").append(i).append(";").append(fieldValue);
					}

				}
			}

			enumera = request.getAttributeNames();

			while (enumera.hasMoreElements()) {
				String fieldName = (String) enumera.nextElement();
				logger.debug("fieldName attributos -->" + fieldName);
				String fieldValue = String.valueOf(request.getAttribute(fieldName));
				logger.debug("fieldValue attributos -->" + fieldValue);
				if (!fieldName.equals("TTITOBS") && !fieldName.equals("TOBS") && !isEmpty(fieldValue)
						&& !fieldValue.equals("undefined") && fieldName.indexOf("javax") == -1
						&& fieldName.indexOf("org") == -1 && fieldName.indexOf("__mensajes") == -1
						&& fieldName.indexOf("__forwardaction") == -1 && fieldName.indexOf("__formdata") == -1
						&& fieldName.indexOf("__configform") == -1 && fieldName.indexOf("DEPENDENCIAS") == -1
						&& fieldName.indexOf("DISPLAY_ITEMS") == -1 && fieldName.indexOf("DEPENDENCIA0") == -1) {
					cadena.append("#").append(fieldName).append(";").append(fieldValue);
				}
			}

			cadena.append("#").append("CIDIOMA").append(";").append(usuario.getCidioma());
			String c = cadena.append("#").toString();

			if (c.length() > 1999)
				c = c.substring(0, 1999);

			return c;
		} catch (Exception e) {
			logger.debug("error : " + e.getMessage());
			return "";
		}
	}

	/*
	 * Funci�n para cargar los avisos
	 */

	private HashMap f_Get_Avisos_031(HttpServletRequest request, String whoami) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			PAC_IAX_AVISOS pacIaxAviso = new PAC_IAX_AVISOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String CMODO = (String) AbstractDispatchAction.topPila(request, "CMODO");
			BigDecimal CRAMO = (BigDecimal) AbstractDispatchAction.topPila(request, "CRAMO");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			String pparams = this.getInfoStringConcatenar_031(request);
			logger.debug("1->" + pparams);

			HashMap m = pacIaxAviso.ejecutaPAC_IAX_AVISOS__F_GET_AVISOS(whoami.toUpperCase(), CMODO, CRAMO, SPRODUC,
					pparams);

			logger.debug(m);
			/*
			 * BigDecimal pRETURN = (BigDecimal)this.tratarRETURNyMENSAJES(request,m);
			 * 
			 * if (pRETURN != null) {
			 * request.setAttribute("PLSTAVISOS",m.get("PLSTAVISOS")); }
			 */
			return m;

		} catch (Exception e) {
			logger.error("avisos para f_Get_Avisos_031 " + whoami + " ha causado un error", e);
			return null;
		}

	}

	/**
	 * M�todo que se encaraga de cargar los datos de cada garantia. S�lo cargamos
	 * los datos que se piden en el displayTag asociado en el jsp.
	 * 
	 * @param idGarant
	 * @param DESCRIPCION
	 * @param ICAPITAL
	 * @param IPRIANU
	 * @param IPRITAR
	 * @param COBLIGA
	 * @param CTIPCAP
	 * @param CTIPGAR
	 * @return
	 */
	private Map rellenaMapGarantias(BigDecimal idGarant, String DESCRIPCION, BigDecimal ICAPITAL, BigDecimal IPRIANU,
			BigDecimal IPRITAR, BigDecimal COBLIGA, BigDecimal CTIPCAP, BigDecimal CTIPGAR, BigDecimal CTARMAN,
			BigDecimal CMONCAP, String CMONINT, String TMONCAP) {
		Map m = new HashMap();
		BigDecimal id = idGarant;

		m.put("CGARANT", id);
		m.put("DESCRIPCION", DESCRIPCION);
		m.put("ICAPITAL", ICAPITAL);
		m.put("IPRITAR", IPRITAR);
		m.put("IPRIANU", IPRIANU);
		m.put("COBLIGA", COBLIGA);
		m.put("CTIPCAP", CTIPCAP);
		m.put("CTIPGAR", CTIPGAR);
		m.put("CTARMAN", CTARMAN);
		m.put("CMONCAP", CMONCAP);
		m.put("CMONCAPINT", CMONINT);
		m.put("TMONCAP", TMONCAP);
		return m;
	}

	/**
	 * M�todo que realiza la carga de garantias sean cuales sean los cambios
	 * producidos en el flujo.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void initGarantias(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		// TODO: Es la forma correcta de recuperar NRIESGO?

		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (request.getSession().getAttribute("NRIESGO") != null) {
			NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
		}

		// Recuperaci�n riesgo
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
		logger.debug(map);
		map = (Map) tratarRETURNyMENSAJES(request, map);
		formdata.put("OB_IAX_RIESGOS", map);

		// TODO ->garantias (carga inicial segun n�mero de riesgo recuperado de la
		// p�gina 5). Por terminar
		List garantiasProducto = this.dbGetGarantias(NRIESGO, request, usuario);
		List garantiasSeleccionadas = this.dbLeeGarantias(request, usuario, NRIESGO, new BigDecimal(0));
		logger.debug("LISTA_GARANTIAS******************" + garantiasSeleccionadas);

		if (garantiasSeleccionadas != null) {
			HashMap mapa_gar = (HashMap) garantiasSeleccionadas.get(0);
			if (mapa_gar != null) {
				HashMap NMOVIMI_map = (HashMap) mapa_gar.get("OB_IAX_GARANTIAS");
				if (NMOVIMI_map != null) {
					BigDecimal NMOVIMI = (BigDecimal) NMOVIMI_map.get("NMOVIMI");
					AbstractDispatchAction.topPila(request, "NMOVIMI", NMOVIMI);
				}
			}

		}
		if (!isEmpty(garantiasProducto)) {
			request.getSession().setAttribute("axisctr_garantias",
					((garantiasSeleccionadas == null) ? new ArrayList() : garantiasSeleccionadas));
			// Gestionem les partides
			managePartidas(request);
		} else {
			logger.error("NO SE CARGA NINGUNA GARANTIA DE F_GETGARANTIA");
		}
		this.CMODO = String.valueOf(((Map) AbstractDispatchAction.topPila(request)).get("CMODO"));

		// A partir de las garant�asProducto obtenemos las garantias de entrada (CTIPO =
		// 3/4)
		// y las de tipo salida (CTIPO = 5/8/9)

		BigDecimal tipoCalcul = getCampoNumerico(request, "TIPOCALCUL");

		// Garantias Iniciales
		List garantiasProductoEntrada = this.getGarantiasEntrada(garantiasProducto, tipoCalcul);
		logger.debug("garantiasProductoEntrada ::" + garantiasProductoEntrada);
		List garantiasProductoSalida = this.getGarantiasSalida(garantiasProducto, tipoCalcul);
		// Limpiamos las garnat�as de los grupos anteriores
		garantiasProducto = this.getGarantiasGenerales(garantiasProducto);

		/// guardar informacion de meses en la BBDD//////////////
		/// previamente inicializamos la informacion de la BBDD
		// this.dbInicRentasIrregulares(request, usuario, NRIESGO);
		// this.guardarRentasIrregulares(request, usuario, NRIESGO);
		List rentasIrregulares = this.dbLeeRentasIrregulares(request, usuario, NRIESGO);

		// GarantiasSeleccionadas

		List garantiasSeleccionadasEntrada = this.getGarantiasSelecEntrada(garantiasSeleccionadas, tipoCalcul);
		List garantiasSeleccionadasSalida = this.getGarantiasSelecSalida(garantiasSeleccionadas, tipoCalcul);
		garantiasSeleccionadas = this.getGarantiasSelecGenerales(garantiasSeleccionadas);

		// Bug 21907 - RSC - 04/06/2012
		m_actualizaDecuentosRecargosRiesgoGaran(request);
		// Fin Bug 21907

		// Rentas irregulares
		// List rentasIrregulares =
		// this.dbLeeRentasIrregulares(request, usuario, NRIESGO);
		// Comentat per provar si es comporta Correctament.Bug 11440.NMM.i.
		// if (request.getSession().getAttribute("axisctr031_primera_vez")==null) {
		this.dbGrabarObjetoDb(request, usuario);
		// request.getSession().setAttribute("axisctr031_primera_vez", "0");
		// this.dbInicRentasIrregulares(request, usuario, NRIESGO);
		/*
		 * } else { logger.debug("No es la primera vez"); }
		 */
		// Bug 11440.NMM.f.
		Map m1 = new HashMap();
		List li = new ArrayList();

		boolean gar_11 = false;

		if (!isEmpty(garantiasProducto)) {
			for (int a = 0; a < garantiasProducto.size(); a++) {
				boolean coincide = false;

				BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a))
						.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
				String DESCRIPCION = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("DESCRIPCION");
				BigDecimal CTIPCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPCAP");
				BigDecimal CTIPGAR = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CTIPGAR");
				List LISTACAPITALES = (List) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("LISTACAPITALES");
				BigDecimal CMONCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CMONCAP");
				String CMONINT = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("CMONCAPINT");
				String TMONCAP = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
						.get("TMONCAP");

				if (!isEmpty(garantiasSeleccionadas)) {
					for (int i = 0; i < garantiasSeleccionadas.size(); i++) {
						BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(i))
								.get("OB_IAX_GARANTIAS")).get("CGARANT");
						BigDecimal CTIPO_11 = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(a))
								.get("OB_IAX_GARANTIAS")).get("CTIPO");

						Map seleccionado = getObjetoDeLista(garantiasSeleccionadas, CGARANT_SELECT.toString(),
								"CGARANT", "OB_IAX_GARANTIAS");

						BigDecimal IPRIANU = null;
						BigDecimal IPRITAR = null;
						BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL")))
								? (BigDecimal) seleccionado.get("ICAPITAL")
								: null);
						BigDecimal COBLIGA = ((!isEmpty(seleccionado.get("COBLIGA")))
								? (BigDecimal) seleccionado.get("COBLIGA")
								: null);
						BigDecimal CTARMAN = ((!isEmpty(seleccionado.get("CTARMAN")))
								? (BigDecimal) seleccionado.get("CTARMAN")
								: null);

						logger.debug("CTARMAN-->" + seleccionado);

						Map PRIMAS = (Map) seleccionado.get("PRIMAS");
						if (!isEmpty(PRIMAS)) {
							IPRIANU = ((!isEmpty(PRIMAS.get("IPRIANU"))) ? (BigDecimal) PRIMAS.get("IPRIANU")
									: IPRIANU);
							IPRITAR = ((!isEmpty(PRIMAS.get("IPRITAR"))) ? (BigDecimal) PRIMAS.get("IPRITAR")
									: IPRITAR);
						}

						if (CGARANT_SELECT.equals(CGARANT_PRODUCTO)) {
							coincide = true;
							m1 = rellenaMapGarantias(CGARANT_SELECT, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION),
									ICAPITAL, IPRIANU, IPRITAR, COBLIGA, CTIPCAP, CTIPGAR, CTARMAN, CMONCAP, CMONINT,
									TMONCAP);
							// SI CTIPCAP = 7, tenemos una lista de capitales en vez de un capital
							if (CTIPO_11.intValue() == 11 && COBLIGA.intValue() == 1) {
								gar_11 = true;
							}

							if (new BigDecimal(7).equals(CTIPCAP)) {

								BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
								Map mm = new PAC_IAX_OBTENERDATOS(
										(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
										.ejecutaPAC_IAX_OBTENERDATOS__F_LEECAPITAL(SSEGURO, NRIESGO, CGARANT_SELECT,
												new String("REAL"));
								BigDecimal icapital = (BigDecimal) tratarRETURNyMENSAJES(request, mm);

								List li2 = new ArrayList();
								// bug 18342 - AMC
								if (!isEmpty(icapital)) {

									HashMap OB_IAXPAR_GARANPROCAP = new HashMap();
									HashMap capital = new HashMap();

									capital.put("NORDEN", LISTACAPITALES.size() + 1);
									capital.put("ICAPITAL", icapital);
									capital.put("CDEFECTO", 0);
									OB_IAXPAR_GARANPROCAP.put("OB_IAXPAR_GARANPROCAP", capital);

									int cont;
									HashMap m = new HashMap();
									HashMap m2 = new HashMap();
									boolean encontrado = false;

									for (cont = 0; cont < LISTACAPITALES.size(); cont++) {
										m = (HashMap) LISTACAPITALES.get(cont);

										if (cont + 1 < LISTACAPITALES.size()) {
											m2 = (HashMap) LISTACAPITALES.get(cont + 1);
											HashMap vv1 = (HashMap) m.get("OB_IAXPAR_GARANPROCAP");
											HashMap vv2 = (HashMap) m2.get("OB_IAXPAR_GARANPROCAP");
											float v1 = ((BigDecimal) vv1.get("ICAPITAL")).floatValue();
											float v2 = ((BigDecimal) vv2.get("ICAPITAL")).floatValue();
											float cap = icapital.floatValue();

											if (cap < v1 && !encontrado) {
												li2.add(OB_IAXPAR_GARANPROCAP);
												li2.add(m);
												encontrado = true;
											} else if (v1 < cap && cap < v2) {
												li2.add(m);
												li2.add(OB_IAXPAR_GARANPROCAP);
												encontrado = true;
											} else {
												if (v1 == cap)
													encontrado = true;

												li2.add(m);
											}
										} else {
											HashMap vv1 = (HashMap) m.get("OB_IAXPAR_GARANPROCAP");
											float v1 = ((BigDecimal) vv1.get("ICAPITAL")).floatValue();
											float cap = icapital.floatValue();
											if (v1 < cap && !encontrado) {
												li2.add(m);
												li2.add(OB_IAXPAR_GARANPROCAP);
											} else if (cap < v1 && !encontrado) {
												li2.add(OB_IAXPAR_GARANPROCAP);
												li2.add(m);
											} else
												li2.add(m);
										}
									}
								}

								if (!isEmpty(icapital)) {
									// Ponemos todos los elementos de la lista a NORDEN = 0
									for (int z = 0; z < li2.size(); z++) {
										HashMap po1 = (HashMap) li2.get(z);
										HashMap po2 = (HashMap) po1.get("OB_IAXPAR_GARANPROCAP");
										if (((BigDecimal) po2.get("ICAPITAL")).floatValue() == icapital.floatValue()) {
											po2.put("CDEFECTO", 1);
										} else {
											po2.put("CDEFECTO", 0);
										}

										po1.put("OB_IAXPAR_GARANPROCAP", po2);
										li2.set(z, po1);
									}

									m1.put("LISTACAPITALES", li2);
								} else {
									m1.put("LISTACAPITALES", LISTACAPITALES);
								}
							}
							break;
						}

						// Comprobamos si la garantia 11 ha sido seleciconada, para mostrar la
						// informaci�n de rentas irregulares

					}
				}

				if (!coincide) {
					m1 = rellenaMapGarantias(CGARANT_PRODUCTO, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION), null,
							null, null, null, null, null, null, null, null, null);
					// m1.put("selectedGarantia", "0");
				}

				Map m2 = new HashMap();
				m2.put("OB_IAX_GARANTIAS", m1);

				int ctip = Integer.parseInt(String.valueOf(m1.get("CTIPGAR")));

				if (!isEmpty(ctip) && ctip != 8 & ctip != 7) {
					li.add(m2);
				}

			}
			logger.debug("LISTA FINAL->" + li);
			request.getSession().setAttribute("axisctr_garantias", ((li == null) ? new ArrayList() : li));
		} else {
			logger.debug("NO SE CARGA NINGUNA GARANTIA DE F_GETGARANTIA - todas las garantias son de ahorro");
			request.getSession().setAttribute("axisctr_garantias", new ArrayList());
		}

		// Cargar garantias adicionales
		Map m1e = new HashMap();
		List lie = new ArrayList();
		if (!isEmpty(garantiasProductoEntrada)) {
			for (int b = 0; b < garantiasProductoEntrada.size(); b++) {
				// Recorremos una a una el vestor con el total de las garantias de tipo 3/4
				BigDecimal b_ctipo = (BigDecimal) (((HashMap) garantiasProductoEntrada.get(b))).get("CTIPO");
				BigDecimal b_cgarant = (BigDecimal) (((HashMap) garantiasProductoEntrada.get(b))).get("CGARANT");

				if (!isEmpty(garantiasSeleccionadasEntrada)) {
					for (int c = 0; c < garantiasSeleccionadasEntrada.size(); c++) {
						// Recorremos una a una el vector con las garantias seleccionadas de tipo 3/4
						BigDecimal c_ctipo = (BigDecimal) (((HashMap) garantiasSeleccionadasEntrada.get(b)))
								.get("CTIPO");
						BigDecimal c_cgarant = (BigDecimal) (((HashMap) garantiasSeleccionadasEntrada.get(b)))
								.get("CGARANT");
						BigDecimal c_icapital = (BigDecimal) (((HashMap) garantiasSeleccionadasEntrada.get(b)))
								.get("ICAPITAL");
						if (c_icapital != null) {
							if (b_cgarant.intValue() == c_cgarant.intValue()) { // &&c_icapital.longValue()>=0) {
								// Actualizamos el valor del capital en el array list de las
								// garantiasProductoEntrada
								((HashMap) garantiasProductoEntrada.get(b)).put("ICAPITAL", c_icapital);
							}
						}
					}
				}
			}
		}

		Map m1s = new HashMap();
		List lis = new ArrayList();
		if (!isEmpty(garantiasProductoSalida)) {
			for (int b = 0; b < garantiasProductoSalida.size(); b++) {
				// Recorremos una a una el vestor con el total de las garantias de tipo 3/4
				BigDecimal b_ctipo = (BigDecimal) (((HashMap) garantiasProductoSalida.get(b))).get("CTIPO");
				BigDecimal b_cgarant = (BigDecimal) (((HashMap) garantiasProductoSalida.get(b))).get("CGARANT");

				if (!isEmpty(garantiasSeleccionadasSalida)) {
					for (int c = 0; c < garantiasSeleccionadasSalida.size(); c++) {
						// Recorremos una a una el vector con las garantias seleccionadas de tipo 3/4
						BigDecimal c_ctipo = (BigDecimal) (((HashMap) garantiasSeleccionadasSalida.get(b)))
								.get("CTIPO");
						BigDecimal c_cgarant = (BigDecimal) (((HashMap) garantiasSeleccionadasSalida.get(b)))
								.get("CGARANT");
						BigDecimal c_icapital = (BigDecimal) (((HashMap) garantiasSeleccionadasSalida.get(b)))
								.get("ICAPITAL");
						if (c_icapital != null) {
							if (b_cgarant.intValue() == c_cgarant.intValue()) { // &&c_icapital.longValue()>=0) {
								// Actualizamos el valor del capital en el array list de las
								// garantiasProductoSALIDA
								((HashMap) garantiasProductoSalida.get(b)).put("ICAPITAL", c_icapital);
							}
						}
					}
				}
			}
		}

		// request.getSession().setAttribute("axisctr_garantias", ((garantias == null)?
		// new ArrayList():garantias));
		request.getSession().setAttribute("axisctr_garantias_producto",
				((garantiasProducto == null) ? new ArrayList() : garantiasProducto));
		request.getSession().setAttribute("axisctr_garantias_seleccionadas",
				((garantiasSeleccionadas == null) ? new ArrayList() : garantiasSeleccionadas));

		request.getSession().setAttribute("garantiasEntrada",
				((garantiasProductoEntrada == null) ? new ArrayList() : garantiasProductoEntrada));

		request.getSession().setAttribute("garantiasSalida",
				((garantiasProductoSalida == null) ? new ArrayList() : garantiasProductoSalida));

		request.getSession().setAttribute("rentasIrregulares",
				((rentasIrregulares == null) ? new ArrayList() : rentasIrregulares));

		request.getSession().setAttribute("garantia_11", (gar_11) ? "1" : "0");

		Map primasTotales = new HashMap();

		primasTotales = this.dbPrimasGarantTot(request, usuario, NRIESGO);

		List axisctr_primasTotales = new ArrayList();
		if (!isEmpty(primasTotales))
			axisctr_primasTotales.add(primasTotales);
		request.getSession().setAttribute("axisctr_primasTotales", axisctr_primasTotales);
		BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		if (SSEGURO_OUT == null)
			SSEGURO_OUT = SSEGURO;
		Map listValores = new HashMap();
		if (SSEGURO_OUT != null) {
			PAC_IAX_OBTENERDATOS pac_axis_listValores = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map2 = pac_axis_listValores.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(SSEGURO_OUT, "EST");
			listValores.put("tipEscen", (List) tratarRETURNyMENSAJES(request, map2, false));
			formdata.put("listValores", listValores);
		}
		formdata.put("SSEGURO_OUT", SSEGURO_OUT);
	}

	/**
	 * M�todo que realiza la carga de preguntas/respuestas sean cuales sean los
	 * cambios producidos en el flujo.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void initPreguntas(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		/* Init preguntas riesgo */
		// TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (request.getSession().getAttribute("NRIESGO") != null) {
			NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
		}

		List preguntas = this.dbGetDatosRiesgos(request, usuario); // PAC_IAXPAR_PRODUCTOS__F_GET_DATOSRIESGOS()
		List respuestas = this.dbLeePreguntasRiesgo(request, usuario, NRIESGO); // PAC_IAX_PRODUCCION__F_LEEPREGUNTASRIESGO()

		// Mezclar las respuestas con las preguntas iniciales
		inicializarPreguntas(preguntas, respuestas);

		logger.debug("Preguntas/Respuestas despu�s del merge -> " + preguntas);
		List pregQuestSalut = null;
		List pregDespeses = null;
		if (!isEmpty(preguntas)) {
			this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
			HashMap configForm = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
			preguntas = existePregConNDecimales(preguntas, configForm);

			pregQuestSalut = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_QUESTIONARI_SALUT);
			pregDespeses = dividirPregPerCtipgru(preguntas, Constantes.CTIPGRU_DESPESES);
		}
		// Guardar lista de preguntas para mostrarla en la pantalla mediante un
		// DisplayTag
		// es guarden els diferents grups de preguntes
		request.getSession().setAttribute("axisctr_pregQuestSalut",
				((pregQuestSalut == null) ? new ArrayList() : pregQuestSalut));
		request.getSession().setAttribute("axisctr_pregDespeses",
				((pregDespeses == null) ? new ArrayList() : pregDespeses));
		request.getSession().setAttribute("axisctr_preguntasRiesgo",
				((preguntas == null) ? new ArrayList() : preguntas));
		IsJoinLife(request, usuario);

	}

	private void IsJoinLife(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		Map map2 = new PAC_IAX_PARAM((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N(new String("VAL_ISJOIN"), usuario.getCempres());
		if (map2.get("RETURN") != null && map2.get("RETURN").equals(new BigDecimal(1))) {
			request.getSession().setAttribute("valjoinlife", 1);
		}

		if (map2.get("RETURN") != null && map2.get("RETURN").equals(new BigDecimal(1))) {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEPREGUNTASPOLIZA();
			List<HashMap> pregs = (List) tratarRETURNyMENSAJES(request, map);
			request.getSession().setAttribute("isjoinlife", 1);
			if (!isEmpty(pregs)) {
				for (HashMap OB_IAX_PREGUNTAS : pregs) {
					HashMap pregpol = (HashMap) OB_IAX_PREGUNTAS.get("OB_IAX_PREGUNTAS");
					BigDecimal CPREGUN = new BigDecimal(String.valueOf(pregpol.get("CPREGUN")));
					String CRESPUE = String.valueOf(pregpol.get("CRESPUE"));
					if (!isEmpty(CRESPUE) && (CPREGUN.intValue() == 1959 || CPREGUN.intValue() == 1960)) {
						request.getSession().setAttribute("isjoinlife", CRESPUE);
					}
				}
			}
		}
	}

	private List existePregConNDecimales(List<HashMap> preguntas, HashMap configForm) {
		logger.debug("configForm:" + configForm);
		for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CPREGUN = new BigDecimal(String.valueOf(preg.get("CPREGUN")));
			logger.debug(configForm.get("axisctr031__PREGUNTA_DECIMALES_" + CPREGUN + "__alt"));
			try {
				if (!isEmpty(configForm.get("axisctr031__PREGUNTA_DECIMALES_" + CPREGUN + "__alt"))) {
					// axisctr031__PREGUNTA_DECIMALES_241__alt
					if (CPREGUN.intValue() == new BigDecimal(
							String.valueOf((configForm.get("axisctr031__PREGUNTA_DECIMALES_" + CPREGUN + "__alt"))))
							.intValue()) {
						preg.put("NO_VALIDA", new BigDecimal(1));
						preg.put("PATTERN_DECIMAL", "###,##0.###################");

					} else {
						preg.put("PATTERN_DECIMAL", "###.##");
					}
				} else
					preg.put("PATTERN_DECIMAL", "###.##");
			} catch (Exception e) {
				preg.put("PATTERN_DECIMAL", "###.##");
				logger.debug("e.getMessage():" + e.getMessage());
			}
		}

		return preguntas;

	}

	private List dividirPregPerCtipgru(List<HashMap> preguntas, int CTIPGRU) {

		List pregdividides = new ArrayList();
		List<HashMap> objBorrar = new ArrayList();

		for (HashMap OB_IAXPAR_PREGUNTAS : preguntas) {
			HashMap preg = (HashMap) OB_IAXPAR_PREGUNTAS.get("OB_IAXPAR_PREGUNTAS");
			BigDecimal CTIPGRUobj = (BigDecimal) preg.get("CTIPGRU");
			logger.debug("CTIPGRUobj-->" + CTIPGRUobj);
			if (!isEmpty(CTIPGRUobj) && CTIPGRUobj.intValue() == CTIPGRU) {
				pregdividides.add(OB_IAXPAR_PREGUNTAS);
				objBorrar.add(OB_IAXPAR_PREGUNTAS);
			}

			logger.debug("PREG-->" + OB_IAXPAR_PREGUNTAS);
		}

		for (HashMap OB_IAXPAR_PREGUNTAS : objBorrar) {
			preguntas.remove(OB_IAXPAR_PREGUNTAS);
		}

		return pregdividides;

	}

	/**
	 * M�todo inicializa la revalorizacion
	 */
	private void initReval(HttpServletRequest request) throws Exception {

	}

	/**
	 * M�todo que realiza la carga de datos del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void initParametrosGarantias(HttpServletRequest request, UsuarioBean usuario) throws Exception {
		// PAR�METROS GARANT�AS: FORMA DE PAGO, TIPOS Y VALOR REVALORIZACION ELEGIBLES
		Map parametrosGarantias = new HashMap();

		List formaPago = this.dbFormaPago(request, usuario);
		parametrosGarantias.put("formaPago", formaPago);

		BigDecimal CFORPAG = this.dbGetGarForPag(request, usuario);

		parametrosGarantias.put("CFORPAG", CFORPAG);
		BigDecimal SPRODUC = this.getCampoNumerico(request, "SPRODUC");
		if (!isEmpty(AbstractDispatchAction.topPila(request, "SPRODUC")) && isEmpty(SPRODUC))
			SPRODUC = new BigDecimal(String.valueOf(AbstractDispatchAction.topPila(request, "SPRODUC")));
		logger.debug("SPPPRODUC-->" + SPRODUC);
		List tipoReval = this.dbGetTipReval(request, SPRODUC, usuario);
		parametrosGarantias.put("tipoRevalorizacion", tipoReval);

		request.getSession().setAttribute("axisctr_parametrosGarantias", parametrosGarantias);
	}

	/**
	 * M�todo que realiza la carga de datos del riesgo seleccionado.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void initParametrosRentasIrregulares(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
		List lista_anyos = this.dbLeeAnyosRentasIrregulares(request, usuario, SPRODUC);
		request.getSession().setAttribute("axisctr_lista_anyos", lista_anyos);
	}

	/*********************************************************************************************************************/
	/***********************************************
	 * M�TODOS DE ACTUALIZACION
	 ********************************************/
	/*********************************************************************************************************************/

	/**
	 * M�todo que se encarga de realizar todos los cambios asociados a la
	 * actualizaci�n de la revalorizaci�n seleccionada.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_actualizaRevalorizacionGarantias(HttpServletRequest request) {
		logger.debug("Axisctr031Service m_actualizaRevalorizacionGarantias");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}
			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI");
			// De momento le pasamos null a IREVALI (porcentage del valorRevalorizacion)
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = null;
			String listaSelectedGarantias = getCampoTextual(request, "listaSelectedGarantias");

			// if (!isEmpty(CREVALI) && !isEmpty(listaSelectedGarantias)) {
			if (!isEmpty(CREVALI)) {
				Map plSetValRiesgo = this.dbSetRevalRiesgo(request, usuario, NRIESGO, CREVALI, PREVALI, IREVALI);
				BigDecimal setValRiesgo = (BigDecimal) ajax.rellenarPlAContenedorAjax(plSetValRiesgo);
				if (setValRiesgo.equals(new BigDecimal(0))) {
					logger.debug("REVALORIZACION ACTUALIZADA");
					// Para procesar en el jsp (callback de javascript)
					// ajaxContainer =
					// guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_OK);
					ajax.guardarInformacionAContenedorAjax(
							Traductor.traducir(getLocale(request).toString(), "1000059"));

					initGarantias(request, usuario);
					initPreguntas(request, usuario);
					initParametrosGarantias(request, usuario);

					m_recuperarMeses(request);

					// Guardamos los valores para siempre
					request.getSession().setAttribute("axisctr_PREVALI", ((PREVALI == null) ? "" : PREVALI.toString()));
					request.getSession().setAttribute("axisctr_CREVALI", CREVALI);

					request.getSession().setAttribute("hayCambios", "true");
				}
			} else {
				// Si no hay ning�na garantia seleccionada en lista, no se aplica ning�n cambio
				// a la lista
				logger.debug("ERROR: NO HAY GARANTIAS SELECCIONADAS");

				// Para procesar en el jsp (callback de javascript)
				// ajaxContainer =
				// guardarContenidoFinalAContenedorAjax(Constantes.OPERACION_AJAX_ERROR);
				ajax.guardarErrorAContenedorAjax(Traductor.traducir(getLocale(request).toString(), "1000060"));

				if (request.getSession().getAttribute("axisctr_PREVALI") != null)
					request.getSession().removeAttribute("axisctr_PREVALI");
				if (request.getSession().getAttribute("axisctr_CREVALI") != null)
					request.getSession().removeAttribute("axisctr_CREVALI");
			}

			// BUG9426-12032009-XVM
			// m_validar_reval_pendientes(request);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr031Service - m�todo m_actualizaRevalorizacionGarantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	/**
	 * M�todo que se encarga de realizar el cambio de tipo de pago.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_cambiar_forma_pago(HttpServletRequest request) {
		logger.debug("Axisctr031Service m_ajax_cambiar_forma_pago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			Map plSetGarForPag = this.dbSetGarForPag(request, usuario, CFORPAG);
			ajax.rellenarPlAContenedorAjax(plSetGarForPag);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr031Service - m�todo m_actualizaRevalorizacionGarantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	/**
	 * M�todo que efect�a cambios al seleccionar una garantia de la lista de
	 * garantias.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_selected_garantia(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug(
				"-------------------------------------------------------------------------------------->Axisctr031Service m_selected_garantia");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}

			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
			m_actualizaDecuentosRecargosRiesgoGaran(request);

			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SELGAR = getCampoNumerico(request, "SELGAR");
			BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITALH");
			BigDecimal CREVALI = getHiddenCampoNumerico(request, "CREVALI");
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");

			BigDecimal EXISTE_51 = getCampoNumerico(request, "EXISTE_51");
			BigDecimal EXISTE_48 = getCampoNumerico(request, "EXISTE_48");
			BigDecimal EXISTE_52 = getCampoNumerico(request, "EXISTE_52");

			logger.debug(
					"##################52#51#48##############################" + EXISTE_52 + EXISTE_51 + EXISTE_48);
			if (CGARANT != null && CGARANT.equals(new BigDecimal("48"))) { // BUG 24067#c142570 -- ecg --20130412 probar
																			// si con el control de no-null lo hacemos
																			// funcionar
				// if (CGARANT.equals(new BigDecimal("48"))) { ecg
				if (EXISTE_52 != null && EXISTE_52.equals(new BigDecimal("1"))) {// BUG 24067#c142570 -- ecg --20130412
																					// probar si con el control de
																					// no-null lo hacemos funcionar
					// if (EXISTE_52.equals(new BigDecimal("1"))) ecg
					BigDecimal CGARANT2 = new BigDecimal("52");
					BigDecimal SELGAR2 = new BigDecimal("1");
					BigDecimal ICAPITAL2 = new BigDecimal("0");
					// BigDecimal CREVALI2=new BigDecimal("0");
					// BigDecimal PREVALI2=new BigDecimal("0");
					// BigDecimal IREVALI2=new BigDecimal("0");

					// m_guardaMeses(request);
					if (request.getSession().getAttribute("axisctr_garantias") != null) {
						BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT2, SELGAR2,
								ICAPITAL2, CREVALI, PREVALI, IREVALI);
						if (RETURN.equals(new BigDecimal("0"))) {
							logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
							initGarantias(request, usuario);
							initPreguntas(request, usuario);
							initParametrosGarantias(request, usuario);
							request.getSession().setAttribute("hayCambios", "true");
						} else {
							initPreguntas(request, usuario);
						} // Tratado el error en el pl
					}
				}
				if (EXISTE_51 != null && EXISTE_51.equals(new BigDecimal("1"))) {// BUG 24067#c142570 -- ecg --20130412
																					// probar si con el control de
																					// no-null lo hacemos funcionar
					// if (EXISTE_51.equals(new BigDecimal("1"))) ecg
					BigDecimal CGARANT2 = new BigDecimal("51");
					BigDecimal SELGAR2 = new BigDecimal("1");
					BigDecimal ICAPITAL2 = new BigDecimal("0");
					// BigDecimal CREVALI2=new BigDecimal("0");
					// BigDecimal PREVALI2=new BigDecimal("0");
					// BigDecimal IREVALI2=new BigDecimal("0");

					// m_guardaMeses(request);
					if (request.getSession().getAttribute("axisctr_garantias") != null) {
						BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT2, SELGAR2,
								ICAPITAL2, CREVALI, PREVALI, IREVALI);
						if (RETURN.equals(new BigDecimal("0"))) {
							logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
							initGarantias(request, usuario);
							initPreguntas(request, usuario);
							initParametrosGarantias(request, usuario);
							request.getSession().setAttribute("hayCambios", "true");
						} else {
							initPreguntas(request, usuario);
						} // Tratado el error en el pl
					}
				}
			}
			if (CGARANT != null && CGARANT.equals(new BigDecimal("52"))) {// BUG 24067#c142570 -- ecg --20130412 probar
																			// si con el control de no-null lo hacemos
																			// funcionar
				// if (CGARANT.equals(new BigDecimal("52"))) { ecg
				if (EXISTE_48 != null && EXISTE_48.equals(new BigDecimal("1"))) {// BUG 24067#c142570 -- ecg --20130412
																					// probar si con el control de
																					// no-null lo hacemos funcionar
					// if (EXISTE_48.equals(new BigDecimal("1"))) ecg
					BigDecimal CGARANT2 = new BigDecimal("48");
					BigDecimal SELGAR2 = new BigDecimal("1");
					BigDecimal ICAPITAL2 = new BigDecimal("0");
					// BigDecimal CREVALI2=new BigDecimal("0");
					// BigDecimal PREVALI2=new BigDecimal("0");
					// BigDecimal IREVALI2=new BigDecimal("0");

					// m_guardaMeses(request);
					if (request.getSession().getAttribute("axisctr_garantias") != null) {
						BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT2, SELGAR2,
								ICAPITAL2, CREVALI, PREVALI, IREVALI);
						if (RETURN.equals(new BigDecimal("0"))) {
							logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
							initGarantias(request, usuario);
							initPreguntas(request, usuario);
							initParametrosGarantias(request, usuario);
							request.getSession().setAttribute("hayCambios", "true");
						} else {
							initPreguntas(request, usuario);
						} // Tratado el error en el pl
					}
				}
				if (EXISTE_51 != null && EXISTE_51.equals(new BigDecimal("1"))) {// BUG 24067#c142570 -- ecg --20130412
																					// probar si con el control de
																					// no-null lo hacemos funcionar
					// if (EXISTE_51.equals(new BigDecimal("1"))) ecg
					BigDecimal CGARANT2 = new BigDecimal("51");
					BigDecimal SELGAR2 = new BigDecimal("1");
					BigDecimal ICAPITAL2 = new BigDecimal("0");
					// BigDecimal CREVALI2=new BigDecimal("0");
					// BigDecimal PREVALI2=new BigDecimal("0");
					// BigDecimal IREVALI2=new BigDecimal("0");

					// m_guardaMeses(request);
					if (request.getSession().getAttribute("axisctr_garantias") != null) {
						BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT2, SELGAR2,
								ICAPITAL2, CREVALI, PREVALI, IREVALI);
						if (RETURN.equals(new BigDecimal("0"))) {
							logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
							initGarantias(request, usuario);
							initPreguntas(request, usuario);
							initParametrosGarantias(request, usuario);
							request.getSession().setAttribute("hayCambios", "true");
						} else {
							initPreguntas(request, usuario);
						} // Tratado el error en el pl
					}
				}

			}

			m_guardaMeses(request);
			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI);
				if (RETURN.equals(new BigDecimal("0"))) {
					logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
					initGarantias(request, usuario);
					initPreguntas(request, usuario);
					initParametrosGarantias(request, usuario);
					request.getSession().setAttribute("hayCambios", "true");
				} else {
					initPreguntas(request, usuario);
				} // Tratado el error en el pl
			}

			m_recuperarMeses(request);

			// RKV - Bug 9416
			if (VisibleTag.esComponenteVisible(request, "axisctr031", "DSP_MODELOSINV"))
				m_recuperarModelosInversion(request);

			/* Datos gesti�n */
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
			Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map);
			logger.debug(datosGestion);
			request.setAttribute("CFORPAGREN", datosGestion.get("CFORPAGREN"));

			// Bug 20995 - RSC - 06/03/2012
			request.setAttribute("POLISSA_INI", datosGestion.get("POLISSA_INI"));
			// Fin Bug 20995

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

			}

			// etm ini 21657
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			logger.debug("SSEGURO-axisctr031 de la pila->" + SSEGURO);
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
				request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
				request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
				request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
				request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));

			}
			// etm ini 21657
		}

		catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_ajax_selected_garantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	public void m_selected_garantia2(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug(
				"-------------------------------------------------------------------------------------->Axisctr031Service m_selected_garantia2");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {

			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}

			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
			m_actualizaDecuentosRecargosRiesgoGaran(request);

			// BUG9426-12032009-XVM
			// this.m_validar_reval_pendientes(request);

			BigDecimal CGARANT = new BigDecimal("48");
			BigDecimal SELGAR = new BigDecimal("1");
			BigDecimal ICAPITAL = new BigDecimal("0");

			/*
			 * BigDecimal CREVALI=new BigDecimal("0"); BigDecimal PREVALI=new
			 * BigDecimal("0"); BigDecimal IREVALI=new BigDecimal("0");
			 */

			BigDecimal CREVALI = getHiddenCampoNumerico(request, "CREVALI");
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");

			m_guardaMeses(request);
			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI);
				if (RETURN.equals(new BigDecimal("0"))) {
					logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
					initGarantias(request, usuario);
					initPreguntas(request, usuario);
					initParametrosGarantias(request, usuario);
					request.getSession().setAttribute("hayCambios", "true");
				} else {
					initPreguntas(request, usuario);
				} // Tratado el error en el pl
			}

			// m_recuperarMeses(request);
			CGARANT = new BigDecimal("52");
			SELGAR = new BigDecimal("1");
			ICAPITAL = new BigDecimal("0");

			// m_guardaMeses(request);
			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI);
				if (RETURN.equals(new BigDecimal("0"))) {
					logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
					initGarantias(request, usuario);
					initPreguntas(request, usuario);
					initParametrosGarantias(request, usuario);
					request.getSession().setAttribute("hayCambios", "true");
				} else {
					initPreguntas(request, usuario);
				} // Tratado el error en el pl
			}

			// m_recuperarMeses(request);
			CGARANT = new BigDecimal("51");
			SELGAR = new BigDecimal("1");
			ICAPITAL = new BigDecimal("0");

			// m_guardaMeses(request);
			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI);
				if (RETURN.equals(new BigDecimal("0"))) {
					logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
					initGarantias(request, usuario);
					initPreguntas(request, usuario);
					initParametrosGarantias(request, usuario);
					request.getSession().setAttribute("hayCambios", "true");
				} else {
					initPreguntas(request, usuario);
				} // Tratado el error en el pl
			}

			m_recuperarMeses(request);

			// RKV - Bug 9416
			if (VisibleTag.esComponenteVisible(request, "axisctr031", "DSP_MODELOSINV"))
				m_recuperarModelosInversion(request);

			/* Datos gesti�n */
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map map = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_LEEDATOSGESTION();
			Map datosGestion = (Map) tratarRETURNyMENSAJES(request, map);
			logger.debug(datosGestion);
			request.setAttribute("CFORPAGREN", datosGestion.get("CFORPAGREN"));

			// Bug 20995 - RSC - 06/03/2012
			request.setAttribute("POLISSA_INI", datosGestion.get("POLISSA_INI"));
			// Fin Bug 20995

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));

			}

			// etm ini 21657
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			logger.debug("SSEGURO-axisctr031 de la pila->" + SSEGURO);
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
				request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
				request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
				request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
				request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));

			}

			// etm ini 21657
		}

		catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_ajax_selected_garantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	/**
	 * M�todo que se encarga (at�micamente) de la actualizaci�n de
	 * preguntas/respuestas asociadas al riesgo.
	 * 
	 * @param request
	 * @param NRIESGO
	 * @throws Exception
	 */
	private void guardaPreguntasYRespuestasToDB(HttpServletRequest request, BigDecimal NRIESGO) throws Exception {

		List preguntas = (List) request.getSession().getAttribute("axisctr_preguntasRiesgo");
		logger.debug("preguntas sin merged grabades ::" + preguntas);
		List<HashMap> pregQuestSalut = (List) request.getSession().getAttribute("axisctr_pregQuestSalut");
		List<HashMap> pregDespeses = (List) request.getSession().getAttribute("axisctr_pregDespeses");

		if (!isEmpty(pregQuestSalut))
			for (HashMap OB_IAXPAR_PREGUNTAS : pregQuestSalut) {
				preguntas.add(OB_IAXPAR_PREGUNTAS);
			}

		if (!isEmpty(pregDespeses))
			for (HashMap OB_IAXPAR_PREGUNTAS : pregDespeses) {
				preguntas.add(OB_IAXPAR_PREGUNTAS);
			}
		logger.debug("preguntas merged grabades ::" + preguntas);
		if (!isEmpty(preguntas))
			guardarPreguntas(request, preguntas, "PAC_IAX_PRODUCCION__F_GRABARPREGUNTASRIESGO",
					new Object[] { NRIESGO });

	}

	/**
	 * M�todo que se encarga de guardar las preguntas y respuestas de la pantalla
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_guarda_preguntas_respuestas(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_guarda_preguntas_respuestas");
		try {
			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}
			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_guarda_preguntas_respuestas", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}
	}

	public void m_tarifar_paso2(HttpServletRequest request, AbstractDispatchAction thisAction) {
		try {
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}
			Map mapRespuesta = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF02(NRIESGO);
			paso2 = true;
			m_tarifar(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_tarifar_2", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	/*
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 */
	public void m_tarifar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_ajax_tarifar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

		String validar_tarificacion = "false";

		BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
		BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

		logger.debug("SSEGURO:" + SSEGURO);
		logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);

		if (SSEGURO_OUT == null) {
			SSEGURO_OUT = SSEGURO; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este valor
		} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO

		/* Datos fecha vencimiento Bug12485 */
		BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
		logger.debug("NMOVMIMI : " + NMOVIMI);
		if (NMOVIMI == null) {
			NMOVIMI = new BigDecimal("1");
		}

		// TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (request.getSession().getAttribute("NRIESGO") != null) {
			NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
		}

		request.getSession().setAttribute("tar_axctr031", "1");

		Map listaPrimas = new HashMap();

		boolean preguntasGuardadas = false;
		boolean noHayRespuestas = false;
		try {

			BigDecimal TIPOCALCUL = getCampoNumerico(request, "TIPOCALCUL");
			PAC_IAX_RENTAS pac_iax_rentas = new PAC_IAX_RENTAS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mactualiza = pac_iax_rentas.ejecutaPAC_IAX_RENTAS__F_ACTUALIZA_TIPOCALCUL(SSEGURO_OUT, TIPOCALCUL);

			SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			PAC_IAXPAR_PRODUCTOS pac_iaxpar_productos = new PAC_IAXPAR_PRODUCTOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			Map mmoneda = (Map) pac_iaxpar_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_MONEDAPRODUCTO(SPRODUC);

			logger.debug(mmoneda);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mmoneda))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mmoneda)).intValue() == 0) {
				request.setAttribute("CMONPROD", mmoneda.get("PCMONEDA"));
				request.setAttribute("TMONPROD", mmoneda.get("PTMONEDA"));
				request.setAttribute("CMONPRODINT", mmoneda.get("PCMONINT"));
			}

			request.setAttribute("NMOVIMI", NMOVIMI);
			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("SSEGURO_OUT", SSEGURO_OUT);
			request.setAttribute("SPRODUC", SPRODUC);
			request.setAttribute("NRIESGO", NRIESGO);

			/// guardar informacion de meses en la BBDD//////////////
			/// previamente inicializamos la informacion de la BBDD
			this.dbInicRentasIrregulares(request, usuario, NRIESGO);
			this.guardarRentasIrregulares(request, usuario, NRIESGO);
			List rentasIrregulares = this.dbLeeRentasIrregulares(request, usuario, NRIESGO);

			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);

			// Bug 21907 - RSC - 04/06/2012
			m_actualizaDecuentosRecargosRiesgoGaran(request);
			Map mtuyo = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_GET_DTOREC_RIESGO("EST", SSEGURO, NRIESGO);
			if (!isEmpty(this.tratarRETURNyMENSAJES(request, mtuyo))
					&& ((BigDecimal) this.tratarRETURNyMENSAJES(request, mtuyo)).intValue() == 0) {
				request.setAttribute("PDTOCOM", mtuyo.get("PDTOCOM"));
				request.setAttribute("PRECARG", mtuyo.get("PRECARG"));
				request.setAttribute("PDTOTEC", mtuyo.get("PDTOTEC"));
				request.setAttribute("PRECCOM", mtuyo.get("PRECCOM"));
			}
			// Fin Bug 21907

			this.dbGrabarObjetoDb(request, usuario);

			HashMap m = this.f_Get_Avisos_031(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			// Map map0 = new
			// PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("WS_UNDERWRITING",SPRODUC);
			// BigDecimal underwriting0 = (BigDecimal) tratarRETURNyMENSAJES (request,
			// map0);

			Map map = new PAC_IAX_UNDERWRITING((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_UNDERWRITING__F_ACTIVO_UNDW_IF01(SPRODUC, "EST");
			BigDecimal underwriting = (BigDecimal) tratarRETURNyMENSAJES(request, map);

			if ((!isEmpty(underwriting) && underwriting.intValue() == 1) && !paso2) {
				// TODO CRIDAR PACKAGE UNDERWRITTING IF01 (CRIDA CONNECT ..... )
				Map mapRespuesta = new PAC_IAX_PRODUCCION(
						(java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
						.ejecutaPAC_IAX_PRODUCCION__F_CONNECT_UNDW_IF01(NRIESGO);
				logger.debug("MAPA RESPUESTA IF01: " + mapRespuesta);
				// mapRespuesta.put("url", "http://portal.srvcsi.com");

				if (mapRespuesta.get("RETURN") == null || ((Map) mapRespuesta.get("RETURN")).get("SCREENURL") == null) {
					// throw new Exception("No se ha encontrado SCREENURL");
					logger.error("Error en el servicio Axisctr031Service - m�todo m_tarifar");
					thisAction.guardarMensaje(request, "9908332", new Object[] {}, Constantes.MENSAJE_ERROR);
				} else {
					request.setAttribute("IF01URL", ((Map) mapRespuesta.get("RETURN")).get("SCREENURL"));
				}
			} else {
				paso2 = false;
				if (pRETURN != null && pRETURN.intValue() != 1) {

					m_guardaMeses(request);
					// initPreguntas(request, usuario);

					// request.getSession().setAttribute("axisctr_preguntasRiesgo", preguntas);
					request.getSession().setAttribute("hayCambios", "true");
					/* TODO:Revisar por qu� estaba asterisacado el trozo de c�digo */
					Map plValidaDPregGarantReturn = this.dbValidaDPregGarant(request, usuario, NRIESGO);
					BigDecimal validaDPregGarantReturn = (BigDecimal) tratarRETURNyMENSAJES(request,
							plValidaDPregGarantReturn);

					if (validaDPregGarantReturn.equals(new BigDecimal(0))) {
						/* TODO:Revisar por qu� estaba asterisacado el trozo de c�digo */

						Map plTarificarReturn = this.dbTarificar(request, usuario, NRIESGO);
						BigDecimal tarificarReturn = (BigDecimal) tratarRETURNyMENSAJES(request, plTarificarReturn);
						if (tarificarReturn.equals(new BigDecimal(0))) {
							validar_tarificacion = "true";
							request.getSession().setAttribute("hayCambios", "false");
						} else {
							request.getSession().setAttribute("tar_axctr031", "0");
						}
						Map plGetPrimasGarantTot = this.dbGetPrimasGarantTot(request, usuario, NRIESGO);
						listaPrimas = (Map) tratarRETURNyMENSAJES(request, plGetPrimasGarantTot);
					}

					// Bug 14598
					java.util.Date d = new java.util.Date();
					java.sql.Date sqlDate = new java.sql.Date(d.getTime());

					logger.debug("SSEGURO:" + SSEGURO);
					logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);

					if (SSEGURO_OUT == null) {
						SSEGURO_OUT = SSEGURO; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este
												// valor
					} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO

					PAC_IAX_DATOSCTASEGURO pacIaxDatosCtaSeguro = new PAC_IAX_DATOSCTASEGURO(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
					Map datoseconomicos = pacIaxDatosCtaSeguro.ejecutaPAC_IAX_DATOSCTASEGURO__F_OBTDATECON(SSEGURO_OUT,
							NRIESGO, sqlDate, "EST");
					Map OB_IAX_DATOSECONOMICOS = (Map) tratarRETURNyMENSAJES(request, datoseconomicos);
					request.getSession().setAttribute("datoseco", OB_IAX_DATOSECONOMICOS);
					// Fin Bug 14598

					request.getSession().setAttribute("rentasIrregulares",
							((rentasIrregulares == null) ? new ArrayList() : rentasIrregulares));
				}
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_ajax_selected_garantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.getSession().setAttribute("validar_tarificacion", validar_tarificacion);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la siguiente pantalla a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_siguiente(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_siguiente");

		m_actualizaDecuentosRecargosRiesgoGaran(request);
		m_guardaEstadoPantalla(request, thisAction, Constantes.SIGUIENTE);

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param requestequest
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_anterior");

		m_guarda_preguntas_respuestas(request, thisAction);
		m_actualizaDecuentosRecargosRiesgoGaran(request);

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			// Al informar preguntas y darle atrasno se bajan las preguntas a las EST, eso
			// hace
			// que salten validaciones incorrectamente.
			this.dbGrabarObjetoDb(request, usuario);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_anterior", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		m_guardaEstadoPantalla(request, thisAction, Constantes.ANTERIOR);
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));

	}

	/**
	 * Valida mediante la llamada a la funci�n que se bloquee o no el combo de
	 * revalorizaciones en la pantalla 031
	 * 
	 * @param request
	 * @param thisAction
	 */
	public

			void m_validar_reval(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_validar_reval");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAXPAR_PRODUCTOS__F_PERMITIRREVALPROD();
			BigDecimal valor_reval = (BigDecimal) tratarRETURNyMENSAJES(request, m);

			if (valor_reval.intValue() == 0) {
				request.getSession().setAttribute("valida_reval", "0");
			} else {
				request.getSession().setAttribute("valida_reval", "1");
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_valida_reval", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	// BUG9426-12032009-XVM
	/*
	 * private void m_validar_reval_pendientes(HttpServletRequest request) throws
	 * Exception{ logger.debug("Axisctr031Service m_validar_reval");
	 * 
	 * /* recuperar el SSEGURO
	 */
	// Map PILA = (HashMap)request.getSession().getAttribute("PASSTOPPILA");
	// BigDecimal SSEGURO = (BigDecimal)AbstractDispatchAction.topPila(request,
	// "SSEGURO");

	/* Recuperar el riesgo */
	/*
	 * BigDecimal NRIESGO = (BigDecimal)AbstractDispatchAction.topPila(request,
	 * "NRIESGO");
	 * 
	 * if (request.getSession().getAttribute("NRIESGO") != null) { NRIESGO =
	 * stringToBigDecimal((String)request.getSession().getAttribute("NRIESGO")); }
	 * 
	 * UsuarioBean usuario =
	 * (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO); Map m =
	 * new PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_GAR_REVAL_DIF(SSEGURO, NRIESGO);
	 * BigDecimal valor_reval = (BigDecimal)tratarRETURNyMENSAJES(request, m);
	 * 
	 * if (valor_reval.intValue() == 0) {
	 * request.getSession().setAttribute("rev_pendientes", 0); } else {
	 * request.getSession().setAttribute("rev_pendientes", 1); }
	 * 
	 * 
	 * }
	 */

	/**
	 * M�todo que se encarga de la validaci�n de la pantalla cuando queremos ir a la
	 * pantalla axisctr008.
	 * 
	 * @param request
	 * @param thisAction
	 */
	private void m_guardaEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal direccion) {
		logger.debug("Axisctr031Service m_guardaEstadoPantalla");
		try {
			// LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n
			String CFORM = getCampoTextual(request, "FORM_ACT");
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			BigDecimal NESCENA = (BigDecimal) AbstractDispatchAction.topPila(request, "NESCENA");
			logger.debug("SSEGURO:" + SSEGURO);
			logger.debug("SSEGURO_OUT:" + SSEGURO_OUT);

			if (SSEGURO_OUT == null) {
				SSEGURO_OUT = SSEGURO; // Cuando se hacen suplementos SSEGURO_OUT!=null y debe informarse este valor
			} // Si se realiza un alta SSEGURO_OUT = null y debe informarse el SSEGURO

			/* Datos fecha vencimiento Bug12485 */
			BigDecimal NMOVIMI = (BigDecimal) AbstractDispatchAction.topPila(request, "NMOVIMI");
			logger.debug("NMOVMIMI : " + NMOVIMI);
			if (NMOVIMI == null) {
				NMOVIMI = new BigDecimal("1");
			}

			request.setAttribute("NMOVIMI", NMOVIMI);
			request.setAttribute("SSEGURO", SSEGURO);
			request.setAttribute("SSEGURO_OUT", SSEGURO_OUT);
			request.setAttribute("SPRODUC", SPRODUC);
			request.setAttribute("NRIESGO", NRIESGO);
			request.getSession().setAttribute("NESCENA", NESCENA);
			HashMap m = this.f_Get_Avisos_031(request, this.whoami(this));
			BigDecimal pRETURN = (BigDecimal) this.tratarRETURNyMENSAJES(request, m);
			request.setAttribute("PLSTAVISOS", m.get("PLSTAVISOS"));

			if (pRETURN != null && pRETURN.intValue() != 1) {
				request.setAttribute(Constantes.FORWARDACTION,
						AxisCodeWizard.findForward(request, direccion, CFORM, null));
				request.getSession().setAttribute("tar_axctr031", "0");
				// LCF

				String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
				if (VMODO.equals("SIMULACION")) {
					request.getSession().setAttribute("axisctr031_primera_vez", null);
				}

				m_guardaMeses(request);
			}
			/*
			 * if (Boolean.valueOf(true).equals(request.getAttribute("multiPantalla"))) //
			 * TODO: De momento, forwards hard-codeados
			 * request.setAttribute(Constantes.FORWARDACTION, direccion ==
			 * Constantes.ANTERIOR ? new ActionForward("/axis_axisctr027.do?operation=form")
			 * : new ActionForward("/axis_axisctr009.do?operation=form" ));
			 */

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_guardaEstadoPantalla", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	/**
	 * M�todo que se encarga de guardar las pagas extraordinarias
	 * 
	 * @param request
	 * @param thisAction
	 */
	private void m_guardaMeses(HttpServletRequest request) {

		logger.debug("Axisctr031Service m_guardaMeses");
		logger.debug("request.getAttribute PCMODEXTRA :: " + getCampoNumerico(request, "PCMODEXTRA"));
		try {
			if (!isEmpty(getCampoNumerico(request, "PCMODEXTRA"))) {
				BigDecimal PCMODEXTRA = getCampoNumerico(request, "PCMODEXTRA");
				if (PCMODEXTRA.intValue() != 0) {
					UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
					// LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n
					BigDecimal CPAGA1 = getCampoNumerico(request, "CPAGA1");
					BigDecimal CPAGA2 = getCampoNumerico(request, "CPAGA2");
					BigDecimal CPAGA3 = getCampoNumerico(request, "CPAGA3");
					BigDecimal CPAGA4 = getCampoNumerico(request, "CPAGA4");
					BigDecimal CPAGA5 = getCampoNumerico(request, "CPAGA5");
					BigDecimal CPAGA6 = getCampoNumerico(request, "CPAGA6");
					BigDecimal CPAGA7 = getCampoNumerico(request, "CPAGA7");
					BigDecimal CPAGA8 = getCampoNumerico(request, "CPAGA8");
					BigDecimal CPAGA9 = getCampoNumerico(request, "CPAGA9");
					BigDecimal CPAGA10 = getCampoNumerico(request, "CPAGA10");
					BigDecimal CPAGA11 = getCampoNumerico(request, "CPAGA11");
					BigDecimal CPAGA12 = getCampoNumerico(request, "CPAGA12");
					logger.debug("----------- Comprovem valors mesos amb paga ------->");

					logger.debug("request.getAttribute :: " + request.getAttribute("CPAGA1"));
					logger.debug("request.getParametre :: " + request.getParameter("CPAGA1"));
					logger.debug(CPAGA1);

					Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_SET_NMESEXTRA(CPAGA1, CPAGA2, CPAGA3, CPAGA4, CPAGA5, CPAGA6,
									CPAGA7, CPAGA8, CPAGA9, CPAGA10, CPAGA11, CPAGA12);
					// NMM.26.02.2013.i.24735: (POSDE600)-Desarrollo-GAPS-Mesadas Extras dif. propia

					BigDecimal IMP_CPAGA1 = getCampoNumerico(request, "IMP_CPAGA1");
					BigDecimal IMP_CPAGA2 = getCampoNumerico(request, "IMP_CPAGA2");
					BigDecimal IMP_CPAGA3 = getCampoNumerico(request, "IMP_CPAGA3");
					BigDecimal IMP_CPAGA4 = getCampoNumerico(request, "IMP_CPAGA4");
					BigDecimal IMP_CPAGA5 = getCampoNumerico(request, "IMP_CPAGA5");
					BigDecimal IMP_CPAGA6 = getCampoNumerico(request, "IMP_CPAGA6");
					BigDecimal IMP_CPAGA7 = getCampoNumerico(request, "IMP_CPAGA7");
					BigDecimal IMP_CPAGA8 = getCampoNumerico(request, "IMP_CPAGA8");
					BigDecimal IMP_CPAGA9 = getCampoNumerico(request, "IMP_CPAGA9");
					BigDecimal IMP_CPAGA10 = getCampoNumerico(request, "IMP_CPAGA10");
					BigDecimal IMP_CPAGA11 = getCampoNumerico(request, "IMP_CPAGA11");
					BigDecimal IMP_CPAGA12 = getCampoNumerico(request, "IMP_CPAGA12");

					logger.debug("----------- Valors IMPORTS mesos amb paga   ------->");
					logger.debug("request.getAttribute :: " + request.getAttribute("IMP_CPAGA1"));
					logger.debug("request.getParametre :: " + request.getParameter("IMP_CPAGA1"));
					logger.debug(IMP_CPAGA1);

					Map imp_m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
							.ejecutaPAC_IAX_PRODUCCION__F_SET_IMESEXTRA(IMP_CPAGA1, IMP_CPAGA2, IMP_CPAGA3, IMP_CPAGA4,
									IMP_CPAGA5, IMP_CPAGA6, IMP_CPAGA7, IMP_CPAGA8, IMP_CPAGA9, IMP_CPAGA10,
									IMP_CPAGA11, IMP_CPAGA12);
					// NMM.26.02.2013.i.24735

				}
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_guardaMeses", e);

		}
		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	/**
	 * M�todo que se encarga de recuperar las pagas extraordinarias
	 * 
	 * @param request
	 * @param thisAction
	 */
	private void m_recuperarMeses(HttpServletRequest request) {

		logger.debug("Axisctr031Service m_recuperarMeses");
		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			// LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n

			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");

			Map map;

			map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_GET_MESESEXTRA(SSEGURO);

			logger.debug(map);
			if (!isEmpty(map)) {
				request.setAttribute("NMESEXTRA", (Map) tratarRETURNyMENSAJES(request, map));
				request.setAttribute("PCMODEXTRA", map.get("PCMODEXTRA"));
			}
			// NMM.26.02.2013.i.24735: (POSDE600)-Desarrollo-GAPS-Mesadas Extras dif. propia
			// En la funci� pac_iax_produccion.f_get_mesesextra s'ha afegit una crida que
			// recupera els imports.

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_recuperarMeses", e);

		}

		this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
	}

	/**
	 * RKV - Bug 9416 M�todo que inicializa, para los productos Unit Linked, la
	 * lista de modelos de inversi�n y la lista de perfiles.
	 * 
	 * @param request
	 */
	private void m_recuperarModelosInversion(HttpServletRequest request) {
		logger.debug("Axisctr031Service m_recuperarModelosInversion");

		try {

			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			/* Lista de modelos de inversi�n */
			PAC_IAX_PRODUCCION pacIaxProduccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal NMODELO = this.getHiddenCampoNumerico(request, "NMODELO");

			Map map = pacIaxProduccion.ejecutaPAC_IAX_PRODUCCION__F_LEEMODELOINVERSIONFINV(NMODELO);
			logger.debug(map);

			Map returnMap = (Map) tratarRETURNyMENSAJES(request, map);

			if (!isEmpty(returnMap)) {
				// Guardar el modelo seleccionado en formdata, para marcarlo en pantalla
				formdata.put("NMODELO", returnMap.get("CMODINV"));
				// Guardar multiregistro de modelos
				request.setAttribute("MODINVFONDO", returnMap.get("MODINVFONDO"));
			}

			/* Listado de perfiles */
			PAC_IAX_LISTVALORES pacIaxListValores = new PAC_IAX_LISTVALORES(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

			if (!isEmpty(SPRODUC)) {
				map = pacIaxListValores.ejecutaPAC_IAX_LISTVALORES__F_GET_PERFILES(SPRODUC);

				logger.debug(map);
				request.setAttribute("LST_PERFILES", tratarRETURNyMENSAJES(request, map));
			}

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_recuperarModelosInversion", e);
			AbstractDispatchAction.guardarMensaje(request,
					"verbatim:<b>" + e.getClass().getName() + ":</b> " + e.getLocalizedMessage(),
					new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	/**
	 * M�todo que llama a la funci�n pl correspondiente para cargar el numero de
	 * lineas que deben mostrarse en la tabla garantias
	 * 
	 * @param request
	 * @param usuario
	 * @param SPRODUC
	 * @return
	 * @throws Exception
	 */
	private BigDecimal obtiene_filas(HttpServletRequest request, UsuarioBean usuario, BigDecimal SPRODUC)
			throws Exception {
		Map m = new PAC_IAXPAR_PRODUCTOS((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("NUM_GARAN_PANT", SPRODUC);
		logger.debug("Map resultado get NUM FILAS---------------------------------------->" + m);
		return (BigDecimal) tratarRETURNyMENSAJES(request, m);
	}

	public BigDecimal m_actualitzarimports(HttpServletRequest request, AbstractDispatchAction thisAction) {

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANSel");
			BigDecimal IPRITARsel = getCampoNumerico(request, "IPRITARsel");
			BigDecimal IPRIANUsel = getCampoNumerico(request, "IPRIANUsel");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCAPITALES(NRIESGO, CGARANT, IPRITARsel, IPRIANUsel);
			logger.debug("m_actualitzarimports---------------------------------------->" + m);

			return (BigDecimal) tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_valida_reval", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	public BigDecimal m_actualitzarmanual(HttpServletRequest request, AbstractDispatchAction thisAction) {

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			BigDecimal CTARMAN = getCampoNumerico(request, "CTARMANsel");

			if (isEmpty(CTARMAN)) {
				CTARMAN = new BigDecimal(this.getCampoTextual(request, "CTARMANsel"));
			}

			logger.debug("CTARMAN --------------> " + CTARMAN);

			if (CTARMAN.intValue() == 1)
				request.getSession().setAttribute("tar_axctr031", "1");

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANSel");

			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);
			// request.getSession().setAttribute("axisctr_preguntasRiesgo", preguntas);
			Map plValidaDPregGarantReturn = this.dbValidaDPregGarant(request, usuario, NRIESGO);
			BigDecimal validaDPregGarantReturn = (BigDecimal) tratarRETURNyMENSAJES(request, plValidaDPregGarantReturn);
			Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_PRODUCCION__F_ACTUALITZARCTARMAN(NRIESGO, CGARANT, CTARMAN);
			logger.debug("m_actualitzarmanual ---------------------------------------->" + m);

			return (BigDecimal) tratarRETURNyMENSAJES(request, m);

		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_valida_reval", e);
			// thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },
			// Constantes.MENSAJE_ERROR);
			return new BigDecimal(1);
		}
	}

	public void m_ajax_verifpreg(HttpServletRequest request) {
		logger.debug("Axisctr031Service m_ajax_verifpreg");
		AjaxContainerService ajax = new AjaxContainerService();
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);

		try {
			BigDecimal VALNRIESGO = this.getHiddenCampoNumerico(request, "VALNRIESGO");
			BigDecimal VALCGARANT = this.getHiddenCampoNumerico(request, "VALCGARANT");

			Map m = new PAC_IAX_VALIDACIONES((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
					.ejecutaPAC_IAX_VALIDACIONES__F_VALIDAGARANTIA(VALNRIESGO, VALCGARANT);

			logger.debug(m);
			ajax.rellenarPlAContenedorAjax(m);
			ajax.guardarContenidoFinalAContenedorAjax(m);
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr160Service - m�todo m_ajax_new_detalle", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
		}
	}

	private void managePartidas(HttpServletRequest request) throws Exception {
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
		// TODO S'ha de vanciar 0 --> 1
		List partidasSeleccionadas = this.dbLeeGarantias(request, usuario, NRIESGO, new BigDecimal(1));
		formdata.put("axisctr_partidas_seleccionadas",
				((partidasSeleccionadas == null) ? new ArrayList() : partidasSeleccionadas));
		logger.debug("---------- Lista de partidasSeleccionadas: " + partidasSeleccionadas);
		List garantiasProducto = this.dbGetGarantias(NRIESGO, request, usuario);
		garantiasProducto = getGarantiasModalidad(garantiasProducto, request);
		if (!isEmpty(garantiasProducto)) {
			List listaPartidas = getGarantiasSeleccionadas(new BigDecimal(1), garantiasProducto, partidasSeleccionadas,
					request);
			if (listaPartidas != null) {
				formdata.put("num_partidas", listaPartidas.size());
			}
			formdata.put("axisctr_partidas", ((listaPartidas == null) ? new ArrayList() : listaPartidas));
		}
	}

	// Devuelve en caso que sea necesario solo las garantias de la modalidad
	private List getGarantiasModalidad(List garantiasProducto, HttpServletRequest request) {
		List bb = (List) request.getSession().getAttribute("garantias_mod");
		logger.debug("---------- garantias_mod: " + bb);
		if (request.getSession().getAttribute("garantias_mod") != null) {
			logger.debug("---------- garantias_mod no null ");
			List la = new ArrayList();
			List garanModalidad = (List) request.getSession().getAttribute("garantias_mod");
			for (int a = 0; a < garanModalidad.size(); a++) {// alex
				BigDecimal CGARANT_ALEX = (BigDecimal) ((Map) ((Map) garanModalidad.get(a)).get("OB_IAX_GARANTIAS"))
						.get("CGARANT");
				for (int b = 0; b < garantiasProducto.size(); b++) {
					BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(b))
							.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
					if (CGARANT_PRODUCTO.equals(CGARANT_ALEX)) {
						la.add((Map) garantiasProducto.get(b));
					}
				}
			}
			logger.debug("---------- Lista de garantia de la modalidad: " + la);
			garantiasProducto = la;
		}
		return garantiasProducto;
	}

	// Devuelve las garantias o Partidas
	private List getGarantiasSeleccionadas(BigDecimal cpartida, List garantiasProducto, List garantiasSeleccionadas,
			HttpServletRequest request) {
		Map m1 = new HashMap();
		List listaGarantias = new ArrayList();
		// Recoremos todas las grantis de producto
		for (int a = 0; a < garantiasProducto.size(); a++) {
			boolean coincide = false;
			// Recuperamos los valores
			BigDecimal CGARANT_PRODUCTO = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a))
					.get("OB_IAXPAR_GARANTIAS")).get("CGARANT");
			String DESCRIPCION = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("DESCRIPCION");
			BigDecimal CTIPCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CTIPCAP");
			BigDecimal CTIPGAR = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CTIPGAR");
			List LISTACAPITALES = (List) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("LISTACAPITALES");
			BigDecimal CPARTIDA = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CPARTIDA");
			BigDecimal CMONCAP = (BigDecimal) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CMONCAP");
			String CMONINT = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("CMONCAPINT");
			String TMONCAP = (String) ((Map) ((Map) garantiasProducto.get(a)).get("OB_IAXPAR_GARANTIAS"))
					.get("TMONCAP");

			if (!isEmpty(garantiasSeleccionadas)) {
				for (int i = 0; i < garantiasSeleccionadas.size(); i++) {
					BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(i))
							.get("OB_IAX_GARANTIAS")).get("CGARANT");
					Map seleccionado = getObjetoDeLista(garantiasSeleccionadas, CGARANT_SELECT.toString(), "CGARANT",
							"OB_IAX_GARANTIAS");

					BigDecimal IPRIANU = null;
					BigDecimal IPRITAR = null;
					BigDecimal IPRITOT = null;
					BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL")))
							? (BigDecimal) seleccionado.get("ICAPITAL")
							: null);
					BigDecimal COBLIGA = ((!isEmpty(seleccionado.get("COBLIGA")))
							? (BigDecimal) seleccionado.get("COBLIGA")
							: null);
					BigDecimal CTARMAN = ((!isEmpty(seleccionado.get("CTARMAN")))
							? (BigDecimal) seleccionado.get("CTARMAN")
							: null);
					BigDecimal CDETALLE = ((!isEmpty(seleccionado.get("CDETALLE")))
							? (BigDecimal) seleccionado.get("CDETALLE")
							: null);

					logger.debug("CTARMAN-->" + seleccionado);

					Map PRIMAS = (Map) seleccionado.get("PRIMAS");
					if (!isEmpty(PRIMAS)) {
						IPRIANU = ((!isEmpty(PRIMAS.get("IPRIANU"))) ? (BigDecimal) PRIMAS.get("IPRIANU") : IPRIANU);
						IPRITAR = ((!isEmpty(PRIMAS.get("IPRITAR"))) ? (BigDecimal) PRIMAS.get("IPRITAR") : IPRITAR);
						IPRITOT = ((!isEmpty(PRIMAS.get("IPRITOT"))) ? (BigDecimal) PRIMAS.get("IPRITOT") : IPRITOT);
					}

					if (CGARANT_SELECT.equals(CGARANT_PRODUCTO)) {
						coincide = true;
						m1 = rellenaMapGarantias(CGARANT_SELECT, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION),
								ICAPITAL, IPRIANU, IPRITAR, COBLIGA, CTIPCAP, CTIPGAR, CTARMAN, CMONCAP, CMONINT,
								TMONCAP);
						// SI CTIPCAP = 7, tenemos una lista de capitales en vez de un capital
						if (new BigDecimal(7).equals(CTIPCAP)) {
							m1.put("LISTACAPITALES", LISTACAPITALES);
						}
						break;
					}
				}
			}

			if (!coincide) {
				m1 = rellenaMapGarantias(CGARANT_PRODUCTO, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION), null, null,
						null, null, null, null, null, null, null, null);
			}

			Map m2 = new HashMap();
			m2.put("OB_IAX_GARANTIAS", m1);
			if (m1.get("CTIPGAR") != null) {
				int ctip = Integer.parseInt(String.valueOf(m1.get("CTIPGAR")));

				if (!isEmpty(ctip) && ctip != 8 & ctip != 7) {
					listaGarantias.add(m2);
				}
			}
		}
		logger.debug("LISTA FINAL->" + listaGarantias);
		return listaGarantias;
	}

	/*
	 * 
	 * */
	public void m_ajax_setGarantia(HttpServletRequest request, AbstractDispatchAction thisAction) {

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
		BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
		BigDecimal SELGAR = getCampoNumerico(request, "SELGAR");
		BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITALH");
		BigDecimal CREVALI = getCampoNumerico(request, "CREVALI_CONFIG");
		BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
		BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");
		BigDecimal RETURN;
		try {
			RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL, CREVALI, PREVALI,
					IREVALI);
			if (RETURN.equals(new BigDecimal("0"))) {

			}
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr007Service - m�todo m_ajax_setGarantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		}

	}

	public void recupera_evoluprov(HttpServletRequest request, BigDecimal PSSEGURO, BigDecimal PESCENA) {
		logger.debug("Axisctr031Service recupera_evoluprov");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String TABLA = "EST";

			formdata.put("NESCENA", PESCENA);
			formdata.put("SSEGURO_OUT", PSSEGURO);

			if (PSSEGURO != null) {
				Map m = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(PSSEGURO, TABLA,
						PESCENA);
				List evolu = (List) tratarRETURNyMENSAJES(request, m, false);
				formdata.put("evoluprovmatseg", evolu);
				ajax.guardarContenidoFinalAContenedorAjax(evolu);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo recupera_evoluprov", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	public void m_actualiza_evoluprov(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr031Service m_actualiza_evoluprov");
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
			Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);

			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			BigDecimal PSSEGURO = this.getHiddenCampoNumerico(request, "PSSEGURO");
			String TABLA = "EST";
			if (PSSEGURO == null)
				PSSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");

			BigDecimal PNESCENA = this.getHiddenCampoNumerico(request, "PNESCENA");
			if (PNESCENA == null)
				PNESCENA = (BigDecimal) AbstractDispatchAction.topPila(request, "PNESCENA");

			if (PNESCENA == null) {
				if (!isEmpty(PSSEGURO)) {
					Map mesce = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_MINSCEN(PSSEGURO,
							TABLA);
					BigDecimal minesce = (BigDecimal) tratarRETURNyMENSAJES(request, mesce, false);
					PNESCENA = minesce;
				}
			}
			request.getSession().setAttribute("PNESCENA", PNESCENA);

			formdata.put("NESCENA", PNESCENA);
			formdata.put("SSEGURO_OUT", PSSEGURO);

			if (!isEmpty(PSSEGURO)) {
				Map m = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG(PSSEGURO, TABLA,
						PNESCENA);
				List evolu = (List) tratarRETURNyMENSAJES(request, m, false);
				formdata.put("evoluprovmatseg", evolu);
				ajax.guardarContenidoFinalAContenedorAjax(evolu);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr031Service - m�todo m_actualiza_evoluprov", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr031Service.class));
		}
	}

	private void cargarcombos(HttpServletRequest request, AbstractDispatchAction thisAction, BigDecimal PSSEGURO) {
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		HashMap formdata = (HashMap) request.getAttribute(Constantes.FORMDATA);
		Map listValores = new HashMap();
		if (!isEmpty(PSSEGURO)) {
			try {
				if (PSSEGURO != null) {
					PAC_IAX_OBTENERDATOS pac_axis_listValores = new PAC_IAX_OBTENERDATOS(
							(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

					// Escenarios de proyeccion
					Map map = pac_axis_listValores.ejecutaPAC_IAX_OBTENERDATOS__F_LEEEVOLUPROVMATSEG_SCEN(PSSEGURO,
							"EST");
					listValores.put("tipEscen", (List) tratarRETURNyMENSAJES(request, map, false));
					formdata.put("listValores", listValores);
				}
			} catch (Exception e) {
				logger.error("Error", e);
				thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			}
		}
	}
}
