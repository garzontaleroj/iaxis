<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisage033.jsp
  @author <a href = "mailto:echristen@csi-ti.com">Elmar Christen</a>

  Fecha: 20/12/2007
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
         <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <c:import url="../include/carga_framework_js.jsp" />

        <script type="text/javascript">
           
            function f_onload(){
            
            var bandera = "${__formdata.BANDERA}";
            
             if( bandera ===  "salir"){
                f_but_cancelar();
             }else{  
                 f_cargar_propiedades_pantalla();
             }    
            }
            
            ///////////////////////////////////////////////////
            function f_but_cancelar() {
                parent.f_cerrar_axisage033();
            }        

            

            function f_but_aceptar () {

                var correos = new Array();
                var envios = new Array();
                var atributos = new Array();
                var size = "${__formdata.CORREOLENGTH}"
                var PCENVCOR = document.getElementById("PCENVCOR").checked?"1":"0";
                var PTCORREO = document.getElementById("PTCORREO").value;
                var CAGENTE = document.getElementById("CAGENTE").value;
                for(i = 1; i <= size; i++){
                    var correo = document.getElementById("TCORREO_"+i);
                    if (correo.value !== "" || !objUtiles.estaVacio(correo.value)){
                        correos[i-1] = correo.value;
                    }else{
                        correos[i-1] = "_";
                    }
                    var envio = document.getElementById("CENVIAR_"+i);
                    envios[i-1] = envio.checked?"1":"0";
                    
                    var atribu = document.getElementById("CATRIBU_"+i);
                    atributos[i-1] = atribu.value;
                }
                objUtiles.ejecutarFormulario ("modal_axisage033.do?TCORREO="+correos+"&CATRIBUS="+atributos+"&CENVIAR="+envios+"&PTCORREOS="+PTCORREO+"&PCENVCORS="+PCENVCOR+"&CAGENTES="+CAGENTE+"&SIZES="+size, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
             }
        
        </script>
    </head>
    <body onload="f_onload()" ><!--  -->
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="modal_axisage033.do" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata['CAGENTE']}"/>
        <input type="hidden" name="SPRODUC" id="SPRODUC" value=""/> <!-- DEJAR VACIO -->
        
            
            <c:import url="../include/titulo_nt.jsp"> 
                <c:param name="modalidad"> </c:param> 
                <c:param name="titulo"> </c:param>
                <c:param name="formulario"><axis:alt f="axisage033" c="TITULO" lit="9908495" /></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisage033</c:param>
            </c:import>     

    <!-- Area de campos  -->

        <div class="titulo" style="margin-left: 30px;">
                <img src="images/flecha.gif"/>
                <axis:alt f="axisctr083" c="axisctr083" lit="9000521"/> 
        </div>
        <div class="titulocaja"  id="tit_CACTIVO" style="margin-left: 30px;">
                <b style="width:30%; display: inline-block; margin-right: 5px;"> <axis:alt f="axisage003" c="TNOMBRE" lit="9908109"/></b> 
                <b style="width:30%; display: inline-block;"> <axis:alt f="axisage003" c="CAGENTE" lit="9907629"/></b>   
        </div>  
        <div class="campocaja"  style="margin-left: 30px;">
            <axis:visible f="axisage033" c="CAGENTE">
                <input type="text" class="campowidthinput campo campotexto campodisabled" size="15" 
                                        value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE" 
                                        style="width:30%;" disabled="true"/> 
            </axis:visible>  
            
            <axis:visible f="axisage033" c="TNOMBRE">
                <input type="text" class="campowidthinput campo campotexto campodisabled" size="15" 
                                        value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" 
                                        style="width:30%;"  disabled="true"/>  
            </axis:visible>                              
        </div>     
        <div class="titulocaja"  id="tit_CACTIVO" style="margin-left: 30px;">
                <b style="width:30%; margin-right: 8px; display: inline-block;"> <axis:alt f="axisage003" c="CCORREO" lit="9908516"/> </b> 
                <b style="width:30%; display: inline-block;"> <axis:alt f="axisage003" c="RCORREO" lit="9908517"/> </b> 
        </div>  
        <div class="campocaja"  style="margin-left: 30px;">
            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                    value="${__formdata.PTCORREO}" name="PTCORREO" id="PTCORREO" 
                                    style="width:30%;" /> 
            <input  type="checkbox"  id="PCENVCOR" name="PCENVCOR"
                        <c:if test="${__formdata.PCENVCOR == 1}">checked</c:if>
                                       value="${__formdata.PCENVCOR}" />                        
        </div>   
        
        <div class="titulo" style="margin-left: 30px;">
                <img src="images/flecha.gif"/>
                <axis:alt f="axisage033" c="axisage033" lit="9908518"/> 
        </div>
        
        <div class="displayspaceGrande"   style="margin-top: 20px; margin-left: 30px; width: 97%";>
            <c:set var="title1"><axis:alt f="axisage033" c="TRAMO" lit="9908519" /></c:set>                
            <c:set var="title2"><axis:alt f="axisage033" c="TTITULO" lit="9908518" /></c:set>                
            <c:set var="title3"><axis:alt f="axisage033" c="EMITIR" lit="9001532" /></c:set>  
            <display:table name="${__formdata.PMSJCORREO}" id="PMSJCORREO" export="false" class="dsptgtable" pagesize="-1"  sort="list" cellpadding="0" cellspacing="0" style="width:98%">
                    <%@ include file="../include/displaytag.jsp"%>
                            
                            <display:column title="${title1}" sortable="true" sortProperty="TEMPRES" style="width:30%" headerClass="sortable fixed"  media="html" autolink="false">
                                    <div class="dspText">${PMSJCORREO.TATRIBU}</div>
                            </display:column>  
                            
                            <display:column title="${title2}" sortable="true" sortProperty="TEMPRES" style="width:30%" headerClass="sortable fixed"  media="html" autolink="false">
                                    <div class="dspText">
                                        <input type="text" class="campowidthinput campo campotexto"  id="TCORREO_${PMSJCORREO.COL}";
                                            value="${PMSJCORREO.TCORREO}" />
                                    </div>
                            </display:column>                                               
    
                            <display:column title="${title3}" sortable="true" sortProperty="TERRITORIO" style="width:15%" headerClass="sortable fixed"  media="html" autolink="false">
                                    <div class="dspText">
                                        <input  type="checkbox"  id="CENVIAR_${PMSJCORREO.COL}"
                                            <c:if test="${PMSJCORREO.CENVIAR == 1}">checked</c:if>
                                                       value="${PMSJCORREO.CENVIAR}" /> 
                                        <input type="hidden" name="CATRIBU" id="CATRIBU_${PMSJCORREO.COL}"
                                                        value="${PMSJCORREO.CATRIBU}"/>               
                                    </div>
                            </display:column>
    
            </display:table>                                                        
        </div>
<!-- Table area campos --> <!-- Ahora incluye a los dos forms -->
 
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axisage033</c:param>
        <c:param name="__botones">
            cancelar,aceptar
        </c:param>
    </c:import>

    </form>
    
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

