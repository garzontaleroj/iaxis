<%/*
*  Fichero: cabecera_persona.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a> 
*  
*  Código que genera la pantalla de cabecera de una persona
*  Contiene info. básica de la persona.
*  No confundir con pantalla axismfm001.jsp (detalle cabecera de persona)
*
*  Fecha: 16/10/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page import="java.util.HashMap" %>


<%  // Recuperamos parámetros de búsqueda si se ha efectuado alguna
    HashMap persona = null;
    if (request.getAttribute("persona") != null)
        persona = (HashMap)request.getAttribute("persona");
%>

<script type="text/javascript">
    function f_abrir_axisper001() {
        objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form");
    }
    function f_cerrar_axisper001() {
        objUtiles.cerrarModal("axisper001")
    }    
    function f_aceptar_axisper001 (selectedPerson){
        objDom.setValorPorId("selectedPerson", selectedPerson);
        f_cerrar_axisper001();
        objUtiles.ejecutarFormulario("axis_axismfm001.do","ver_persona",document.formCabecera, "_self");
    }
    
</script>

<div>
    <!-- <b>axismfmcabecera_persona</b> -->
</div>
<form name="formCabecera" action="" method="POST">
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><fmt:message key="1000235" /></c:param>
        <c:param name="nid" value="axisper001" />
    </c:import>
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" name="selectedPerson" id="selectedPerson" value=""/>        
    <p>
    <fmt:message key="1000063"/>. <img src="images/find.gif" onclick="f_abrir_axisper001()" style="cursor:pointer" alt="<fmt:message key="1000063"/>" title="<fmt:message key="1000063"/>">
    </p>
    <c:if test="${persona != null}">
        <fmt:message key="111523"/> <b> <%= persona.toString() %> </b>
        <div style="margin-top:10px">    
            <div style="float:left;margin-top:5px">    
                <fmt:message key="105904"/> <input type="text" name="nif" value="<%= persona.get("nif") %>"/>
            </div>
            <div style="float:left;margin:5px 0 0 30px">    
                <fmt:message key="1000064"/> <input type="text" name="fechaNacimiento" value="<%= persona.get("fechaNacimiento") %>"/>
            </div>
        </div>
        <div style="clear:both"/>    
            <div style="float:left;margin-top:5px">    
                <%  String checked ="";
                    if (((Boolean)persona.get("publico")).booleanValue() == true) { 
                        checked = "checked"; 
                }%>
                <fmt:message key="1000068"/> <input type="checkbox" name="publico" <%= checked %>/>
            </div>
            <div style="float:left;margin:5px 0 0 127px">    
                <fmt:message key="100962"/> <input type="text" name="sexo" value="<%= persona.get("sexo") %>"/>
            </div>
        <div style="clear:both"/>
            <div style="float:left;margin-top:5px">    
                <fmt:message key="105940"/><input type="text" name="nombreCompleto" value="<%= persona.get("nombre") %>"/ size="60">
            </div>
    </c:if>
    <div style="clear:both"/>    
</form>
<p>
    &nbsp;<hr>
</p>
