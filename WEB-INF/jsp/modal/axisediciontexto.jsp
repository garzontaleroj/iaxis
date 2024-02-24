<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=windows-1252"/>
    <title>axisajaxpeditar</title>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">

        <c:import url="../include/carga_framework_js.jsp" />
        
    <script language="Javascript">
    function f_but_cancelar() {
        parent.objEdicionTexto.f_cerrar();
    }
    function f_but_aceptar() {
        if (objValidador.validaEntrada()) {
            parent.objEdicionTexto.f_cerrar();
            var donde = document.miForm.DONDE.value;
            //f_comprovarLongitud();
            if(!objUtiles.estaVacio(donde))
                parent.f_aceptar_axisediciontexto(objDom.getValorPorId("ID"), objDom.getValorPorId("VALOR"));
            else
                parent.objEdicionTexto.f_aceptar(objDom.getValorPorId("ID"), objDom.getValorPorId("VALOR"), objDom.getValorPorId("READONLY"), objDom.getValorPorId("COMBO"));
        }
    }
    function f_onload() {
        var valor = '${param.VALOR}';
        valor = valor.replace(new RegExp("<br>", "g"), "\n");
        document.getElementById("VALOR").value = valor;
        <c:if test="${!requestScope.READONLY && !requestScope.COMBO}">
        document.getElementById("VALOR").focus();
        </c:if>
        f_cargar_propiedades_pantalla();
    }
    
    function f_comprovarLongitud(){
    
        var isFirefox = (navigator.userAgent.indexOf("Firefox") != -1);
        var isMIE = (navigator.userAgent.indexOf("MSIE") != -1);
        if (isFirefox){
            var texto = objDom.getValorPorId("VALOR");
            if (texto.length>3999){
                document.getElementById("VALOR").value=texto.substr(0,3998);
            }            
        }else if (isMIE){
            var texto = $("#VALOR").val();
            if (texto.length>3999){
                $("#VALOR").text(texto.substr(0,3998));
            }
        }else{
            var texto = $("#VALOR").val();
            if (texto.length>3999){   
                $("#VALOR").val(texto.substr(0,3998));
            }
        }
    }
    
    $(document).ready(function() {
        $("#VALOR").bind('paste', null, function(e) {  
            setTimeout(function() {
            // checks the copied text after a specified time (100 milliseconds)
            f_comprovarLongitud();
            }, 100);            
        })
        $("#VALOR").keyup(function(){  
            f_comprovarLongitud(); 
        }) 
    });
    </script>
  </head>
  <body onload="f_onload()">
    <form name="miForm" action="modal_axismpreditor.do" method="POST"> 
    <input type="hidden" name="operation" value="aceptar" />
    <input type="hidden" id="ID" name="ID" value="${param.ID}" />
    <input type="hidden" id="READONLY" name="READONLY" value="${requestScope.READONLY}" />
    <input type="hidden" id="COMBO" name="COMBO" value="${requestScope.COMBO}" />
    
    <input type="hidden" id="DONDE" name="DONDE" value="${param.DONDE}" />
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="formulario"><axis:alt f="axisediciontexto" c="LIT_1000573" lit="1000573"/></c:param>
        <c:param name="producto"><axis:alt f="axisediciontexto" c="LIT_1000573" lit="1000573"/></c:param>
        <c:param name="form">axisediciontexto</c:param>
    </c:import>
    
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td >
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="height:0px;width:100%"></th>
                                </tr>
                                <tr>
                                    <td>                                        
                                        <c:if test="${!empty param.DESCRIPCION}">
                                            <b><axis:alt f="axisediciontexto" c="LIT_109373" lit="109373"/>&nbsp;<i>${param.DESCRIPCION}</i></b>
                                        </c:if>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <textarea <c:if test="${requestScope.READONLY || requestScope.COMBO}">readonly</c:if> name="VALOR" id="VALOR" 
                                        ${param.ATRIBUTOS} class="campo campotexto_ob"  title="${param.DESCRIPCION}" rows="15" cols="50" style="width:100%" ></textarea>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisediciontexto</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    
    
    </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>
<%@ page contentType="text/html;charset=windows-1252"%>
