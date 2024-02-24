<%/*
*  Fichero: axisctr212.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 13/09/2013
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
            parent.f_cerrar_axisctr212();
       }
       
       function f_but_aceptar(){
        
            var FINCLU = document.axisctr212Form.FINCLU.value;
            var FEXCLU = document.axisctr212Form.FEXCLU.value;
       
            var xMonth=FINCLU.substring(3, 5);   
            var xDay=FINCLU.substring(0, 2);   
            var xYear=FINCLU.substring(6,10);   
            var yMonth=FEXCLU.substring(3, 5);   
            var yDay=FEXCLU.substring(0, 2);   
            var yYear=FEXCLU.substring(6,10);   
    
            var fechainclu = xYear+xMonth+xDay;
            var fechaexclu = yYear+yMonth+yDay;
            
            if (objValidador.validaEntrada()){
                if(!objUtiles.estaVacio(fechainclu) && !objUtiles.estaVacio(fechaexclu) ){
                    if(fechaexclu<=fechainclu)
                        alert('<axis:alt f="axisctr212" c="VALFECHAS" lit="9904460" />');  
                    else{
                        f_habilitar_campos();
                        objUtiles.ejecutarFormulario("modal_axisctr212.do", "guardar", document.axisctr212Form, "_self", objJsMessages.jslit_cargando);   
                    }
                }
                else{
                    f_habilitar_campos();
                    objUtiles.ejecutarFormulario("modal_axisctr212.do", "guardar", document.axisctr212Form, "_self", objJsMessages.jslit_cargando);   
                }
            }
       }
       
       function f_onload(){
        	f_cargar_propiedades_pantalla();
            var ok = '${__formdata.OK}';
            var PSMATRICLRE_OUT = '${__formdata.PSMATRICLRE_OUT}';
            if(ok == '0'){
                parent.f_aceptar_axisctr212(PSMATRICLRE_OUT);
            }
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
          
        <form name="axisctr212Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
            
            <input type="hidden" id="CMODO" name="CMODO" value="${__formdata.CMODO}"/>
            <input type="hidden" id="SMATRICLRE" name="SMATRICLRE" value="${__formdata.SMATRICLRE}"/>
            

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr212" c="formulario" lit="9905977" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr212" c="producto" lit="9905977" /></c:param>
                <c:param name="form">axisctr212</c:param>
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
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr212" c="CCLALIS" lit="9904431"/></b><!-- Clase lista -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr212" c="CTIPLIS" lit="9904432"/></b><!-- Tipo lista -->
                                        </td> 
                                        
                                    </tr>
                                    <tr> 
                                        <td class="campocaja" > 
                                            <select name = "CCLALIS" id="CCLALIS" size="1" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr212" c="CCLALIS" a="modificable=false&obligatorio=true&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr212" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.claseList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${tipo.CATRIBU == 2}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "CTIPLIS" id="CTIPLIS" size="1" class="campowidthselect campo campotexto"
                                              title="<axis:alt f="axisctr212" c="CTIPLIS" lit="9904432"/>"
                                                <c:choose>
                                                        <c:when test="${__formdata.CMODO == 'MODIF'}">
                                                         <axis:atr f="axisctr212" c="CTIPLIS" a="modificable=false&obligatorio=true&isInputText=false"/>
                                                        </c:when>
                                                        <c:otherwise >
                                                         <axis:atr f="axisctr212" c="CTIPLIS" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                                        </c:otherwise>
                                                     </c:choose>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr212" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.tipoList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTIPLIS)&& tipo.CATRIBU == __formdata.CTIPLIS}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <!-- Codigo Matricula --> 
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr210" c="CMATRIC" lit="9001057"/></b>
                                        </td>
                                        <!-- Codigo motor -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="CODMOTOR" lit="9904654"/></b>
                                        </td>
                                        <!-- Codigo chasis -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="CCHASIS" lit="9904655"/></b>
                                        </td>
                                        <!-- Numero bastidor -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr210" c="NBASTID" lit="9001061"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text" name="CMATRIC" id="CMATRIC"  value="${__formdata.CMATRIC}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="CODMOTOR" id="CODMOTOR"  value="${__formdata.CODMOTOR}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="CCHASIS" id="CCHASIS"  value="${__formdata.CCHASIS}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="NBASTID" id="NBASTID"  value="${__formdata.NBASTID}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr212" c="FINCLU" lit="9902640"/></b><!--F. Inclusion -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr212" c="MOTINCLU" lit="9904447"/></b><!-- Motivo inclusión -->
                                        </td>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr212" c="FEXCLU" lit="9902639"/></b><!-- F. Exclusión -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr212" c="CNOTIFI" lit="9905976"/></b><!-- Notificado -->
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" > 
                                            <jsp:useBean id="today" class="java.util.Date" />
                                            
                                            <input type="text" formato="fecha" name="FINCLU" id="FINCLU" style="width:40%;"   
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINCLU}"/> <c:if test="${empty __formdata.FINCLU}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                                title="<axis:alt f="axisctr212" c="FINCLU" lit="9902640"/>"
                                                <c:choose>
                                                        <c:when test="${__formdata.CMODO == 'MODIF'}">
                                                            <axis:atr f="axisctr212" c="FINCLU" a="modificable=false&obligatorio=true"/>
                                                        </c:when>
                                                        <c:otherwise >
                                                         <axis:atr f="axisctr212" c="FINCLU" a="modificable=true&obligatorio=true"/> 
                                                        </c:otherwise>
                                                     </c:choose>
                                                 class="campowidthinput campo campotexto" />
                                            <c:if test="${__formdata.CMODO == 'NEW'}">
                                            <a id="icon_FINCLU" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr212" c="FINCLU" lit="108341"/>" title="<axis:alt f="axisctr212" c="FINCLU2" lit="9902640" />" src="images/calendar.gif"/></a>
                                            </c:if>
                                        </td>
                                        <td class="campocaja">
                                             <select name = "MOTINCLU" id="MOTINCLU"  style="width:100%;" value="" size="1" class="campowidthselect campo campotexto"
                                                    title="<axis:alt f="axisctr212" c="MOTINCLU" lit="9904447"/>"
                                                    <c:choose>
                                                        <c:when test="${__formdata.CMODO == 'MODIF'}">
                                                         <axis:atr f="axisctr212" c="MOTINCLU" a="modificable=false&obligatorio=true&isInputText=false"/>
                                                        </c:when>
                                                        <c:otherwise >
                                                         <axis:atr f="axisctr212" c="MOTINCLU" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                                        </c:otherwise>
                                                     </c:choose> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr212" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.motExclu}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.MOTINCLU)&& estado.CATRIBU == __formdata.MOTINCLU}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FEXCLU" id="FEXCLU" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FEXCLU}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FEXCLU" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr212" c="FEXCLU" lit="108341"/>" title="<axis:alt f="axisctr212" c="FEXCLU2" lit="9902639" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "CNOTIFI" id="CNOTIFI" size="1" class="campowidthselect campo campotexto"
                                              title="<axis:alt f="axisctr212" c="CNOTIFI" lit="9904432"/>"
                                                <c:choose>
                                                        <c:when test="${__formdata.CMODO == 'MODIF'}">
                                                         <axis:atr f="axisctr212" c="CNOTIFI" a="modificable=false&obligatorio=true&isInputText=false"/>
                                                        </c:when>
                                                        <c:otherwise >
                                                         <axis:atr f="axisctr212" c="CNOTIFI" a="modificable=true&obligatorio=true&isInputText=false"/> 
                                                        </c:otherwise>
                                                     </c:choose>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr212" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.listsino}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CNOTIFI)&& tipo.CATRIBU == __formdata.CNOTIFI}"> selected </c:if>>
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
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr212</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            
            <script type="text/javascript">
            <c:if test="${__formdata.CMODO == 'NEW'}">
            Calendar.setup({
            inputField     :    "FINCLU",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINCLU", 
            singleClick    :    true,
            firstDay       :    1
            });
            </c:if>
           
            Calendar.setup({
            inputField     :    "FEXCLU",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEXCLU", 
            singleClick    :    true,
            firstDay       :    1
            });
           
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

