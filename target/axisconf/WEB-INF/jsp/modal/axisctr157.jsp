<%/*
*  Fichero: axisctr157.jsp - Alta/Mod. Plan de pensiones
*
*  Fecha: 28/12/2009
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
    <title><fmt:message key="9900904"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>  
   
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {         
        var ok   = "${__formdata.ok}";
        var ccod = "${__formdata.CCODPLA2}";
        
        if (!objUtiles.estaVacio(ok)) parent.f_cerrar_modal2('axisctr157');
        if (!objUtiles.estaVacio(ccod))
            {
          document.miForm.CCODDGS.value = "${__formdata.CCODDGS2}";
          document.miForm.TNOMBRE.value = "${__formdata.TNOMBRE2}";
          document.miForm.CCODPLA.value = "${__formdata.CCODPLA2}";            
          document.miForm.CLISTBLANC.value = "${__formdata.CLISTBLANC2}";            
            }
         revisarEstilos();   
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisctr157');
        }

        function f_but_aceptar() {
                var mod = "${__formdata.MOD}";
                
                if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axisctr157.do", "grabar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    
        function f_escull_depo() {
                f_abrir_modal("axispen006",null);                
        }     

        function f_cerrar_modal() {
                objUtiles.cerrarModal("axispen006");                       
                //f_buscar_planes();            
            }        

            
        function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
           } 


            function f_onchange_depo(CDEP){
               objAjax.invokeAsyncCGI("modal_axisctr157.do?CDEP2="+CDEP, callbackAjaxDepo, "operation=ajax_depo", this, objJsMessages.jslit_cargando);               
            }            

        function f_aceptar_axispen06(CODDEP){
        objUtiles.cerrarModal("axispen006");  
        f_onchange_depo(CODDEP);
        }            

      function callbackAjaxDepo (ajaxResponseText) {
            try{
            //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                var elementos = doc.getElementsByTagName("element");
                
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {  

                     document.miForm.CDEPDGS.value = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODDEP"), 0, 0);
                     
                     for (var i = 0; i < objDom.numeroDeTags(doc, "PERSONA") ; i++) {                                                                                                                                                                                                                  
                            document.miForm.TDEPDGS.value = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TAPELLI1")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), i, 0) : "";
                                }
                     
                     }else{
                        document.miForm.CDEPDGS.value = "";
                        document.miForm.TDEPDGS.value = "";
                     }
                }catch(e)    {                  
                     //alert("<fmt:message key="9900958"/>");108879
                        document.miForm.CDEPDGS.value = "";
                        document.miForm.TDEPDGS.value = "";                     
                   }      
                   
            }    
    </script>    
</head>

<body onload="f_onload()">
<c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    <form name="miForm" action="f_onload()" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><fmt:message key="9001770"/></c:param>     
            <c:param name="formulario"><fmt:message key="9001770"/></c:param> 
            <c:param name="form">axisctr157</c:param>
        </c:import>

        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispen006|<fmt:message key="9900863"/><%-- Cercador de depositaries --%>
                </c:param>
         </c:import>        
        <%--<input type="hidden" name="operation" value=""/>        --%>
        <input type="hidden" name="operation" value="" />
        <input type="hidden" id="CASEG" name="CASEG" value="${__formdata.CASEG}"/>       
        <input type="hidden" id="MOD" name="MOD" value="${__formdata.MOD}"/>       
            
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                              <table class="area" align="center">
                                    <tr>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:30%;height:0px"></th>
                                    </tr>

<b><% System.out.println("atributo parametro : " + request.getParameter("parametro")); %></b>


<%-- if (!request.getParameter("parametro").equalsIgnoreCase("alta")) { --%>
                                    

                                    
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt c="CODDGS" f="axisctr157" lit="9000600"/></b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt c="NOMBRE" f="axisctr157" lit="105940"/></b>      
                                        </td>
                                        <%-- Pertany a llista blanca 
                                        <td class="titulocaja">
                                            <b><fmt:message key="9901034"/></b>                      
                                        </td>    --%>                                      
                                    </tr>

                                    <tr>
                                            <td class="titulocaja">
                                                  
                                                <input type="text" name="CCODDGS" value="${__formdata.CCODDGS}" 
                                                class="campowidthinput campo campotexto_ob" style="width:80%"
                                                <axis:atr f="axisctr157" c="CCODDGS" a="modificable=false"/> /> 
                                                <%--<img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021()" style="cursor:pointer"/>  --%>
                                            </td>
                                            <td class="titulocaja">
                                                                                        
                                                <input type="text" name="TNOMBRE" value="${__formdata.TNOMBRE}" 
                                                class="campowidthinput campo campotexto_ob" 
                                                style="width:100%"
                                                <axis:atr f="axisctr157" c="TNOMBRE" a="modificable=false"/> /> 
                                            </td>
                                            <%--
                                            <td class="campocaja">
                                                <axis:ocultar f="axisctr157" c="CLISTBLANC" dejarHueco="false">
                                                <input type="checkbox" id="CLISTBLANC" name="CLISTBLANC" onclick="this.value = this.checked ? 1 : 0"
                                                <c:if test="${__formdata.CLISTBLANC == 1}">checked</c:if>  
                                                value = "${__formdata.CLISTBLANC}"
                                                <axis:atr f="axisctr157" c="CLISTBLANC" a="modificable=true"/> />
                                                </axis:ocultar> 
                                            </td>   
                                            --%>
                                    </tr>                                                                
                                   <tr>                                  
                                       <td class="titulocaja">
                                           <b><axis:alt c="CDEPDGS_LAB" f="axisctr157" lit="9900832"/></b>
                                        </td>
                                        <td class="titulocaja">
                                           <b><axis:alt c="TDEPDGS_LAB" f="axisctr157" lit="105940"/></b>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                    <c:choose>
                                    <c:when test="${!empty __formdata.CDEPDGS}">
                                            <td class="titulocaja">                                                    
                                                <input type="text" name="CDEPDGS" id="CDEPDGS" value="${__formdata.CDEPDGS}" 
                                                    class="campowidthinput campo campotexto_ob" style="width:80%" onchange="f_onchange_depo(this.value)"   
                                                    <axis:atr f="axisctr157" c="CDEPDGS" a="modificable=false&obligatorio=true"/> 
                                                    alt="<fmt:message key="800636" />" title="<fmt:message key="9900832" />"/>
                                            </td>         
                                     </c:when>
                                     <c:otherwise>
                                            <td class="titulocaja">                                                    
                                                <input type="text" name="CDEPDGS" id="CDEPDGS" value="${__formdata.CDEPDGS}" 
                                                    class="campowidthinput campo campotexto_ob" style="width:80%" onchange="f_onchange_depo(this.value)"   
                                                    <axis:atr f="axisctr157" c="CDEPDGS" a="modificable=true&obligatorio=true"/> 
                                                    alt="<fmt:message key="800636" />" title="<fmt:message key="9900832" />"/>
                                                    <img id="find" border="0" src="images/find.gif" onclick="f_escull_depo()" style="cursor:pointer"/>
                                            </td>                                              
                                     </c:otherwise>
                                     </c:choose>           
                                            <td class="titulocaja">
                                                <input type="text" name="TDEPDGS" value="${__formdata.TDEPDGS}" 
                                                class="campowidthinput campo campotexto_ob" 
                                                style="width:100%"
                                                <axis:atr f="axisctr157" c="TDEPDGS" a="modificable=false&obligatorio=true"/> /> 
                                            </td>      
                                    </tr>
                                    
                                    <%---- Parte campos relacio --%>

                                    
                                    <tr>
                                                        <td class="titulocaja">
                                                            <b id="label_CTIPBAN"><fmt:message key="1000374" /></b>
                                                        </td>

                                                        <td class="titulocaja">
                                                            <b id="label_CBANCAR"><fmt:message key="100965" /></b>
                                                        </td>
                                        <%-- CTRASP de moment comentat 
                                        <td class="titulocaja">
                                            <b><fmt:message key="9901251"/></b>                      
                                        </td>                           --%>              
                                    </tr>

                                    <tr>
                                                         <td class="campocaja">
                                                             <select name = "CTIPBAN" id="CTIPBAN" style="width:95%" <axis:atr f="axisctr093" c="CTIPBAN" 
                                                             a="modificable=true&obligatorio=true&isInputText=false"/>  size="1" title="<fmt:message key="9001200" />" class="campowidthselect campo campotexto">
                                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                                    <c:forEach var="listado" items="${listValores.tipCCC}">
                                                                        <option value = "${listado.CTIPBAN}"
                                                                            <c:if test="${listado.CTIPBAN == __formdata.CTIPBAN}">selected</c:if>>
                                                                            ${listado.TTIPO}
                                                                        </option>
                                                                    </c:forEach>
                                                                </select>                                                             
                                                        </td>              
                        
                                                       <td class="campocaja" obligatorio="true">
                                                        <input type="text" class="campowidthinput campo campotexto_ob" id="CBANCAR" name="CBANCAR" 
                                                        <axis:atr f="axisctr093" c="CBANCAR" a="modificable=true&obligatorio=true" /> size="15" title="<fmt:message key="100965" />"
                                                         value="${__formdata.CBANCAR}"/>
                                                       </td>
                                                       
                                            
                                            <%--<td class="campocaja"> CTRASP de moment comentat Posa listblanc pero es CTRASP
                                                <axis:ocultar f="axisctr157" c="CLISTBLANC" dejarHueco="false">
                                                <input type="checkbox" id="CLISTBLANC" name="CLISTBLANC" onclick="this.value = this.checked ? 1 : 0"
                                                <c:if test="${__formdata.CLISTBLANC == 1}">checked</c:if>  
                                                value = "${__formdata.CLISTBLANC}"
                                                <axis:atr f="axisctr157" c="CLISTBLANC" a="modificable=true"/> />
                                                </axis:ocultar> 
                                            </td>    --%>
                                            
                                    </tr>                                           
                       </table>
                    </table>
                    <div class="separador">&nbsp;</div>                

                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>                        
                </td>
            </tr>
        </table>
        
        <!--<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar </c:if>-->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param> 
        </c:import>
    
    </form>

        <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FALTA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FALTA", 
                singleClick    :    true,
                firstDay       :    1
            });
             Calendar.setup({
                inputField     :    "FBAJA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FBAJA", 
                singleClick    :    true,
                firstDay       :    1
            });
            Calendar.setup({
                inputField     :    "FALTAcerca",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FALTAcerca", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>

    
    <c:import url="../include/mensajes.jsp"/>



</body>
</html>