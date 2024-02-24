<%/*
*  Fichero: axisper036.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisper036();
       }
       
       function f_but_aceptar(){
        
            if (objValidador.validaEntrada()){
                objUtiles.ejecutarFormulario("modal_axisper036.do", "guardar", document.axisper036Form, "_self", objJsMessages.jslit_cargando);   
            }
       }
       
       function f_onload(){
        	f_cargar_propiedades_pantalla();
            var ok = '${__formdata.OK}';
            var PSPERSON =document.axisper036Form.SPERSON.value;
            if(ok == '0'){
                parent.f_aceptar_axisper036(PSPERSON);
            }
       }
       
       function f_onchange_CTIPPERcerca(TIDENTI) {
            formdataTIDENTI = '${__formdata.TPERSONA}';
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisper036.do", "form", document.axisper036Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
       function f_abrir_axisper021 () {
            var SSEGURO = "${__formdata.SSEGURO}";
            var CAGENTE = "${__formdata.CAGENTE}";
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE+"&SSEGURO="+SSEGURO);
      }
      
      function f_cerrar_axisper022(){
        f_cerrar_modalespersona("axisper022");
      }   
      
      function f_cerrar_axisper021(){
         f_cerrar_modalespersona("axisper021");
      }   
      
      function f_nova_persona(){
            //alert("al entrar en el parent***");
            f_cerrar_modalespersona("axisper021");
            var CAGENTE = "${__formdata.CAGENTE_PERSN}";
            //alert(CAGENTE);
            objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PRIVADAS&CAGENTE="+CAGENTE);  
      }
      
      function f_cerrar_modalespersona(modal){
        objUtiles.cerrarModal(modal);
      } 
      
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        //alert("Em cerrar persona "+SPERSON+" CAGENTE : "+CAGENTE+" SNIP :"+SNIP);
        
        f_cerrar_modalespersona(modal);
        
       // alert("Em cerrar persona2 "+CAGENTE);
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
        
        document.axisper036Form.ORIGEN.value = porigen;
        document.axisper036Form.SNIP.value = SNIP; 
        document.axisper036Form.CAGENTE_VISIO.value = CAGENTE;
        
        if (!objUtiles.estaVacio(SPERSON)){          
          objAjax.invokeAsyncCGI("modal_axisper036.do?SPERSON_REL="+SPERSON+"&CAGENTE1="+CAGENTE, callbackAjaxActualitzaPersona, "operation=ajax_actualizar_persona", this, objJsMessages.jslit_cargando);
        }
      }

      function callbackAjaxActualitzaPersona (ajaxResponseText) {
            try{
    
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {   
                     
                     objDom.setValorPorId("NNUMIDE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0));
                   
                     var APELLIDO1 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0) : "");
                     var APELLIDO2 = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI2")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0) : "");
                     var NOMBRE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("TNOMBRE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0) : "");
                     var CTIPIDE = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPIDE")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPIDE"), 0, 0) : "");
                     var CTIPPER = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPPER")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPPER"), 0, 0) : "");   
                     var SPERSON = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPERSON")[0]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0) : "");
                     objDom.setValorPorId("NOMBRE", NOMBRE+' ' + APELLIDO1 +' '+ APELLIDO2);                     
                     objDom.setValorPorId("SPERSON_REL", objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0));         
                     document.axisper036Form.SPERSON_REL.value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPERSON"), 0, 0);
                     
                   //  objDom.setValorPorId("CTIPIDE", CTIPIDE);
                  //   objDom.setValorPorId("CTIPPER", CTIPPER);
                     objDom.setValorPorId("SPERSON", SPERSON);
                   //  objDom.setValorPorId("DIRECCION", DIRECCION);
                     
                }          
             
            }catch(e){}
      }
      
        function f_habilitar_campos(){
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
           
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_022" f="axisper036" lit="1000214"/></c:param>
            <c:param name="nid" value="axisper022"/>
        </c:import> 
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt c="TITULO_021" f="axisper036" lit="1000235"/></c:param>
            <c:param name="nid" value="axisper021"/>
        </c:import>    
        <form name="axisper036Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
            <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}"/>
            <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
            <input type="hidden" id="SPEREAL" name="SPEREAL" value="${__formdata.SPEREAL}"/>
            <input type="hidden" id="SPERSON_REL" name="SPERSON_REL" value="${__formdata.SPERSON_REL}"/>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" id="CMODO" name="CMODO" value="${__formdata.CMODO}"/>
            <input type="hidden" id="SPERLRE" name="SPERLRE" value="${__formdata.SPERLRE}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisper036" c="formulario" lit="9904585" /></c:param>
                <c:param name="producto"><axis:alt f="axisper036" c="producto" lit="9904585" /></c:param>
                <c:param name="form">Axisper036</c:param>
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
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                    </tr>
                                    
                                    <tr>
                                        <!-- Número identificación -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisper036" c="NIDENTIFICACION" lit="9904434"/></b>
                                        </td>
                                        <!-- Nombre persona -->
                                        <td class="titulocaja"  colspan="2">
                                            <b><axis:alt f="axisper036" c="NOMBREPER" lit="105940"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td class="campocaja">
                                            <input type="hidden" name="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axisper036" c="SPERSON" a="modificable=false&obligatorio=true"/> /> 
                                            <input type="text" id="NNUMIDE" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto" style="width:60%"
                                                title="<axis:alt f="axisper036" c="NNUMIDE" lit="9904434"/>"
                                                <axis:atr f="axisper036" c="NNUMIDE" a="modificable=false&obligatorio=true"/> /> 
                                           <c:if test="${__formdata.CMODO == 'NEW'}">
                                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  
                                           </c:if>
                                        </td>
                                        <td class="campocaja" colspan="2">
                                            <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto" style="width:90%"
                                                <axis:atr f="axisper036" c="NOMBRE" a="modificable=false&obligatorio=true"/> /> 
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Tipo persona -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisper036" c="CTIPO" lit="100565"/></b>
                                        </td>
                                        <!-- Tipo identificacion -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisper036" c="CSUBTIPO" lit="9904577"/></b>
                                        </td>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisper036" c="CCARGO" lit="9902638"/></b>
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisper036" c="CCANAL" lit="9901176"/></b>
                                        </td> 
                                    </tr>
                                    <tr>
                                         <td class="campocaja">
                                            <select name = "CTIPO" id="CTIPO"  style="width:100%;"  size="1" <axis:atr f="axisper036" c="CTIPO" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                                  class="campowidthselect campo campotexto" title="<axis:alt f="axisper036" c="CTIPO" lit="100565"/>">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper036" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.tipoList}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTIPO)&& estado.CATRIBU == __formdata.CTIPO}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                             <select name = "CSUBTIPO" id="CSUBTIPO"  style="width:100%;" value="" 
                                                    size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper036" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.subtipoList}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CSUBTIPO)&& estado.CATRIBU == __formdata.CSUBTIPO}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "CCARGO" id="CCARGO" size="1" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisper036" c="CCARGO" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper036" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.cargoList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CCARGO)&& tipo.CATRIBU == __formdata.CCARGO}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "CCANAL" id="CCANAL" size="1" class="campowidthselect campo campotexto" title="<axis:alt f="axisper036" c="CCANAL" lit="9901176"/>"
                                                <axis:atr f="axisper036" c="CCANAL" a="modificable=true&obligatorio=true&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper036" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.canalList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CCANAL)&& tipo.CATRIBU == __formdata.CCANAL}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>								
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisper036</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            
            
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

