<%/**
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
<head>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
<link rel="stylesheet" href="styles/axisnt.css" type="text/css">
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp" />

<script language="Javascript" type="text/javascript">
    function f_onload() { 
      
     var val1 = "<%=request.getAttribute("OK")%>"; 
        if (val1=="OK"){
            parent.recargar();
            this.f_but_cancelar();
         }
   }

    function f_but_cancelar() {                                   
        parent.f_cerrar_modal("axispro017");                
    }
    
   
    function f_but_aceptar() {
        
        document.miForm.submit()
        
    }
    
    function f_onchange_reval (CREVALI) {
        var PREVALI_visibility = CREVALI >= 2 && CREVALI <= 6 ? "visible" : "hidden";
        document.miForm.PREVALI.style.visibility = PREVALI_visibility;
        var IREVALI_visibility = CREVALI == 1 ? "visible" : "hidden";
        document.miForm.IREVALI.style.visibility = IREVALI_visibility;
    }
    
</script>
</head>
<body  onload="f_onload()">


    <form name="miForm" action="modal_axispro017.do" method="POST">
                <input type="hidden" name="operation" value="guardar"/>
                <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
                <input type="hidden" name="PCACTIVI" value="${__formdata.PCACTIVI}"/>
                <input type="hidden" name="PCGARANT" value="${__formdata.PCGARANT}"/>
                <input type="hidden" name="subpantalla" value="garantias_impuestos"/>
                
        
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="1000227"/></c:param>
            <c:param name="producto"><fmt:message key="1000227"/></c:param>
            <c:param name="form">axispro017</c:param>
        </c:import>

        <!-- Área de campos  -->
        
    
  <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">  
        <tr><td>
    <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
        <tr>
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
        </tr>
        <tr>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="100916"/></b>
            </td>            
            <td>
                <input type="checkbox" id ="CIMPCON" name="CIMPCON" value="${__formdata.CIMPCON}"  <c:if test="${__formdata.CIMPCON==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="800378"/></b>
            </td>            
            <td>
                <input type="checkbox" name="CIMPDGS" value="${__formdata.CIMPDGS}" <c:if test="${__formdata.CIMPDGS==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="1000253"/></b>                
            </td>            
            <td>
           
                <input type="checkbox" name="CIMPIPS"  <c:if test="${__formdata.CIMPIPS==1}">checked</c:if> 
                id="CIMPIPS" value="${__formdata.CIMPIPS}" />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="101705"/></b>                
            </td>            
            <td>
            
                <input type="checkbox" name="CIMPARB" value="${__formdata.CIMPARB}"  <c:if test="${__formdata.CIMPARB==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="103478"/></b>  
            </td>            
            <td>
                <input type="checkbox" name="CIMPFNG" value="${__formdata.CIMPFNG}" <c:if test="${__formdata.CIMPFNG==1}">checked</c:if> />
            </td>
        </tr>
    </table>
    </td>
    </tr>
    </table>
    

        <c:import url="../include/botonera_nt.jsp">
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    
    <c:import url="../include/mensajes.jsp" />
</body>
</html>