<%/* Revision:# oXETRksp8SWfoSF5ju/SUg== # */%>
<%-- 
Fichero: axisper009.jsp 
Fecha: 23/07/2008 
 --%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes"%>
<%@ page import="java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!-- BUG CONF-186 - 22/08/2016 - HRE -->
<c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="axisper009" c="TITULO_DET" lit="9909290" /></c:param>
    <c:param name="nid" value="axisper044" />
</c:import>
<!-- BUG CONF-186 - 22/08/2016 - HRE -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"></link>
    <c:import url="../include/carga_framework_js.jsp"/>
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        if (document.referrer.indexOf("main.do")>0) { objSeccion.seccionPorAbrirCookieBorrar("axisper009");}
        if (document.referrer.indexOf("main.do")>0) { objSeccion.posicionPorColorcarCookieBorrar("axisper009");}
        
       	f_cargar_propiedades_pantalla();
       	
         <% if (request.getAttribute("__formdata") != null &&
               (java.util.Map) request.getAttribute("dades_persona") == null)
                {  %>
               var CAGENTE_INI = "${__formdata.CAGENTE_INI}";
                  if (objUtiles.estaVacio(CAGENTE_INI)) {
                       f_abrir_axisper008();
                   }else{
                     objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+true+"&CAGENTE_INI="+CAGENTE_INI);
                   }
         <% }  %>   
        
        <% if ( (request.getAttribute("dades_persona") != null && request.getAttribute("subpantalla") == null) || request.getAttribute("VUELTA_SIN")!=null) { %>
        //alert("Entro");
                    objEstilos.toggleDisplay("datosgenerales", document.getElementById("datosgenerales_parent"));
                    if(document.miForm.datospoltom_parent){
                          objEstilos.toggleDisplay("datospoltom", document.getElementById("datospoltom_parent"));
                    }
        <% } %>
        
            <% 

            if (request.getAttribute("subpantalla") != null && !"null".equals(request.getAttribute("subpantalla")) && !"".equals(request.getAttribute("subpantalla"))) { 
            %> 
                var subpantalla = '<%=request.getAttribute("subpantalla")%>';  
                objEstilos.toggleDisplay(subpantalla, document.getElementById(subpantalla+"_parent"));  
              <%}%>
             revisarEstilos();
             objSeccion.abrirSeccionesPorAbrir("axisper009");
             objSeccion.colocarPosicionPorColocar("axisper009");
             if ("${__formdata.RETORNO}" == "0"){  //IAXIS-3670 16/04/2019 AP
            	 f_but_salir();
             }
            
        }
       
        function f_but_salir() {
        	if (objValidador.validaEntrada()) {   //IAXIS-3670 16/04/2019 AP
				objUtiles.ejecutarFormulario ("axis_axisper009.do", "validar_Consorcio", document.miForm, "_self", objJsMessages.jslit_cargando); 
			 }
        	if ("${__formdata.RETORNO}" == "0"){        		
            objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisper009", "cancelar", document.miForm, "_self"); //IAXIS-4832 29/07/2019 JVG
            }
        }   
	

		function f_but_aceptar() {
		//INI RAL BUG 0036118: [axisper010] Datos Persona (AARANGUIZ) (bug hermano interno)
            //objUtiles.ejecutarFormulario("axis_axiscaj002.do?operation=form","",document.miForm, "_self", objJsMessages.jslit_buscando_personas);
		//FIN RAL BUG 0036118: [axisper010] Datos Persona (AARANGUIZ) (bug hermano interno)
		     f_but_salir();
        }
		
         /****************************************************************************************/
        /************************************** AXISPER008****************************************/
        /****************************************************************************************/        
        function f_cerrar_axisper008(){
            objUtiles.cerrarModal("axisper008");
            if(objUtiles.estaVacio(document.miForm.SPERSON.value)){
                f_but_salir();
                }     
        }     
        function f_abrir_axisper008() {
            objUtiles.abrirModal("axisper008","src","modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008&CMODO=CONSULTA");
        }
        function f_aceptar_mtn_axisper008 (selectedPerson,selectedAgente){
        //    objDom.setValorPorId ("CAGENTE", selectedAgente);
            objUtiles.cerrarModal("axisper008");
            document.miForm.CAGENTE.value = selectedAgente;
            objUtiles.ejecutarFormulario("axis_axisper009.do?faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
		
        /****************************************************************************************/
       /************************************** AXISPER009****************************************/
       /****************************************************************************************/
        /**jgonzalez*/
        /* viene de la pantalla de axispero009 para la impresion de persona
        */
        function f_but_pers() {
            //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=impresion_personas&SPERSON="+document.miForm.SPERSON.value+"&TIPO=PERSONA");
            objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_personas&SPERSON="+document.miForm.SPERSON.value+"&TIPO=PERSONA");
        }
        
        function f_but_FCC(ultima_version, tipo_persona, ssarlaft) {
            if(ultima_version != ssarlaft)
				alert("El FCC que desea imprimir NO es la ultima version");	
            
            if(tipo_persona == "Natural")
            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?&operation=impresion_personas&SPERSON="+ssarlaft+"&TIPO=FCCNATURAL");
            else
            	objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?&operation=impresion_personas&SPERSON="+ssarlaft+"&TIPO=FCCJURIDICA");
        }
        
        function f_cerrar_axisimprimir() {
            objUtiles.cerrarModal("axisimprimir");            
        }
        
        
         /****************************************************************************************/
        /************************************** AXISPER010****************************************/
        /****************************************************************************************/        
       function f_aceptar_axisper018(){
            f_cerrar_axisper018(null);
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        
      }
         
       function f_aceptar2_axisper018(nano){
           f_cerrar_axisper018();           
       
     }
         
         function f_aceptar_axisper010(selectedPerson,selectedagent){
										  
			 
										
	
            f_cerrar_axisper010(null);
										  
												  
			 
																				 
																																																														  
			
			 
				
			  
										
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
										  
        }
        function f_abrir_axisper010NOU(isNew){
            objUtiles.cerrarModal("axisper008");
             objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
            objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
        }   
        function f_cerrar_axisper010(isNew) {
            objUtiles.cerrarModal("axisper010");
            selectedPerson = '${dades_persona.SPERSON}';
            
            //alert(isNew);
        if (!objUtiles.estaVacio(isNew)) {
            if (isNew)
                f_abrir_axisper008();     
        }else
        objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+document.miForm.CAGENTE.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            
            
        } 
        function f_abrir_axiper010(selectedSperson,SFINANCI){
             objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
             objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&SPERSON="+selectedSperson+"&CAGENTEselected="+document.miForm.CAGENTE.value+"&SFINANCI="+SFINANCI);
        }        
      
         /****************************************************************************************/
        /************************************** AXISPER011****************************************/
        /****************************************************************************************/  
        function f_aceptar_axisper011(selectedPerson){
            f_cerrar_axisper011();
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_abrir_axisper011(CMODCON,CPREFIX,selectedPerson, CTABLAS) {

            objUtiles.abrirModal("axisper011", "src", "modal_axisper011.do?operation=form&SPERSON="+selectedPerson+"&CMODCON=" + CMODCON+ "&CPREFIX=" + CPREFIX+"&CAGENTE="+document.miForm.CAGENTE.value + "&CTABLAS=" + CTABLAS);            
        }
        function f_abrir_axisper011_n(selectedPerson, CTABLAS) {

            objUtiles.abrirModal("axisper011", "src", "modal_axisper011.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value + "&CTABLAS=" + CTABLAS);            
        } 		
        function f_borrar_CONTACTO(CMODCON,selectedPerson) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CMODCON=" + CMODCON, "eliminarCONTACTO", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }      
        
        function f_cerrar_axisper011(){
          objUtiles.cerrarModal("axisper011");
        }
        /****************************************************************************************/
        /************************************** AXISPER012****************************************/
        /****************************************************************************************/         
        function f_aceptar_axisper012(selectedPerson){
            f_cerrar_axisper012();
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_abrir_axisper012(CDOMICI,selectedPerson) {
	    // INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
            objUtiles.abrirModal("axisper012", "src", "modal_axisper012.do?operation=form&SPERSON="+selectedPerson+"&CDOMICI=" + CDOMICI+"&CAGENTE="+document.miForm.CAGENTE.value);            
	    // FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
        }     
        function f_borrar_DIRECCION(CDOMICI,selectedPerson) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CDOMICI=" + CDOMICI, "eliminarDireccion", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }     

        function f_cerrar_axisper012(){
             objUtiles.cerrarModal("axisper012");
        }
          
         /****************************************************************************************/
        /************************************** AXISPER013****************************************/
        /****************************************************************************************/           
        function f_abrir_axisper013(CPAIS,selectedPerson){
            objUtiles.abrirModal("axisper013", "src", "modal_axisper013.do?operation=form&SPERSON="+selectedPerson+"&CPAIS=" + CPAIS+"&CAGENTE="+document.miForm.CAGENTE.value);           
        }
        function f_aceptar_axisper013(selectedPerson){
            f_cerrar_axisper013();
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_borrar_NACIONALIDAD(CPAIS,selectedPerson) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CPAIS=" + CPAIS, "eliminarNACIONALIDAD", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        function f_cerrar_axisper013(){
        objUtiles.cerrarModal("axisper013");
        }
         /****************************************************************************************/
        /************************************** AXISPER014****************************************/
        /****************************************************************************************/    
            
        function f_abrir_axisper014(CNORDBAN,selectedPerson,TIPCCC,MODO) {
            objUtiles.abrirModal("axisper014", "src", "modal_axisper014.do?operation=form&SPERSON="+selectedPerson+"&CNORDBAN=" + CNORDBAN+"&CAGENTE="+document.miForm.CAGENTE.value+"&TIPCCC="+TIPCCC+"&MODO="+MODO);            
        }
        
        
        function f_aceptar_axisper014(selectedPerson){
            f_cerrar_axisper014();
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cerrar_axisper014(){
            objUtiles.cerrarModal("axisper014");
        }
        function f_borrar_CCC(CNORDBAN,selectedPerson,CPAGSIN) {
        if(CPAGSIN == 1)
            alert('<axis:alt f='axisper009' c='MENBORRARCCC' lit='9903170'/>');
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
          objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CNORDBAN=" + CNORDBAN, "eliminarCCC", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        
         /****************************************************************************************/
        /************************************** AXISPER015****************************************/
        /****************************************************************************************/    
        function f_abrir_axisper015(CTIPIDE,selectedPerson,CTIPPER,MODO) {
            objUtiles.abrirModal("axisper015", "src", "modal_axisper015.do?operation=form&SPERSON="+selectedPerson+"&CTIPIDE=" + CTIPIDE+"&CAGENTE="+document.miForm.CAGENTE.value+"&CTIPPER="+CTIPPER+"&MODO="+MODO);            
        }
        function f_aceptar_axisper015(selectedPerson){
            f_cerrar_axisper015();
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cerrar_axisper015(){
            objUtiles.cerrarModal("axisper015");
        }
        function f_borrar_IDENTIFICADOR(CTIPIDE,selectedPerson) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
          objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CTIPIDE=" + CTIPIDE, "eliminarIDENTIFICADOR", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }    
         /****************************************************************************************/
        /************************************** axisper017****************************************/
        /****************************************************************************************/        
        function f_aceptar_axisper017(selectedPerson,selectedagent,canvipersona){
            objUtiles.cerrarModal("axisper017");
            if (canvipersona == 1)       {   
              objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
              objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+selectedagent);
            }else{
              objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
        function f_abrir_axisper017NOU(isNew){
            objUtiles.cerrarModal("axisper008");
            objUtiles.abrirModal("axisper017","src","modal_axisper017.do?operation=form&isNew="+isNew);
        }   
        function f_cerrar_axisper017(isNew) {
            objUtiles.cerrarModal("axisper017");
            selectedPerson = '${dades_persona.SPERSON}';
            //alert(isNew);
        if (!objUtiles.estaVacio(isNew)) {
            if (isNew)
                f_abrir_axisper008();  
        }else
        objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson+"&CAGENTEselected="+document.miForm.CAGENTE.value, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        } 
        
        function f_abrir_axiper017(selectedSperson){
        <% request.getSession().removeAttribute("CTIPPER");%>
             objDom.setVisibilidadPorId('but_cerrar_modal_axisper017', 'hidden');
             objUtiles.abrirModal("axisper017","src","modal_axisper017.do?operation=form&SPERSON="+selectedSperson+"&CAGENTEselected="+document.miForm.CAGENTE.value);
        }                
          /****************************************************************************************/
        /************************************** AXISPER018****************************************/
        /****************************************************************************************/          

         function actualitza_any (NANO) {
               objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&NANO_CHANGE="+NANO, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
         }       
        
        function f_abrir_axiper018(selectedSperson,cagente, nano){
            <%-- objDom.setVisibilidadPorId('but_cerrar_modal_axisper018', 'hidden');--%>
             objUtiles.abrirModal("axisper018","src","modal_axisper018.do?operation=init&SPERSONselected="+selectedSperson+"&CAGENTEselected="+document.miForm.CAGENTE.value+"&NANOselected="+nano);
        }   
       function f_aceptar_axisper018(){
            f_cerrar_axisper018(null);
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
      }        
      
      function f_cerrar_axisper018(){
      objUtiles.cerrarModal("axisper018");
      }

        function f_borrar_IRPF(selectedPerson) {
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
        if (answer)
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson, "eliminarIRPF", document.miForm, "_self", objJsMessages.jslit_cargando);   
        } 
        
        /****************************************************************************************/
        /************************************** AXISPER023****************************************/
        /****************************************************************************************/    
        function f_abrir_axisper023(selectedPerson,selectedAgente) {
            objUtiles.abrirModal("axisper023", "src", "modal_axisper023.do?operation=init&AXISMPRXXX=axisper023&SPERSON="+selectedPerson+"&CAGENTE="+selectedAgente);            
        }
        function f_aceptar_axisper023(selectedPerson,selectedAgente){
            objUtiles.cerrarModal("axisper023");
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_cancelar_axisper023", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cancelar_axisper023(){
            objUtiles.cerrarModal("axisper023");
        }
        function f_borrar_PARPERSONA(selectedPerson,selectedAgente,selectedCparam) {
       
        var answer = confirm(objJsMessages.jslit_confirma_borrar);
            if (answer){
              document.miForm.CAGENTE.value = selectedAgente;
              document.miForm.SPERSON.value = selectedPerson;
              objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&CPARAM="+ selectedCparam, "eliminarPARPER", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }   
        
        /****************************************************************************************/
        /************************************** AXISPER025****************************************/
        /****************************************************************************************/    
              function f_abrir_axisper025(selectedPerson , fecha_agrupac) {
                objUtiles.abrirModal("axisper025", "src", "modal_axisper025.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value+"&CTIPPER="+document.miForm.CTIPPER.value+"&FECHA_AGRUPAC="+fecha_agrupac);            

             }
            function f_aceptar_axisper025(selectedPerson){
                f_cerrar_axisper025();
                objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_cerrar_axisper025(){
            
                objUtiles.cerrarModal("axisper025");
            }
          
            function f_borrar_persona_rel(SPERSON_REL,selectedPerson,selectedAgente,CAGRUPA) {  // IAXIS-3670 16/04/2019 AP
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)         
                  objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSONSelected="+selectedPerson+"&SPERSON_REL=" + SPERSON_REL+"&CAGENTEselected="+selectedAgente+"&CAGRUPA="+CAGRUPA, "eliminarPERREL", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
            
        /****************************************************************************************/
        /************************************** AXISPER026****************************************/
        /****************************************************************************************/    
            function f_abrir_axisper026(selectedPerson,selectedCTIPPER) {

                objUtiles.abrirModal("axisper026", "src", "modal_axisper026.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value+"&selectedCTIPPER="+selectedCTIPPER);            
             }
            function f_aceptar_axisper026(selectedPerson){
                f_cerrar_axisper026();
                objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_cerrar_axisper026(){
                objUtiles.cerrarModal("axisper026");
            }
          
            function f_borrar_regfisc(selectedFEFECTO,selectedPerson,selectedAgente) {
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
                if (answer)       
                  objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSONSelected="+selectedPerson+"&FEFECTOSelected=" + selectedFEFECTO+"&CAGENTEselected="+selectedAgente, "eliminarREGFISC", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
        /****************************************************************************************/
        /************************************ AXISPER027 SARLAFT ********************************/
        /****************************************************************************************/    
            function f_abrir_axisper027(selectedPerson,selectedCTIPPER) {
                objUtiles.abrirModal("axisper027", "src", "modal_axisper027.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value+"&selectedCTIPPER="+selectedCTIPPER);            
             }
            function f_aceptar_axisper027(selectedPerson){
                f_cerrar_axisper027();
                objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            function f_cerrar_axisper027(){
                //alert("Antes de cerrar");
                objUtiles.cerrarModal("axisper027");
            }
          
            function f_borrar_sarlaft(FEFECTO_SARLAFT,SPERSON_SARLAFT,CAGENTE_SARLAFT) {
                var answer = confirm(objJsMessages.jslit_confirma_borrar);
               
                if (answer)       
                  objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON_SARLAFT="+SPERSON_SARLAFT+"&FEFECTO_SARLAFT=" + FEFECTO_SARLAFT+"&CAGENTE_SARLAFT="+CAGENTE_SARLAFT, "eliminarSARLAFT", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
            
            
         function f_abrir_axisper031(selectedPerson) {
                objUtiles.abrirModal("axisper031", "src", "modal_axisper031.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value);            
         }
		 
		 /****************************************************************************************/
         /************************************** AXISFIC001****************************************/
         /****************************************************************************************/         
         function f_aceptar_axisfic001(selectedPerson){
             f_cerrar_axisfic001();
             objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         function f_abrir_axisfic001(selectedFinanci,selectedPerson, selectedCMODO, selectedCTIPPER) {
        	 // INI IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
             objUtiles.abrirModal("axisfic001", "src", "modal_axisfic001.do?operation=form&SPERSON="+selectedPerson+"&SFINANCI="+selectedFinanci+"&CMODO="+selectedCMODO+"&CAGENTE="+document.miForm.CAGENTE.value+"&CTIPPER="+selectedCTIPPER);
             // FIN IAXIS-4143 -JLTS - 22/01/2020 - Se adiciona CTIPPER
         }     
         function f_borrar_DIRECCION(CDOMICI,selectedPerson) {
         var answer = confirm(objJsMessages.jslit_confirma_borrar);
         if (answer)
             objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+selectedPerson+"&CDOMICI=" + CDOMICI, "eliminarDireccion", document.miForm, "_self", objJsMessages.jslit_cargando);   
         }     
 
         function f_cerrar_axisfic001(){
              objUtiles.cerrarModal("axisfic001");
         }
         
         function f_imprimir_fictec(TTIPO){
           //  var NRECIBO = objDom.getValorPorId("NRECIBO");
           //  var SSEGURO = objDom.getValorPorId("SSEGURO");
           //  objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<
           //  %=new java.util.Date().getTime()%>&operation=impresion_recibo&CSSEGURO="+SSEGURO+"&CNRECIBO="+NRECIBO+"&CTIPO="+TTIPO);
         }
         
         /****************************************************************************************/
         /************************************** AXISREA052 **************************************/
         /****************************************************************************************/        
         function f_abrir_axisrea052(CMODO){
        	   SPERSON = '${dades_persona.SPERSON}';
        	   NNUMIDE = '${dades_persona.NNUMIDE}';
        	   CAGENTE = '${__formdata.CAGENTE}';
        	   NOMBRE = '${dades_persona.TNOMBRECOMPL}';
               objUtiles.abrirModal("axisrea052","src","axis_axisrea052.do?operation=form"+"&CMODO="+CMODO+"&SPERSON="+SPERSON+"&NNUMIDE="+NNUMIDE+"&CAGENTE="+CAGENTE+"&NOMBRE="+NOMBRE);
         }
         
         function f_cerrar_axisrea052(){
             objUtiles.cerrarModal("axisrea052");
         }   
                 /*INI--WAJ
         /****************************************************************************************/
         /************************************** AXISPRF016****************************************/
         /****************************************************************************************/    
             function f_abrir_axisper053(selectedPerson,selectedCTIPPER) {

                 objUtiles.abrirModal("axisprf016", "src", "modal_axisprf016.do?operation=form&SPERSON="+selectedPerson+'&MODO=alta');            
                 //objUtiles.abrirModal("axisper026", "src", "modal_axisper026.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value+"&selectedCTIPPER="+selectedCTIPPER);     
         }
         
             function f_borrar_fila(selectedPerson, selectedCtipind) {
                 var answer = confirm(objJsMessages.jslit_confirma_borrar);
                 if (answer)       
                   objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSONSelected="+selectedPerson+"&CTIPINDSelected="+selectedCtipind, "eliminarIMPUESTO", document.miForm, "_self", objJsMessages.jslit_cargando);   
             }
             
            function f_aceptar_impuestos(pantalla, SPERSON){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axisper009.do?SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            /*FIN--WAJ

        /****************************************************************************************/
        /************************************** VARIS****************************************/
        /****************************************************************************************/           
         function f_consultar_per_rel (selectedPerson,selectedAgente){
            document.miForm.CAGENTE.value = selectedAgente;
            SPERSON = "${dades_persona.SPERSON}";
            objUtiles.ejecutarFormulario("axis_axisper009.do?SPERSON_AUX="+selectedPerson+"&SPERSON="+SPERSON, "consultarPerRel", document.miForm, "_self", objJsMessages.jslit_cargando);
        }     
        
         function f_but_polissa(SSEGURO) {
         SPERSON = "${dades_persona.SPERSON}";
         objUtiles.ejecutarFormulario("axis_axisper009.do?SSEGURO="+SSEGURO+"&SPERSON="+SPERSON, "consultarPolissa", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         

        function f_cons_agente(CAGENTE) {
            objDom.setValorPorId("CAGENTE", CAGENTE);
            objUtiles.ejecutarFormulario("axis_axisage007.do?CAGENTE="+CAGENTE, "form", document.miForm, "_self", objJsMessages.jslit_cargando);                        
         }
         
         function f_but_siniestro(NSINIES,SSEGURO) {
            objUtiles.ejecutarFormulario("axis_axisper009.do?NSINIES="+NSINIES+"&SSEGURO="+SSEGURO, "navegarSiniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         function f_but_recibo(NRECIBO) {
         SPERSON = "${dades_persona.SPERSON}";
         objUtiles.ejecutarFormulario("axis_axisper009.do?NRECIBO="+NRECIBO+"&SPERSON="+SPERSON, "consultarRebut", document.miForm, "_self", objJsMessages.jslit_cargando);
         }
         
         
        
         function seleccionarLista (SPERSON,CAGENTEmarcat) {
            if (objUtiles.estaVacio(SPERSON))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                AGENT = "${dades_persona.CAGENTE}";

                if (objUtiles.estaVacio(AGENT) || AGENT != CAGENTEmarcat){
                document.miForm.SPERSON.value = SPERSON;
                document.miForm.CAGENTE.value = CAGENTEmarcat;
               objUtiles.ejecutarFormulario("axis_axisper009.do?canviagent=0", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
               }
            }
         }
         
         
          /****************************************************************************************/
        /************************************** DOCUMENTACION *******************************************/
        /****************************************************************************************/
        
        function f_but_1000615() { // Añadir documentación
            f_abrir_modal("axisper030", true, "&SPERSON=${dades_persona.SPERSON}&CAGENTE=${dades_persona.CAGENTE}");
        }
        
        function f_modifdocum(SPERSON,IDDOCGEDOX){
            f_abrir_modal("axisper030", true, "&SPERSON="+SPERSON+"&CAGENTE=${__formdata.CAGENTE}&IDDOCGEDOX="+IDDOCGEDOX);
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        
        function f_but_9910012() { // Nuevo calculo de riesgo
        	SPERSON = "${dades_persona.SPERSON}";        	
        	f_abrir_modal("axisper050", true, "&SPERSON="+SPERSON);
        }
        function f_aceptar_axisper050(selectedPerson){
        	f_aceptar_axisper030();
           // objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        function f_cerrar_axisper050(){
            //alert("Antes de cerrar");
            objUtiles.cerrarModal("axisper050");
        }                        
      
        function f_cerrar_modal(cual) {
        	// CONF-347-20161101-RCS - Ini
        	if(cual == "axisagd002"){
            objUtiles.cerrarModal(cual);
        		objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        	}else{
            	objUtiles.cerrarModal(cual);
        	}
		// CONF-347-20161101-RCS - Fin
        }
        
        function f_aceptar_axisper030(){
            objUtiles.cerrarModal("axisper030");
            SPERSON = "${dades_persona.SPERSON}";
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_bloquear_persona_LOPD(){
            SPERSON = "${dades_persona.SPERSON}";
            CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales", "bloquearPersonaLOPD", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_desbloquear_persona_LOPD(){
            SPERSON = "${dades_persona.SPERSON}";
            CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales", "desbloquearPersonaLOPD", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_borrar_persona_LOPD(){
            SPERSON = "${dades_persona.SPERSON}";
            CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=datosgenerales", "borrarPersonaLOPD", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        function f_abrir_axisper031(selectedPerson) {
                objUtiles.abrirModal("axisper031", "src", "modal_axisper031.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value);            
         }
         
         
        function f_aceptar_axisper031(){
            objUtiles.cerrarModal("axisper031");
            SPERSON = "${dades_persona.SPERSON}";
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        
        
         function mostrar(nombreCapa){ 
         if (document.getElementById(nombreCapa).style.visibility == "visible")
              document.getElementById(nombreCapa).style.visibility="hidden"; 
              else             
              document.getElementById(nombreCapa).style.visibility="visible"; 
            } 
            
            function ocultar(nombreCapa){             
             document.getElementById(nombreCapa).style.visibility="hidden"; 
            } 
         
         function f_aceptar_axisper028(SPERSON){
            f_cerrar_axisper028();
            
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        function f_abrir_axisper028(selectedPerson,cdomici,norden,modo) {

            objUtiles.abrirModal("axisper028", "src", "modal_axisper028.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value+"&CDOMICI="+cdomici+"&NORDEN="+norden+"&MODO="+modo);            
        }   
        
        function f_cerrar_axisper028(){
            objUtiles.cerrarModal("axisper028");
        }
        
        function f_aceptar_axisper029(SPERSON){
            f_cerrar_axisper029();
            
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando); 
        }
        function f_abrir_axisper029(selectedPerson,cmodcon,norden,modo) {

            objUtiles.abrirModal("axisper029", "src", "modal_axisper029.do?operation=form&SPERSON="+selectedPerson+"&CAGENTE="+document.miForm.CAGENTE.value+"&CMODCON="+cmodcon+"&NORDEN="+norden+"&MODO="+modo);            
        }   
        
        function f_cerrar_axisper029(){
            objUtiles.cerrarModal("axisper029");
        }        
        function f_seleccionar_profesional (SPROFES) {
            if (objUtiles.estaVacio(SPROFES))
                alert (objJsMessages.jslit_error_de_seleccion);
            else{
                objDom.setValorPorId ("SPROFES", SPROFES);
                objUtiles.ejecutarFormulario("axis_axisprf001.do?pCodiProf="+SPROFES,"form",document.miForm, "_self", objJsMessages.jslit_buscando_personas);
            }
        } 
        // CONF-347-20161101-RCS - Ini
        function f_but_nueva_agenda(){
        	document.miForm.IDAPUNTE.value = '';
            document.miForm.IDAGENDA.value = '';
            document.miForm.NUEVO.value = 1;
            optionalQueryString = "&NUEVO=1&IDAPUNTE=&IDAGENDA=";
             f_abrir_modal_axisagd004("axisagd004", optionalQueryString);
             
        }
        function f_abrir_modal_axisagd004(cual, optionalQueryString) {
        	var CMODO = "ALTA_CONS";
        	var SPERSON = "${dades_persona.SPERSON}";
            if (objUtiles.estaVacio(optionalQueryString)){   
            
                optionalQueryString = "&IDAPUNTE="+document.miForm.IDAPU.value+"&IDAGENDA="+document.miForm.IDAGD.value;
			}  
        	    
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString + "&CCLAGD=4&TCLAGD_OUT=" + SPERSON+"&CMODO="+CMODO+"&IDTCLAGD="+99);
            
        }
        function f_cerrar_modal_004(){
            f_cargar_propiedades_pantalla();
            objUtiles.cerrarModal("axisagd004");
            objUtiles.ejecutarFormulario ("axis_axisper009.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
           }
        function f_seleccionar(IDAPUNTE,IDAGENDA){
        	
            f_marcar(IDAPUNTE,IDAGENDA);
            f_abrir_modal_axisagd004_editar("axisagd004");
              //parent.f_modcons_age(IDAPUNTE,IDAGENDA);
       }

	   function f_seleccionar_consulta(IDAPUNTE,IDAGENDA){
        	
            f_marcar(IDAPUNTE,IDAGENDA);
            f_abrir_modal_axisagd004_consulta("axisagd004");
              //parent.f_modcons_age(IDAPUNTE,IDAGENDA);
       }
       
        function f_marcar(IDAPUNTE,IDAGENDA){
            
            document.miForm.IDAPU.value = IDAPUNTE;
            document.miForm.IDAGD.value = IDAGENDA;
               
        }
              
        function f_abrir_modal_axisagd004_editar(cual, optionalQueryString) {
        	
            if (objUtiles.estaVacio(optionalQueryString)){   
            
                optionalQueryString = "&IDAPUNTE="+document.miForm.IDAPU.value+"&IDAGENDA="+document.miForm.IDAGD.value+'&CMODO=EDITA_DATOS_PERSONA';
            }  
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);
            
        }
        
		function f_abrir_modal_axisagd004_consulta(cual, optionalQueryString) {
        	
            if (objUtiles.estaVacio(optionalQueryString)){   
            
                optionalQueryString = "&IDAPUNTE="+document.miForm.IDAPU.value+"&IDAGENDA="+document.miForm.IDAGD.value+'&CMODO=CONSULTA_PERSONA';
            }  
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);
            
        }
       function f_seleccionar_consulta(IDAPUNTE,IDAGENDA){
        	
            f_marcar(IDAPUNTE,IDAGENDA);
            f_abrir_modal_axisagd004_consultar("axisagd004");
              //parent.f_modcons_age(IDAPUNTE,IDAGENDA);
       }
       
       function f_abrir_modal_axisagd004_consultar(cual, optionalQueryString) {
       	
           if (objUtiles.estaVacio(optionalQueryString)){   
           
               optionalQueryString = "&IDAPUNTE="+document.miForm.IDAPU.value+"&IDAGENDA="+document.miForm.IDAGD.value+'&CMODO=CONSULTA';
           }  
           objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);
           
       }
       
       function f_abrir_modal_agenda_apunte(cual,noXButton, optionalQueryString) {
           if (objUtiles.estaVacio(optionalQueryString)){               
               optionalQueryString = "";
             
           }    
           
           var SPERSON = "${dades_persona.SPERSON}";
           
           objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init&CTIPAGD=6&SPERSON="+SPERSON+"&MODIFICACION="+optionalQueryString);   
       }
       
       function f_gestioagenda_apunte(IDOBS,CTIPAGD, modificacion){
    	   var SPERSON = "${dades_persona.SPERSON}"; 
           objUtiles.abrirModal("axisagd002", "src", "modal_axisagd002.do?operation=init&IDOBS="+IDOBS+"&SPERSON="+SPERSON+"&MODIFICACION="+modificacion+"&CTIPAGD="+6);
       }
  
       function f_gestioagenda_apuntes(){
    	   var SPERSON = "${dades_persona.SPERSON}";  
           $("#operation").val("init");    
		   $("#CTIPAGD").val("6");	           
           objUtiles.abrirModal("axisagd002", "src", "modal_axisagd002.do?operation=form&"+$("#miForm").serialize()+"&CTIPAGD="+6+"&TENTIDAD="+SPERSON);
           
       }  
       
       function f_borrar_agenda(IDOBS){
           // Antes de proceder a borrar el registro, pedimos confirmacion
           var confirma=confirm(objJsMessages.jslit_confirma_borrar);
           if (confirma) {
                  objDom.setValorPorId("IDOBS", IDOBS);
                  objUtiles.ejecutarFormulario ("axis_axisper009.do", "borrar_agenda", document.miForm, "_self", objJsMessages.jslit_cargando);     
           }
       }
       
       function f_agd_gestioagenda(IDAPUNTE,IDAGENDA,CMODO) {       
           param = "&IDAPUNTE="+IDAPUNTE+"&IDAGENDA="+IDAGENDA+"&CMODO="+CMODO;                            
           objUtiles.abrirModal('axisagd004', "src", "modal_axisagd004.do?operation=init" + param); 
       }
       // CONF-347-20161101-RCS - Fin
       
       
        function f_consultar_contragarantia(SCONTGAR,SPERSON,NMOVIMI){
        	objUtiles.ejecutarFormulario("axis_axiscga002.do?SCONTGAR=" + SCONTGAR+ "&SPERSON=" + SPERSON+"&CMODOPAN=CONSULTA"+"&NMOVIMI="+NMOVIMI+"&CONTRA_DET_POLIZA=1", "detalle_consulta", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        /****************************************************************************************/
        /************************************** MARCAS*******************************************/
        /****************************************************************************************/    
        function f_abrir_axisper044(selectedPerson) {            
            objUtiles.abrirModal("axisper044", "src", "modal_axisper044.do?operation=init&AXISMPRXXX=axisper044&SPERSON="+selectedPerson);                    
        }
        function f_aceptar_axisper044(selectedPerson,selectedAgente,ok,mensaje){ //IAXIS-4832(6) 04/09/2019           
            //objUtiles.cerrarModal("axisper044"); //IAXIS-4832(6) 04/09/2019
            SPERSON = "${dades_persona.SPERSON}";
            //objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_cancelar_axisper044", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            // Inicio IAXIS-4832(6) 04/09/2019
            // Se quita la siguiente línea de código al estar presente en la función del botón aceptar de la pantalla axisper044
            //objUtiles.ejecutarFormulario("modal_axisper044.do", "grabarMarcas", document.miForm, "_self", objJsMessages.jslit_cargando);    
            
            if (ok == 1) {
            	if (confirm("<axis:alt f="axisctr044" c="ALER_ERR" lit="101625"/>")){
            		objUtiles.cerrarModal("axisper044");
            		objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&SPERSON="+SPERSON, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                 }
            }else{
            	alert(mensaje);
            }
            //Fin IAXIS-4832(6) 04/09/2019
             
        
        }
        function f_cancelar_axisper044(){
            objUtiles.cerrarModal("axisper044");
        }    
		        /****************************************************************************************/
        /************************************** AXISPER047 **************************************/
        /****************************************************************************************/ 
        function f_abrir_axisper047(PSPERSON,PCAGENTE,PSSARLAFT,FRADICA,ACTION) {
	   		objUtiles.abrirModal("axisper047", "src", "axis_axisper047.do?operation=form&SPERSON="+PSPERSON+"&CAGENTE=" + PCAGENTE+"&SSARLAFT="+PSSARLAFT+"&FRADICA="+FRADICA+"&ACTIONMOD="+ACTION);
	   		window.scrollTo(0, 0);	   		
	   	}
	   
        function borrar_sarlaft(SPERSON,SSARLAFT) {
		   
        	var answer = confirm(objJsMessages.jslit_confirma_borrar);
            
            if (answer)  
        	objAjax.invokeAsyncCGI("axis_axisper009.do",
					callBackResponse,
					"operation=borrar_sarlaft&SPERSON="+SPERSON+"&SSARLAFT="+SSARLAFT+"&DETSARLAFT=0",
					this, objJsMessages.jslit_actualizando_registro);	
		   
		}
	    function f_but_cerrar_axisper047(selectedPerson){
	    	objUtiles.cerrarModal("axisper047");
	    //	alert("selectedPerson"+selectedPerson);
	    	objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
	    //	document.miForm.action="axis_axisper009.do?operation=form";
		//	document.miForm.target="_self";       
        //    document.miForm.submit();  
	    }  
	   
	    function callBackResponse(response){
		   document.miForm.action="axis_axisper009.do?operation=form";
		   document.miForm.target="_self";       
           document.miForm.submit();  		   
		}
        function f_obtener_nFilas(idTabla){
        return $('#'+idTabla+' >tbody >tr').length;
        }
        
        
        /* IAXIS-13881 : Cambios de facturacion electronica : start*/
                   

        function f_abrir_axisper053_FE(PSPERSON,PNIT_PROVEEDOR,PCRESPONSABLE_IVA,PCFISCALES_ADQUIRIENTE,PCORREO_FACT_ELECT,ACTION) 
        {             
	   		objUtiles.abrirModal("axisper053", "src", 
	   							 "modal_axisper053.do?operation=form&SPERSON="+PSPERSON+
				   				 "&NIT_PROVEEDOR="+PNIT_PROVEEDOR+
				   				 "&RESPONSABLE_IVA="+PCRESPONSABLE_IVA+
				   				 "&FISCALES_ADQUIRIENTE="+PCFISCALES_ADQUIRIENTE+
				   				 "&CORREO_FACT_ELECT="+PCORREO_FACT_ELECT+
				   				 "&ACTIONMOD="+ACTION);
	   		window.scrollTo(0, 0);	   		
	   	}        
                                        
        function f_aceptar_axisper053_FE(selectedPerson)
        {        	
            f_cerrar_axisper053_FE();
            objUtiles.ejecutarFormulario("axis_axisper009.do?subpantalla=masdatos&faceptar=f_aceptar_mtn_axisper001&SPERSON="+selectedPerson, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            window.scrollTo(0, 0);            
        }
        
        function f_cerrar_axisper053_FE()
        {
        	objUtiles.cerrarModal("axisper053");
        }
        /* IAXIS-13881 : Cambios de facturacion electronica : end*/          
        
        
    </script>
  </head>
  <body onload="f_onload()"><c:import url="../include/precargador_ajax.jsp">
      <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import><c:import url="../include/modal_estandar.jsp">
      <c:param name="nid_y_titulo">
        axiscom001|
        <%-- <axis:alt f="axisper009" c="LIT" lit="1000183"/>--%>
        axiscom001
      </c:param>
    </c:import><c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER008_TIT" lit="1000235"/>
      </c:param>
      <c:param name="nid" value="axisper008"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER010" lit="110275"/>
      </c:param>
      <c:param name="nid" value="axisper010"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER011" lit="1000235"/>
      </c:param>
      <c:param name="nid" value="axisper011"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER012" lit="1000235"/>
      </c:param>
      <c:param name="nid" value="axisper012"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER013" lit="1000235"/>
      </c:param>
      <c:param name="nid" value="axisper013"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER014" lit="1000235"/>
      </c:param>
      <c:param name="nid" value="axisper014"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER015" lit="9000432"/>
      </c:param>
      <c:param name="nid" value="axisper015"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER017" lit="110275"/>
      </c:param>
      <c:param name="nid" value="axisper017"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER018" lit="9001275"/>
      </c:param>
      <c:param name="nid" value="axisper018"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER023" lit="9001817"/>
      </c:param>
      <c:param name="nid" value="axisper023"/>
    </c:import>
     <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER025" lit="9902250"/>
      </c:param>
      <c:param name="nid" value="axisper025"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER026" lit="9902257"/>
      </c:param>
      <c:param name="nid" value="axisper026"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="LIT_DSP_NVIMPUESTO" lit="9906563"/>
      </c:param>
      <c:param name="nid" value="axisprf016"/>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER027" lit="9902423"/>
      </c:param>
      <c:param name="nid" value="axisper027"/>
    </c:import>
        
	<c:import url="../include/modal_estandar.jsp">
	    <c:param name="titulo"><axis:alt f="axisper009" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
	    <c:param name="nid" value="axisimprimir"></c:param>
	</c:import>
    
     <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper050" c="MODPER050" lit="9910012"/>
      </c:param>
      <c:param name="nid" value="axisper050"/>
    </c:import>
    
     <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODLOPD" lit="9903247"/>
      </c:param>
      <c:param name="nid" value="axisper031"/>
    </c:import>
    
     <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER028" lit="9903260"/>
      </c:param>
      <c:param name="nid" value="axisper028"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODPER029" lit="9903261"/>
      </c:param>
      <c:param name="nid" value="axisper029"/>
    </c:import>
<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9902423" />
		</c:param>
		<c:param name="nid" value="axisper047" />
	</c:import>
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="DOCU_REQUERIDA" lit="9908805" />
		</c:param>
		<c:param name="nid" value="axiscga002" />
	</c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="titulo">
			<axis:alt f="axiscga001" c="axisagd004_TITULO" lit="9001188" />
		</c:param>
		<c:param name="nid" value="axisagd004" />
	</c:import>	
	<c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="MODFIC001" lit=""/>
      </c:param>
      <c:param name="nid" value="axisfic001"/>
    </c:import>
    
     <c:import url="../include/modal_estandar.jsp">
      <c:param name="titulo">
        <axis:alt f="axisper009" c="TITULO_ACUMULAC" lit=""/>
      </c:param>
      <c:param name="nid" value="axisrea052"/>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisper030" c="MOD_DOCUM" lit="1000431"/></c:param>
                <c:param name="nid" value="axisper030" />
    </c:import>  
    
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisper009" c="TITULO_DATAPU" lit="9001219" /></c:param>
        <c:param name="nid" value="axisagd002" />
    </c:import>		
   
    <!-- IAXIS-13881 : Cambios de facturacion electronica : start -->
	    <c:import url="../include/modal_estandar.jsp">
	        <c:param name="titulo"><axis:alt f="axisper009" c="axisper053_TITULO" lit="89908046" /></c:param>
	        <c:param name="nid" value="axisper053" />
	    </c:import>
		
    <!-- IAXIS-13881 : Cambios de facturacion electronica : end -->
           
    <!--*********************************** -->
    <form name="miForm" id="miForm" action="" method="POST">
      <input type="hidden" name="operation" value=""/>
      <input type="hidden" name="faceptar" value="${dades_persona.faceptar}"/>
      <%-- Esto es necesario tenerlo como hidden para volverlo a enviar a
           servidor para grabar--%>
      <input type="hidden" name="ultima_version" value="${dades_persona.ultima_version}"/>
      <input type="hidden" name="tipo_persona" value="${dades_persona.tipo_persona}"/>
      <input type="hidden" name="isNew" value="${dades_persona.isNew}"/>
      <input type="hidden" name="SPERSON" value="${dades_persona.SPERSON}"/>      
      <input type="hidden" name="SPEREAL" value="${dades_persona.SPEREAL}"/>
      <input type="hidden" name="CESTPER" value="${dades_persona.CESTPER}"/>
      <input type="hidden" name="CMUTUALISTA"
             value="${dades_persona.CMUTUALISTA}"/>
      <input type="hidden" name="FDEFUNC" value="${dades_persona.FDEFUNC}"/>
      <input type="hidden" name="NORDIDE" value="${dades_persona.NORDIDE}"/>
      <input type="hidden" name="FJUBILA " value="${dades_persona.FJUBILA }"/>
      <input type="hidden" name="CDOMICI" value="${dades_persona.CDOMICI}"/>
      <input type="hidden" name="CNORDBAN" value="${dades_persona.CNORDBAN}"/>
      <input type="hidden" name="CPAIS" value="${dades_persona.CPAIS}"/>
      <input type="hidden" name="TNOMBRECOMPL" value="${dades_persona.TNOMBRECOMPL}"/>
      <%--INI - IAXIS-3590 - JLTS - 01/05/2019 -Se adiciona NRECIBO para la pantalla axisadm003.jsp--%>
      <input type="hidden" name="NRECIBO" value="${__formdata.NRECIBO}"/>
      <%--FIN - IAXIS-3590 - JLTS - 01/05/2019 -Se adiciona NRECIBO para la pantalla axisadm003.jsp--%>
      <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
      <input type="hidden" name="CMODO" value="${__formdata.CMODO}"/>
      <input type="hidden" id="IDAPUNTE" name="IDAPUNTE" value="${__formdata.IDAPUNTE}"/> <!-- CONF-347-20161101-RCS - Ini -->
      <input type="hidden" id="IDAGENDA" name="IDAGENDA" value="${__formdata.IDAGENDA}"/>    
      <input type="hidden" id="NUEVO" name="NUEVO" value=""/>
       <input type="hidden" id="IDAPU" name="IDAPUNTE" value="${__formdata.IDAPUNTE}"/>
      <input type="hidden" id="IDAGD" name="IDAGENDA" value="${__formdata.IDAGENDA}"/>  
      <input type="hidden" id="IDOBS" name="IDOBS" value="${__formdata.IDOBS}"/> <!--  CONF-347-20161101-RCS - FIN -->
      
      <% String CMODO = (String) axis.mvc.control.AbstractDispatchAction.topPila(request, "CMODO");	%>
      <c:set var="ocultarIconosEdicion">
        <%= "CONSULTA_PERSONA".equals(CMODO) %>
      </c:set>
      <c:set var="ocultarIconoBuscarPersonas">
        <%= "CONSULTA_PERSONA".equals(CMODO) || "EDITA_DATOS_PERSONA".equals(CMODO) %>
      </c:set>
      
      <%-- <c:set target="${__formdata}" property="SPEREAL" value="1"/>--%>
     
        <%-- Poner estos hiddens, ya que los combos estarán disabled--%>
        <input type="hidden" name="CTIPPER" id="CTIPPER" value="${dades_persona.CTIPPER}"/>
        <!-- TIDENTI  por CTIPPER -->
        <input type="hidden" name="CTIPIDE" id="CTIPIDE"  value="${dades_persona.CTIPIDE}"/>
         <c:if test="${!empty dades_persona.SPEREAL}">
        <input type="hidden" name="CSEXPER" value="${dades_persona.CSEXPER}"/>
      </c:if>
      <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario">
          <axis:alt f="axisper009" c="LIT_PARAM1" lit="9000412"/>
        </c:param>
        <c:param name="producto">
          <axis:alt f="axisper009" c="LIT_PARAM2" lit="9000412"/>
        </c:param>
        <c:param name="form">axisper009</c:param>
      </c:import>
      <table class="mainTableDimensions base" align="center" cellpadding="0"
             cellspacing="0">
        <tr>
          <td>       
           <div class="separador">&nbsp;</div>
            <!--campos-->
            <div class="titulo" >
              
               
                <div style="float:left;">
                <img src="images/flecha.gif"/>
              <b>${dades_persona.NNUMIDE}&nbsp;&nbsp; -&nbsp; &nbsp; 
                ${dades_persona.TNOMBRE}&nbsp; 
                <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                ${dades_persona.TAPELLI1}
                 &nbsp;${dades_persona.TAPELLI2}
                 </c:if>
                 </b>
               
              <c:if test="${! ocultarIconoBuscarPersonas && __configform.axisper009__BT_BUSCAR_PERSONAS__visible != 'false'}">
                <img id="find" border="0" src="images/find.gif"
                     onclick="f_abrir_axisper008()" style="cursor:pointer"/>
                     
              </c:if>
              <axis:visible c="CESTPERLOPD" f="axisper009">
              <c:if test="${!empty dades_persona.CESTPERLOPD}">
                    <axis:alt f="axisper009" c="TIT_CESTLOPD" lit="9903245"/> : ${dades_persona.TESTPERLOPD}
                  </c:if>
                  </axis:visible>
              </div>
              <div style="float:right;">
              <axis:visible c="DSP_GESTLOPD" f="axisper009" >
              <axis:alt f="axisper009" c="GESTLOPD" lit="9903247"/> 
              <img border="0" alt="<axis:alt f="axisper009" c="GESTLOPD" lit="9903247"/>"  src="images/mas.gif"
              onclick="javascript:mostrar('SECCION_GESTLOPD')" />
             
             
                  <div id="SECCION_GESTLOPD" class="seccion_suplementos" style="z-index: 999;" >
                                         <!-- INICIO SECCION -->
                                         <table class="area"  align="center">
                                             <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>                                                
                                             </tr>
                                             <tr>
                                             <td colspan="4" class="titulo">
                                                <axis:alt f="axisper009" c="DSP_GESTLOPD" lit="9903248"/>
                                             </td>
                                             </tr>
                                                 <tr>  
                                                     <td colspan="4" class="titulocaja">
                                                     <axis:visible f="axisper009" c="LINK_BLOQUEAR">                                                      
                                                        <a href="javascript:ocultar('SECCION_GESTLOPD');f_bloquear_persona_LOPD()"><axis:alt f="axisper009" c="LINK_BLOQUEAR" lit="9903249"/></a>
                                                        <br>
                                                     </axis:visible>
                                                     <axis:visible f="axisper009" c="LINK_DESBLOQUEAR">                                                      
                                                        <a href="javascript:ocultar('SECCION_GESTLOPD');f_desbloquear_persona_LOPD()"><axis:alt f="axisper009" c="LINK_DESBLOQUEAR" lit="9903250"/></a>
                                                        <br>
                                                     	</axis:visible>
                                	                     <axis:visible f="axisper009" c="LINK_BORRAR_LOPD">                                                      
                                                         <a href="javascript:ocultar('SECCION_GESTLOPD');f_borrar_persona_LOPD()"><axis:alt f="axisper009" c="LINK_BORRAR_LOPD" lit="9903251"/></a>
                                                       </axis:visible>
                                                     </td>
                                                 </tr>
                                             </table>
                                             </div>
              </axis:visible>
                </div>
              
            </div>
            
            <table class="seccion" >
              <tr>
                <td align="left">
                  <table class="area" align="center">
                    <tr>
                      <td class="campocaja"><a name="posicionPorColorcar__DSP_AGENTES" id="posicionPorColorcar__DSP_AGENTES" ></a>
                        <div class="separador">&nbsp;</div>
                        <div style="float:left;">
                          <img id="DSP_AGENTES_parent" src="images/menys.gif"
                               onclick="objEstilos.toggleDisplay('DSP_AGENTES', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','DSP_AGENTES');"
                               style="cursor:pointer"/>
                           
                          <b><axis:alt f="axisper009" c="TIT_AGENTES" lit="110275"/></b>
                        </div>
			<%--INI - IAXIS-3590 - JLTS - 01/05/2019 -Se incluye el BT_IMPRIMIR --%>
                        <axis:visible f="axisper009" c="BT_IMPRIMIR">
			        	<div style="float: right;">
									<img border="0"
										onclick="javascript:f_but_pers()"
										alt="<axis:alt f="axisper009" c="DOCPER" lit="9910379"/>"
										title="<axis:alt f="axisper009" c="DOCPER" lit="9910379"/>"
										src="images/print.gif" />
						</div>
			</axis:visible>
			<%--FIN - IAXIS-3590 - JLTS - 01/05/2019 -Se incluye el BT_IMPRIMIR --%>
                        <div style="clear:both;">
                          <hr class="titulo"></hr>
                        </div>
                      </td>
                    </tr>
                    <tr id="DSP_AGENTES_children" >
                      <td class="campocaja">
                      	  <axis:visible f="axisper009" c="DSP_AGENTE">
                        <div class="displayspace" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','DSP_AGENTES');return true;">
                          <c:set var="title1">
                            <axis:alt f="axisper009" c="COD_LIT" lit="105330"/>
                          </c:set>
                           
                          <c:set var="title2">
                         
                            <axis:alt f="axisper009" c="AGENTE_LIT" lit="105330"/> 
                           
                          </c:set>
                           
                          <c:set var="title0">
                            <axis:alt f="axisper009" c="TAGENTE_LIT" lit="100584"/>
                          </c:set>
                         
                          <display:table name="${agents_visio}" id="agentes"
                                         export="false" class="dsptgtable"
                                         pagesize="-1" defaultsort="1"
                                         cellpadding="0" cellspacing="0"
                                         requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                            <%@ include file="../include/displaytag.jsp"%>
                            
                            <display:column title=" " sortable="false"
                                            sortProperty=""
                                            headerClass="headwidth5 sortable fixed"
                                            style="width:5%;" media="html"
                                            autolink="false">
                              <div class="dspIcons">
                                <input <c:if test="${agentes.CAGENTE == __formdata.CAGENTE}">checked</c:if>
                                       type="radio"
                                       onclick="seleccionarLista('${agentes.CODI}','${agentes.CAGENTE}')"
                                       id="seleccionaAgente"
                                       name="seleccionaAgente"
                                       value="${agentes.CAGENTE}"/>
                              </div>
                              
                            </display:column>
                            <display:column title="${title0}" sortable="true"
                                            style="width:10%;"
                                            sortProperty="CAGENTEs"
                                            headerClass="sortable fixed"
                                            media="html" autolink="false">
                              <div class="dspText">
                                ${agentes.CAGENTE}
                              </div>
                            </display:column>
                            
                            <display:column title="${title1}" sortable="true"
                                            style="width:90%;"
                                            sortProperty="TAGENTE"
                                            headerClass="headwidth5 sortable fixed"
                                            media="html" autolink="false">
                              <div class="dspText">
                                ${agentes.TAGENTE}
                              </div>
                            </display:column>
                            
                          </display:table>
                      
                        </div>
                          </axis:visible>
                        <div class="separador">&nbsp;</div>
                        <table class="area" align="center">
                          <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != -1}">
                            <tr>
                              <td class="campocaja"><a name="posicionPorColorcar__datosgenerales" id="posicionPorColorcar__datosgenerales" ></a>
                                <div style="float:left;">
                                  <img id="datosgenerales_parent" 
                                       src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('datosgenerales', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','datosgenerales');"
                                       style="cursor:pointer"/>
                                   
                                  <b><%-- axis:alt f="axisper009" c="LIT" lit="1000304" /--%>
                                     
                                    <axis:alt f="axisper009" c="LIT_DAT" lit="103593"/></b>
                                </div>                              
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                            </tr>
                            <tr id="datosgenerales_children"
                                style="display:none">
                              <td align="left">
                                <!-- Datos Generales -->                                
                                <table class="seccion" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','datosgenerales');return true;">
                                  <tr>
                                    <th style="width:2%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:17%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:17%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:17%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:16%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:16%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:11%;height:0px">
                                      &nbsp;
                                    </th>
                                    <th style="width:2%;height:0px">
                                      &nbsp;
                                    </th>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper009" c="TIT1" lit="102844"/></b>
                                    </td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper009" c="TIT2" lit="109774"/></b>
                                    </td>
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper009" c="TIT3" lit="105330"/></b>
                                     <c:if test="${dades_persona.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper009" c="TIT4" lit="100962"/></b>
                                      </td>
                                      <axis:visible c="FNACIMI" f="axisper009">
                                      <td class="titulocaja" c="FNACIMI">
                                        <b id="label_FNACIMI"><axis:alt f="axisper009" c="TIT5" lit="1000064"/></b>
                                      </td>
                                      </axis:visible>
                                     
                                    </c:if>
                                     <c:if test="${dades_persona.CTIPPER == 2}">                             
                                      <axis:ocultar c="FNACIMI" f="axisper009" dejarHueco="false">
                                          <td class="titulocaja" id="tit_FNACIMI">
                                            <b  id="label_FNACIMI"><axis:alt f="axisper009" c="FNACIMI" lit="1000064"/></b>
                                          </td>
                                      </axis:ocultar>
                                      </c:if>
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper009" c="TIT6" lit="9000792"/></b>
                                      </td>
                            </tr>
                                  
                                  <tr>                     
                                    <td>&nbsp;</td>
                                    <td class="campocaja">
                                      <input type="text" name="DESCIDENT"
                                             value="${dades_persona.DESCIDENT}"
                                             class="campowidthinput campo campotexto"
                                             style="width:90%"
                                             <axis:atr f="axisper009" c="DESCIDENT" a="modificable=false"/>/>
                                    </td>
                                    <td class="campocaja">
                                      <input type="text" name="TTIPIDE"
                                             value="${dades_persona.TTIPIDE}"
                                             class="campowidthinput campo campotexto"
                                             style="width:90%"
                                             <axis:atr f="axisper009" c="TTIPIDE" a="modificable=false"/>/>
                                    </td>
                                    <td class="campocaja">
                                      <input type="text" name="NNUMIDE"
                                             id="NNUMIDE"
                                             value="${dades_persona.NNUMIDE}"
                                             class="campowidthinput campo campotexto"
                                             style="width:50%"
                                             <axis:atr f="axisper009" c="NNUMIDE" a="modificable=false"/>/>
                                    </td>
                                    <c:if test="${dades_persona.CTIPPER == 2}">
                                       <axis:ocultar c="FNACIMI" f="axisper009" dejarHueco="false">
                                    <td class="campocaja" id="td_FNACIMI">
                                     <input type="text" name="FNACIMI"
                                               id="FNACIMI"
                                               value='<fmt:formatDate pattern="dd/MM/yyyy" value="${dades_persona.FNACIMI}"/>'
                                               class="campowidthinput campo campotexto"
                                               style="width:70%"
                                               <axis:atr f="axisper009" c="FNACIMI" a="modificable=false&formato=fecha"/>
                                               title='<axis:alt f="axisper009" c="FNACIMI_ALT" lit="100959"/>'/>
                                    
                                    </td>
                                    </axis:ocultar>
                                    
                                    <axis:visible c="SWPUBLICO" f="axisper009" >
                                      <td class="campocaja">
                                       <input onclick="javascript:void(0)"
                                               type="checkbox" id="SWPUBLI"
                                               name="SWPUBLI"
                                               
                                               <c:if test="${dades_persona.SWPUBLI == 1}">checked="true"</c:if>
                                               value="dade_persona.SWPUBLI"
                                               disabled="disabled"/>
                                      </td>
                                     </axis:visible>
                                    
                                    </c:if>
                                    
                                    
                                    
                                    <td class="campocaja">
                                      <c:if test="${dades_persona.CTIPPER != 2}">
                                        <input type="text" name="TSEXPER"
                                               id="TSEXPER"
                                               value="${dades_persona.TSEXPER}"
                                               class="campowidthinput campo campotexto"
                                               style="width:50%"
                                               <axis:atr f="axisper009" c="TSEXPER" a="modificable=false"/>/>
                                      </c:if>
                                    </td>
                              
                              
                                  <c:if test="${dades_persona.CTIPPER != 2}">
                                   <axis:ocultar c="FNACIMI" f="axisper009" dejarHueco="false">
                                     <td class="campocaja" id="td_FNACIMI">
                                       <input type="text" name="FNACIMI"
                                               id="FNACIMI"
                                               value='<fmt:formatDate pattern="dd/MM/yyyy" value="${dades_persona.FNACIMI}"/>'
                                               class="campowidthinput campo campotexto"
                                               style="width:70%"
                                               <axis:atr f="axisper009" c="FNACIMI" a="modificable=false&formato=fecha"/>
                                               title='<axis:alt f="axisper009" c="FNACIMI_ALT" lit="100959"/>'/>
                                               </td>
                                       </axis:ocultar>    
                                      </c:if>
                                   
                                 
                                    <c:if test="${dades_persona.CTIPPER != 2}">
                                    
                                    <axis:visible c="SWPUBLICO" f="axisper009" >
                                      <td class="campocaja" align="center">
                                        <input onclick="javascript:void(0)"
                                               type="checkbox" id="SWPUBLI"
                                               name="SWPUBLI"
                                               <c:if test="${dades_persona.SWPUBLI == 1}">checked="true"</c:if>
                                               value="dade_persona.SWPUBLI"
                                               disabled="disabled"/>
                                      </td>
                                     </axis:visible>    
                                    </c:if>
                                    
                                    
                                    
                                    <axis:visible f="axisper009" c="BT_EDIDATOSPER">
                                    <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_DATOS_PERSONALES_1__visible != 'false'}">
                                      <td class="campocaja">
                                        
                                          <img border="0"
                                               alt='<axis:alt f="axisper009" c="SPERON_ALT" lit="9000421"/>'
                                               title='<axis:alt f="axisper009" c="SPERON_ALT" lit="9000421"/>'
                                               src="images/lapiz.gif"
                                               onclick="f_abrir_axiper017(${dades_persona.SPERSON})"/>
                                        
                                      </td>
                                    </c:if>
                                    </axis:visible>
                 
                                  </tr>
                                  
                                  <axis:ocultar c="CPREAVISO" f="axisper009" dejarHueco="false">
	                                  <tr>                     
	                                    <td>&nbsp;</td>	
	                                  
	                                  		<td class="titulocaja" id="tit_CPREAVISO">
	                                          <b  id="label_CPREAVISO"><axis:alt f="axisper009" c="CPREAVISO" lit="9903597"/></b>
	                                      </td>
	                                  </tr>
	                                  <tr>                     
	                                    <td>&nbsp;</td>	
	                                      <td class="campocaja">
	                                            <input type="text" name="CPREAVISO"
	                                             id="CPREAVISO"
	                                             value="${dades_persona.TPREAVISO}"
	                                             class="campowidthinput campo campotexto"
	                                             style="width:50%"
	                                             <axis:atr f="axisper009" c="CPREAVISO" a="modificable=false"/>/>
	                                       </td>
	                                       
	                                  </tr>
                                  </axis:ocultar>
                                  
                                
                                  <c:if test="${!empty dades_persona.TDIGITOIDE}">
                                  <tr>
                                  
                                  
                                  	
                            <td></td>
                            
                             <axis:ocultar c="SWRUT" f="axisper009"  dejarHueco="false">
                             <td colspan="2" id="tit_SWRUT">
                               <table  cellpadding="0" cellspacing="0">
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT"><axis:alt f="axisper009" c="SWRUT" lit="9903067"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE">
                                                <b id="label_TDIGITOIDE"><axis:alt f="axisper009" c="TDIGITOIDE" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                                <%-- BUG 32649 INI--%>
                                <axis:ocultar c="SWRUT_COLM" f="axisper009"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT_COLM"><axis:alt f="axisper009" c="SWRUT_COLM" lit="9904620"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE_COLM">
                                                <b id="label_TDIGITOIDE_COLM"><axis:alt f="axisper009" c="TDIGITOIDE_COLM" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                                <%-- BUG 32649 fin--%>
                            </tr>
                            <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper009"  dejarHueco="false">
                                <td id="td_SWRUT" colspan="2">
                                <table style="height:0px">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja">
                                      <input  type="checkbox" id="SWRUT" name="SWRUT"  <axis:atr f="axisper009" c="SWRUT" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${dades_persona.SWRUT == 1}">checked="true"</c:if>  value="${dades_persona.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    value="${dades_persona.TDIGITOIDE}" name="TDIGITOIDE" id="TDIGITOIDE"  style="width:25%;"
                                    <axis:atr f="axisper009" c="TDIGITOIDE" a="modificable=false"/>>
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                                  <%-- BUG 32649 INII --%>
                               <axis:ocultar c="SWRUT_COLM" f="axisper009"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT_COLM" colspan="2">
                                <table>
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja" >
                                    <input type="checkbox" id="SWRUT_COLM" name="SWRUT_COLM"  <axis:atr f="axisper009" c="SWRUT_COLM" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${__formdata.SWRUT_COLM == 1}">checked="true"</c:if>  value="${dades_persona.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE_COLM">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    title='<axis:alt f="axisper009" c="TDIGITOIDE_COLM" lit="9903068"/>' 
                                    	<axis:atr f="axisper009" c="TDIGITOIDE_COLM" a="modificable=false"/>
                                    value="${dades_persona.TDIGITOIDE}" name="TDIGITOIDE_COLM" id="TDIGITOIDE_COLM" onchange="f_onchange_TDIGITOIDE_COLM(this.value)"  style="width:25%;"
                                    <axis:atr f="axisper009" c="TDIGITOIDE_COLM" /> >
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                                
                                
                            </tr>
                            </c:if>
                            
                         <axis:visible c="TIPOSOC" f="axisper009" >
                            <tr>
                                <td class="titulocaja" id="tit_TIPOSOC">
                                    &nbsp; 
                                </td>    
                                <td class="titulocaja" colspan="2" id="tit_TIPOSOC" >
                                  <b id="label_TIPOSOC"><axis:alt f="axisper009" c="TIPOSOC" lit="9903269"/></b>
                                </td>   
                            </tr>
                            </axis:visible>
                            <axis:visible c="TIPOSOC" f="axisper009">
                            <tr>
                                <td class="campocaja" id="td_TIPOSOC">
                                    &nbsp; 
                                </td> 
                         
                                <td class="campocaja" id="td_TIPOSOC" colspan="2">
                                   <input type="text" class="campowidthinput campo campotexto"  size="15" value="${__formdata.TIPOSOC}"  id="TIPOSOC" name="TIPOSOC"  readonly>
                                </td>  
                                </tr>
                                </axis:visible>
                                  <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="6">
                                      <hr></hr>
                                    </td>
                                  </tr>
                                  
                                  <tr>
                                    <td>&nbsp;</td>
                                    <axis:ocultar f="axisper009" c="TNOMBRE" dejarHueco="false">
                                         <td class="titulocaja" colspan="2" id="tit_TNOMBRE">
                                          <b id="label_TNOMBRE"><axis:alt f="axisper009" c="TNOMBRE" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper009" c="TNOMBRE1" dejarHueco="false">
                                        <td class="titulocaja" id="tit_TNOMBRE1">
                                          <b id="label_TNOMBRE1"><axis:alt f="axisper009" c="TNOMBRE1" lit="105940"/></b>
                                        </td>
                                    </axis:ocultar>
                                     <axis:ocultar f="axisper009" c="TNOMBRE2" dejarHueco="false">
                                        <td class="titulocaja" id="tit_TNOMBRE2">
                                          <b id="label_TNOMBRE2"><axis:alt f="axisper009" c="TNOMBRE2" lit="9902260"/></b>
                                        </td>
                                    </axis:ocultar>

                                    <axis:ocultar f="axisper009" c="TAPELLI1" dejarHueco="false">
                                      <td class="titulocaja" colspan="2" id="tit_TAPELLI1">
                                        <b id="label_TAPELLI1"><axis:alt f="axisper009" c="TAPELLI1" lit="108243"/></b>
                                      </td>
                                      </axis:ocultar>
                                 
                                 
                                    <c:if test="${!empty dades_persona.CTIPPER && dades_persona.CTIPPER == 2}">
                                          <td class="titulocaja" id="TESTPER">
                                            <b><axis:alt f="axisper009" c="TESTPER" lit="9000793"/></b>
                                          </td>
                                          <td class="titulocaja" id="CPAIS">
                                            <b id="label_CPAIS"><axis:alt f="axisper009" c="TPAIS" lit="9000789"/></b>
                                          </td>
                                    </c:if>
                                    <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                                          <td class="titulocaja" colspan="2" id="tit_TAPELLI2">
                                            <b><axis:alt f="axisper009" c="TAPELLI2" lit="108246"/></b>
                                          </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <%--axis:ocultar f="axisper009" c="td_TNOMBRE" dejarHueco="false"--%>
                                    <%--td  id="td_TNOMBRE">&nbsp;</td --%>
                                    <td>&nbsp;</td>
                                    <%--/axis:ocultar --%>
                                    <axis:ocultar f="axisper009" c="TNOMBRE"  dejarHueco="false">
                                      <td class="campocaja" colspan="2"  id="td_TNOMBRE">
                                         <input type="text" name="TNOMBRE"
                                             id="TNOMBRE"
                                             value="${dades_persona.TNOMBRE}"
                                             class="campowidthinput campo campotexto"
                                             style="width:95%"
                                             <axis:atr f="axisper009" c="TNOMBRE" a="modificable=false"/>/>
                                    </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper009" c="TNOMBRE1" dejarHueco="false">
                                        <td class="campocaja" id="td_TNOMBRE1">
                                          <input type="text" name="TNOMBRE1"
                                                 id="TNOMBRE1"
                                                 value="${dades_persona.TNOMBRE1}"
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%"
                                                 <axis:atr f="axisper009" c="TNOMBRE1" a="modificable=false"/>/>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisper009" c="TNOMBRE2" dejarHueco="false">
                                    
                                        <td class="campocaja"  id="td_TNOMBRE2">
                                          <input type="text"
                                                 value="${dades_persona.TNOMBRE2}"
                                                 name="TNOMBRE2" id="TNOMBRE2"
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%" title="<axis:alt f="axisper009" c="TNOMBRE2" lit="9902260"/>"
                                                 <axis:atr f="axisper009" c="TNOMBRE2" a="modificable=false"/>/>
                                        </td>
                                     </axis:ocultar>
                                                            
                                    <axis:ocultar f="axisper009" c="TAPELLI1" dejarHueco="false">
                                       <td class="campocaja" colspan="2" id="td_TAPELLI1">
                                        <input type="text" name="TAPELLI1"
                                               id="TAPELLI1"
                                               value="${dades_persona.TAPELLI1}"
                                               class="campowidthinput campo campotexto"
                                               style="width:94%"
                                               <axis:atr f="axisper009" c="TAPELLI1" a="modificable=false"/>/>
                                      </td>
                                    </axis:ocultar>
                                      
                                    <c:if test="${!empty dades_persona.CTIPPER && dades_persona.CTIPPER == 2}">
                                      <axis:ocultar c="TESTPER" f="axisper009"
                                                    dejarHueco="false">
                                        <td class="campocaja" id="td_TESTPER">
                                          <input type="text" name="TESTPER"
                                          id="TESTPER"
                                                 value="${dades_persona.TESTPER}"
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%"
                                                 <axis:atr f="axisper009" c="TESTPER" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                      <axis:ocultar c="TPAIS" f="axisper009"
                                                    dejarHueco="false">
                                        <td class="campocaja" >
                                          <input type="text" name="TPAIS"
                                                 id="TPAIS"
                                                 value="${dades_persona.TPAIS}"
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%"
                                                 <axis:atr f="axisper009" c="TPAIS" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                      <td id="VACIA">&nbsp;</td>
                                    </c:if>
                                    
                                    <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2" id="td_TAPELLI2">
                                        <input type="text" name="TAPELLI2"
                                               id="TAPELLI2"
                                               value="${dades_persona.TAPELLI2}"
                                               class="campowidthinput campo campotexto"
                                               style="width:95%"
                                               <axis:atr f="axisper009" c="TAPELLI2" a="modificable=false"/>/>
                                      </td>
                                    </c:if>
                                    <axis:visible f="axisper009" c="BT_EDIDATOSPER2">
                                    <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_EDITAR_DATOS_PERSONALES_2__visible != 'false'}">
                                      <td class="campocaja">
                                        
                                          <img border="0"
                                               alt='<axis:alt f="axisper009" c="SPERSON_LIT" lit="9000421"/>'
                                               title='<axis:alt f="axisper009" c="SPERSON_LIT" lit="9000421"/>'
                                               src="images/lapiz.gif"
                                               onclick="f_abrir_axiper010(${dades_persona.SPERSON},${__formdata.SFINANCI})"/>
                                        
                                      </td>
                                    </c:if>
                                    </axis:visible>
                                  </tr>
                                  
                                  <!--c:if test="${empty dades_persona.CTIPPER}"-->
                                  <tr>
                                    <td>&nbsp;</td>
                                    <c:if test="${dades_persona.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper009" c="TPROFES" lit="110978"/></b>
                                      </td>
                                      </c:if>
                                      <c:if test="${dades_persona.CTIPPER != 2}">
                                       <axis:ocultar c="TOCUPACION" f="axisper009" dejarHueco="false">
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisper010" c="TOCUPACION" lit="9904804"/></b>
                                        </td>  
                                    </axis:ocultar>
                                    </c:if>
                                      
                                      <axis:visible c="CIDIOMA" f="axisper009">
                                      <c:if test="${__formdata.CTIPPER != 2 || __configform.axisper009__CIDIOMA__visible == 'true'}"> 
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper009" c="LIT3" lit="1000246"/></b>
                                      </td>
                                      </c:if>
                                    </axis:visible>
                                     <axis:ocultar c="SNIP" f="axisper009" dejarHueco="false">
                                    <td class="titulocaja">
                                      <b><axis:alt f="axisper009" c="LIT4" lit="1000088"/></b>
                                    </td>
                                    </axis:ocultar>
                                    <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                                      <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper009" c="TPAIS" lit="9000789"/></b>
                                      </td>
                                    </c:if>
                                  </tr>
                                  <tr>
                                    <td>&nbsp;</td>
                                      <c:if test="${dades_persona.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TPROFES"
                                               id="TPROFES"
                                               value="${dades_persona.TPROFES}"
                                               class="campowidthinput campo campotexto"
                                               style="width:95%"
                                               <axis:atr f="axisper009" c="TPROFES" a="modificable=false"/>/>
                                      </td>
                                      </c:if>
                                      <c:if test="${dades_persona.CTIPPER != 2}">
                                      <axis:ocultar c="TOCUPACION" f="axisper009" dejarHueco="false">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TOCUPACION"
                                               id="TOCUPACION"
                                               value="${dades_persona.TOCUPACION}"
                                               class="campowidthinput campo campotexto"
                                               style="width:95%"
                                               <axis:atr f="axisper009" c="TOCUPACION" a="modificable=false"/>/>
                                      </td>
                                      </axis:ocultar>
                                      </c:if>
                                      <axis:visible c="CIDIOMA" f="axisper009">
                                      <c:if test="${__formdata.CTIPPER != 2 || __configform.axisper009__CIDIOMA__visible == 'true'}"> 
                                      <td class="campocaja">
                                        <input type="text" name="TIDIOMA"
                                               id="TIDIOMA"
                                               value="${dades_persona.TIDIOMA}"
                                               class="campowidthinput campo campotexto"
                                               style="width:90%"
                                               <axis:atr f="axisper009" c="TIDIOMA" a="modificable=false"/>/>
                                      </td>
                                      </c:if>
                                      </axis:visible>
                                     <axis:ocultar c="SNIP" f="axisper009" dejarHueco="false">
                                    <td class="campocaja">
                                      <input type="text" name="SNIP" id="SNIP"
                                             value="${dades_persona.SNIP}"
                                             class="campowidthinput campo campotexto"
                                             style="width:89%"
                                             <axis:atr f="axisper009" c="SNIP" a="modificable=false"/>/>
                                    </td>
                                    </axis:ocultar>
                                    <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                                      <td class="campocaja" colspan="2">
                                        <input type="text" name="TPAIS"
                                               id="TPAIS"
                                               value="${dades_persona.TPAIS}"
                                               class="campowidthinput campo campotexto"
                                               style="width:95%"
                                               <axis:atr f="axisper009" c="TPAIS" a="modificable=false"/>/>
                                      </td>
                                    </c:if>
                                  </tr>
                                  
                                  <!--/c:if-->
                                  <tr>
                                    <td id="VACIA">&nbsp;</td>
                                    <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper009" c="LIT5" lit="9000793"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${dades_persona.CESTPER == 2 && dades_persona.CTIPPER != 2}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper009" c="LIT6" lit="9000794"/></b>
                                      </td>
                                    </c:if>
                                    <c:if test="${dades_persona.CTIPPER == 0}">
                                      <td class="titulocaja">
                                        <b><axis:alt f="axisper009" c="LIT7" lit="1000067"/></b>
                                      </td>
                                    </c:if>
                                  <axis:ocultar c="CESTCIV" f="axisper009" dejarHueco="false">   
                                     <c:if test="${dades_persona.CTIPPER != 2}">
                                        <td class="titulocaja">
                                        <b id="label_CESTCIV"><axis:alt f="axisper009" c="CESTCIV" lit="9900955"/></b>
                                      </td>
                                     
                                    </c:if>
                                     </axis:ocultar>
                                     
                                     <axis:ocultar c="CCIU" f="axisper009" dejarHueco="false">   
                                        <td class="titulocaja">
                                        	<b id="label_CCIU"><axis:alt f="axisper009" c="CCIU" lit="9909091"/></b>
                                        </td>
                                     </axis:ocultar>
                                     
                                     <axis:ocultar c="DCIIU" f="axisper009" dejarHueco="false">   
                                        <td class="titulocaja" colspan="2">
                                        	<b id="label_DCIIU"><axis:alt f="axisper009" c="DCIIU" lit="9909602"/></b>
                                        </td>
                                     </axis:ocultar>
                                     
                                  </tr>
                                  <tr>
                                  
                                    <td>&nbsp;</td>
                                    <axis:ocultar c="TESTPER" f="axisper009"
                                                  dejarHueco="false">
                                      <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                                        <td class="campocaja" id="td_TESTPER">
                                          <input type="text" name="TESTPER"
                                          id="TESTPER"
                                                 value="${dades_persona.TESTPER}"
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%"
                                                 <axis:atr f="axisper009" c="TESTPER" a="modificable=false"/>/>
                                        </td>
                                      </c:if>
                                    </axis:ocultar>
                                    <c:if test="${dades_persona.CESTPER == 2 && dades_persona.CTIPPER != 2}">
                                      <axis:ocultar c="FDEFUNC" f="axisper009"
                                                    dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="FDEFUNC"
                                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${dades_persona.FDEFUNC}"/>'
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%"
                                                 <axis:atr f="axisper009" c="FDEFUNC" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                    </c:if>
                                    <c:if test="${dades_persona.CTIPPER == 0}">
                                      <axis:ocultar c="FJUBILA" f="axisper009"
                                                    dejarHueco="false">
                                        <td class="campocaja">
                                          <input type="text" name="FJUBILA"
                                                 value='<fmt:formatDate pattern="dd/MM/yyyy" value="${dades_persona.FJUBILA}"/>'
                                                 class="campowidthinput campo campotexto"
                                                 style="width:95%"
                                                 <axis:atr f="axisper009" c="FJUBILA" a="modificable=false"/>/>
                                        </td>
                                      </axis:ocultar>
                                    </c:if>                                    
                     
                                       <axis:ocultar c="CESTCIV" f="axisper009" dejarHueco="false"> 
                                        <c:if test="${dades_persona.CTIPPER != 2}">
                                            <td class="campocaja"  id="td_CESTCIV">
                                             <input type="text" name="CESTCIV"
                                                     value="${dades_persona.TESTCIV}"
                                                     class="campowidthinput campo campotexto"
                                                     style="width:95%"
                                                     <axis:atr f="axisper009" c="TESTCIV" a="modificable=false"/>/>
                                            </td>                                    
                                        
                                      </c:if>
                                      </axis:ocultar>
                                      
                                      <axis:ocultar c="CCIU" f="axisper009" dejarHueco="false"> 
                                            <td class="campocaja"  id="td_CCIIU">
                                             <input type="text" name="CCIU" value="${dades_persona.CCIIU}" class="campowidthinput campo campotexto" style="width:90%"
                                                     <axis:atr f="axisper009" c="TCCIU" a="modificable=false"/>/>
                                            </td>                                    
                                      </axis:ocultar>
                                      
                                      <axis:ocultar c="CCIU" f="axisper009" dejarHueco="false"> 
                                            <td class="campocaja"  id="td_DCIIU" colspan="2">
                                             <input type="text" name="DCIIU" value="${dades_persona.DCIIU}" class="campowidthinput campo campotexto" style="width:95%"
                                                     <axis:atr f="axisper009" c="TDCIIU" a="modificable=false"/>/>
                                            </td>                                    
                                      </axis:ocultar>
                                      
                                  </tr>
								  
								  <!--                                       inicio Bartolo Herrera --> 
                                  <tr>
                                  <td>&nbsp;</td>
                                  	<axis:ocultar c="DTIPVIN" f="axisper009" dejarHueco="false">   
                                        <td class="titulocaja">
                                        	<b id="label_DTIPVIN"><axis:alt f="axisper009" c="DTIPVIN" lit="9906721"/></b>
                                        </td>
                                     </axis:ocultar>
                                  </tr>
                                  
                                  <tr>
                                  <td>&nbsp;</td>
                                  	<axis:ocultar c="DTIPVIN" f="axisper009" dejarHueco="false"> 
                                            <td class="campocaja"  id="td_DTIPVIN">
                                             <input type="text" name="DTIPVIN" value="${__formdata.TIPVIN}" class="campowidthinput campo campotexto" style="width:95%"
                                                     <axis:atr f="axisper009" c="TDTIPVIN" a="modificable=false"/>/>
                                            </td>                                    
                                      </axis:ocultar>
                                  </tr>
<!--                                       fin Bartolo Herrera -->                  
                               
								  
                                </table>
                              </td>
                            </tr>
                          </c:if>
                          <!-- FIN DATOS generales -->
                          <c:if test="${! empty dades_persona}">
                            <tr>
                              <td class="campocaja"><a name="posicionPorColorcar__masdatos" id="posicionPorColorcar__masdatos" ></a>
                                <div style="float:left;">
                                  <img id="masdatos_parent" src="images/mes.gif"
                                       onclick="objEstilos.toggleDisplay('masdatos', this);objSeccion.actualizarSeccionPorAbrirCookie('axisper009','masdatos');"
                                       style="cursor:pointer"/>
                                  <b><axis:alt f="axisper009" c="LIT9" lit="9000580"/></b>&nbsp;&nbsp;
                                </div>
                                <div style="clear:both;">
                                  <hr class="titulo"></hr>
                                </div>
                              </td>
                            </tr>
                            
                            <!--  INICIO SECCION CAMPOS **********************************************************  -->
                            <tr id="masdatos_children" style="display:none">
                              <td align="left">
                              <axis:visible c="DSP_LOPD" f="axisper009">
                               <!-- *************************  DATOS LOPD  ********************* -->
                                <table class="seccion" onclick="objSeccion.actualizarPosicionPorColocarCookie('axisper009','masdatos');return true;">
                                <div class="titulo">
                                  <div style="float:left;">
                                  <b><axis:alt f="axisper009" c="LIT10" lit="9903248"/></b>
                                </div>
                                      <div style="float:right;">
                                          <axis:visible f="axisper009" c="BT_NVLOPD">
                                              <c:if test="${! ocultarIconosEdicion && __configform.axisper009__BT_NVLOPD__visible != 'false'}">
                                                <div style="float:right;">
                                                  
                                                    <img border="0"
                                                         alt='<axis:alt f="axisper009" c="BT_NVLOPD" lit="9903310"/>'
                                                         title='<axis:alt f="axisper009" c="BT_NVLOPD" lit="9903310"/>'
                                                         src="images/new.gif"
                                                         onclick="f_abrir_axisper031('${dades_persona.SPERSON}')"/>
                                                  
                                                </div>
                                              </c:if>
                                          </axis:visible>
                                      </div>
                                  </div>
                                  
                                  <tr>
                                    <td>
                                      <!-- DisplayTag LOPD -->
                                      <c:set var="title1">
                                        <axis:alt f="axisper009" c="NORDEN" lit="500102"/>
                                      </c:set>
                                      <c:set var="title2">
                                        <axis:alt f="axisper009" c="CUSUARI" lit="9902948"/>
                                      </c:set>
                                      <c:set var="title3">
                                        <axis:alt f="axisper009" c="CESION" lit="9903252"/>
                                      </c:set>
                                      <c:set var="title4">
                                        <axis:alt f="axisper009" c="PUBLICIDAD" lit="9903253"/>
                                      </c:set>
                                      
                                      <c:set var="title7">
                                        <axis:alt f="axisper009" c="ACCESO" lit="9906825"/>
                                      </c:set>
                                      <c:set var="title8">
                                        <axis:alt f="axisper009" c="RECTIFICACION" lit="9906826"/>
                                      </c:set>
                                      
                                       <c:set var="title5">
                                        <axis:alt f="axisper009" c="CESTADO" lit="100587"/>
                                      </c:set>
                                        <c:set var="title6">
                                        <axis:alt f="axisper009" c="FMOVIMI" lit="151474"/>
                                      </c:set>
                                     
                                   
                                     
                                      <div class="displayspace">
                                        <display:table name="${dades_persona.PERLOPD}"
                                                       id="T_IAX_PERLOD"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="-1"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0"
                                                       requestURI="axis_axisper009.do?paginar=true&subpantalla=datosgenerales">
                                          <%@ include file="../include/displaytag.jsp"%>
	

                                          <display:column title="${title1}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.NORDEN"
                                                          headerClass="headwidth10 sortable fixed"
                                                          media="html"
                                                            style="width:10%"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_PERLOD.OB_IAX_PERLOPD.NORDEN}
                                            </div>
                                          </display:column>
                                           
                                           
                                          <axis:visible f="axisper009" c="ACCESO">
                                          <display:column title="${title7}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.ACCESO"
                                                          headerClass="headwidth15 sortable fixed"
                                                          media="html"
                                                          style="width:15%"
                                                          autolink="false">
                                            <div class="dspText">
                                               <c:choose>
                                               <c:when test="${!empty T_IAX_PERLOD.OB_IAX_PERLOPD.ACCESO && T_IAX_PERLOD.OB_IAX_PERLOPD.ACCESO == 1}">
                                                 <axis:alt f="axisper009" c="SI" lit="101778"/>
                                               </c:when>
                                               <c:otherwise>
                                                <axis:alt f="axisper009" c="NO" lit="101779"/>
                                               </c:otherwise>
                                               </c:choose>
                                                                                     <%--input 
                                               type="checkbox" id="CESION"
                                               name="CESION"
                                               <c:if test="${T_IAX_PERLOD.OB_IAX_PERLOPD.PUBLICIDAD == 1}">checked="true"</c:if>
                                               disabled="disabled"/>
                                              </c:if--%>
                                            </div>
                                          </display:column>
                                        </axis:visible>
                                          
                                       <axis:visible f="axisper009" c="RECTIFICACION">
                                       <display:column title="${title8}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.RECTIFICACION"
                                                          headerClass="headwidth15 sortable fixed"
                                                          media="html"
                                                          style="width:15%"
                                                          autolink="false">
                                            <div class="dspText">
                                               <c:choose>
                                               <c:when test="${!empty T_IAX_PERLOD.OB_IAX_PERLOPD.RECTIFICACION && T_IAX_PERLOD.OB_IAX_PERLOPD.RECTIFICACION == 1}">
                                                 <axis:alt f="axisper009" c="SI" lit="101778"/>
                                               </c:when>
                                               <c:otherwise>
                                                <axis:alt f="axisper009" c="NO" lit="101779"/>
                                               </c:otherwise>
                                               </c:choose>
                                                                                     <%--input 
                                               type="checkbox" id="CESION"
                                               name="CESION"
                                               <c:if test="${T_IAX_PERLOD.OB_IAX_PERLOPD.PUBLICIDAD == 1}">checked="true"</c:if>
                                               disabled="disabled"/>
                                              </c:if--%>
                                            </div>
                                          </display:column>
                                        </axis:visible>
                                        
                                         <display:column title="${title3}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.CESION"
                                                          headerClass="headwidth15 sortable fixed"
                                                          media="html"
                                                          style="width:15%"
                                                          autolink="false">
                                            <div class="dspText">
                                            <c:choose>
                                               <c:when test="${!empty T_IAX_PERLOD.OB_IAX_PERLOPD.CESION && T_IAX_PERLOD.OB_IAX_PERLOPD.CESION == 1}">
                                                 <axis:alt f="axisper009" c="SI" lit="101778"/>
                                               </c:when>
                                               <c:otherwise>
                                                <axis:alt f="axisper009" c="NO" lit="101779"/>
                                               </c:otherwise>
                                               </c:choose>
                                            <%--c:if test="${!empty T_IAX_PERLOD.OB_IAX_PERLOPD.CESION}">
                                            <input 
                                               type="checkbox" id="CESION"
                                               name="CESION"
                                               <c:if test="${T_IAX_PERLOD.OB_IAX_PERLOPD.CESION == 1}">checked="true"</c:if>
                                               disabled="disabled"/>
                                              </c:if--%>
                                            </div>
                                          </display:column>
                                           <display:column title="${title4}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.PUBLICIDAD"
                                                          headerClass="headwidth15 sortable fixed"
                                                          media="html"
                                                          style="width:15%"
                                                          autolink="false">
                                            <div class="dspText">
                                               <c:choose>
                                               <c:when test="${!empty T_IAX_PERLOD.OB_IAX_PERLOPD.PUBLICIDAD && T_IAX_PERLOD.OB_IAX_PERLOPD.PUBLICIDAD == 1}">
                                                 <axis:alt f="axisper009" c="SI" lit="101778"/>
                                               </c:when>
                                               <c:otherwise>
                                                <axis:alt f="axisper009" c="NO" lit="101779"/>
                                               </c:otherwise>
                                               </c:choose>
                                                                                     <%--input 
                                               type="checkbox" id="CESION"
                                               name="CESION"
                                               <c:if test="${T_IAX_PERLOD.OB_IAX_PERLOPD.PUBLICIDAD == 1}">checked="true"</c:if>
                                               disabled="disabled"/>
                                              </c:if--%>
                                            </div>
                                          </display:column>
                                          
                                       <axis:visible c="TESTADO" f="axisper009">
                                          <display:column title="${title5}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.TESTADO"
                                                          headerClass="headwidth45 sortable fixed"
                                                          media="html"
                                                          style="width:40%"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_PERLOD.OB_IAX_PERLOPD.TESTADO}
                                            </div>
                                          </display:column>
                                          </axis:visible>
                                          <display:column title="${title2}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.CUSUARI"
                                                          headerClass="headwidth10 sortable fixed"
                                                          media="html"
                                                          style="width:10%"
                                                          autolink="false">
                                            <div class="dspText">
                                              ${T_IAX_PERLOD.OB_IAX_PERLOPD.CUSUARI}
                                            </div>
                                          </display:column>
                                          <display:column title="${title6}"
                                                          sortable="true"
                                                          sortProperty="OB_IAX_PERLOPD.FMOVIMI"
                                                          headerClass="headwidth10 sortable fixed"
                                                          media="html"
                                                          style="width:10%"
                                                          autolink="false">
                                            <div class="dspText">
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${T_IAX_PERLOD.OB_IAX_PERLOPD.FMOVIMI}"/>
                                              
                                            </div>
                                          </display:column>
                                          
                                        </display:table>
                                      </div>                                      
                               </td>
                            </tr> 
                            
                            </table>
                            </axis:visible>
                            
                         </c:if>
						
						    
                        <!-- *************************  DATOS DIRECCIONES  ********************* -->
                        <!-- *************************  DATOS CONTACTOS  ********************* -->
                        <c:import url="axisper009_d.jsp"/>
                         
                        <!-- ************************* FIN DATOS CONTACTOS  ********************* -->
                        <!-- cuentas bancarias     -->
                        <c:import url="axisper009_c.jsp"/>
                        <!-- fin cuentas bancarias -->
                        
                        
                        <!-- *************************  DATOS NACIONALIDADES       ********************* -->
                         <c:if test="${empty dades_persona.CTIPPER || dades_persona.CTIPPER != 2}">
                        <axis:visible c="DSP_NACION" f="axisper009">
                        <div class="titulo"><a name="posicionPorColorcar__NACIONALIDADES" id="posicionPorColorcar__NACIONALIDADES"></a>           
                          <b><axis:alt f="axisper009" c="LIT43" lit="1000304"/></b>
                        </div>
                        <c:import url="axisper009_b.jsp"/>
                        </axis:visible>
                        </c:if>
                        <!-- ************************* FIN DATOS IDENTIFICADORES  ********************* -->
                       
                        <!-- ************************* FIN DATOS IDENTIFICADORES  ********************* -->
                       <axis:visible c="DSP_IDENTI" f="axisper009">
                        <c:import url="axisper009_masdatos.jsp"/>
                        </axis:visible>
						
						<axis:visible c="DSP_CALRIE" f="axisper009">
	                     <c:import url="axisper009_riesgo.jsp"/>
	                    </axis:visible>
						
                      </td>
                    </tr>
                  </table>
                   <axis:visible c="DSP_POLTOM" f="axisper009">
                  <c:import url="axisper009_a.jsp"/>
                  </axis:visible>
                  <axis:visible c="DSP_CUMULOS" f="axisper009">
                     <c:import url="axisper009_cumulos.jsp"/>
                  </axis:visible>
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <div class="separador">&nbsp;</div>
      <div class="separador">&nbsp;</div>
      <div class="separador">&nbsp;</div>
      <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axisper009</c:param>
        <c:param name="__botones">salir,<axis:visible f="axisper009" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
      </c:import>
    </form><c:import url="../include/mensajes.jsp"/></body>
</html>