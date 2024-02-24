<%
/**
*  Fichero: axisctr092.jsp
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 26/11/1907
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
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
    
    <script language="Javascript" type="text/javascript">
        function f_onload() {
            document.miForm.NPOLIZA.focus();
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
            f_cargar_propiedades_pantalla();
        }

        function f_formatdate(entrada,title){
         var jDate = new JsFecha();
            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);
            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    alert("<axis:alt f="axisctr092" c="titulo" lit="1000421"/>");
                }
            }
        }          
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr092();
        }        
        
        function f_but_buscar() {
            if (objValidador.validaEntrada()) 
                objUtiles.ejecutarFormulario("modal_axisctr092.do", "buscar", document.miForm, "_self", objJsMessages.jslit_cargando);
            
        }
         
        function f_but_aceptar (cual,vSTRAS) {
            var SSEGURO = "";
            var STRAS = "";            
            
            if (!objUtiles.estaVacio(cual)) {
                // Seleccionada por el hipervínculo
                SSEGURO = cual;
                STRAS = vSTRAS;
            }
            else if (!objUtiles.estaVacio(document.miForm.checked_poliza)) {
                // Checkeada por el radio button
                if (typeof SSEGURO == 'boolean')
                   null;
                else {
                var hayChecked = objUtiles.f_GuardaCasillasChecked ("checked_poliza");
                var splitted = objUtiles.utilSplit(hayChecked, "/");
                
                SSEGURO = splitted[0];
                STRAS = splitted[1];
                }
            } 
                     
            if (typeof SSEGURO == 'boolean' || objUtiles.estaVacio (SSEGURO))
                alert(objJsMessages.jslit_selecciona_registro);
            else {
                // Si hay una seleccionada, llamar al Action.              
                parent.f_aceptar_axisctr092(SSEGURO,STRAS);
            }
         }

            function f_cargar_productos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisctr092.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
            }      

            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr092" c="SPRODUC" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   amagarDisplay();

                }
            }            

            function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "8", "<axis:alt f="axisctr092" c="miListaId" lit="1000254"/>");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
            function f_but_nuevo(){
                 parent.f_nuevo_traspaso();
            }
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr092" c="formulario" lit="9900745"/></c:param>
                <c:param name="producto"><axis:alt f="axisctr092" c="producto" lit="9900745"/></c:param>
                <c:param name="form">axisctr092</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>

                            </tr>
                            <tr>
                                 <axis:ocultar f="axisctr092" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr092" c="CRAMO" lit="100784"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="100829"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="100836"/></b>
                                </td>
                                <axis:ocultar f="axisctr092" c="NCERTIF">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr092" c="NCERTIF" lit="101300"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr092" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:95%" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr092" c="CRAMO" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>                            
                                <td class="campocaja" colspan="2">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr092" c="SPRODUC" lit="108341"/> - </option>
                                        <c:forEach items="${productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPOLIZA}" name="NPOLIZA" id="NPOLIZA" formato="entero" title="<axis:alt f="axisctr092" c="NPOLIZA" lit="100836"/>" size="15" 
                                    title="<axis:alt f="axisctr092" c="NPOLIZA" lit="100836"/>"/>
                                </td>
                                <axis:ocultar f="axisctr092" c="NCERTIF">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCERT}" name="NCERT" id="NCERT"
                                        formato="entero" title="<axis:alt f="axisctr092" c="NCERT" lit="101096"/>"/>
                                    </td>
                                </axis:ocultar>
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>

                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="NNUMIDE" lit="105330"></axis:alt> </b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulo" lit="105940"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulo" lit="1000088"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulo" lit="101027"/>?</b>
                                    <input type="radio" id="CB_TOMOASE" name="CB_TOMOASE" value="1" <c:if test="${__formdata['CB_TOMOASE'] == '1' || empty __formdata['CB_TOMOASE']}">checked</c:if> />
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['NNUMIDE']}" name="NNUMIDE" id="NNUMIDE"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['BUSCAR']}" name="BUSCAR" id="BUSCAR" size="15"/>
                                </td>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" value="${__formdata['SNIP']}" name="SNIP" id="SNIP" size="15"
                                     title="<axis:alt f="axisctr092" c="SNIP" lit="1000088"/>"/>
                                </td>                                
                               
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="CB_TOMOASE" lit="1000078"/></b>
                                    <input type="radio" id="CB_TOMOASE" name="CB_TOMOASE" value="2" <c:if test="${__formdata['CB_TOMOASE'] == '2'}">checked</c:if> />
                                </td>
                               
                            </tr>
                        </table>
                        <div class="separador">&nbsp;</div>
                        <table class="seccion">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            </tr>
                            <tr>
                             
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="9900744"/></b>
                                </td>
                          
                            <axis:ocultar f="axisctr092" c="CESTADO" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="100587"/></b>
                                </td>
                                  </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="9001983"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="9900743"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr092" c="titulocaja" lit="9002015"/></b>
                                </td>

                            </tr>
                            <tr>
                            <axis:ocultar f="axisctr092" c="CINOUT" dejarHueco="false">
                                 <td class="campocaja">
                                    <select name = "CINOUT" id="CINOUT" style="width:95%"  size="1" class="campowidthselect campo campotexto"
                                     <axis:atr f="axisctr092" c="CINOUT" a="modificable=true&isInputText=false"/>/>
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr092" c="titulocaja" lit="108341"/> - </option>
                                            <c:forEach var="listado" items="${listValores.entradasalida}">
                                                <option value = "${listado.CATRIBU}"
                                                    <c:if test="${listado.CATRIBU == __formdata.CINOUT}">selected</c:if>>
                                                    ${listado.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                </td>
                            </axis:ocultar>
                            <axis:ocultar f="axisctr092" c="CESTADO" dejarHueco="false">
                                <td class="campocaja">
                                      <select name = "CESTADO" id="CESTADO" style="width:95%" size="1"  class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr092" c="titulocaja" lit="108341"/> - </option>
                                            <c:forEach var="listado" items="${listValores.estado}">
                                                <option value = "${listado.CATRIBU}"
                                                    <c:if test="${listado.CATRIBU == __formdata.CESTADO}">selected</c:if>>
                                                    ${listado.CATRIBU}-${listado.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                </td>
                                </axis:ocultar>
                                <axis:visible c="FSOLICI" f="axisctr092">
                                <td class="campocaja">
                                                <input type="text" style="width:60%" class="campowidthinput campo campotexto"  id="FSOLICI" name="FSOLICI" size="15" onblur="javascript:f_formatdate(this,'')"
                                                value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FSOLICI}'/>" 
                                                <axis:atr f="axisctr092" c="FSOLICI" a="formato=fecha"/> />
                                                <a id="icon_FSOLICI" style="vertical-align:middle;" href="#">
                                                <img id="popup_calendario_FSOLICI" border="0" alt="<axis:alt f="axisctr092" c="titulocaja" lit="108341"/>" 
                                                title="<axis:alt f="axisctr092" c="titulocaja" lit="108341"/>" src="images/calendar.gif"/></a>
                                            
                                        </td>   
                                </axis:visible>
                                <axis:visible c="FSOLICI_ANULACIO" f="axisctr092">
                                         <td class="campocaja">
                                           <jsp:useBean id="today" class="java.util.Date" /> 
                                           
                                                <input type="text" style="width:60%" class="campowidthinput campo campotexto"  id="FSOLICI_ANULACIO" name="FSOLICI_ANULACIO" size="15" onblur="javascript:f_formatdate(this,'')"
                                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/>"  
                                                <axis:atr f="axisctr092" c="FSOLICI_ANULACIO" a="modificable=false&formato=fecha"/> />
                                                <a  style="vertical-align:middle;" href="#">
                                                <img id="icon_FSOLICI_ANULACIO" border="0" alt="<axis:alt f="axisctr092" c="titulocaja" lit="108341"/>" 
                                                title="<axis:alt f="axisctr092" c="titulocaja" lit="108341"/>" src="images/calendar.gif"/></a>
                                            
                                        </td>   
                                </axis:visible>
                                <td class="campocaja">
                                     <select name = "PCTIPTRAS" id="PCTIPTRAS" style="width:95%" id ="ramoProducto" size="1"  class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr092" c="titulocaja" lit="108341"/> - </option>
                                            <c:forEach var="listado" items="${listValores.tiptraspas}">
                                                <option value = "${listado.CATRIBU}"
                                                    <c:if test="${listado.CATRIBU == __formdata.CTIPTRA}">selected</c:if>>
                                                    ${listado.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                </td>  
                                <td class="campocaja">
                                     <select name = "CTIPTRASSOL" id="CTIPTRASSOL" style="width:95%" id ="ramoProducto" size="1"  class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr092" c="titulocaja" lit="108341"/> - </option>
                                            <c:forEach var="listado" items="${listValores.tiptrassol}">
                                                <option value = "${listado.CATRIBU}"
                                                    <c:if test="${listado.CATRIBU == __formdata.CTIPTRASSOL}">selected</c:if>>
                                                    ${listado.TATRIBU}
                                                </option>
                                            </c:forEach>
                                        </select>
                                </td>  
                               
                            </tr>
                        </table>                        
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisctr092" c="title1" lit="800440"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr092" c="title2" lit="105940"/></c:set>
                            <c:set var="title3"><axis:alt f="axisctr092" c="title3" lit="9900744"/></c:set>
                            <c:set var="title4"><axis:alt f="axisctr092" c="title4" lit="100587"/></c:set>
                            <c:set var="title5"><axis:alt f="axisctr092" c="title5" lit="9001983"/></c:set>
                            <c:set var="title6"><axis:alt f="axisctr092" c="title6" lit="9900743"/></c:set>
                            <c:set var="title7"><axis:alt f="axisctr092" c="title7" lit="9002015"/></c:set>
                            <div class="seccion displayspaceGrande">
                            
                            <%-- ${sessionScope.axisctr_listaPolizas} --%>
                                <display:table name="${sessionScope.axisctr_listaPolizas}" id="miListaId" export="false" class="dsptgtable" pagesize="8" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr092.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" >                                        
                                        <div class="dspIcons"><c:if test="${!empty miListaId.OB_IAX_TRASPASOS.NPOLIZA}"><input <c:if test="${miListaId['checkedPoliza']}">checked</c:if> type="radio" id="checked_poliza" name="checked_poliza" value="${miListaId.OB_IAX_TRASPASOS.SSEGURO}/${miListaId.OB_IAX_TRASPASOS.STRAS}"/></c:if></div>                                        
                                    </display:column>
                                    <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                                        <div class="dspText">
                                        <a href="javascript:f_but_aceptar('${miListaId.OB_IAX_TRASPASOS.SSEGURO}','${miListaId.OB_IAX_TRASPASOS.STRAS}')">
                                        ${miListaId.OB_IAX_TRASPASOS.NPOLIZA}
                                        <c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId.OB_IAX_TRASPASOS.NCERTIF}</c:if>
                                        </a>
                                        </div>
                                    </display:column>
                                    <display:column title="${title2}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        <a href="javascript:f_but_aceptar('${miListaId.OB_IAX_TRASPASOS.SSEGURO}','${miListaId.OB_IAX_TRASPASOS.STRAS}')">
                                        <c:if test="${miListaId.MOSTRA_CERTIF == '1'}"> - ${miListaId.OB_IAX_TRASPASOS.NCERTIF}</c:if>
                                        </a>
                                        </div>
                                        ${miListaId.OB_IAX_TRASPASOS.TNOMTOM}</div>
                                    </display:column>
                                    <display:column title="${title3}" sortable="true" sortProperty="SITUACION" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCINOUT}
                                        </div>
                                    </display:column>
                                    <display:column title="${title4}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCESTADO}
                                        </div>
                                    </display:column>
                                    <display:column title="${title5}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                         <div class="dspDate">
                                         <fmt:formatDate value='${miListaId.OB_IAX_TRASPASOS.FSOLICI}' pattern='dd/MM/yyyy'/>
                                         </div>
                                    </display:column>
                                    <display:column title="${title6}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCTIPTRAS}
                                        </div>
                                    </display:column>
                                    <display:column title="${title7}" sortable="true" sortProperty="DESPRODUCTO" headerClass="sortable" media="html" autolink="false" >
                                        <div class="dspText">
                                        ${miListaId.OB_IAX_TRASPASOS.TCTIPTRASSOL}
                                        </div>
                                    </display:column>
                                </display:table>
                                <c:choose>
                                <c:when test="${!empty sessionScope.axisctr_listaPolizas}">
                                    <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                        <script language="javascript">objUtiles.retocarDsptagtable("miListaId");</script>
                                    </c:if>
                                </c:when>
                                <c:otherwise>
                                    <script language="javascript">
                                       objLista.esconderListaSpans();
                                       objLista.esconderListaLinks();     
                                    </script>
                                </c:otherwise>
                                </c:choose>
                            </div>
                    </td>
                </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr092</c:param>
                <c:param name="__botones">cancelar,buscar<axis:visible f="axisctr092" c="BT_nuevo">,nuevo</axis:visible>,aceptar</c:param>
            </c:import>
     </form>
     <script type="text/javascript">
        <axis:visible c="FSOLICI" f="axisctr092">
    Calendar.setup({
        inputField     :    "FSOLICI",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "popup_calendario_FSOLICI",  
        singleClick    :    true,
        firstDay       :    1
    });
        </axis:visible>
     <axis:visible c="FSOLICI_ANULACIO" f="axisctr092">
      Calendar.setup({
        inputField     :    "FSOLICI_ANULACIO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FSOLICI_ANULACIO",  
        singleClick    :    true,
        firstDay       :    1
    });
    </axis:visible>
    </script>
    
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

