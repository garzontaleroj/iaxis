<%/* Revision:# Z3EO28x1pkV5Q8BveJYzzQ== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<c:choose>
    <c:when test="${param.multiPantalla == 'true'}">
        <c:set var="pantalla" value="axisctr027"/>
        <c:set var="literalPantalla" value="1000194"/>
    </c:when>
    <c:otherwise>
        <c:set var="pantalla" value="axisctr004"/>
        <c:set var="literalPantalla" value="140502"/>
    </c:otherwise>
</c:choose>

<!--********** CALENDARIO ************************* -->
  <!-- Hoja de estilo del Calendario -->
  <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
  <!-- Script principal del calendario -->
  <script type="text/javascript" src="scripts/calendar.js"></script>
  <!-- Idioma del calendario, en funci�n del Locale -->
  <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
  <!-- Setup del calendario -->
  <script type="text/javascript" src="scripts/calendar-setup.js"></script>
<!--*********************************** -->

<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
</c:import>        

<form name="${pantalla}Form" action="" method="POST">
    <input type="hidden" name="operation" value=""/>
    <input type="hidden" id="respuestas" name="respuestas" value=""/>
    <input type="hidden" id="SNIP" name="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" id="domicilio" name="domicilio" value="${__formdata.domicilio}"/>
    <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
    <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
    <input type="hidden" id="NCERTIF" name="NCERTIF" value="${__formdata.NCERTIF}"/>
    <input type="hidden" id="HAYMANDATPREV" name="HAYMANDATPREV" value="${__formdata.HAYMANDATPREV}"/>
    <input type="hidden" id="cargatHost" name="cargatHost" value="0"/>
    <c:if test="${__configform.axisctr004__CFORPAG__visible == 'false'}">
    <input type="hidden" id="CFORPAG" name="CFORPAG" value="${sessionScope.axisctr_datosGestion.CFORPAG}"/>
    </c:if>
    <c:if test="${__configform.axisctr004__CTIPCOB__visible == 'false'}">
    <input type="hidden" id="CTIPCOB" name="CTIPCOB" value="${sessionScope.CTIPCOB__DEFAULT}"/>
    </c:if>

    <c:if test="${__configform.axisctr004__CIDIOMA__visible == 'false'}">
    <input type="hidden" id="CIDIOMA" name="CIDIOMA" value="${sessionScope.axisctr_datosGestion.CIDIOMA}"/>
    </c:if>
	
	<c:if test="${__configform.axisctr004__CTIPCOM__visible == 'false'}">
    <input type="hidden" id="CTIPCOM" name="CTIPCOM" value="${sessionScope.axisctr_datosGestion.CTIPCOM}"/>
    </c:if>

    <c:if test="${__configform.axisctr004__CDURACI__visible == 'false'}">
    <input type="hidden" id="CDURACI" name="CDURACI" value="${sessionScope.axisctr_datosGestion.CDURACI}"/>
    </c:if>   
    <!-- Bug 0025584/135342 - 25/02/2013 - MMS -->
    <c:if test="${__configform.axisctr004__NEDAMAR__visible == 'false'}">
    <input type="hidden" id="NEDAMAR" name="NEDAMAR" value="${sessionScope.axisctr_datosGestion.NEDAMAR}"/>
    </c:if> 

    <c:if test="${__configform.axisctr004__CACTIVI__visible == 'false'}">
    <input type="hidden" id="CACTIVI" name="CACTIVI" value="${sessionScope.axisctr_datosGestion.CACTIVI}"/>
    </c:if>
    
     <input type="hidden" id="IDCUENTA" name="IDCUENTA" value="${__formdata.IDCUENTA}"/>
     <input type="hidden" id="CTIPCUENTA" name="CTIPCUENTA" value="${__formdata.CTIPCUENTA}"/>
     <input type="hidden" id="CTIPBAN" name="CTIPBAN" value="${__formdata.CTIPBAN}"/>
     <input type="hidden" id="CTIPIMP" name="CTIPIMP" value="${__formdata.CTIPIMP}"/>
     <input type="hidden" id="ISALDO" name="ISALDO" value="${__formdata.ISALDO}"/>
     <input type="hidden" id="PORCEN" name="PORCEN" value="${__formdata.PORCEN}"/>
     <input type="hidden" id="ILIMITE" name="ILIMITE" value="${__formdata.ILIMITE}"/>
     <input type="hidden" id="ICAPMAX" name="ICAPMAX" value="${__formdata.ICAPMAX}"/>
     <input type="hidden" id="CMONEDA" name="CMONEDA" value="${__formdata.CMONEDA}"/>
     <input type="hidden" id="CCOMPANI" name="CCOMPANI" value="${__formdata.CCOMPANI}"/>
     <input type="hidden" id="ICAPMAXPOL" name="ICAPMAXPOL" value="${__formdata.ICAPMAXPOL}"/>
     <input type="hidden" id="ICAPASE" name="ICAPASE" value="${__formdata.ICAPASE}"/>
     <input type="hidden" id="DESCRIPCION" name="DESCRIPCION" value="${__formdata.DESCRIPCION}"/>
     <input type="hidden" id="FINIPREST" name="FINIPREST" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIPREST}"/>"/>
     <input type="hidden" id="FFINPREST" name="FFINPREST" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINPREST}"/>"/>
     
     <input type="hidden" name="CAGENTE" id="CAGENTE" value="${__formdata.CAGENTE}" />
     <input type="hidden" id="PRO_SPERSON" name="PRO_SPERSON" value="${__formdata.PRO_SPERSON}">
      <!--- BUG:8613 -->
     <!-- Bug 19412 -->
     <input type="hidden" id="CTEMPOR" name="CTEMPOR" value="${__formdata.CTEMPOR}"/>
     <!-- Fin Bug 19412 -->  
     
     <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
     
     <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
     <input type="hidden" id="SSEGURO_CARGA" name="SSEGURO_CARGA" value="${__formdata.SSEGURO_CARGA}"/>
     
     <input type="hidden" id="NDIAS" name="NDIAS" value="${__formdata.NDIAS}"/>
     <input type="hidden" id="NMESES" name="NMESES" value="${__formdata.NMESES}"/>
     <input type="hidden" id="NA�OS" name="NA�OS" value="${__formdata.NA�OS}"/>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_1000234" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="TITULO_DET" lit="9901369" /></c:param>
        <c:param name="nid" value="axisctr188" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="TITULO_DET" lit="9901369" /></c:param>
        <c:param name="nid" value="axisctr218" />
    </c:import>
    
    <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="TITULO_DET" lit="9908904" /></c:param>
        <c:param name="nid" value="axiscalculafecha" />
    </c:import>
    <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
    
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_9900870" lit="9900870" /></c:param>
                <c:param name="nid" value="axisctr103" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_1000184" lit="1000184" /></c:param>
        <c:param name="nid" value="axisctr010" />
    </c:import>
    
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_1000216" lit="1000216" /></c:param>
        <c:param name="nid" value="axisper007" />
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="LIT_1000573" lit="1000573" /></c:param>
        <c:param name="nid" value="axisediciontexto" />
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr004" c="PERSONAS" lit="102073"/></c:param>
            <c:param name="nid">axisper021</c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axisctr004" c="PERSONAS" lit="102073"/></c:param>
            <c:param name="nid">axisper022</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt f="axisctr004" c="COASEGURO" lit="9904170"/></c:param>
        <c:param name="nid">axiscoa004</c:param>
    </c:import>
    
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr503" c="TIT_AXISCTR503" lit="9907572" /></c:param>
                <c:param name="nid" value="axisctr503" />
        </c:import>
    
    <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad"><axis:alt f="axisctr004" c="LIT_101110" lit="101110" />
            <axis:visible f="axisctr004" c="NPOLIZA"> 
            <axis:alt f="axisctr004" c="TITULO_FORM" lit="101779"/> 
            <axis:alt f="axisctr004" c="TITULO_FORM" lit="102707"/> ${__formdata.NPOLIZA}
            </axis:visible>
            <axis:visible f="axisctr004" c="PTMOTMOV"> ${__formdata.PTMOTMOV}
            </axis:visible>
            </c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario"><axis:alt f="axisctr004" c="LIT_FOR" lit="${literalPantalla}" /></c:param>
            <c:param name="form">${pantalla}</c:param>
    </c:import>
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" <c:if test="${param.multiPantalla == 'true'}">style="height:200px;"</c:if>>
        <tr>
            <td>
                <div class="titulo"><img src="images/flecha.gif" /><axis:alt f="axisctr004" c="LIT_1000096" lit="1000096" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:13%;height:0px"></th>
                                    <th style="width:13%;height:0px"></th>
                                    <th style="width:11%;height:0px"></th>
                                    <th style="width:12%;height:0px"></th>
                                    <th style="width:15%;height:0px"></th>
                                </tr>
                                <!-- Fila 1 -->
                                <tr>
                                    <axis:ocultar f="axisctr004" c="FEFECTO">
                                        <td class="titulocaja">
                                            <b id="label_FEFECTO"><axis:alt f="axisctr004" c="LIT_100883" lit="9905745"/></b>                                             
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CDURACI" >
                                        <td class="titulocaja">
                                            <b id="label_CDURACI"><axis:alt f="axisctr004" c="LIT_1000376" lit="1000376"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURACI" >
                                        <td class="titulocaja">
                                            <b id="label_NDURACI"><axis:alt f="axisctr004" c="LIT_1000120" lit="1000120" /></b>
                                        </td>
                                    </axis:ocultar>  

                                    <axis:ocultar f="axisctr004" c="NDURCOB" >
                                        <td class="titulocaja">
                                            <b id="label_NDURCOB"><axis:alt f="axisctr004" c="LIT_9000814" lit="9000814" /></b>
                                        </td>
                                    </axis:ocultar>      
                                    
                                    <axis:ocultar f="axisctr004" c="NRENOVA" >
                                        <td class="titulocaja">
                                            <b id="label_NRENOVA"><axis:alt f="axisctr004" c="LIT_9902118" lit="9902118" /></b>
                                        </td>
                                    </axis:ocultar>                                      
                                    <axis:ocultar f="axisctr004" c="FRENOVA" >
                                        <td class="titulocaja">
                                            <b id="label_FRENOVA"><axis:alt f="axisctr004" c="LIT_102626" lit="102626" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="FVENCIM" >
                                        <td class="titulocaja">
                                            <b id="label_FVENCIM"><axis:alt f="axisctr004" c="LIT_100885" lit="100885" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURPER" >
                                        <td class="titulocaja">
                                            <b id="label_NDURPER"><axis:alt f="axisctr004" c="LIT_1000328" lit="1000328" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="INTTEC" >
                                        <td class="titulocaja">
                                            <b id="label_INTTEC"><axis:alt f="axisctr004" c="LIT_107049" lit="107049" /></b>
                                        </td>
                                    </axis:ocultar>
                                    <!-- // Bug 0025584/135342 - 25/02/2013 - MMS -->
                                    <axis:ocultar f="axisctr004" c="NEDAMAR" >
                                        <td class="titulocaja">
                                            <b id="label_NEDAMAR"><axis:alt f="axisctr004" c="LIT_1000120" lit="1000120" /></b>
                                        </td>
                                    </axis:ocultar> 
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr004" c="FEFECTO" >
                                        <td class="campocaja"  style="white-space:nowrap">
                                            <jsp:useBean id="today" class="java.util.Date" /> 
                                            <c:set var="FEFECTO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FEFECTO}"/></c:set>
                                            <input style="width:80px" maxlength="10" onchange="f_actualitza_fvencim(this);"  type="text" class="campowidthinput campo campotexto" id="FEFECTO" name="FEFECTO" size="15"
                                            <axis:atr f="axisctr004" c="FEFECTO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FEFECTO} <c:if test="${empty FEFECTO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today}"/></c:if>"
                                            title="<axis:alt f="axisctr004" c="LIT_100883" lit="100883"/>"/>
                                            <axis:ocultar f="axisctr004" c="icon_FEFECTO" >
	                                            <a id="icon_FEFECTO" style="vertical-align:middle;"><img 
	                                             alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axisctr004" c="LIT_100883" lit="100883" />" src="images/calendar.gif"/></a>
                                            </axis:ocultar>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="CDURACI" >
                                        <td class="campocaja">
                                            <select name = "CDURACI" id ="CDURACI"  style="width:190px;"  size="1" onchange="f_carga_dependencias();f_actualitza_fvencim2(this)" 
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisctr004" c="CDURACI" a="modificable=false&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoDuracion}" var="tipoDuracion">
                                                    <option value = "${tipoDuracion.CATRIBU}" <c:if test="${tipoDuracion.CATRIBU  == sessionScope.axisctr_datosGestion.CDURACI}">selected</c:if>>${tipoDuracion.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NDURACI" >
                                        <td class="campocaja">
                                            <input type="text" style="width:40%" class="campowidthinput campo campotexto" id="NDURACI" name="NDURACI"  title="<axis:alt f="axisctr004" c="LIT_1000120" lit="1000120"/>"
                                            size="15" onchange="f_actualitza_fvencim2(this)"   value ="${sessionScope.axisctr_datosGestion.DURACION}" <axis:atr f="axisctr004" c="NDURACI" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>  

                                    <axis:ocultar f="axisctr004" c="NDURCOB" >
                                        <td class="campocaja">
                                            <%-- bfp bug 22253 ini --%>
                                            <c:if test="${__configform.axisctr004__NDURCOB__formato == 'lista'}">
                                                <%-- Entonces implementar un campo del tipo SELECT. --%>
                                                <select name = "NDURCOB" id ="NDURCOB" size="1" onchange="f_carga_dependencias();" 
                                                    class="campowidthselect campo campotexto" 
                                                    <axis:atr f="axisctr004" c="NDURCOB" a="modificable=false&isInputText=false"/>>&nbsp;
                                                    <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.lDurCob}" var="datosGestion">
                                                        <option value = "${datosGestion.OB_IAX_DURCOBROPROD.NDURCOB}" <c:if test="${datosGestion.OB_IAX_DURCOBROPROD.NDURCOB  == sessionScope.axisctr_datosGestion.NDURCOB}">selected</c:if>>${datosGestion.OB_IAX_DURCOBROPROD.NDURCOB}</option>
                                                    </c:forEach>
                                                </select>
                                            </c:if>
                                            <c:if test="${__configform.axisctr004__NDURCOB__formato != 'lista'}">
                                                <%-- Entonces dejarlo como est� ahora. --%>
                                                <input onchange="refreshModifVisble();" type="text" style="width:40%" class="campowidthinput campo campotexto" id="NDURCOB" name="NDURCOB"  title="<axis:alt f="axisctr004" c="LIT_1000120" lit="1000120"/>"
                                                size="15"  value ="${sessionScope.axisctr_datosGestion.NDURCOB}" <axis:atr f="axisctr004" c="NDURCOB" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                            </c:if>
                                            <%-- bfp bug 22253 fi --%>
                                        </td>
                                    </axis:ocultar>  
                                    
                                    <axis:ocultar f="axisctr004" c="NRENOVA" >
                                        <td class="campocaja">
                                            <input type="text" style="width:80%" class="campowidthinput campo campotexto" id="NRENOVA" name="NRENOVA"  title="<axis:alt f="axisctr004" c="LIT_9902118" lit="9902118"/>"
                                            size="15"  value ="${sessionScope.axisctr_datosGestion.NRENOVA}" <axis:atr f="axisctr004" c="NRENOVA" a="modificable=true&obligatorio=false&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar> 

                                     <axis:ocultar f="axisctr004" c="FRENOVA" >
                                         <td class="campocaja">
                                            <c:set var="FRENOVA"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FRENOVA}"/></c:set>
                                            <input style="width:75%" type="text" class="campowidthinput campo campotexto" id="FRENOVA" name="FRENOVA" size="15"
                                            value ="${FRENOVA}" title="<axis:alt f="axisctr004" c="LIT_102626" lit="102626"/>" <axis:atr f="axisctr004" c="FRENOVA" a="modificable=true&obligatorio=false&formato=fecha"/>/><a id="icon_FRENOVA" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_102626" lit="102626" />" title="<axis:alt f="axisctr004" c="LIT_102626" lit="102626" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:ocultar>

                                     <axis:ocultar f="axisctr004" c="FVENCIM" >
                                         <td class="campocaja"  style="white-space:nowrap">
                                            <c:set var="FVENCIM"><fmt:formatDate pattern="dd/MM/yyyy" value="${axisctr_datosGestion.FVENCIM}"/></c:set>
                                            <input style="width:60px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FVENCIM" name="FVENCIM" size="15"
                                            value ="${FVENCIM}" title="<axis:alt f="axisctr004" c="LIT_10085" lit="100885"/>" <axis:atr f="axisctr004" c="FVENCIM" a="obligatorio=true&modificable=false&formato=fecha"/>/>
                                            <a id="icon_FVENCIM" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341" />" title="<axis:alt f="axisctr004" c="LIT_108341" lit="108341" />" src="images/calendar.gif"/></a>
                                            <a id="icon_FVENCIM2" style="vertical-align:middle;">        <img border="0" alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>"  title="<axis:alt f="axisctr004" c="LIT_100885" lit="100885" />" onclick="f_calculadora('FVENCIM')" src="images/calculadora.gif"/></a>
                                        </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axisctr004" c="NDURPER" >
                                        <td class="campocaja">
                                            <select name = "NDURPER" id ="NDURPER" size="1" 
                                            class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr004" c="NDURPER" a="modificable=false&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosRenta.NDURPER}" var="ndurper">
                                                    <option value = "${ndurper.NDURPER}" <c:if test="${ndurper.NDURPER  == sessionScope.axisctr_datosGestion.NDURPER}">selected</c:if>>${ndurper.NDURPER}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>                                    
                                     <axis:ocultar f="axisctr004" c="INTTEC" >
                                        <td class="campocaja">
                                         <input type="text" class="campowidth campo campotexto" id="INTTEC" name="INTTEC" title="<axis:alt f="axisctr004" c="LIT_180148" lit="180148"/>" 
                                                             size="15" value ="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}' value='${sessionScope.axisctr_datosGestion.INTTEC}'/>"                                                             
                                                            <axis:atr f="axisctr100" c="INTTEC" a="obligatorio=false&modificable=true&formato=decimal"/> />&nbsp;
                                        </td>
                                    </axis:ocultar>
                                    <!-- // Bug 0025584/135342 - 25/02/2013 - MMS -->
                                    <axis:visible f="axisctr004" c="NEDAMAR" >
                                        <td class="campocaja">
                                            <select name = "NEDAMAR" id ="NEDAMAR" size="1" onchange="f_OnChange(this)"
                                            class="campowidthselect campo campotexto" <axis:atr f="axisctr004" c="NEDAMAR" a="isInputText=false"/>>&nbsp;
                                                <option value="null"> - <axis:alt f="axisctr004" c="LIT_108341" lit="108341"/> - </option> 
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.lstNEDAMAR}" var="lstNEDAMAR">
                                                    <option value = "${lstNEDAMAR.CODI}" <c:if test="${lstNEDAMAR.CODI  == sessionScope.axisctr_datosGestion.NEDAMAR}">selected</c:if>>${lstNEDAMAR.DESCRIPCION}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                </tr>

                                <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->
                                <tr>
                                    <axis:ocultar f="axisctr004" c="PEJECUCION2"  >
                                        <td class="titulocaja" align="right">
                                        </td>
                                    </axis:ocultar>
                                    
                                    <td class="titulocaja" style="white-space:nowrap">
                                        <axis:ocultar f="axisctr004" c="FEFEPLAZO" >
                                            <b id="label_FEFEPLAZO"><axis:alt f="axisctr004" c="LIT_9908885" lit="9908885" /></b>
                                            <b class="campocaja" style="white-space:nowrap"></b>
                                            <b class="campocaja" style="white-space:nowrap"></b>
                                            <b class="campocaja" style="white-space:nowrap"></b>                                            
                                        </axis:ocultar>
                                        
                                        <axis:ocultar f="axisctr004" c="FVENCPLAZO" >
                                            <b id="label_FVENCPLAZO"><axis:alt f="axisctr004" c="LIT_9908886" lit="9908886" /></b>
                                        </axis:ocultar>
                                    </td>
                                </tr>
                                <tr>
                                    <axis:ocultar f="axisctr004" c="PEJECUCION"  >
                                        <td class="titulocaja" align="right">
                                            <b id="label_PEJECUCION"><axis:alt f="axisctr004" c="LIT_9908900" lit="9908900" /></b>
                                        </td>
                                    </axis:ocultar>
                                    
                                    <td class="campocaja"  style="white-space:nowrap">
									<!-- Changed for Date Error in IAXIS-4321 PK-16/06/2019 Start -->
                                     <axis:ocultar f="axisctr004" c="FEFEPLAZO" >                                        
                                            <jsp:useBean id="today_FEFEPLAZO" class="java.util.Date" /> 
                                            <c:set var="FEFEPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FEFEPLAZO}"/></c:set>
                                            <input style="width:80px" maxlength="11" onchange="f_actualitza_fvencim(this);" type="text" class="campowidthinput campo campotexto" id="FEFEPLAZO" name="FEFEPLAZO" size="15"
                                            <axis:atr f="axisctr004" c="FEFEPLAZO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FEFEPLAZO} <c:if test="${empty FEFEPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FEFEPLAZO}"/></c:if>"
                                            title="<axis:alt f="axisctr004" c="LIT_9908885" lit="9908885"/>"/>
											<a id="icon_FEFEPLAZO" style="vertical-align:middle;"><img alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axisctr004" c="LIT_9908885" lit="9908885" />" src="images/calendar.gif"/></a>
                                    </axis:ocultar>                                    
                                    
                                     <axis:ocultar f="axisctr004" c="FVENCPLAZO" >
                                            <b class="campocaja"  style="white-space:nowrap"></b>
                                            <jsp:useBean id="today_FVENCPLAZO" class="java.util.Date" /> 
                                            <c:set var="FVENCPLAZO"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FVENCPLAZO}"/></c:set>
                                            <input style="width:80px" maxlength="11" type="text" class="campowidthinput campo campotexto" id="FVENCPLAZO" name="FVENCPLAZO" size="15"
                                            <axis:atr f="axisctr004" c="FVENCPLAZO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FVENCPLAZO} <c:if test="${empty FVENCPLAZO}"><fmt:formatDate pattern="dd/MM/yyyy" value="${today_FVENCPLAZO}"/></c:if>"
                                            title="<axis:alt f="axisctr004" c="LIT_9908886" lit="9908886"/>"/>
											<a id="icon_FVENCPLAZO" style="vertical-align:middle;" href="#"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341" />" title="<axis:alt f="axisctr004" c="LIT_108341" lit="108341" />" src="images/calendar.gif"/></a>
											<a id="icon_FVENCPLAZO2" style="vertical-align:middle;"><img 
                                             alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>" title="<axis:alt f="axisctr004" c="LIT_9908886" lit="9908886" />" onclick="f_calculadora('FVENCPLAZO')" src="images/calculadora.gif"/></a>
                                    </axis:ocultar>
									<!-- Changed for Date Error in IAXIS-4321 PK-16/06/2019 End -->
                                    </td>
                                </tr>
                                <!-- BUG 41143/229973 - 17/03/2016 - JAEG -->                               

                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                
                <axis:ocultar f="axisctr004" c="DSP_DATOS_ECONOMICOS" dejarHueco="false" >
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_1000097" lit="1000097" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <!-- bug 20761 -->
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                </tr>
                                
                                
                                
                                <tr>
                                 <axis:visible f="axisctr004" c="CMONPOL" >
                                        <td class="titulocaja">
                                            <b id="label_CMONPOL"><axis:alt f="axisctr004" c="CMONPOL" lit="9903001" /></b>
                                        </td>
                                    </axis:visible>
                                
                                </tr>
                                
                                <tr>
                                    <axis:visible f="axisctr004" c="CMONPOL" >
                                        <td class="campocaja">
                                            <select name = "CMONPOL" id ="CMONPOL" size="1" 
                                                class="campowidthselect campo campotexto" <axis:atr f="axisctr004" c="CMONPOL" a="isInputText=false"/>>&nbsp;
                                                 <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr004" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.monedasPago}" var="monedaPago">
                                                    <option value = "${monedaPago.CMONEDA}" <c:if test="${monedaPago.CMONEDA  == sessionScope.axisctr_datosGestion.CMONPOL}">selected</c:if>>${monedaPago.TMONEDA}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                </tr>

                                <tr>
                                    <axis:visible f="axisctr004" c="CFORPAG" >
                                        <td class="titulocaja">
                                            <b id="label_CFORPAG"><axis:alt f="axisctr004" c="LIT_100712" lit="100712" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="CTIPCOB" >
                                        <td class="titulocaja" colspan="2">
                                            <b id="label_CTIPCOB"><axis:alt f="axisctr004" c="LIT_151348" lit="151348" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr004" c="CDOMPER" >
                                     	<td class="titulocaja">
                                     		<b id="label_CDOMPER">
                                        <axis:alt f="axisctr004" c="LIT_9903820" lit="9903820" />
                                      </b>
                                     		</td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="CBANCAR" >
                                        <td class="titulocaja">
                                            <b id="label_CBANCAR"><axis:alt f="axisctr004" c="LIT_1000092" lit="1000092" /></b>
                                        </td>
                                     </axis:visible>                                            
                                    <!-- bug 20761 -->
                                    <axis:visible f="axisctr004" c="label_NCUOTAR" >
                                        <td class="titulocaja"  id="tit_NCUOTAR">
                                            <b id="label_NCUOTAR"><axis:alt f="axisctr004" c="LIT_9901245" lit="9901245" /></b>
                                        </td>
                                    </axis:visible>
                                    <!-- Bug 20761 -->
                                    <td colspan="2">
                                        &nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr004" c="CFORPAG" >
                                        <td class="campocaja">
                                            <select name = "CFORPAG" id ="CFORPAG" size="1" onchange="f_OnChange(this)" 
                                                class="campowidthselect campo campotexto" <axis:atr f="axisctr004" c="CFORPAG" a="isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.formaPago}" var="formaPago">
                                                    <option value = "${formaPago.CATRIBU}" <c:if test="${formaPago.CATRIBU  == sessionScope.axisctr_datosGestion.CFORPAG}">selected</c:if>>${formaPago.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="CTIPCOB" >
                                        <td class="campocaja" colspan="2">
                                            <select name = "CTIPCOB" id ="CTIPCOB" size="1" onchange="f_OnChange(this)" 
                                                class="campowidthselect campo campotexto" title="<axis:alt f="axisctr004" c="LIT_151348" lit="151348"/>" <axis:atr f="axisctr004" c="CTIPCOB" a="isInputText=false"/>>&nbsp;
                                                <option value="null"> - <axis:alt f="axisctr004" c="LIT_108341" lit="108341"/> - </option> 
                                                
                                                <c:set var="isUnicoyObligatorio" value="${fn:length(sessionScope.axisctr_opcionesDatosGestion.tipoCobro) == 1}" />
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoCobro}" var="tipoCobro">
                                                    <option value = "${tipoCobro.CATRIBU}" <c:if test="${tipoCobro.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOB || isUnicoyObligatorio}">selected</c:if>>${tipoCobro.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="CDOMPER" >
                                        <td class="campocaja">
                                      <input  
                                        <c:if test="${sessionScope.axisctr_datosGestion.CDOMPER == '1'}">checked</c:if>   onchange="f_onclickCheckbox(this);"   <axis:atr f="axisctr004" c="CDOMPER" a="modificable=true&isInputText=false"/> type="checkbox" id="CDOMPER" name="CDOMPER" value="${sessionScope.axisctr_datosGestion.CDOMPER}"/>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="CBANCAR" >
                                         <td class="campocaja">
                                            <axis:encryptflag f="axisctr004" c="CBANCAR" />
                                            <select name = "CBANCAR" style="width:112%" id ="CBANCAR" size="1" onchange="f_Get_Tarjeta(this.value);" 
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr004" c="CBANCAR" a="isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.cuentasTomador}" var="cuentaTomador">
                                                    <option value = "<axis:encrypt f="axisctr004" c="CBANCAR" value="${cuentaTomador.CBANCAR}" />@@${cuentaTomador.CTIPBAN}" <c:if test="${cuentaTomador.CBANCAR  == sessionScope.CBANCAR}">selected</c:if>><axis:masc f="axisctr004" c="CBANCAR" value="${cuentaTomador.TCBANCAR}" /></option>
                                                </c:forEach>
                                            </select>
                                             
                                         </td>
                                   </axis:visible>
                                            <!-- bug 20761 -->            
                                   <axis:ocultar f="axisctr004" c="NCUOTAR" >
                                   <td class="campocaja" id="td_NCUOTAR" >
                                                    <input type="text" style="width:30%"  class="campowidthpercent campo campotexto" id="NCUOTAR" name="NCUOTAR"
                                                    title="<axis:alt f="axisctr004" c="NCUOTAR" lit="9901245"/>" size="1" value ="${sessionScope.axisctr_datosGestion.NCUOTAR}"
                                                    <axis:atr f="axisctr004" c="NCUOTAR" a="modificable=true"/>/>
                                   </td>
                                   </axis:ocultar>  
                                   
                                   <td class="campocaja">
                                   <!-- bug 20761 -->            
                                   <axis:ocultar f="axisctr004" c="TARJETA" >
                                                    <input type="hidden" style="width:30%"  class="campowidthpercent campo campotexto" id="TARJETA" name="TARJETA" 
                                                    title="<axis:alt f="axisctr004" c="TARJETA" lit="9901245"/>" size="1" value ="${sessionScope.axisctr_datosGestion.TARJETA}"
                                                    <axis:atr f="axisctr004" c="TARJETA" a="modificable=true"/>/>&nbsp;
                                   </axis:ocultar>  

                                   <axis:visible f="axisctr004" c="BT_CBANCAR">
                                                 <a id="icon_CBANCAR" href="javascript:f_abrir_axisper007(${__formdata.SPERSON})"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000124" lit="1000124"/>" title="<axis:alt f="axisctr004" c="LIT_1000124" lit="1000124"/>" src="images/lapiz.gif"/></a>
                                   </axis:visible>
                                            <axis:visible f="axisctr004" c="BT_BUSCAR" >
                                                 <input type="button" class="boton" id="BT_BUSCAR" name="BT_BUSCAR"  value="<axis:alt f="axisctr004" c="BT_BUSCAR" lit="9000508"></axis:alt>" onclick="f_Get_CCC(${__formdata.SPERSON},'${fn:trim(__formdata.SNIP)}')" />
                                            </axis:visible>
                                  <!-- Bug 20761 -->
                                  </td>
                                  <td>
                                            <axis:visible f="axisctr004" c="BT_BUSCARHOST" >
                                                
                                                    <input type="button" class="boton" id="BT_BUSCARHOST" name="BT_BUSCARHOST"  value="<axis:alt f='axisctr004' c='BT_BUSCARHOST' lit='9000509' />" onclick="f_Get_CCC_HOST(${__formdata.SPERSON},'${fn:trim(__formdata.SNIP)}')" />
                                              
                                            </axis:visible>
                                  </td>          
                                        
                                                                       
                                </tr>
                                 <tr> 
                                 
                                        <axis:visible f="axisctr004" c="CCOBBAN">     
                                            <td class="titulocaja">
                                                <b id="label_CCOBBAN"><axis:alt f="axisctr004" c="LIT_100879" lit="100879" /></b>
                                            </td>
                                        </axis:visible> 
                                        
                                        <axis:visible f="axisctr004" c="CFOLNUM">
                                            <td class="titulocaja">
                                                <b id="label_CFOLNUM"><axis:alt f="axisctr004" c="CFOLNUM" lit="9906602" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr004" c="CFECMAN">
                                            <td class="titulocaja">
                                                <b id="label_CFECMAN"><axis:alt f="axisctr004" c="CFECMAN" lit="9906603" /></b>
                                            </td>
                                        </axis:visible>

                                        <axis:visible f="axisctr004" c="FFINVIG">
                                            <td class="titulocaja">
                                                <b id="label_FFINVIG"><axis:alt f="axisctr004" c="FFINVIG" lit="9000717" /></b>
                                            </td>
                                        </axis:visible>
                                        
                                        <axis:visible f="axisctr004" c="CSUCURSAL">
                                            <td class="titulocaja">
                                                <b id="label_CSUCURSAL"><axis:alt f="axisctr004" c="CSUCURSAL" lit="9002202" /></b>
                                            </td>
                                        </axis:visible>
                                </tr>
                                <tr>    
                                
                                    <axis:visible f="axisctr004" c="CCOBBAN">  
                                   
                                        <td class="campocaja">                                   
                                                    <select name = "CCOBBAN" id ="CCOBBAN" size="1"  
                                                        class="campowidthselect campo campotexto"      onchange="on_Change(this)"                                                   
                                                        <axis:atr f="axisctr004" c="CCOBBAN" a="isInputText=false"/>
                                                       title="<axis:alt f="axisctr004" c="CCOBBAN" lit="100879"/>">                                              
                                                        <option value="<%=Integer.MIN_VALUE%>"> - <axis:alt f="axisctr004" c="SELEC" lit="1000348"/> - </option>                                                                                                   
                                                        <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.cobradores}" var="lstCobradores">
                                                            <option value = "${lstCobradores.CCOBBAN}" <c:if test="${lstCobradores.CCOBBAN  == sessionScope.axisctr_datosGestion.CCOBBAN}">selected</c:if>>${lstCobradores.TDESCRI}</option>
                                                        </c:forEach>
                                                    </select>                                               
                                        </td>
                                   
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr004" c="CFOLNUM">
                                        <td class="campocaja">
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="CFOLNUM" name="CFOLNUM" size="15" title="<axis:alt f="axisctr004" c="CFOLNUM" lit="9906602"/>"
                                              value="${sessionScope.axisctr_datosGestion.CFOLNUM}" <axis:atr f="axisctr004" c="CFOLNUM" a="modificable=true&formato=entero&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr004" c="CFECMAN">
                                        <td class="campocaja"  style="white-space:nowrap">
                                            <c:set var="CFECMAN"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.CFECMAN}"/></c:set>
                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="CFECMAN" name="CFECMAN" size="15"
                                            <axis:atr f="axisctr004" c="CFECMAN" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${CFECMAN}" title="<axis:alt f="axisctr004" c="CFECMAN" lit="9906603"/>"/><a id="icon_CFECMAN"
                                            style="vertical-align:middle;" name="icon_CFECMAN"><img alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>"
                                            title="<axis:alt f="axisctr004" c="CFECMAN" lit="9906603" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:visible>

                                    <axis:visible f="axisctr004" c="FFINVIG">
                                        <td class="campocaja"  style="white-space:nowrap">
                                            <c:set var="FFINVIG"><fmt:formatDate pattern="dd/MM/yyyy" value="${sessionScope.axisctr_datosGestion.FFINVIG}"/></c:set>
                                            <input style="width:80px" maxlength="10" type="text" class="campowidthinput campo campotexto" id="FFINVIG" name="FFINVIG" size="15"
                                            <axis:atr f="axisctr004" c="FFINVIG" a="modificable=true&obligatorio=true&formato=fecha"/>
                                            value="${FFINVIG}" title="<axis:alt f="axisctr004" c="FFINVIG" lit="9906603"/>"/><a id="icon_FFINVIG"
                                            style="vertical-align:middle;" name="icon_FFINVIG"><img alt="<axis:alt f="axisctr004" c="LIT_108341" lit="108341"/>"
                                            title="<axis:alt f="axisctr004" c="FFINVIG" lit="9000717" />" src="images/calendar.gif"/></a>
                                        </td>
                                    </axis:visible>

                                    <axis:visible f="axisctr004" c="CSUCURSAL">
                                        <td class="campocaja" colspan="2">
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="CSUCURSAL" name="CSUCURSAL" size="75" maxlength="50" title="<axis:alt f="axisctr004" c="CSUCURSAL" lit="9002202"/>"
                                              value="${sessionScope.axisctr_datosGestion.CSUCURSAL}" <axis:atr f="axisctr004" c="CSUCURSAL" a="modificable=true&obligatorio=true"/> />
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                <axis:visible f="axisctr004" c="CPOLCIA">
                                <td class="campocaja">
                                    
                                      <b id="label_CPOLCIA">
                                        <axis:alt f="axisctr004" c="label_CPOLCIA" lit="9001766"/>
                                      </b>
                                    
                                    </td>
                                    </axis:visible>  
                                    </tr>
                                <tr>
                                    <axis:ocultar f="axisctr004" c="CPOLCIA" dejarHueco="false" >
                                         <td class="campocaja">
                                        
                                              <input type="text" style="width:90%" class="campowidthinput campo campotexto" id="CPOLCIA" name="CPOLCIA" size="15" title="<axis:alt f="axisctr004" c="CPOLCIA" lit="9001766"/>"
                                              value="${sessionScope.axisctr_datosGestion.CPOLCIA}" <axis:atr f="axisctr004" c="CPOLCIA" a="modificable=true"/> />
                                        </td>
                                     </axis:ocultar>
                                    <td class="campocaja">
                                    <axis:ocultar f="axisctr004" c="CRECFRA">
                                      <b id="label_CRECFRA">
                                        <axis:alt f="axisctr004" c="LIT_1000483" lit="1000483" />
                                      </b>
                                    </axis:ocultar>  
                                    <axis:ocultar f="axisctr004" c="CRECFRA">
                                      <input  
                                        <c:if test="${sessionScope.axisctr_datosGestion.CRECFRA == '1'}">checked="true"</c:if> onchange="f_onclickCheckbox(this);"  
                                      type="checkbox" id="CRECFRA" name="CRECFRA" value="${sessionScope.axisctr_datosGestion.CRECFRA}" <axis:atr f="axisctr004" c="CRECFRA" a="isInputText=false"/>/>
                                    </axis:ocultar>
                                    </td>
                                </tr>                                
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                </axis:ocultar>
                
                <axis:ocultar f="axisctr004" c="DSP_REASEGURO" dejarHueco="false">
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_100956" lit="100956" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:40%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>                                
                                </tr>
                                <!-- Fila 3 -->
                                <tr>

                                    <axis:ocultar f="axisctr004" c="CREATIP" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_CREATIP"><axis:alt f="axisctr004" c="LIT_9902612" lit="9902612" /></b>
                                        </td>
                                    </axis:ocultar> 
                                    <axis:ocultar f="axisctr004" c="label_PFACULT" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b id="label_PFACULT"><axis:alt f="axisctr004" c="label_PFACULT" lit="9902952" /></b>
                                        </td>
                                    </axis:ocultar>         
                                </tr>
                                <tr>

                                    <axis:ocultar f="axisctr004" c="CREATIP" dejarHueco="false">
                                        <td class="campocaja">
                                            <select name ="CREATIP" id ="CREATIP" size="1" onchange="f_OnChange(this)" 
                                                class="campowidth campo campotexto" style="width:90%" <axis:atr f="axisctr004" c="CREATIP" a="isInputText=false"/>>&nbsp; 
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoReaseguro}" var="reaseguro">
                                                <option value = "${reaseguro.CATRIBU}" <c:if test="${reaseguro.CATRIBU  == sessionScope.axisctr_datosGestion.CREATIP}">selected</c:if>>${reaseguro.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                            <input type="hidden" id="CTIPREA" name="CTIPREA" value="${__formdata.CTIPREA}"/>
                                            <input type="hidden" id="CREAFAC" name="CREAFAC" value="${__formdata.CREAFAC}"/>
                                        </td>
                                    </axis:ocultar>   
                                    <axis:ocultar f="axisctr004" c="PFACULT" dejarHueco="false">
                                       <td class="campocaja"><input type="text"
                                        style="width: 40%" class="campowidthinput campo campotexto"
                                        id="PFACULT" name="PFACULT"
										onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico((this.value).replace('.',','), true, -1,'<axis:alt f="axisctr004" c="PFACULT" lit="101502"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric((this.value).replace('.', ',')))); if(num>100 || num <= 0){alert('<axis:alt f="axisctr004" c="PFACULT" lit="89908138"/>');this.value='';this.focus()}else{this.value=num.toFixed(4).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                        title="<axis:alt f="axisctr004" c="label_PFACULT" lit="9902952"/>"
                                        size="15"
                                        value="<fmt:formatNumber pattern="###,####0.0000" value="${sessionScope.axisctr_datosGestion.PFACULT}"/>"
                                        <axis:atr f="axisctr004" c="PFACULT" a="modificable=true&obligatorio=true"/> />
                                       </td>
                                     </axis:ocultar>                                
                                </tr>                           
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                </axis:ocultar>
                
                
                <axis:ocultar f="axisctr004" c="DSP_COASEGURO" dejarHueco="false">
                <input type="hidden" id="COA" name="COA" value=""/>
                
                <table class="seccion">
                <tr>
                        <td align="left">
                                <div class="titulo">
                                        <img src="images/flecha.gif" />
                                        <axis:alt f="axisctr004" c="label_CTIPCOA" lit="105387" />
                                </div>
                                <table class="area" align="center">
                                        <tr>
                                                <th style="width: 22%; height: 0px"></th>
                                                <th style="width: 22%; height: 0px"></th>
                                                <th style="width: 22%; height: 0px"></th>
                                                <th style="width: 22%; height: 0px"></th>
                                                <th style="width: 15%; height: 0px"></th>
                                        </tr>
                                        <tr>
                                                <axis:ocultar f="axisctr004" c="CTIPCOA" dejarHueco="false">
                                                        <td class="titulocaja"><b id="label_CTIPCOA"><axis:alt
                                                                                f="axisctr004" c="label_CTIPCOA" lit="105387" /></b></td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr004" c="label_PLOCCOA"
                                                        dejarHueco="false">
                                                        <td class="titulocaja"><b id="label_PLOCCOA"><axis:alt
                                                                                f="axisctr004" c="label_PLOCCOA" lit="9904141" /></b></td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr004" c="SCIACOA" dejarHueco="false">
                                                        <td class="titulocaja"><b id="label_SCIACOA"><axis:alt
                                                                                f="axisctr004" c="label_SCIACOA" lit="9904142" /></b></td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axisctr004" c="NPOLCIA" dejarHueco="false">
                                                        <td class="titulocaja"><b id="label_NPOLCIA"><axis:alt
                                                                                f="axisctr004" c="label_NPOLCIA" lit="9904143" /></b></td>
                                                </axis:ocultar>


                                        </tr>
                                        <tr>
                                                <axis:ocultar f="axisctr004" c="CTIPCOA" dejarHueco="false">
                                                        <td class="campocaja"><select name="CTIPCOA"
                                                                id="CTIPCOA" size="1" onchange="f_cambia_tipo()"
                                                                class="campowidthselect campo campotexto"
                                                                title="<axis:alt f="axisctr004" c="label_CTIPCOA" lit="105387"/>"
                                                                <axis:atr f="axisctr004" c="CTIPCOA" a="obligatorio=true&isInputText=false"/>>&nbsp;
                                                                        <c:forEach
                                                                                items="${sessionScope.axisctr_opcionesDatosGestion.coaseguro}"
                                                                                var="coa">
                                                                                <option value="${coa.CATRIBU}"
                                                                                        <c:if test="${(!empty __formdata.CTIPCOA && coa.CATRIBU  == __formdata.CTIPCOA) || (!empty sessionScope.axisctr_datosGestion.CTIPCOA && sessionScope.axisctr_datosGestion.CTIPCOA == coa.CATRIBU)}">selected</c:if>>${coa.TATRIBU}</option>
                                                                        </c:forEach>
                                                        </select></td>
                                                </axis:ocultar>
												<!--INI-CES-IAXIS-3581 16/04/2019-->
                                                <axis:ocultar f="axisctr004" c="PLOCCOA" dejarHueco="false">
                                                        <td class="campocaja"><input type="text"
                                                                style="width: 40%" class="campowidthinput campo campotexto"
                                                                id="PLOCCOA" name="PLOCCOA"
																onblur="if(!objUtiles.estaVacio(this.value)) if(!objValidador.esCampoNumerico((this.value).replace('.',','), true, -1,'<axis:alt f="axisctr004" c="PLOCCOA" lit="9904141"/>')){this.value='';this.focus()}else{var num=parseFloat(objNumero.cambiarSeparadorDecimalesPorMiles(objNumero.stripNonNumeric((this.value).replace('.', ',')))); if(num>99){alert('<axis:alt f="axisctr004" c="PLOCCOA" lit="89906154"/>');this.value='';this.focus()}else{this.value=num.toFixed(4).replace(objNumero.getSeparadorMiles(),objNumero.getSeparadorDecimales())}}"
                                                                title="<axis:alt f="axisctr004" c="label_PLOCCOA" lit="9904141"/>"
                                                                size="15"
                                                                value="<fmt:formatNumber pattern="###,####0.0000" value="${sessionScope.axisctr_datosGestion.datcoaseguro.PLOCCOA}"/>"
                                                                <axis:atr f="axisctr004" c="PLOCCOA" a="modificable=true&obligatorio=true"/> />
                                                        </td>
                                                </axis:ocultar>
												<!--END-CES-IAXIS-3581 16/04/2019 -->
                                                <axis:ocultar f="axisctr004" c="SCIACOA" dejarHueco="false">
                                                        <td class="campocaja"><select name="SCIACOA"
                                                                id="SCIACOA" size="1" onchange="f_cambia_tipo()"
                                                                class="campowidthselect campo campotexto"
                                                                title="<axis:alt f="axisctr004" c="label_SCIACOA" lit="9904142"/>"
                                                                alt="<axis:alt f="axisctr004" c="label_SCIACOA" lit="9904142"/>"
                                                                <axis:atr f="axisctr004" c="SCIACOA" a="obligatorio=true&isInputText=false"/>>&nbsp;
                                                                        <option value="<%=Integer.MIN_VALUE%>">-
                                                                                <axis:alt f="axisctr004" c="SELEC" lit="1000348" /> -
                                                                        </option>
                                                                        <c:forEach
                                                                                items="${sessionScope.axisctr_opcionesDatosGestion.companias}"
                                                                                var="cia">
                                                                                <option value="${cia.CCOMPANI}"
                                                                                        <c:if test="${(cia.CCOMPANI  == __fomdata.SCIACOA)|| (!empty sessionScope.axisctr_datosGestion.datcoaseguro.CCOMPAN && sessionScope.axisctr_datosGestion.datcoaseguro.CCOMPAN == cia.CCOMPANI)}">selected</c:if>>${cia.TCOMPANI}</option>
                                                                        </c:forEach>
                                                        </select></td>
                                                </axis:ocultar>
												
                                                <axis:ocultar f="axisctr004" c="NPOLCIA" dejarHueco="false">
                                                        <td class="campocaja"><input type="text"
                                                                style="width: 60%"
                                                                title="<axis:alt f="axisctr004" c="label_NPOLCIA" lit="9904143"/>"
                                                                alt="<axis:alt f="axisctr004" c="label_NPOLCIA" lit="9904143"/>"
                                                                class="campowidthinput campo campotexto" id="NPOLCIA"
                                                                name="NPOLCIA" size="15"
                                                                value="${sessionScope.axisctr_datosGestion.datcoaseguro.NPOLIZA}"
                                                                <axis:atr f="axisctr004" c="NPOLCIA" a="obligatorio=true%modificable=true&obligatorio=false"/> />&nbsp;
                                                        </td>
                                                </axis:ocultar>
                                                
                                                
                                        <tr>
                                                <th style="width: 20%; height: 0px"></th>
                                                
                                        </tr>	
                                        <tr>

                                                <axis:visible f="axisctr004" c="ENDOSO">
                                                        <td class="titulocaja"><b id="label_ENDOSO"><axis:alt
                                                                                f="axisctr004" c="label_ENDOSO" lit="9905423" /></b></td>
                                                </axis:visible>

                                        </tr>

                                        <tr>

                                                <axis:visible f="axisctr004" c="ENDOSO">
                                                        <td class="campocaja"><input type="text"
                                                                style="width: 100%"
                                                                title="<axis:alt f="axisctr004" c="ENDOSO" lit="9905423"/>"
                                                                alt="<axis:alt f="axisctr004" c="ENDOSO" lit="9905423"/>"
                                                                class="campowidthinput campo campotexto" id="ENDOSO"
                                                                name="ENDOSO" size="15"
                                                                value="${sessionScope.axisctr_datosGestion.datcoaseguro.ENDOSO}"
                                                                <axis:atr f="axisctr004" c="ENDOSO" a="obligatorio=false%modificable=false"/> />&nbsp;
                                                        </td>
                                                </axis:visible>

                                        </tr>


                                        </tr>
                                        <div class="separador">&nbsp;</div>
                                </table>
                        </td>
                </tr>
                <axis:ocultar f="axisctr004" c="DSP_COASEGURO_CUADRO"
                        dejarHueco="false">
                        <tr id="TABLA1">
                                <axis:ocultar f="axisctr004" c="NEWTABLACOA" dejarHueco="false">
                                        <td class="titulocaja" style="width: 50%"><b
                                                id="label_TABLACOA"><axis:alt f="axisctr004"
                                                                c="label_TABLACOA" lit="9904396" /></b> <!--img border="0" src="images/find.gif" onclick="f_abrir_axiscoacom1()" style="cursor:pointer"/-->
                                                <img border="0" src="images/lapiz.gif" align="right"
                                                onclick="f_abrir_axiscoa004()" style="cursor: pointer" /></td>
                                </axis:ocultar>
                        </tr>
                        <tr id="TABLA2">
                                <td style="width: 50%;">
                                        <table class="area" align="center">
                                                <tr>
                                                        <td align="left">
                                                                <div class="displayspace">
                                                                        <c:set var="title1">
                                                                                <b><axis:alt f="axisctr004" c="label_TCOMPANI"
                                                                                                lit="9000600" /></b>
                                                                        </c:set>
                                                                        <c:set var="title2">
                                                                                <b><axis:alt f="axisctr004" c="label_PCESCOA"
                                                                                                lit="104818" /></b>
                                                                        </c:set>
                                                                        <c:set var="title3">
                                                                                <b><axis:alt f="axisctr004" c="label_PCOMCON"
                                                                                                lit="9001923" /></b>
                                                                        </c:set>
                                                                        <c:set var="title4">
                                                                                <b><axis:alt f="axisctr004" c="label_PCOMGAS"
                                                                                                lit="9902215" />
                                                                        </c:set>
                                                                        <c:set var="title5">
                                                                                <b><axis:alt f="axisctr004" c="label_PCOMCOA"
                                                                                                lit="9904150" />
                                                                        </c:set>
                                                                        <display:table
                                                                                name="${sessionScope.axisctr_datosGestion.datcoaseguro.COACEDIDO}"
                                                                                id="coa" export="false" class="dsptgtable" pagesize="-1"
                                                                                defaultsort="1" defaultorder="ascending" sort="list"
                                                                                cellpadding="0" cellspacing="0"
                                                                                requestURI="axis_axisctr004.do?paginar=true">
                                                                                <%@ include file="../include/displaytag.jsp"%>
                                                                                <axis:visible f="axisctr004" c="TCOMPAN">
                                                                                        <display:column title="${title1}" sortable="false"
                                                                                                sortProperty="OB_IAX_TOMADORES.TTIPIDE"
                                                                                                headerClass="sortable" style="width:52%" media="html"
                                                                                                autolink="false">
                                                                                                <div class="dspText">${coa.OB_IAX_COACEDIDO.TCOMPAN}</div>
                                                                                        </display:column>
                                                                                </axis:visible>
																				<!--INI-CES-IAXIS-3581 16/04/2019 -->
                                                                                <axis:visible f="axisctr004" c="PCESCOA">
                                                                                        <display:column title="${title2}" sortable="false"
                                                                                                sortProperty="PCESCOA" headerClass="headwidth5 sortable"
                                                                                                style="width:12%" media="html" autolink="false">
                                                                                                <div class="dspNumber">
                                                                                                        <fmt:formatNumber pattern="###,####0.0000"
                                                                                                                value="${coa.OB_IAX_COACEDIDO.PCESCOA}" />
                                                                                                </div>
                                                                                        </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axisctr004" c="PCOMCON">
                                                                                        <display:column title="${title3}" sortable="false"
                                                                                                sortProperty="PCOMCON" headerClass="headwidth5 sortable"
                                                                                                style="width:12%" media="html" autolink="false">
                                                                                                <div class="dspNumber">
                                                                                                        <fmt:formatNumber pattern="###,####0.0000"
                                                                                                                value="${coa.OB_IAX_COACEDIDO.PCOMCON}" />
                                                                                                </div>
                                                                                        </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axisctr004" c="PCOMGAS">
                                                                                        <display:column title="${title4}" sortable="false"
                                                                                                sortProperty="PCOMGAS" headerClass="headwidth5 sortable"
                                                                                                style="width:12%" media="html" autolink="false">
                                                                                                <div class="dspNumber">
                                                                                                        <fmt:formatNumber pattern="###,####0.0000"
                                                                                                                value="${coa.OB_IAX_COACEDIDO.PCOMGAS}" />
                                                                                                </div>
                                                                                        </display:column>
                                                                                </axis:visible>
                                                                                <axis:visible f="axisctr004" c="PCOMCOA">
                                                                                        <display:column title="${title5}" sortable="false"
                                                                                                sortProperty="PCOMCOA" headerClass="headwidth5 sortable"
                                                                                                style="width:12%" media="html" autolink="false">
                                                                                                <div class="dspNumber">
                                                                                                        <fmt:formatNumber pattern="###,####0.0000"
                                                                                                                value="${coa.OB_IAX_COACEDIDO.PCOMCOA}" />
                                                                                                </div>
                                                                                        </display:column>
                                                                                </axis:visible>
																				<!--END-CES-IAXIS-3581 16/04/2019 -->
                                                                        </display:table>
                                                                </div>
                                                        </td>
                                                </tr>
                                        </table>
                                </td>
                        </tr>
                </axis:ocultar>
                </table>
                </axis:ocultar>
                <!--  FIN COASEGURO -->                
                <axis:ocultar f="axisctr004" c="DSP_CONVENIOS" >
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_9907578" lit="9907578" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                		<th style="width:20%;height:0px"></th>
                                    <th style="width:38%;height:0px"></th>
                                    <axis:visible f="axisctr004" c="BT_CONVENIOS">
                                    <th style="width:1%;height:0px"></th>
                                    </axis:visible>                                    
                                    <th style="width:20%;height:0px"></th>                                    
                                    <th style="width:21%;height:0px"></th>
                                </tr>
                                <tr>
                                	<axis:visible f="axisctr004" c="TCODCONV" >
                                        <td class="titulocaja" id="tit_TCODCONV">
                                            <b id="label_TCODCONV"><axis:alt f="axisctr004" c="LIT_9907599" lit="9907599"/></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="CACTIVIDAD">
                                        <td class="titulocaja" id="tit_CACTIVIDAD" >
                                            <b id="label_CACTIVIDAD"><axis:alt f="axisctr004" c="LIT_9902590" lit="9902590"/></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="BT_CONVENIOS">
                                    <td class="titulocaja" id="tit_BT_CONVENIOS">
                                    </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="VERSION" >
                                        <td class="titulocaja" id="tit_VERSION">
                                            <b id="label_VERSION"><axis:alt f="axisctr004" c="LIT_9001146" lit="9001146"/></b>
                                        </td>
                                    </axis:visible>                                    
                                     <axis:visible f="axisctr004" c="VERSIONANT"  >
                                        <td class="titulocaja" id="tit_VERSIONANT">
                                            <b id="label_VERSIONANT"><axis:alt f="axisctr004" c="LIT_9907574" lit="9907574"/></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="VERSIONACT"  >
                                        <td class="titulocaja" id="tit_VERSIONACT">
                                            <b id="label_VERSIONACT"><axis:alt f="axisctr004" c="LIT_9907601" lit="9907601"/></b>
                                        </td>
                                    </axis:visible>
                                    </tr>
                                    <tr>          
                                    	<axis:visible f="axisctr004" c="TCODCONV"  >
                                        <td class="campocaja" id="td_TCODCONV">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="TCODCONV" name="TCODCONV" 
                                            title="<axis:alt f="axisctr004" c="LIT_9001146" lit="9001146"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr_opcionesDatosGestion.convempvers.TCODCONV}"
                                            <axis:atr f="axisctr004" c="TCODCONV" a="modificable=true&obligatorio=true"/>/>
                                        </td>
                                    </axis:visible>                                                        
                                    <axis:visible f="axisctr004" c="CACTIVIDAD">
                                        <td class="campocaja" id ="td_CACTIVIDAD">
                                            <input type="text" style="width:100%"  class="campowidth campo campotexto" id="CACTIVIDAD" name="CACTIVIDAD" 
                                            title="<axis:alt f="axisctr004" c="LIT_103481" lit="103481"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr_opcionesDatosGestion.convempvers.TDESCRI}"                                           
                                            <axis:atr f="axisctr004" c="CACTIVIDAD" a="modificable=true&obligatorio=true"/>/>                                                                                                                                                                                
                                        </td>                                                                                
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="BT_CONVENIOS" >
                                        <td class="campocaja" id ="td_BT_CONVENIOS">
                                            <a id="BT_CONVENIOS" href="javascript:f_abrir_axisctr503(${__formdata.SPRODUC})"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_9907572" lit="9907572"/>" title="<axis:alt f="axisctr004" c="LIT_9907572" lit="9907572"/>" src="images/find.gif"/></a>                                   
                                        </td>                                        
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="VERSION"  >
                                        <td class="campocaja" id="td_VERSION">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="VERSION" name="VERSION" 
                                            title="<axis:alt f="axisctr004" c="LIT_9001146" lit="9001146"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr_opcionesDatosGestion.convempvers.NVERSION}"
                                            <axis:atr f="axisctr004" c="VERSION" a="modificable=true&obligatorio=true"/>/>
                                        </td>
                                    </axis:visible>                                    
                                    <axis:visible f="axisctr004" c="VERSIONANT"  >
                                        <td class="campocaja" id="td_VERSIONANT">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="VERSIONANT" name="VERSIONANT" 
                                            title="<axis:alt f="axisctr004" c="LIT_9907574" lit="9907574"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr_opcionesDatosGestion.convempvers.NVERSION_ANT}"
                                            <axis:atr f="axisctr004" c="VERSIONANT" a="modificable=true&obligatorio=false"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="VERSIONACT"  >
                                        <td class="campocaja" id="td_VERSIONACT">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="VERSIONACT" name="VERSIONACT" 
                                            title="<axis:alt f="axisctr004" c="LIT_9907574" lit="9907574"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr_opcionesDatosGestion.convempvers.IDVERSION}"
                                            <axis:atr f="axisctr004" c="VERSIONACT" a="modificable=true&obligatorio=false"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    </tr>
                                </table>
                            <div class="separador">&nbsp;</div>
                      </td>
                   </tr>
                </table>
                </axis:ocultar>
		 <!--OTROS DATOS-->
                <axis:ocultar f="axisctr004" c="DSP_OTROS" >
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_1000310" lit="1000310" /></div>
                <!--campos-->
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:20%;height:0px"></th>
                                </tr>
                                <!-- Fila 3 -->
                                <tr>

                                    <axis:visible f="axisctr004" c="CTIPCOM">
                                        <td class="titulocaja">
                                            <b id="label_CTIPCOM"><axis:alt f="axisctr004" c="LIT_101509" lit="101509" /></b>
                                        </td>
                                    </axis:visible>
                               
                                    <axis:visible f="axisctr004" c="CIDIOMA" >
                                        <td class="titulocaja">
                                            <b id="label_CIDIOMA"><axis:alt f="axisctr004" c="LIT_1000246" lit="1000246" /></b>
                                        </td>
                                    </axis:visible>                                      
                                    <axis:visible f="axisctr004" c="POLISSA_INI" >
                                        <td class="titulocaja">
                                            <b id="label_POLISSA_INI"><axis:alt f="axisctr004" c="LIT_1000017" lit="1000017" /></b>
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>

                                    <axis:visible f="axisctr004" c="CTIPCOM">
                                        <td class="campocaja">
                                            <select name = "CTIPCOM" id ="CTIPCOM" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidth campo campotexto" style="width:90%" <axis:atr f="axisctr004" c="CTIPCOM" a="isInputText=false"/>>&nbsp; 
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.comision}" var="comision">
												
												
                                                     <%-- <c:if test="${__formdata.CACTIVI == 1}">
															
															<option value = "${comision.CATRIBU}" <c:if test="${comision.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOM}">selected</c:if>>${comision.TATRIBU}</option>
	
	             								    </c:if>
	             								    
	             								    <c:if test="${__formdata.CACTIVI != 1 && comision.CATRIBU != 92}">
	             								    
															<option value = "${comision.CATRIBU}" <c:if test="${comision.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOM}">selected</c:if>>${comision.TATRIBU}</option>
	
	             								    </c:if> --%>
	             								    
	             								    <option value = "${comision.CATRIBU}" <c:if test="${comision.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPCOM}">selected</c:if>>${comision.TATRIBU}</option>
													
                                                
												</c:forEach>
                                            </select><a id="icon_CTIPCOM" name="icon_CTIPCOM"  href="javascript:f_abrir_axisctr010()"><img border="0" alt="<axis:alt f="axisctr004" c="LIT_1000125" lit="1000125"/>" title="<axis:alt f="axisctr004" c="LIT_1000125" lit="1000125"/>" src="images/lapiz.gif"/></a>
                                        </td>
                                    </axis:visible>
                 
                                    <axis:visible f="axisctr004" c="CIDIOMA" >
                                         <td class="campocaja">
                                            <select name = "CIDIOMA" id ="CIDIOMA" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidth campo campotexto" <axis:atr f="axisctr004" c="CIDIOMA" a="isInputText=false"/>>&nbsp;
                                               <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.idiomas}" var="idioma">
                                                    <option value = "${idioma.CIDIOMA}" <c:if test="${idioma.CIDIOMA  == sessionScope.axisctr_datosGestion.CIDIOMA}">selected</c:if>> ${idioma.TIDIOMA} </option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="POLISSA_INI" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidthpercent campo campotexto" id="POLISSA_INI" name="POLISSA_INI" 
                                            title="<axis:alt f="axisctr004" c="LIT_1000017" lit="1000017"/>" size="15" value ="${sessionScope.axisctr_datosGestion.POLISSA_INI}"
                                            <axis:atr f="axisctr004" c="POLISSA_INI" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>                                    
                                </tr>
                                <tr>
                                    <!--- BUG:8613 -->
                                    <axis:visible f="axisctr004" c="CAGENTE" > 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr004" c="LIT_100584" lit="100584" /></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr004" c="LIT_105940" lit="105940" /></b>
                                    </td>
                                    </axis:visible>    
                                    <!--- BUG:8613 -->

                                    <axis:visible f="axisctr004" c="CSUBAGE" >
                                        <td class="titulocaja">
                                            <b id="label_CSUBAGE"><axis:alt f="axisctr004" c="LIT_103063" lit="103063" /></b>
                                        </td>
                                    </axis:visible>
                                    <td></td>
                                    <td></td>
                                </tr>
                                <tr>
                                    <!---BUG:8613 -->
                                    <!---BUG:26923/0146377 inicio-->
                                    <axis:visible f="axisctr004" c="CAGENTE" > 
                                     <td class="campocaja">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" value="${sessionScope.axisctr004_agente.CODI}" class="campowidthinput campo campotexto" style="width:70%"
                                        <axis:atr f="axisctr004" c="CAGENTE_TEXT" a="modificable=true"/> onchange="f_actualizar_agente(this.value)" />
                                        <img name= "icon_CAGENTE_TEXT" id= "icon_CAGENTE_TEXT" border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    </td>
                                     <td class="campocaja" colspan="2">    
                                        <input readonly="true" type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${sessionScope.axisctr004_agente.NOMBRE}" class="campowidthinput campo campotexto"/>
                                    </td>
                                    </axis:visible> 
                                    <!---BUG:26923/0146377 fin -->
                                    <!---BUG:8613 -->
                                    <axis:visible f="axisctr004" c="CSUBAGE" > 
                                         <td class="campocaja">
                                            <select name="CSUBAGE" id ="CSUBAGE" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidth campo campotexto" style="width:200%" <axis:atr f="axisctr004" c="CSUBAGE" a="modificable=false&&isInputText=false"/>>&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr004" c="LIT_1000348" lit="1000348"/> - </option> 
                                               <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.subagentes}" var="subagente">
                                                    <option value = "${subagente.CSUBAGE}" <c:if test="${subagente.CSUBAGE  == sessionScope.axisctr_datosGestion.CSUBAGE || fn:length(sessionScope.axisctr_opcionesDatosGestion.lstcompanias) == 1}">selected</c:if>> ${subagente.NOMBRE} </option>
                                                </c:forEach>
                                            </select>
                                        </td>                                            
                                    </axis:visible>
                      <!--********************bug etm ******21924*******************-->
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr004" c="PDTOCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOCOM"><axis:alt f="axisctr004" c="LIT_103100" lit="103100" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr004" c="PRECCOM" >
                                        <td class="titulocaja">
                                            <b id="label_PRECCOM"><axis:alt f="axisctr004" c="LIT_9903608" lit="9903608" /></b>
                                        </td>
                                    </axis:visible>
                                    <axis:visible f="axisctr004" c="PDTOTEC" >
                                        <td class="titulocaja">
                                            <b id="label_PDTOTEC"><axis:alt f="axisctr004" c="LIT_9903609" lit="9903609" /></b>
                                        </td>
                                    </axis:visible>                                      
                                    <axis:visible f="axisctr004" c="PRECARG" >
                                        <td class="titulocaja">
                                            <b id="label_PRECARG"><axis:alt f="axisctr004" c="LIT_9903610" lit="9903610" /></b>
                                        </td>
                                    </axis:visible>
                                 
                                    <axis:visible f="axisctr004" c="CRGGARDIF">
                                     <td class="campocaja">
                                      <b id="label_CRGGARDIF">
                                        <axis:alt f="axisctr004" c="LIT_9903611" lit="9903611" />
                                      </b>
                                      </td>
                                    </axis:visible>  
                                    
                                    
                                </tr>
                                <tr>

                                    <axis:visible f="axisctr004" c="PDTOCOM" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOCOM" name="PDTOCOM" onchange="guardar_mi_descuento_o_recargo(this)"
                                            title="<axis:alt f="axisctr004" c="LIT_103100" lit="103100"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.axisctr_datosGestion.DTOCOM}"/>"
                                            <axis:atr f="axisctr004" c="PDTOCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr004" c="PRECCOM" >
                                        <td class="campocaja">
                                                 <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PRECCOM" name="PRECCOM" onchange="guardar_mi_descuento_o_recargo(this)"
                                            title="<axis:alt f="axisctr004" c="LIT_9903608" lit="9903608"/>" size="15" value ="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${sessionScope.axisctr_datosGestion.PRECCOM}"/>"
                                            <axis:atr f="axisctr004" c="PRECCOM" a="modificable=true&formato=decimal"/>/>&nbsp;
                                       
                                       </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr004" c="PDTOTEC" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="PDTOTEC" name="PDTOTEC" onchange="guardar_mi_descuento_o_recargo(this)"
                                            title="<axis:alt f="axisctr004" c="LIT_9903609" lit="9903609"/>" size="15" value ="<fmt:formatNumber pattern="###,####0.0000" value="${sessionScope.axisctr_datosGestion.PDTOTEC}"/>"
                                            <axis:atr f="axisctr004" c="PDTOTEC" a="modificable=true&formato=decimal"/>/>&nbsp;
                                        </td>
                                    </axis:visible>
                                    
                                    <axis:visible f="axisctr004" c="PRECARG" >
                                        <td class="campocaja">
                                            <input type="text" style="width:85%"  class="campowidthpercent campo campotexto" id="PRECARG" name="PRECARG" onchange="guardar_mi_descuento_o_recargo(this)"
                                            title="<axis:alt f="axisctr004" c="LIT_9903610" lit="9903610"/>" size="15" value ="${sessionScope.axisctr_datosGestion.PRECARG}"
                                            <axis:atr f="axisctr004" c="PRECARG" a="modificable=true"/>/>&nbsp;
                                        </td>
                                    </axis:visible>    
                                        <axis:visible f="axisctr004" c="CRGGARDIF" >
                                        <td>
                                      <input  
                                        <c:if test="${sessionScope.axisctr_datosGestion.CRGGARDIF == '1'}">checked</c:if>   onchange=""   <axis:atr f="axisctr004" c="CRGGARDIF" a="modificable=true&isInputText=false"/> type="checkbox" id="CRGGARDIF" name="CRGGARDIF" value="${sessionScope.axisctr_datosGestion.CRGGARDIF}"/>
                                      </td>
                                    </axis:visible>
                                    
                                    
                                    
                                </tr>
                                <tr>
                              
                                <tr>
                                 <axis:visible f="axisctr004" c="CTIPRETR" >
                                        <td class="titulocaja">
                                            <b id="label_CTIPRETR"><axis:alt f="axisctr004" c="LIT_9903612" lit="9903613" /></b>
                                        </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr004" c="CINDREVFRAN" >
                                        <td class="titulocaja">
                                            <b id="label_CINDREVFRAN"><axis:alt f="axisctr004" c="LIT_9903613" lit="9903612" /></b>
                                        </td>
                                    </axis:visible>
                          
                                    
                                </tr>
                                <tr>

                                   
                                    <axis:visible f="axisctr004" c="CTIPRETR" >
                                         <td class="campocaja">
                                         <select name = "CTIPRETR" id ="CTIPRETR" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisctr004" c="CTIPRETR"  a="modificable=true&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.tipoRetribu}" var="tipoRetribu">
                                                    <option value = "${tipoRetribu.CATRIBU}"  <c:if test="${tipoRetribu.CATRIBU  == sessionScope.axisctr_datosGestion.CTIPRETR}">selected</c:if>>${tipoRetribu.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                         </td>
                                    </axis:visible>
                                     <axis:visible f="axisctr004" c="CINDREVFRAN" >
                                        <td class="campocaja">
                                      
                                            <select name = "CINDREVFRAN" id ="CINDREVFRAN" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidthselect campo campotexto" 
                                                <axis:atr f="axisctr004" c="CINDREVFRAN" a="modificable=true&isInputText=false"/>>&nbsp;
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.revalFran}" var="revalFran">
                                                    <option value = "${revalFran.CATRIBU}"  <c:if test="${revalFran.CATRIBU  == sessionScope.axisctr_datosGestion.CINDREVFRAN}">selected</c:if>>${revalFran.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                         </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <!--fin bug etm *********************-->
                                    
                                    <axis:visible f="axisctr004" c="CCOMPANIVNV" >
                                        <td class="titulocaja">
                                            <b id="label_CCOMPANI"><axis:alt f="axisctr004" c="LIT_9000600" lit="9000600" /></b>
                                        </td>
                                    </axis:visible>
                                </tr>
                                <tr>
                                    <axis:visible f="axisctr004" c="CCOMPANIVNV" >
                                        <td class="campocaja">
                                            <select name = "CCOMPANIVNV" id ="CCOMPANIVNV" size="1" onchange="" 
                                                class="campowidthselect campo campotexto" title="<axis:alt f="axisctr004" c="LIT_9000600" lit="9000600"/>"
                                                <axis:atr f="axisctr004" c="CCOMPANIVNV" a="obligatorio=true&modificable=true&isInputText=false"/>>&nbsp;
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr004" c="LIT_1000348" lit="1000348"/> - </option>
                                                <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.lstcompanias}" var="companies">
                                                    <option value = "${companies.CCOMPANI}"  <c:if test="${companies.CCOMPANI   == __formdata.CCOMPANIVNV ||  fn:length(sessionScope.axisctr_opcionesDatosGestion.lstcompanias) == 1}">selected</c:if>>${companies.TCOMPANI}</option>
                                                </c:forEach>
                                            </select>
                                         </td>
                                    </axis:visible>
                                </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
                </axis:ocultar>		
                <%-- BUG: 24685 2013-02-05 AEG se agrega seccion para preimpresos  --%>
                <axis:ocultar f="axisctr004" c="DSP_PREIMPRESO" dejarHueco="false">
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_9904927" lit="9904927" /></div>
                <table class="seccion">
                    <tr>
                        <td align="left">
                            <table class="area" align="center">
                                <tr>
                                    <th style="width:15%;height:0px"></th>
                                    <th style="width:17%;height:0px"></th>
                                    <th style="width:13%;height:0px"></th>
                                    <th style="width:13%;height:0px"></th>
                                    <th style="width:11%;height:0px"></th>
                                    <th style="width:12%;height:0px"></th>
                                    <th style="width:15%;height:0px"></th>
                                </tr>
                                <!-- Fila 1 -->
                                <tr>
                                    <axis:ocultar f="axisctr004" c="CTIPOASIGNUM" dejarHueco="false">
                                        <td class="titulocaja" id="tit_CTIPOASIGNUM">
                                            <b id="label_CTIPOASIGNUM"><axis:alt f="axisctr004" c="LIT_9904928" lit="9904928"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NPOLIZAMANUAL" dejarHueco="false" >
                                        <td class="titulocaja" id="tit_NPOLIZAMANUAL">
                                            <b id="label_NPOLIZAMANUAL"><axis:alt f="axisctr004" c="LIT_9904929" lit="9904929"/></b>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NPREIMPRESO" dejarHueco="false" >
                                        <td class="titulocaja" id="tit_NPREIMPRESO">
                                            <b id="label_NPREIMPRESO"><axis:alt f="axisctr004" c="LIT_9904930" lit="9904930" /></b>
                                        </td>
                                    </axis:ocultar>  
                                </tr>
                                <tr>

                                    <axis:ocultar f="axisctr004" c="CTIPOASIGNUM" dejarHueco="false">
                                        <td class="campocaja" id ="td_CTIPOASIGNUM">
                                            <select name = "CTIPOASIGNUM" id ="CTIPOASIGNUM" size="1" onchange="f_carga_dependencias()" 
                                                class="campowidth campo campotexto" style="width:90%" <axis:atr f="axisctr004" c="CTIPOASIGNUM" a="isInputText=false"/>>&nbsp; 
                                               <c:forEach items="${sessionScope.axisctr_opcionesDatosGestion.preimpreso}" var="preimpreso">
                                                    <option value = "${preimpreso.CATRIBU}" <c:if test="${sessionScope.axisctr_datosGestion.CTIPOASIGNUM == preimpreso.CATRIBU}"> selected </c:if> >${preimpreso.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </axis:ocultar>
                                    <axis:ocultar f="axisctr004" c="NPOLIZAMANUAL" dejarHueco="false" >
                                        <td class="campocaja" id="td_NPOLIZAMANUAL">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="NPOLIZAMANUAL" name="NPOLIZAMANUAL" 
                                            title="<axis:alt f="axisctr004" c="LIT_9904929" lit="9904929"/>" size="15"  maxlength="8" value ="${sessionScope.axisctr_datosGestion.NPOLIZAMANUAL}"
                                            <axis:atr f="axisctr004" c="NPOLIZAMANUAL" a="modificable=true&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>                                    
                                    <axis:ocultar f="axisctr004" c="NPREIMPRESO" dejarHueco="false">
                                        <td class="campocaja"  id="td_NPREIMPRESO">
                                            <input type="text" style="width:85%"  class="campowidth campo campotexto" id="NPREIMPRESO" name="NPREIMPRESO" 
                                            title="<axis:alt f="axisctr004" c="LIT_9904930" lit="9904930"/>" size="15" maxlength="8" value ="${sessionScope.axisctr_datosGestion.NPREIMPRESO}"
                                            <axis:atr f="axisctr004" c="NPREIMPRESO" a="modificable=true&formato=entero"/>/>&nbsp;
                                        </td>
                                    </axis:ocultar>                                    
                        </table>
                            <div class="separador">&nbsp;</div>
                      </td>
                   </tr>
                </table>
                </axis:ocultar>
                <%-- FIN BUG: 24685 2013-02-05 AEG se agrega seccion para preimpresos  --%>
                
                <!--campos-->
                
                <c:import url="axisctr004_body1.jsp">
                        <c:param name="multiPantalla" value="false"/>
                </c:import>
                
                <!-- ****************************************************** -->
                    
    <axis:visible f="axisctr004" c="DSP_PROMOTOR">  
        <tr>
            <td>
                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr004" c="LIT_151522" lit="151522" /></div>
                <table class="seccion" align="center">
                    <tr>
                    <th style="width:75%;height:0px"></th>
                    <th style="width:25%;height:0px"></th>
                </tr>
                <tr>
                       <td>
                           <table class="area" align="center">
                           	<tr>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:12%;height:0px"></th>
                                <th style="width:4%;height:0px"></th>
                               </tr>
                               <tr>
                                <td class="titulocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="NNUMIDEPRO">
                                        <b><axis:alt f="axisctr004" c="NNUMIDEPRO" lit="102999" /></b>
                                       </axis:visible>
                                   </td>            
                               </tr>
                            <tr>
                                <td class="campocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="NNUMIDEPRO">
                                        <input   type="text" class="campowidthinput campo campotexto" onchange="f_existe_persona(this.value)" id="NNUMIDEPRO" name="NNUMIDEPRO" size="15"  value="${__formdata.NNUMIDEPRO}" />
           </axis:visible>    
                                   </td>
                                   <td class="campocaja">
                                    <img border="0" id="BUSCAR_PERSONA" name="BUSCAR_PERSONA" src="images/find.gif" title="<axis:alt f="axisctr004" c="BUSCAR_PERSONA" lit="1000065"/>" alt="<axis:alt f="axisctr004" c="BUSCAR_PERSONA" lit="1000065"/>" onclick="f_abrir_axisper021()" style="cursor:pointer"/>
                                       &nbsp;&nbsp;<img border="0" name="REINICIAR_PERSONA" id="REINICIAR_PERSONA" src="images/update.gif" title="<axis:alt f="axisctr004" c="REINICIAR_PERSONA" lit="9901042"/>" alt="<axis:alt f="axisctr004" c="REINICIAR_PERSONA" lit="9901042"/>" onclick="f_actualizar_campos(1)" style="cursor:pointer"/>
                                   </td>            
                               </tr>
                            <tr>
                                <td class="titulocaja" colspan="2"> 
                                    <axis:visible f="axisctr004" c="TNOMBREPRO">
                                        <b><axis:alt f="axisctr004" c="TNOMBREPRO" lit="105940" /></b> 
                                    </axis:visible>
                       </td>
                                <td class="titulocaja" colspan="2"> 
                                    <axis:visible f="axisctr004" c="TNOMBREPRO2">
                                        <b><axis:alt f="axisctr004" c="TNOMBREPRO2" lit="9902260" /></b>
                                    </axis:visible>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="TAPELLI1PRO">
                                        <b><axis:alt f="axisctr004" c="TAPELLI1PRO" lit="108243" /></b> 
                                    </axis:visible>
                                </td>
                                <td class="titulocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="TAPELLI2PRO"> 
                                        <b><axis:alt f="axisctr004" c="TAPELLI2PRO" lit="108246" /></b>
                                    </axis:visible>
                                </td>
                                </tr>
                            <tr>
                                <td class="campocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="TNOMBREPRO">
                                        <input   type="text" class="campowidthinput campo campotexto" id="TNOMBREPRO" name="TNOMBREPRO" size="15"  value="${__formdata.TNOMBREPRO}" <axis:atr f="axisctr004" c="TNOMBREPRO" a="modificable=false"/>/>
                                    </axis:visible>
                            </td>
                                <td class="campocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="TNOMBREPRO2">
                                        <input   type="text" class="campowidthinput campo campotexto" id="TNOMBREPRO2" name="TNOMBREPRO2" size="15"  value="${__formdata.TNOMBREPRO2}" <axis:atr f="axisctr004" c="TNOMBREPRO2" a="modificable=false"/>/>
                                    </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="TAPELLI1PRO">
                                        <input   type="text" class="campowidthinput campo campotexto" id="TAPELLI1PRO" name="TAPELLI1PRO" size="15"  value="${__formdata.TAPELLI1PRO}" <axis:atr f="axisctr004" c="TAPELLI1PRO" a="modificable=false"/>/>
                                        </axis:visible>
                                </td>
                                <td class="campocaja" colspan="2">
                                    <axis:visible f="axisctr004" c="TAPELLI2PRO">
                                        <input   type="text" class="campowidthinput campo campotexto" id="TAPELLI2PRO" name="TAPELLI2PRO" size="15"  value="${__formdata.TAPELLI2PRO}" <axis:atr f="axisctr004" c="TAPELLI2PRO" a="modificable=false"/>/>
                                    </axis:visible>
                                </td> 
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</axis:visible>

               <c:if test="${!empty sessionScope.axisctr_preguntasPoliza ||
                                !empty sessionScope.axisctr_pregDespeses ||
                                !empty sessionScope.axisctr_pregQuestSalut ||
                                !empty __formdata.CACTIVI}">
                   </table>
               </c:if>      
               
            </td>
        </tr>
    </table>
    <c:if test="${param.multiPantalla != 'true'}">
        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr004</c:param>
            <c:param name="__botones">cancelar<axis:visible f="axisctr004" c="BT_RIESGOS_HOST">,9000554</axis:visible><axis:visible f="axisctr004" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr004" c="BT_SEG">,siguiente</axis:visible></c:param>
        </c:import>
        </form>
    </c:if>

<script type="text/javascript">
    Calendar.setup({
        inputField     :    "FEFECTO",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FEFECTO", 
        singleClick    :    true,
        firstDay       :    1
    });
    
<axis:visible f="axisctr004" c="FPPREN" >
    Calendar.setup({
        inputField     :    "FPPREN",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FPPREN", 
        singleClick    :    true,
        firstDay       :    1
    });    
</axis:visible>

<axis:visible f="axisctr004" c="FVENCIM" >
    Calendar.setup({
        inputField     :    "FVENCIM",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FVENCIM",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

<axis:visible f="axisctr004" c="FRENOVA" >
    Calendar.setup({
        inputField     :    "FRENOVA",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FRENOVA",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>


<axis:visible f="axisctr004" c="CFECMAN" >
    Calendar.setup({
        inputField     :    "CFECMAN",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_CFECMAN",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>


<axis:visible f="axisctr004" c="FFINVIG" >
    Calendar.setup({
        inputField     :    "FFINVIG",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FFINVIG",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

// BUG 41143/229973 - 17/03/2016 - JAEG
<axis:visible f="axisctr004" c="FEFEPLAZO" >
    Calendar.setup({
        inputField     :    "FEFEPLAZO",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FEFEPLAZO",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>
// BUG 41143/229973 - 17/03/2016 - JAEG

<axis:visible f="axisctr004" c="FVENCPLAZO" >
    Calendar.setup({
        inputField     :    "FVENCPLAZO",    
        ifFormat       :    "%d/%m/%Y",     
        button         :    "icon_FVENCPLAZO",  
        singleClick    :    true,
        firstDay       :    1
    });
</axis:visible>

//ecg controlar campos vacios e interpretarlos NULLs como 0's http://mantis.srvcsi.com/view.php?id=21907#c121271
function guardar_mi_descuento_o_recargo(ths) {
    var PXXXXXX = ths.value;
    if (objUtiles.estaVacio(PXXXXXX)) {
        PXXXXXX="0"; ths.value="0";
    }
}

</script>
