<%/* Revision:# 6Lg1fjFFTc1A4ehrVi6c5A== # */%>
<%/*
*  Fichero: axisrea020.jsp
*
*  Fecha: 29/06/2009
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisrea020" c="LIT_GEN_PANTALLA" lit="9001865"/></title> <%-- Mantenimiento de facultativos --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
     <!--********** CALENDARIO ************************* -->
    <!-- Hoja de estilo del Calendario -->
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <!-- Script principal del calendario -->
    <script type="text/javascript" src="scripts/calendar.js"></script>
    <!-- Idioma del calendario, en función del Locale -->
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <!-- Setup del calendario -->
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>
    <!--*********************************** -->
   
    <style type="text/css">
        .displayspace {
            width:99.8%;
            height: expression( this.scrollHeight > 349 ? "350px" : "auto" );
            max-height:350px;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid #DDDDDD;
        }
    </style>

    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {        
            
            var hayErrores    = ${!empty requestScope.__mensajes.m__clave};
            // INI POST-230 27/12/2022 MPC
            var cambiandomod="${__formdata['CAMBIAMOD']}";
            document.getElementById("COMBOCORRED").style.display = "none";                     document.getElementById("CCORREDNIUS").style.display = "";
            // FIN POST-230 27/12/2022 MPC
            document.getElementById("ic_IFACCED").style.visibility = "hidden"; // IAXIS-5361 09/07/2020
            // INICIO POST-74 30/06/2022 PAYV
            document.getElementById("ic_PFACCED").style.visibility = "hidden";
            // FIN POST-74 30/06/2022 PAYV
            document.getElementById("icon_FFINCUF").style.visibility = "hidden"; 
            document.getElementById("icon_FGARPRI").style.visibility = "hidden"; 
            document.getElementById("icon_FGARDEP").style.visibility = "hidden"; 
            document.getElementById("COMBOCOMPANI").style.display = "none";
            document.getElementById("COMBOINTERES").style.display = "none";
            document.getElementById("COMBOCOMISIO").style.display = "none";
            document.getElementById("COMBOESTADO").style.display = "none";                    
            document.getElementById("CCOMREA").style.display = "";
            document.getElementById("TCOMREA").style.display = "";            
            document.getElementById("CINTRES").style.display = "";
            document.getElementById("TINTERES").style.display = "";            
            document.getElementById("CCOMPANIUS").style.display = "";
            document.getElementById("TESTADO").style.display = "";            
            document.getElementById("TCOMPANI").style.display = "";
            document.getElementById("cuadreDades").style.visibility = "visible";               
            if(document.getElementById("CESTADO").value == 1){
                <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA">
                 document.getElementById("but_nueva_c").style.visibility = "";
                </axis:visible> }        
             if(document.getElementById("CESTADO").value == 2){ 
                <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA">
                 document.getElementById("but_nueva_c").style.visibility = "hidden";   
                 </axis:visible> }            
            if(document.getElementById("MODIFICACIO").value == 1){                                 
            	// INI POST-230 27/12/2022 MPC
            	if(cambiandomod == "0" || cambiandomod == "")
            	{
            	  document.getElementById("CCORREDNIUS").style.display = "";
            	  document.getElementById("TCORRED").style.display = "";
            	  document.getElementById("COMBOCORRED").style.display = "none";
                // FIN POST-230 27/12/2022 MPC
                document.getElementById("CCOMREA").style.display = "none";
                document.getElementById("TCOMREA").style.display = "none";                
                document.getElementById("CINTRES").style.display = "none";
                document.getElementById("TINTERES").style.display = "none";            
                document.getElementById("CCOMPANIUS").style.display = "";
                document.getElementById("TESTADO").style.display = "";
                document.getElementById("TCOMPANI").style.display = "";
                document.getElementById("COMBOCOMPANI").style.display = "none";
                document.getElementById("COMBOINTERES").style.display = "";
                document.getElementById("COMBOCOMISIO").style.display = "";
                document.getElementById("COMBOESTADO").style.display = "none";   
                document.getElementById("but_aceptar_nueva_c").style.display = "none";
                document.getElementById("but_modif_c").style.display = "";
                document.getElementById("but_cancelar_accio").style.visibility = "visible";         
                <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA"> 
                 document.getElementById("but_nueva_c").style.visibility = "hidden";
                </axis:visible> 
                f_allibera_camps();
                revisarEstilos();
                //objDom.setValorPorId("MODIFICACIO", 0); // POST-230 27/12/2022 MPC Se comenta linea
				f_cargar_propiedades_pantalla();
                }
            // INI POST-230 27/12/2022 MPC
            else
            	{
            	  objDom.setValorPorId("MODIFICACIO", 0);
            	  objDom.setValorPorId("CAMBIAMOD", 0);
            	}
        	} 
            // FIN POST-230 27/12/2022 MPC
            if ( ${empty requestScope.OB_IAX_CUAFACUL} && !hayErrores )
                f_but_buscar();
                
            f_cargar_propiedades_pantalla();    
        }
        
        function thiss(thiss){
        thiss.value = f_formatdate(thiss);
        }
        
        function f_formatdate(entrada){
         var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
        return entrada.value;
        }
        //
        // Inicio IAXIS-5361 09/07/2020
        //
        function f_but_hab_facced(){
        	
        	var IFACCED = document.getElementById("IFACCED");              
            IFACCED.readOnly=false;        
            IFACCED.className="";
            IFACCED.className="campowidthinput campo campotexto"
            IFACCED.style.visibility="visible";
            document.getElementById("ic_IFACCED").style.visibility = "visible"; 
        }
        //
        // Fin IAXIS-5361 09/07/2020
        //
        
        //INICIO POST-74 30/06/2022 PAYV
        function f_but_hab_Pfacced(){
        	
        	var PFACCED = document.getElementById("PFACCED");              
        	PFACCED.readOnly=false;        
        	PFACCED.className="";
        	PFACCED.className="campowidthinput campo campotexto"
        	PFACCED.style.visibility="visible";
            document.getElementById("ic_PFACCED").style.visibility = "visible"; 
        }
        //FIN POST-74 30/06/2022 PAYV
        
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisrea020", "cancelar", document.miForm, "_self");
        }
        
        function f_but_buscar() {
            f_abrir_modal("axisrea021");
        }
        //INI POST-230 MPC Se adiciona campos CCORRED Y CCOD_PK.
        function f_seleccionar(CCOMPANI, CCORRED, CCOD_PK) {            
            objDom.setValorPorId("MODIFICACIO", "0");                
            objDom.setValorPorId("CCOD_PK", CCOD_PK);
            objDom.setValorPorId("CCORRED", CCORRED);
            objDom.setValorPorId("CCOMPANI", CCOMPANI);
            objUtiles.ejecutarFormulario("axis_axisrea020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
         //FIN POST-230 MPC Se adiciona campos CCORRED Y CCOD_PK.
        
        function f_allibera_camps(){
        //Campo compañia
       //     var CCOMPANIA = document.getElementById("CCOMPANIUS");           
        //    CCOMPANIA.readOnly=false;        
         //   CCOMPANIA.className="";
         //   CCOMPANIA.className="campowidthinput campo campotexto";    
            
          document.getElementById("COMBOESTADO").style.display = "";
          document.getElementById("TESTADO").style.display = "none"; 
          //Campo TIDFCOM
           var PTIDFCOM = document.getElementById("TIDFCOM");
           PTIDFCOM.readOnly=false;
           PTIDFCOM.className="";
           PTIDFCOM.className="campowidthinput campo campotexto"; 
        //Campo FFINCUF
            document.getElementById("icon_FFINCUF").style.visibility = "visible"; 
            var FFINCUF = document.getElementById("FFINCUF");            
            FFINCUF.readOnly=false;        
            FFINCUF.className="";
            FFINCUF.className="campowidthinput campo campotexto";   
            
        //Campo PLOCAL
            var PLOCAL = document.getElementById("PLOCAL");            
            PLOCAL.readOnly=false;        
            PLOCAL.className="";
            PLOCAL.className="campowidthinput campo campotexto";   
            
            
        //Campo PCESION
            var PCESION = document.getElementById("PCESION");              
            PCESION.readOnly=false;        
            PCESION.className="";
            PCESION.className="campowidthinput campo campotexto";   
            
        //Campo ICESFIJ
            var ICESFIJ = document.getElementById("ICESFIJ");            
            ICESFIJ.readOnly=false;        
            ICESFIJ.className="";
            ICESFIJ.className="campowidthinput campo campotexto";  
            
        //Campo CCOMREA
            var CCOMREA = document.getElementById("CCOMREA");            
            CCOMREA.readOnly=false;        
            CCOMREA.className="";
            CCOMREA.className="campowidthinput campo campotexto";                        
            
            
        //Campo PCOMISI
            var PCOMISI = document.getElementById("PCOMISI");            
            PCOMISI.readOnly=false;        
            PCOMISI.className="";
            PCOMISI.className="campowidthinput campo campotexto";                        

            
        //Campo ICOMFIJ
            var ICOMFIJ = document.getElementById("ICOMFIJ");            
            ICOMFIJ.readOnly=false;        
            ICOMFIJ.className="";
            ICOMFIJ.className="campowidthinput campo campotexto";                        

            
        //Campo ISCONTA
            var ISCONTA = document.getElementById("ISCONTA");            
            ISCONTA.readOnly=false;        
            ISCONTA.className="";
            ISCONTA.className="campowidthinput campo campotexto";                        
            
        //Campo CINTRES
            var CINTRES = document.getElementById("CINTRES");            
            CINTRES.readOnly=false;        
            CINTRES.className="";
            CINTRES.className="campowidthinput campo campotexto";                        
            
         //Campo PINTRES
            var PINTRES = document.getElementById("PINTRES");            
            PINTRES.readOnly=false;        
            PINTRES.className="";
            PINTRES.className="campowidthinput campo campotexto";                        
        //Campo PRESERV
            var PRESERV = document.getElementById("PRESERV");            
            PRESERV.readOnly=false;        
            PRESERV.className="";
            PRESERV.className="campowidthinput campo campotexto";                        
       
        //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
        //Campo PRESREA
            var PRESREA = document.getElementById("PRESREA");            
            PRESREA.readOnly=false;        
            PRESREA.className="";
            PRESREA.className="campowidthinput campo campotexto";                        
        //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            
       //Campo PTASAXL
            var PTASAXL = document.getElementById("PTASAXL");            
            PTASAXL.readOnly=false;        
            PTASAXL.className="";
            PTASAXL.className="campowidthinput campo campotexto";   
       
       //Campo CTIPFAC 
            var CTIPFAC = document.getElementById("CTIPFAC");            
            CTIPFAC.disabled="";        
            CTIPFAC.className="";
            CTIPFAC.className="campowidthinput campo campotexto";  
            //Campo CPROPAGAFACUL 
            var CPROPAGAFACUL = document.getElementById("CPROPAGAFACUL");            
            CPROPAGAFACUL.disabled="";        
            CPROPAGAFACUL.className="";
            CPROPAGAFACUL.className="campowidthinput campo campotexto";      
        
       //Campo FGARPRI
            document.getElementById("icon_FGARPRI").style.visibility = "visible"; 
            var FGARPRI = document.getElementById("FGARPRI");            
            FGARPRI.readOnly=false;        
            FGARPRI.className="";
            FGARPRI.className="campowidthinput campo campotexto";   
            
       //Campo FGARDEP
            document.getElementById("icon_FGARDEP").style.visibility = "visible"; 
            var FGARDEP = document.getElementById("FGARDEP");            
            FGARDEP.readOnly=false;        
            FGARDEP.className="";
            FGARDEP.className="campowidthinput campo campotexto";   
       
      //Campo CFRERES 
            var CFRERES = document.getElementById("CFRERES");            
            CFRERES.disabled="";        
            CFRERES.className="";
            CFRERES.className="campowidthinput campo campotexto"; 
            
            //INI POST-230 MPC 27/12/2022 Se comenta codigo.
            /*var CCORRED = document.getElementById("CCORRED");            
            CCORRED.disabled="";        
            CCORRED.className="";
            CCORRED.className="campowidthinput campo campotexto";*/  
            //FIN POST-230 MPC 27/12/2022 Se comenta codigo.   
       
       //Campo PIMPINT 
            var PIMPINT = document.getElementById("PIMPINT");            
            PIMPINT.readOnly=false;       
            PIMPINT.className="";
            PIMPINT.className="campowidthinput campo campotexto";        
            
            //Campo CRESREA 
            //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            //var CRESREA = document.getElementById("CRESREA");            
            //CRESREA.disabled="";        
            //CRESREA.className="";
            //FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
          // CRESREA.className="campowidthinput campo campotexto";   
            
			//Campo TMASIVO
			/*var TMASIVO = document.getElementById("TMASIVO");
			TMASIVO.disabled="";
			TMASIVO.className="";
			
			var TMASIVO1 = document.getElementById("TMASIVO1");
			TMASIVO1.disabled="";
			TMASIVO1.className="";*/
            //Campo CCONREC 
            var CCONREC = document.getElementById("CCONREC");            
            CCONREC.disabled="";        
            CCONREC.className="";
            
            document.getElementById("ic_IFACCED").style.visibility = "visible"; // IAXIS-5361 09/07/2020
            // INICIO POST-74 30/06/2022 PAYV
            document.getElementById("ic_PFACCED").style.visibility = "visible"; 
            // FIN POST-74 30/06/2022 PAYV
            revisarEstilos();
        }
        
        function f_neteja_camps(){
        	 //INI POST-230 MPC Se adiciona codigo.
        	 var CCORREDOR = document.getElementById("CCORREDNIUS");
             if (!objUtiles.estaVacio(CCORREDOR)){
            	 CCORREDOR.value="";
             } 
             
             var TCORREDOR = document.getElementById("TCORRED");
             if (!objUtiles.estaVacio(TCORREDOR)){
            	 TCORREDOR.value="";
             } 
             //FIN POST-230 MPC Se adiciona codigo.
             
        //Campo compañia
            var CCOMPANIA = document.getElementById("CCOMPANIUS");
            if (!objUtiles.estaVacio(CCOMPANIA)){
                CCOMPANIA.value="";
            } 
            var TCOMPANIA = document.getElementById("TCOMPANI");
            if (!objUtiles.estaVacio(TCOMPANIA)){
                TCOMPANIA.value="";
            }                     
        //Campo TIDFCOM 
           var PTIDFCOM = document.getElementById("TIDFCOM");
           if(!objUtiles.estaVacio(PTIDFCOM)){
               PTIDFCOM.value="";
           }
        //Campo PCESION
            var PCESION = document.getElementById("PCESION");
            if (!objUtiles.estaVacio(PCESION)){
                PCESION.value="";
            }            
            
        //Campo ICESFIJ
            var ICESFIJ = document.getElementById("ICESFIJ");
            if (!objUtiles.estaVacio(ICESFIJ)){
                ICESFIJ.value="";
            }    
            
        //campo TCALIFI    
            var TCALIFI = document.getElementById("TCALIFI");
            if (!objUtiles.estaVacio(TCALIFI)){
                TCALIFI.value="";
            }   
            
        //Campo CCOMREA
            var CCOMREA = document.getElementById("CCOMREA");
            if (!objUtiles.estaVacio(CCOMREA)){
                CCOMREA.value="";
            }   
            
        //Campo PCOMISI
            var PCOMISI = document.getElementById("PCOMISI");
            if (!objUtiles.estaVacio(PCOMISI)){
                PCOMISI.value="";
            }             
            
        //Campo ICOMFIJ
            var ICOMFIJ = document.getElementById("ICOMFIJ");
            if (!objUtiles.estaVacio(ICOMFIJ)){
                ICOMFIJ.value="";
            }  
            
        //Campo ISCONTA
            var ISCONTA = document.getElementById("ISCONTA");
            if (!objUtiles.estaVacio(ISCONTA)){
                ISCONTA.value="";
            } 
            
        //Campo CINTRES
            var CINTRES = document.getElementById("CINTRES");
            if (!objUtiles.estaVacio(CINTRES)){
                CINTRES.value="";
            } 
            
         //Campo PINTRES
            var PINTRES = document.getElementById("PINTRES");
            if (!objUtiles.estaVacio(PINTRES)){
                PINTRES.value="";
            }
            
        //Campo PRESERV
            var PRESERV = document.getElementById("PRESERV");
            if (!objUtiles.estaVacio(PRESERV)){
                PRESERV.value="";
            }

            //INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            //Campo PRESREA
            var PRESREA = document.getElementById("PRESREA");
            if (!objUtiles.estaVacio(PRESREA)){
            	PRESREA.value="";
            }
			//FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
        
        }
        
        //INI POST-230 MPC Se adiciona ,CCORRED. 
        function f_modificar_companyia(CCOMPANI,CCORRED){        
            //if(document.getElementById("but_cancelar_accio").style.visibility != "visible"){
                objDom.setValorPorId("CCOMPANI", CCOMPANI);                                        objDom.setValorPorId("CCORRED", CCORRED); 
                objDom.setValorPorId("MODIFICACIO", "1");                                
                objUtiles.ejecutarFormulario("axis_axisrea020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                
                
        //}
        }
        //FIN POST-230 MPC Se adiciona ,CCORRED.
        
        function f_carrega_de_nou(){
         if(document.getElementById("CESTADO").value == 2){ 
            <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA">
            document.getElementById("but_nueva_c").style.visibility = "hidden"; 
            </axis:visible>
            }
         
         if(document.getElementById("CESTADO").value == 1){
            <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA">
            document.getElementById("but_nueva_c").style.visibility = "";  
            </axis:visible>
            }
            
            objDom.setValorPorId("MODIFICACIO", "0");                
            document.getElementById("but_cancelar_accio").style.visibility = "hidden";            
            objUtiles.ejecutarFormulario("axis_axisrea020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_nuevaCompania(){
        //Mostrem el botó Acceptar nova companyia        
            document.getElementById("TESTADO").style.display = "none";
            document.getElementById("CCOMREA").style.display = "none";
            document.getElementById("TCOMREA").style.display = "none";            
            document.getElementById("CINTRES").style.display = "none";
            document.getElementById("TINTERES").style.display = "none";            
            document.getElementById("CCOMPANIUS").style.display = "none";            
            //INI POST-230 MPC Se adiciona codigo.
            document.getElementById("CCORREDNIUS").style.display = "none";
            document.getElementById("TCORRED").style.display = "none";
            document.getElementById("COMBOCORRED").style.display = "";
            document.getElementById("COMBOCORRED").selectedIndex = 0;
            objDom.setValorPorId("MODIFICACIO", "0");
            //FIN POST-230 MPC Se adiciona codigo.
            document.getElementById("TCOMPANI").style.display = "none";
            document.getElementById("COMBOCOMPANI").style.display = "";
            document.getElementById("COMBOINTERES").style.display = "";
            document.getElementById("COMBOCOMISIO").style.display = "";
            document.getElementById("COMBOESTADO").style.display = "";
            document.getElementById("cuadreDades").style.visibility = "visible"; 
            document.getElementById("but_aceptar_nueva_c").style.display = "";
            document.getElementById("but_cancelar_accio").style.visibility = "visible";            
            document.getElementById("but_modif_c").style.display = "none";  
            <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA">
            document.getElementById("but_nueva_c").style.visibility = "hidden"; 
            </axis:visible>
            document.getElementById("COMBOCOMPANI").selectedIndex = 0;
            document.getElementById("COMBOINTERES").selectedIndex = 0;
            document.getElementById("COMBOCOMISIO").selectedIndex = 0;
            
            // BUG: 25502 2013-01-02 AEG Se pone por defecto chequeado el campo "Depósito por cuenta Reaseg" al crear nueva compañia
			//INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            //INFORCOL document.getElementById("CRESREA").value="1";
            //INFORCOL document.getElementById("CRESREA").checked="1";
			//FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
            document.getElementById("PIMPINT").value="";
            // FIN 25502

            //Preparamos los campos para modificación.
            f_allibera_camps();
            f_neteja_camps();            
            revisarEstilos();
            }
            
        function f_guarda_nueva_c(){       
        //revisarEstilos();      
        
           if (objValidador.validaEntrada()){
           
               var plocal = parseFloat(document.getElementById("PLOCAL").value);               
               var pcesion = parseFloat(document.getElementById("PCESION").value);
               var ccompani = document.getElementById("COMBOCOMPANI").value;
               //INI POST-230 MPC Se adiciona codigo.
               var ccorred = document.getElementById("COMBOCORRED").value;
               var ccod_pk;
               if (document.getElementById("COMBOCORRED").value == "99")
               { ccod_pk = document.getElementById("COMBOCOMPANI").value;
                   ccorred = null;
               }
                else
                   ccod_pk = document.getElementById("COMBOCOMPANI").value + document.getElementById("COMBOCORRED").value;
               //FIN POST-230 MPC Se adiciona codigo.
               
               if (plocal==100){
                   if(confirm('<axis:alt f="axisrea020" c="MSG1" lit="9905801"/>')){
                       document.getElementById("CCOMPANI").value =null;
                       //INI POST-230 MPC Se adiciona codigo.
                       document.getElementById("CCORRED").value =null;
                       document.getElementById("CCOD_PK").value =null;       
                       //FIN POST-230 MPC Se adiciona codigo.
                       objUtiles.ejecutarFormulario("axis_axisrea020.do", "m_novaCompanyia", document.miForm, "_self", objJsMessages.jslit_cargando);
                   }
               }else if (plocal!=100 && ccompani>0){
                   if (pcesion>0) {document.getElementById("CCOMPANI").value =ccompani;
                       //INI POST-230 MPC Se adiciona codigo.
                       document.getElementById("CCORRED").value = ccorred;
                       document.getElementById("CCOD_PK").value = ccod_pk;       
                       //FIN POST-230 MPC Se adiciona codigo.               
                   }else{document.getElementById("CCOMPANI").value =null;
                       //INI POST-230 MPC Se adiciona codigo.
                       document.getElementById("CCORRED").value = null;            
                       document.getElementById("CCOD_PK").value =null;       
                       //FIN POST-230 MPC Se adiciona codigo.  
                   }
                   objUtiles.ejecutarFormulario("axis_axisrea020.do", "m_novaCompanyia", document.miForm, "_self", objJsMessages.jslit_cargando);
               }
          }
        }
        
        function f_seleccionar_combo(elemento, combo) {      
      
           var cantidad = combo.length;
           
           for (i = 0; i < cantidad; i++) {
              var selected = combo.options[i].text;
              if (selected == elemento) {
                 combo[i].selected = true;
              }   
           }
        }  
       
       //INI POST-230 MPC Se adiciona codigo CCORRED Y CCOD_PK. 
       function f_borrar_companyia(CCOMPANI,CCORRED,obj){
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        var SFACULT = document.getElementById("SFACULT").value;
        var CESTADO = document.getElementById("CESTADO").value;
        var CCOD_PK = CCOMPANI + CCORRED;
        var CCORRED_V = CCORRED;
        if (CCORRED == null || CCORRED == "")
        {
        	//alert("CCORRED_V2"+CCORRED_V);
        	CCORRED_V = 99;
        }
       
        if (answer){
            objAjax.invokeAsyncCGI("axis_axisrea020.do", callbackAjaxDeleteCompanyia, "operation=ajax_delete_companyia&CCOMPANI=" + CCOMPANI + "&SFACULT=" + SFACULT + "&CESTADO=" + CESTADO + "&CCORRED=" + CCORRED_V + "&CCOD_PK=" + CCOD_PK, obj, objJsMessages.jslit_borrando_registro, CCOD_PK);
            
        }
    }  
    //FIN POST-230 MPC Se adiciona codigo CCORRED Y CCOD_PK.
        
        //INI POST-230 MPC Se modifica CCOMPANI por CCOD_PK.
         function callbackAjaxDeleteCompanyia(ajaxResponseText, CCOD_PK) {         
            try {                 
                var doc=objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if(objLista.borrarFilaDeListaConValorInput("T_IAX_CUACESFAC", CCOD_PK, "gridNotEven", "gridEven", "6", "<axis:alt f='axisrea020' c='LIT_BORRAR_JS' lit='1000254' />")){  
                        f_neteja_camps();
                    }
                    }
                       
                    
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
            //f_carrega_de_nou();
    }   
    //FIN POST-230 MPC Se modifica CCOMPANI por CCOD_PK.     

        /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/

        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }

        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_cerrar_axisrea021() {
            objUtiles.cerrarModal("axisrea021");
        }
        
        function f_aceptar_axisrea021(SFACULT, CESTADO, SSEGURO) {
            objUtiles.cerrarModal("axisrea021");
            objDom.setValorPorId("SFACULT", SFACULT);
            objDom.setValorPorId("CESTADO", CESTADO);            
            objDom.setValorPorId("SSEGURO", SSEGURO);   
            objDom.setValorPorId("CCOMPANI",null);
            objDom.setValorPorId("CCORRED",null); //POST-230 MPC 27/12/2022 Se adiciona linea.
            objDom.setValorPorId("CCOD_PK",null); //POST-230 MPC 27/12/2022 Se adiciona linea.
            objUtiles.ejecutarFormulario("axis_axisrea020.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
         function f_onclickCheckbox(thiss) {
           thiss.value =  ((thiss.checked)?1:0);
           objDom.setValorPorId(thiss.id, thiss.value);
        } 
        
        function f_carga_tasa(){
            f_cargar_propiedades_pantalla();
        }

        <%/*BRSP*/%>
        //INI POST-230 MPC 27/12/2022 Se adiciona CCORRED.
        function f_but_gedox(CCOMPANI,CCORRED) {              
            objUtiles.abrirModal("axisgedox", "src","modal_axisgedox.do?dt="+document.miForm.DTGDOC.value+"&operation=form&CCOMPANI="+CCOMPANI +"&CCOD_PK="+CCOMPANI+CCORRED);
        } 
        //FIN POST-230 MPC 27/12/2022 Se adiciona CCORRED.  
        function f_cerrar_axisgedox() {
            objUtiles.cerrarModal("axisgedox");
        }
        <%/*BRSP*/%>
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST"> 
    
    <% /*BRSP*/%>
      <input type="hidden" id="DTGDOC" name="DTGDOC" value="<%=new java.util.Date().getTime()%>"/> 
      <% /*BRSP*/%>         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisrea020" c="TIT_PANTALLA" lit="9001865"/></c:param>     <%-- Mantenimiento de facultativos --%>
                <c:param name="formulario"><axis:alt f="axisrea020" c="TIT_FORMULARIO" lit="9001865"/></c:param> <%-- Mantenimiento de facultativos --%>
                <c:param name="form">axisrea020</c:param>
        </c:import>
        
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisrea021|<axis:alt f="axisrea020" c="LIT_MODAL_AXISREA021" lit="9001864"/><%-- Buscador de facultativos --%>
            </c:param>
        </c:import>
        
        <%/*BRSP*/ %>           
                    
        <c:import url="../include/modal_estandar.jsp">
			<c:param name="titulo">
				<axis:alt f="axisrea002" c="TITULO" lit="1000614" />
			</c:param>
			<c:param name="nid" value="axisgedox" />
		</c:import>
        <%/*BRSP*/ %>
        
            
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="SFACULT" name="SFACULT" value="${__formdata.SFACULT}"/>
        <input type="hidden" id="CCOMPANI" name="CCOMPANI" value="${__formdata.CCOMPANI}"/>
        <%/*INI POST-230 MPC 27/12/2022*/ %> 
        <input type="hidden" id="CCORRED" name="CCORRED" value="${__formdata.CCORRED}"/>
        <input type="hidden" id="CCOD_PK" name="CCOD_PK" value="${__formdata.CCOD_PK}"/>
        <input type="hidden" id="CAMBIAMOD" name="CAMBIAMOD" value="${__formdata.CAMBIAMOD}"/>
        <%/*FIN POST-230 MPC 27/12/2022*/ %> 
        <input type="hidden" id="CESTADO" name="CESTADO" value="${__formdata.CESTADO}"/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
        <input type="hidden" id="MODIFICACIO" name="MODIFICACIO" value="${__formdata.MODIFICACIO}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <c:if test="${!empty requestScope.OB_IAX_CUAFACUL && empty requestScope.__mensajes.m__clave}">
                        <c:set var="resumen">
                            <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                <b><axis:alt f="axisrea020" c="LIT_SECCION_TIT" lit="9001875"/>:</b> ${requestScope.OB_IAX_CUAFACUL.NPOLIZA} &nbsp; <b><axis:alt f="axisrea020" c="LIT_SECC_1" lit="9001930"/>:</b> ${requestScope.OB_IAX_CUAFACUL.SFACULT}                         
                            </span>
                        </c:set>
                    </c:if>
                    <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisrea020" c="IMG_SECCION" lit="1000113"/><%-- Detalle --%> &nbsp; ${resumen} &nbsp; <img border="0" src="images/find.gif" onclick="f_but_buscar()" style="cursor:pointer" alt="<axis:alt f="axisrea020" c="LIT_TITULO_SECCION_2" lit="9000508"/>" title="<axis:alt f="axisrea020" c="LIT_SECCION_2" lit="9000508"/>"/></div>
                    
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:11%;height:0px"></th>
                                        <th style="width:13%;height:0px"></th>
                                        <th style="width:6%;height:0px"></th>
                                        
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axisrea020" c="NMOVIMI" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NMOVIMI"><axis:alt f="axisrea020" c="NMOVIMI" lit="9001868"/></b> <%-- Movimiento --%>                                                
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="FINICUF" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FINICUF"><axis:alt f="axisrea020" c="FINICUF" lit="100883"/></b> <%-- Fecha efecto --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="FFINCUF" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_FFINCUF"><axis:alt f="axisrea020" c="FFINCUF" lit="100885"/></b> <%-- Fecha vencimiento --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="SCUMULO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_SCUMULO"><axis:alt f="axisrea020" c="SCUMULO" lit="104181"/></b> <%-- Cúmulo --%>
                                            </td>
                                        </axis:ocultar>
                                        <!-- Inicio IAXIS-14737 19/01/2021 -->
                                        <axis:ocultar f="axisrea020" c="NCESFAC" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NCESFAC"><axis:alt f="axisrea020" c="NCESFAC" lit="89908090"/></b> <%-- No. Cesión Facultativo --%>
                                            </td>
                                        </axis:ocultar>
                                        <!-- Fin IAXIS-14737 19/01/2021 -->
                                         <td class="titulocaja">                                                
                                         </td>
                                    </tr>
                                    <tr>                 
                                        <axis:ocultar f="axisrea020" c="NMOVIMI" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NMOVIMI" name="NMOVIMI" size="15" 
                                                <axis:atr f="axisrea020" c="NMOVIMI" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.NMOVIMI}" style="width:10%"
                                                title="<axis:alt f="axisrea020" c="TIT_NMOVIMI" lit="9001868"/>"/>
                                                &nbsp;&nbsp;
                                                <input type="text" class="campowidthinput campo campotexto" id="TMOVIMI" name="TMOVIMI" size="15" 
                                                <axis:atr f="axisrea020" c="TMOVIMI" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.TMOVIMI}" style="width:80%"
                                                title="<axis:alt f="axisrea020" c="TIT_TMOVIMI" lit="9001868"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="FINICUF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FINICUF" name="FINICUF" size="15" 
                                                <axis:atr f="axisrea020" c="FINICUF" a="modificable=false"/>
                                                value="<fmt:formatDate value="${requestScope.OB_IAX_CUAFACUL.FINICUF}" pattern="dd/MM/yyyy"/>"
                                                style="width:60%" title="<axis:alt f="axisrea020" c="TIT_FINICUF" lit="100883"/>"/>
                                            </td>
                                        </axis:ocultar>
                                          <axis:ocultar f="axisrea020" c="FFINCUF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="FFINCUF" name="FFINCUF" size="15"  onchange="thiss(this);"
                                                <axis:atr f="axisrea020" c="FFINCUF" a="modificable=false"/>
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${requestScope.OB_IAX_CUAFACUL.FFINCUF}"/>" style="width:55%"
                                                title="<axis:alt f="axisrea020" c="TIT_FFINCUF" lit="100885"/>"/><a style="vertical-align:middle;"><img
                                                id="icon_FFINCUF" alt="<axis:alt f="axisrea020" c="ALT_FFINCUF" lit="108341"/>" title="<axis:alt f="axisrea020" c="TIT_CALENDARIO" lit="108341" />" src="images/calendar.gif"/></a>
                                            </td>
                                        </axis:ocultar>                                        
                                        <axis:ocultar f="axisrea020" c="SCUMULO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="SCUMULO" name="SCUMULO" size="15" 
                                                <axis:atr f="axisrea020" c="SCUMULO" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.SCUMULO}"
                                                style="width:60%" title="<axis:alt f="axisrea020" c="LIT_SCUMULO" lit="104181"/>"/>
                                            </td>
                                        </axis:ocultar>
					                    <!-- Inicio IAXIS-14737 19/01/2021 -->
                                        <axis:ocultar f="axisrea020" c="NCESFAC" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NCESFAC" name="NCESFAC" size="15" 
                                                <axis:atr f="axisrea020" c="NCESFAC" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.NCESFAC}"
                                                style="width:60%" title="<axis:alt f="axisrea020" c="LIT_NCESFAC" lit="89908090"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <!-- Fin IAXIS-14737 19/01/2021 -->
                                            <td class="titulocaja">                                                
                                            </td>
                                    </tr>
                                    
                                    <tr>
                                        <axis:ocultar f="axisrea020" c="NRIESGO" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_NRIESGO"><axis:alt f="axisrea020" c="NRIESGO" lit="100649"/></b> <%-- Riesgo --%>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="SCONTRA" dejarHueco="false">
                                            <td class="titulocaja" colspan="2">
                                                <b id="label_SCONTRA"><axis:alt f="axisrea020" c="SCONTRA" lit="9001594"/></b> <%-- Contrato QP/núm.versión --%>
                                            </td>
                                        </axis:ocultar>

                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea020" c="NRIESGO" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="NRIESGO" name="NRIESGO" size="15" 
                                                <axis:atr f="axisrea020" c="NRIESGO" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.NRIESGO}" style="width:10%"
                                                title="<axis:alt f="axisrea020" c="TIT_NRIESGO" lit="100649"/>"/>
                                                &nbsp;&nbsp;
                                                <input type="text" class="campowidthinput campo campotexto" id="TRIESGO" name="TRIESGO" size="15" 
                                                <axis:atr f="axisrea020" c="TRIESGO" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.TRIESGO}" style="width:80%"
                                                title="<axis:alt f="axisrea020" c="TIT_TRIESGO" lit="100649"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="SCONTRA" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="SCONTRA" name="SCONTRA" size="15" 
                                                <axis:atr f="axisrea020" c="SCONTRA" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.SCONTRA}" style="width:30%"
                                                title="<axis:alt f="axisrea020" c="TIT_SCONTRA" lit="9001594"/>"/>
                                                &nbsp;&nbsp;
                                                <input type="text" class="campowidthinput campo campotexto" id="NVERSIO" name="NVERSIO" size="15" 
                                                <axis:atr f="axisrea020" c="NVERSIO" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.NVERSIO}" style="width:30%"
                                                title="<axis:alt f="axisrea020" c="TIT_NVERSIO" lit="9001594"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axisrea020" c="TCONTRA" dejarHueco="false">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" id="TCONTRA" name="TCONTRA" size="15" 
                                                <axis:atr f="axisrea020" c="TCONTRA" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.TCONTRA}"
                                                style="width:81.4%" title="<axis:alt f="axisrea020" c="TIT_TCONTRA" lit="9001594"/>"/>
                                            </td>
                                        </axis:ocultar>

                                            <td class="titulocaja">                                                
                                            </td>
                                    </tr>                                    
                                    <tr>
                                        <axis:ocultar f="axisrea020" c="CGARANT" dejarHueco="false">
                                            <td class="titulocaja">
                                                <b id="label_CGARANT"><axis:alt f="axisrea020" c="CGARANT" lit="110994"/></b> <%-- Garantía --%>
                                            </td>
                                        </axis:ocultar>
                                        <td class="titulocaja">
                                            <axis:ocultar f="axisrea020" c="PLOCAL" dejarHueco="false">
                                                <b id="label_PLOCAL"><axis:alt f="axisrea020" c="PLOCAL" lit="9001917"/></b> <%-- % Local --%>
                                                &nbsp;&nbsp;
                                            </axis:ocultar>
                                            <axis:ocultar f="axisrea020" c="PFACCED" dejarHueco="false">
                                                <b id="label_PFACCED" ><axis:alt f="axisrea020" c="PFACCED" lit="9000608"/></b> <%-- % Reas. --%>
                                            </axis:ocultar>
                                        </td>
                                        <!--
                                         <td class="titulocaja">
                                            <axis:ocultar f="axisrea020" c="ICAPITAL" dejarHueco="false">
                                               
                                                    <b id="label_ICAPITAL"><axis:alt f="axisrea020" c="TIT_AUX" lit="1000073"/></b> <%-- Capital --%>
                                              
                                            </axis:ocultar>
                                            </td>  
                                        -->    
                                            <td class="titulocaja">
                                            <axis:ocultar f="axisrea020" c="IFACCED" dejarHueco="false">
                                               
                                                    <b id="label_IFACCED"><axis:alt f="axisrea020" c="IFACCED" lit="9001870"/></b> <%-- Cesión --%>
                                                 
                                            </axis:ocultar>
                                             </td> 
                                            <td class="titulocaja">
                                                 <axis:ocultar f="axisrea020" c="TESTADO" dejarHueco="false">
                                                    
                                                        <b id="label_TESTADO"><axis:alt f="axisrea020" c="TESTADO" lit="100587"/></b> <%-- Estado --%>
                                                    
                                                </axis:ocultar>
                                            </td> 
                                            <td class="titulocaja">
                                                <axis:ocultar f="axisrea020" c="CTIPFAC" dejarHueco="false">
                                                    <b id="label_CTIPFAC"><axis:alt f="axisrea020" c="CTIPFAC" lit="9904119"/></b> <%-- Tipo facultativo --%>
                                                </axis:ocultar>
                                            </td>
                                            
                                              <td class="titulocaja">
                                                <axis:ocultar f="axisrea020" c="CPROPAGAFACUL" dejarHueco="false">
                                                    <b id="label_CPROPAGAFACUL"><axis:alt f="axisrea020" c="CPROPAGAFACUL" lit="89906125"/></b> <%-- Replicar facultativoso --%>
                                                </axis:ocultar>
                                            </td>
                                            
                                            <!-- <td class="titulocaja">
												 <axis:ocultar f="axisrea020" c="TMASIVO" dejarHueco="false">
														<b id="label_MASIVO"><axis:alt f="axisrea020" c="TMASIVO" lit="89906125"/></b> <%-- Masivo --%>
                                                </axis:ocultar>
                                            </td>
                                            
                                            <td class="titulocaja">
												 <axis:ocultar f="axisrea020" c="TMASIVO1" dejarHueco="false">
														<b id="label_MASIVO1"><axis:alt f="axisrea020" c="TMASIVO1" lit="89906125"/></b> <%-- Masivo --%>
                                                </axis:ocultar>
                                            </td> -->  
                                            <td class="titulocaja">
                                                <axis:ocultar f="axisrea020" c="PTASAXL" dejarHueco="false">
                                                    <b id="label_PTASAXL"><axis:alt f="axisrea020" c="PTASAXL" lit="9904122"/></b> <%-- Tasa XL --%>
                                                </axis:ocultar>
                                            </td>
                                    </tr>
                                    <tr>
                                        <axis:ocultar f="axisrea020" c="CGARANT" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" id="CGARANT" name="CGARANT" size="15" 
                                                <axis:atr f="axisrea020" c="CGARANT" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.CGARANT}" style="width:10%"
                                                title="<axis:alt f="axisrea020" c="CGARANT_1" lit="110994"/>"/>
                                                &nbsp;&nbsp;
                                                <input type="text" class="campowidthinput campo campotexto" id="TGARANT" name="TGARANT" size="15" 
                                                <axis:atr f="axisrea020" c="TGARANT" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.TGARANT}" style="width:80%"
                                                title="<axis:alt f="axisrea020" c="TIT_CGARANT" lit="110994"/>"/>
                                            </td>
                                        </axis:ocultar>
                                        <td class="campocaja">
                                            <axis:ocultar f="axisrea020" c="PLOCAL" dejarHueco="false">
                                                <input type="text" class="campowidthinput campo campotexto" id="PLOCAL" name="PLOCAL" size="15" 
                                                <axis:atr f="axisrea020" c="PLOCAL" a="modificable=false"/>
                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUAFACUL.PLOCAL}" pattern="###,##0.00"/>"
                                                style="width:30%"
                                                title="<axis:alt f="axisrea020" c="TIT_PLOCAL" lit="9001917"/>"/>
                                                &nbsp;&nbsp;
                                            </axis:ocultar>                                                
                                            <axis:ocultar f="axisrea020" c="PFACCED" dejarHueco="false">
                                                <input type="text" class="campowidthinput campo campotexto" id="PFACCED" name="PFACCED" size="15" 
                                                <axis:atr f="axisrea020" c="PFACCED" a="modificable=false"/>
                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUAFACUL.PFACCED}" pattern="###,##0.00"/>"
                                                style="width:30%"
                                                title="<axis:alt f="axisrea020" c="TIT_PFACCED" lit="9000608"/>"/>
                                                <!--INICIO POST-74 30/06/2022 PAYV-->
                                                    <img border="0" id="ic_PFACCED" alt="Modificar % Reaseguro" title="Modificar % Reaseguro" src="images/lapiz.gif" onclick="f_but_hab_Pfacced()"/>
                                                <!--FIN POST-74 30/06/2022 PAYV -->
                                            </axis:ocultar>                                                
                                        </td>
                                        <!--
                                        <td class="campocaja">
                                            <axis:ocultar f="axisrea020" c="ICAPITAL" dejarHueco="false">
                                                
                                                    <input type="text" class="campowidthinput campo campotexto" id="ICAPITAL" name="ICAPITAL" size="15" 
                                                    <axis:atr f="axisrea020" c="ICAPITAL" a="modificable=false"/>
                                                    value="<fmt:formatNumber value="${requestScope.OB_IAX_CUAFACUL.ICAPITAL}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>"
                                                    style="width:60%" title="<axis:alt f="axisrea020" c="TIT_AUX_3" lit="1000073"/>"/>
                                                
                                            </axis:ocultar>                                            
                                            </td>   
                                          -->  
                                            <td class="campocaja">  
                                            <axis:ocultar f="axisrea020" c="IFACCED" dejarHueco="false">                                                
                                                    <input type="text" class="campowidthinput campo campotexto" id="IFACCED" name="IFACCED" size="15" 
                                                    <axis:atr f="axisrea020" c="IFACCED" a="modificable=false"/>
                                                    value="<fmt:formatNumber value="${requestScope.OB_IAX_CUAFACUL.IFACCED}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>"
                                                    style="width:60%" title="<axis:alt f="axisrea020" c="TIT_IFACCED" lit="9001870"/>"/>
													<!--Inicio IAXIS-5361 09/07/2020 -->
                                                    <img border="0" id="ic_IFACCED" alt="Modificar cesión" title="Modificar cesión" src="images/lapiz.gif" onclick="f_but_hab_facced()"/>
                                                    <!--Fin IAXIS-5361 09/07/2020 -->
                                            </axis:ocultar>
                                            </td>         
                                             <axis:ocultar f="axisrea020" c="TESTADO" dejarHueco="false">
                                         <td class="campocaja">
                                                <%-- BUG: 25026 2013-01-02 AEG se agrego tooltip 100587 --%>
                                                <select name="COMBOESTADO" id="COMBOESTADO"  size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                        title="<axis:alt f="axisrea020" c="TIT_COMBOESTADO" lit="100587"/>">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="SELECC_COMBOESTADO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${requestScope.LST_ESTADOS}">
                                                            <option value="${element.CATRIBU}"
                                                            <c:if test="${requestScope.OB_IAX_CUAFACUL.CESTADO == element.CATRIBU}"> selected="selected"</c:if>>
                                                                ${element.TATRIBU}   
                                                            </option>
                                                        </c:forEach>
                                                 </select>                                             
                                                <input type="text" class="campowidthinput campo campotexto" id="TESTADO" name="TESTADO" size="15" 
                                                <axis:atr f="axisrea020" c="TESTADO" a="modificable=false"/>
                                                value="${requestScope.OB_IAX_CUAFACUL.TESTADO}"
                                                style="width:100%" title="<axis:alt f="axisrea020" c="TIT_TESTADO" lit="100587"/>"/>                                                
                                            </td>
                                            </axis:ocultar>  
                                            <axis:ocultar f="axisrea020" c="CTIPFAC" dejarHueco="false">
                                             <td class="campocaja">
                                                    <select name="CTIPFAC" id="CTIPFAC"  size="1" class="campowidthselect campo campotexto" style="width:100%;" 
                                                            title="<axis:alt f="axisrea020" c="TIT_CTIPFAC" lit="9904119"/>" onchange="f_carga_tasa()"
                                                            <axis:atr f="axisrea020" c="CTIPFAC" a="modificable=false&isInputText=false"/>>&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="SELECC_CTIPFAC" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${requestScope.LST_CTIPFALCUL}"> 
                                                                <option value="${element.CATRIBU}"
                                                                <c:if test="${requestScope.OB_IAX_CUAFACUL.CTIPFAC == element.CATRIBU}"> selected="selected"</c:if>>
                                                                    ${element.TATRIBU}   
                                                                </option>
                                                            </c:forEach>
                                                     </select>                                             
                                                                                                  
                                                </td>
                                            </axis:ocultar>  
                                            <axis:ocultar f="axisrea020" c="CPROPAGAFACUL" dejarHueco="false">
                                             <td class="campocaja">
                                                    <select name="CPROPAGAFACUL" id="CPROPAGAFACUL"  size="1" class="campowidthselect campo campotexto" style="width:100%;" 
                                                            title="<axis:alt f="axisrea020" c="TIT_CPROPAGAFACUL" lit="9904119"/>" onchange="f_carga_tasa()"
                                                            <axis:atr f="axisrea020" c="CPROPAGAFACUL" a="modificable=false&isInputText=false"/>>&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="SELECC_CPROPAGAFACUL" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${requestScope.LST_CPROPAGAFACUL}"> 
                                                                <option value="${element.CATRIBU}">
                                                                    ${element.TATRIBU}   
                                                                </option>
                                                            </c:forEach>
                                                     </select>                                             
                                                                                                  
                                                </td>
                                            </axis:ocultar>  
                                           <!-- 
                                            <axis:ocultar f="axisrea020" c="TMASIVO" dejarHueco="false">
												<td class="campocaja">
													<input type= "checkbox" id="TMASIVO" name="TMASIVO" onclick="f_onclickCheckbox(this)" title="<axis:alt f="axisrea020" c="TIT_TMASIVO" lit="9000608"/>
														<c:if test=""> checked</c:if>  value="" disabled="disabled"/>
												</td>
											</axis:ocultar>
											<axis:ocultar f="axisrea020" c="TMASIVO1" dejarHueco="false">
												<td class="campocaja">
													<input type= "checkbox" id="TMASIVO1" name="TMASIVO1" onclick="f_onclickCheckbox1(this)" title="<axis:alt f="axisrea020" c="TIT_TMASIVO1" lit="9000608"/>
														<c:if test=""> checked</c:if>  value="" disabled="disabled"/>
												</td>
											</axis:ocultar>
											 -->
                                            <axis:ocultar f="axisrea020" c="PTASAXL" dejarHueco="false">
                                                <td>
                                                    <input type="text" class="campowidthinput campo campotexto" id="PTASAXL" name="PTASAXL" size="15" 
                                                    <axis:atr f="axisrea020" c="PTASAXL" a="modificable=false"/>
                                                    value="<fmt:formatNumber value="${requestScope.OB_IAX_CUAFACUL.PTASAXL}" pattern="###,##0.00"/>"
                                                    style="width:70%"
                                                    title="<axis:alt f="axisrea020" c="TIT_PTASAXL" lit="9904122"/>"/>
                                                </td>
                                            </axis:ocultar> 
                                    </tr>
                                </table>
                            </td>                            
                        </tr>
                        <tr>                            
                            <td align="left">                                
                                <table class="area" align="center">
                                    <tr>
                                        <td>
                                            <div class="separador">&nbsp;</div>
                                            <c:set var="title0"><axis:alt f="axisrea020" c="NFACULT_LIT" lit="9001918"/></c:set>  <%-- Nº facultativo --%>
                                            <c:set var="title1"><axis:alt f="axisrea020" c="CIA_LIT" lit="9000600"/></c:set>  <%-- Compañía --%>                                 
                                            <c:set var="title5"><axis:alt f="axisrea020" c="CIA_LIT" lit="9000752"/></c:set>  <%-- Brocker POST-230 MPC 27/12/2022 --%>                                
                                            <c:set var="title2"><axis:alt f="axisrea020" c="CESION_LIT" lit="9000613"/></c:set>  <%-- % Cesión --%>              
                                            <c:set var="title4"><axis:alt f="axisrea020" c="TCALIFI_LIT" lit="9903963"/></c:set>  <%-- qualificació  --%>         
                                            <c:set var="title3"><axis:alt f="axisrea020" c="ICESION_LIT" lit="9001919"/></c:set>  <%-- Imp.cesión --%>              
                                            
                                            <div id="dt_polizas" class="seccion displayspace">
                                                <display:table name="${sessionScope.T_IAX_CUACESFAC}" id="T_IAX_CUACESFAC" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0"
                                                    requestURI="axis_axisrea020.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    <display:column title="" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                                        <div class="dspIcons">
                                                        <%-- INI POST-230 MPC 27/12/2022 --%>                                                            
                                                            <input type="radio" name="selFacult" id="${T_IAX_CUACESFAC.CCOD_PK}" value="${T_IAX_CUACESFAC.CCOD_PK}" onclick="f_seleccionar('${T_IAX_CUACESFAC.CCOMPANI}','${T_IAX_CUACESFAC.CCORRED}','${T_IAX_CUACESFAC.CCOD_PK}')"
                                                            <c:if test="${__formdata.CCOD_PK== T_IAX_CUACESFAC.CCOD_PK}">checked="checked"</c:if>/>
                                                            <%-- FIN POST-230 MPC 27/12/2022 --%>
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title0}" sortable="true" sortProperty="SFACULT" headerClass="fixed sortable"  media="html" autolink="false" style="width:10%">
                                                        <div class="dspText">
                                                            ${T_IAX_CUACESFAC.SFACULT}
                                                        </div>
                                                    </display:column>
                                                    <display:column title="${title1}" sortable="true" sortProperty="CCOMPANI" headerClass="fixed sortable"  media="html" autolink="false" style="width:25%">
                                                        <div class="dspText">
                                                            ${T_IAX_CUACESFAC.CCOMPANI}${!empty T_IAX_CUACESFAC.CCOMPANI && !empty T_IAX_CUACESFAC.TCOMPANI ? ' - ' : ''}${T_IAX_CUACESFAC.TCOMPANI}                        
                                                        </div>
                                                    </display:column>
													<%-- INI POST-230 MPC 27/12/2022 --%>
                                                     <display:column title="${title5}" sortable="true" sortProperty="CCORRED" headerClass="fixed sortable"  media="html" autolink="false" style="width:25%">
                                                        <div class="dspText">
                                                             ${T_IAX_CUACESFAC.CCORRED}${!empty T_IAX_CUACESFAC.CCORRED && !empty T_IAX_CUACESFAC.TCORRED ? ' - ' : ''}${T_IAX_CUACESFAC.TCORRED}                                                                                          
                                                        </div>
                                                    </display:column>
													<%-- INI POST-230 MPC 27/12/2022 --%>
                                                    <%-- BUG: 25502 2013-01-02 AEG se modifica formato 5 decimales --%>
                                                    <display:column title="${title2}" sortable="true" sortProperty="PCESION" headerClass="fixed sortable"  media="html" autolink="false" style="width:15%">
                                                        <div class="dspText">
                                                            <fmt:formatNumber value="${T_IAX_CUACESFAC.PCESION}" pattern="###,##0.00000"/>
                                                        </div>
                                                    </display:column>
                                                    <axis:visible f="axisrea020" c="TCALIFI">
                                                     <display:column title="${title4}" sortable="true" sortProperty="TCALIFI" headerClass="fixed sortable"  media="html" autolink="false" style="width:25%">
                                                       <div class="dspText">
                                                           ${T_IAX_CUACESFAC.TCALIFI}                                                      
                                                        </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <display:column title="${title3}" sortable="true" sortProperty="ICESFIJ" headerClass="fixed sortable"  media="html" autolink="false" style="width:25%">
                                                        <div class="dspText">
                                                            <fmt:formatNumber value="${T_IAX_CUACESFAC.ICESFIJ}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>                                                            
                                                        </div>                                                    
                                                    </display:column>
                                                    <%/*BRSP*/ %>
                                                    <axis:visible f="axisrea020" c="BT_DOCUMENTOSGDC">                                                         
                                                         <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons">
                                                            	<a href="javascript:f_but_gedox('${T_IAX_CUACESFAC.CCOMPANI}','${T_IAX_CUACESFAC.CCORRED}')"> <%-- POST-230 MPC 27/12/2022 --%>
                                                                     <img border="0" alt="<axis:alt f="axisrea002" c="LIT_IMG_VAL" lit="1000577"/>" title="${title14}" src="images/gdocumental.gif"/>
                                                                 </a>
                                                          	</div>
                                                        </display:column>                                    
                                                    </axis:visible>
                                                    <%/*BRSP*/ %>
                                                    <axis:visible f="axisrea020" c="BT_MODIF_COMPANIA">
                                                         <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip del lapiz y la X --%>
                                                         <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons"><a href="javascript:f_modificar_companyia('${T_IAX_CUACESFAC.CCOMPANI}','${T_IAX_CUACESFAC.CCORRED}');"><img border="0" alt="<axis:alt f='axisrea020' c='CCOMPANI_LIT_1' lit='100002'/> <axis:alt f='axisrea020' c='CCOMPANI_ALT_1' lit='9000617'/>" title="<axis:alt f='axisrea020' c='CCOMPANI_SIV_1' lit='100002'/> <axis:alt f='axisrea020' c='CCOMPANI_MIN_1' lit='9000617'/>" src="images/lapiz.gif"/></a><%-- POST-230 MPC 27/12/2022 --%>
                                                            </div>
                                                        </display:column>                                    
                                                    </axis:visible>
                                                    <axis:visible f="axisrea020" c="BT_DEL_COMPANIA">
                                                        <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons"><a href="javascript:f_borrar_companyia('${T_IAX_CUACESFAC.CCOMPANI}','${T_IAX_CUACESFAC.CCORRED}',this)"><img border="0" alt="<axis:alt f='axisrea020' c='CCOMPANI_LIT_2' lit='1000127'/> <axis:alt f='axisrea020' c='CCOMPANI_ALT_2' lit='9000617'/>" title="<axis:alt f='axisrea020' c='CCOMPANI_SIV_2' lit='1000127'/> <axis:alt f='axisrea020' c='CCOMPANI_MIN_2' lit='9000617'/>" src="images/delete.gif"/></a><%-- POST-230 MPC 27/12/2022 --%>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                </display:table>                                                        
                                            </div>
                                             <%-- Si el cuadro no está completo --%>
                                                    
                                                        <tr>
                                                            <td align="right" colspan="4">
                                                                <div class="separador">&nbsp;</div>
                                                                <axis:visible f="axisrea020" c="BT_NUEVA_COMPANIA">
                                                                    <input type="button" class="boton" id="but_nueva_c" value="<axis:alt f="axisrea020" c="NCOMP" lit="104825" />" onclick="jacascript:f_nuevaCompania();" />
                                                                </axis:visible>                                                             
                                                                <div class="separador">&nbsp;</div>
                                                            </td>
                                                        </tr>    
                                                    
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                 
                            <tr id="cuadreDades">
                                <td align="left">
                                <div class="separador">&nbsp;</div>
                                    <table class="area" align="center"> 
                                        <tr>
                                            <td>
                                                <c:set var="resumen_detalle">
                                                    <span class="titulocaja" style="color:black;font-weight:normal;padding-bottom:2px;.vertical-align:bottom">
                                                        <b><axis:alt f="axisrea020" c="SECC_RESUMEN" lit="9001930"/>:</b> ${requestScope.OB_IAX_CUAFACUL.SFACULT} &nbsp; <b><axis:alt f="axisrea020" c="SEC_DATOS1" lit="9000600"/>:</b> ${requestScope.OB_IAX_CUACESFAC.CCOMPANI}${!empty requestScope.OB_IAX_CUACESFAC.CCOMPANI && !empty requestScope.OB_IAX_CUACESFAC.TCOMPANI ? ' - ' : ''}${requestScope.OB_IAX_CUACESFAC.TCOMPANI}                        
                                                    </span>
                                                </c:set>
                                                
                                                <div class="titulo" ><img src="images/flecha.gif"/><axis:alt f="axisrea020" c="SECCION_DETALLE" lit="9001866"/> <%-- Detalle cesión --%> &nbsp; ${resumen_detalle} </div>
                                                <table class="area" align="center"> 
                                                
                                                    <tr>
                                                        <th style="width:25%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                        <th style="width:11%;height:0px"></th>
                                                        <th style="width:11%;height:0px"></th>
                                                        <th style="width:13%;height:0px"></th>
                                                        <th style="width:20%;height:0px"></th>
                                                   
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea020" c="CCOMPANI" dejarHueco="false">
                                                            <td class="titulocaja" >
                                                                <b id="label_CCOMPANI"><axis:alt f="axisrea020" c="CCOMPANI" lit="9000600"/></b>  <%-- Compañía --%>                                 
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="CCORRED" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_CCORRED"><axis:alt f="axisrea020" c="CCORRED" lit="9000752"/></b>  <%-- Broker --%>                                 
                                                            </td>
                                                        </axis:ocultar>
                                                        
                                                        <axis:ocultar f="axisrea020" c="PCESION" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisrea020" c="PCESION" lit="9000613"/><b>  <%-- % Cesión --%>                                                          
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="ICESFIJ" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisrea020" c="ICESFIJ" lit="9001919"/></b>  <%-- Imp.cesión --%>            
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="FGARPRI" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisrea020" c="FGARPRI" lit="9904126"/></b>  <%-- Fecha garántia pago --%>            
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="ISCONTA" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_ISCONTA"><axis:alt f="axisrea020" c="ISCONTA" lit="9001925"/></b> <%-- Imp.límit.sinies.contado --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="TIDFCOM" dejarHueco="false">
                                                            <td class="titulocaja" >
                                                                <b id="label_TIDFCOM"><axis:alt f="axisrea020" c="TIDFCOM" lit="9906072"/></b>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>                 
                                                        <axis:ocultar f="axisrea020" c="CCOMPANI" dejarHueco="false">
                                                        
                                                            <td class="campocaja">
                                                              <select name="COMBOCOMPANI" id="COMBOCOMPANI"  size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                                     <axis:atr f="axisrea020" c="COMBOCOMPANI" a="modificable=true"/> title="<axis:alt f="axisrea020" c="CCOMPANI_1" lit="9000600"/>">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="CCOMPANI_2" lit="1000348"/> - </option>
                                                                <c:forEach var="element" items="${requestScope.LST_COMPANYIES}">
                                                                    <option value="${element.CCOMPANI}"
                                                                    <c:if test="${requestScope.OB_IAX_CUACESFAC.CCOMPANI == element.CCOMPANI}"> selected="selected"</c:if>>
                                                                        ${element.TCOMPANI}   
                                                                    </option>
                                                                </c:forEach>
                                                              </select>
                                                                <input type="text" class="campowidthinput campo campotexto" id="CCOMPANIUS" name="CCOMPANIUS" size="15" 
                                                                <axis:atr f="axisrea020" c="CCOMPANI" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUACESFAC.CCOMPANI}" style="width:10%"
                                                                title="<axis:alt f="axisrea020" c="CCOMPANIUS_1" lit="9000600"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="TCOMPANI" name="TCOMPANI" size="15" 
                                                                <axis:atr f="axisrea020" c="TCOMPANI" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUACESFAC.TCOMPANI}" style="width:79%"
                                                                title="<axis:alt f="axisrea020" c="TCOMPANI_1" lit="9000600"/>"/>
                                                            
                                                            </td>
                                                        </axis:ocultar>
                                                        <%--INI POST-230 MPC 27/12/2022 --%>
                                                        
                                                        <axis:ocultar f="axisrea020" c="CCORRED" dejarHueco="false">
                                                            <td class="campocaja">
                                                              <select name="COMBOCORRED" id="COMBOCORRED" size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                                     <axis:atr f="axisrea020" c="COMBOCORRED" a="modificable=true"/> title="<axis:alt f="axisrea020" c="CCORRED_1" lit="9000752"/>">&nbsp;
                                                                <option value="99"> - <axis:alt f="axisrea020" c="COMBOCORRED" lit="9000752"/> - </option>
                                                                <c:forEach var="element" items="${requestScope.LST_CTIPBROKER}">
                                                                    <option value="${element.CCOMPANI}"
                                                                    <c:if test="${requestScope.OB_IAX_CUACESFAC.CCORRED == element.CCOMPANI}"> selected="selected"</c:if>>
                                                                        ${element.TCOMPANI}   
                                                                    </option>
                                                                </c:forEach>
                                                              </select>
                                                                <input type="text" class="campowidthinput campo campotexto" id="CCORREDNIUS" name="CCORREDNIUS" size="15" 
                                                                <axis:atr f="axisrea020" c="CCORRED" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUACESFAC.CCORRED}" style="width:10%"
                                                                title="<axis:alt f="axisrea020" c="CCORREDNIUS_1" lit="9000752"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="TCORRED" name="TCORRED" size="15" 
                                                                <axis:atr f="axisrea020" c="TCORRED" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUACESFAC.TCORRED}" style="width:79%"
                                                                title="<axis:alt f="axisrea020" c="TCORRED_1" lit="9000752"/>"/>
                                                            
                                                            </td>
                                                        </axis:ocultar>
                                                        <%-- FIN POST-230 MPC 27/12/2022 --%>
                                                        
                                                        <axis:ocultar f="axisrea020" c="PCESION" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25502 2013-01-02 AEG se modifica formato 5 decimales --%>
                                                                <input type="text" class="campowidthinput campo campotexto" id="PCESION" name="PCESION" size="15" 
                                                                <axis:atr f="axisrea020" c="PCESION" a="modificable=false&formato=decimal"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.PCESION}" pattern="###,##0.00000"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="PCESION_1" lit="9000613"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="ICESFIJ" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="ICESFIJ" name="ICESFIJ" size="15" 
                                                                <axis:atr f="axisrea020" c="ICESFIJ" a="modificable=false&formato=decimal"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.ICESFIJ}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="ICESFIJ_1" lit="9001919"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="FGARPRI" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip 9904126 --%>
                                                                <input type="text" class="campowidthinput campo campotexto" id="FGARPRI" name="FGARPRI" size="15" 
                                                                <axis:atr f="axisrea020" c="FGARPRI" a="modificable=false&formato=fecha"/>
                                                                value="<fmt:formatDate value="${requestScope.OB_IAX_CUACESFAC.FGARPRI}" pattern="dd/MM/yyyy"/>"
                                                                style="width:80%" title="<axis:alt f="axisrea020" c="TIT_FGARPRI" lit="9904126"/>"/>
                                                                <a style="vertical-align:middle;">
                                                                    <img id="icon_FGARPRI" alt="<axis:alt f="axisrea020" c="ALT_FGARPRI" lit="108341"/>" 
                                                                        title="<axis:alt f="axisrea020" c="TIT_CALENDARIO" lit="108341" />" 
                                                                        src="images/calendar.gif"/> </a>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="ISCONTA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="ISCONTA" name="ISCONTA" size="15" 
                                                                <axis:atr f="axisrea020" c="ISCONTA" a="modificable=false&formato=decimal"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.ISCONTA}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>"
                                                                style="width:50%" title="<axis:alt f="axisrea020" c="ISCONTA_1" lit="9001925"/>"/>
                                                            </td>
                                                       </axis:ocultar>
                                                       <axis:ocultar f="axisrea020" c="TIDFCOM" dejarHueco="false">
                                                            <td class="campocaja" colspan="2">
                                                                <input type="text" class="campowidthinput campo campotexto" id="TIDFCOM" name="TIDFCOM" size="15" 
                                                                <axis:atr f="axisrea020" c="TIDFCOM" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUAFACUL.TIDFCOM}"
                                                                style="width:81.4%" title="<axis:alt f="axisrea020" c="TIT_TIDFCOM" lit="9906072"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea020" c="CCOMREA" dejarHueco="false">
                                                            <td class="titulocaja" colspan="2">
                                                                <b id="label_NRIESGO"><axis:alt f="axisrea020" c="CCOMREA" lit="9001922"/></b> <%-- Código comisión --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PCOMISI" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_PCOMISI"><axis:alt f="axisrea020" c="PCOMISI" lit="9001923"/></b> <%-- % Comisión --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="ICOMFIJ" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_ICOMFIJ"><axis:alt f="axisrea020" c="ICOMFIJ" lit="9001924"/></b> <%-- Imp.comisión --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PIMPINT" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_PCOMISI"><axis:alt f="axisrea020" c="PIMPINT" lit="9904128"/></b> <%-- % Impuesto sobre interés --%>
                                                            </td>
                                                        </axis:ocultar>                                                    
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisrea020" c="CCOMREA" dejarHueco="false">
                                                            <td class="campocaja" colspan="2">
                                                              <select name="COMBOCOMISIO" id="COMBOCOMISIO"  size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                                     title="<axis:alt f="axisrea020" c="CCOMREA_SELECC" lit="9001922"/>">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="CCOMREA_1" lit="9001922"/> - </option>
                                                                <c:forEach var="element" items="${requestScope.LST_COMISREA}">
                                                                    <option value="${element.CCOMREA}"
                                                                    <c:if test="${requestScope.OB_IAX_CUACESFAC.CCOMREA == element.CCOMREA}"> selected="selected"</c:if>>
                                                                        ${element.TDESCRI}   
                                                                    </option>
                                                                </c:forEach>
                                                              </select>
                                                                <input type="text" class="campowidthinput campo campotexto" id="CCOMREA" name="CCOMREA" size="15" 
                                                                <axis:atr f="axisrea020" c="CCOMREA" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUACESFAC.CCOMREA}" style="width:10%"
                                                                title="<axis:alt f="axisrea020" c="CCOMREA_1" lit="9001922"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="TCOMREA" name="TCOMREA" size="15" 
                                                                <axis:atr f="axisrea020" c="TCOMREA" a="modificable=false"/>
                                                                value="${requestScope.DESCCOMISIO}" style="width:80%"
                                                                title="<axis:alt f="axisrea020" c="TCOMREA_1" lit="9001922"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PCOMISI" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="PCOMISI" name="PCOMISI" size="15" 
                                                                <axis:atr f="axisrea020" c="PCOMISI" a="modificable=false&formato=decimal"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.PCOMISI}" pattern="###,##0.00"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="PCOMISI_1" lit="9001923"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="ICOMFIJ" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="ICOMFIJ" name="ICOMFIJ" size="15" 
                                                                <axis:atr f="axisrea020" c="ICOMFIJ" a="modificable=false&formato=decimal"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.ICOMFIJ}" pattern="${__formatNumberPatterns[__defaultCMONINT]}"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="ICOMFIJ_1" lit="9001924"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PIMPINT" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25502 2013-01-21 AEG se agrego disabled="disabled" --%>
                                                                <input type="text" class="campowidthinput campo campotexto" id="PIMPINT" name="PIMPINT" size="15"  disabled="disabled"
                                                                <axis:atr f="axisrea020" c="PIMPINT" a="modificable=false"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.PIMPINT}" pattern="###,##0.00"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="PIMPINT_1" lit="9904128"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="CCONREC" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip 9904129 --%>
                                                                <input type= "checkbox" id="CCONREC" name="CCONREC" onclick="f_onclickCheckbox(this)" title="<axis:alt f="axisrea020" c="TIT_CRESREA" lit="9904129"/>"
                                                                        <c:if test="${requestScope.OB_IAX_CUACESFAC.CCONREC eq 1}"> checked</c:if>  value="${requestScope.OB_IAX_CUACESFAC.CCONREC}" disabled="disabled" /> 
                                                                <b><axis:alt f="axisrea020" c="CCONREC" lit="9904129"/></b>        
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    
                                                    <tr>
                                                        <axis:ocultar f="axisrea020" c="CINTRES" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_CINTRES"><axis:alt f="axisrea020" c="CINTRES" lit="9001927"/></b> <%-- Interés variable --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PINTRES" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b id="label_PINTRES"><axis:alt f="axisrea020" c="PINTRES" lit="9001928"/></b> <%-- % Interés variable --%>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PRESERV" dejarHueco="false"> 
                                                            <td class="titulocaja">
                                                                <b id="label_PRESERV"><axis:alt f="axisrea020" c="PRESERV" lit="9001926"/></b> <%-- % Reserva sobre la cesión --%>
                                                            </td>
                                                        </axis:ocultar> 
                                                        <!--INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida-->
                                                        <axis:ocultar f="axisrea020" c="PRESREA" dejarHueco="false"> 
                                                            <td class="titulocaja">
                                                            	<!-- INICIO INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
                                                                <b id="label_PRESREA"><axis:alt f="axisrexa020" c="PRESREA" lit="89908086"/></b> <%-- % Reserva sobre la cesión --%>
                                                                <!-- FINAL INFORCOL 14-05-2020 Reaseguro - Ajuste valores retencion local y retencion reasegurador -->
                                                            </td>
                                                        </axis:ocultar> 
                                                        <!-- FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida -->
                                                        <axis:ocultar f="axisrea020" c="CFRERES" dejarHueco="false"> 
                                                            <td class="titulocaja">
                                                                <b id="label_CFRERES"><axis:alt f="axisrea020" c="CFRERES" lit="9904130"/></b> <%-- Periodo liberación depósito --%>
                                                            </td>
                                                        </axis:ocultar> 
                                                        <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip 9904704 --%>
                                                        <axis:ocultar f="axisrea020" c="FGARDEP" dejarHueco="false">
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisrea020" c="FGARDEP" lit="9904704"/></b>  <%-- Fecha garántia pago --%>            
                                                            </td>
                                                        </axis:ocultar>
                                                    </tr>
                                                    <tr>
                                                        <axis:ocultar f="axisrea020" c="CINTRES" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25026 2013-01-02 AEG se agrego tooltip 100587 --%>
                                                                <select name="COMBOINTERES" id="COMBOINTERES"  size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                                     title="<axis:alt f="axisrea020" c="CINTRES_SECC" lit="9001927"/>">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="CINTRES_LIT" lit="9001927"/> - </option>
                                                                <c:forEach var="element" items="${requestScope.LST_INTERESREA}">
                                                                    <option value="${element.CINTRES}"
                                                                    <c:if test="${requestScope.OB_IAX_CUACESFAC.CINTRES == element.CINTRES}"> selected="selected"</c:if>>
                                                                        ${element.TINTRES}   
                                                                    </option>
                                                                </c:forEach>
                                                              </select>
                                                                <input type="text" class="campowidthinput campo campotexto" id="CINTRES" name="CINTRES" size="15" 
                                                                <axis:atr f="axisrea020" c="CINTRES" a="modificable=false"/>
                                                                value="${requestScope.OB_IAX_CUACESFAC.CINTRES}" style="width:10%"
                                                                title="<axis:alt f="axisrea020" c="CINTRES_LIT" lit="9001927"/>"/>
                                                                &nbsp;&nbsp;
                                                                <input type="text" class="campowidthinput campo campotexto" id="TINTERES" name="TINTERES" size="15" 
                                                                <axis:atr f="axisrea020" c="TINTERES" a="modificable=false"/>
                                                                value="${requestScope.DESCINTERES}" style="width:79%"
                                                                title="<axis:alt f="axisrea020" c="TINTERES_LIT" lit="9001927"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PINTRES" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="PINTRES" name="PINTRES" size="15" 
                                                                <axis:atr f="axisrea020" c="PINTRES" a="modificable=false&formato=decimal"/>
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.PINTRES}" pattern="###,##0.00"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="PINTRES_LIT" lit="9001928"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="PRESERV" dejarHueco="false">  
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="PRESERV" name="PRESERV" size="15" 
                                                                <axis:atr f="axisrea020" c="PRESERV" a="modificable=false&formato=decimal"/> onblur="if(objUtiles.estaVacio(this) || this.value==''){document.getElementById('CFRERES').options[0].selected=true;}else if(document.getElementById('CFRERES').options[0].selected){f_seleccionar_combo('Anual',document.getElementById('CFRERES'));}"
                                                                value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.PRESERV}" pattern="###,##0.00"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="PRESERV_LIT" lit="9001926"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <!-- INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida -->
                                                        <axis:ocultar f="axisrea020" c="PRESREA" dejarHueco="false">  
                                                            <td class="campocaja">
                                                                <input type="text" class="campowidthinput campo campotexto" id="PRESREA" name="PRESREA" size="15" 
                                                                <axis:atr f="axisrea020" c="PRESREA" a="modificable=false&formato=decimal"/> onblur="if(objUtiles.estaVacio(this) || this.value==''){document.getElementById('CFRERES').options[0].selected=true;}else if(document.getElementById('CFRERES').options[0].selected){f_seleccionar_combo('Anual',document.getElementById('CFRERES'));}"
                                                                	value="<fmt:formatNumber value="${requestScope.OB_IAX_CUACESFAC.PRESREA}" pattern="###,##0.00"/>"
                                                                style="width:90%" title="<axis:alt f="axisrea020" c="PRESERV_LIT" lit="9001926"/>"/>
                                                            </td>
                                                        </axis:ocultar>
                                                        <!-- FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida -->
                                                        <axis:ocultar f="axisrea020" c="CFRERES" dejarHueco="false">
                                                         <td class="campocaja">
                                                                <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip 9904130 --%>
                                                                <select name="CFRERES" id="CFRERES"  size="1" class="campowidthselect campo campotexto" style="width:100%;" 
                                                                        title="<axis:alt f="axisrea020" c="TIT_CFRERES" lit="9904130"/>" onChange="if(this.options[0].selected)document.getElementById('PRESERV').value=null;"
                                                                        <axis:atr f="axisrea020" c="CFRERES" a="modificable=false&isInputText=false"/>>&nbsp;
                                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisrea020" c="SELECC_CFRERES" lit="1000348"/> - </option>
                                                                        <c:forEach var="element" items="${requestScope.LST_PERLIBDEP}">
                                                                            <option value="${element.CATRIBU}"
                                                                            <c:if test="${requestScope.OB_IAX_CUACESFAC.CFRERES == element.CATRIBU}"> selected="selected"</c:if>>
                                                                                ${element.TATRIBU}   
                                                                            </option>
                                                                        </c:forEach>
                                                                 </select>                                             
                                                                                                              
                                                            </td>
                                                        </axis:ocultar>
                                                        <axis:ocultar f="axisrea020" c="FGARDEP" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip 9904704 --%>
                                                                <input type="text" class="campowidthinput campo campotexto" id="FGARDEP" name="FGARDEP" size="15" 
                                                                <axis:atr f="axisrea020" c="FGARDEP" a="modificable=false&formato=fecha"/>
                                                                value="<fmt:formatDate value="${requestScope.OB_IAX_CUACESFAC.FGARDEP}" pattern="dd/MM/yyyy"/>"
                                                                style="width:80%" title="<axis:alt f="axisrea020" c="TIT_FGARDEP" lit="9904704"/>"/>
                                                                <a style="vertical-align:middle;">
                                                                    <img id="icon_FGARDEP" alt="<axis:alt f="axisrea020" c="ALT_FGARDEP" lit="108341"/>" 
                                                                        title="<axis:alt f="axisrea020" c="TIT_CALENDARIO" lit="108341" />" 
                                                                        src="images/calendar.gif"/> </a>
                                                            </td>
                                                        </axis:ocultar>
                                                    	<!-- INICIO INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida  
                                                        <axis:ocultar f="axisrea020" c="CRESREA" dejarHueco="false">
                                                            <td class="campocaja">
                                                                <%-- BUG: 25026 2012-12-10 AEG se agrego tooltip 9904131 --%>
                                                                <input type= "checkbox" id="CRESREA" name="CRESREA" onclick="f_onclickCheckbox(this)" 
                                                                        <c:if test="${requestScope.OB_IAX_CUACESFAC.CRESREA eq 1}"> checked</c:if>  value="${requestScope.OB_IAX_CUACESFAC.CRESREA}" 
                                                                        disabled="disabled" title="<axis:alt f="axisrea020" c="TIT_CRESREA" lit="9904131"/>" /> 
                                                                <b><axis:alt f="axisrea020" c="CRESREA" lit="9904131"/></b>        
                                                            </td>
                                                        </axis:ocultar>
                                                        FIN INFORCOL 26-01-2020 Reaseguro facultativo - ajuste para deposito en prima retenida
                                                        -->
                                                    </tr> 
                                                    <%-- Si el cuadro no está completo --%>
                                                     
                                                        <tr>
                                                         <div class="separador">&nbsp;</div>            
                                                           <td align="right" colspan="4">         
                                                         <axis:visible f="axisrea020" c="BT_CANCELAR_ACCIO">                                                                                                                                    
                                                            <input id = "but_cancelar_accio" type="button" style="visibility:hidden" class="boton"  value="<axis:alt f="axisrea020" c="BT_CANC_TIT" lit="108211" />" onclick="javascript:f_carrega_de_nou();" />                                                                    
                                                         </axis:visible>     
                                                         </td>
                                                         <td align="right" colspan="4">                                                                                             
                                                                <axis:visible f="axisrea020" c="BT_ACEPTAR_NUEVA_COMPANIA">                                                                
                                                                    <div id="but_aceptar_nueva_c" style ="display:none" >
                                                                        <input type="button" class="boton"  value="<axis:alt f="axisrea020" c="BT_NCOMP_TIT" lit="100009" />" onclick="javascript:f_guarda_nueva_c();" />
                                                                    </div>
                                                                </axis:visible>
                                                                 <axis:visible f="axisrea020" c="BT_MODIFICAR_COMPANIA">
                                                                     <div id="but_modif_c" style ="display:none">
                                                                        <input type="button" class="boton"  value="<axis:alt f="axisrea020" c="BT_MODIF_TIT" lit="9000552" />" onclick="f_guarda_nueva_c();" />
                                                                     </div>
                                                                </axis:visible>
                                                                <div class="separador">&nbsp;</div>
                                                            </td>
                                                        </tr>    
                                                           <c:if test="${!empty requestScope.OB_IAX_CUACESFAC}">
                                                            <script type="text/javascript">
                                                                document.getElementById("cuadreDades").style.visibility = "hidden"; 
                                                            </script>
                                                    
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </c:if>
                        
                    </table>
                </td>
            </tr>
        </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea020</c:param><c:param name="f">axisrea020</c:param>
            <c:param name="__botones">salir</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
    
     <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FFINCUF",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINCUF", 
            singleClick    :    true,
            firstDay       :    1
        });      
     </script>
     
     <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FGARDEP",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FGARDEP", 
            singleClick    :    true,
            firstDay       :    1
        });      
     </script>
   
     <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FGARPRI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FGARPRI", 
            singleClick    :    true,
            firstDay       :    1
        });      
     </script>
</body>
</html>
