<%/*
*  Fichero: axisctr213.jsp
*  Fecha: 25/09/2013
*/
%>

<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"></style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
            
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

        function f_onload() {
        	 <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
							retocarPAGE_CSS('axisctr213');
					</c:if>
            f_cargar_propiedades_pantalla(); 
            
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
        }
        
     
        
        function f_but_aceptar (cual, cont) {
            var NNUMCASO = "";      
            var NSOLICI_BPM = "";      
            var NCASO_BPM = "";
            var i ="";            
            
             if (!objUtiles.estaVacio(cont))                    
            {
                NNUMCASO = document.getElementById("NNUMCASO_"+cont).value; 
                NSOLICI_BPM = document.getElementById("NSOLICI_BPM_"+cont).value;     
                NCASO_BPM = document.getElementById("NCASO_BPM_"+cont).value;     
            }
            
            //if (!objUtiles.estaVacio(cual) || !objUtiles.estaVacio(cont) )           
            if (!objUtiles.estaVacio(NNUMCASO) || !objUtiles.estaVacio(cont) )           
                // Seleccionada por el hipervínculo
                NNUMCASO = cual;                       
           
            else if (!objUtiles.estaVacio(document.miForm.seleccionaCaso)) {
                // Checkeada por el radio button
                i = objUtiles.f_GuardaCasillasChecked("seleccionaCaso");
                NNUMCASO = document.getElementById("NNUMCASO_"+i).value;
                NSOLICI_BPM = document.getElementById("NSOLICI_BPM_"+i).value; 
                NCASO_BPM = document.getElementById("NCASO_BPM_"+i).value;     
                //TURL = document.getElementById("TURL_"+i).value;
                //SSEGURO = objUtiles.f_GuardaCasillasChecked("checked_poliza"); 
            }             
           
            
            if (typeof NNUMCASO == 'boolean' || (objUtiles.estaVacio (NNUMCASO) && objUtiles.estaVacio(NNUMCASO)) ) 
                alert(objJsMessages.jslit_selecciona_una_poliza);
            else
            {
                // Si hay una seleccionada, llamar al Action.
              if (!objUtiles.estaVacio(NNUMCASO))                     
                    parent.f_aceptar_axisctr213(NNUMCASO,NCASO_BPM,NSOLICI_BPM);   
            //  else                                 
            //      objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCargarURL, "operation=ajax_cargar_url&SPRODUC=" + SPRODUC+"&NPOLIZA = "+NPOLIZA, this, objJsMessages.jslit_cargando);                                  
             
            }
         }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr213();
        }        
        
        function f_but_buscar() {
            //Si la validación es correcta, ejecutamos la acción
            f_habilitar_campos();
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisctr213.do", "busqueda", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
        }
         
         
         function f_cargar_productos(){
                CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                 if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
                url ="operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
              //  if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CCOMPANI)) ){
              //      url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.CCOMPANI);
              //  }
                url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                objAjax.invokeAsyncCGI("modal_axisctr019.do", callbackAjaxCargarProductos, url, this, objJsMessages.jslit_cargando);
        }    
        
        function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr019" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   

                }
                
                
            }    
            
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
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
  
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
    	<div id="wrapper" class="wrapper">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
             <input type="hidden" id="DONDE" name="DONDE" value="${__formdata.DONDE}"/>
             <input type="hidden" id="BLOQUSUASIG" name="BLOQUSUASIG" value="${__formdata.BLOQUSUASIG}"/>
             
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="formulario" f="axisctr213" lit="9906011" /></c:param>
                <c:param name="producto"><axis:alt c="producto" f="axisctr213" lit="9906011" /></c:param>
                <c:param name="form">axisctr213</c:param>
            </c:import>
            
            <input type="hidden" id="CONDICION" name="CONDICION" value="${__formdata.CONDICION}"/> 
            
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:15%;height:0%;"/>
                                <th style="width:25%;height:0%;"/>
                                <th style="width:20%;height:0%;"/>
                                <th style="width:25%;height:0%;"/>
                                <th style="width:15%;height:0%;"/>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="CODBPM" f="axisctr213" lit="9905993" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="SOLBPM" f="axisctr213" lit="9905998" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="USUASIG" f="axisctr213" lit="9905999" /></b>
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['CODBPM']}" formato="entero" name="CODBPM" id="CODBPM" 
                                    style="width:90%" title="<axis:alt c="CODBPM" f="axisctr213" lit="9000531"/>"<axis:atr f="axisctr213" c="CODBPM" />/> 
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SOLBPM']}" name="SOLBPM" id="SOLBPM" size="15"
                                    style="width:97%" title="<axis:alt c="SOLBPM" f="axisctr213" lit="105940"/>"/>
                                </td>
                                    <td class="campocaja" colspan="2">   
                                            <select name="USUASIG" id="USUASIG" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                                <c:if test="${__formdata.BLOQUSUASIG == 0}"> <axis:atr f="axisctr213" c="USUASIG" a="modificable=false&isInputText=false"/> </c:if> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr213" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTUSUARIOS}">
                                                    <option value = "${element.CUSER}"
                                                    <c:if test="${__formdata.USUASIG == element.CUSER}"> selected = "selected"</c:if>>
                                                        ${element.CUSER} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                    </td>
                            </tr>
                            <tr>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisctr213" c="ESTCASO" lit="9906008"/></b> 
                                    </td>
                                    <td class="titulocaja" >
                                        <b><axis:alt f="axisctr213" c="TIPMOV" lit="9906010"/></b> 
                                    </td>
                            </tr>
                             <tr>
                                 <td class="campocaja" colspan="2">                                
                                            <select name="ESTCASO" id="ESTCASO" size="1" class="campowidthselect campo campotexto" style="width:79%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr213" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTESTCASO}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.ESTCASO == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                 <td class="campocaja" colspan="2">                                
                                            <select name="TIPMOV" id="TIPMOV" size="1" class="campowidthselect campo campotexto" style="width:60%;">&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr213" c="SELECC" lit="1000348"/> - </option>
                                                <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPMOV}">
                                                    <option value = "${element.CATRIBU}"
                                                    <c:if test="${__formdata.TIPMOV == element.CATRIBU}"> selected = "selected"</c:if>>
                                                        ${element.TATRIBU} 
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>       
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr019" c="CRAMO" lit="100784"></axis:alt></b>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr019" c="DESPRODUCTO" lit="100829" /></b>
                                </td>
                                <td class="titulocaja">
                                    
                                   <table>
                                        <tr>
                                            <axis:ocultar f="axisctr019" c="POLIZA">
                                            <td class="titulocaja" nowrap="nowrap">
                                                <b><axis:alt f="axisctr019" c="POLIZA" lit="101273" /></b>
                                            </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axisctr019" c="NCERTIF">
                                            <td class="titulocaja"  >
                                                <b><axis:alt f="axisctr019" c="NCERTIF" lit="9900942"></axis:alt></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                   </table>
                                </td>
                            </tr>
                            <tr>
                                <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:200px;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo"
                                         <c:if test="${__formdata.BLOQCRAMO == 0}"> <axis:atr f="axisctr213" c="ramoProducto" a="modificable=false&isInputText=false"/> </c:if>>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr019" c="BLANCO" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                </td>                           
                                <td class="campocaja" colspan="2"> 
                                    <select name = "SPRODUC" id ="SPRODUC" size="1"  class="campowidthselect campo campotexto" style="width:90%"
                                     <c:if test="${__formdata.BLOQSPRODUC == 0}"> <axis:atr f="axisctr213" c="SPRODUC" a="modificable=false&isInputText=false"/> </c:if>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr213" c="SPRODUC" lit="108341" /> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" style="width:90px" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisctr019" c="NUPOLIZA" lit="100836"/>" size="15" 
                                            title="<axis:alt f="axisctr019" c="NUPOLIZA" lit="100836"/>" />&nbsp;&nbsp;
                                            <axis:ocultar f="axisctr019" c="NCERTIF">
                                            <input type="text" class="campowidthinput campo campotexto" size="8" style="width:60px" value="${__formdata.NCERT}" name="NCERT" id="NCERT"
                                                formato="entero" title="<axis:alt f="axisctr019" c="CCERTIF" lit="101096"/>"/>
                                            </axis:ocultar>
                                </td>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt c="NUMIDE" f="axisctr213" lit="9904434" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt c="NOMTOM" f="axisctr213" lit="105940" /></b>
                                </td>
                                
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NUMIDE']}" formato="entero" name="NUMIDE" id="NUMIDE" 
                                    style="width:90%" title="<axis:alt c="NUMIDE" f="axisctr213" lit="9000531"/>"<axis:atr f="axisctr213" c="NUMIDE" />/> 
                                </td>
                                <td class="campocaja" colspan="2">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['NOMTOM']}" name="NOMTOM" id="NOMTOM" size="15"
                                    style="width:90%" title="<axis:alt c="NOMTOM" f="axisctr213" lit="105940"/>"/>
                                </td>
                            </tr>
                           
                        </table>

                        <div class="separador">&nbsp;</div>
                        <!-- DisplayTag Agentes -->
                        <c:set var="title0"><axis:alt c="NCASO_BPM" f="axisctr213" lit="9906029"/></c:set>
                        <c:set var="title1"><axis:alt c="NSOLICI_BPM" f="axisctr213" lit="9906030"/></c:set>
                        <c:set var="title2"><axis:alt c="TESTADO" f="axisctr213" lit="9905523"/></c:set>
                        <c:set var="title3"><axis:alt c="NNUMIDE" f="axisctr213" lit="9904434"/></c:set>
                        <c:set var="title4"><axis:alt c="TNOMCOM" f="axisctr213" lit="105940"/></c:set>
                        <c:set var="title5"><axis:alt c="TPRODUC" f="axisctr213" lit="100829"/></c:set>
                        <c:set var="title6"><axis:alt c="TTIPMOV_BPM" f="axisctr213" lit="9906010"/></c:set>
                        <c:set var="title7"><axis:alt c="NPOLIZA" f="axisctr213" lit="800242"/></c:set>
                        
                        <%int contador = 0;%>
                        
                        <div class="seccion displayspaceGrande">
                            <display:table name="${__formdata.LSTCASOS}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr213.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                <%@ include file="../include/displaytag.jsp"%>
                                <c:set var="contador"><%=contador%></c:set>
                                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >    
                                    <div class="dspIcons"><input type="radio" id="seleccionaCaso" name="seleccionaCaso" value="${contador}"/></div>
                                    <input type="hidden" id="NNUMCASO_${contador}" name="NNUMCASO_${contador}" value="${miListaId['NNUMCASO']}"/>
                                    <input type="hidden" id="NCASO_BPM_${contador}" name="NCASO_BPM_${contador}" value="${miListaId['NCASO_BPM']}"/>
                                    <input type="hidden" id="NSOLICI_BPM_${contador}" name="NSOLICI_BPM_${contador}" value="${miListaId['NSOLICI_BPM']}"/>
                                </display:column>
                                 <display:column title="${title0}" sortable="true" sortProperty="NCASO_BPM" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspNumber"><a href="javascript:f_but_aceptar('${miListaId['NNUMCASO']}','${contador}')">${miListaId['NCASO_BPM']}</a></div>
                                </display:column>                                
                                <display:column title="${title1}" sortable="true" sortProperty="NSOLICI_BPM" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspNumber">${miListaId['NSOLICI_BPM']}</div>
                                </display:column>
                                <display:column title="${title2}" sortable="true" sortProperty="TESTADO" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspNumber">${miListaId['TESTADO']}</div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="NNUMIDE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['NNUMIDE']}</div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="TNOMCOM" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TNOMCOM']}</div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="TPRODUC" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TPRODUC']}</div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="TTIPMOV_BPM" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText">${miListaId['TTIPMOV_BPM']}</div>
                                </display:column>
                                <display:column title="${title7}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspNumber">${miListaId['NPOLIZA']}</div>
                                </display:column>
                         <%--       <display:column title="${title1}" sortable="true" sortProperty="NOMBRE" headerClass="sortable"  media="html" autolink="false" >
                                    <div class="dspText"><a href="javascript:f_seleccionar_agente('${miListaId['CODI']}')">${miListaId['NOMBRE']}</a></div>
                                </display:column> --%>
                                <%contador++;%>
                            </display:table>
                        
                        </div>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr213</c:param>        
                <c:param name="__botones">cancelar,buscar,aceptar</c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
        </div>
    </body>
</html>