<%/**
*  Fichero: axisctr091.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*
*   pantalla del flujo de trabajo "Contratación póliza". 
*
* 	
*  Pantalla de contratación para el producto de saldo deutores.
*
*
*  Fecha: 27/07/2009
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>          
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                var OK = "${__formdata.OK}";
                
                if (!objUtiles.estaVacio(OK))
                parent.f_aceptar_axisctr091();
                
                revisarEstilos();
            }
            
            function f_but_cancelar() {
              var isSimul = "${__formdata.isSimul}";
              if (objUtiles.estaVacio(isSimul))
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr091", "cancelar", document.miForm, "_self");
            else
             parent.f_cerrar_axisctr091();
            }
                       
            function f_mod_tipimp(id, ctipimp, selsaldo, ISALDO, PORCEN, ILIMITE, ICAPMAX){
                var sel;
                //alert(" Valores: id  "+id+ " , ctimp " + ctipimp + " , saldo " + selsaldo + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
               
                if (objValidador.validaEntrada()) {
                    if (!objUtiles.estaVacio(selsaldo) && selsaldo != 0 && selsaldo != 1)
                        sel = selsaldo.checked ? 1 : 0;
                    
                    if (objUtiles.estaVacio(sel))
                        sel = selsaldo ;
                    
                    if (parseFloat (objNumero.cambiarSeparadorDecimalesPorMiles(PORCEN)) < 0) {
                        PORCEN = 0;
                        alert ("<fmt:message key='9901044'/>");
                    }
                    else if (parseFloat (objNumero.cambiarSeparadorDecimalesPorMiles(PORCEN)) > 100) {
                        PORCEN = 100;
                        alert ("<fmt:message key='9901044'/>");
                    }

                    if (parseFloat (objNumero.cambiarSeparadorDecimalesPorMiles(ICAPMAX)) < 0) {
                        ICAPMAX = 0;
                        alert ("<fmt:message key='9901045'/>");
                    }

                    ICAPMAX = objNumero.cambiarSeparadorMilesPorDecimales(ICAPMAX);
                    ISALDO  = objNumero.cambiarSeparadorMilesPorDecimales(ISALDO);
                    PORCEN  = objNumero.cambiarSeparadorMilesPorDecimales(PORCEN);
                    ILIMITE  = objNumero.cambiarSeparadorMilesPorDecimales(ILIMITE);
                    
                    param = "?ID="+id+"&TIPIMP="+ctipimp+"&SELSALDO="+sel;
                    param = param + "&ISALDO="+ISALDO+"&PORCEN="+PORCEN+"&ILIMITE="+ILIMITE+"&ICAPMAX="+ICAPMAX;

                    objUtiles.ejecutarFormulario ("axis_axisctr091.do"+param, "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
                 }
            }

            function f_but_anterior() {
            
                objUtiles.ejecutarFormulario("axis_axisctr091.do", "anterior", document.miForm, "_self");
            }
            function f_but_siguiente() {
            //     if (objValidador.validaEntrada()) {  
            
                    objUtiles.ejecutarFormulario("axis_axisctr091.do", "siguiente", document.miForm, "_self");
            //    }
            }    
            function f_validar(){
            
                objUtiles.ejecutarFormulario("axis_axisctr091.do", "validar", document.miForm, "_self");
            }
            
            function f_cercarHost(){
            
                objUtiles.ejecutarFormulario("axis_axisctr091.do", "ctrhost", document.miForm, "_self");
            }
            
  /**
        * Método que valida y formatea un campo numérico con el patrón ##.##,##. Si no se valida correctamente, devuelve un ''.
        * @param {Object} valor a validar
        * @param {Boolean} isDecimal: true->es decimal, false->no es decimal
        * @param {Boolean} tienePuntoMiles: true->formatea puntos a los miles, false->no lo hace
        * @return {String} Valor obtenido de la validación y formateo
        */
        function valorFormateadoCampoNumerico (entrada, isDecimal, tienePuntoMiles){
            if (objNumero.validaNumero(entrada, isDecimal)){
                // Validación correcta, formatear valor 
                entrada = objNumero.formateaNumero(entrada, isDecimal);  
                if(!tienePuntoMiles) entrada = objNumero.quitarSeparadorMiles(entrada);
                
            }else{
                return '';
            }
            
            return entrada;
        }
                
        function reformatearImportes(){
             objDom.setValorPorId("ICAPMAXPOL",valorFormateadoCampoNumerico(objDom.getValorPorId("ICAPMAXPOL"),true,false));
             objDom.setValorPorId("TOTAL",valorFormateadoCampoNumerico(objDom.getValorPorId("TOTAL"),true,false));
             
        }
        
        function ChequearTodos(chkbox) { 
            for (var i=0;i < document.forms["form1"].elements.length;i++){ 
                var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked = chkbox.checked 
                    } 
                
            } 
        } 
        
        function ChequearTodosBut() { 

            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
           
            var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        elemento.checked =true;
                    } 
               
            } 
            
            //var elem = document.getElementById("CUENTA");
            var elementCount = document.miForm.CUENTA.value;

            //alert(elementCount);
            for(var j=0;j<elementCount;j++){
                var ID= eval("document.miForm.IDCUENTA_"+j+".value");
                var CTIPIMP= eval("document.miForm.CTIPIMP_"+j+".value");
                var ISALDO= eval("document.miForm.ISALDO_"+j+".value");
                var PORCEN= eval("document.miForm.PORCEN1_"+j+".value");
                var ILIMITE= eval("document.miForm.ILIMITE_"+j+".value");
                var ICAPMAX= eval("document.miForm.ICAPMAX1_"+j+".value");
                
             
               
                //alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
                f_mod_tipimp_one_by_one(ID, CTIPIMP, 1, ISALDO, 0, ILIMITE, 0);
            }
        } 

        function DesChequearTodosBut() { 
            for (var i=0;i < document.forms["miForm"].elements.length;i++){ 
                var elemento = document.forms[0].elements[i]; 
                    if (elemento.type == "checkbox"){ 
                        
                        elemento.checked =false;
                    } 
               
            } 
            
            
            //var elem = document.getElementById("CUENTA");
           var elementCount = document.miForm.CUENTA.value;

            //alert(elementCount);
            for(var j=0;j<elementCount;j++){
                var ID= eval("document.miForm.IDCUENTA_"+j+".value");
                var CTIPIMP= eval("document.miForm.CTIPIMP_"+j+".value");
                var ISALDO= eval("document.miForm.ISALDO_"+j+".value");
                var PORCEN= eval("document.miForm.PORCEN1_"+j+".value");
                var ILIMITE= eval("document.miForm.ILIMITE_"+j+".value");
                var ICAPMAX= eval("document.miForm.ICAPMAX1_"+j+".value");
              
               
               
                //alert(" Valores: id  "+ID+ " , ctimp " + CTIPIMP + " , saldo " + ISALDO + " , porcen " + PORCEN + " , limite " + ILIMITE + " , icapmax " + ICAPMAX);
                f_mod_tipimp_one_by_one(ID, CTIPIMP, 0, ISALDO, PORCEN, ILIMITE, ICAPMAX);
            }
            
            
            
        } 


        function f_mod_tipimp_one_by_one(id, ctipimp, valor_saldo, ISALDO, PORCEN, ILIMITE, ICAPMAX){
                var sel;
                 if (objValidador.validaEntrada()) {
                    //alert("En funcion");
                    if (parseFloat (objNumero.cambiarSeparadorDecimalesPorMiles(PORCEN)) < 0) {
                        PORCEN = 0;
                        alert ("<fmt:message key='9901044'/>");
                    }
                    else if (parseFloat (objNumero.cambiarSeparadorDecimalesPorMiles(PORCEN)) > 100) {
                        PORCEN = 100;
                        alert ("<fmt:message key='9901044'/>");
                    }

                    if (parseFloat (objNumero.cambiarSeparadorDecimalesPorMiles(ICAPMAX)) < 0) {
                        ICAPMAX = 0;
                        alert ("<fmt:message key='9901045'/>");
                    }

                    ICAPMAX = quitarPuntosporComa(ICAPMAX)
                    ISALDO  = quitarPuntosporComa(ISALDO);
                    PORCEN  = quitarPuntosporComa(PORCEN);
                    ILIMITE  = quitarPuntosporComa(ILIMITE);
                    
                    param = "?ID="+id+"&TIPIMP="+ctipimp+"&SELSALDO="+valor_saldo;
                    param = param + "&ISALDO="+ISALDO+"&PORCEN="+PORCEN+"&ILIMITE="+ILIMITE+"&ICAPMAX="+ICAPMAX;

                    objUtiles.ejecutarFormulario ("axis_axisctr091.do"+param, "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            
        }


        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
            <input type="hidden" name="isSimul" value="${__formdata.isSimul}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt c="MODALIDAD" f="axisctr091" lit="101110"/></c:param>
                <c:param name="titulo"></c:param>
                <c:param name="formulario"><axis:alt c="TTITULO" f="axisctr091" lit="9002050"/></c:param>
                <c:param name="form">axisctr091</c:param>
            </c:import>
            <!-- Area de campos  -->
             <div class="separador">&nbsp;</div>
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
              
                <tr>
                    <td>
                     <div class="titulo">
                         <div style="float:left;">
                               <img src="images/flecha.gif"/> <axis:alt c="TTITULO" f="axisctr091" lit="9002050"/>
                            </div>
                            <axis:visible c="BT_HOST" f="axisctr091">
                            <div style="float:right;">
                               <input type="button" class="boton" id="BT_HOST" name ="BT_HOST"   value="<fmt:message key="9000509" />" onclick="f_cercarHost();" />                      
                            </div>
                            </axis:visible>
                            <div style="clear:both;">
                                
                            </div>
                      </div>
                     <table class="seccion">
                           <tr>
                           <td align="left">
                   
                        <!--campos-->
                         
                        <table class="area" align="center">
                            <tr>
                                <th style="width:25%; height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                            </tr>
                            <axis:visible c="DSP_CUENTAS" f="axisctr091">
                            <tr>
                                <td colspan="5">
                                    <!-- displaytag! -->
                                        <c:set var="title0"><axis:alt c="LIT_IDCUENTA" f="axisctr091" lit="1000109"/></c:set>
                                        <c:set var="title1"><axis:alt c="LIT_DESCRIPCION" f="axisctr091" lit="100588"/></c:set>
                                        <c:set var="title2"><axis:alt c="LIT_ISALDO" f="axisctr091" lit="9001942"/></c:set>
                                        <c:set var="title3"><axis:alt c="LIT_CMONEDA" f="axisctr091" lit="9900816"/></c:set>
                                        <c:set var="title5"><axis:alt c="LIT_ICAPMAX" f="axisctr091" lit="105815"/></c:set>
                                        <c:set var="title6"><axis:alt c="LIT_ICAPASEG" f="axisctr091" lit="9002016"/></c:set>
                                        <c:set var="title7"><axis:alt c="LIT_PERCEN" f="axisctr091" lit="%"/></c:set>
                                        <c:set var="title88"><axis:alt c="LIT_ILIMITE" f="axisctr091" lit="108871"/></c:set>
                                       	<c:set var="title9"><axis:alt c="LIT_CTIPIMPORTE" f="axisctr091" lit="100565"/></c:set>
                                        
                                        <div class="displayspaceGrande" style="height:<c:out value="${10*20+20+20}"/>px">
                                    
                                        <%int contador = 0;%>
                                        <input type="hidden" name="CUENTA" id="CUENTA" value="${fn:length(sessionScope.lstsaldodeutors)}">
                                            <display:table name="${sessionScope.lstsaldodeutors}" id="miListaId" export="false" class="dsptgtable" pagesize="10" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr091.do?paginar=true">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                   <c:set var="ctip"><%=contador%></c:set>
                                                   <axis:visible c="RADIO" f="axisctr091">
                                                 <display:column title="" sortable="false" style="width:5%;" sortProperty="selectedClausula" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspIcons">
                                                    <input onclick="javascript:f_mod_tipimp('${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}','${miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP}',this,'${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}','${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}','${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}','${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}')" <c:if test="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']==1}">checked</c:if> 
                                                        type="checkbox" id="selectedSaldo" name="selectedSaldo" value="${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}"/>
                                                    </div>    
                                                </display:column>
                                              </axis:visible>
                                              <axis:visible c="IDCUENTA" f="axisctr091">
                                                <display:column title="${title0}" sortable="false" style="width:18%;" sortProperty="IDCUENTA" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}</div>
                                                    <input type="hidden" name="IDCUENTA_<%= contador %>" id="IDCUENTA_<%= contador %>" value="${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}"/>
                                                    <input type="hidden" name="CTIPIMP_<%= contador %>" id="CTIPIMP_<%= contador %>" value="${miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP}"/>
                                                    <input type="hidden" name="ISALDO_<%= contador %>" id="ISALDO_<%= contador %>" value="${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}"/>
                                                    <input type="hidden" name="PORCEN1_<%= contador %>" id="PORCEN1_<%= contador %>" value="${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}"/>
                                                                                                                                            
                                                    <input type="hidden" name="ILIMITE_<%= contador %>" id="ILIMITE_<%= contador %>" value="${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}"/>
                                                    <input type="hidden" name="ICAPMAX1_<%= contador %>" id="ICAPMAX1_<%= contador %>" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}" />
                                                    
                                                </display:column>
                                                 </axis:visible>
                                              <axis:visible c="DESCRIPCION" f="axisctr091">
                                                <display:column title="${title1}" sortable="false" style="width:19%;" sortProperty="TTIPCUENTA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.DESCRIPCION}</div>
                                                </display:column>
                                                 </axis:visible>
                                              <axis:visible c="CMONEDA" f="axisctr091">
                                                <display:column title="${title3}" style="width:5%;" sortable="false" sortProperty="CMONEDA" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspText">${miListaId.OB_IAX_PRESTAMOSEG.CMONEDA}</div>
                                                </display:column>
                                                 </axis:visible>
                                              <axis:visible c="ISALDO" f="axisctr091">
                                                <display:column title="${title2}" sortable="false" style="width:10%;" sortProperty="ISALDO" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}"/>
                                                        
                                                    </div>
                                                </display:column> 
                                                 </axis:visible>
                                              <axis:visible c="ILIMITE" f="axisctr091">
                                                <display:column title="${title88}" sortable="false" style="width:10%;" sortProperty="ILIMITE" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}"/>
                                                        
                                                    </div>
                                                </display:column> 
                                                 </axis:visible>
                                              <axis:visible c="CTIPIMPORTE" f="axisctr091">
                                                <display:column title="${title9}"
                                                            headerClass="headwidth5 sortable"
                                                            media="html" style="width:12%;"
                                                            autolink="false">
                                                <div class="dspIcons">
                                                    <select name = "CTIPIMPORTE_<%= contador %>" id="CTIPIMPORTE_<%= contador %>" onchange="javascript:f_mod_tipimp('${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}',this.value,'${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}','${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}','${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}','${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}','${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}')"
                                                            class="campowidthselect campo campotexto" title=""
                                                            <axis:atr f="axisctr091" c="CTIPIMPORTE" a="obligatorio=false&isInputText=false"/>>
                                                        &nbsp;
                                                        <option value="null"> - <fmt:message key="108341"/> - </option> 
                                                        <c:forEach var="element"
                                                                   items="${__formdata.listvalores.lsttipimp}">
                                                            <option value="${element.CATRIBU}"
                                                                    <c:if test="${miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP == element.CATRIBU}"> selected="selected"</c:if>>
                                                                ${element.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </display:column> 
                                            </axis:visible>
                                            <axis:visible c="PORCEN" f="axisctr091">
                                            <display:column title="${title7}" sortable="false" style="width:5%;" sortProperty="ILIMITE" headerClass="sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                <%-- <c:choose>
                                                    <c:when test="${!empty miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP &&  miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP == 2}"> --%>
                                                                <input type="text" style="width:95%;"  class="campowidthinput campo campotexto" id="PORCEN_<%= contador %>" name="PORCEN_<%= contador %>" 
                                                                onchange="javascript:f_mod_tipimp('${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}','${miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP}','${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}','${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}',this.value,'${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}','${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}')"
                                                                <axis:atr f="axisctr091" c="PORCEN_<%= contador %>" a="isInputText=true"/>
                                                                size="15" value="<fmt:formatNumber pattern='###,##0.00' value='${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}'/>"/>
                                                 <%--   </c:when> 
                                                     <c:otherwise>
                                                               &nbsp; 
                                                    </c:otherwise>  
                                                </c:choose> --%>
                                             </div>
                                            </display:column>
                                             </axis:visible>
                                              <axis:visible c="ICAPMAX" f="axisctr091">
                                             

                                                <display:column title="${title5}" style="width:8%;" sortable="false" sortProperty="ICAPMAX" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <input type="text" style="width:80%;"  class="campowidthinput campo campotexto" id="ICAPMAX_<%= contador %>" name="ICAPMAX_<%= contador %>" 
                                                        <axis:atr f="axisctr091" c="ICAPMAX_<%= contador %>" a="isInputText=true"/>
                                                        onchange="javascript:f_mod_tipimp('${miListaId.OB_IAX_PRESTAMOSEG.IDCUENTA}','${miListaId.OB_IAX_PRESTAMOSEG.CTIPIMP}','${miListaId.OB_IAX_PRESTAMOSEG['SELSALDO']}','${miListaId.OB_IAX_PRESTAMOSEG.ISALDO}','${miListaId.OB_IAX_PRESTAMOSEG.PORCEN}','${miListaId.OB_IAX_PRESTAMOSEG.ILIMITE}',this.value)"
                                                        size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${miListaId.OB_IAX_PRESTAMOSEG.ICAPMAX}'/>"/>
                                                    </div>
                                                </display:column> 
                                                 </axis:visible>
                                              <axis:visible c="ICAPASEG" f="axisctr091">  
                                                <display:column title="${title6}" sortable="false" style="width:8%;" sortProperty="ICAPASEG" headerClass="sortable"  media="html" autolink="false" >
                                                    <div class="dspNumber">
                                                        <fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId.OB_IAX_PRESTAMOSEG.ICAPASEG}"/>
                                                    </div>
                                                </display:column> 
                                                 </axis:visible>
                                              
                                                
                                                
                                                <%contador++;%>
                                            </display:table>
                                            
                                            </div>
                                            <input type="button" onclick="ChequearTodosBut()" class="boton" value="<fmt:message key="9000756"/>"/>
                                            <input type="button" onclick="DesChequearTodosBut()" class="boton" value="<fmt:message key="9000757"/>"/>
                                        
                                </td>
                            </tr>
                            </axis:visible>
                           
                            <tr>
                             <axis:visible c="TOTAL" f="axisctr091">
                                <td class="campocaja" colspan="5" align="right">
                                    <b><axis:alt c="LIT_TOTAL" f="axisctr091" lit="9900811"/></b>&nbsp;
                                    <input type="text" style="width:8%;"  class="campowidthinput campo campotexto" id="TOTAL" name="TOTAL" 
                                    <axis:atr f="axisctr091" c="TOTAL" a="modificable=false&isInputText=true"/>
                                    size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.TOTAL}'/>"/>
                                </td>
                                  </axis:visible>
                            </tr>
                          
                            
                            <tr>
                            <axis:visible c="ICAPMAXPOL" f="axisctr091">
                                <td class="campocaja" colspan="5" align="right">
                                    <b><axis:alt c="LIT_ICAPMAXPOL" f="axisctr091" lit="9002025"/></b>&nbsp;
                                    <input type="text" style="width:8%;"  class="campowidthinput campo campotexto" id="ICAPMAXPOL" name="ICAPMAXPOL" 
                                    <axis:atr f="axisctr091" c="ICAPMAXPOL" a="modificable=true&isInputText=true"/>
                                    size="15" value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${__formdata.ICAPMAXPOL}'/>"/>
                                </td>
                                </axis:visible>
                            </tr>
                            
                             <tr>
                                <axis:visible f="axisctr091" c="BT_VALIDAR"> 
                                    <td class="campocaja" align="center" colspan="5" >
                                        <div class="separador">&nbsp;</div>
                                        <input type="button" class="boton" id="BUT_VALIDAR" value="<fmt:message key="101688" />" onclick="javascript:f_validar()" />
                                    <td>
                                </axis:visible>
                            </tr>
                          <tr>
                           <axis:visible c="ICAPITAL_SIMUL" f="axisctr091">
                            <td class="titulocaja">
                                 <b><axis:alt c="LIT_ICAPITAL_SIMUL" f="axisctr091" lit="1000073"/></b>
                            </td>
                            </axis:visible>
                          </tr>
                            <tr>
                              <axis:visible c="ICAPITAL_SIMUL" f="axisctr091">
                                <td class="campocaja"> 
                                    <input type="text"  class="campowidthinput campo campotexto" id="ICAPITAL_SIMUL" name="ICAPITAL_SIMUL" 
                                    <axis:atr f="axisctr091" c="ICAPITAL_SIMUL" a="modificable=true&isInputText=true"/>
                                    size="15" value="<c:if test="${!empty sessionScope.lstsaldodeutors}"><fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${sessionScope.lstsaldodeutors[0].OB_IAX_PRESTAMOSEG.ISALDO}'/></c:if>"   />                                
                                </td>
                            </axis:visible>
                            </tr>
                        
                        </table>
                        
                    </td>
                </tr>
                
                
            </table>
            </td>
                </tr>
                
                
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr091</c:param>
                <c:param name="__botones"><axis:visible f="axisctr091" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisctr091" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr091" c="BT_SIG">,siguiente</axis:visible></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp" />
    </body>
</html>

