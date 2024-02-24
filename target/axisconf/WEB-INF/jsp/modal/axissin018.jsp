<%--
/**
*  Fichero: axissin018.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Titulo: Detalle Danyos 
*
*  Fecha:11/03/2009
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<c:set var="nombrePantalla" value="datossinimodal"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><fmt:message key="100604"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <link rel="stylesheet" href="styles/coche.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript" src="scripts/global.js"></script>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
    <script type="text/javascript">
    
                function f_onload() { 
                    inicializarChecks();
                    
                     var val1 = "<%=request.getAttribute("OK")%>"; 
                     var NSINIES = "${__formdata.NSINIES}";        
                        if (val1=="OK"){
                            parent.f_aceptar_axissin009(NSINIES); //TODO: Dato SINIESTRO EJEMPLAR EJ. para volver a la pantalla
                            this.f_but_cancelar();
                        }
                    
                    // Checkear los campos que se cargan
                     <c:forEach var="element" items="${__formdata.DETALLE}">
                                                       
                              <c:if test="${element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO == 8}" >
                                document.forms[0].coddanyo_GENE.click();
                                compSinDanyos();
                              </c:if>
                              <c:if test="${element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO == 9}" >
                                document.forms[0].coddanyo_LUNA.click();
                                compSinDanyos();
                              </c:if>
                              <c:if test="${element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO == 10}" >
                               document.forms[0].coddanyo_BAJO.click();
                               compSinDanyos();
                              </c:if>
                              
                              <c:if test="${element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO != 8 && element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO != 9 && element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO != 10}" >
                                document.forms[0].coddanyo_0${element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO}.click();
                                checkear("0${element.OB_IAX_SIN_TRAMI_DETDANO.NDETDANO}");
                                compSinDanyos();
                              </c:if>
                              
                              
                     </c:forEach>
                    
                    //Poner la capa proteccion cuando es consulta
                    <axis:visible f="axissin018" c="VEHICULO_DANO">
                    document.getElementById('DSP_COCHE').style.height='500px';
                    document.getElementById('DSP_COCHE').style.width='1200px';
                    document.getElementById('DSP_COCHE').style.top='0px';
                    document.getElementById('DSP_COCHE').style.left='0px';
                   </axis:visible>
                    
        
                }
                
                
                function f_cargar_valorINF(){
                    objDom.setValorPorId("CTPINF", document.miForm.CTPINF_AUX.value);
                }
             
                function f_but_aceptar(){
                    //alert("antes de aceptar");
                    
                    if(document.forms[0].coddanyo_GENE.checked){
                    //alert(document.forms[0].coddanyo_GENE.value);
                    document.forms[0].coddanyo_GENE.value = "1";
                    }
                    if(document.forms[0].coddanyo_LUNA.checked){
                    //alert(document.forms[0].coddanyo_LUNA.value);
                    document.forms[0].coddanyo_LUNA.value = "1";
                    }
                    if(document.forms[0].coddanyo_BAJO.checked){
                    //alert(document.forms[0].coddanyo_BAJO.value);
                    document.forms[0].coddanyo_BAJO.value = "1";
                    }
                    if(document.forms[0].coddanyo_SIND.checked){
                    //alert(document.forms[0].coddanyo_BAJO.value);
                    document.forms[0].coddanyo_SIND.value = "1";
                    }
                    
                    objUtiles.ejecutarFormulario ("modal_axissin018.do", "guardar", document.miForm, "_self"); 
                }
        
                function f_but_cancelar(){
                parent.f_cerrar_modal("axissin018");
                }
        
               <!-- Javascript -->
                     
               
               
               function checkear(ind) {
                //alert("CHECKEAR" +ind);
                        var objCoche = getPpp("coche"+ind);
                        var obj = getPpp("tr" + ind);
                        var objCheck = document.forms[0].elements["coddanyo_" + ind];
                        (ind%2) ? j=2 : j=1; 
                        
                        
                        if (objCheck.checked) {
                                objCoche.className = "#coche" + ind + " coche" + ind;
                                obj.className = "fondofila1clic"; 
                                
                        } else {
                                objCoche.className = "coche";
                                obj.className = "fondofila" + j;
                               
                        }
                        
                //alert("Antes de comp sin danyos");        
                compSinDanyos();
                }
                
                function inicializarChecks(){
                        var numerofilas = 0;
                        for(var j=0; j< document.forms[0].elements.length; j++) {
                                if (document.forms[0].elements[j].name.indexOf("coddanyo_0") >-1) numerofilas++;
                        }
                        var selector = "";
                        var tr_fila = "";
                        objoculto = getPpp("capaoculta");
                        if (numerofilas !=0) {
                                for(var i=1; i< numerofilas+1; i++) {
                                        selector = "coddanyo_0" + (i);
                                        tr_fila = "tr0" + (i);
                                        objoculto.className="";
                                        if (document.forms[0].elements[selector].checked) {
                                        cambiarColorFila(tr_fila, 3, 'formCoche');
                                        checkear("0"+i);
                                        }
                                }	
                        }
                }
                
                function limpiar(){
                        var obj=document.forms[0];
                        var numerofilas = 0;
                        var selector = "";
                        var selectorGen="coddanyo_GENE";
                        var selectorLun="coddanyo_LUNA";
                        var selectorBaj="coddanyo_BAJO";
                        if (obj.coddanyo_SIND.checked){
                                for(var j=0; j< document.forms[0].elements.length; j++) {
                                        if (document.forms[0].elements[j].type == "checkbox") 
                                                if (document.forms[0].elements[j].name==selectorGen) obj.coddanyo_GENE.checked="";
                                                else if (document.forms[0].elements[j].name==selectorLun) obj.coddanyo_LUNA.checked="";
                                                else if (document.forms[0].elements[j].name==selectorBaj) obj.coddanyo_BAJO.checked="";
                                                else{
                                                        for (var i=1; i<8; i++){
                                                                selector = "coddanyo_0" + (i);
                                                                if (document.forms[0].elements[j].name==selector){
                                                                 document.forms[0].elements[j].checked="";
                                                                 checkear("0"+i);
                                                                }
                                                        }
                                                }
                                }
                        }
                        document.forms[0].coddanyo_SIND.checked = true;
                }
                
                function compSinDanyos(){
                        //alert("EN COD SIN DANYOS");
                        var obj=document.forms[0];
                        if (obj.coddanyo_SIND.checked)
                                obj.coddanyo_SIND.checked="";
                
                }
                
            
    
    </script>
</head>
<body onload="javascript:f_onload()" class="fondocuerpo">

    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
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
    
    
    <form name="miForm" action="modal_axissin018.do" method="POST">
    
    
    <input name="grupodatos" type="hidden"  value="VEHICULO" />    
    
    
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="danyos"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="NDANO" value="${__formdata.NDANO}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="subpantalla" value="${subpantalla}"/>
    <input type="hidden" name="seccion" value="${seccion}"/>   
    
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><fmt:message key="9000907"/></c:param>
        <c:param name="formulario"><fmt:message key="9000907"/></c:param>
        <c:param name="form">axissin018</c:param>
    </c:import>
    
    
    <div class="separador">&nbsp;</div>
    <axis:visible f="axissin018" c="VEHICULO_DANO">
    <div id="DSP_COCHE" class="displayspaceOver" style="visibility:visible;z-index:1200;height:200px;">&nbsp;</div>  
    </axis:visible>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <!-- CABACERA DANYO -->
        
        <tr>
            <td>
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
                            <b><fmt:message key="9001028"/></b><!-- Tipus tramitacio -->
                        </td>
                       <td class="titulocaja">
                            <b><fmt:message key="100588"/></b><!-- Tipus dany  -->
                        </td>                        
                        <td class="titulocaja">
                            <b><fmt:message key="9000901"/></b><!-- Tipus dany  -->
                        </td>
                       <td class="titulocaja">
                            <b><fmt:message key="9000905"/></b><!-- Tramitación informativa -->
                            
                        </td>                        
                        
                    </tr>
                    
                    <tr>
                        <td class="campocaja">
                         <input type="text" name="TTIPTRA" value="${sessionScope.tramitaciones_min[linea_trami].TTIPTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTIPTRA" a="modificable=false"/> />
                            
                        </td>
                        <td class="campocaja">
                         <input type="text" name="TTRAMIT" value="${sessionScope.tramitaciones_min[linea_trami].TTRAMIT}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTRAMIT" a="modificable=false"/> />
                            
                        </td>                        
                        <td class="campocaja">
                            <input type="text" name="TTCAUSIN" value="${sessionScope.tramitaciones_min[linea_trami].TTCAUSIN}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTCAUSIN" a="modificable=false"/> />
                        </td>
                        <td class="campocaja" align="left">
                        <input type="checkbox" disabled  id="CINFORM" name="CINFORM" <axis:atr f="axissin009" c="CINFORM" a="modificable=false"/> value="${T_IAX_TRAMITACIONES.OB_IAX_SIN_TRAMITACION.CINFORM}" 
                        <c:if test="${sessionScope.tramitaciones_min[linea_trami].CINFORM == '1'}">checked</c:if> >
                        </td>                        
                        

                    </tr>
                    
                    
                    <tr>
                    <td class="titulocaja">
                            <b><fmt:message key="100587"/></b><!-- Estado -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="9000852"/></b><!--Subestado -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="9000900"/></b><!-- Unidad tramitacion -->
                        </td>
                        <td class="titulocaja">
                            <b><fmt:message key="140769"/></b><!-- Tramitador -->
                        </td>
 
                        <td class="titulocaja">
                            
                        </td>
                    </tr>
                    <tr>
                    <td class="campocaja">
                            <input type="text" name="TESTTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TESTTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TESTTRA" a="modificable=false"/> />
                        </td>
                        <td class="campocaja">
                            <input type="text" name="TSUBTRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TSUBTRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TSUBTRA" a="modificable=false"/> />                        
                        </td>                          
                        <td class="campocaja">
                            <input type="text" name="TUNITRA" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TUNITRA}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TUNITRA" a="modificable=false"/> />
                        
                            
                        </td>
                        <td class="campocaja">
                           <input type="text" name="TTRAMITAD" value="${sessionScope.tramitaciones_min[linea_trami].MOVIMIENTOS.OB_IAX_SIN_TRAMI_MOVIMIENTO.TTRAMITAD}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axissin009" c="TTRAMITAD" a="modificable=false"/> />
                        </td>

                                          
                        <td class="campocaja">
                             
                        </td>
                    </tr>
                      <!-- Descripción del siniestro -->
                    <%--tr>
                        <td class="titulocaja">
                                   <div class="separador">&nbsp;</div>
                                    <b><fmt:message key="9001150" /></b>
                        </td>
                    </tr>
                    <tr>
                    <!--Descripción del siniestro -->
                        <td colspan="5" style="width:100%;"   class="campocaja"> 
                                     <textarea class="campowidthinput campo campotexto_ob" style="width:100%;" name="TDANO" id="TDANO">${__formdata.TDANO}</textarea>
                        </td>
                    </tr --%>
                              
                    
                    
                </table>
            </td>
        </tr>
        
        
        
        
        <!-- FIN CABECERA DANYO -->
        <tr>
            <td>
            
                <!-- DADES VEHICLE -->
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <fmt:message key="9000907" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <div class="titulocaja">
                    <b></b>
                </div>
                <table class="seccion">
                <!-- Seccion principal -->
                <tr>
                <td>
                    <!-- inicio insercion -->
                    <table width="550" align="center" cellpadding="0" cellspacing="0">
                                          <tr>
                                            <td class="marcofnd"><table width="100%" cellpadding="0" cellspacing="0">
                                              <tr>
                                                <td><table align="center" cellpadding="2" cellspacing="1"><tr>
                                                  <td align="right" onClick="checkear('01');"><input type="checkbox" class="radio" name="coddanyo_01" value="01"  id="check_tr01" /></td>
                                                  <td id="tr01"><label for="check_tr01" class="lineacompleta">1.- <fmt:message key="9001239"/> </label></td> <!-- Seccio davantera -->
                                                  </tr>
                                                  <tr>
                                                    <td align="right" onClick="checkear('02');compSinDanyos();"><input type="checkbox" class="radio" name="coddanyo_02" value="02"  id="check_tr02" /></td>
                                                    <td id="tr02"><label for="check_tr02" class="lineacompleta">2.-  <fmt:message key="9001486"/> </label></td> <!-- Lateral Delantero - Izquierdo -->
                                                  </tr>
                                                  <tr>
                                                    <td align="right" onClick="checkear('03');compSinDanyos();"><input type="checkbox" class="radio" name="coddanyo_03" value="03"  id="check_tr03" /></td>
                                                    <td id="tr03"><label for="check_tr03" class="lineacompleta">3.- <fmt:message key="9001487"/> </label></td> <!-- Lateral Delantero - Derecho -->
                                                  </tr>
                                                  <tr>
                                                    <td align="right" onClick="checkear('04');compSinDanyos();"><input type="checkbox" class="radio" name="coddanyo_04" value="04"  id="check_tr04" /></td>
                                                    <td id="tr04"><label for="check_tr04" class="lineacompleta">4.- <fmt:message key="9001488"/> </label></td> <!-- Lateral Trasero - Izquierdo -->
                                                  </tr>
                                                  <tr>
                                                    <td align="right" onClick="checkear('05');compSinDanyos();"><input type="checkbox" class="radio" name="coddanyo_05" value="05"  id="check_tr05" /></td>
                                                    <td id="tr05"><label for="check_tr05" class="lineacompleta">5.- <fmt:message key="9001489"/> </label></td> <!-- Lateral Trasero - Derecho -->
                                                  </tr>
                                                  <tr>
                                                    <td align="right" onClick="checkear('06');compSinDanyos();"><input type="checkbox" class="radio" name="coddanyo_06" value="06"  id="check_tr06" /></td>
                                                    <td id="tr06"><label for="check_tr06" class="lineacompleta">6.- <fmt:message key="9001490"/> </label></td> <!-- Sección Trasera -->
                                                  </tr>
                                                  <tr>
                                                    <td align="right" onClick="checkear('07');compSinDanyos();"><input type="checkbox" class="radio" name="coddanyo_07" value="07"  id="check_tr07" /></td>
                                                    <td id="tr07"><label for="check_tr07" class="lineacompleta">7.- <fmt:message key="9001491"/> </label></td> <!-- Techo -->
                                                  </tr>
                                                </table></td>
                                                <td>			<div style="width:125px; height:225px">
                                                            <div id="coche01" onClick="document.forms[0].coddanyo_01.click();"></div>
                                                            <div id="coche02" onClick="document.forms[0].coddanyo_02.click();"></div>
                                                            <div id="coche03" onClick="document.forms[0].coddanyo_03.click();"></div>
                                                            <div id="coche04" onClick="document.forms[0].coddanyo_04.click();"></div>
                                                            <div id="coche05" onClick="document.forms[0].coddanyo_05.click();"></div>
                                                            <div id="coche06" onClick="document.forms[0].coddanyo_06.click();"></div>
                                                            <div id="coche07" onClick="document.forms[0].coddanyo_07.click();"></div>
                                                            <dl id="mapacoche">
                                                  <dt id="coche"><span>Coche</span></dt>
                                                  <dd><a id="dos" title="Lateral delantero-izquierdo" href="javascript:void(null);" onClick="document.forms[0].coddanyo_02.click();"></a></dd>
                                                  <dd><a id="tres" title="Lateral delantero-derecho" href="javascript:void(null);" onClick="document.forms[0].coddanyo_03.click();"></a></dd>
                                                  <dd><a id="uno" title="Secci&oacute;n delantera" href="javascript:void(null);" onClick="document.forms[0].coddanyo_01.click();"></a></dd>
                                                  <dd><a id="cuatro" title="Lateral trasero-izquierdo" href="javascript:void(null);" onClick="document.forms[0].coddanyo_04.click();"></a></dd>
                                                  <dd><a id="cinco" title="Lateral trasero-derecho" href="javascript:void(null);" onClick="document.forms[0].coddanyo_05.click();"></a></dd>
                                                  <dd><a id="seis" title="Secci&oacute;n trasera" href="javascript:void(null);" onClick="document.forms[0].coddanyo_06.click();"></a></dd>
                                                  <dd><a id="siete" title="Techo" href="javascript:void(null);" onClick="document.forms[0].coddanyo_07.click();"></a></dd>
                                                </dl>
                                                            </div>
                                    </td>
                                                <td valign="top" width="30%"><br /><br/>
                                      
                                                            <table width="90%" cellpadding="0" cellspacing="0">
                                              <tr>
                                                <td align="right"><input onClick="compSinDanyos();" type="checkbox" class="radio" name="coddanyo_GENE" value="GENE"  id="daniosGenerales" /></td>
                                                <td colspan="3"><label for="daniosGenerales"> <fmt:message key="9001492"/> </label></td> <!-- Da&ntilde;os generales -->
                                              </tr>
                                              <tr>
                                                <td align="right"><input onClick="compSinDanyos();" type="checkbox" class="radio" name="coddanyo_LUNA" value="LUNA"  id="lunas" /></td>
                                                <td colspan="3"><label for="lunas"><fmt:message key="9001493"/></label></td> <!-- Lunas -->
                                              </tr>
                                              <tr>
                                                <td align="right"><input onClick="compSinDanyos();" type="checkbox" class="radio" name="coddanyo_BAJO" value="BAJO"  id="bajos" /></td>
                                                <td colspan="3"><label for="Bajos"><fmt:message key="9001494"/></label></td> <!-- Bajos -->
                                              </tr>
                                              <tr>
                                                <td colspan="4" align="left"><br><br><br><br><br><br></td>
                                              </tr>
                                              <tr>
                                                <td align="right"><input onClick="limpiar();" type="checkbox" class="radio" name="coddanyo_SIND" value="SIND"  id="sinDanios" /></td>
                                                <td colspan="3"><label for="sinDanios"><fmt:message key="9001495"/></label></td>
                                              </tr>
                                                    </table>
                                                    </td>
                                              </tr>
                                              <tr>
                                                    </table>
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                              <tr>
                                                <td height="30" colspan="4" align="left" valign="bottom" class="titulo"><fmt:message key="101162"/></td>
                                              </tr>
                                              <tr>
                                                <td colspan="4" align="left"><textarea name="comentario" cols="60" rows="4" id="observaciones">${__formdata.TDANO}</textarea></td>
                                              </tr>
                                              <tr>
                                                <td height="30" colspan="4" align="left" valign="bottom" class="titulo"><fmt:message key="9001733"/></td> <!-- Tipo -->
                                              </tr>
                                              <tr>    
                                                <td>
                                                    <select name = "CTPINF_AUX" id ="CTPINF_AUX" size="1" style="width:20%" onchange="javascript:f_cargar_valorINF();" <c:if test="${sessionScope.CMODO=='CONSULTA_SINIESTROS'}">disabled</c:if> 
                                                    <axis:atr f="axissin018" c="CTPINF_AUX" a="modificable=true&isInputText=false&obligatorio=true"/> 
                                                    class="campowidthselect campo campotexto_ob" >                                                    
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                                        <c:forEach var="tipo" items="${listValores.tipo_inf}">
                                                            <option value = "${tipo.CATRIBU}" 
                                                            <c:if test="${tipo.CATRIBU == __formdata.CTIPINF}">selected</c:if>>
                                                                ${tipo.TATRIBU}
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                    
                                                    <input type="hidden" name="CTPINF" value="${__formdata.CTIPINF}" class="campowidthinput campo campotexto" style="width:90%"
                                                     /> 
                                                    
                                                </td>
                                            </tr>
                                            </table></td>
                                          </tr>
                                        </table>
  	
                
                
                
                <!-- Final insercion -->
                </td>
                </tr>
                <!-- Fin contenido --> 
                </table>
            </td>
        </tr>
    </table>
    
    
    <c:import url="../include/botonera_nt.jsp">
    	<c:param name="f">axissin018</c:param>
    	<c:param name="__botones">
    		<axis:visible f="axissin018" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axissin018" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
    </c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>

<!-- ****************************************************************************** -->
<!-- **************************   NUEVA SECCION *********************************** -->
<!-- ****************************************************************************** -->



<!--html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1"/>

<link href="c:/pruebas/coche.css" rel="stylesheet" type="text/css"/>

<script type="text/javascript" src="c:/pruebas/global.js"></script>
  

<script type="text/javascript">
<!--




</script>
    

</head>

<body class="fondocuerpo">

<script type="text/javascript">
<!--
  	window.top.document.title= "Alta captura";
 //-->
<!--/script-->


<!--form action="" method="post" name="ocurrencia" id="ocurrencia" onSubmit="return enviarForm()">
 


	
<input name="grupodatos" type="hidden"  value="VEHICULO" />    

</body>
</html-->