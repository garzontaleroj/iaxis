<%/* Revision:# VdLoQm7bNBHT2TOk0m6MWA== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f='axisctr026' c='TITULO_GENERAL' lit='1000193'/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />
        <c:import url="../../../scripts/axis/axisctr002.jsp">
               <c:param name="multiPantalla" value="true"/>
        </c:import>            
        <c:import url="../../../scripts/axis/axisctr003.jsp">
               <c:param name="multiPantalla" value="true"/>
        </c:import>  
        <axis:visible f="axisctr026" c="DSP_GESTORCOBRO">  
	        <c:import url="../../../scripts/axis/axisctr187.jsp">
	               <c:param name="multiPantalla" value="true"/>
	        </c:import>  
         </axis:visible>
        <script type="text/javascript">
            function f_onload() {
                f_onload_axisctr002();
                f_onload_axisctr003();
                <axis:visible f="axisctr026" c="DSP_GESTORCOBRO"> 
              		  f_onload_axisctr187();
                 </axis:visible>
                //f_cargar_propiedades_pantalla();
            }
    /****************************************************************************************/
    /********************************** MODAL AXPER001 **************************************/
    /****************************************************************************************/
    function f_abrir_axisper001_tomadores() {
        objUtiles.abrirModal("axisper001","src","modal_axisper001.do?operation=form&faceptar=f_aceptar_tomadores_axisper001&ORIGEN=AXISCTR002");
    }

	function f_abrir_axisper006_gest(faceptar){
        objDom.setVisibilidadPorId("but_cerrar_modal_axisper006", "hidden");
        if(faceptar.indexOf("gestores") > 0){
        objUtiles.abrirModal("axisper006", "src", "modal_axisper006.do?operation=form&SPERSON=" + document.getElementById("SPERSON_GEST").value+"&faceptar="+faceptar);
        }
    }

    /****************************************************************************************/  

    // Ini IAXIS -3635 - ACL - 22/04/2019
	function f_but_consultar_per(selectedPerson,selectedAgente){
     SPERSON = "${__formdata.SPERSON}";
     objUtiles.ejecutarFormulario("axis_axisctr026.do?SPERSON_AUX="+selectedPerson+"&SPERSON="+selectedPerson, "consultarPer", document.axisctr002Form, "_self", objJsMessages.jslit_cargando);
 	}
  
    function f_aceptar_axisper016(PMENSAPOPUP){
      objUtiles.cerrarModal("axisper001");
      objUtiles.abrirModal("axisper016", "src", "modal_axisper016.do?operation=form&PMENSAPOPUP="+PMENSAPOPUP,800,500);            
    }
    
    function f_cerrar_axisper016(){
      objUtiles.cerrarModal("axisper016");
      f_abrir_axisper001_tomadores();
    }    
    
    function f_cerrar_axisper006(faceptar){
        objUtiles.cerrarModal("axisper006");
        if (faceptar=="f_aceptar_tomadores_axisper006" || faceptar=="f_aceptar_asegurados_axisper006" || faceptar=="f_aceptar_gestores_axisper006")
        {              
            if(faceptar.indexOf("tomadores") > 0){
                objUtiles.ejecutarFormulario("axis_axisctr026.do", "form", document.axisctr002Form, "_self", objJsMessages.jslit_cargando);
            }else if(faceptar.indexOf("gestores") > 0){
                objUtiles.ejecutarFormulario("axis_axisctr026.do", "form", document.axisctr187Form, "_self", objJsMessages.jslit_cargando);
            }   else if(faceptar.indexOf("asegurados") > 0){
                objUtiles.ejecutarFormulario("axis_axisctr026.do", "form", document.axisctr003Form, "_self", objJsMessages.jslit_cargando);
            }        
        }
    }
    
        </script>
    </head>
        <body onload="f_onload()"> 
            <c:if test="${__configform.axisctr026__DSP_GESTORCOBRO__visible == 'false'}">
               <c:set var="pantalla187">false</c:set>
            </c:if>
            <c:if test="${__configform.axisctr026__DSP_GESTORCOBRO__visible == 'true'}">
               <c:set var="pantalla187">true</c:set>
            </c:if>
            <!-- AXCTR002  -->
            <c:import url="axisctr002_body.jsp">
                <c:param name="multiPantalla" value="true"/>
            </c:import>
            
            <!-- AXCTR003  -->
            <c:import url="axisctr003_body.jsp">
                <c:param name="multiPantalla" value="true"/>
                <c:param name="existe187" value="${pantalla187}"/>
           
            </c:import>
           
            <!-- AXCTR187  -->
            <axis:visible f="axisctr026" c="DSP_GESTORCOBRO">
            <c:import url="axisctr187_body.jsp">
                <c:param name="multiPantalla" value="true"/>
            </c:import>
            </axis:visible>

             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="titulo"><axis:alt f='axisctr026' c='TITULO' lit='9000642'/></c:param>
                    <c:param name="nid">axisper016</c:param>
            </c:import>            
      
            <c:import url="../include/mensajes.jsp" />
        </body>
</html>

