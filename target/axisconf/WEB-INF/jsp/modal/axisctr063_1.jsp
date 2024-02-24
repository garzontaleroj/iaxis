<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisctr063_1.jsp
  @author <a href = "mailto:jsanchez@csi-ti.com">Jordi Sanchez</a>

  Fecha: 20/12/2007
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
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

        <script type="text/javascript">
            
            function f_onload(){
               //f_carga_dependencias();  

                var OK = "${__formdata.OK}";
                
                if ( !objUtiles.estaVacio(OK)){
                  //  parent.f_cerrar_axisctr063_1();
                   /* var cadena = objDom.getValorPorId("SSEGURO")+"#"+objDom.getValorPorId("NLINEA");
                    parent.f_aceptar_axisctr056(cadena);  */
                    //var cadena = objDom.getValorPorId("SSEGURO")+"#"+objDom.getValorPorId("NLINEA");
                    
                   // alert("nmovimi: "+$("#NMOVIMI").val()+" - cmotmov: "+ $("#CMOTMOV").val()+" - tobser;"+ $("#TOBSERV").val()+" - texto: "+$("#TTEXTOS").val()+" - TTITULO: "+$("#TTITULO").val());
                    
                    parent.f_aceptar_axisctr063_1($("#NMOVIMI").val(),$("#CMOTMOV").val(),$("#TOBSERV").val());
 
                   // parent.f_aceptar_axisctr063_1(cadena);
                }
                    revisarEstilos();
                                      
            }
            
            ///////////////////////////////////////////////////
       
            
            function f_but_aceptar () {

                objUtiles.ejecutarFormulario("modal_axisctr063_1.do?NPOLI="+document.miForm.NPOLIZA.value, "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);
                
            }

            function f_but_cancelar() {
            	objUtiles.cerrarModal("axisctr063_1");   
                        
            }
                         
           
        </script>
    </head>
    <%--<body onload="f_onload()" >--%>
    <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>


    <form name="miForm" action="axis_axisctr063_1.do" method="POST">
          <input type="hidden" name="operation" value=""/>
          <input type="hidden" id="checked_mot" name="checked_mot"/>
          <input type="hidden" id="PMODO" name="PMODO" value="${__formdata.PMODO}"/>
          <input type="hidden" id="NLINEA" name="NLINEA" value="${__formdata.NLINEA}"/>
          <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>            
          <input type="hidden" id="NPOLIZA" name="NPOLIZA" value="${__formdata.NPOLIZA}"/>
          <input type="hidden" id="CUSUALT" name="CUSUALT" value="${__formdata.CUSUALT}"/>
          
                    
          <input type="hidden" id="CMOTMOV" name="CMOTMOV" value="${__formdata.CMOTMOV}"/>
          <input type="hidden" id="TOBSERV" name="TOBSERV" value="${__formdata.TOBSERV}"/>
          

            <c:import url="../include/titulo_nt.jsp"> 
                <c:param name="modalidad"> </c:param> 
                <c:param name="titulo"> </c:param>
                <c:param name="formulario"><c:choose><c:when test="${__formdata.PMODO == 0}"><fmt:message key="9001219" /></c:when><c:when test="${__formdata.PMODO == 1}"><fmt:message key="9001221" /></c:when></c:choose></c:param>
                <c:param name="producto"></c:param>
                <c:param name="form">axisctr063_1</c:param>
            </c:import>
            
    <!-- Area de campos  -->
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <!-- Antes area de campos -->
                <div class="titulo" ><img src="images/flecha.gif"/>
                <c:if test="${__formdata.PMODO == 0}"><fmt:message key="9001219" /></c:if>
                <c:if test="${__formdata.PMODO == 1}"><fmt:message key="9001221" />
                    <c:if test="${!empty __formdata.NPOLIZA}"><fmt:message key="100624" />&nbsp;:&nbsp;${__formdata.NPOLIZA}</c:if>
                    <c:if test="${!empty __formdata.NMOVIMI}">-${__formdata.NMOVIMI}</c:if>
                    <c:if test="${!empty __formdata.NLINEA}">&nbsp;-&nbsp;<fmt:message key="9001189" />&nbsp;:&nbsp;${__formdata.NLINEA}</c:if>
                    <c:if test="${!empty __formdata.FALTA}">&nbsp;-&nbsp;<fmt:message key="9001192" />&nbsp;:&nbsp; <fmt:formatDate value="${__formdata.FALTA}" pattern="dd/MM/yyyy" /></c:if>
                    <c:if test="${!empty __formdata.CUSUALT}">&nbsp;-&nbsp;<fmt:message key="9001630" />&nbsp;:&nbsp;${__formdata.CUSUALT}</c:if>
                </c:if>
                </div>
            </td>
        </tr>
        <tr>
            <td>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>                        

                    <axis:ocultar f="axisctr063_1" c="NPOLIZA" dejarHueco="false">
                    <tr>
                        <!-- Titulo N.Poliza -->
                        <td class="titulocaja">
                            <b><fmt:message key="100624"/></b>
                         </td>
                        <%-- Bug 11177 NMM.i. --%>
                        <!-- Titulo N. Movimiento -->
                        <td class="titulocaja">
                            <b><fmt:message key="89906256"/></b>
                         </td>
                         <%-- Bug 11177 NMM.f. --%>
                    </tr>
                    <tr>
                        <!-- N.Poliza -->
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto" size="30" value="${__formdata.NPOLIZA}" name="NPOL" id="NPOL" 
                            style="width:55%;" 
                            title="<fmt:message key="100624"/>" <axis:atr f="axisctr063_1" c="NPOLIZA" a="formato=entero&modificable=false"/>/>
                        </td>
                        <%-- Bug 11177 NMM.i. <td class="campocaja">${__formdata} --%>
                        <!-- N.Certificat -->
                        <td class="campocaja">
                            <input type="text" class="campowidthinput campo campotexto"  size="30" value="${__formdata.NMOVIMI}" name="NMOVIMI" id="NMOVIMI" 
                            style="width:55%;"
                            title="<fmt:message key="101300"/>" <axis:atr f="axisctr063_1" c="NMOVIMI" a="formato=entero&modificable=false"/>/>
                        </td> 
                        <%-- Bug 11177 NMM.f. --%>

                    </tr>
                    </axis:ocultar>



                    
                     <axis:ocultar f="axisctr063_1" c="TTITULO" dejarHueco="false">
                    <tr>
                        <!-- Titulo Título Apunte -->
                        <td class="titulocaja">
                            <b><fmt:message key="9001196"/></b>
                        </td>
                    </tr>
                    <tr>
                        <!-- Título Apunte -->                                      
                        <td class="campocaja" colspan="2">
                            
                            <input type="text" class="campowidthinput campo campotexto" size="30" value="${__formdata.TTITULO}" name="TTITULO" id="TTITULO" style="width:100%;" maxlength="100" title="<fmt:message key="9001196"/>"
                             <axis:atr f="axisctr063_1" c="TTITULO" a="modificable=true&obligatorio=true"/> 
                        </td> 
                    </tr>
                    </axis:ocultar>
                    <axis:ocultar f="axisctr063_1" c="TTEXTOS" dejarHueco="false">
                    <tr>
                        <!-- Titulo Texto Apunte -->
                        <td class="titulocaja">
                            <b><fmt:message key="9001197"/></b>
                        </td>
                    </tr>
                    <tr>
                        <!-- Texto Apunte -->
                       <td colspan="3" style="width:100%;" <axis:atr f="axisctr063_1" c="TTEXTOS" a="modificable=true&obligatorio=true"/>  class="campocaja">                         
                          <textarea  maxlength="4000"  rows="10" cols="50" class="campo campotexto" style="width:100%;" name="TTEXTOS" id="TTEXTOS" <axis:atr f="axisctr063_1" c="TTEXTOS" a="modificable=true&obligatorio=true"/>>${__formdata.TTEXTOS}</textarea>
                       </td>
                    </tr>
                    </axis:ocultar>            
                 </table>
                <table class="area" align="center">
                   <tr>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                     <th style="width:25%;height:0%;"/>
                   </tr>                      

                   <tr>                        
                         
                      <!-- Titulo Concepto Apunte -->
                      <axis:ocultar f="axisctr063_1" c="TTIPREG" dejarHueco="false">
                      <td class="titulocaja">
                         <b><fmt:message key="9001190"/></b>
                      </td>
                      </axis:ocultar>
                   </tr>
                   <tr>                       
                      <!-- Concepto Apunte -->                      
                         <axis:ocultar f="axisctr063_1" c="TTIPREG" dejarHueco="false">
                         <td class="campocaja">
                            <select name = "CTIPREG" id="CTIPREG" style="width:75%;" <axis:atr f="axisctr063_1" c="TTIPREG" a="modificable=false&obligatorio=true"/> 
                            size="1" onchange="" class="campowidthselect campo campotexto" disabled>
                               <option value = "<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                               <c:forEach var="ttipreg" items="${lstconceptosapunteagenda}">
                                  <option value = "${ttipreg.CATRIBU}"
                                     <c:if test="${ttipreg.CATRIBU == 5}">selected</c:if>>
                                     ${ttipreg.TATRIBU}
                                  </option>
                               </c:forEach>
                            </select>
                         </td>
                         </axis:ocultar>
                   </tr>

                    <c:if test="${__formdata.PMODO == 0}">                    
                       <tr>
                          <!-- Titulo Fecha Alta -->
                          <axis:ocultar f="axisctr063_1" c="FALTA" dejarHueco="false">
                          <td class="titulocaja">
                             <b><fmt:message key="9001192"/></b>
                          </td>
                          </axis:ocultar>
                       </tr>                       
                       <tr>
                          <!-- Fecha Alta -->
                          <axis:ocultar f="axisctr063_1" c="FALTA" dejarHueco="false">
                          <td class="campocaja">
                             <input type="text" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>" name="FALTA" id="FALTA" 
                             style="width:45%;" <axis:atr f="axisctr063_1" c="FALTA" a="modificable=true&obligatorio=true"/> />
                             <a style="vertical-align:middle;"><img
                                id="icon_FALTA" border=0 alt="<fmt:message key="9001192"/>" title="<fmt:message key="9001192" />" src="images/calendar.gif"/></a>
                          </td> 
                          </axis:ocultar>
                       </tr>                    
                    </c:if>
                    
                    <c:if test="${__formdata.PMODO == 1}">  
                     <input type="hidden" class="campowidthinput campo campotexto" size="15" value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>" name="FALTA" id="FALTA" 
                             style="width:45%;" <axis:atr f="axisctr063_1" c="FALTA" a="modificable=true&obligatorio=true"/> />
                       <tr>
                          <!-- Titulo Fecha Finalizacion -->
                          <axis:ocultar f="axisctr063_1" c="FFINALI" dejarHueco="false">
                          <td class="titulocaja">
                             <b><fmt:message key="9001198"/></b>
                          </td>
                          </axis:ocultar>
                       </tr>
                       <tr>
                          <!-- Fecha Finalizacion -->
                          <axis:ocultar f="axisctr063_1" c="FFINALI" dejarHueco="false">
                          <td class="campocaja">
                             <input type="text" class="campowidthinput campo campotexto" size="15" style="width:45%;" 
                             value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFINALI}" />" name="FFINALI" id="FFINALI" 
                             <axis:atr f="axisctr063_1" c="FFINALI" a="modificable=true"/> />
                             <a style="vertical-align:middle;"><img
                                id="icon_FFINALI" border=0 alt="<fmt:message key="9001198"/>" title="<fmt:message key="9001198" />" src="images/calendar.gif"/></a>
                          </td> 
                          </axis:ocultar>
                       </tr>
                    </c:if>                    
                    
                </table>
            </td>
        </tr>
    </table>  <!-- Table area campos --> <!-- Ahora incluye a los dos forms -->

    <c:import url="../include/botonera_nt.jsp">
        <c:param name="__botones">
        cancelar,aceptar
        </c:param>
    </c:import>

    </form>
    
    <c:import url="../include/mensajes.jsp" />

    <axis:visible f="axisctr063_1" c="FALTA">
    <script type="text/javascript">
        Calendar.setup({
            inputField     :    "FALTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FALTA", 
            singleClick    :    true,
            firstDay       :    1
        });
     </script>
     </axis:visible>
     <axis:visible f="axisctr063_1" c="FFINALI">
        <script type="text/javascript">
           Calendar.setup({
               inputField     :    "FFINALI",     
               ifFormat       :    "%d/%m/%Y",      
               button         :    "icon_FFINALI", 
               singleClick    :    true,
              firstDay       :    1
        });
        </script>
     </axis:visible>
    </body>
</html>
