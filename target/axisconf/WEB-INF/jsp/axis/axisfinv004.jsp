<%/**
*  Fichero: axisfinv004.jsp
*  Consulta Entradas/salidas Fondos Inversion
*  Fecha: 11/08/2008
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>    

<%@ page contentType="text/html;charset=iso-8859-15" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">

<html>
    <head>
        <title><axis:alt f="axisfinv004" c="LIT_NOMBRE_PANTALLA" lit="formulario.axisnombrepantalla"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>       
        
        <style type="text/css">
          .resaltar_entra {
            background-color: #e6b100 
          }
          
          .resaltar_sale {
            background-color: #ff6f17
          }
        </style>

        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">        
            
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload() {
                //objDom.setDisabledPorId("but_111046",true); //boton resultat
                
                <c:if test="${OK == 'OK'}">
                     //alert("En el reload antes del abrir");
                     f_but_111046 ();
                </c:if>
                // Inhabilita la empresa si es uno 
                <c:if test="${fn:length(listValores.tipo_empresa) < 2 }">
                    document.miForm.CEMPRES.disabled = true;
                </c:if>
                <c:if test="${fn:length(listValores.tipo_empresa) < 2 && CONSULTA == null}">
                    //alert("Al recargar");
                    f_but_9000508();  // Realizar recerca
                </c:if>
                f_cargar_propiedades_pantalla();
                
                ocultar_texto();
            }
            
            function ocultar_texto(){
            
                //parrafo = document.getElementById("title0"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title1"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title2"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title3"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title5"); 
                ////parrafo.style.display = "none";  
                //parrafo = document.getElementById("title7"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title10"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title11"); 
                //parrafo.style.display = "none";  
                //parrafo = document.getElementById("title12"); 
                //parrafo.style.display = "none";  
                    try { parrafo = document.getElementById("title0") ; parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title1") ; parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title2") ; parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title3") ; parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title5") ; } catch(Exception) { }
                    try { parrafo = document.getElementById("title7") ; parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title10"); parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title11"); parrafo.style.display = "none"; } catch(Exception) { }
                    try { parrafo = document.getElementById("title12"); parrafo.style.display = "none"; } catch(Exception) { }
            }
            
            
             function habilitar_empresa(){
                document.miForm.CEMPRES.disabled = false;
             }
            function f_but_salir() {
                habilitar_empresa();
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisfinv004", "cancelar", document.miForm, "_self");
            }
            function f_but_9000508 (){//Cercar
                //alert("Antes de buscar");
                habilitar_empresa();
                objUtiles.ejecutarFormulario ("axis_axisfinv004.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_100001 (){ //Executar
                //alert("Antes de ejecutar");
                habilitar_empresa();
                objUtiles.ejecutarFormulario ("axis_axisfinv004.do", "ejecutar", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_but_111046 (){ //Resultado
                //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=form&SEGURO=" + 
                var file = objDom.getValorComponente(document.miForm.FILE);
                //var file="c:/jjj/ValLiquidativos_03042009.csv";
                //alert("Antes de abrir modal"+file);
                //alert(file);
                
                <c:if test="${fn:length(listValores.tipo_empresa) < 2 }">
                    document.miForm.CEMPRES.disabled = true;
                </c:if>
                
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+file); //+"&mimetype=csv"
                //objUtiles.cerrarModal("axisimprimir");
            }
            
            
        </script>
    </head>
    <body  onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_9000508() }">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        
          
        <form name="miForm" action="" method="POST"> 
            <input type="hidden" name="operation" value=""/> 
            <%-- input type="hidden" name="file" value="${sessionScope.axisimprimir_f.name}"/ --%> 
            
            <!--input type="hidden" name="file" value="c:/jjj/fff.doc"/--> 
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="titulo"><axis:alt f="axisfinv004" c="TITULO_PANTALLA" lit="9001499" /></c:param>
                <c:param name="formulario"><axis:alt f="axisfinv004" c="TITULO_FORM" lit="9001499" /></c:param>
                
                <c:param name="form">axisfinv004</c:param>
            </c:import>
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
            <!-- ********* modales  *************** -->
             <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisfinv004" c="LIT_MODAL_IMPRIMIR" lit="1000205" />|true</c:param>
             </c:import>
            <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                        <img src="images/flecha.gif"/><axis:alt f="axisfinv004" c="LIT_IMG_SECC" lit="103593"/>
                         </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axisadm004" c="axisadm_listaEmpresas" dejarHueco="true">
                                            <td class="titulocaja" ><b><axis:alt f="axisfinv004" c="LIT_EMPRESA" lit="101619"/></b></td><!--Empresa -->
                                            </axis:ocultar>
                                            <td></td>
                                            <td class="titulocaja" ><b><axis:alt f="axisfinv004" c="LIT_FVALOR" lit="1000590"/></b></td><!-- Data -->
                                            <td></td>
                                        </tr>
                                        <tr>
                                            
                                            <td class="campocaja">
                                            <axis:ocultar f="axisadm004" c="axisadm_listaEmpresas" dejarHueco="true">
                                                <select name = "CEMPRES" id="CEMPRES" style="width:200px;" size="1" onchange="javascript:f_but_9000508();" class="campowidthselect campo campotexto" >
                                                <option value = "-1" selected> - <axis:alt f="axisfinv004" c="LIT_SELECCIONA_REGISTRO_EMPRESA" lit="1000348"/> - </option>
                                                <c:forEach var="empresa" items="${listValores.tipo_empresa}">
                                                    <option value = "${empresa.CEMPRES}"
                                                        <c:if test="${empresa.CEMPRES == __formdata.CEMPRES || fn:length(listValores.tipo_empresa) < 2 }">selected</c:if>>
                                                        ${empresa.TEMPRES}
                                                    </option>
                                                </c:forEach>
                                                </select>
                                            </axis:ocultar>
                                            </td>
                                            <td></td>
                                            <td class="campocaja" >
                                             <input type="text" onchange="javascript:f_but_9000508();" class="campowidthinput campo campotexto" size="2" value="<fmt:formatDate value='${__formdata.FVALOR}' pattern='dd/MM/yyyy'/>" name="FVALOR" id="FVALOR"
                                                style="width:60%;" <axis:atr f="axisfinv004" c="FVALOR" a="formato=fecha&modificable=true"/>
                                                title="<axis:alt f="axisfinv004" c="LIT_TIT_FVALOR" lit="9000539"/>"/><a id="popup_calendario_ini" style="vertical-align:middle;"><img 
                                                alt="<axis:alt f="axisfinv004" c="LIT_ALT_FVALOR" lit="108341"/>" title="<axis:alt f="axisfinv004" c="LIT_IMG_FVALOR" lit="9000539" />" src="images/calendar.gif"/></a>
                                            </td>
                                            <td></td>
                                        </tr>
                                        
                                        <tr>
                                            
                                            <td class="titulocaja" colspan="2" ></td><!--Fichero-->
                                            <td class="titulocaja" >
                                            <td></td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja" colspan="2">
                                                <input type="hidden" class="campowidthinput campo campotexto" size="2" value="${__formdata.FILE}" name="FILE" id="FILE"
                                                style="width:60%;" <axis:atr f="axisfinv004" c="FILE" a="obligatorio=true&modificable=false"/> />
                                            
                                            </td>
                                            <td class="campocaja" ></td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <%--
                            <tr>          
                                <td style="padding-left: 320px;" align="left">
                                    <b><axis:alt f="axisfinv004" c="XXX" lit="9002181"/></b>
                                </td>  
                                <td style="padding-left: 120px;margin-right: 60px;" align="left">
                                    <b><axis:alt f="axisfinv004" c="XXX_9002182" lit="9002182"/></b>
                                </td>  
                             </tr>
                            <tr>          
                                <td style="padding-left: 320px;" align="center">
                                    <b><hr></b>
                                </td>  
                                <td style="padding-left: 120px;margin-right: 60px;" align="left">
                                    <b><hr align="left"></b>
                                </td> 
                             </tr>
                             --%>
                           
                            <%--
                             <tr>                       
                                <td class="titulocaja">
                                     <c:set var="titleEntrada"><axis:alt f="axisfinv004" c="XXX_noval" lit="9002181"/></c:set>  
                                     <c:set var="titleSalida"><axis:alt f="axisfinv004" c="XXX_noval2" lit="9002182"/></c:set> 
                                     <c:set var="titleEmpry1">         </c:set> 
                                     <c:set var="titleEmpry2">           </c:set> 
                                     <c:set var="titleEmpry3">                 </c:set>
                                    <div id="dt_recibos" class="seccion displayspacePersonas" >
                                        <display:table name="${NULL}" id="LSTEMPTY" export="false" class="dsptgtable" pagesize="10" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisfinv004.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${titleEmpry1}" sortable="true" sortProperty="EMPTY" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                   &nbsp; 
                                                </div>
                                            </display:column>
                                            <display:column title="${titleEmpry2}" sortable="true" sortProperty="EMPTY" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                   &nbsp; 
                                                </div>
                                            </display:column>
                                            <display:column title="${titleEmpry2}" sortable="true" sortProperty="EMPTY" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                   &nbsp; 
                                                </div>
                                            </display:column>
                                            <display:column title="${titleEmpry3}" sortable="true" sortProperty="EMPTY" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                   &nbsp; 
                                                </div>
                                            </display:column>
                                            <display:column title="${titleEntrada}" sortable="true" sortProperty="EMPTY" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                   &nbsp; 
                                                </div>
                                            </display:column>
                                            <display:column title="${titleSalida}" sortable="true" sortProperty="EMPTY" headerClass="sortable"  media="html" autolink="false" >
                                                <div class="dspNumber">
                                                   &nbsp; 
                                                </div>
                                            </display:column>
                                        </display:table>                                                        
                                    </div>
                                 </td>
                             </tr>
                             --%>
                           <tr>                       
                                        
                                        <td class="titulocaja" style="padding-right: 0px;">
                                            <%-- DisplayTag Facturas --%>
                                            
                                            <c:set var="title0"><axis:alt f="axisfinv004" c="LIT_CCODFON" lit="9001352"/></c:set>  
                                            <c:set var="title1"><axis:alt f="axisfinv004" c="LIT_DESCFON" lit="9001292"/></c:set>  
                                            <c:set var="title2"><axis:alt f="axisfinv004" c="LIT_FVALOR" lit="1000590"/></c:set>  
                                            <c:set var="title3"><axis:alt f="axisfinv004" c="LIT_IUNIULT" lit="9001310"/></c:set>  
                                            <c:set var="title4"><axis:alt f="axisfinv004" c="LIT_ENTRADAS" lit="9002187"/></c:set> 
                                            <c:set var="title9"><axis:alt f="axisfinv004" c="LIT_ENTRADAS_PENALI" lit="9902862"/></c:set> 
                                            <c:set var="title5"><axis:alt f="axisfinv004" c="LIT_ENTRADAS_TEO" lit="9002188"/></c:set> 
                                            <c:set var="title6"><axis:alt f="axisfinv004" c="LIT_PENTRADA" lit="9002185"/></c:set> 
                                            <c:set var="title7"><axis:alt f="axisfinv004" c="LIT_PENTRADAS_TEO" lit="9002189"/></c:set> 
                                            <c:set var="title8"><axis:alt f="axisfinv004" c="LIT_SALIDAS" lit="9002183"/></c:set>  
                                            <c:set var="title11"><axis:alt f="axisfinv004" c="LIT_PSALIDAS_TEO" lit="9002184"/></c:set> 
                                            <c:set var="title10"><axis:alt f="axisfinv004" c="LIT_PSALIDAS" lit="9002190"/></c:set> 
                                            <c:set var="title12"><axis:alt f="axisfinv004" c="LIT_DIFERENCIA" lit="9002191"/></c:set> 

                                            <div id="dt_recibos" class="seccion displayspacePersonas">
                                                
                                                <display:table name="${listaFondosES}" id="LSTFONDOS" export="false" class="dsptgtable" pagesize="10" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axisfinv004.do?paginar=true"> <%-- offset="${sessionScope.ORDEN_LINEA}" --%>
                                                    
                                                    <display:caption>
                                                    <thead>
                                                    <tr style="cellspacing:2px">    
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#000000;border-bottom-style:solid;text-align:left;"><axis:alt f="axisfinv004" c="LIT_CAB_9002181" lit="9002181"/></th>
                                                            <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#000000;border-bottom-style:solid;">&nbsp;</th>
                                                        <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#000000;border-bottom-style:solid;">&nbsp;</th>
                                                        <axis:visible f="axisfinv004" c="PENTRADA">
                                                            <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#000000;border-bottom-style:solid;">&nbsp;</th>
                                                        </axis:visible>
                                                        <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#BBBBBB;border-bottom-style:solid;text-align:left;"><axis:alt f="axisfinv004" c="LIT_CAB_9002182" lit="9002182"/></th>
                                                        <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#BBBBBB;border-bottom-style:solid;">&nbsp;</th>
                                                        <th class="gridsortable" style="border-bottom-width:2px;border-bottom-color:#BBBBBB;border-bottom-style:solid;">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                    </tr>
                                                    <!--tr>
                                                    <th class="gridsortable" style="" colspan="11">&nbsp;</th>
                                                    </tr -->
                                                    
                                                    <tr style="cellspacing:2px">    
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                            <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <axis:visible f="axisfinv004" c="PENTRADA">
                                                            <th class="gridsortable" style="">&nbsp;</th>
                                                        </axis:visible>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                        <th class="gridsortable" style="">&nbsp;</th>
                                                    </tr>
                                                    
                                                    </thead>
                                                    
                                                    </display:caption>
                                                    
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                    
                                                    <axis:visible f="axisfinv004" c="CCODFON">
                                                        <display:column title="${title0}" sortable="true" sortProperty="CCODFON" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.CCODFON}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>    
                                                    <axis:visible f="axisfinv004" c="TFONABV">
                                                        <display:column title="${title1}" sortable="true" sortProperty="DESCFON" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.TFONABV}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="FVALOR">
                                                        <display:column title="${title2}" sortable="true" sortProperty="FVALOR" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                           <fmt:formatDate value='${LSTFONDOS.OB_IAX_ENTRADASALIDA.FVALOR}' pattern='dd/MM/yyyy'/>
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="IUNIULT">
                                                        <display:column title="${title3}" sortable="true" sortProperty="IUNIULT" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.IUNIULT}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="ENTRADAS">
                                                        <display:column title="${title4}" sortable="true" sortProperty="ENTRADAS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.ENTRADAS}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="ENTRADAS_PENALI">
                                                        <display:column title="${title9}" sortable="true" sortProperty="ENTRADAS_PENALI" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.ENTRADAS_PENALI}
                                                            </div>
                                                        </display:column>   
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="ENTRADAS_TEO">
                                                        <display:column title="${title5}" sortable="true" sortProperty="ENTRADAS_TEO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.ENTRADAS_TEO}
                                                            </div>
                                                        </display:column>   
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="PENTRADA">
                                                        <display:column title="${title6}" sortable="true" sortProperty="PENTRADAS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.PENTRADA}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="PENTRADA_TEO">
                                                        <display:column title="${title7}" sortable="true" sortProperty="PENTRADAS_TEO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.PENTRADA_TEO}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="SALIDAS">
                                                        <display:column title="${title8}" sortable="true" sortProperty="SALIDAS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.SALIDAS}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="PSALIDAS_TEO">
                                                        <display:column title="${title11}" sortable="true" sortProperty="PSALIDAS_TEO" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.PSALIDAS_TEO}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="PSALIDAS">
                                                        <display:column title="${title10}" sortable="true" sortProperty="PSALIDAS" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspNumber">
                                                            ${LSTFONDOS.OB_IAX_ENTRADASALIDA.PSALIDAS}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                    <axis:visible f="axisfinv004" c="DIFERENCIA">
                                                        <display:column title="${title12}" sortable="true" sortProperty="DIFERENCIA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspDate">
                                                             ${LSTFONDOS.OB_IAX_ENTRADASALIDA.DIFERENCIA}
                                                            </div>
                                                        </display:column>
                                                    </axis:visible>
                                                </display:table>                                                        
                                            </div>
                                        </td>
                            </tr>
                                                
                   
                       
                            
                        </table>
                        <div class="separador">&nbsp;</div>
                        
             <div class="separador">&nbsp;</div><!-- 111046 Resultado --><!-- Executar por Imprimir 109006-->
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfinv004</c:param><c:param name="f">axisfinv004</c:param><c:param name="__botones">salir,100001</c:param></c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        <script type="text/javascript">       
        Calendar.setup({
            inputField     :    "FVALOR",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "popup_calendario_ini",  
            singleClick    :    true,
            firstDay       :    1
        });
       </script>
    </body>
</html>