package axis.service.axis;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.cache.AxisCodeWizard;
import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_OBTENERDATOS;
import axis.jdbc.PAC_IAX_PRODUCCION;
import axis.jdbc.PAC_IAX_VALIDACIONES;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;
import axis.util.Traductor;

public class Axisctr152Service extends AxisBaseService {
	Log logger = LogFactory.getLog(this.getClass());
	private String CMODO = "";

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
	private List dbLeeGarantias(HttpServletRequest request, UsuarioBean usuario, BigDecimal NRIESGO) throws Exception {
		String VCMODO = String.valueOf(((Map) AbstractDispatchAction.topPila(request)).get("CMODO"));
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_LEEGARANTIAS_ALT(NRIESGO, new BigDecimal(1), VCMODO);
		logger.debug("Map de garantias riesgo---------------------------------------->" + m);
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
	/*
	 * private List dbLeeRentasIrregulares(HttpServletRequest request, UsuarioBean
	 * usuario, BigDecimal NRIESGO) throws Exception { Map m=new
	 * PAC_IAX_PRODUCCION((java.sql.Connection)request.getAttribute(Constantes.
	 * DB01CONN)).ejecutaPAC_IAX_PRODUCCION__F_LEERENTASIRREGULARES(NRIESGO);
	 * logger.
	 * debug("Map de garantias riesgo---------------------------------------->"+m);
	 * return (List)tratarRETURNyMENSAJES(request, m); }
	 */

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
			BigDecimal IREVALI, BigDecimal IPRITAR) throws Exception {
		logger.debug(
				"GARANTIA SELECCIONADA?(0->ok/1->error)+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++>"
						+ IPRITAR);
		Map m = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GRABARGARANTIAS(NRIESGO, CGARANT, SELGAR, ICAPITAL, CREVALI, PREVALI,
						IREVALI, IPRITAR);
		logger.debug("GARANTIA SELECCIONADA?(0->ok/1->error)---------------------------------------->" + m);
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
		// System.out.println("PILA ::"+AbstractDispatchAction.topPila(request));
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
						&& (ctipo.intValue() == 3 || (!CMODO.equals("SUPLEMENTO_237") && ctipo.intValue() == 4))) {
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
		logger.debug("Axisctr152Service m_init");
		try {

			m_form(request, thisAction);
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr152Service - m�todo m_init", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En �l hacemos la carga inicial
	 * del riesgo con sus preguntas y garantias.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr152Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug("VMODO : " + VMODO);
			request.getSession().setAttribute("MODO", VMODO);
			initGarantias(request, usuario);
			initPreguntas(request, usuario);
			initParametrosGarantias(request, usuario);
			m_validar_reval(request, thisAction);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal num_garantias = obtiene_filas(request, usuario, SPRODUC);
			request.getSession().setAttribute("num_garantias", num_garantias);

			/* Inicializar los par�metros revalorizacion */
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map m = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA("EST", SSEGURO);
			BigDecimal PREVALI = (BigDecimal) m.get("PREVALI");
			BigDecimal CREVALI = (BigDecimal) m.get("PCREVALI");
			if (CREVALI != null) {
				request.getSession().setAttribute("axisctr_CREVALI", CREVALI);
			}
			if (PREVALI != null) {
				request.getSession().setAttribute("axisctr_PREVALI", PREVALI);
			}
			/* Fin inicializar parametros revalorizacion */

			/* Obtenemos foto de ESTDETGARANSEG */
			// Bug 11735
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			Map mriesgo = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(SSEGURO_OUT, NRIESGO);
			List mriesgo_l = (List) tratarRETURNyMENSAJES(request, mriesgo);
			request.getSession().setAttribute("axisctr_estdetgaranseg", mriesgo_l);
			// Fin Bug 11735
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr152Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
		}
	}

	/**
	 * M�todo que se llama al inicio de este flujo. En �l hacemos la carga inicial
	 * del riesgo con sus preguntas y garantias.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_form_aux(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr152Service m_form");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
			logger.debug("VMODO : " + VMODO);
			request.getSession().setAttribute("MODO", VMODO);
			initGarantias_aux(request, usuario);
			initPreguntas(request, usuario);
			initParametrosGarantias(request, usuario);
			m_validar_reval(request, thisAction);
			BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");
			BigDecimal num_garantias = obtiene_filas(request, usuario, SPRODUC);
			request.getSession().setAttribute("num_garantias", num_garantias);

			/* Inicializar los par�metros revalorizacion */
			BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
			Map m = pac_iax_produccion.ejecutaPAC_IAX_PRODUCCION__F_GET_REVAL_POLIZA("EST", SSEGURO);
			BigDecimal PREVALI = (BigDecimal) m.get("PREVALI");
			BigDecimal CREVALI = (BigDecimal) m.get("PCREVALI");
			if (CREVALI != null) {
				request.getSession().setAttribute("axisctr_CREVALI", CREVALI);
			}
			if (PREVALI != null) {
				request.getSession().setAttribute("axisctr_PREVALI", PREVALI);
			}
			/* Fin inicializar parametros revalorizacion */

			/* Obtenemos foto de ESTDETGARANSEG */
			// Bug 11735
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");
			BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
			Map mriesgo = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(SSEGURO_OUT, NRIESGO);
			List mriesgo_l = (List) tratarRETURNyMENSAJES(request, mriesgo);
			request.getSession().setAttribute("axisctr_estdetgaranseg", mriesgo_l);
			// Fin Bug 11735
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr152Service - m�todo m_form", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
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
			BigDecimal IPRITAR, BigDecimal COBLIGA, BigDecimal CTIPCAP, BigDecimal CTIPGAR, BigDecimal EDITABLE) {
		Map m = new HashMap();
		BigDecimal id = idGarant;

		logger.debug(COBLIGA);
		m.put("CGARANT", id);
		m.put("DESCRIPCION", DESCRIPCION);
		m.put("ICAPITAL", ICAPITAL);
		m.put("IPRITAR", IPRIANU);
		m.put("IPRIANU", IPRITAR);
		m.put("COBLIGA", COBLIGA);
		m.put("CTIPCAP", CTIPCAP);
		m.put("CTIPGAR", CTIPGAR);
		m.put("EDITABLE", EDITABLE);
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
		logger.debug("-------------------------------------------------------------------------------- " + map);
		map = (Map) tratarRETURNyMENSAJES(request, map);
		formdata.put("OB_IAX_RIESGOS", map);

		// TODO ->garantias (carga inicial segun n�mero de riesgo recuperado de la
		// p�gina 5). Por terminar
		List garantiasProducto = this.dbGetGarantias(NRIESGO, request, usuario);
		List garantiasSeleccionadas = this.dbLeeGarantias(request, usuario, NRIESGO);

		logger.debug(
				"-------------------------------------------------------------------------------- garantiasSeleccionadas "
						+ garantiasSeleccionadas);

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

		// GarantiasSeleccionadas
		List garantiasSeleccionadasEntrada = this.getGarantiasSelecEntrada(garantiasSeleccionadas, tipoCalcul);
		List garantiasSeleccionadasSalida = this.getGarantiasSelecSalida(garantiasSeleccionadas, tipoCalcul);
		garantiasSeleccionadas = this.getGarantiasSelecGenerales(garantiasSeleccionadas);

		this.dbGrabarObjetoDb(request, usuario);

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

				if (!isEmpty(garantiasSeleccionadas)) {
					for (int i = 0; i < garantiasSeleccionadas.size(); i++) {
						BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(i))
								.get("OB_IAX_GARANTIAS")).get("CGARANT");
						BigDecimal CTIPO_11 = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(a))
								.get("OB_IAX_GARANTIAS")).get("CTIPO");

						Map seleccionado = getObjetoDeLista(garantiasSeleccionadas, CGARANT_SELECT.toString(),
								"CGARANT", "OB_IAX_GARANTIAS");
						// logger.debug("-->"+seleccionado);
						BigDecimal IPRIANU = null;
						BigDecimal IPRITAR = null;
						BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL")))
								? (BigDecimal) seleccionado.get("ICAPITAL")
								: null);
						BigDecimal COBLIGA = ((!isEmpty(seleccionado.get("COBLIGA")))
								? (BigDecimal) seleccionado.get("COBLIGA")
								: null);

						// Bug 11735 - RSC - 15/01/2010 - APR - suplemento de modificaci�n de capital
						// /prima
						BigDecimal EDITABLE = ((!isEmpty(seleccionado.get("EDITABLE")))
								? (BigDecimal) seleccionado.get("EDITABLE")
								: null);
						// -- Fin Bug 11735

						Map PRIMAS = (Map) seleccionado.get("PRIMAS");
						if (!isEmpty(PRIMAS)) {
							IPRIANU = ((!isEmpty(PRIMAS.get("IPRIANU"))) ? (BigDecimal) PRIMAS.get("IPRIANU")
									: IPRIANU);
							IPRITAR = ((!isEmpty(PRIMAS.get("IPRITAR"))) ? (BigDecimal) PRIMAS.get("IPRITAR")
									: IPRITAR);
						}

						if (CGARANT_SELECT.equals(CGARANT_PRODUCTO)) {
							coincide = true;
							// if (COBLIGA.intValue()!=1){
							m1 = rellenaMapGarantias(CGARANT_SELECT, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION),
									ICAPITAL, IPRIANU, IPRITAR, COBLIGA, CTIPCAP, CTIPGAR, EDITABLE);
							// }
							// SI CTIPCAP = 7, tenemos una lista de capitales en vez de un capital
							if (CTIPO_11.intValue() == 11 && COBLIGA.intValue() == 1) {
								gar_11 = true;
							}

							if (new BigDecimal(7).equals(CTIPCAP)) {
								m1.put("LISTACAPITALES", LISTACAPITALES);
							}
							break;
						}
						// Comprobamos si la garantia 11 ha sido seleciconada, para mostrar la
						// informaci�n de rentas irregulares
					}
				}

				if (!coincide) {
					m1 = rellenaMapGarantias(CGARANT_PRODUCTO, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION), null,
							null, null, null, null, null, null);
				}

				Map m2 = new HashMap();
				m2.put("OB_IAX_GARANTIAS", m1);

				int ctip = Integer.parseInt(String.valueOf(m1.get("CTIPGAR")));

				if (!isEmpty(ctip) && ctip != 8) {
					li.add(m2);
				}
			}
			logger.debug("LISTA FINAL->" + li);
			request.getSession().setAttribute("axisctr_garantias", ((li == null) ? new ArrayList() : li));
		} else {
			logger.error("NO SE CARGA NINGUNA GARANTIA DE F_GETGARANTIA");
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
							if (b_cgarant.intValue() == c_cgarant.intValue() && c_icapital.intValue() >= 0) {

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
							if (b_cgarant.intValue() == c_cgarant.intValue() && c_icapital.intValue() >= 0) {
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
		request.getSession().setAttribute("garantia_11", (gar_11) ? "1" : "0");

		Map primasTotales = new HashMap();

		primasTotales = this.dbPrimasGarantTot(request, usuario, NRIESGO);

		List axisctr_primasTotales = new ArrayList();
		if (!isEmpty(primasTotales))
			axisctr_primasTotales.add(primasTotales);
		request.getSession().setAttribute("axisctr_primasTotales", axisctr_primasTotales);
	}

	/**
	 * M�todo que realiza la carga de garantias sean cuales sean los cambios
	 * producidos en el flujo.
	 * 
	 * @param request
	 * @param usuario
	 * @throws Exception
	 */
	private void initGarantias_aux(HttpServletRequest request, UsuarioBean usuario) throws Exception {

		// TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (request.getSession().getAttribute("NRIESGO") != null) {
			NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
		}

		// Recuperaci�n riesgo
		Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
		Map map = new PAC_IAX_PRODUCCION((java.sql.Connection) request.getAttribute(Constantes.DB01CONN))
				.ejecutaPAC_IAX_PRODUCCION__F_GET_RIESGO(NRIESGO);
		logger.debug("-------------------------------------------------------------------------------- " + map);
		map = (Map) tratarRETURNyMENSAJES(request, map);
		formdata.put("OB_IAX_RIESGOS", map);

		// TODO ->garantias (carga inicial segun n�mero de riesgo recuperado de la
		// p�gina 5). Por terminar
		List garantiasProducto = this.dbGetGarantias(NRIESGO, request, usuario);
		List garantiasSeleccionadas = this.dbLeeGarantias(request, usuario, NRIESGO);

		logger.debug(
				"-------------------------------------------------------------------------------- garantiasSeleccionadas "
						+ garantiasSeleccionadas);

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

		// GarantiasSeleccionadas
		List garantiasSeleccionadasEntrada = this.getGarantiasSelecEntrada(garantiasSeleccionadas, tipoCalcul);
		List garantiasSeleccionadasSalida = this.getGarantiasSelecSalida(garantiasSeleccionadas, tipoCalcul);
		garantiasSeleccionadas = this.getGarantiasSelecGenerales(garantiasSeleccionadas);

		// this.dbGrabarObjetoDb(request, usuario);

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

				if (!isEmpty(garantiasSeleccionadas)) {
					for (int i = 0; i < garantiasSeleccionadas.size(); i++) {
						BigDecimal CGARANT_SELECT = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(i))
								.get("OB_IAX_GARANTIAS")).get("CGARANT");
						BigDecimal CTIPO_11 = (BigDecimal) ((Map) ((Map) garantiasSeleccionadas.get(a))
								.get("OB_IAX_GARANTIAS")).get("CTIPO");

						Map seleccionado = getObjetoDeLista(garantiasSeleccionadas, CGARANT_SELECT.toString(),
								"CGARANT", "OB_IAX_GARANTIAS");
						// logger.debug("-->"+seleccionado);
						BigDecimal IPRIANU = null;
						BigDecimal IPRITAR = null;
						BigDecimal ICAPITAL = ((!isEmpty(seleccionado.get("ICAPITAL")))
								? (BigDecimal) seleccionado.get("ICAPITAL")
								: null);
						BigDecimal COBLIGA = ((!isEmpty(seleccionado.get("COBLIGA")))
								? (BigDecimal) seleccionado.get("COBLIGA")
								: null);

						// Bug 11735 - RSC - 15/01/2010 - APR - suplemento de modificaci�n de capital
						// /prima
						BigDecimal EDITABLE = ((!isEmpty(seleccionado.get("EDITABLE")))
								? (BigDecimal) seleccionado.get("EDITABLE")
								: null);
						// -- Fin Bug 11735

						Map PRIMAS = (Map) seleccionado.get("PRIMAS");
						if (!isEmpty(PRIMAS)) {
							IPRIANU = ((!isEmpty(PRIMAS.get("IPRIANU"))) ? (BigDecimal) PRIMAS.get("IPRIANU")
									: IPRIANU);
							IPRITAR = ((!isEmpty(PRIMAS.get("IPRITAR"))) ? (BigDecimal) PRIMAS.get("IPRITAR")
									: IPRITAR);
						}

						if (CGARANT_SELECT.equals(CGARANT_PRODUCTO)) {
							coincide = true;
							// if (COBLIGA.intValue()!=1){
							m1 = rellenaMapGarantias(CGARANT_SELECT, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION),
									ICAPITAL, IPRIANU, IPRITAR, COBLIGA, CTIPCAP, CTIPGAR, EDITABLE);
							// }
							// SI CTIPCAP = 7, tenemos una lista de capitales en vez de un capital
							if (CTIPO_11.intValue() == 11 && COBLIGA.intValue() == 1) {
								gar_11 = true;
							}

							if (new BigDecimal(7).equals(CTIPCAP)) {
								m1.put("LISTACAPITALES", LISTACAPITALES);
							}
							break;
						}
						// Comprobamos si la garantia 11 ha sido seleciconada, para mostrar la
						// informaci�n de rentas irregulares
					}
				}

				if (!coincide) {
					m1 = rellenaMapGarantias(CGARANT_PRODUCTO, ((isEmpty(DESCRIPCION)) ? null : DESCRIPCION), null,
							null, null, null, null, null, null);
				}

				Map m2 = new HashMap();
				m2.put("OB_IAX_GARANTIAS", m1);

				int ctip = Integer.parseInt(String.valueOf(m1.get("CTIPGAR")));

				if (!isEmpty(ctip) && ctip != 8) {
					li.add(m2);
				}
			}
			logger.debug("LISTA FINAL->" + li);
			request.getSession().setAttribute("axisctr_garantias", ((li == null) ? new ArrayList() : li));
		} else {
			logger.error("NO SE CARGA NINGUNA GARANTIA DE F_GETGARANTIA");
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
							if (b_cgarant.intValue() == c_cgarant.intValue() && c_icapital.intValue() >= 0) {

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
							if (b_cgarant.intValue() == c_cgarant.intValue() && c_icapital.intValue() >= 0) {
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
		request.getSession().setAttribute("garantia_11", (gar_11) ? "1" : "0");

		Map primasTotales = new HashMap();

		primasTotales = this.dbPrimasGarantTot(request, usuario, NRIESGO);

		List axisctr_primasTotales = new ArrayList();
		if (!isEmpty(primasTotales))
			axisctr_primasTotales.add(primasTotales);
		request.getSession().setAttribute("axisctr_primasTotales", axisctr_primasTotales);
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
		logger.debug("Axisctr152Service m_actualizaRevalorizacionGarantias");
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
		} catch (Exception e) {
			logger.error("Error en el servicio axisctr152Service - m�todo m_actualizaRevalorizacionGarantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
		}
	}

	/**
	 * M�todo que se encarga de realizar el cambio de tipo de pago.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_ajax_cambiar_forma_pago(HttpServletRequest request) {
		logger.debug("Axisctr152Service m_ajax_cambiar_forma_pago");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		AjaxContainerService ajax = new AjaxContainerService();

		try {
			BigDecimal CFORPAG = getCampoNumerico(request, "CFORPAG");
			Map plSetGarForPag = this.dbSetGarForPag(request, usuario, CFORPAG);
			ajax.rellenarPlAContenedorAjax(plSetGarForPag);

		} catch (Exception e) {
			logger.error("Error en el servicio axisctr152Service - m�todo m_actualizaRevalorizacionGarantias", e);
			ajax.rellenarExcepcionAContenedorAjax(e);
		} finally {
			request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
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
				"-------------------------------------------------------------------------------------->Axisctr152Service m_selected_garantia");

		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		try {
			PAC_IAX_PRODUCCION pac_iax_produccion = new PAC_IAX_PRODUCCION(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));

			// TODO: Es la forma correcta de recuperar NRIESGO?
			BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

			if (request.getSession().getAttribute("NRIESGO") != null) {
				NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
			}

			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);

			BigDecimal CGARANT = getCampoNumerico(request, "CGARANT");
			BigDecimal SELGAR = getCampoNumerico(request, "SELGAR");
			BigDecimal ICAPITAL = getCampoNumerico(request, "ICAPITALH");
			BigDecimal IPRITAR = getCampoNumerico(request, "IPRITARH");
			BigDecimal CREVALI = getCampoNumerico(request, "CREVALI");
			BigDecimal PREVALI = getCampoNumerico(request, "PREVALI");
			BigDecimal IREVALI = getCampoNumerico(request, "IREVALI");

			// m_guardaMeses(request);
			if (request.getSession().getAttribute("axisctr_garantias") != null) {
				BigDecimal RETURN = this.dbGrabarGarantias(request, usuario, NRIESGO, CGARANT, SELGAR, ICAPITAL,
						CREVALI, PREVALI, IREVALI, IPRITAR);
				if (RETURN.equals(new BigDecimal("0"))) {
					logger.debug("SELECCION EFECTUADA CON EXITO. RECARGANDO LISTA DE GARANTIAS");
					initGarantias(request, usuario);
					initPreguntas(request, usuario);
					initParametrosGarantias(request, usuario);

					/* Obtenemos foto de ESTDETGARANSEG */
					// Bug 11735
					BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
					BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
					Map mriesgo = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(SSEGURO_OUT,
							NRIESGO);
					List mriesgo_l = (List) tratarRETURNyMENSAJES(request, mriesgo);
					request.getSession().setAttribute("axisctr_estdetgaranseg", mriesgo_l);
					// Fin Bug 11735

					request.getSession().setAttribute("hayCambios", "true");
				} else {
				} // Tratado el error en el pl
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr152Service - m�todo m_ajax_selected_garantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
		}
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
	 * M�todo que se encarga de la actualizaci�n de la pantalla y su posterior
	 * recalculo de primas en funci�n de la revalorizaci�n, las garantias y sus
	 * capitales.
	 * 
	 * @param request
	 */
	public void m_tarifar(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr152Service m_ajax_tarifar");
		UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
		BigDecimal SPRODUC = (BigDecimal) AbstractDispatchAction.topPila(request, "SPRODUC");

		String validar_tarificacion = "false";

		// TODO: Es la forma correcta de recuperar NRIESGO?
		BigDecimal NRIESGO = (BigDecimal) AbstractDispatchAction.topPila(request, "NRIESGO");

		if (request.getSession().getAttribute("NRIESGO") != null) {
			NRIESGO = stringToBigDecimal((String) request.getSession().getAttribute("NRIESGO"));
		}

		request.getSession().setAttribute("tar_axctr152", "1");

		Map listaPrimas = new HashMap();

		boolean preguntasGuardadas = false;
		boolean noHayRespuestas = false;
		try {
			PAC_IAX_OBTENERDATOS pac_iax_obtenerdatos = new PAC_IAX_OBTENERDATOS(
					(java.sql.Connection) request.getAttribute(Constantes.DB01CONN));
			this.guardaPreguntasYRespuestasToDB(request, NRIESGO);

			// request.getSession().setAttribute("axisctr_preguntasRiesgo", preguntas);
			/* TODO:Revisar por qu� estaba asterisacado el trozo de c�digo */
			Map plValidaDPregGarantReturn = this.dbValidaDPregGarant(request, usuario, NRIESGO);
			BigDecimal validaDPregGarantReturn = (BigDecimal) tratarRETURNyMENSAJES(request, plValidaDPregGarantReturn);

			if (validaDPregGarantReturn.equals(new BigDecimal(0))) {
				/* TODO:Revisar por qu� estaba asterisacado el trozo de c�digo */

				Map plTarificarReturn = this.dbTarificar(request, usuario, NRIESGO);
				BigDecimal tarificarReturn = (BigDecimal) tratarRETURNyMENSAJES(request, plTarificarReturn);
				// if (tarificarReturn.equals(new BigDecimal(0))) {
				// validar_tarificacion="true";
				request.getSession().setAttribute("hayCambios", "false");
				// }
				Map plGetPrimasGarantTot = this.dbGetPrimasGarantTot(request, usuario, NRIESGO);
				listaPrimas = (Map) tratarRETURNyMENSAJES(request, plGetPrimasGarantTot);

				/* Obtenemos foto de ESTDETGARANSEG */
				// Bug 11735
				BigDecimal SSEGURO = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO");
				BigDecimal SSEGURO_OUT = (BigDecimal) AbstractDispatchAction.topPila(request, "SSEGURO_OUT");
				Map mriesgo = pac_iax_obtenerdatos.ejecutaPAC_IAX_OBTENERDATOS__F_LEEGARANTIAS_SUPL(SSEGURO_OUT,
						NRIESGO);
				List mriesgo_l = (List) tratarRETURNyMENSAJES(request, mriesgo);
				request.getSession().setAttribute("axisctr_estdetgaranseg", mriesgo_l);
				// Fin Bug 11735
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr152Service - m�todo m_ajax_selected_garantia", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			request.getSession().setAttribute("validar_tarificacion", validar_tarificacion);
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
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
		logger.debug("Axisctr152Service m_siguiente");
		m_guardaEstadoPantalla(request, thisAction, Constantes.SIGUIENTE);

	}

	/**
	 * Guarda la pantalla, realiza su validaci�n y determina la pantalla anterior a
	 * ejecutar.
	 * 
	 * @param request
	 * @param thisAction
	 */
	public void m_anterior(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr152Service m_anterior");
		m_guardaEstadoPantalla(request, thisAction, Constantes.ANTERIOR);

	}

	/**
	 * Valida mediante la llamada a la funci�n que se bloquee o no el combo de
	 * revalorizaciones en la pantalla 152
	 * 
	 * @param request
	 * @param thisAction
	 */
	public

			void m_validar_reval(HttpServletRequest request, AbstractDispatchAction thisAction) {
		logger.debug("Axisctr152Service m_validar_reval");
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
			logger.error("Error en el servicio Axisctr152Service - m�todo m_valida_reval", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
		}
	}

	/**
	 * M�todo que se encarga de la validaci�n de la pantalla cuando queremos ir a la
	 * pantalla axisctr008.
	 * 
	 * @param request
	 * @param thisAction
	 */
	private void m_guardaEstadoPantalla(HttpServletRequest request, AbstractDispatchAction thisAction,
			BigDecimal direccion) {
		logger.debug("Axisctr152Service m_guardaEstadoPantalla");
		try {
			// LCF -> Acceso a la siguiente pantalla --> Flujo actual / Flujo de simulaci�n
			String CFORM = getCampoTextual(request, "FORM_ACT");
			request.setAttribute(Constantes.FORWARDACTION, AxisCodeWizard.findForward(request, direccion, CFORM, null));
			request.getSession().setAttribute("tar_axctr152", "0");
			// LCF

			String VMODO = String.valueOf(AbstractDispatchAction.topPila(request, "CMODO"));
			if (VMODO.equals("SIMULACION")) {
				request.getSession().setAttribute("axisctr152_primera_vez", null);
			}
		} catch (Exception e) {
			logger.error("Error en el servicio Axisctr152Service - m�todo m_guardaEstadoPantalla", e);
			thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
		} finally {
			// this.f_Cargar_Propiedades_Pantalla(request, whoami(Axisctr152Service.class));
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

}
