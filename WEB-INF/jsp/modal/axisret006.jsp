<%/*
*  Fichero: Axisretr006.jsp
*  Fecha: 12/09/2012
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<%@ page import="java.util.List" %>
<% String pantalla = "axisret006"; %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
  
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
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            var modo = "${__formdata.CMODO}";
            parent.f_cerrar_axisret006();
       }
       
       function f_actualizar_agente(){
             //if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("modal_axisret006.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.axisret006Form.CAGENTE), this, objJsMessages.jslit_cargando);                 
              //}  
            }   
            
       function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);

                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                       
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                       
                    }else{
                        
                        objDom.setValorPorId("TAGENTE",""); 
                        objDom.setValorPorId("CAGENTE","");
                    }
            
                
                }
             
            }  
       
       function f_onload(){
        
             <c:if test="${__formdata.OK=='OK'}" >
                    //alert('<axis:alt f="axisret006" c="LIT_MESA_OK" lit="1000405" />');
                    parent.f_aceptar_axisret006();
            </c:if>
                                              
          
            f_cargar_propiedades_pantalla();
       }            

       function f_but_1000102(){
        
                try {
        	
                objAjax.invokeAsyncCGI("modal_axisret006.do", callbackajaxGetTomador, 
                "operation=ajax_get_tomador", this, objJsMessages.jslit_actualizando_registro);
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
       
       
       }
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
              
             
                var parti = document.axisret006Form.PRETORNO.value;
                if(f_comprobar_negativo(parti) == 0 )
                    objUtiles.ejecutarFormulario ("modal_axisret006.do", "aceptar", document.axisret006Form, "_self", objJsMessages.jslit_cargando);                      
                else
                     alert("<axis:alt f='axisret006' c='ALERTNEG' lit='9902884'/>");
            }
       }
        
       function callbackAjaxGuardar(ajaxResponseText) {
                //alert("volver");
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
       }    
           
            function f_actualizar_valor(){       
                if(document.axisret006Form.LIDER.checked){
                    document.axisret006Form.LIDER.value=1;                
                    document.axisret006Form.CLIDER.value=1;                
                }else{
                    document.axisret006Form.LIDER.value=0;                
                    document.axisret006Form.CLIDER.value=0;                
                }            
            
            } 
           
            
            function f_comprobar_negativo(valor){
            
                if(valor<0){
                   return 1;
                }else
                    return 0;
            }
            
            /* ************************************************************************************************** */
            /* ******************************************* FUNCIONES ******************************************** */
            /* ************************************************************************************************** */
            
            // bug 0025580       
            function f_onclickCheckbox(thiss) {
                thiss.value =  ((thiss.checked)?1:0);
                objDom.setValorPorId(thiss.id, thiss.value);
            }            
            
            function f_get_persona(SPERSON){
            //alert("DOS : "+SPERSON);
             objAjax.invokeAsyncCGI("modal_axisret006.do", callbackajaxGetPersona, 
              "operation=ajax_get_persona&SPERSON=" + SPERSON , this, objJsMessages.jslit_actualizando_registro);
            }
        
            function callbackajaxGetPersona(ajaxResponseText) {
                var doc=objAjax.domParse(ajaxResponseText);
                //alert(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    
                    document.axisret006Form.NNUMIDE.value = '';
                    document.axisret006Form.TDESCRI.value  = '';
                    document.axisret006Form.SPERSON.value  = '';
                    
                    var TNOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");                    
               
                    var TAPELLI1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");                    
               
                    var TAPELLI2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");                    
               
                    var CTIPIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0) : "");
               
                    var NNUMIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("NNUMIDE")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0) : ""); 
                    
                    var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : ""); 
               
                    var contactos = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CONTACTOS")[0]))? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("CONTACTOS"), 0, 0) : ""); 

                    for (var i = 0; i < objDom.numeroDeTags(doc, "CONTACTOS") ; i++) {
                        var CTIPCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPCON")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCON"), i, 0) +" " : "";
                            if (CTIPCON == 1 || CTIPCON == 5 || CTIPCON == 6) {
                                var TVALCON = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TVALCON")[0]) ? 
                                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("TVALCON"), i, 0) +" " : "";
                                
                                break;
                                
                            }
                     }
                    
                    
                    document.axisret006Form.NNUMIDE.value = NNUMIDE;
                    document.axisret006Form.TDESCRI.value = TAPELLI1+""+TAPELLI2+" ,"+TNOMBRE;
                    
                    objDom.setValorPorId("SPERSON", SPERSON); 
                     
                  
                }
            } 
            
     /* ************************************************************************************************* */
      /* **************************************** axisper021 ********************************************* */
      /* ************************************************************************************************* */
       
      function f_abrir_axisper021 () {
              //alert("dddd");
              var SSEGURO = "${__formdata.SSEGURO}";
              var CAGENTE = "${__formdata.CAGENTE}";
              //alert(CAGENTE+"*****"+SSEGURO);
            // bug 25691 
           // objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO+"&CONDICION=PERSONA_OPERATIVA&ORIGEN=AXISRET006");
       // JLV 13/06/2013 bug 27267/146266 se cambia personas PERSONAS_PRIVADAS por  PERSONAS_PUBPRIV para que muestre 
       // en los beneficiarios a las personas sin restricciones 
       objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO+"&CONDICION=PERSONA_OPERATIVA&ORIGEN=AXISRET006");

      }
      
      function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
      }   
      
      function f_cerrar_axisper021(){
         f_cerrar_modalespersona("axisper021");
      }   
      
      function f_nova_persona(){
            //alert("NOVA PERSONA: ");
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE}";
            //alert(CAGENTE);
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }
      
      function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
      } 
      
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        //alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);
        
        f_cerrar_modalespersona(modal);
        
        //alert("Em cerrar persona2");
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        document.axisret006Form.ORIGEN.value = porigen;
        document.axisret006Form.SNIP.value = SNIP;
        //document.axisret006Form.SPERSON.value = SPERSON;
        document.axisret006Form.CAGENTE_VISIO.value = CAGENTE;
        
        //alert("****"+CAGENTE);
        
         if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("modal_axisret006.do?SPERSON="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }
      

      function f_actualizar_persona(v){
          var url="modal_axisret006.do?operation=buscarpersonaajaxjson&v="+v;
          jQuery.ajax({
              url: url,
              dataType: 'json',
              success: callBack_actualizar_persona
          });
      }   

      function callBack_actualizar_persona(p) {
          document.getElementById('TDESCRI').value = p.JSON2.NOMBRE;
          document.getElementById('SPERSON').value = p.JSON2.CODI;
      }

    
        function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
               //alert(ajaxResponseText+"*************");
                var doc = objAjax.domParse(ajaxResponseText);
        
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     //alert("antes");
                     objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   
                     var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                     var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                     var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                     
                     //alert(NOMBRE);
                     //alert(APELLIDO1);
                     //alert(APELLIDO2);
                     objDom.setValorPorId("TDESCRI", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);
                     objDom.setValorPorId("SPERSON", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));
                     
                     objDom.setValorPorId("TNOMBRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0));
                     objDom.setValorPorId("TAPELLI1", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0));
                     objDom.setValorPorId("TAPELLI2", objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0));
        
                     
                }          
             
            }catch(e){}
            }       
            
 
            
         
            
            
            
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisret006Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">                        
            <input type="hidden" name="NORDEN" value="${__formdata.axisctr_retorno.NORDAGE}">
            <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}">
            <input type="hidden" name="CAGENTE" id="CAGENTE" value="">
            <input type="hidden" name="IDCONVENIO" id="IDCONVENIO" value="${__formdata.IDCONVENIO}">
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="">
            <input type="hidden" name="SNIP" id="SNIP" value="">
             <input type="hidden" name="TNOMBRE" id="TNOMBRE" value="${__formdata.TNOMBRE}">
              <input type="hidden" name="TAPELLI2" id="TAPELLI1" value="${__formdata.TAPELLI1}">
               <input type="hidden" name="TAPELLI1" id="TAPELLI2" value="${__formdata.TAPELLI2}">
            <input type="hidden" name="CAGENTE_VISIO" id="CAGENTE_VISIO" value="">
            <input type="hidden" name="SPERSON_SELECTED" id="SPERSON_SELECTED" value="${__formdata.SPERSON_SELECTED}"/>
    
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                          <axis:alt f="axisret006" c="TIT_AXISCTR014" lit="9904183" />
                </c:param>
                <c:param name="producto"><axis:alt f="axisret006" c="PRODUCTO_CORR" lit="9904183" /></c:param>
                <c:param name="form">axisret006</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisret006" c="PERSONAS" lit="102073"/></c:param>
                    <c:param name="nid">axisper021</c:param>
            </c:import> 
            
            <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f="axisret006" c="PERSONAS" lit="102073"/></c:param>
                    <c:param name="nid">axisper022</c:param>
            </c:import> 
           
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Codigo -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisret006" c="NNUMIDE" lit="1000109" /></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisret006" c="DESCRIPCION" lit="100588" /></b>
                                        </td>
                                    </tr>    
                                    <tr>
                                    <axis:ocultar f="axisret006" c="NNUMIDE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="5">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE"  title="<axis:alt f="axisret006" c="NNUMIDE" lit="100584"/>"  style="width:15%"
                                        title="<axis:alt f="axisret006" c="NNUMIDE" lit="100584" />" <axis:atr f="axisret006" c="NNUMIDE" a="modificable=false&obligatorio=true"/>  onchange="f_actualizar_persona(this.value)"/>
                                        
                                        
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>                                 
                                        <input type="text" class="campo campotexto" value="${__formdata.TNOMBRE} ${__formdata.TAPELLI1} ${__formdata.TAPELLI2} " name="TDESCRI" id="TDESCRI" title="<axis:alt f="axisret006" c="TDESCRI" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                        title="<axis:alt f="axisret006" c="TDESCRI" lit="100584"/>"/>
                                    </td>
                                    </axis:ocultar>                       
                                    </tr>
                                    <tr>
                                      <!-- % PARTICIPACION -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisret006" c="PRETORNO" lit="104818" /></b>
                                        </td>
                                    </tr>    
                                    <tr>    
                                        <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" id="PRETORNO" name="PRETORNO" size="15"
                                            value="<fmt:formatNumber pattern="###,##0.00" value='${__formdata.PRETORNO}'/>" formato="decimal" <axis:atr f="axisret006" c="PRETORNO" a="modificable=true&obligatorio=true&formato=decimal"/> title="<axis:alt f="axisret006" c="CCOMISI" lit="104818"/>" />
                                            </td>
                                    </tr>
                                    
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisret006</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
                      
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>
