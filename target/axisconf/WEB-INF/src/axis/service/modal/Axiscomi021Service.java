//Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== #
package axis.service.modal;

import java.math.BigDecimal;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.PAC_IAXPAR_PRODUCTOS;
import axis.jdbc.PAC_IAX_COMISIONEGOCIO;
import axis.jdbc.PAC_IAX_LISTVALORES;
import axis.mvc.control.modal.Axiscomi021Action;
import axis.mvc.model.UsuarioBean;
import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

/**
 * Axiscomi021Service.java
 * 11/13/2019
 * @since Java 5.0
 */
@SuppressWarnings("all")
public class Axiscomi021Service extends AxisBaseService {
    Log logger = LogFactory.getLog(this.getClass());

    /*********************************************************************************************************************/
    /*********************************************** MÃ‰TODOS DE INICIALIZACION *******************************************/

    /**
     */
    public

    void m_init(HttpServletRequest request) {
        logger.debug("Axiscomi015Service m_form");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);

        try {
        } catch (Exception e) {
            logger.error("Error en el servicio Axiscomi021Service - mÃ©todo m_init", 
                         e);
        } finally {
            this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

        }
    }

    /**
     * 
     * @param request
     */
    public void m_form(HttpServletRequest request, 
                       Axiscomi021Action thisAction) {
        logger.debug("Axiscomi021Service m_form");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);

        try {
            logger.debug("Axiscomi021Service m_form");
            BigDecimal SPRODUC = getCampoNumerico(request,"SPRODUC");
            String TPRODUC = getCampoTextual(request,"TPRODUC");
            
            HashMap map = new HashMap();
            map = new PAC_IAX_LISTVALORES((java.sql.Connection)request.getAttribute(Constantes.DB01CONN)).ejecutaPAC_IAX_LISTVALORES__F_GET_CGARANT(SPRODUC,null,null);
            List listaGarantias = (List)tratarRETURNyMENSAJES(request, map,false);
            
            //Precargar informacion ya almacenada
            List listaProductos= (List) request.getSession().getAttribute("LSTPRODUCTOS");
            HashMap OB_IAX_PRODUCTOS = new HashMap();
            if(listaProductos != null && listaProductos.size() > 0) {               
                for(int i = 0;i<listaProductos.size();i++) {
                    OB_IAX_PRODUCTOS = new HashMap();
                    OB_IAX_PRODUCTOS =(HashMap) (HashMap)listaProductos.get(i);
                    if(OB_IAX_PRODUCTOS.get("SPRODUC").toString().equals(SPRODUC.toString())) {
                        setValoresGarantias(listaGarantias, OB_IAX_PRODUCTOS.get("VALORES") != null ? OB_IAX_PRODUCTOS.get("VALORES").toString() : "");
                    }
                }
            }
            //** INI TASK 72 EDSS 
            PAC_IAXPAR_PRODUCTOS pac_iax_productos=new PAC_IAXPAR_PRODUCTOS((java.sql.Connection)request.getAttribute(Constantes.DB01CONN));
            Map retVal = pac_iax_productos.ejecutaPAC_IAXPAR_PRODUCTOS__F_GET_PARPRODUCTO("PRIMAMIN_EDS_PROD", SPRODUC);
            request.setAttribute("retVal", tratarRETURNyMENSAJES(request, retVal));
            //** FIN TASK 72 EDSS 
            formdata.put("CCODIGO", SPRODUC);
            formdata.put("NNOMBRE", TPRODUC);
            formdata.put("LSTGARANTIAS", listaGarantias);
            
        } catch (Exception e) {
            logger.error("Error en el servicio Axiscomi021Service - mÃ©todo m_form", 
                         e);
            thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
        } finally {

            this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));

        }
    }
    
    public void m_aceptar(HttpServletRequest request, 
            Axiscomi021Action thisAction) {
        logger.debug("Axiscomi021Service m_form");
        UsuarioBean usuario = (UsuarioBean)request.getSession().getAttribute(Constantes.USUARIO);
        Map formdata = (Map)request.getAttribute(Constantes.FORMDATA);
        try {
            String infoSel = getCampoTextual(request,"INFOSELEC");  
            logger.debug("infoSel: "+infoSel);
            String ccodigoSel = getCampoTextual(request,"CCODIGOSEL");
            List listaProductos= (List) request.getSession().getAttribute("LSTPRODUCTOS");
            HashMap OB_IAX_PRODUCTOS = new HashMap();
            for(int i = 0;i<listaProductos.size();i++){ 
                OB_IAX_PRODUCTOS = new HashMap();
                OB_IAX_PRODUCTOS =(HashMap) (HashMap)listaProductos.get(i);
                if(OB_IAX_PRODUCTOS.get("SPRODUC") != null && OB_IAX_PRODUCTOS.get("SPRODUC").toString().equals(ccodigoSel)) {
                    OB_IAX_PRODUCTOS.put("VALORES", infoSel);
                    break;
                }               
            }
            
            request.getSession().setAttribute("LSTPRODUCTOS", ((listaProductos == null) ?  new ArrayList(): listaProductos));   
            formdata.put("OK", "1");
            
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi021Service - mÃ©todo m_aceptar", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
       } finally {
    
           //this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
    
       }        
    }
    
    public String validarTasaPrima(int opcion, String numideSel, HttpServletRequest request, String codProducto, Axiscomi021Action thisAction) {
        
        String respuesta = null;
        try {
            PAC_IAX_COMISIONEGOCIO pac_iax_comisionegocio = new PAC_IAX_COMISIONEGOCIO((Connection)request.getAttribute(Constantes.DB01CONN)); 
            
            List listaAsegurados = (List) request.getSession().getAttribute("axisctr_asegurados");
            BigDecimal IDCONVENIO = (BigDecimal) request.getSession().getAttribute("codigo_convenio");
            HashMap OB_IAX_PERSONAS = new HashMap();
            for(int i = 0;i<listaAsegurados.size();i++){
                OB_IAX_PERSONAS = new HashMap();
                OB_IAX_PERSONAS =(HashMap) ((HashMap)listaAsegurados.get(i)).get("OB_IAX_TOMADORES");
                if(OB_IAX_PERSONAS.get("NNUMIDE").toString().equals(numideSel)) {
                    if(OB_IAX_PERSONAS.get("VALORES") != null && OB_IAX_PERSONAS.get("VALORES").toString() != "") {
                        //1. Tasa
                        //2. Prima
                        String[] valores = OB_IAX_PERSONAS.get("VALORES").toString().split("~");
                        for(String info : valores) {
                            String[] data = info.split("-");
                            if(data.length > 0 && data[0] != null && data[0].equals(codProducto)) {                                 
                                if(opcion == 1) {                                   
                                    respuesta = data[1] != null ? data[1] : "";
                                }else {
                                    respuesta = data[2] != null ? data[2] : "";
                                }
                                                        
                            break;
                            }
                        }                   
                    }else {
                        /*if(IDCONVENIO != null && IDCONVENIO.compareTo(BigDecimal.ZERO) > 0) {
                            Map m = pac_iax_comisionegocio.ejecutaPAC_IAX_COMISIONEGOCIO__F_GET_TASA_PRIMA(IDCONVENIO, new BigDecimal(numideSel), new BigDecimal(codProducto), new BigDecimal(opcion));
                            tratarRETURNyMENSAJES(request,m);   
                            BigDecimal dato = (BigDecimal)m.get("RETURN");
                            if(opcion == 1) {                                   
                                respuesta = dato.signum() < 0 ? "" : dato.toString();
                            }else {
                                respuesta =  dato.signum() < 0 ? "" : dato.toString();
                            }
                        }else {
                            if(opcion == 1) {                                   
                                respuesta = "";
                            }else {
                                respuesta =  "";
                            }
                        }    */
                    }
                }               
            }
        }catch (Exception e) {
            logger.error("Error en el servicio Axiscomi021Service - mÃƒÂ©todo validarTasaPrima", 
                    e);
           thisAction.guardarMensaje(request, "1000050", new Object[] { e.toString() },Constantes.MENSAJE_ERROR);
       } finally {
           this.f_Cargar_Propiedades_Pantalla(request, this.whoami(this));
       }
        
        return respuesta;
    }
    
    /*
     * Metodo para precargar la informacion de las garantias ya almacenadas
     * */
    public void setValoresGarantias(List garantias, String valores) {
        if(valores != null && valores != "") {
            //Se obtiene el codigo de la garantia
            String[] codGarantias = valores.split("~");
            HashMap OB_IAX_GARANTIAS = new HashMap();
            if(garantias != null && garantias.size() > 0) {             
                for(int i = 0;i<garantias.size();i++) {
                    OB_IAX_GARANTIAS = new HashMap();
                    OB_IAX_GARANTIAS =(HashMap) (HashMap)garantias.get(i);
                    for(int j = 0; j<codGarantias.length; j++) {
                        if(codGarantias[j] != null && codGarantias[j] != "") {
                            String codGarantiaSel = codGarantias[j].split("-")[0];
                            if(OB_IAX_GARANTIAS.get("CGARANT").toString().equals(codGarantiaSel)) {
                                //OB_IAX_GARANTIAS.put("NTASA", codGarantias[j].split("-")[1]);
                                //** INI TASK 72 EDSS
                                String[] vals = codGarantias[j].split("-");
                                String val1 = vals[1];
                                OB_IAX_GARANTIAS.put("NTASA", val1);
                                if (vals.length > 2) {
                                    String val2 = vals[2];
                                    OB_IAX_GARANTIAS.put("PRIMA_NUEVA", val2);
                                    String val3 = vals[3];
                                    OB_IAX_GARANTIAS.put("PRIMA_ENDOSO", val3);
                                }
                                //** FIN TASK 72 EDSS
                                break;
                            }
                        }                       
                    }                   
                }
            }
        }
    }
}
