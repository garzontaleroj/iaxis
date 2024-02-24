package axis.service.axis;

import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_LISTVALORES_REA;
import axis.jdbc.PAC_IAX_REA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.axis.Axisrea020Action;
import axis.mvc.model.UsuarioBean;
import axis.util.Constantes;


/**
 * Axisrea020Service.java
 * 29/06/2009
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axisrea020Service extends AxisBaseService {
    Log logger = LogFactory.getLog(this.getClass());
    
    /*********************************************************************************************************************/
    /*********************************************** MTODOS DE INICIALIZACION *******************************************/
    /*********************************************************************************************************************/
    
    /**
     * 
     * @param request
     */
    public void m_form(HttpServletRequest request) {
        logger.debug("Axisrea020Service m_form");
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        
        try {     
       // DESCOMENTAR CUANDO EST INTEGRADO LO DEL TALLER DE IVAN
            Map mapa5 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCOMIS_REA();
            List listaComisRea = (List) tratarRETURNyMENSAJES (request, mapa5, false);
            request.setAttribute("LST_COMISREA",listaComisRea);
            
            Map mapa4 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTINTERES_REA();
            List listaInteresRea = (List) tratarRETURNyMENSAJES (request, mapa4, false);
            request.setAttribute("LST_INTERESREA",listaInteresRea);
        
            Map mapa2 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTCIA_REA();
            List listaCompReaseg = (List) tratarRETURNyMENSAJES (request, mapa2, false);
            request.setAttribute("LST_COMPANYIES",listaCompReaseg);
            //             formdata.put("listaCompReaseg",listaCompReaseg);            
            
            Map map3 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_LSTESTADO_FAC(); 
            List listaComboEstado = (List) tratarRETURNyMENSAJES (request, map3, false);
            request.setAttribute("LST_ESTADOS",listaComboEstado);
            
            Map map4 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(800108));
            List listaComboTipFalcul = (List) tratarRETURNyMENSAJES (request, map4, false);
            request.setAttribute("LST_CTIPFALCUL",listaComboTipFalcul);
            
            Map map5 = new PAC_IAX_LISTVALORES_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES_REA__F_GET_BROKER();
            List listaComboBroke = (List) tratarRETURNyMENSAJES (request, map5, false);
            request.setAttribute("LST_CTIPBROKER",listaComboBroke);
            
            Map map6 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(113));
            List listaComboPerLibDep = (List) tratarRETURNyMENSAJES (request, map6, false);
            request.setAttribute("LST_PERLIBDEP",listaComboPerLibDep);
            
            Map map7 = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002040));
            List listaComboPropFalcul = (List) tratarRETURNyMENSAJES (request, map7, false);
            request.setAttribute("LST_CPROPAGAFACUL",listaComboPropFalcul);
            listaCompReaseg = null;
        
            PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
            BigDecimal SFACULT    = getCampoNumerico(request, "SFACULT");
            BigDecimal SSEGURO    = getCampoNumerico(request, "SSEGURO");
            
            if (!isEmpty(SFACULT) ) {            
                Map map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CUAFACUL_DET_REA(SFACULT,SSEGURO);
                logger.debug(map);
                request.setAttribute("OB_IAX_CUAFACUL", tratarRETURNyMENSAJES(request, map));  
                
                /* Recuperar-Actualizar el CESTADO */
                Map mapa_cuadro = (Map)tratarRETURNyMENSAJES(request,map);
                if(!isEmpty(mapa_cuadro)){
                BigDecimal CESTADO = (BigDecimal)mapa_cuadro.get("CESTADO");
                    if(CESTADO!=null){
                        formdata.remove("CESTADO");  //Borramos el valor anterior
                        formdata.put("CESTADO",CESTADO);
                    }
                }
                
                map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CUACESFAC_REA(SFACULT);
                logger.debug(map);
                List<Map> T_IAX_CUACESFAC = (List<Map>) tratarRETURNyMENSAJES(request, map);
                request.getSession().setAttribute("T_IAX_CUACESFAC", T_IAX_CUACESFAC);  
                
                BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");
                BigDecimal CCORRED = getCampoNumerico(request, "CCORRED"); //POST-230 MPC 20/12/2022 Se crea campo.
                BigDecimal CCOD_PK = getCampoNumerico(request, "CCOD_PK"); //POST-230 MPC 20/12/2022 Se crea campo.
                
                // Si slo hay un OB_IAX_CUACESFAC, coger el primer CCOMPANI para automarcarlo
                //INI POST-230 MPC 20/12/2022 Se comenta codigo.
                if (isEmpty(CCOMPANI) && !isEmpty(T_IAX_CUACESFAC) /*&& T_IAX_CUACESFAC.size() == 1*/) {
                //FIN POST-230 MPC 20/12/2022 Se comenta codigo.
                    CCOMPANI = (BigDecimal) T_IAX_CUACESFAC.get(0).get("CCOMPANI");
                    CCORRED = (BigDecimal) T_IAX_CUACESFAC.get(0).get("CCORRED"); //POST-230 MPC 20/12/2022 Se crea campo.
                    CCOD_PK = (BigDecimal) T_IAX_CUACESFAC.get(0).get("CCOD_PK"); //POST-230 MPC 20/12/2022 Se crea campo.
                    formdata.put("CCOMPANI", CCOMPANI);
                    formdata.put("CCORRED", CCORRED); //POST-230 MPC 20/12/2022 Se crea campo.
                    formdata.put("CCOD_PK", CCOD_PK); //POST-230 MPC 20/12/2022 Se crea campo.
                }
                
                Boolean grabarOk = request.getAttribute("grabarOk")==null?true:(Boolean)request.getAttribute("grabarOk"); 

                if (!isEmpty(CCOMPANI) && grabarOk  && !isEmpty(CCOD_PK)) { //POST-230 MPC 20/12/2022 Se adiciona condicion CCOD_PK.  
                
                //Carga del detalle de compaia
                    map = pacIaxRea.ejecutaPAC_IAX_REA__F_GET_CUACESFAC_DET_REA(SFACULT, CCOMPANI, CCORRED); //POST-230 MPC 20/12/2022 Se adiciona campo CCORRED.
                     
                    logger.debug(map);
                    request.setAttribute("OB_IAX_CUACESFAC", tratarRETURNyMENSAJES(request, map));  
                    
                 //Invento para recuperar descripciones de la lista   
                    BigDecimal CCOMREA = (BigDecimal)((Map)tratarRETURNyMENSAJES(request, map)).get("CCOMREA");  
                    String descripcio = "";                    
                    if (CCOMREA != null){
                        int index = 0;                    
                        Iterator it = listaComisRea.iterator();
                        while (it.hasNext()) {                     
                            Map e = (Map)it.next();
                            if (((BigDecimal)e.get("CCOMREA")).compareTo(CCOMREA)==0){
                                descripcio = (String)((Map)listaComisRea.get(index)).get("TDESCRI");                                   
                            }
                            index=index+1;                       
                        }
                    }
                    request.setAttribute("DESCCOMISIO", descripcio);                              
                    
                    //Invento para recuperar descripciones de la lista   
                    BigDecimal CINTRES = (BigDecimal)((Map)tratarRETURNyMENSAJES(request, map)).get("CINTRES");          
                    String descripcio2 = "";                    
                    if (CINTRES != null){
                        int index2 = 0;                    
                        Iterator it2 = listaInteresRea.iterator();
                        while (it2.hasNext()) {                     
                            Map e = (Map)it2.next();
                            if (((BigDecimal)e.get("CINTRES")).compareTo(CINTRES)==0){
                                descripcio2 = (String)((Map)listaInteresRea.get(index2)).get("TINTRES");   
                                
                            }
                            index2 = index2 + 1;
                        
                        }
                    }
                    request.setAttribute("DESCINTERES", descripcio2);                              
                    
                   
                }
                
                BigDecimal MODIFICACIO    = getCampoNumerico(request, "MODIFICACIO");
                if(!isEmpty(MODIFICACIO) && MODIFICACIO.compareTo(new BigDecimal(1))==0){
                    request.setAttribute("MODIFICACIO", MODIFICACIO);  
                }
                
            }
                       
                       
        } catch (Exception e) {
            logger.error("Error en el servicio Axisrea020Service - mtodo m_form", 
                         e);
            AbstractDispatchAction.guardarMensaje(request, "verbatim:<b>" + e.getClass().getName() +
                                                  ":</b> " + e.getLocalizedMessage(),        
                                                  new Object[] { e.toString() }, 
                                                  Constantes.MENSAJE_ERROR);
        } finally {
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        }        
    }
    
    
    
    /*********************************************************************************************************************/
    /************************************************ MTODOS DE ACTUALIZACIN *******************************************/
    /*********************************************************************************************************************/
    
    
    
     /**
      * 
      * @param request
      * @return true o false indicando si la actualitzacin de la pliza.
      */
     @SuppressWarnings("all")
     public void m_novaCompanyia(HttpServletRequest request, Axisrea020Action thisAction) {
         logger.debug("Axisctr020Service m_novaCompanyia");
         Integer V_NO_PROPAGA=0;
         Integer V_PROPAGA_CONTRA=1;
         Integer V_PROPAGA_TODO=2;
         UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);         
         Map map = new HashMap();
         BigDecimal MODIFICACIO    = getCampoNumerico(request, "MODIFICACIO"); //POST-230 MPC 27/12/2022 Se crea variable 
         Map formdata = (Map) request.getAttribute(Constantes.FORMDATA); //POST-230 MPC 27/12/2022 Se crea variable 
         try {
         
         
             PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
         
             BigDecimal SFACULT    = getCampoNumerico(request, "SFACULT");             
             BigDecimal PLOCAL    = getCampoNumerico(request, "PLOCAL");
             Date FFINCUF          = stringToSqlDate(getCampoTextual(request, "FFINCUF"));  
             BigDecimal CESTADO = getCampoNumerico(request, "COMBOESTADO");            
             BigDecimal CCOMPANIS = getCampoNumerico(request, "COMBOCOMPANI");
             BigDecimal CCORRENIS = getCampoNumerico(request, "COMBOCORRED"); //POST-230 MPC 27/12/2022 Se crea variable 
             //RCL - BUG 27322/146666 - Si el camp COMBOCOMPANI es null, recuperem el camp CCOMPANIUS
             if(CCOMPANIS == null && getCampoTextual(request, "CCOMPANIUS")!=null) 
             {
                CCOMPANIS = new BigDecimal(getCampoTextual(request, "CCOMPANIUS"));
             }
             //INI POST-230 MPC 27/12/2022 Se crea condicion.
             if(CCORRENIS == null && getCampoTextual(request, "CCORREDNIUS")!=null) 
             {
            	CCORRENIS = new BigDecimal(getCampoTextual(request, "CCORREDNIUS"));

             }
             //FIN POST-230 MPC 27/12/2022 Se crea condicion.
             BigDecimal PCESION = getCampoNumerico(request, "PCESION");
             BigDecimal ICESFIJ = getCampoNumerico(request, "ICESFIJ");             
             BigDecimal PCOMISI = getCampoNumerico(request, "PCOMISI");
             BigDecimal ICOMFIJ = getCampoNumerico(request, "ICOMFIJ");             
             BigDecimal ISCONTA = getCampoNumerico(request, "ISCONTA");             
             BigDecimal PINTRES = getCampoNumerico(request, "PINTRES");
             // BUG: 25502 AEG 2013-01-17 Se debe salvar PIMPINT en bd
             BigDecimal PIMPINT = getCampoNumerico(request, "PIMPINT");
             BigDecimal PRESERV = getCampoNumerico(request, "PRESERV");             
             //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
			 BigDecimal PRESREA = getCampoNumerico(request, "PRESREA");
			 //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
             BigDecimal CINTRES = getCampoNumerico(request, "COMBOINTERES");
             BigDecimal CCOMREA = getCampoNumerico(request, "COMBOCOMISIO");
             
             BigDecimal CTIPFAC = getCampoNumerico(request, "CTIPFAC");
             BigDecimal PTASAXL = getCampoNumerico(request, "PTASAXL"); 
             BigDecimal CCORRED = getCampoNumerico(request, "CCORRED");
             BigDecimal CFRERES = getCampoNumerico(request, "CFRERES");
             BigDecimal CRESREA = getCampoNumerico(request, "CRESREA");
             BigDecimal CCONREC = getCampoNumerico(request, "CCONREC");
             Date FGARPRI = stringToSqlDate(getCampoTextual(request, "FGARPRI")); 
             Date FGARDEP = stringToSqlDate(getCampoTextual(request, "FGARDEP"));
             String TIDFCOM = getCampoTextual(request, "TIDFCOM");
             BigDecimal SSEGURO = getCampoNumerico(request, "SSEGURO");
             //BigDecimal TMASIVO = getCampoNumerico(request, "TMASIVO");
             BigDecimal CPROPAGAFACUL = getCampoNumerico(request, "CPROPAGAFACUL");
             BigDecimal IFACCED = getCampoNumerico(request, "IFACCED"); // IAXIS-5361 09/07/2020
             // INICIO POST-74 30/06/2022 PAYV
             BigDecimal PFACCED = getCampoNumerico(request, "PFACCED"); 
             // FIN POST-74 30/06/2022 PAYV
            // BUG: 25502 AEG 2013-01-17 Se debe salvar PIMPINT en bd
			//INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            // Inicio IAXIS-5361 09/07/2020 Se agrega a la firma de la función el parámetro IFACCED  
             
             if (CPROPAGAFACUL.equals(new BigDecimal(0))){
            	 
            	 map = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC(SFACULT, CESTADO, FFINCUF, PLOCAL, IFACCED, PFACCED,CCOMPANIS,
							PCESION, ICESFIJ, CCOMREA, PCOMISI, ICOMFIJ, ISCONTA, PRESERV, PRESREA, CINTRES, PINTRES, CTIPFAC,
							PTASAXL, CCORRENIS, CFRERES, CRESREA, CCONREC, FGARPRI, FGARDEP, PIMPINT, TIDFCOM, SSEGURO, MODIFICACIO); // POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.
            	 
             }
             
             if (CPROPAGAFACUL.equals(new BigDecimal(1))){
            	 
            	 map = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC_CONTRA(SFACULT, CESTADO, FFINCUF, PLOCAL, IFACCED,  PFACCED,CCOMPANIS,
							PCESION, ICESFIJ, CCOMREA, PCOMISI, ICOMFIJ, ISCONTA, PRESERV, PRESREA, CINTRES, PINTRES, CTIPFAC,
							PTASAXL, CCORRENIS, CFRERES, CRESREA, CCONREC, FGARPRI, FGARDEP, PIMPINT, TIDFCOM, SSEGURO, MODIFICACIO); // POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.
             }
             
             if (CPROPAGAFACUL.equals(new BigDecimal(2))){
            	 
            	 map = pacIaxRea.ejecutaPAC_IAX_REA__F_SET_CUADRO_FAC_MAS(SFACULT, CESTADO, FFINCUF, PLOCAL, IFACCED,  PFACCED,CCOMPANIS,
							PCESION, ICESFIJ, CCOMREA, PCOMISI, ICOMFIJ, ISCONTA, PRESERV, PRESREA, CINTRES, PINTRES, CTIPFAC,
							PTASAXL, CCORRENIS, CFRERES, CRESREA, CCONREC, FGARPRI, FGARDEP, PIMPINT, TIDFCOM, SSEGURO, MODIFICACIO); // POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.
             }
             logger.debug(map);              
             request.setAttribute("grabarOk", BigDecimal.ZERO.equals(tratarRETURNyMENSAJES(request, map)));
             //INI POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.    
             if (MODIFICACIO.equals(new BigDecimal(1)))
                formdata.put("CAMBIAMOD", "1");
             else
            	 formdata.put("CAMBIAMOD", "0");
             //FIN POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.
         } catch (Exception e) {
        	 formdata.put("CAMBIAMOD", "0");
             logger.error("Error en el servicio Axisrea020Service - mtodo m_novaCompanyia",  e);
             thisAction.guardarMensaje(request, "1000050",  new Object[] { e.toString() },  Constantes.MENSAJE_ERROR);
             
         
         } finally {
            this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
         }
     }
     
     
    /**
     * Elimina el compnyia seleccionada.
     * @param usuario
     * @param CCOMPANI
     * @return
     * @throws Exception
     */
    private Map dbEliminaCompanyia(HttpServletRequest request, UsuarioBean usuario, BigDecimal SFACULT, BigDecimal CCOMPANI,BigDecimal CESTADO, BigDecimal CCORRED) throws Exception{ // POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.
        PAC_IAX_REA pacIaxRea = new PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
        Map map =  new PAC_IAX_REA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_REA__F_ANULA_CIA_FAC(SFACULT,CESTADO,CCOMPANI,CCORRED); // POST-230 MPC 27/12/2022 Se modifican condiciones de entrada.       
        logger.debug(map);
        return map;
    }
     
    /**
     * Borra una companyia de la lista de companyias.
     * @param request El HttpServletRequest que contiene la peticin del cliente web.
     */
     public void m_ajax_delete_companyia(HttpServletRequest request) {
         logger.debug("Axisrea020Service m_ajax_delete_companyia");
         UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
         AjaxContainerService ajax = new AjaxContainerService();
         
         try{ 
                BigDecimal SFACULT    = getCampoNumerico(request, "SFACULT");
                BigDecimal CCOMPANI = getCampoNumerico(request, "CCOMPANI");       
                BigDecimal CESTADO = getCampoNumerico(request, "CESTADO");       
                BigDecimal CCORRED = getCampoNumerico(request, "CCORRED"); // POST-230 MPC 27/12/2022 Se crea variable.
                BigDecimal CCOD_PK = getCampoNumerico(request, "CCOD_PK");  // POST-230 MPC 27/12/2022 Se crea variable.
                List companyias = (List) request.getSession().getAttribute("T_IAX_CUACESFAC");
                
                // Borrar de BD
                Map eliminaCompanyia = this.dbEliminaCompanyia(request,usuario, SFACULT, CCOMPANI,CESTADO,CCORRED); // POST-230 MPC 27/12/2022 Se agrega campo ccorred.
                BigDecimal eliminaCompanyiaReturn = (BigDecimal) ajax.rellenarPlAContenedorAjax(eliminaCompanyia);
                
                if (eliminaCompanyiaReturn.equals(new BigDecimal(0))){
                    // Borrar de la lista de sesin  
                    //INI POST-230 MPC 27/12/2022 Se modifica llave tabla.    
                    //eliminaCompanyia.remove(CCOMPANI);         
                    eliminaCompanyia.remove(CCOD_PK);
                    //FIN POST-230 MPC 27/12/2022 Se modifica llave tabla.
                    ajax.guardarContenidoFinalAContenedorAjax(eliminaCompanyia);                    
                    request.getSession().setAttribute ("T_IAX_CUACESFAC", ((companyias == null)? new ArrayList():companyias) );
                    companyias = null;            
            }
        } catch (Exception e) {
            logger.error("Error en el servicio Axisrea020Service - mtodo m_ajax_delete_companyia", e);
            ajax.rellenarExcepcionAContenedorAjax(e);
        } finally {
            request.setAttribute(Constantes.AJAXCONTAINER, ajax.procesarContenedorAjax());
        }
     }
     
     
}
