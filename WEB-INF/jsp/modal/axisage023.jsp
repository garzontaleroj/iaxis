<%--
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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
           function f_onload(){
               f_cargar_propiedades_pantalla();
               
                <c:if test="${grabarOK}" >
                    
                    parent.f_cerrar_modal('axisage023');
               </c:if>
           }
            
           function f_but_aceptar() {
           // bug 0024976 
           // if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axisage023.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
           }
           
           function f_but_salir(){
               parent.f_cerrar_modal('axisage023');
           }
          
          function f_load_professionales(tipprof) {
          
            var url="modal_axisage023.do?operation=json_busqueda_profesionales&CTIPPROF="+tipprof
            jQuery.ajax({
            url: url,
            dataType: 'json',
            success: loadProfesionalescallMeBack
            });
            
         }
         
         function loadProfesionalescallMeBack(lstProf){
         
           objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	  
	    if(!objAppMensajes.existenErroresEnAplicacion_JSON(lstProf, true, "resultado")){
               var SPROFEScombo = document.miForm.SPROFES;     
                    objDom.borrarOpcionesDeCombo(SPROFEScombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage023" c="COMBO_sv" lit="108341"/> - ', SPROFEScombo, 0);
                    var elementos = lstProf.JSON2.resultado.RETURN;
                       for (i = 0; i < lstProf.JSON2.resultado.RETURN.length; i++) {
                           TNOMBRE = lstProf.JSON2.resultado.RETURN[i].NOMBRE;
                           SPROFES = lstProf.JSON2.resultado.RETURN[i].SPROFES;
                           objDom.addOpcionACombo(SPROFES, TNOMBRE, SPROFEScombo, i+1);
                        }
                  
            }

         }
         
         function f_load_tramitadores(codtrdor) {
            var url="modal_axisage023.do?operation=json_busqueda_tramitadores&CTRAMTE="+codtrdor
            jQuery.ajax({
            url: url,
            dataType: 'json',
            success: loadTramitadorescallMeBack
            });
            
         }
         
         function loadTramitadorescallMeBack(lstTram){
         
           objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
	  
	    if(!objAppMensajes.existenErroresEnAplicacion_JSON(lstTram, true, "resultado")){
               var CTRAMITcombo = document.miForm.CTRAMIT;     
                    objDom.borrarOpcionesDeCombo(CTRAMITcombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisage023" c="COMBO_sv" lit="108341"/> - ', CTRAMITcombo, 0);
                    var elementos = lstTram.JSON2.resultado.RETURN;
                       for (i = 0; i < lstTram.JSON2.resultado.RETURN.length; i++) {
                           TTRAMITAD = lstTram.JSON2.resultado.RETURN[i].TTRAMITAD;
                           CTRAMITAD = lstTram.JSON2.resultado.RETURN[i].CTRAMITAD;
                           objDom.addOpcionACombo(CTRAMITAD, TTRAMITAD, CTRAMITcombo, i+1);
                        }
                  
            }

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
                        
            <%-- Hidden BFP --%>
            <input type="hidden" id="CAGENTE" name="CAGENTE" value="${__formdata.CAGENTE}"/>
            <input type="hidden" name="CCOMIND" id="CCOMIND" value="${__formdata.CCOMIND}" />
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisage023" lit="9903483"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisage023" lit="9903483"/></c:param>
                <c:param name="form">axisage023</c:param>
            </c:import>
            <!-- Area de campos  -->

            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            <tr>
                                <td class="campocaja" colspan="4">
                                    <div class="titulo">
                                        <img src="images/flecha.gif"/><axis:alt c="DSP_TITULO" f="axisage023" lit="9903483"/>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <%-- Tipo actor --%>
                                <axis:ocultar f="axisage023" c="CTIPCOD" dejarHueco="false">
                                <td class="titulocaja" id="tit_CTIPCOD" >
                                    <b  id="label_CTIPCOD"><axis:alt f="axisage023" c="CTIPCOD" lit="9903407"/></b>
                                </td>
                                </axis:ocultar>
                                <%-- Ramo --%>
                                <axis:ocultar f="axisage023" c="CRAMO" dejarHueco="false">
                                <td class="titulocaja" id="tit_CRAMO" >
                                    <b id="label_CRAMO"><axis:alt f="axisage023" c="CRAMO" lit="9002109"/></b>
                                </td>
                                </axis:ocultar>
                                <%-- Tramite --%>
                                <axis:ocultar f="axisage023" c="CTRAMTE" dejarHueco="false">
                                <td class="titulocaja" id="tit_CTRAMTE" >
                                    <b  id="label_CTRAMTE"><axis:alt f="axisage023" c="CTRAMTE" lit="9901989"/></b>
                                </td>
                                </axis:ocultar>
                                <%-- Tramitador --%>
                                <axis:ocultar f="axisage023" c="CTRAMIT" dejarHueco="false">
                                <td class="titulocaja" id="tit_CTRAMIT" >
                                    <b  id="label_CTRAMIT"><axis:alt f="axisage023" c="CTRAMIT" lit="140769"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>

                                <%-- Tipo actor --%>
                                <axis:ocultar f="axisage023" c="CTIPCOD" dejarHueco="false">
                                <td class="campocaja" id="td_CTIPCOD"> 
                                    <select name="CTIPCOD" id="CTIPCOD" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                      	<axis:atr f="axisage003" c="CTIPCOD" a="obligatorio=true&isInputText=false"/>
                                        title="<axis:alt f='axisage023' c='CTIPCOD' lit='9903407'/>" onchange="f_cargar_propiedades_pantalla();" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="CTIPCOD_SELECC" lit="1000348"/> - </option></c:if>--%>
                                        <c:forEach var="actores" items="${__formdata.LISTVALORES.LSTTIPACTOR}">
                                            <option value = "${actores.CATRIBU}"
                                            <c:if test="${__formdata.tipo == actores.CATRIBU}"> selected = "selected"</c:if> >
                                            ${actores.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>                          
                                <%-- Ramo --%>
                                <axis:ocultar f="axisage023" c="CRAMO" dejarHueco="false">
                                <td class="campocaja" id="td_CRAMO" > 
                                    <select name="CRAMO" id="CRAMO" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    	<axis:atr f="axisage003" c="CRAMO" a="obligatorio=false&isInputText=false"/>
                                        title="<axis:alt f='axisage023' c='CRAMO' lit='9002109'/>" onchange="" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="CRAMO_SELECC" lit="1000348"/> - </option></c:if>--%>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTRAMO}">
                                            <option value = "${element.CRAMO}"
                                            <c:if test="${__formdata.CRAMO == element.CRAMO}"> selected = "selected"</c:if> >
                                            ${element.TRAMO} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>   
                                
                                <%-- Tramite --%>
                                <axis:ocultar f="axisage023" c="CTRAMTE" dejarHueco="false">
                                <td class="campocaja"  id="td_CTRAMTE"> 
                                    <select name="CTRAMTE" id="CTRAMTE" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    	title="<axis:alt f='axisage023' c='CTRAMTE' lit='9901989'/>" 
                                        <axis:atr f="axisage003" c="CTRAMTE" a="obligatorio=false&isInputText=false"/>
                                        onchange="f_load_tramitadores(this.value)" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="CTRAMTE_SELECC" lit="1000348"/> - </option></c:if>----%>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTRAMTE}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CTRAMTE == element.CATRIBU}"> selected = "selected"</c:if> >
                                            ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>     
                                
                                <%-- Tramitador --%>
                                <axis:ocultar f="axisage023" c="CTRAMIT" dejarHueco="false">
                                <td class="campocaja" id="td_CTRAMIT"> 
                                    <select name="CTRAMIT" id="CTRAMIT" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    	title="<axis:alt f='axisage023' c='CTRAMIT' lit='140769'/>" onchange="" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="CTRAMIT_SELECC" lit="1000348"/> - </option></c:if>--%>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTRAMIT}">
                                            <option value = "${element.CTRAMITAD}"
                                            <c:if test="${__formdata.CTRAMIT == element.CTRAMITAD}"> selected = "selected"</c:if> >
                                            ${element.TTRAMITAD} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>     
                                
                                
                            </tr>
                            
                             <tr>
                                <%-- bug 0024976 excluido favorito --%>
                                <axis:visible f="axisage023" c="RDVALORA">  
                                <td class="campocaja" id="td_RDVALORA">
                                <div id="RADIO_FILTRO_NO">                                               
                                </div>
                                </td>
                                <td class="campocaja" id="td_RDVALORA">
                                <div id="RADIO_FILTRO_SI">                                               
                                </div>
                                </td>                
                              </axis:visible> 


                                <%-- Tipo profesional --%>
                                <axis:ocultar f="axisage023" c="CTIPPROF" dejarHueco="false">
                                <td class="titulocaja" id="tit_CTIPPROF" >
                                    <b id="label_CTIPPROF"><axis:alt f="axisage023" c="CTIPPROF" lit="9903408"/></b>
                                </td>
                                </axis:ocultar>
                                <%-- Profesional --%>
                                <axis:ocultar f="axisage023" c="SPROFES" dejarHueco="false">
                                <td class="titulocaja"  id="tit_SPROFES" >
                                    <b id="label_SPROFES"><axis:alt f="axisage023" c="SPROFES" lit="9903409"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <%-- bug 0024976 excluido favorito --%>
                                <axis:visible f="axisage023" c="RDVALORA">  
                                <td class="campocaja" id="td_RDVALORA">
                                <div id="RADIO_FILTRO_NO">                                               
                                      <input type="radio" id="RDVALORA" paramMap="true" name="RDVALORA" value="0" 
                                      <c:if test="${__formdata.CVALORA == '0'}">checked</c:if>/>
                                      <b id="label_FILTRO_NO"><axis:alt f="axisage023" c="FILTRO_NO" lit="9904604" /></b>
                                </div>
                                </td>
                                <td class="campocaja" id="td_RDVALORA">
                                <div id="RADIO_FILTRO_SI">                                               
                                      <input type="radio" id="RDVALORA" paramMap="true" name="RDVALORA" value="1" 
                                      <c:if test="${__formdata.CVALORA == '1'}">checked</c:if>/>
                                      <b id="label_FILTRO_SI"><axis:alt f="axisage023" c="FILTRO_SI" lit="9904605" /></b>                                                                                                      
                                    </div>
                                </td>                
                              </axis:visible> 

                                <%-- Tipo profesional--%>
                                <axis:ocultar f="axisage023" c="CTIPPROF" dejarHueco="false">
                                <td class="campocaja" id="td_CTIPPROF" > 
                                    <select name="CTIPPROF" id="CTIPPROF" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    	title="<axis:alt f='axisage023' c='CTIPPROF' lit='9903408'/>" onchange="f_load_professionales(this.value)" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="CTIPPROF_SELECC" lit="1000348"/> - </option></c:if>--%>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTIPPROF}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CTIPPROF == element.CATRIBU}"> selected = "selected"</c:if> >
                                            ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>     
                                
                                <%-- Profesional --%>
                                <axis:ocultar f="axisage023" c="SPROFES" dejarHueco="false">
                                <td class="campocaja" id="td_SPROFES" > 
                                    <select name="SPROFES" id="SPROFES" size="1" class="campowidthselect campo campotexto" style="width:79%;"
                                    	title="<axis:alt f='axisage023' c='SPROFES' lit='9903409'/>" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <%--<c:if test="${modoModificable}"><option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SPROFES_SELECC" lit="1000348"/> - </option></c:if>--%>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTSPROFES}">
                                            <option value = "${element.SPROFES}"
                                            <c:if test="${__formdata.SPROFES == element.SPROFES}"> selected = "selected"</c:if> >
                                            ${element.NOMBRE} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>    
                            
                            </tr>
                            
                             <tr>
                                <%-- bug 0024976 Compañia asistencia --%>
                                <axis:ocultar f="axisage023" c="CCIAASI" dejarHueco="false">
                                <td class="titulocaja" id="CCIAASI" >
                                    <b id="label_CCIAASI"><axis:alt f="axisage023" c="CCIAASI" lit="102082"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>                            
                            <%-- bug 0024976 Compañia asistencia --%>
                                <axis:ocultar f="axisage023" c="CCIAASI2" dejarHueco="false">
                                <td class="campocaja" id="CCIAASI2" > 
                                    <select name="CCIAASI" id="CCIAASI" size="1" class="campowidthselect campo campotexto" style="width:79%;" 
                                    	title="<axis:alt f='axisage023' c='CCIAASI' lit='102082'/>" onchange="" >&nbsp;
                                        <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisage023" c="SELECC" lit="108341"/> - </option>
                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCCIAASI}">
                                            <option value = "${element.CATRIBU}"
                                            <c:if test="${__formdata.CCIAASI == element.CATRIBU}"> selected = "selected"</c:if> >
                                            ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>     
                            </tr>
                            
                        </table>
                    </td>
                </tr>
            </table>
     </form>
<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisage023</c:param>
            <c:param name="__botones">
                salir,aceptar
            </c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>