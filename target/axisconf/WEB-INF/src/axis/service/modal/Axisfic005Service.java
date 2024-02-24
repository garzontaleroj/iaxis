//Revision:# XcI7xfWn2DOW95PafAQffg== #
package axis.service.modal;


import java.math.BigDecimal;
import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAX_FINANCIERA;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.jdbc.PAC_IAX_OPERATIVA_FINV;
import axis.jdbc.PAC_IAX_PARAM;
import axis.jdbc.PAC_IAX_PERSONA;
import axis.mvc.control.AbstractDispatchAction;
import axis.mvc.control.modal.Axisfic005Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;


public class Axisfic005Service extends AxisBaseService{
    Log logger = LogFactory.getLog(this.getClass());

    /*********************************************************************************************************************/
    /************************************************ MÉTODOS DE INICIALIZACIÓN*******************************************/
    /*********************************************************************************************************************/
    /* INI --IAXIS-15657 -- JLTS -- 09/06/2021*/
    public static <E> E nvl(E expr1, E expr2) {
        return (null != expr1) ? expr1 : expr2;
    }
    /* FIN --IAXIS-15657 -- JLTS -- 09/06/2021*/
    /**
     * Realiza la carga inicial de la pantalla.
     * @param request El HttpServletRequest que contiene la petición del cliente web.
     */
    public void m_form(HttpServletRequest request, Axisfic005Action thisAction) {
        logger.debug("Axisfic005Service m_form");
        UsuarioBean usuario = (UsuarioBean) request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map) request.getAttribute(Constantes.FORMDATA);
        
        try {            
            /* Desplegables */
            cargarValoresDesplegables(request, usuario, formdata);
            
            /* Cargar dirección (sólo si hay CDOMICI) */
            BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
            if (SPERSON == null){
                try{
                 SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
                }catch(Exception ex){  SPERSON = null;}
            }

            BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
            if (SFINANCI == null){
                try{
                	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
                }catch(Exception ex){  SFINANCI = null;}
            }
            formdata.put("SFINANCI", bigDecimalToString(SFINANCI));
            
            
            BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
            if (NMOVIMI == null){
                try{
                	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
                }catch(Exception ex){  NMOVIMI = null;}
            }
            formdata.put("NMOVIMI", bigDecimalToString(NMOVIMI));
      //post123      
			String CMODO = getCampoTextual(request, "CMODO");
			if (CMODO == null) {
				try {
					CMODO = new String(String.valueOf(request.getParameter("CMODO")));
				} catch (Exception ex) {
					CMODO = null;
				}
            }        
			formdata.put("CMODO", CMODO);			     //post123    
            formdata.put("CESVALOR", new BigDecimal("1")); 
             
			//if (SFINANCI != null && (CMODO.equals(new BigDecimal("1")) || CMODO.equals(new BigDecimal("2")))) {
            	
            	m_buscar(request, thisAction);
            	m_consultarMonedaCambio(request, thisAction);
			//}
            
            
        } catch(Exception e) {
            logger.error("Error en el método Axisfic005Service.m_form", e);
            AbstractDispatchAction.guardarMensaje(request, "1000052", new Object[] {e.toString()}, Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    }
    
    /**
     * Realiza una carga de BD de los valores estáticos que contiene cada desplegable de la pantalla.
     * @param request El HttpServletRequest que contiene la petición del cliente web.
     * @param usuario El UsuarioBean activo.
     * @param formdata HashMap que contiene los valores de los request parameters.
     * @throws Exception
     */
    
    private void cargarValoresDesplegables(HttpServletRequest request, UsuarioBean usuario, Map formdata) throws Exception {
        // Carga de valores de los desplegables
        Map listValores = new HashMap();
        try {
            PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));            
            PAC_IAX_PARAM pac_axis_param = new PAC_IAX_PARAM((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));            
            
            
            // Lista de valores
            Map map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8001075));
            logger.debug(map);
            listValores.put("lstEsValores", (List) tratarRETURNyMENSAJES(request, map));
            
            map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(176));
            logger.debug(map);
            listValores.put("lstMonedas", (List) tratarRETURNyMENSAJES(request, map));
            
            
            PAC_IAX_OPERATIVA_FINV pac_axis_operativa = new PAC_IAX_OPERATIVA_FINV((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)); 
            Map mapa = pac_axis_operativa.ejecutaPAC_IAX_OPERATIVA_FINV__F_MONEDAS(); 
            logger.debug(mapa);
            List listaMonedas = (List)tratarRETURNyMENSAJES(request,mapa,false);
            //request.setAttribute("listaMon",listaMonedas);
            formdata.put("listaMon", listaMonedas);
            
            
            
            map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(176));
            logger.debug(map);
            listValores.put("lstMonedasCambio", (List) tratarRETURNyMENSAJES(request, map));
            
            /* Cambio para IAXIS-15710 : Start */
              // INI - TCS_MAMB POST89 - 18/07/2021 
                 //map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002037));
                 
	                 String VCONDICIONS = "sfinanci ="+ new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
	            
		            map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(8002037),VCONDICIONS);//TCS_MAMB POST89 - 18/07/2021 
		            logger.debug(map);
		            listValores.put("lstSectorEmpresa", (List) tratarRETURNyMENSAJES(request, map));                       
		         
		            String VCONDICION = "sfinanci ="+ new BigDecimal(String.valueOf(request.getParameter("SFINANCI")))+" and ( nmovimi ="+new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
			           
		           // map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal(8002038));
		            map = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORESCOND(new BigDecimal(8002038),VCONDICION);
		            logger.debug(map);
		            listValores.put("lstTamanoEmpresa", (List) tratarRETURNyMENSAJES(request, map));
	          //FIN - TCS_MAMB POST89 - 18/07/2021
            /* Cambio para IAXIS-15710 : End */
           
        } catch (Exception e) {
            logger.error("Error en el método Axisfic005Service.cargarValoresDesplegables", e);
            AbstractDispatchAction.guardarMensaje(request, "1000050", new Object[] {e.toString()}, Constantes.MENSAJE_ERROR);
        } finally {
            formdata.put("listValores", listValores);
        }
    }

    /*********************************************************************************************************************/
    /************************************************ MÉTODOS DE ACTUALIZACIÓN *******************************************/
    /*********************************************************************************************************************/
    
    /**
     * Método que busca la informacion general
     * 
     * @param request
     * @param thisAction
     */
    public void m_buscar(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_buscar");

        try {
        	
	        	BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
	            if (SFINANCI == null){
	                try{
	                	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
	                }catch(Exception ex){  SFINANCI = null;}
	            }
	                        	
	                    Date FCONSULTA = stringToSqlDate(getCampoTextual(request, "FCONSULTA"));
	                    
	                    
	            BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
	            if (NMOVIMI == null){
	                  try{
	                     	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
	                        }catch(Exception ex){  NMOVIMI = null;}
	                  }
	                  formdata.put("NMOVIMI", bigDecimalToString(NMOVIMI));        
	                    
	            
	            BigDecimal CFUENTE = getCampoNumerico(request, "CFUENTE");
	    	    if (CFUENTE == null){
	    	        try{
	    	        	CFUENTE = new BigDecimal(String.valueOf(request.getParameter("CFUENTE")));
	    	        }catch(Exception ex){  CFUENTE = null;}
	    	    }        
	                  

				String CMONORI = getCampoTextual(request, "CMONORI");
	             String CMONDES = getCampoTextual(request, "CMONCAM");

					  
        	PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			// --INI IAXIS-15657 --JLTS --09/06/2021
        	Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_CONPARAM(SFINANCI, NMOVIMI, CMONORI, CMONDES, null);
			// --FIN IAXIS-15657 --JLTS --09/06/2021
            List <Map> lstParCuenta = (List<Map>) tratarRETURNyMENSAJES(request, map);
            logger.debug(map);
            if(!isEmpty(map)&&lstParCuenta != null){
            	formdata.put("lstParCuenta", lstParCuenta);
            }    

            Map map1 = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_PARCUENTA(SFINANCI);
            List <Map> lstIndicador = (List<Map>) tratarRETURNyMENSAJES(request, map1);
            logger.debug(map1);
            if(!isEmpty(map1)&&lstIndicador != null){
            	formdata.put("lstIndicador", lstIndicador);
            }    
            
            
            
            map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_INDICADOR(SFINANCI, NMOVIMI);
            List <Map> lstIndicadorB = (List<Map>) tratarRETURNyMENSAJES(request, map);
            
            logger.debug(map);
            formdata.put("lstIndicadorB", lstIndicadorB);
            
            if(!isEmpty(map)&&lstIndicadorB!=null){
            	formdata.put("lstIndicadorB", lstIndicadorB);
	            for (Map iLstIndicadorB : lstIndicadorB) {
	            	if(NMOVIMI.equals(iLstIndicadorB.get("NMOVIMI"))){	
	            		 formdata.putAll(iLstIndicadorB);
	            	}	 
	            }
            }    
            
            pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
            map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(SFINANCI);
            List <Map> lstPersonaFin = (List<Map>) tratarRETURNyMENSAJES(request, map);   
            logger.debug(map);
            if(!isEmpty(map)&&lstPersonaFin!=null){
            	formdata.put("lstPersonaFin", lstPersonaFin);
            	for (Map iLstPersonaFin : lstPersonaFin) {
	            		 formdata.putAll(iLstPersonaFin);
	            }
            }
            
            m_buscar_indica_fin(request, thisAction);  
            
                        
        } catch (Exception e) {
            logger.error("Error en el servicio Axisfic005Service - método m_buscar", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
    }
    
    
    /**
     * Método que almacena la informacion general
     * 
     * @param request
     * @param thisAction
     */
    public void m_aceptar(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_aceptar");

        try {
        	
	        	BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
	        	if (SFINANCI == null){
	                try{
	                	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
	                }catch(Exception ex){  SFINANCI = null;}
	            }
	        	
	        	BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
	        	if (NMOVIMI == null){
	                try{
	                	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
	                }catch(Exception ex){  NMOVIMI = null;}
	            }
	        	
	        	
	        	
	        		 String CMODO  = getCampoTextual(request, "CMODO");
	        	if (CMODO == null){
		                try{
		                	CMODO = "CMODOF";
		                }catch(Exception ex){  CMODO = null;}
		        }    
	        	    
	        	PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
	        		        	
	        	BigDecimal IMARGEN   = getCampoNumerico(request, "IMARGEN");
	        	BigDecimal ICAPTRAB  = getCampoNumerico(request, "ICAPTRAB"); 	
	        	    String TRAZCOR    = getCampoTextual(request, "TRAZCOR");
	        	    String TPRBACI    = getCampoTextual(request, "TPRBACI");
	        	BigDecimal IENDUADA  = getCampoNumerico(request, "IENDUADA");
	        	BigDecimal NDIACAR   = getCampoNumerico(request, "NDIACAR");
	        	BigDecimal NROTPRO   = getCampoNumerico(request, "NROTPRO");
	        	BigDecimal NROTINV   = getCampoNumerico(request, "NROTINV");
	        	BigDecimal NDIACICL  = getCampoNumerico(request, "NDIACICL");
	        	BigDecimal IRENTAB   = getCampoNumerico(request, "IRENTAB");
	        	BigDecimal IOBLCP    = getCampoNumerico(request, "IOBLCP");
	        	BigDecimal IOBLLP    = getCampoNumerico(request, "IOBLLP");
	        	BigDecimal IGASTFIN  = getCampoNumerico(request, "IGASTFIN");
	        	BigDecimal IVALPT    = getCampoNumerico(request, "IVALPT");
	        	BigDecimal CESVALOR  = getCampoNumerico(request, "CESVALOR");  
	        	    String CMONEDA   = getCampoTextual(request, "CMONORI");
	        	      Date FCUPO     = stringToSqlDate(getCampoTextual(request, "FCUPO"));
	        	BigDecimal ICUPOG    = getCampoNumerico(request, "ICUPOG");
	  	        BigDecimal ICUPOS    = getCampoNumerico(request, "ICUPOS"); 
	  	              Date FCUPOS    = stringToSqlDate(getCampoTextual(request, "FCUPOS"));
	        	    String TCUPOR    = getCampoTextual(request, "TCUPOR");
	        	    String TCONCEPC  = getCampoTextual(request, "TCONCEPC");	    
	        	    String TCONCEPS  = getCampoTextual(request, "TCONCEPS");
	        	    String TCBUREA   = getCampoTextual(request, "TCBUREA");
	        	    String TCOTROS   = getCampoTextual(request, "TCOTROS");
	        	    String CMONCAM   = getCampoTextual(request, "CMONCAM");
	        	BigDecimal NCAPFIN   = getCampoNumerico(request, "NCAPFIN");    
	        	
	        	/* Cambio para IAXIS-15710 : Start */
	        	BigDecimal SECTOR_EMPRESA   = getCampoNumerico(request, "SECTOR_EMPRESA");
	        	BigDecimal TAMANO_EMPRESA   = getCampoNumerico(request, "TAMANO_EMPRESA");   
	        	/* Cambio para IAXIS-15710 : End */
	        	    
            /*
            Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_INDICADOR(SFINANCI, NMOVIMI, CMODO, IMARGEN, ICAPTRAB, 
            																			 TRAZCOR, TPRBACI, IENDUADA, NDIACAR, NROTPRO, 
            																			 NROTINV, NDIACICL, IRENTAB, IOBLCP, IOBLLP, 
            																			 IGASTFIN, IVALPT, CESVALOR, CMONEDA, FCUPO, 
            																			 ICUPOG, ICUPOS, FCUPOS, TCUPOR, TCONCEPC, 
            																			 TCONCEPS, TCBUREA, TCOTROS, CMONCAM);
            */
         //BUG_OPTIMIZACION OI-45: Star. 
	        Map mapindcli1 = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_INDICADORES_CLIENTE(SFINANCI, NMOVIMI, null, null);
            
            Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_INDICADOR(SFINANCI, 
            																			 NMOVIMI, 
            																			   CMODO, 
            																			(BigDecimal) mapindcli1.get("PMAROPECL"), 
            																			(BigDecimal) mapindcli1.get("PCAPTRACL"), 
            																			 (mapindcli1.get("PRAZCORCL")!=null)?mapindcli1.get("PRAZCORCL").toString():"", 
            																			 (mapindcli1.get("PPRUACICL")!=null)?mapindcli1.get("PPRUACICL").toString():"", 
            																			(BigDecimal) mapindcli1.get("PENDTOTCL"), 
            																			(BigDecimal) mapindcli1.get("PROTCARCL"), 
            																			(BigDecimal) mapindcli1.get("PROTPROCL"), 
            																			(BigDecimal) mapindcli1.get("PROTINVCL"), 
            																			(BigDecimal) mapindcli1.get("PCICEFECL"), 
            																			(BigDecimal) mapindcli1.get("PRENTABCL"), 
            																			(BigDecimal) mapindcli1.get("POBFICPCL"), 
            																			(BigDecimal) mapindcli1.get("POBFILPCL"), 
            																			(BigDecimal) mapindcli1.get("PGASFINCL"), 
            																	        //BUG_OPTIMIZACION OI-45: End. 
													                                    IVALPT, 
            																			CESVALOR, 
            																			 CMONEDA, 
            																			   FCUPO, 
            																			  ICUPOG, 
            																			  ICUPOS, 
            																			  FCUPOS, 
            																			  TCUPOR, 
            																			TCONCEPC, 
            																			TCONCEPS, 
            																			 TCBUREA, 
            																			 TCOTROS, 
            																			 CMONCAM,
            																			 NCAPFIN
            																			 /* Cambio para IAXIS-15710 : Start */
            																			 ,SECTOR_EMPRESA,
            																			 TAMANO_EMPRESA
            																			 /* Cambio para IAXIS-15710 : End */
            																			 );
                                    
            request.setAttribute("resultado", (BigDecimal) tratarRETURNyMENSAJES(request, map));  
            
        } catch (Exception e) {
            logger.error("Error en el servicio Axisfic005Service - método m_aceptar", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
    }
    
    
    /**
     * Método que realiza calculos.
     * 
     * @param request
     * @param thisAction
     */
    public void m_calcular(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_calcular");

        try {
        	
        	/* Desplegables */
            cargarValoresDesplegables(request, usuario, formdata);
        	
            m_buscar(request, thisAction);
            
        	BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
        	if (SFINANCI == null){
                try{
                	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
                }catch(Exception ex){  SFINANCI = null;}
            }
        	
        	BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
        	if (NMOVIMI == null){
                try{
                	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
                }catch(Exception ex){  NMOVIMI = null;}
            }
        	
        	BigDecimal CESVALOR   = getCampoNumerico(request, "CESVALOR");
        	
        	
        	String CMONORI = getCampoTextual(request, "CMONORI");
            String CMONDES = getCampoTextual(request, "CMONCAM");
        	PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
            // INI - IAXIS-15657 - JLTS - 09/06/2021
            String auxObliga = "Falta diligenciar :";
            String mensObliga = null;
            Map validaObliga = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_CONPARAM(SFINANCI, NMOVIMI, null, null, new BigDecimal(1));
            tratarRETURNyMENSAJES(request,validaObliga);
            ArrayList c = (ArrayList)validaObliga.get("RETURN");
            
            for(int i=0;i<c.size();i++){   
                HashMap r = (HashMap)c.get(i);
                if (r.get("TVALPAR") == null &&  r.get("NVALPAR") == null && r.get("FVALPAR") == null ) {
                	mensObliga = nvl(mensObliga,"") + r.get("TPARAM") + " , ";
                }
            }
            if (mensObliga != null && mensObliga != "") {
            	mensObliga = auxObliga + mensObliga;
            	mensObliga = mensObliga.substring(0,mensObliga.length()-2);
                logger.debug("MENSOBLIGA: "+mensObliga);
                thisAction.guardarMensaje(request, "verbatim:"+mensObliga , null ,Constantes.MENSAJE_INFO);
            }
            else {
        	Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_CALCULA_MODELO(SFINANCI, NMOVIMI, CESVALOR, CMONORI, CMONDES);
            logger.debug(map);
            if(map.get("RETURN").equals(new BigDecimal("0"))){
	            BigDecimal PCUPOSUG = (BigDecimal)map.get("PCUPOSUG");
	            BigDecimal PCUPOGAR = (BigDecimal)map.get("PCUPOGAR");
	            BigDecimal PCAPAFIN = (BigDecimal)map.get("PCAPAFIN");
	            formdata.put("ICUPOS", PCUPOSUG);
	            formdata.put("ICUPOG", PCUPOGAR);
	            formdata.put("NCAPFIN", PCAPAFIN);
	            // INI - TCS_3 - JLTS - 20/02/2018 - Se adicionan los parámetros ICUPOSV1, ICUPOGV1 y NCAPFINV1
	            BigDecimal PCUPOSUGV1 = (BigDecimal)map.get("PCUPOSUGV1");
	            BigDecimal PCUPOGARV1 = (BigDecimal)map.get("PCUPOGARV1");
	            BigDecimal PCAPAFINV1 = (BigDecimal)map.get("PCAPAFINV1");
	            formdata.put("ICUPOSV1", PCUPOSUGV1);
	            formdata.put("ICUPOGV1", PCUPOGARV1);
	            formdata.put("NCAPFINV1", PCAPAFINV1);
	            // INI - TCS_3 - JLTS - 20/02/2018 - Se adicionan los parámetros ICUPOSV1, ICUPOGV1 y NCAPFINV1
	            
	            // INI - TCS_9998 IAXIS-2490 - 24/02/2019 -  JLTS - Se adicionan campos PNCONTPOL y PNANIOSVINC
	            BigDecimal PNCONTPOL = (BigDecimal)map.get("PNCONTPOL");
	            BigDecimal PNANIOSVINC = (BigDecimal)map.get("PNANIOSVINC");
	            formdata.put("NCONTPOL", PNCONTPOL);
	            formdata.put("NANIOSVINC", PNANIOSVINC);
	            // FIN - TCS_9998 IAXIS-2490 - 24/02/2019 -  JLTS
	            
	            // INI - TCS_MAMB POST89 - 18/07/2021 - Se adicionan campos psector y ptamano
	            BigDecimal psector = (BigDecimal)map.get("psector");
	            BigDecimal ptamano = (BigDecimal)map.get("ptamano");
	            formdata.put("psector", psector);
	            formdata.put("ptamano", ptamano);
	            // FIN - TCS_MAMB POST89 - 18/07/2021 - Se adicionan campos psector y ptamano
	            
	            
	            thisAction.guardarMensaje(request, "111313", new Object[] { map.get("MENSAJES") },Constantes.MENSAJE_INFO);
            }else if(map.get("RETURN").equals(new BigDecimal("1"))){
            	//BigDecimal PCUPOSUG = new BigDecimal("0");
	            //BigDecimal PCUPOGAR = new BigDecimal("0");
	            //formdata.put("ICUPOS", PCUPOSUG);
	            //formdata.put("ICUPOG", PCUPOGAR);
            	 thisAction.guardarMensaje(request, "1000254", new Object[] { map.get("MENSAJES") },Constantes.MENSAJE_INFO);
            }else {
            	thisAction.guardarMensaje(request, map.get("RETURN").toString(), new Object[] { map.get("MENSAJES") },Constantes.MENSAJE_INFO);
            }
            

           } 
            pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
        	Map map1 = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(SFINANCI);
            List <Map> lstPersonaFin = (List<Map>) tratarRETURNyMENSAJES(request, map1);   
            logger.debug(map1);
            if(!isEmpty(map1)&&lstPersonaFin!=null){
            	formdata.put("lstPersonaFin", lstPersonaFin);
            	for (Map iLstPersonaFin : lstPersonaFin) {
	            		 formdata.putAll(iLstPersonaFin);
	            }
            }
            // FIN - IAXIS-15657 - JLTS - 09/06/2021
        } catch (Exception e) {
            logger.error("Error en el servicio Axisfic005Service - método m_calcular", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        }
        
        this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    }
    
    
    /**
     * Método que se conecta con CIFIN
     * 
     * @param request
     * @param thisAction
     */
    public void m_conectar(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_conectar");

        try {
        	
	        	
            
            
        } catch (Exception e) {
            logger.error("Error en el servicio Axisfic005Service - método m_conectar", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
    }
    
    
    /**
     * Método que busca la informacion de la tabla INT_CARGA_INFORMACOL
     * 
     * @param request
     * @param thisAction
     */
    public void m_buscar_informacol(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_buscar_informacol");
        
        Map OBPERSONACI = new HashMap();
        OBPERSONACI.put("isNew", Boolean.valueOf(true));
        
        try {
        	
    	    /* Desplegables */
            cargarValoresDesplegables(request, usuario, formdata);
    	
    	 
            BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
            if (SFINANCI == null){
                try{
                	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
                }catch(Exception ex){  SFINANCI = null;}
            }
            
            
            BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
            if (NMOVIMI == null){
                try{
                	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
                }catch(Exception ex){  NMOVIMI = null;}
            }

            
        	BigDecimal SPERSON = getCampoNumerico(request, "SPERSON");
      
            if (SPERSON == null){
                try{
                	SPERSON = new BigDecimal(String.valueOf(request.getParameter("SPERSON")));
                }catch(Exception ex){  SPERSON = null;}
            }
           
            BigDecimal CAGENTE = getCampoNumerico(request, "CAGENTE");
  	      
            if (CAGENTE == null){
                try{
                	CAGENTE = new BigDecimal(String.valueOf(request.getParameter("CAGENTE")));
                }catch(Exception ex){  CAGENTE = null;}
            }
             
            /* Estado persona */
            if (!isEmpty(SPERSON)) {    
                    OBPERSONACI.put("isNew", Boolean.valueOf(false));
            
                    
                    PAC_IAX_PERSONA pac_axis_persona = new PAC_IAX_PERSONA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)); 
                    Map map = pac_axis_persona.ejecutaPAC_IAX_PERSONA__F_GET_PERSONA(SPERSON,CAGENTE);
                    logger.debug(map);        
	                BigDecimal RETURN = (BigDecimal) tratarRETURNyMENSAJES(request, map);    
	                
	                
	                if (!isEmpty(map) && new BigDecimal(0).equals(RETURN)) {
	                    OBPERSONACI = (Map) map.get("OBPERSONA");    
	                    BigDecimal CTIPPER = (BigDecimal) OBPERSONACI.get("CTIPPER");
	                        String NIT = (String)OBPERSONACI.get("NNUMIDE");
	                      
	                      if(CTIPPER!=null){  

	                    	  /*INI-CES-IAXIS-WSINFORMA-ECUACION PATRIMONIAL-16/04/2019*/
	                    	  					BigDecimal activoTotal = new BigDecimal("0");
			                                	BigDecimal pasivoTotal = new BigDecimal("0");
			                                	BigDecimal patrimonio = new BigDecimal("0");
			                                	BigDecimal activoCte = new BigDecimal("0");
			                                	BigDecimal activoNoCte = new BigDecimal("0");
			                                	BigDecimal pasivoCte = new BigDecimal("0");
			                                	BigDecimal pasivoNocte = new BigDecimal("0");
			                    /*END-CES-IAXIS-WSINFORMA-ECUACION PATRIMONIAL-16/04/2019*/
	                        	/* Added for IAXIS-4945 PK-01/08/2019 - Start */
	    	  					BigDecimal reservaLegal = new BigDecimal("0");
	                        	BigDecimal capitalSocial = new BigDecimal("0");
	                        	BigDecimal resultEjerAnteriores = new BigDecimal("0");
	                        	BigDecimal primaColAcciones = new BigDecimal("0");
	                        	BigDecimal reservasOcasionales = new BigDecimal("0");
	                        	BigDecimal asignadoInvSuppl = new BigDecimal("0");
	                        	BigDecimal patrimonioLiquido = new BigDecimal("0");
	                        	BigDecimal defVal = new BigDecimal("0");
	                        	/* Added for IAXIS-4945 PK-01/08/2019 - End */
		                        PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
		                        Map mapA = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_INT_CARGA_INFORMACOL(NIT);
		                        List <Map> lstInformaCol = (List<Map>) tratarRETURNyMENSAJES(request, mapA);                   
		                        logger.debug(mapA);
		                        if(lstInformaCol!=null&&!lstInformaCol.isEmpty()){
		                        	List<Map> lstPCAux = new ArrayList<Map>();
			                        for (Map iLstInformaCol : lstInformaCol) {		                        		
			                        	if(NIT.equals(iLstInformaCol.get("NIT"))){
			                        		
			                        		/* Cambio para IAXIS-15710 : Start */
			                        		formdata.put("TAMANO_EMPRESA", iLstInformaCol.get("ST_DECRETO")); 
			                        		/* Cambio para IAXIS-15710 : End */
			                        		
			                        		pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
											// --INI IAXIS-15657 --JLTS --09/06/2021
			                            	Map mapB = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_CONPARAM(SFINANCI, NMOVIMI, null, null, null);
											// --FIN IAXIS-15657 --JLTS --09/06/2021
			                            //    Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_PARCUENTA(SFINANCI);
			                                List <Map> lstParCuenta = (List<Map>) tratarRETURNyMENSAJES(request, mapB);
			                                logger.debug(mapB);
			                                if(!isEmpty(mapB)&&lstParCuenta != null){
			                                	
			                                  	for (Map iLstParCuenta: lstParCuenta) {
			                                  		
			                                  		 
			                                  		if(iLstParCuenta.get("CPARAM").equals("FUENTE_INFORMACION")){
			                    	            	    iLstParCuenta.put("NVALPAR", new BigDecimal("1")); 
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("FECHA_EST_FIN")){
			                    	            	    iLstParCuenta.put("FVALPAR", iLstInformaCol.get("FECESTFINAN")); 
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("VT_PER_ANT")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("VENTASPERANT"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("VENTAS")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("VENTAS"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("COSTO_VT")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("COSTOVENTAS"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("GASTO_ADM")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("GASTOSADM"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("UTIL_OPERAC")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("UTLOPERACIONAL"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("GASTO_FIN")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("GASTOSFINAN"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("RES_ANT_IMP")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("RESULTANTIMP"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("UTIL_NETA")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("UTLNETA"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("INVENT")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("INVENTARIO"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("CARTE_CLIE")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("CARTCLIENTE"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("ACT_CORR")){
			                    	            		activoCte = (BigDecimal) (iLstInformaCol.get("ACTCORRIENTE") == null? defVal: iLstInformaCol.get("ACTCORRIENTE"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("ACTCORRIENTE"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PROP_PLNT_EQP")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PROPPLANEQUIPO"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("TOT_ACT_NO_CORR")){
			                    	            		activoNoCte = (BigDecimal) (iLstInformaCol.get("TOTACTNOCORRIENTE") == null? defVal: iLstInformaCol.get("TOTACTNOCORRIENTE"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("TOTACTNOCORRIENTE"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("ACT_TOTAL")){
			                    	            		activoTotal = (BigDecimal) (iLstInformaCol.get("ACTIVOTOTAL") == null? defVal: iLstInformaCol.get("ACTIVOTOTAL"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("ACTIVOTOTAL"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("O_FIN_CORTO_PLAZO")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("OBLIGFINANCP"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PROVEE_CORTO_PLAZO")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PROVEEDORESCP"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("ATC_CORTO_PLAZO")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("ANTICIPOCP"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PAS_CORR")){
			                    	            		pasivoCte = (BigDecimal) (iLstInformaCol.get("PASCORRIENTE") == null? defVal: iLstInformaCol.get("PASCORRIENTE"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PASCORRIENTE"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("O_FIN_LARGO_PLAZO")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("OBLIGFINANLP"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("ATC_LARGO_PLAZO")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("ANTICIPOLP"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PAS_NO_CORR")){
			                    	            		pasivoNocte = (BigDecimal) (iLstInformaCol.get("TOTPASCORRIENTE") == null? defVal: iLstInformaCol.get("TOTPASCORRIENTE"));// GAI-97 22/08/2022 BJHB          	            		
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("TOTPASCORRIENTE"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PAS_TOTAL")){
			                    	            		pasivoTotal = (BigDecimal) (iLstInformaCol.get("PASTOTAL") == null? defVal: iLstInformaCol.get("PASTOTAL"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PASTOTAL"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PATRI_PERI_ANT")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PATRIPERANT"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PATRI_ANO_ACTUAL")){
			                    	            		patrimonio = (BigDecimal) (iLstInformaCol.get("PATRIANOACT") == null? defVal: iLstInformaCol.get("PATRIANOACT"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PATRIANOACT"));
			                    	            	}
			                                  		/* Added for IAXIS-4945 PK-01/08/2019 - Start */
			                    	            	else if(iLstParCuenta.get("CPARAM").equals("RESV_LEGAL")){
			                    	            		reservaLegal = (BigDecimal) (iLstInformaCol.get("RESLEGAL") == null ? defVal : iLstInformaCol.get("RESLEGAL"));
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("RESLEGAL"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("CAP_SOCIAL")){
			                    	            		capitalSocial = (BigDecimal) (iLstInformaCol.get("CAPSOCIAL") == null ? defVal : iLstInformaCol.get("CAPSOCIAL"));
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("CAPSOCIAL"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("RES_EJER_ANT")){
			                    	            		resultEjerAnteriores = (BigDecimal) (iLstInformaCol.get("RESEJERANT") == null ? defVal : iLstInformaCol.get("RESEJERANT"));
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("RESEJERANT"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("PRIMA_ACCION")){
			                    	            		primaColAcciones = (BigDecimal) (iLstInformaCol.get("PRICOLACC") == null ? defVal : iLstInformaCol.get("PRICOLACC"));
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("PRICOLACC"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("RESV_OCASI")){
			                    	            		reservasOcasionales = (BigDecimal) (iLstInformaCol.get("RESOCASIONAL") == null ? defVal : iLstInformaCol.get("RESOCASIONAL"));
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("RESOCASIONAL"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("VALORIZA")){
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("VALORIZACION"));
			                    	            	}else if(iLstParCuenta.get("CPARAM").equals("ASIGNADO")){
			                    	            		asignadoInvSuppl = (BigDecimal) (iLstInformaCol.get("INVSUPLCAP") == null ? defVal : iLstInformaCol.get("INVSUPLCAP"));
			                    	            		iLstParCuenta.put("TVALPAR", iLstInformaCol.get("INVSUPLCAP"));
			                    	            	} else if(iLstParCuenta.get("CPARAM").equals("PATRI_LIQUIDO")) {
			                    	            		patrimonioLiquido = (BigDecimal) (iLstInformaCol.get("PATRILIQUIDO") == null? defVal: iLstInformaCol.get("PATRILIQUIDO"));// GAI-97 22/08/2022 BJHB
			                    	            		iLstParCuenta.put("NVALPAR", patrimonioLiquido);
			                    	            	}
			                                  		/* Added for IAXIS-4945 PK-01/08/2019 - End */
			                    	            }
			                                  	/* Added for IAXIS-4945 PK-01/08/2019 - Start */
			                                  	if (isEmpty(patrimonioLiquido)) {
	                    	            			patrimonioLiquido = reservaLegal.add(capitalSocial).add(resultEjerAnteriores)
	                    	            					.add(primaColAcciones).add(reservasOcasionales).add(asignadoInvSuppl);
												}
			                                  	/* Added for IAXIS-4945 PK-01/08/2019 - End */
			                                  	
			                                  	/*INI-CES-IAXIS-WSINFORMA-ECUACION PATRIMONIAL-16/04/2019*/
			                                  	/* Validar la ecuación patrimonial en WS Informa */
			                                  	/* Added for IAXIS-4945 PK-01/08/2019 - Start */
			                                  	//Map validaEqPat = this.validaEquPatrimonial(activoTotal, pasivoTotal, patrimonio, activoCte, activoNoCte, pasivoCte, pasivoNocte);
			                                  	/* INI --IAXIS-15467 --JLTS 2021/05/18. Se adiciona la requesty el thisAction */
			                                  	Map validaEqPat = this.validaEquPatrimonial(request,thisAction,activoTotal, pasivoTotal, patrimonio, activoCte, activoNoCte, pasivoCte, pasivoNocte,
			                                  			reservaLegal, capitalSocial, resultEjerAnteriores, primaColAcciones,
			                                  			reservasOcasionales, asignadoInvSuppl, patrimonioLiquido);
			                                  	/* FIN --IAXIS-15467 --JLTS 2021/05/18 */
			                                  	/* Added for IAXIS-4945 PK-01/08/2019 - End */
			                                  	
			                                  	if(validaEqPat.get("estado").toString().equals("false")) {
			                                  		
			                                  		thisAction.guardarMensaje(request, "1000050", new Object[] {validaEqPat.get("mensaje") },Constantes.MENSAJE_ERROR);
			                                  		
			                                  	}else {
			                                   
			                                  	/*END-CES-IAXIS-WSINFORMA-ECUACION PATRIMONIAL-16/04/2019*/
				                                  	for (Map iLstParCuenta: lstParCuenta) {
				                                  		
														BigDecimal NVALPAR = null;
				                                  		if(iLstParCuenta.get("NVALPAR")!=null){
				                                  			String  VALUE = String.valueOf(iLstParCuenta.get("NVALPAR"));
	                                                                                if(VALUE!= null && !VALUE.equals(""))
	                                                                                    NVALPAR = new BigDecimal(VALUE.replace(".", "").replace(",", ".")); 
				                                  		}
				                                  		String  TVALPAR = null;
				                                  		if(iLstParCuenta.get("TVALPAR")!=null){
				                                  			String TVALUE = String.valueOf(iLstParCuenta.get("TVALPAR"));
				                                  							if(TVALUE!= null && !TVALUE.equals(""))   
				                                  								TVALPAR = TVALUE.replace(".", "").replace(",", "."); 
				                                  		}
				                                  		Date FVALPAR = null;
				                                  		if(iLstParCuenta.get("FVALPAR")!=null){
				                                  			FVALPAR = stringToSqlDate((String) iLstParCuenta.get("FVALPAR"));
				                                  		}
				                                  		/* Added for IAXIS-4945 PK-01/08/2019 - Start */
				                                  		if (iLstParCuenta.get("CPARAM").equals("PATRI_LIQUIDO")) {
				                                  			NVALPAR = patrimonioLiquido;
				                                  			iLstParCuenta.put("NVALPAR", NVALPAR);
														}
				                                  		/* Added for IAXIS-4945 PK-01/08/2019 - End */
				                                  		Map mapc =	pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_INS_PARCUENTA(SFINANCI, NMOVIMI, (String) iLstParCuenta.get("CPARAM"), NVALPAR, TVALPAR, FVALPAR);
				                                  	}
			                                  	}
			                                  	formdata.put("lstParCuenta", lstParCuenta);
			                                }    	
											
											pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			                                map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(SFINANCI);
			                                List <Map> lstPersonaFin = (List<Map>) tratarRETURNyMENSAJES(request, map);   
			                                logger.debug(map);
			                                if(!isEmpty(map)&&lstPersonaFin!=null){
			                                	formdata.put("lstPersonaFin", lstPersonaFin);
			                                	for (Map iLstPersonaFin : lstPersonaFin) {
			                    	            		 formdata.putAll(iLstPersonaFin);
			                    	            }
			                                }
			                                
			                                                          
			                                m_buscar_indica_fin(request, thisAction); 
			                        	}
			                        }
		                        }  
		                        if(lstInformaCol==null||lstInformaCol.size()==0){
		                        	thisAction.guardarMensaje(request, "1000254", new Object[] { map.get("MENSAJES") },Constantes.MENSAJE_INFO);
		                        }else{
		                        	thisAction.guardarMensaje(request, "1000094", new Object[] { map.get("MENSAJES") },Constantes.MENSAJE_INFO); 
		                        }
	                      }  
	               }
	              // m_buscar(request, thisAction); 
	              // thisAction.guardarMensaje(request, "1000094", new Object[] { map.get("MENSAJES") },Constantes.MENSAJE_INFO);   
            }       
    } catch (Exception e) {
        logger.error("Error en el servicio Axisfic005Service - método m_buscar_informacol", 
                     e);
        thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
    }
        
        this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    }
    
    
    /**
     * Método que se consulta las cifras de las cuentas e indicadores financieros 
     * en la moneda que se haya seleccionado del campo “Moneda de cambio”. 
     * La  consulta se realiza con la TRM del día. 
     * @param request
     * @param thisAction
     */
    public void m_consultarMonedaCambio(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_conectar");

        try {
        	
        	 /* Desplegables */
             cargarValoresDesplegables(request, usuario, formdata);
        	
        	
        	 BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
             if (SFINANCI == null){
                 try{
                 	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
                 }catch(Exception ex){  SFINANCI = null;}
             }
             
             
             BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
             if (NMOVIMI == null){
                 try{
                 	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
                 }catch(Exception ex){  NMOVIMI = null;}
             }
             	
             String CMONORI = getCampoTextual(request, "CMONORI");
             String CMONDES = getCampoTextual(request, "CMONCAM");
             
      
        	 PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));	
        	 pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
			 // INI - IAXIS-15657 - JLTS - 09/06/2021
         	 Map map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_CONPARAM(SFINANCI, NMOVIMI, CMONORI, CMONDES, null);
			 // FIN - IAXIS-15657 - JLTS - 09/06/2021
         	 List <Map> lstParCuenta = (List<Map>) tratarRETURNyMENSAJES(request, map);
             logger.debug(map);
             formdata.put("lstParCuenta", lstParCuenta);
             
             
             pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
             map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GET_PERSONA_FIN(SFINANCI);
             List <Map> lstPersonaFin = (List<Map>) tratarRETURNyMENSAJES(request, map);   
             logger.debug(map);
             if(!isEmpty(map)&&lstPersonaFin!=null){
             	formdata.put("lstPersonaFin", lstPersonaFin);
             	for (Map iLstPersonaFin : lstPersonaFin) {
 	            		 formdata.putAll(iLstPersonaFin);
 	            }
             }
             
             
			 
			  String CMODO  = getCampoTextual(request, "CMODO");
	        	if (CMODO == null){
		                try{
		                	CMODO = "CMODOF";
		                }catch(Exception ex){  CMODO = null;}
		        }    
	        	    
	        	pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
	        		        	
	        	BigDecimal IMARGEN   = getCampoNumerico(request, "IMARGEN");
	        	BigDecimal ICAPTRAB  = getCampoNumerico(request, "ICAPTRAB"); 	
	        	    String TRAZCOR    = getCampoTextual(request, "TRAZCOR");
	        	    String TPRBACI    = getCampoTextual(request, "TPRBACI");
	        	BigDecimal IENDUADA  = getCampoNumerico(request, "IENDUADA");
	        	BigDecimal NDIACAR   = getCampoNumerico(request, "NDIACAR");
	        	BigDecimal NROTPRO   = getCampoNumerico(request, "NROTPRO");
	        	BigDecimal NROTINV   = getCampoNumerico(request, "NROTINV");
	        	BigDecimal NDIACICL  = getCampoNumerico(request, "NDIACICL");
	        	BigDecimal IRENTAB   = getCampoNumerico(request, "IRENTAB");
	        	BigDecimal IOBLCP    = getCampoNumerico(request, "IOBLCP");
	        	BigDecimal IOBLLP    = getCampoNumerico(request, "IOBLLP");
	        	BigDecimal IGASTFIN  = getCampoNumerico(request, "IGASTFIN");
	        	BigDecimal IVALPT    = getCampoNumerico(request, "IVALPT");
	        	BigDecimal CESVALOR  = getCampoNumerico(request, "CESVALOR");  
	        	    String CMONEDA   = getCampoTextual(request, "CMONORI");
	        	      Date FCUPO     = stringToSqlDate(getCampoTextual(request, "FCUPO"));
	        	BigDecimal ICUPOG    = getCampoNumerico(request, "ICUPOG");
	  	        BigDecimal ICUPOS    = getCampoNumerico(request, "ICUPOS"); 
	  	              Date FCUPOS    = stringToSqlDate(getCampoTextual(request, "FCUPOS"));
	        	    String TCUPOR    = getCampoTextual(request, "TCUPOR");
	        	    String TCONCEPC  = getCampoTextual(request, "TCONCEPC");	    
	        	    String TCONCEPS  = getCampoTextual(request, "TCONCEPS");
	        	    String TCBUREA   = getCampoTextual(request, "TCBUREA");
	        	    String TCOTROS   = getCampoTextual(request, "TCOTROS");
	        	    String CMONCAM   = getCampoTextual(request, "CMONCAM");
	        	BigDecimal NCAPFIN   = getCampoNumerico(request, "NCAPFIN");    
	        	    
	        	/* Cambio para IAXIS-15710 : Start */
	        	BigDecimal SECTOR_EMPRESA   = getCampoNumerico(request, "SECTOR_EMPRESA");
	        	BigDecimal TAMANO_EMPRESA   = getCampoNumerico(request, "TAMANO_EMPRESA");   
	        	/* Cambio para IAXIS-15710 : End */
	        	
       //BUG_OPTIMIZACION OI-45: Star Se comenta codigo.  
       /* if (NMOVIMI.compareTo(new BigDecimal(0))!= 0){
        	
        	Map mapindCli1 = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_INDICADORES_CLIENTE(SFINANCI, NMOVIMI, null, null);

          map = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_GRABAR_INDICADOR(SFINANCI, 
         																			 NMOVIMI, 
         																			   CMODO, 
         																			(BigDecimal) mapindCli1.get("PMAROPECL"), 
         																			(BigDecimal) mapindCli1.get("PCAPTRACL"), 
         																			             (mapindCli1.get("PRAZCORCL")!=null)?mapindCli1.get("PRAZCORCL").toString():"", 
         																			             (mapindCli1.get("PPRUACICL")!=null)?mapindCli1.get("PPRUACICL").toString():"", 
         																			(BigDecimal) mapindCli1.get("PENDTOTCL"), 
         																			(BigDecimal) mapindCli1.get("PROTCARCL"), 
         																			(BigDecimal) mapindCli1.get("PROTPROCL"), 
         																			(BigDecimal) mapindCli1.get("PROTINVCL"), 
         																			(BigDecimal) mapindCli1.get("PCICEFECL"), 
         																			(BigDecimal) mapindCli1.get("PRENTABCL"), 
         																			(BigDecimal) mapindCli1.get("POBFICPCL"), 
         																			(BigDecimal) mapindCli1.get("POBFILPCL"), 
         																			(BigDecimal) mapindCli1.get("PGASFINCL"), 
         																			  IVALPT, 
         																			CESVALOR, 
         																			 CMONEDA, 
         																			   FCUPO, 
         																			  ICUPOG, 
         																			  ICUPOS, 
         																			  FCUPOS, 
         																			  TCUPOR, 
         																			TCONCEPC, 
         																			TCONCEPS, 
         																			 TCBUREA, 
         																			 TCOTROS, 
         																			 CMONCAM,
         																			 NCAPFIN
         																			 //Cambio para IAXIS-15710 : Start 
        																			 ,SECTOR_EMPRESA,
        																			 TAMANO_EMPRESA
        																			 // Cambio para IAXIS-15710 : End 
        																			 );
             
         } */ 
    //BUG_OPTIMIZACION OI-45: End   
             m_buscar_indica_fin(request, thisAction);
		   // INI - IAXIS-15405 - JLTS - 04/05/2021. Se comentariza la ejecución automática del modelo de cupos
           // m_calcular(request, thisAction);
		   // FIN - IAXIS-15405 - JLTS - 04/05/2021.
             
        } catch (Exception e) {
            logger.error("Error en el servicio Axisfic005Service - método m_conectar", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    }
    
    
    /**
     * Método que busca la informacion de los indicadores financieros
     * 
     * @param request
     * @param thisAction
     */
    public void m_buscar_indica_fin(HttpServletRequest request, 
                       Axisfic005Action thisAction) {
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        logger.info("Axisfic005Service m_buscar_indica_fin");
        
        try {
        	
        	BigDecimal SFINANCI = getCampoNumerico(request, "SFINANCI");
            if (SFINANCI == null){
                try{
                	SFINANCI = new BigDecimal(String.valueOf(request.getParameter("SFINANCI")));
                }catch(Exception ex){  SFINANCI = null;}
            }
            
            
            BigDecimal NMOVIMI = getCampoNumerico(request, "NMOVIMI");
            if (NMOVIMI == null){
                try{
                	NMOVIMI = new BigDecimal(String.valueOf(request.getParameter("NMOVIMI")));
                }catch(Exception ex){  NMOVIMI = null;}
            }
        	
            String CMONORI = getCampoTextual(request, "CMONORI");
            String CMONDES = getCampoTextual(request, "CMONCAM");
        	
        	 PAC_IAX_FINANCIERA pac_axis_financiera = new PAC_IAX_FINANCIERA((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
            PAC_IAX_LISTVALORES pac_axis_listValores = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
            
            Map mapA = new HashMap();
            Map mapB = new HashMap();
            Map mapC = new HashMap();
            Map mapD = new HashMap();
            Map mapE = new HashMap();
            Map mapF = new HashMap();
            Map mapG = new HashMap();
            Map mapH = new HashMap();
            Map mapI = new HashMap();
            Map mapJ = new HashMap();
            Map mapK = new HashMap();
            Map mapL = new HashMap();
            Map mapM = new HashMap();
            
            
            Map mapMO = pac_axis_listValores.ejecutaPAC_IAX_LISTVALORES__F_DETVALORES(new BigDecimal("8001173"));
            List <Map> lstMO = (List<Map>) tratarRETURNyMENSAJES(request, mapMO);
            if(!isEmpty(mapMO)&&lstMO != null){
            	int i=0;
            	for (Map iLstMO: lstMO) {
            		i++;
            		if(i==1){
            			mapA.put("TINDCAD", iLstMO.get("TATRIBU"));
            		}else if(i==2){
            			mapB.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==3){
            			mapC.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==4){
            			mapD.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==5){
            			mapE.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==6){
            			mapF.put("TINDCAD", iLstMO.get("TATRIBU")); 	
            		}else if(i==7){
            			mapG.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==8){
            			mapH.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==9){
            			mapI.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==10){
            			mapJ.put("TINDCAD", iLstMO.get("TATRIBU"));
            		}else if(i==11){
            			mapK.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==12){
            			mapL.put("TINDCAD", iLstMO.get("TATRIBU"));	
            		}else if(i==13){
            			mapM.put("TINDCAD", iLstMO.get("TATRIBU"));
            		}
            	}	
            }
            //BUG_OPTIMIZACION OI-45: Star. 
            Map mapindCli = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_INDICADORES_CLIENTE(SFINANCI, NMOVIMI, CMONORI, CMONDES);
            Map mapindsec = pac_axis_financiera.ejecutaPAC_IAX_FINANCIERA__F_INDICADORES_SECTOR(SFINANCI, NMOVIMI, CMONORI, CMONDES);
            
            mapA.put("NINDCLI", mapindCli.get("PMAROPECL"));
            mapB.put("NINDCLI", mapindCli.get("PCAPTRACL"));
            mapC.put("NINDCLI", mapindCli.get("PRAZCORCL"));
            mapD.put("NINDCLI", mapindCli.get("PPRUACICL"));
            mapE.put("NINDCLI", mapindCli.get("PENDTOTCL"));
            mapF.put("NINDCLI", mapindCli.get("PROTCARCL"));
            mapG.put("NINDCLI", mapindCli.get("PROTPROCL"));
            mapH.put("NINDCLI", mapindCli.get("PROTINVCL"));
            mapI.put("NINDCLI", mapindCli.get("PCICEFECL"));
            mapJ.put("NINDCLI", mapindCli.get("PRENTABCL"));
            mapK.put("NINDCLI", mapindCli.get("POBFICPCL"));
            mapL.put("NINDCLI", mapindCli.get("POBFILPCL"));
            mapM.put("NINDCLI", mapindCli.get("PGASFINCL"));
            
            mapA.put("NINDSEC", mapindsec.get("PMAROPESE"));
            mapB.put("NINDSEC", mapindsec.get("PCAPTRASE"));
            mapC.put("NINDSEC", mapindsec.get("PRAZCORSE"));
            mapD.put("NINDSEC", mapindsec.get("PPRUACISE"));
            mapE.put("NINDSEC", mapindsec.get("PENDTOTSE"));
            mapF.put("NINDSEC", mapindsec.get("PROTCARSE"));
            mapG.put("NINDSEC", mapindsec.get("PROTPROSE"));
            mapH.put("NINDSEC", mapindsec.get("PROTINVSE"));
            mapI.put("NINDSEC", mapindsec.get("PCICEFESE"));
            mapJ.put("NINDSEC", mapindsec.get("PRENTABSE"));
            mapK.put("NINDSEC", mapindsec.get("POBFICPSE"));
            mapL.put("NINDSEC", mapindsec.get("POBFILPSE"));
            mapM.put("NINDSEC", mapindsec.get("PGASFINSE"));
            //BUG_OPTIMIZACION OI-45: End.               
            List <Map> lstIndicadores = new ArrayList<Map>();
            lstIndicadores.add(mapA);
            lstIndicadores.add(mapB);
            lstIndicadores.add(mapC);
            lstIndicadores.add(mapD);
            lstIndicadores.add(mapE);
            lstIndicadores.add(mapF);
            lstIndicadores.add(mapG);
            lstIndicadores.add(mapH);
            lstIndicadores.add(mapI);
            lstIndicadores.add(mapJ);
            lstIndicadores.add(mapK);
            lstIndicadores.add(mapL);
            lstIndicadores.add(mapM);
            
            formdata.put("lstIndicadores", lstIndicadores);
        	
        	
        } catch (Exception e) {
            logger.error("Error en el servicio Axisfic005Service - m_buscar_indica_fin", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        }
        this.f_Cargar_Propiedades_Pantalla(request, whoami(this));
        
    }
    
    /*INI-CES-IAXIS-WSINFORMA-ECUACION PATRIMONIAL-16/04/2019*/
    /* Changed for IAXIS-4945 PK-01/08/2019 - Start */
    /*private Map validaEquPatrimonial(BigDecimal activoTotal, BigDecimal pasivoTotal, BigDecimal patrimonio, BigDecimal activoCte, BigDecimal activoNoCte, BigDecimal pasivoCte, BigDecimal pasivoNoCte)*/
    /* INI --IAXIS-15467 --JLTS 2021/05/18. Se adiciona la request, el thisAction y el rango de error de la ecuación patrimonial */
	private Map validaEquPatrimonial(HttpServletRequest request, Axisfic005Action thisAction, BigDecimal activoTotal, BigDecimal pasivoTotal, BigDecimal patrimonio, BigDecimal activoCte, BigDecimal activoNoCte, BigDecimal pasivoCte, BigDecimal pasivoNoCte,
				BigDecimal reservaLegal, BigDecimal capitalSocial, BigDecimal resultEjerAnteriores, BigDecimal primaColAcciones,
				BigDecimal reservasOcasionales, BigDecimal asignadoInvSuppl, BigDecimal patrimonioLiquido) {
		/* Changed for IAXIS-4945 PK-01/08/2019 - End */
    	Map respuesta = new HashMap();
    	boolean estado = true;
    	String mensajes = new String("No se guardo datos desde WSInforma ");
    	UsuarioBean usuario=(UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata=(Map)request.getAttribute(Constantes.FORMDATA);
        Map rPatrim;
        BigDecimal valorErrPatrim = new BigDecimal(0);
    	
    	try {
    		PAC_IAX_PARAM param=new PAC_IAX_PARAM((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
    		rPatrim=param.ejecutaPAC_IAX_PARAM__F_PAREMPRESA_N("RANGO_PATRIM_FIN", usuario.getCempres());
            logger.debug(rPatrim);
            valorErrPatrim = (BigDecimal)tratarRETURNyMENSAJES(request, rPatrim);   
            logger.debug("RANGO_PATRIM_FIN="+valorErrPatrim);
    	}
    	catch (Exception e) {
                logger.error("Error en el método Axisfic005Service.validaEquPatrimonial", e);
                thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() }, Constantes.MENSAJE_ERROR);
    	}
    	
    	/*
    	 *  IF    (v_act_total - v_patri_ano_actual) > (v_pas_total + v_rango)
            OR (v_act_total - v_patri_ano_actual) < (v_pas_total - v_rango)
    	 */
    	/*Activo Total = Pasivo Total + Patrimonio */
    	if ( (pasivoTotal.add(patrimonio)).doubleValue() > (activoTotal.add(valorErrPatrim)).doubleValue()  ||
    		 (pasivoTotal.add(patrimonio)).doubleValue() < (activoTotal.subtract(valorErrPatrim)).doubleValue() )  {
    		estado = false;
    		mensajes = mensajes+"El (Activo Total) debe ser igual a (Pasivo Total + Patrimonio). \n";
    	}
    	/*
    	if(!(activoTotal.equals(pasivoTotal.add(patrimonio)))) {
    		estado = false;
    		mensajes = mensajes+"El (Activo Total) debe ser igual a (Pasivo Total + Patrimonio). \n";
    	}
    	*/
    	/* Pasivo Total = Activo Total – Patrimonio */
    	if ( (activoTotal.subtract(patrimonio)).doubleValue() > (pasivoTotal.add(valorErrPatrim)).doubleValue()  ||
       		 (activoTotal.subtract(patrimonio)).doubleValue() < (pasivoTotal.subtract(valorErrPatrim)).doubleValue() )  {
       		estado = false;
       		mensajes = mensajes+"El (Pasivo Total) debe ser igual a (Activo Total – Patrimonio). \n";
       	}
    	/*
    	if (!(pasivoTotal.equals(activoTotal.subtract(patrimonio)))) {
    		estado = false;
    		mensajes = mensajes+"El (Pasivo Total) debe ser igual a (Activo Total – Patrimonio). \n";
    	}
    	*/
    	/* Patrimonio = Activo Total – Pasivo Total */
    	if ( (activoTotal.subtract(pasivoTotal)).doubleValue() > (patrimonio.add(valorErrPatrim)).doubleValue()  ||
          	 (activoTotal.subtract(pasivoTotal)).doubleValue() < (patrimonio.subtract(valorErrPatrim)).doubleValue() )  {
          		estado = false;
          		mensajes = mensajes+"El (Patrimonio) debe ser igual a (Activo Total – Pasivo Total). \n";
    	}
    	/*
    	if (!(patrimonio.equals(activoTotal.subtract(pasivoTotal)))) {
    		estado = false;
    		mensajes = mensajes+"El (Patrimonio) debe ser igual a (Activo Total – Pasivo Total). \n";
    	}
    	*/
    	/*Activo Corriente + Activo no Corriente = Activo Total */
        if ( (activoCte.add(activoNoCte)).doubleValue() > (activoTotal.add(valorErrPatrim)).doubleValue()  ||
          	 (activoCte.add(activoNoCte)).doubleValue() < (activoTotal.subtract(valorErrPatrim)).doubleValue() )  {
          estado = false;
          mensajes = mensajes+"El (Activo Total) debe ser igual a (Activo Corriente + Activo no Corriente). \n";
        }
        /*
    	if (!(activoTotal.equals(activoCte.add(activoNoCte)))) {
    		estado = false;
    		mensajes = mensajes+"El (Activo Total) debe ser igual a (Activo Corriente + Activo no Corriente). \n";    		
    	}
    	*/
    	/* Pasivo Corriente + Pasivo no Corriente = Pasivo Total */
        if ( (pasivoCte.add(pasivoNoCte)).doubleValue() > (pasivoTotal.add(valorErrPatrim)).doubleValue()  ||
             (pasivoCte.add(pasivoNoCte)).doubleValue() < (pasivoTotal.subtract(valorErrPatrim)).doubleValue() )  {
             estado = false;
             mensajes = mensajes+"El (Pasivo Total) debe ser igual a (Pasivo Corriente + Pasivo no Corriente). \n";
        }
        /*
    	if (!(pasivoTotal.equals(pasivoCte.add(pasivoNoCte)))) {
    		estado = false;
    		mensajes = mensajes+"El (Pasivo Total) debe ser igual a (Pasivo Corriente + Pasivo no Corriente). \n";
    	}
    	*/
    	/* Added for IAXIS-4945 PK-01/08/2019 - Start */
        if ( (patrimonioLiquido).doubleValue() > (reservaLegal.add(capitalSocial).add(resultEjerAnteriores)
    			.add(primaColAcciones).add(reservasOcasionales).add(asignadoInvSuppl).add(valorErrPatrim)).doubleValue()  ||
        	 (patrimonioLiquido).doubleValue() < (reservaLegal.add(capitalSocial).add(resultEjerAnteriores)
            	.add(primaColAcciones).add(reservasOcasionales).add(asignadoInvSuppl).subtract(valorErrPatrim)).doubleValue() ) {
           estado = false;
           mensajes = mensajes+"El (Patrimonio Líquido) debe ser igual a (Reserva legal + Capital social + "
        			+ "Resultado ejercicios anteriores + Prima en colocación de acciones + Reservas ocasionales + "
        			+ "Inversión suplementaria). \n";
        }
        /*
    	if (!(patrimonioLiquido.equals(reservaLegal.add(capitalSocial).add(resultEjerAnteriores)
    			.add(primaColAcciones).add(reservasOcasionales).add(asignadoInvSuppl)))) {
    		estado = false;
    		mensajes = mensajes+"El (Patrimonio Líquido) debe ser igual a (Reserva legal + Capital social + "
    				+ "Resultado ejercicios anteriores + Prima en colocación de acciones + Reservas ocasionales + "
    				+ "Inversión suplementaria). \n";
		}
		*/
		/* FIN --IAXIS-15467 --JLTS 2021/05/18' */
    	/* Added for IAXIS-4945 PK-01/08/2019 - End */
    	
    	respuesta.put("estado", estado);
    	respuesta.put("mensaje", mensajes);
    	
    	return respuesta;
    }
    /*END-CES-IAXIS-WSINFORMA-ECUACION PATRIMONIAL-16/04/2019*/    
}
