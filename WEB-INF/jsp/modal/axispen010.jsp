<%/*
*  Fichero: axispen010.jsp
*
*  Fecha: 15/12/2009
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
    <title><fmt:message key="9900844"/></title> <%-- Buscador de promotors --%>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
     
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {                                 
            revisarEstilos();               
            document.getElementById("ramoProducto").focus();
            
        }
        
        
        
           function f_cargar_productos_combo(){           
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){                 
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else{                    
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                 }
                objAjax.invokeAsyncCGI("modal_axispen010.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                    "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO), this, objJsMessages.jslit_cargando);
                   
            }     
            
            function callbackAjaxCargarProductos (ajaxResponseText){                 
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");                                        
                    var SPRODUCCombo = document.miForm.SPRODUCTO;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <fmt:message key="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {                           
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   amagarDisplay();

                }
            }            
        
         function amagarDisplay(){
                try{                                       
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
        
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispen010');
        }
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) {                   
                var CCODPLA = objDom.getValorPorId("CODPLA");                
                var CRAMO = objDom.getValorPorId("CRAMO");
                var SPRODUC = objDom.getValorPorId("SPRODUCTO");
                var NPOLIZA = objDom.getValorPorId("NPOLIZA");                      
                var CTIPIDE = objDom.getValorPorId("CTIPIDE");               
                var NNUMIDE = objDom.getValorPorId("NNUMIDE");                  
                parent.f_aceptar_axispen10(CRAMO,SPRODUC,NPOLIZA,CCODPLA,CTIPIDE,NNUMIDE);                                
                }
        }
        
    </script>    
</head>

<body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><fmt:message key="9900844"/></c:param>     <%-- Buscador de promotores --%>
                <c:param name="formulario"><fmt:message key="9900844"/></c:param> <%-- Buscador de promotores --%>
                <c:param name="form">axispen010</c:param>
        </c:import>
            
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="CESTADO2" name="CESTADO2" value="${__formdata.CESTADO}"/>       
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>       
        
        <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" name="SSEGURO" id="SSEGURO" value=""/>    
        <input type="hidden" name="PRODUCTO" id="PRODUCTO" value=""/>    
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:10%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        
                                    </tr>
                                    <tr>
                                    
                                        <axis:visible f="axispen010" c="CRAMO" > <!-- TODO C -->
                                            <td class="titulocaja">
                                                <b><axis:alt f="axispen010" c="CRAMO" lit="100784"></axis:alt></b>   <%-- Ram --%>
                                            </td>
                                        </axis:visible>
                                
                                        <axis:visible f="axispen010" c="SPRODUC"> <!-- TODO C -->
                                            <td class="titulocaja"  colspan="2">
                                                <b><axis:alt f="axispen010" c="SPRODUC" lit="100829" /></b>       <%-- Producte --%>                                 
                                            </td>
                                        </axis:visible>
                                    </tr>                                    
                                     <tr>                                    
                                        <axis:visible f="axispen010" c="CRAMO" > <!-- TODO C -->
                                            <td class="campocaja">
                                                <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos_combo()" class="campowidthselect campo campotexto">
                                                    <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="108341"/> - </option>
                                                    <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                        <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                            <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                            ${ramos.TRAMO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:visible>      
                                        <axis:visible f="axispen010" c="axispen010_comboProductos"> <!-- TODO C -->
                                            <td class="campocaja" colspan="2">
                                                <select name = "SPRODUCTO" style="width:95%;" id ="SPRODUCTO" size="1" onchange=""  class="campowidthselect campo campotexto">
                                                    <option value = "null"> - <fmt:message key="103155"/> - </option>
                                                    <c:forEach var="productos" items="${sessionScope.axispen010_comboProductos}">
                                                        <option value = "${productos.SPRODUC}/${productos.TTITULO}"
                                                            <c:if test="${__formdata.SPRODUC != 'null' && productos.SPRODUC == __formdata.SPRODUC}">selected</c:if>>
                                                            ${productos.TTITULO}                            
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </axis:visible>
                                     </tr>                                    
                                     <tr>
                                         <axis:visible f="axispen010" c="NPOLIZA"  >
                                            <td class="titulocaja"> 
                                                <b id="label_NPOLIZA"><fmt:message key="9001639"/></b> <%-- Polisa --%>
                                            </td>
                                        </axis:visible>                                    
                                        <axis:visible f="axispen010" c="CODPLA"  >
                                            <td class="titulocaja" colspan="2"> 
                                                <b id="label_CCODDEP"><fmt:message key="9900843"/></b> <%-- Codi pla --%>
                                            </td>
                                        </axis:visible>                                      
                                        <axis:visible f="axispen010" c="CTIPIDE"  >
                                            <td class="titulocaja">
                                                <b id="label_CTIPIDE"><fmt:message key="109774"/></b>   <%-- Tipus document --%>
                                            </td>            
                                        </axis:visible>
                                        <axis:visible f="axispen010" c="NNUMIDE"  >
                                            <td class="titulocaja" >
                                                <b id="label_NNUMIDE"><fmt:message key="105330"/></b> <%-- Num document --%>
                                            </td>
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                       <axis:visible f="axispen010" c="NPOLIZA"  >
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" style="width:50%;"
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen010" c="CODPLA"  >
                                             <td class="campocaja" colspan="2">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CODFON}" name="CODPLA" id="CODPLA" style="width:50%;"
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen010" c="CTIPIDE"  >
                                            <td class="campocaja">
                                                <select name="CTIPIDE" id="CTIPIDE" size="1"  class="campowidthselect campo campotexto" style="width:100%;" >
                                                    <option value = "null"> - <fmt:message key="108341"/> - </option>                                                    
                                                    <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                                        <option value = "${element.CATRIBU}" 
                                                            <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                            ${element.TATRIBU} 
                                                        </option>
                                                    </c:forEach>
                                                </select>                                                
                                            </td>
                                        </axis:visible>
                                        <axis:visible f="axispen010" c="NNUMIDE"  >
                                             <td class="campocaja" >
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}" name="NNUMIDE" id="NNUMIDE" style="width:50%;"
                                            </td>
                                        </axis:visible>                                        
                                    </tr>                                   
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        
        <!--<c:if test="${(!empty sessionScope.resultats ||sessionScope.resultats) && empty __formdata.INVALID}">,aceptar </c:if>-->
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,buscar<c:if test="${!empty requestScope.LST_CUAFACUL}">,aceptar</c:if></c:param> 
        </c:import>    
    </form>    
    <c:import url="../include/mensajes.jsp"/>

</body>
</html>