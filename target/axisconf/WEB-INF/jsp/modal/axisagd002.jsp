<%/* Revision:# anjbgmL01hgnaIgcxuodHA== # */%>
<%--
      NOMBRE:    axisagd002.jsp
      Fecha: 05/04/2011
      PROPÓSITO (descripción pantalla): 
      Edición Observaciones
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0         05/04/2011   XPL               1. Creación de la pantalla. Bug. 18091.MDP003 - Agenda de recibos
--%>


<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){                
                
            	var val_CTIPAGD = " ${__formdata.CTIPAGD}";
            	var val_TENTIDAD = " ${__formdata.SPERSON}";
            	if (val_CTIPAGD == 6 && !objUtiles.estaVacio(val_TENTIDAD)){
            		document.getElementById("TENTIDAD").value = val_TENTIDAD;
            		document.getElementById("CTIPAGD").disabled = true;
            		
            	}
            	
                var IDOBS_OUT = "${__formdata.IDOBS_OUT}";
                   if (!objUtiles.estaVacio(IDOBS_OUT)){
                        parent.f_but_aceptar_axisagd002(IDOBS_OUT);
                   }
           
        
                
                
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
		f_inicializar_fecha();
                
                var IDOBS_OUT = " ${__formdata.MODIFICACION}";
                
                if (IDOBS_OUT == 1) {
                    document.getElementById("CTIPAGD").disabled = true;
                }
                  
		<axis:visible c="DSP_VISION" f="axisagd002">
		f_marcar_publico();			                 
		</axis:visible>
            }
             function f_marcar_publico(){
                 try{
                  input = document.getElementById("PUBLICO");  
                     
                   if (objUtiles.estaVacio(input)){
                    <c:choose>
                    <c:when test="${!empty __formdata.PUBLICO && __formdata.PUBLICO == 1}">
                        objDom.setVisibilidadPorId("GST_VISION","hidden");
                        objDom.setDisplayPorId("GST_VISION","none");
                    </c:when>
                    <c:otherwise>
                        objDom.setVisibilidadPorId("GST_VISION","visible");
                        objDom.setDisplayPorId("GST_VISION","block");
                    </c:otherwise>
                    </c:choose>
                    
                   } else{
                      input = document.getElementById("PUBLICO").checked;  
                      document.getElementById("PUBLICO").value = document.getElementById("PUBLICO").checked ? 1 : 0;
                             if (input){
                             objDom.setVisibilidadPorId("GST_VISION","hidden");
                                objDom.setDisplayPorId("GST_VISION","none");
                             }else{
                                objDom.setVisibilidadPorId("GST_VISION","visible");
                                objDom.setDisplayPorId("GST_VISION","block");
                              
                             }
                    
                     }
                      }catch(e){
                         alert(e.getMessage())
                    }
                    
            }
            
           function f_inicializar_fecha(){
              try{
                
                var CESTOBS = document.getElementById("CESTOBS").value;
                var FESTOBS = document.getElementById("FESTOBS").value;
                
                 if (!objUtiles.estaVacio(CESTOBS) && objUtiles.estaVacio(FESTOBS) ) {
                       <jsp:useBean id="now1" class="java.util.Date" />
                       document.getElementById("FESTOBS").value = "<fmt:formatDate pattern='dd/MM/yyyy' value='${now1}'/>";
                 
                 }
              }catch(e){}
     	   }
            
            
          
            
            function f_abrir_modal_params(cual, optionalQueryString){
                optionalQueryString = optionalQueryString+"&NRIESGO="+objDom.getValorPorId("NRIESGO");
            }
            
            function f_abrir_modal(cual, optionalQueryString) {
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_modal(cual, CRAMO){
                objUtiles.cerrarModal(cual);
                objDom.setValorPorId("CRAMO",  CRAMO);
               var pub = 0;
                try{
                 pub = objDom.getValorPorId("PUBLICO");
                }catch(e){}
             objUtiles.ejecutarFormulario ("modal_axisagd002.do?PUBLICO_AGD="+pub, "buscar", document.miForm, "_self", objJsMessages.jsbuscando_polizas);
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_but_cancelar() {
            //INI - AXIS-3999 -JRVG- 30/06/2020 obtenemos el parametro CTIPAGD de la URL 
            	var LocationActual= window.location.search.substr(1).split("&");
            	var $_GET = {};
            	for (var i = 0; i < LocationActual.length; i++) {
            	    var temp = LocationActual[i].split("=");
            	    $_GET[decodeURIComponent(temp[0])] = decodeURIComponent(temp[1]);
            	}
            	
            	if ($_GET['CTIPAGD'] == 4 && $_GET['PANTALLA'] == "axisgca003") {
            		//Cartera
            		parent.f_cerrar_gestioagenda();
                }else{
                	//Indemnizaciones
                	parent.f_cerrar_modal('axisagd002');
                }
					
			    var $_GET = {};
			//FIN - AXIS-3999 -JRVG- 30/06/2020 
                	
            }
            function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                    
               var pub = 0;
                try{
                 pub = objDom.getValorPorId("PUBLICO");
                }catch(e){}
             objUtiles.ejecutarFormulario ("modal_axisagd002.do?PUBLICO_AGD="+pub, "aceptar", document.miForm, "_self",  objJsMessages.jslit_cargando);
                }
            }
           
            
            
            
            /****************************************************************************************/
            /*********************************** UTILS *****************************************/
            /****************************************************************************************/            
            function f_actualizar_check(thiss){
                thiss.value = thiss.checked ? 1 : 0;
            }
            
            function f_formatdate(entrada,title){
                 var jDate = new JsFecha();
                    if(entrada.value.length>0){
                        entrada.value=jDate.formateaFecha(entrada.value);
                    
                        if(jDate.validaFecha(entrada.value)){
                            entrada.value=jDate.formateaFecha(entrada.value);
                        }else{
                            alert("<axis:alt c='VALIDA_FECHA' f='axisagd002' lit='1000421'/>");
                            entrada.value = '';
                        }
                    }else{entrada.value = '';}
            }
            /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORTE){
                   if (!objUtiles.estaVacio(IMPORTE)){
                     IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                         if(objNumero.validaNumero(IMPORT, true)) {
                              return this.formateaNumeroCero(IMPORT, true);
                         }else{ return   '';}
                    }else return IMPORTE;
             }
             
              function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
             function f_formatear(thiss){
                 thiss.value = validarNumeros(thiss.value);
             }
             
             function f_estado_conclusiones(){
            	var pidobs= objDom.getValorPorId("IDOBS");
            	 if(objDom.getValorPorId("CCONOBS")=="45"){
            		
            		 objDom.setValorPorId("CESTOBS",  0);
            		 var qs="operation=ajax_valconclusiones";
                     qs=qs+"&PNSINIES="+objDom.getValorPorId("NSINIES");
                     qs=qs+"&IDOBS="+ pidobs;
                     
                    objAjax.invokeAsyncCGI("modal_axisagd002.do", callbackvalConcluciones, qs, this)
 
            	 }else{
            		 document.getElementById("but_guardar").disabled = false;
            		 objDom.setValorPorId("CESTOBS",  1);
            		 
            		 if(pidobs==""){
            			 objDom.setValorPorId("TOBS",  ' ');
            		 }
            		
            		
            	 }
            	
             }
             
             function  callbackvalConcluciones (ajaxResponseText){
                 try{
    
                        var doc=objAjax.domParse(ajaxResponseText);
                        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                           
                           var ret= objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                           if (ret == 0){
                        	   var texto= objDom.getValorNodoDelComponente(doc.getElementsByTagName("PTOBS"), 0, 0);
                        	   if (texto!=null){
                        		   objDom.setValorPorId("TOBS",  texto);
                        	   }   
                           }
                          }else{
                             
                        	  document.getElementById("but_guardar").disabled = true;
                          }
                        
                        
                     
                        
                        
                        
                          }catch(e){}
                }   
                
         
        
         
         function f_habilitar_fecha(thiss){
         try{
              var cestOBSnew = thiss.value;
              var CESTOBS = "${__formdata.CESTOBS}";
                  if (cestOBSnew == CESTOBS){
                        document.getElementById("FESTOBS").readOnly   = true;
                        document.getElementById("icon_FESTOBS").style.visibility="hidden";
                        document.getElementById("FESTOBS").value ="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FESTOBS}'/>"
         
                  }else{
                        document.getElementById("FESTOBS").readOnly   = false;
                        document.getElementById("icon_FESTOBS").style.visibility="visible";
                        var fecha=new Date();
                        <jsp:useBean id="now" class="java.util.Date" />
                        document.getElementById("FESTOBS").value = "<fmt:formatDate pattern='dd/MM/yyyy' value='${now}'/>";
                   }
            }catch(e){}
         }
         
        
         function f_but_guardar(){
        	 var TOBS= objDom.getValorPorId("TOBS");
        	 if (TOBS.length>=3000){
        		 alert('El texto de apunte no debe pasar los 3000 Caracteres.');
        	 }else{
        		 
        		 if (objValidador.validaEntrada()){
                     var pub = 0;
                    
                     try{
                      pub = objDom.getValorPorId("PUBLICO");
                     }catch(e){}
                             //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                     objUtiles.ejecutarFormulario("modal_axisagd002.do?PUBLICO_AGD="+pub, "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                   }
        	 }
            
             
         }
         
        
       function f_but_publico(thiss){
       try{
               thiss.value = thiss.checked ? 1: 0;
               var marcar = thiss.checked ? true: false;
               f_cargar_propiedades_pantalla();
               
          
       }catch(e){}
       }
       
       
        function f_check_privado(thiss){
        try{
               thiss.value = thiss.checked ? 1: 0;
               var marcar = thiss.checked ? false: true;
          
               if (!marcar){
                   var input = document.getElementById("PUBLICO");   
                   objDom.setComponenteMarcado(input, marcar);
                }
                   var inputs = document.getElementsByName("VISION_ROL");         
                   
                   for(var i=0;i<inputs.length;i++){
                           var inputId = inputs[i].getAttribute("id");
                              if (objDom.esVisible(inputId)){
                               if (!marcar)
                                objDom.setComponenteMarcado(inputs[i], marcar);
                                objDom.setValorPorId("VISION_ROL_"+i,  0);
                               // objDom.setDisabledPorComponente(inputs[i],!marcar);
                            } 
                   }
                   
              
        }catch(e){}
             amagarDisplay();
       
       }
       
       function f_check_unoxuno(thiss,i){
       try{
        thiss.value = thiss.checked ? 1: 0;
        objDom.setValorPorId("VISION_"+i,  thiss.value);
        objDom.setValorPorId("VISION_ROL_"+i,  thiss.value);
        
        
          if (objDom.esVisible("PUBLICO")){
             var input = document.getElementById("PUBLICO"); 
        
                if (!thiss.checked){
                   objDom.setComponenteMarcado(input, false);
                   objDom.setValorComponente(input, 0);
                }
            }
           /*  input = document.getElementById("PUBLICO"); 
            
              var inputs = document.getElementsByName("VISION_ROL");         
               var unosinmarcar = false;
               for(var i=0;i<inputs.length;i++){
                       var inputId = inputs[i].getAttribute("id");
                          if (objDom.esVisible(inputId)){
                           if ( !objDom.getComponenteMarcado(inputs[i]))
                                unosinmarcar = true;
                        } 
               }
               
              if (!unosinmarcar){
                  if (objDom.esVisible("PUBLICO")){
                   objDom.setComponenteMarcado(input, true);
                   objDom.setValorComponente(input, 1);
                }
                    
               }*/
            
        }catch(e){}
       }
       
       function f_marcar_combo(thiss,cont){
        objDom.setValorPorId("VISION_USU_"+cont,  thiss.value);
        
       }
       
       function f_marcar_combo_rol(thiss,cont){
        objDom.setValorPorId("VISION_ROL_"+cont,  thiss.value);
        
       }
       
        function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("LISTAVISIBILIDADUSU");
                    var tradded = objLista.obtenerFilasBodyLista("LISTAVISIBILIDADUSU", tbodyadded);
                    objLista.borrarFilasDeLista ("LISTAVISIBILIDADUSU", "4", "<axis:alt f="axisctr019" c="miListaId" lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
             
               
                   CPRIVOBS = '';//objDom.getValorPorId("CPRIVOBS");
                   PUBLICO = objDom.getValorPorId("PUBLICO");
                   var qs="operation=ajax_actualitzar_usuarios";
                            qs=qs+"&PUBLICO="+PUBLICO+"&CPRIVOBS="+CPRIVOBS;
                        objAjax.invokeAsyncCGI("modal_axisagd002.do",  callbacklimpiarusuarios, qs, this);  
            } catch(e){}
        }
        
         function  callbacklimpiarusuarios (ajaxResponseText){
         try{
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    objDom.setValorPorId("sizeArrayVisionUsu",0);
                  }
                  }catch(e){}
        }   
        
              
               
            
         function f_descartar_registro(IDOBS, CTIPVISION, TTIPVISION) {
            if(confirm("<axis:alt f='axisagd002' c='CONFIRM_DELETE' lit='1000167'/>")){
              
               var pub = 0;
                try{
                 pub = objDom.getValorPorId("PUBLICO");
                }catch(e){}
             objUtiles.ejecutarFormulario ("modal_axisagd002.do?PUBLICO_AGD="+pub+"&CTIPVISION="+CTIPVISION
              +"&TTIPVISION="+TTIPVISION, "del_vision", document.miForm, "_self", objJsMessages.jslit_cargando);
            }         
        }
        
        function f_but_buscar() {
             objUtiles.abrirModal("axisusu004","src","modal_axisusu004.do?operation=form");
        }
        
        function f_aceptar_axisusu004(idusuario){
             objUtiles.cerrarModal("axisusu004");

               var pub = 0;
                try{
                 pub = objDom.getValorPorId("PUBLICO");
                }catch(e){}
             objUtiles.ejecutarFormulario ("modal_axisagd002.do?CUSUARI="+idusuario+"&PUBLICO_AGD="+pub, "guardar_usuario", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_onchange_tipoc(CTIPAGD) {
    		document.miForm.CTIPAGD.value=CTIPAGD;
            objUtiles.ejecutarFormulario("modal_axisagd002.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
           } 
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>

    
      <!-- AXISSIN019 CERCADOR SINIESTRO  -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisusu004|<axis:alt c="AXISUSU004_TITULO" f="axisagd002" lit="102114"/></c:param>
    </c:import>        

    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>
       <input type="hidden" id="NUEVO" name="NUEVO" value="${__formdata.NUEVO}"/>
       <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>
       <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
       <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
       <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
       <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
       <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
       <input type="hidden" id="NRECIBO" name="NRECIBO" value="${__formdata.NRECIBO}"/>
       <input type="hidden" id="PUBLICO" name="PUBLICO" value="${__formdata.PUBLICO}"/>
       <input type="hidden" id="IDOBS" name="IDOBS" value="${__formdata.IDOBS}"/>
       <input type="hidden" id="MODIFICACION" name="MODIFICACION" value="${__formdata.MODIFICACION}"/>
       <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
       <input type="hidden" id="CTIPAGD" name="CTIPAGD" value="${__formdata.CTIPAGD}"/>
       <input type="hidden" id="IDDOCGEDOX" name="IDDOCGEDOX" value="${__formdata.IDDOCGEDOX}"/>
       
       <axis:visible c="DSP_VISION" f="axisagd002">
       <input type="hidden" id="sizeArrayVisionRol" name="sizeArrayVisionRol" value="${fn:length(__formdata.listValores.lstvisionrol)}">
       <input type="hidden" id="sizeArrayVisionUsu" name="sizeArrayVisionUsu" value="${fn:length(__formdata.listValores.lstvisionusu)}">
      </axis:visible>
       
       
       
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisagd002" lit="9001247"/></c:param>
                <c:param name="form">axisagd002</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                    <td>
                    <div class="titulo" >
                <div style="float:left;">
                <img src="images/flecha.gif"/><axis:alt c="form" f="TITULO" lit="9001247"/>
                                      
                   </div>
                </div>
                        <!--campos-->
                        <table class="seccion">
       
        <tr>
            <td>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>    
                   <tr>
                        <axis:ocultar f="axisagd002" c="CTIPAGD">
                            <td class="titulocaja">
                                <b><axis:alt f="axisagd002" c="CTIPAGD" lit="9901935"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisagd002" c="TENTIDAD">
                            <td class="titulocaja" id="tit_TENTIDAD">
                                <b id="label_TENTIDAD"><axis:alt f="axisagd002" c="TENTIDAD" lit="9901936"/></b>
                            </td>
                        </axis:ocultar>
                   </tr>
                   
                   <tr>                   
                   <axis:ocultar f="axisagd002" c="CTIPAGD" dejarHueco="false"> <!-- TODO C -->
                        <td class="campocaja">
                            <select name = "CTIPAGD" id="CTIPAGD" style="width:95%;" size="1" onchange="f_onchange_tipoc(this.value)" 
                            title="<axis:alt f="axisagd002" c="CTIPAGD" lit="9901935"/>"
                            <axis:atr f="axisagd002" c="CTIPAGD" a="modificable=true&obligatorio=true&isInputText=false"/> 
                            class="campowidthselect campo campotexto">
                                <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd002" lit="108341"/> - </option>
                                <c:forEach var="lsttiposagenda" items="${__formdata.listValores.lsttiposagenda}">
                                    <option value = "${lsttiposagenda.CTIPAGD}"
                                        <c:if test="${lsttiposagenda.CTIPAGD == __formdata.CTIPAGD}">selected</c:if>>
                                        ${lsttiposagenda.TTIPAGD}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar> 
                    <axis:ocultar f="axisagd002" c="TENTIDAD" dejarHueco="false"> <!-- TODO C -->
                        <td class="campocaja" id ="td_TENTIDAD">
                            <input type="text" style="width:90%" class="campowidthinput campo campotexto" 
                             id="TENTIDAD" name="TENTIDAD" title="<axis:alt f="axisagd002" c="TENTIDAD" lit="9901936"/>" size="15" 
                             value="${__formdata.TENTIDAD}" 
                             <axis:atr f="axisagd002" c="TENTIDAD" a="modificable=false"/> />
                         </td>
                    </axis:ocultar> 
                   
                   </tr>
                   
                    <tr>
                        <!-- Titulo Título OBSnte -->
                        <axis:ocultar f="axisagd002" c="TTITOBS" dejarHueco="false">
                           <td class="titulocaja">
                           <b><axis:alt f="axisagd002" c="TTITOBS" lit="100785" /></b>
                           </td>
                        </axis:ocultar>  
                        
                    </tr>
                    <tr>
                        <axis:ocultar f="axisagd002" c="TTITOBS">                        
                            <!-- Título OBSnte -->
                            <td class="campocaja" colspan="2">
                                   <input type="text" class="campowidthinput campo" size="30" value="${__formdata.TTITOBS}" name="TTITOBS" id="TTITOBS" 
                                   style="width:95%;" maxlength="100"  title="<axis:alt f="axisagd002" c="TTITOBS" lit="100785" />" <axis:atr f="axisagd002" c="TTITOBS" a="modificable=true"/> />
                            </td>
                        </axis:ocultar>
                        
                         <!-- Titulo Título OBSnte -->
                           <axis:visible c="PUBLICO" f="axisagd002">
                           <td class="titulocaja" align="right">
                           <%--input type="hidden" name="CPRIVOBS" id="CPRIVOBS"  value="${__formdata.CPRIVOBS}"
                           <axis:atr f="axisagd002" c="CPRIVOBS" a="modificable=true&isInputText=false"/>%--%>
                            
                            <b><axis:alt f="axisagd002" c="PUBLICO" lit="1000068"/></b>     
                            <input type="checkbox" id="PUBLICO" name="PUBLICO" <c:if test="${__formdata.PUBLICO == 1}">checked</c:if> value="${__formdata.PUBLICO}" 
                                   <axis:atr f="axisagd002" c="PUBLICO" a="modificable=true&obligatorio=false"/> 
                                   onclick="f_but_publico(this)"/>
                            
                           <%--onclick="javascript:f_check_privado(this)" <c:if test="${__formdata.CPRIVOBS==1}">checked</c:if>--%>  
                           </td>
                           </axis:visible>
                       
                     
                    </tr>
                     
                    <c:if test="${__formdata.CTIPAGD == 2}">
	                    <tr>     
                            <td class="titulocaja">
                                <b id="TDESC"><axis:alt f="axisagd002" c="TDESC" lit="9910333"/></b>
                            </td>                      
	                        <td class="titulocaja">
	                            <b><axis:alt f="axisagd002" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
	                        </td>       
	                    </tr>
	                    <tr>
	                    <%--3482 SGM  17/04/2019  se agrega columna a apartado gestion agenda se corrige obligatoriedad de TDESC--%> 
                            <td class="campocaja">                             
                                <input type="text" name="TDESC" id="TDESC" class="campowidthinput campo campotexto" 
                                title="<axis:alt f="axisagd002" c="TDESC" lit="100588"/>"  value="${__formdata.TDESC}"
                                <c:if test="${!empty __formdata.IDDOCGEDOX}"><axis:atr f="axisagd002" c="TDESC" a="modificable=false&obligatorio=false"/></c:if>/>                               
                            </td>
                            <c:if test="${empty __formdata.IDDOCGEDOX}">
	                       		<td class="campocaja" colspan="2">   
		                            <input type="file" size="70" class="campowidthinput campo campotexto"  name="TFILE" id="TFILE" title="<axis:alt f="axisagd002" c="TFILE" lit="1000574"/>"/>                                                        
	                       		</td>
                           </c:if>
                           <c:if test="${!empty __formdata.IDDOCGEDOX}">
                           		<td class="campocaja" colspan="3">   
	                                <input type="text" size="70" class="campowidthinput campo campotexto"  name="TFILE" id="TFILE" value="${__formdata.TFILE}" 
	                                        title="<axis:alt f="axisper030" c="TFILE" lit="1000574"/>" <axis:atr f="axisper030" c="TFILE" a="modificable=false&obligatorio=false"/>/>                                                        
                           		</td>
                           </c:if>
	                    </tr>
                    </c:if>
                           
                    
                    <axis:ocultar f="axisagd002" c="TOBS" dejarHueco="false">
                    <tr>
                        <!-- Titulo Texto OBSnte -->
                        <td class="titulocaja">
                            
                            <b><axis:alt f="axisagd002" c="TOBS" lit="9001197" /></b>
                        </td>
                    </tr>
                    <tr>
                       <!-- Texto OBSnte -->
                       <!-- INI IAXIS-3482 JRVG 02/07/2020 -->
                       <td colspan="3" style="width:100%;"   class="campocaja">
                       <textarea maxlength="3000" rows="15" cols="50" class="campo campotexto" style="width:100%;"  
                       <axis:atr f="axisagd002" c="TOBS" a="modificable=true"/> name="TOBS" id="TOBS">${__formdata.TOBS}</textarea>
                       </td>
                      <!-- FIN IAXIS-3482 JRVG 02/07/2020 -->
                    </tr>
                    </axis:ocultar>
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>   
                       <tr>
                        <axis:ocultar f="axisagd002" c="CCONOBS">
                            <td class="titulocaja">
                                <b><axis:alt f="axisagd002" c="CCONOBS" lit="9000715"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axisagd002" c="FRECORDATORIO">
                            <td class="titulocaja" id="tit_FRECORDATORIO">
                                <b id="label_FRECORDATORIO"><axis:alt f="axisagd002" c="FRECORDATORIO" lit="9901674"/></b>
                            </td>
                        </axis:ocultar>
                      <axis:ocultar f="axisagd002" c="CESTOBS">
                            <td class="titulocaja">
                                <b><axis:alt f="axisagd002" c="CESTOBS" lit="9001191"/></b>
                            </td>
                        </axis:ocultar>
                    
                        <axis:ocultar f="axisagd002" c="FESTOBS" dejarHueco="false">
                        <td class="titulocaja">
                             <b><axis:alt f="axisagd002" c="FESTOBS" lit="9900983"/></b>
                        </td>
                        </axis:ocultar>
                                
                   </tr>
                   
                   <tr>                   
                   <axis:ocultar f="axisagd002" c="CCONOBS"> <!-- TODO C -->
                        <td class="campocaja">
                            <select name = "CCONOBS" id="CCONOBS" style="width:95%;" size="1" onchange="document.miForm.FRECORDATORIO.value='';f_cargar_propiedades_pantalla(); f_estado_conclusiones();"
                            title="<axis:alt f="axisagd002" c="CCONCEPTO" lit="9000715"/>"
                            <axis:atr f="axisagd002" c="CCONOBS" a="modificable=true&obligatorio=true&isInputText=false"/> 
                            class="campowidthselect campo campotexto">
                                <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd002" lit="108341"/> - </option>
                                <c:forEach var="conceptos" items="${__formdata.listValores.lstconcepto}">
                                    <option value = "${conceptos.CATRIBU}"
                                        <c:if test="${conceptos.CATRIBU == __formdata.CCONOBS}">selected</c:if>>
                                        ${conceptos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar> 
                    <axis:ocultar f="axisagd002" c="FRECORDATORIO" dejarHueco="false"> <!-- TODO C -->
                        <td class="campocaja" id ="td_FRECORDATORIO">
                            <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                             id="FRECORDATORIO" name="FRECORDATORIO" title="<axis:alt f="axisagd002" c="FRECORDATORIO" lit="9901674"/>" size="15" 
                             onchange="javascript:f_formatdate(this,'');"
                             value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FRECORDATORIO}'/>" 
                             <axis:atr f="axisagd002" c="FRECORDATORIO" a="modificable=true&obligatorio=false&formato=fecha"/> />
                             
                             <a id="icon_FRECORDATORIO" style="vertical-align:middle;" href="#">
                             <img id="popup_calendario_FRECORDATORIO" border="0" alt="<axis:alt c="FRECORDATORIO_TITLE" f="axisagd002" lit="108341"/>" 
                             title="<axis:alt c="FRECORDATORIO_TITLE" f="axisagd002" lit="108341"/>" src="images/calendar.gif"/>
                             </a>
                       
                        </td>
                    </axis:ocultar>                  
                   <axis:ocultar f="axisagd002" c="CESTOBS"> <!-- TODO C -->
                        <td class="campocaja">
                            <select name = "CESTOBS" id="CESTOBS" style="width:95%;" size="1" onchange="f_habilitar_fecha(this);"
                            title="<axis:alt f="axisagd002" c="CESTOBS" lit="9001191"/>"
                            <axis:atr f="axisagd002" c="CESTOBS" a="modificable=true&obligatorio=true&isInputText=false"/> 
                            class="campowidthselect campo campotexto">
                                <option value = ""> - <axis:alt c="COMBO_SNV" f="axisagd002" lit="108341"/> - </option>
                                <c:forEach var="conceptos" items="${__formdata.listValores.lstestados}">
                                    <option value = "${conceptos.CATRIBU}"
                                        <c:if test="${conceptos.CATRIBU == __formdata.CESTOBS}">selected</c:if>>
                                        ${conceptos.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>
                        </td>
                    </axis:ocultar>
                     <axis:ocultar c="FESTOBS" f="axisagd002" dejarHueco="false">
                        <td class="campocaja">
                             <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                             id="FESTOBS" name="FESTOBS" title="<axis:alt f="axisagd002" c="FESTOBS" lit="9900983"/>" size="15" 
                             onchange="javascript:f_formatdate(this,'')"
                             value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FESTOBS}'/>" 
                             <axis:atr f="axisagd002" c="FESTOBS" a="modificable=true&obligatorio=true&formato=fecha"/> />
                             <a id="icon_FESTOBS" style="vertical-align:middle;" href="#">
                             <img id="popup_calendario_FESTOBS" border="0" alt="<axis:alt c="FESTOBS_TITLE" f="axisagd002" lit="108341"/>" 
                             title="<axis:alt c="FESTOBS_TITLE" f="axisagd002" lit="108341"/>" src="images/calendar.gif"/>
                             </a>
                        </td>
                    </axis:ocultar>
                   </tr>
                   

                 
                    <tr>
                    <c:if test="${!empty __formdata.FALTA}">
                        <!-- Titulo Fecha Alta -->
                        <axis:ocultar f="axisagd002" c="FALTA" dejarHueco="false">
                        <td class="titulocaja">
                             <b><axis:alt f="axisagd002" c="FALTA" lit="9001192"/></b>
                        </td>
                        
                        </axis:ocultar>
                        </c:if>
                        <!-- Titulo Usuario Alta -->
                         <c:if test="${!empty __formdata.CUSUALT}">
                        <axis:ocultar f="axisagd002" c="CUSUALT" dejarHueco="false">
                        <td class="titulocaja">
                             <b><axis:alt f="axisagd002" c="CUSUALT" lit="9001630"/></b>
                        </td>
                        </axis:ocultar>
                        </c:if>
                    </tr>
                    <tr>
                        <c:if test="${!empty __formdata.FALTA}">
                        <axis:ocultar c="FALTA" f="axisagd002" dejarHueco="false">
                            <td class="campocaja">
                                 <input type="text" style="width:60%" class="campowidthinput campo campotexto" 
                                 id="FALTA" name="FALTA" title="<axis:alt f="axisagd002" c="FALTA" lit="9001192"/>" size="15" 
                                 onchange="javascript:f_formatdate(this,'')"
                                 value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FALTA}'/>" 
                                 <axis:atr f="axisagd002" c="FALTA" a="modificable=false&formato=fecha"/> />
                                 <a id="icon_FALTA" style="vertical-align:middle;" href="#">
                                 <img id="popup_calendario_FALTA" border="0" alt="<axis:alt c="FALTA_TITLE" f="axisagd002" lit="108341"/>" 
                                 title="<axis:alt c="FALTA_TITLE" f="axisagd002" lit="108341"/>" src="images/calendar.gif"/>
                                 </a>
                            </td>
                        </axis:ocultar>
                        </c:if>
                        <c:if test="${!empty __formdata.CUSUALT}">
                        <axis:ocultar f="axisagd002" c="CUSUALT" dejarHueco="false"> <!-- TODO C -->
                                <td class="campocaja">
                                    <select name = "CUSUALT" id="CUSUALT" style="width:95%;" size="1"  title="<axis:alt f="axisagd002" c="CUSUALT" lit="9001630"/>"
                                    <axis:atr f="axisagd002" c="CUSUALT" a="modificable=false&isInputText=false"/> 
                                    class="campowidthselect campo campotexto">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd002" lit="108341"/> - </option>
                                        <c:forEach var="usuarios" items="${__formdata.listValores.lstusuarios}">
                                            <option value = "${usuarios.CUSER}"
                                                <c:if test="${usuarios.CUSER == __formdata.CUSUALT}">selected</c:if>>
                                                ${usuarios.CUSER}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </axis:ocultar> 
                        </c:if>
                    </tr>
                   
                   
                </table>
                
                
                
                
                
                <axis:visible c="DSP_VISION" f="axisagd002">
                
                <tr id="GST_VISION">
                        <td align="left">
                                    <table class="area" align="center">
                                    <tr>
                                        <th style="width:100%;height:0px"></th>
                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                          <div style="float:left;">
                                            <img id="DSP_VISIBILIDAD_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('DSP_VISIBILIDAD', this)" style="cursor:pointer"/>
                                            <b><axis:alt f="axisagd002" c="DSP_VISIBILIDAD_LIT" lit="9901937"/></b>
                                            </div>
                                            
                                           
                                            
                                            <div style="clear:both;">
                                            <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>                                                                  
                        
                        
                
                <tr id="DSP_VISIBILIDAD_children" style="display:none">
                    <td class="campocaja" >
                    <table>
                    <tr>
                                        <th style="width:70%;height:0px"></th>
                                         <th style="width:30%;height:0px"></th>
                                        
                                    </tr>
                                    <tr>
                                    <td class="campocaja">
                    <c:set var="title2"><axis:alt f="axisagd002" c="TROLOBS" lit="9901939"/></c:set> 
                    <c:set var="title4"><axis:alt f="axisagd002" c="HABILITAR_VISIBILIDAD" lit="9901949"/></c:set> 
        
                
                   <axis:visible c="DSP_ROL" f="axisagd002">
                         <div class="separador">&nbsp;</div>  <div class="separador">&nbsp;</div>
                     <div class="displayspace"  >
                        <b> <axis:alt f="axisagd002" c="ROL" lit="9901961"/></b>
                        <div class="separador">&nbsp;</div>
                      <%int cont = 0;%>
                        <display:table name="${__formdata.listValores.lstvisionrol}" id="LISTAVISIBILIDAD"   export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_axisagd002.do?paginar=true&subseccion=DSP_VISIBILIDAD" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                        <c:set var="i"><%=cont%></c:set>
                         <axis:visible c="DESCTTIPVISION" f="axisagd002">
                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_AGD_VISION['DESCTTIPVISION']" style="width:60%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAVISIBILIDAD.OB_IAX_AGD_VISION['DESCTTIPVISION']}</div>
                        </display:column>
                         </axis:visible>
 
                        <axis:visible c="VISION_ROL" f="axisagd002">
                         <display:column title="${title4}" headerClass="sortable fixed" media="html" style="width:20%;" autolink="false"  >
                             <div class="dspIcons">
                             <%--select name = "VISION_ROL" id="VISION_ROL" onchange="f_marcar_combo_rol(this,${i});" style="width:95%;" size="1"  title="<axis:alt f="axisagd002" c="VISION_ROL" lit="9901949"/>"
                                    <axis:atr f="axisagd002" c="VISION_ROL" a="modificable=true&isInputText=false"/> 
                                    class="campowidthselect campo campotexto">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd002" lit="108341"/> - </option>
                                        <c:forEach var="lstvalor" items="${__formdata.listValores.lstsino}">
                                            <option value = "${lstvalor.CATRIBU}"
                                                <c:if test="${lstvalor.CATRIBU == LISTAVISIBILIDAD.OB_IAX_AGD_VISION['CVISIBLE']}">selected</c:if>>
                                                ${lstvalor.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select--%>
                                     <input type="checkbox" id="VISION_ROL" name="VISION_ROL" onclick="f_check_unoxuno(this,${i})"
                                     <c:if test="${LISTAVISIBILIDAD.OB_IAX_AGD_VISION['CVISIBLE'] == 1}">checked </c:if>/>
                                     <input type="hidden" id="TTIPVISION_ROL_${i}" name="TTIPVISION_ROL_${i}" value="${LISTAVISIBILIDAD.OB_IAX_AGD_VISION['TTIPVISION']}">
                                     <input type="hidden" id="VISION_ROL_${i}" name="VISION_ROL_${i}" value="${LISTAVISIBILIDAD.OB_IAX_AGD_VISION['CVISIBLE']}">
                                     
                             </div>
                         </display:column>
                         </axis:visible>
                      
                      <%cont++;%>
                        </display:table>
                    </div>
                    </axis:visible>
                   </td>
                   </tr>
                   <tr>
                    <axis:visible c="DSP_USUARIO_VISION" f="axisagd002">
                   <td class="campocaja">
                   
                         <div class="separador">&nbsp;</div>  <div class="separador">&nbsp;</div>
                         <div class="displayspace"  >
                         <b> <axis:alt f="axisagd002" c="USUARIO" lit="9900982"/></b>
                          <div class="separador">&nbsp;</div>
                         <c:set var="title1"><axis:alt f="axisagd002" c="DESCTTIPVISION" lit="100894"/></c:set> 
                         <c:set var="title2"><axis:alt f="axisagd002" c="HABILITAR_VISIBILIDAD" lit="9901949"/></c:set> 
                         <c:set var="title3"><axis:alt f="axisagd002" c="ELIMINAR" lit="1000127"/></c:set> 
                   
                      <%int contx = 0;%>
                      
                        <display:table name="${__formdata.listValores.lstvisionusu}" id="LISTAVISIBILIDADUSU"  export="false" class="dsptgtable"  pagesize="-1"
                        requestURI="axis_axisagd002.do?paginar=true&subseccion=DSP_VISIBILIDAD" sort="list" cellpadding="0" cellspacing="0">
                        <%@ include file="../include/displaytag.jsp"%>
                        <c:set var="i"><%=contx%></c:set>
                       <axis:visible c="DESCTTIPVISION" f="axisagd002">
                        <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_AGD_VISION['DESCTTIPVISION']" style="width:60%;" headerClass="sortable fixed"  media="html" autolink="false" >
                            <div class="dspText">${LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['DESCTTIPVISION']}</div>
                        </display:column>
                        </axis:visible>
 
                       <axis:visible c="VISION_USU" f="axisagd002">
                         <display:column title="${title2}" headerClass="sortable fixed" media="html" style="width:20%;" autolink="false"  >
                             <div class="dspIcons">
                                    <select name = "VISION_USU" id="VISION_USU" onchange="f_marcar_combo(this,${i});" style="width:95%;" size="1"  title="<axis:alt f="axisagd002" c="VISION_USU" lit="9901949"/>"
                                    <axis:atr f="axisagd002" c="VISION_USU" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                    class="campowidthselect campo campotexto">
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="COMBO_SNV" f="axisagd002" lit="108341"/> - </option>
                                        <c:forEach var="lstvalor" items="${__formdata.listValores.lstsino}">
                                            <option value = "${lstvalor.CATRIBU}"
                                                <c:if test="${lstvalor.CATRIBU == LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['CVISIBLE']}">selected</c:if>>
                                                ${lstvalor.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                    <input type="hidden" id="TTIPVISION_USU_${i}" name="TTIPVISION_USU_${i}" value="${LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['TTIPVISION']}">
                                     <input type="hidden" id="VISION_USU_${i}" name="VISION_USU_${i}" value="${LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['CVISIBLE']}">
                                     
                             </div>
                         </display:column>
                         </axis:visible>
                         
                         <axis:visible c="DELETE_USU" f="axisagd002">
                         <display:column title="${title3}" headerClass="sortable fixed" media="html" style="width:20%;" autolink="false"  >
                             <div class="dspIcons">
                                 <a href="javascript:void(0)"  onclick="f_descartar_registro('${LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['IDOBS']}', '${LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['CTIPVISION']}', '${LISTAVISIBILIDADUSU.OB_IAX_AGD_VISION['TTIPVISION']}')">
                                        <img border="0"
                                             alt='<axis:alt f="axisagd002" c="BT_DELETE" lit="9002140"/>'
                                             title='<axis:alt f="axisagd002" c="BT_DELETE" lit="9002140"/>'
                                             src="images/delete.gif"/>
                                    </a>
                                     
                             </div>
                         </display:column>
                         </axis:visible>
                      
                      <%contx++;%>
                        </display:table>
                 
                    </div>
                    </td>
                    </axis:visible>
                   
                        </tr>
                        <axis:visible c="BT_ANADIR" f="axisagd002">
                        <tr>
                        
                            <td></td>
                            <td align="center"> 
                             <input type="button"  class="boton" name="BT_ANADIR" id="BT_ANADIR" value="<axis:alt f='axisagd002' c='BT_ANADIR' lit='9901957'/>" onclick="f_but_buscar()" />
                            </td>
                        </tr>
                        </axis:visible>
                    </table>
                </td>
            </tr>
            </table>
                
                
                
                
                
                
                
                </td>
                </tr>
                
                
                
                
                
                
            
                
                
            </td>
        </tr>
            </axis:visible>
    </table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->
        </td>
        </tr>
    </table>
             <div class="separador">&nbsp;</div>
    </form>
    <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FALTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FALTA", 
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FESTOBS",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FESTOBS", 
        singleClick    :    true,
        firstDay       :    1
    });
    Calendar.setup({
        inputField     :    "FRECORDATORIO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FRECORDATORIO", 
        singleClick    :    true,
        firstDay       :    1
    });
    
    
    </script>
    <!-- fin Sólo si vamos a tener un campo fecha !-->
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisagd002</c:param>
   <c:param name="__botones"><axis:ocultar f="axisagd002" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisagd002" c = "BT_ACEPTAR" dejarHueco="false">,guardar</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


