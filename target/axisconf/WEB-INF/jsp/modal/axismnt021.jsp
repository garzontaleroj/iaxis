<%/* Revision:# RinF/U6fA6vJZdcm8u36nQ== # */%>
<%--
      NOMBRE:    axismnt021.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 13/09/2012
      PROPÓSITO (descripción pantalla): Nueva CFG
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        13/09/2012   JTS             1. Creación de la pantalla. Bug.23079
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
               
               <c:if test="${PROCESO=='eliminar' && empty __formdata.OK}" >
                   var ret= confirm("<axis:alt c='MENSAJECONFIRM' f='axismnt021' lit='1000167'/>");
                   if (ret){
                        objUtiles.ejecutarFormulario("modal_axismnt021.do", "eliminar", document.miForm, "_self", objJsMessages.jslit_cargando);
                   }else{
                        f_but_salir();
                   }
                </c:if>
                 <c:if test="${PROCESO=='eliminar' && __formdata.OK=='1'}" >
                      f_but_salir();
                </c:if>

            }
            
            function f_but_guardar() {
                if (objValidador.validaEntrada()){
                    objUtiles.ejecutarFormulario("modal_axismnt021.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_salir() {                
                var CCOMPANI = document.miForm.CCOMPANI.value;
                var SPERSON = document.miForm.SPERSON.value;
                parent.f_cerrar_calificaciones(SPERSON,CCOMPANI);
            }
          
            function f_cargar_onchange() {
            objUtiles.ejecutarFormulario("modal_axismnt021.do", "dbGetCalifi", document.miForm, "_self", objJsMessages.jslit_cargando);
            } 

            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import> 

    <form name="miForm" action="" method="POST">
       <input type="hidden" name="operation" value="${PROCESO}"/>
       <input type="hidden" name="PROCESO" value="${PROCESO}"/>
       <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}"/>
       <input type="hidden" name="OK" id="OK" value="${__formdata.OK}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt021" lit="9905528"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismnt021" lit="9905528"/></c:param>
                <c:param name="form">axismnt021</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <axis:visible c="SEC_NOU" f="axismnt021">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>      <axis:alt f="axismnt021" c="DATOS_COMPANIA" lit="9905525"/>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                        </tr>
                            <tr>
                                <axis:ocultar f="axismnt021" c="CCOMPANI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt021" c="CCOMPANI" lit="9900885" /></b>
                                    </td>
                                </axis:ocultar>                              
                                <axis:ocultar f="axismnt021" c="TCOMPANI">
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt f="axismnt021" c="TCOMPANI" lit="9903960"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>                             
                            <tr>
                               
                                 <axis:ocultar f="axismnt021" c="CCOMPANI" dejarHueco="false">
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto"
                                    <axis:atr f="axismnt021" c="CCOMPANI" a="modificable=false"/> 
                                    style="width:80%;" value="${__formdata.CCOMPANI}" 
                                    name="CCOMPANI" id="CCOMPANI" size="15" 
                                    title="<axis:alt f="axismnt021" c="CCOMPANI" lit="9900885"/>"/>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="TCOMPANI" dejarHueco="false">
                                    <td class="campocaja" colspan="3">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt021" c="TCOMPANI" a="modificable=false"/>
                                        style="width:90%;" size="15" value="${__formdata.TCOMPANI}" name="TCOMPANI" id="TCOMPANI"
                                         title="<axis:alt f="axismnt021" c="TCOMPANI" lit="9903960"/>"/>
                                    </td>
                                </axis:ocultar>                         
                            </tr>
                                        
                             
                                

                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>

                    </td> 
                </tr>
                <!-- Seccion de Calificacion  -->
                <tr>
                    <td>
                    <axis:visible c="SEC_NOU" f="axismnt021">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>  <axis:alt f="axismnt021" c="CALIFICACION" lit="9903963"/> <!-- 9903963 Calificación -->
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                            <th style="width:12.5%;height:0px"></th>
                                        </tr>
                             <tr>
                                <axis:ocultar f="axismnt021" c="CENTICALIFI" dejarHueco="false">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt021" c="CENTICALIFI" lit="9903962" /></b>
                                    </td>
                                </axis:ocultar>                              
                                <axis:ocultar f="axismnt021" c="CCALIFI">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt021" c="CCALIFI" lit="9903963"/></b>
                                    </td>
                                </axis:ocultar>
                               <axis:ocultar f="axismnt021" c="CESTADOCALIFI" dejarHueco="false">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt021" c="CESTADOCALIFI" lit="9909142" /></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="FINSCRIP">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt021" c="FINSCRIP" lit="9910007"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="ANYOACTUALIZ">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt021" c="ANYOACTUALIZ" lit="9910008"/></b>
                                    </td>
                                </axis:ocultar>  
                            </tr>
                            <tr>
                               
                                 <axis:ocultar f="axismnt021" c="CENTICALIFI" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                     <select name="CENTICALIFI" id="CENTICALIFI" size="1" onchange="f_cargar_onchange()" class="campowidthselect campo campotexto" style="width:79%;"   <axis:atr f="axismnt021" c="CENTICALIFI" a="obligatorio=true&isInputText=false&modificable=${(PROCESO=='editar' || PROCESO=='eliminar')?'false':'true'}"/> 
                                    title="<axis:alt f="axismnt021" c="CENTICALIFI" lit="9903962" />"
                                     >&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt021" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LSTCENTICALIFI}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CENTICALIFI == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select> 
                                </td>
                                </axis:ocultar>                                
                                 <axis:ocultar f="axismnt021" c="CCALIFI" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name="CCALIFI" id="CCALIFI" size="1" class="campowidthselect campo campotexto" style="width:99%;"  >&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt021" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LSTCCALIFI}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CCALIFI == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select> 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="CESTADOCALIFI" dejarHueco="false">
                                <td class="campocaja" colspan="2">
                                     <select name="CESTADOCALIFI" id="CESTADOCALIFI" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                       <axis:atr f="axismnt021" c="CESTADOCALIFI" a="obligatorio=true&isInputText=false&modificable=${(PROCESO=='editar' || PROCESO=='eliminar')?'false':'true'}"/>

                                    title="<axis:alt f="axismnt021" c="CESTADOCALIFI" lit="9909142" />"
                                     >&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt021" c="SELECC" lit="9909142"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LSTESTCALIFI}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.CESTADOCALIFI == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select> 
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="FINSCRIP" dejarHueco="false">
                                   <td class="campocaja">
                                        <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FINSCRIP" name="FINSCRIP" size="15"
                                            value="<fmt:formatDate value='${__formdata.FINSCRIP}' pattern='dd/MM/yyyy'/>" 
                                            <axis:atr f="axismnt021" c="FINSCRIP" a="modificable=${(PROCESO=='editar' || PROCESO=='eliminar')?'false':'true'}"/>
                                                <a style="vertical-align:middle;"><img
                                            id="icon_FINSCRIP" alt="<axis:alt f="axismnt021" c="FINSCRIP" lit="9910007"/>" title="<axis:alt f="axismnt021" c="FINSCRIP" lit="9910007" />" src="images/calendar.gif"/></a>                                 
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="ANYOACTUALIZ" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt021" c="ANYOACTUALIZ" a="modificable=true&formato=decimal"/>
                                         maxlength="4" style="width:55%;" size="15" value="${__formdata.ANYOACTUALIZ}" name="ANYOACTUALIZ" id="ANYOACTUALIZ"
                                         title="<axis:alt f="axismnt021" c="ANYOACTUALIZ" lit="9910008"/>"/>
                                    </td>
                                </axis:ocultar>
                             <tr>
                             <axis:ocultar f="axismnt021" c="OFC_REPRES">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt021" c="OFC_REPRES" lit="9910009"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="FEFECTO">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axismnt021" c="FEFECTO" lit="100883"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="PRECARGO" dejarHueco="false">
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axismnt021" c="PRECARGO" lit="101566" /></b>
                                    </td>
                                </axis:ocultar>

                            </tr>
                             <axis:ocultar f="axismnt021" c="OFC_REPRES" dejarHueco="false">
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt021" c="OFC_REPRES" a="modificable=true"/>
                                         maxlength="1" style="width:55%;" size="1" value="${__formdata.OFC_REPRES}" name="OFC_REPRES" id="OFC_REPRES"
                                         title="<axis:alt f="axismnt021" c="OFC_REPRES" lit="9910009"/>"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axismnt021" c="FEFECTO" dejarHueco="false">
                                   <td class="campocaja">
                                        <input type="text"  style="width:80%" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                            value="<fmt:formatDate value='${__formdata.FEFECTO}' pattern='dd/MM/yyyy'/>" 
                                            <axis:atr f="axismnt021" c="FEFECTO" a="obligatorio=true&modificable=${(PROCESO=='editar' || PROCESO=='eliminar')?'false':'true'}"/>
                                                <a style="vertical-align:middle;"><img
                                            id="icon_FEFECTO" alt="<axis:alt f="axismnt021" c="FEFECTO" lit="100883"/>" title="<axis:alt f="axismnt021" c="FEFECTO" lit="100883" />" src="images/calendar.gif"/></a>                                 
                                    </td>
                                </axis:ocultar>  
                               <axis:ocultar f="axismnt021" c="PRECARGO" dejarHueco="false">
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" 
                                        <axis:atr f="axismnt021" c="PRECARGO" a="modificable=true&formato=decimal"/>
                                        style="width:55%;" size="15" value="${__formdata.PRECARGO}" name="PRECARGO" id="PRECARGO"
                                         title="<axis:alt f="axismnt021" c="PRECARGO" lit="9001295"/>"/>
                                    </td>
                                </axis:ocultar>  
                            </tr>
                             

                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>

                    </td> 
                </tr>
                
                <axis:visible c="CALIFICACION" f="axismnt021" >
     <tr>
          <td>
             
            <div class="titulo" style="float:left;">
              <img src="images/flecha.gif"/><axis:alt f="axismnt021" c="HISTORICO" lit="9905535"/>
            </div>
              <div class="separador"  style="float:both;" >&nbsp;</div>
            <!-- Sección 1 -->
            <table class="seccion">
              <td align="left">
                <table class="area" align="center">
                  <tr>
                    <th style="width:100%;height:0px">&nbsp;</th>
                  </tr>
                  <!-- LISTA -->
                  <tr>
                    <td class="titulocaja">
                      <%-- DisplayTag Facturas--%>
                      <c:set var="title0">
                        <axis:alt f="axismnt021" c="NNUMLIN" lit="100899"/><!-- 100899 Número -->
                      </c:set>
                      <c:set var="title1">
                        <axis:alt f="axismnt021" c="CENTICALIFI" lit="9903962"/><!-- 9903962 Empresa calificadora -->
                      </c:set>
                      <c:set var="title2">
                        <axis:alt f="axismnt021" c="CCALIFI" lit="9903963"/><!-- 9903963 Calificación -->
                      </c:set>
                       <c:set var="title3">
                        <axis:alt f="axismnt021" c="FEFECTO" lit="100883"/><!--100883 Fecha efecto -->
                      </c:set>
                      <c:set var="title4">
                        <axis:alt f="axismnt017" c="CESTADOCALIFI" lit="9909142"/><!--9909142 Estado de la Calificación -->
                      </c:set>
                      <c:set var="title5">
                        <axis:alt f="axismnt021" c="FVENCI" lit="100885"/><!--100885 Fecha vencimiento-->
                      </c:set>
                      <c:set var="title6">
                        <axis:alt f="axismnt021" c="PRECARGO" lit="101566"/><!-- 101566 % recargo -->
                      </c:set>
                        <c:set var="title7">
                        <axis:alt f="axismnt021" c="EDITAR" lit="9901356"/><!--9901356 Editar -->
                      </c:set>
                        <c:set var="title8">
                        <axis:alt f="axismnt021" c="ELIMINAR" lit="1000127"/><!-- 1000127 Eliminar -->
                      </c:set>
                    
                      <div id="dt_recibos" class="seccion displayspaceGrande">
                        <display:table name="${__formdata.LSTCALIFICA}" id="LSTCALIFICA" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list"
                                       cellpadding="0" cellspacing="0" requestURI="axis_axismnt021.do?paginar=true" style="width:100%" >
                          <%@ include file="../include/displaytag.jsp"%>
                             <display:column title="${title1}" sortable="true" sortProperty="CENTICALIFI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspText">
                                ${LSTCALIFICA.ENTIDADCALIFI}
                              </div>
                            </display:column>
                             <display:column title="${title2}" sortable="true" sortProperty="CCALIFI" headerClass="sortable" media="html" autolink="false">
                             <div class="dspText">
                               ${LSTCALIFICA.CALIFI} 
                              </div>
                            </display:column>
                             <display:column title="${title3}" sortable="true" sortProperty="FEFECTO" headerClass="sortable" media="html" autolink="false">
                              <div class="dspDate">
                                <fmt:formatDate pattern='dd/MM/yyyy' value='${LSTCALIFICA.FEFECTO}'/>  
                              </div>
                            </display:column>
                            <display:column title="${title4}" sortable="true" sortProperty="CESTADOCALIFI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspText">
                              ${LSTCALIFICA.CESTADOCALIFI} ${LSTCALIFICA.FINSCRIP} ${LSTCALIFICA.ANYOACTUALIZ} 
                              </div>
                            </display:column>
                             <display:column title="${title5}" sortable="true" sortProperty="FVENCI" headerClass="sortable" media="html" autolink="false">
                              <div class="dspDate">
                                <fmt:formatDate pattern='dd/MM/yyyy' value='${LSTCALIFICA.FVENCI}'/>
                              </div>
                            </display:column>
                            
                             <display:column title="${title6}" sortable="true" sortProperty="PRECARGO" headerClass="sortable" media="html" autolink="false" style="white-space:nowrap; " >
                              <div class="dspNumber">
                                <fmt:formatNumber pattern="${__formatNumberPorcentajeDefault}" value="${LSTCALIFICA.PRECARGO}"/>${(!empty LSTCALIFICA.PRECARGO)?'%':''}
                              </div>
                            </display:column>
                          
                            
                        </display:table>
                      </div>
                    </td>
                  </tr>
                </table>
              </td>
            </table>
          </td>
        </tr>
    </axis:visible>
            </table>
        
             <div class="separador">&nbsp;</div>
    </form>
    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axismnt021</c:param>
       <c:param name="__botones"><axis:ocultar f="axismnt021" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><c:if test="${PROCESO!='eliminar'}" ><axis:ocultar f="axismnt021" c = "BT_GUARDAR" dejarHueco="false">,guardar</axis:ocultar></c:if></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FEFECTO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEFECTO", 
            singleClick    :    true,
            firstDay       :    1,
            minDate: new Date()
        });
        
 </script>    
 
     <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FINSCRIP",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINSCRIP", 
            singleClick    :    true,
            firstDay       :    1,
            minDate: new Date()
        });
        
 </script> 
 
    
    </body>
</html>
