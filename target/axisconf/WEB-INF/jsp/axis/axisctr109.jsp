<%--
      NOMBRE:    axisctr109.jsp
      @author <a href = "mailto:pfeliu@csi-ti.com">Autor creación</a>
      Fecha: 15/09/2010
      PROPÓSITO (descripción pantalla): Cartas Fe de Vida
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        15/09/2010   PFA(iniciales)     1. Creación de la pantalla. Bug.16000
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
        
        
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var CEMPRES = "${__formdata.CEMPRES}";
                var FEFECTO = "${__formdata.FEFECTO}";
                if (objUtiles.estaVacio(CEMPRES)||objUtiles.estaVacio(FEFECTO))     
                    f_abrir_modal("axisctr110");
                
                objEstilos.toggleDisplay("datosgenerales", document.getElementById("datosgenerales_parent"));
                objEstilos.toggleDisplay("detalle", document.getElementById("detalle_parent"));               
                objEstilos.toggleDisplay("imprimir", document.getElementById("imprimir_parent"));
              
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
 	    }
        
              
            
            function f_abrir_modal(cual) {
                objDom.setValorPorId("PNOMFICH",  "");
                objDom.setValorPorId("SPROCES",  "");
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init");   
            }
            
            function f_cerrar_modal(cual){
                 objUtiles.cerrarModal(cual);
            }
            
            function f_aceptar_axisctr110(CEMPRES,CRAMO,SPRODUC,CAGENTE,NOMBRE,NPOLIZA,NCERTIF,FEFECTO,SPROCES,TEMPRES,TTITULO,TRAMO){
                objUtiles.cerrarModal('axisctr110');
                objDom.setValorPorId("CEMPRES",  CEMPRES);
                //objDom.setValorPorId("TEMPRES",  TEMPRES);
                objDom.setValorPorId("CRAMO",  CRAMO);
                //objDom.setValorPorId("TRAMO",  TRAMO);
                objDom.setValorPorId("SPRODUC",  SPRODUC);
                //objDom.setValorPorId("TTITULO",  TTITULO);
                objDom.setValorPorId("CAGENTE",  CAGENTE);
                objDom.setValorPorId("NOMBRE_TEXT",  NOMBRE);
                objDom.setValorPorId("NPOLIZA",  NPOLIZA);
                objDom.setValorPorId("NCERTIF",  NCERTIF);
                objDom.setValorPorId("FEFECTO",  FEFECTO);
                objDom.setValorPorId("SPROCES",  SPROCES);                        
                objUtiles.ejecutarFormulario("axis_axisctr109.do?CEMPRES="+CEMPRES+"&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC, "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr109", "cancelar", document.miForm, "_self");
            }
            
             function f_but_GENERAR(PNGENERAR) {
                var CEMPRES = objDom.getValorPorId("CEMPRES");
                var CRAMO = objDom.getValorPorId("CRAMO");
                var SPRODUC = objDom.getValorPorId("SPRODUC");
                
                objUtiles.ejecutarFormulario("axis_axisctr109.do?CEMPRES="+CEMPRES+"&CRAMO="+CRAMO+"&SPRODUC="+SPRODUC+"&PNGENERAR="+PNGENERAR, "montar_fichero", document.miForm, "_self", objJsMessages.jslit_cargando);                               
                
            }
            
           
            
          /*  function f_imprimir_fitxer(pfitxer){
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+pfitxer,600,200);
            } */ 
            
             function f_imprimir_fitxer(cont){                    
                
                pfitxer = document.getElementById('SORTIDA_'+cont).value;
                var str2 = pfitxer.replace(/barrainvertida/gi, "\\");        
                
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?mantenerExtension=mantenerExtension&mimetype="+escape("text/xml")+"&operation=tunnel&file="+str2,600,200);
                //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+str2+"&origen=axislist002.jsp",600,200);
            }  
            
            
            
          
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <%--Declaración de modales, en el caso que se quiera la aspa de cerrar de la ventana modal será necesario incluir |true en 
    caso contrario no poner nada.--%>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisctr110|<axis:alt c="form" f="axisctr110" lit="9901458"/></c:param>
    </c:import>
   


    <form name="miForm" action="" method="POST">
       <input type="hidden" id="operation" name="operation" value=""/>
       <input type="hidden" id="TIPO" name="TIPO" value="FE_DE_VIDA"/>                
       <input type="hidden" name="NRIESGO" id="NRIESGO" value="${__formdata.NRIESGO}"/>              
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axisctr109" lit="9901458"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axisctr109" lit="9901458"/></c:param>
                <c:param name="form">axisctr109</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr109" c="MDL_AXISIMPRIMIR" lit="1000205" />|true</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axisctr109" c="TITULO" lit="103593"/>
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_modal('axisctr110')" style="cursor:pointer"/>                
                        </div> <%-- Datos Generales--%>
                        <table class="seccion">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <th style="height:0px"></th>
                                    </tr>
                                    <!-- Datos Generales -->
                                    <tr>
                                        <td class="campocaja" >          
                                            <div style="float:left;">
                                                <img id="datosgenerales_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datosgenerales', this)" style="cursor:pointer"/> 
                                                <b><axis:alt f="axisctr109" c="DATOS_GENERALES" lit="103593"/></b>
                                            </div>
                                            <div style="clear:both;">
                                                <hr class="titulo">
                                            </div>
                                        </td>
                                    </tr>                                    
                                    <tr id="datosgenerales_children" style="display:none">
                                        <td align="left" >
                                        <!-- Área 1 -->
                                            <table class="area" align="center">
                                                <tr>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                    <th style="width:20%;height:0px"></th>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisctr109" c="CEMPRES"  dejarHueco="false">
                                                        <td class="titulocaja" id="td_CEMPRES" >
                                                            <b id="label_TEMPRES"><axis:alt f="axisctr109" c="CEMPRES" lit="101619" /></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr109" c="CRAMO" dejarHueco="false">
                                                        <td class="titulocaja" id="td_CRAMO">
                                                            <b id="label_TRAMO"><axis:alt f="axisctr109" c="CRAMO" lit="100784" /></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <axis:ocultar f="axisctr109" c="SPRODUC"  dejarHueco="false">
                                                        <td class="titulocaja" id="tit_TTITULO" colspan="2">
                                                            <b id="label_TTITULO"><axis:alt c="SPRODUC" f="axisctr109" lit="100829"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>                                        
                                                   <%-- Empresa --%>                                            
                                                    <axis:ocultar f="axisctr109" c="CEMPRES" dejarHueco="false">
                                                        <td class="campocaja"  >
                                                            <select name="CEMPRES" id ="CEMPRES" size="1"  class="campowidthinput campo campotexto" style="width:100%"
                                                            title="<axis:alt f="axisctr109" c="CEMPRES" lit="101619"/>" 
                                                            <axis:atr f="axisctr109" c="CEMPRES" a="isInputText=false&obligatorio=false&modificable=false"/>>
                                                                <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr109" c="SNV_COMBO" lit="108341"/> - </option>                                                                                                        
                                                                <c:forEach items="${__formdata.LSTEMPRESAS}" var="item">
                                                                    <option value = "${item.CEMPRES}" <c:if test="${!empty __formdata.CEMPRES && __formdata.CEMPRES == item.CEMPRES}"> selected </c:if>>${item.TEMPRES}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>   
                                                    </axis:ocultar>
                                                    
                                                    <axis:ocultar f="axisctr109" c="CRAMO" dejarHueco="false">
                                                        <td class="campocaja" id="td_CRAMO">
                                                            <select name = "CRAMO" id="CRAMO" style="width:100%;" size="1"  title="<axis:alt f="axisctr109" c="CRAMO" lit="100784"/>"                                                            
                                                            <axis:atr f="axisctr110" c="CRAMO" a="modificable=false&obligatorio=false&isInputText=false"/> 
                                                            class="campowidthselect campo campotexto">
                                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr109" c="SNV_COMBO" lit="108341"/> - </option>
                                                                <c:forEach var="ramos" items="${__formdata.axisctr_listaRamos}">
                                                                    <option value = "${ramos.CRAMO}" onclick="objDom.setValorPorId('TRAMO','${ramos.TRAMO}')"
                                                                        <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                                        ${ramos.TRAMO}
                                                                    </option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                    </axis:ocultar>                                                     
                                                    <%-- Producto --%>
                                                    <axis:ocultar f="axisctr109" c="SPRODUC" dejarHueco="false">
                                                        <td class="campocaja" id="td_SPRODUC" colspan="2">
                                                            <select name="SPRODUC" id ="SPRODUC" size="1" class="campo campotexto" style="width:100%"
                                                            title="<axis:alt f="axisctr109" c="SPRODUC" lit="100829"/>" <axis:atr f="axisctr109" c="SPRODUC" a="isInputText=false&modificable=false"/>>
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr109" c="SNV_COMBO" lit="108341"/> - </option>
                                                                <c:forEach items="${__formdata.productos}" var="item">
                                                                    <option value = "${item.SPRODUC}"  <c:if test="${!empty __formdata.SPRODUC  && __formdata.SPRODUC == item.SPRODUC}"> selected </c:if>>${item.TTITULO}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                                <tr>
                                                    <axis:ocultar f="axisctr109" c="CAGENTE" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_CAGENTE" colspan="2">
                                                            <b id="label_CAGENTE"><axis:alt f="axisctr109" c="CAGENTE" lit="100584"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <%-- Número de póliza --%>
                                                    <axis:ocultar c="NPOLIZA" f="axisctr109" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_NPOLIZA">
                                                            <b id="label_NPOLIZA"><axis:alt f="axisctr109" c="NPOLIZA" lit="100624"/></b>
                                                        </td>    
                                                    </axis:ocultar>
                                                    <%-- Número certificado --%>
                                                    <axis:ocultar c="NCERTIF" f="axisctr109" dejarHueco="false">
                                                        <td class="titulocaja" id="tit_NCERTIF">
                                                            <b id="label_NCERTIF"><axis:alt f="axisctr109" c="NCERTIF" lit="101300"/></b>
                                                        </td>
                                                    </axis:ocultar>
                                                    <!-- Fecha efecto -->
                                                    <axis:ocultar f="axisctr109" c="FEFECTO" dejarHueco="false"> 
                                                        <td class="titulocaja" id="tit_FEFECTO">
                                                            <b id="label_FEFECTO"><axis:alt f="axisctr109" c="FEFECTO" lit="9002169"/></b>
                                                        </td>
                                                    </axis:ocultar>                                      
                                                </tr>
                                                <tr>
                                                   <axis:ocultar c="CAGENTE" f="axisctr109" dejarHueco="false">
                                                        <td class="campocaja" colspan="2" id="TD_CAGENTE">                                                
                                                            <input readonly="true" type="text" style="width:20%;" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" class="campowidthinput campo campotexto"/>&nbsp;&nbsp;&nbsp;<input readonly="true" type="text" style="width:70%;" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${__formdata.NOMBRE_TEXT}" class="campowidthinput campo campotexto"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <%-- Número de póliza --%>
                                                    <axis:ocultar c="NPOLIZA" f="axisctr109" dejarHueco="false">
                                                        <td class="campocaja" id="TD_NPOLIZA">
                                                            <input readonly="true" type="text" style="width:50%;" name="NPOLIZA" id="NPOLIZA" value="${__formdata.NPOLIZA}" class="campowidthinput campo campotexto"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <%-- Número certificado --%>
                                                    <axis:ocultar c="NCERTIF" f="axisctr109" dejarHueco="false">
                                                        <td class="campocaja" id="TD_NCERTIF">
                                                            <input readonly="true" type="text" style="width:50%;" name="NCERTIF" id="NCERTIF" value="${__formdata.NCERTIF}" class="campowidthinput campo campotexto"/>
                                                        </td>
                                                    </axis:ocultar>
                                                    <!-- Fecha efecto -->
                                                    <axis:ocultar f="axisctr109" c="FEFECTO" dejarHueco="false">
                                                        <td class="campocaja" id="TD_FEFECTO">                                                            
                                                            <input readonly="true" type="text" style="width:50%;" name="FEFECTO" id="FEFECTO" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEFECTO}"/>" class="campowidthinput campo campotexto"/>
                                                        </td>
                                                    </axis:ocultar>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    
                                    <axis:ocultar f="axisctr109" c="DETALLE" dejarHueco="false">     
                                        <tr>
                                            <td class="campocaja" >          
                                                <div style="float:left;">
                                                    <img id="detalle_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('detalle', this)" style="cursor:pointer"/> 
                                                    <b><axis:alt f="axisctr109" c="DETALLE" lit="9901477"/></b>
                                                </div>
                                                <div style="clear:both;">
                                                    <hr class="titulo">
                                                </div>
                                            </td>
                                        </tr>                                    
                                        <tr id="detalle_children" style="display:none">
                                            <td align="left" >                                     
                                                <!-- DisplayTag Lista de Campos -->
                                                <c:set var="title0"></c:set>                                            
                                                <div class="displayspace" >
                                                    <display:table name="listaCampos" id="listaCampos" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                                        requestURI="axis_axisctr109.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>                                                    
                                                        <axis:visible c="CAMPOS" f="axisctr109">
                                                            <display:column title="${title0}" sortable="true" sortProperty="CAMPOS" headerClass="headwidth10 sortable" media="html" autolink="false" >
                                                                <div class="dspText">${listaCampos.CAMPOS}</div>
                                                            </display:column>                                                   
                                                        </axis:visible>
                                                    </display:table>
                                                </div> 
                                            </td>
                                        </tr>
                                        
                                        <c:if test="${!empty listaCampos}">
                                            <axis:visible c="but_GENERAR" f="axisctr109">
                                                <tr>
                                                </tr>
                                                <tr class="campocaja" align="right">
                                                    <td>
                                                        <input type="button" class="boton" id="but_GENERAR" onclick="f_but_GENERAR('0')" value="<axis:alt f="axisctr109" c="GENERAR" lit="9901499" />"/>
                                                    </td>   
                                                </tr>
                                            </axis:visible>
                                        </c:if>  
                                    </axis:ocultar>
                                    
                                    <%-- Tabla de impresión--%>                                    
                                    <axis:ocultar c="LISTAIMPRESION" f="axisctr109" dejarHueco="false">
                                            <tr>
                                                <td class="campocaja" >          
                                                    <div style="float:left;">
                                                        <img id="imprimir_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('imprimir', this)" style="cursor:pointer"/> 
                                                        <b><axis:alt f="axisctr109" c="IMPRESION" lit="9000702"/></b>
                                                    </div>
                                                    <div style="clear:both;">
                                                        <hr class="titulo">
                                                    </div>
                                                </td>
                                            </tr>     
                                            <tr id="imprimir_children" style="display:none">
                                                <td align="left" >
                                                <!-- Área 1 -->           
                                                    <table class="area" align="center">
                                                        <tr>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                            <th style="width:25%;height:0px"></th>
                                                        </tr>                                                       
                                                        <axis:ocultar c="SPROCES" f="axisctr109" dejarHueco="false">                                                    
                                                        <tr>
                                                            <td class="titulocaja">
                                                                <b><axis:alt f="axisctr109" c="SPROCES" lit="9001242"/></b> <%-- Procés --%>
                                                            </td>   
                                                        </tr>
                                                        <tr>
                                                            <td class="campocaja">                                                              
                                                                <input type="text" style="width:80%;" name="SPROCES" id="SPROCES" value="${__formdata.SPROCES}" class="campowidthinput campo campotexto"/>                                                             
                                                            </td> 
                                                            <axis:visible c="but_9000754" f="axisctr109">
                                                            <td class="campocaja">
                                                                  <input type="button" class="boton" id="but_9000754" onclick="f_but_GENERAR('1')" value="<axis:alt f="axisctr109" c="SPROCES" lit="9000754" />"/> 
                                                            </td>   
                                                            </axis:visible>
                                                        </tr>                                                      
                                                        </axis:ocultar>   
                                                           <c:if test="${!empty __formdata.PNOMFICH}">
                                                            <axis:ocultar c="IMPRIMIR" f="axisctr109" dejarHueco="false">                                                        
                                                                    <%--tr>
                                                                     <axis:ocultar f="axisctr109" c="PNOMFICH" dejarHueco="false">
                                                                        <td colspan="7" class="titulocaja">
                                                                               <b id="label_LINKS"><axis:alt f="axisctr109" c="TIT_FITX" lit="107913"/> </b>
                                                                        </td>
                                                                        </axis:ocultar>
                                                                    </tr--%>
                                                                    <tr>
                                                                     <axis:ocultar f="axisctr109" c="PNOMFICH" dejarHueco="false">
                                                                        
                                                                           <td class="campocaja" id="PNOMFICH_td" colspan="2">
                                                                           <b id="label_LINKS"></b>
                                                                        <%int cont = 0;%>
                                                                         <c:set var="title0"><axis:alt f="axisctr109" c="FICHERO" lit="107913"/>  </c:set>
                                                                          <div class="seccion displayspace">
                                                                              <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="20" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                                             requestURI="axis_axisctr109.do?paginar=true" style="width:99.9%">
                                                                            <%@ include file="../include/displaytag.jsp"%>
                                                                            <c:set var="i"><%=cont%></c:set>
                                                                            <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                                                               <a href="javascript:f_imprimir_fitxer('${i}')"> ${OBFICHERO.OB_IAX_IMPRESION.FICHERO}</a>
                                                                               <input type="hidden" 
                                                                                   style="text-decoration:underline;background-color:transparent;border:0;cursor:pointer" 
                                                                                   class="campowidthinput campo campotexto" size="15"  name="SORTIDA_${i}" id="SORTIDA_${i}"
                                                                                   value="${OBFICHERO.OB_IAX_IMPRESION.FICHERO}"/>                                     
                                                                            </display:column>   
                                                                            <% cont ++ ;%>
                                                                            </display:table>
                                                                            </div>
                                                        
                                                                          </td> 
                                                                          </axis:ocultar>
                                                                    </tr>
                                                                    
                                                                    <div class="separador">&nbsp; </div>
                                                                </axis:ocultar>                                                       
                                                           </c:if>
                                                        
                                                    </table>
                                                </td>
                                            </tr>                                         
                                            </axis:ocultar>   
                                        
                                        
                                        
                                </table>
                            </td>
                        </tr>
                        
                        </table>
                    </td> 
                </tr>
                                   
                                        
               
            </table>
            <div class="separador">&nbsp;</div>
    </form>
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axisctr109</c:param>
   <c:param name="__botones"><axis:ocultar f="axisctr109" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


