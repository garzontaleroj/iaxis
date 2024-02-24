<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        function f_onload() {
        	f_cargar_propiedades_pantalla();
            var guardat = "${__formdata.guardat}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
               parent.f_aceptar_modal("axisprf004");
            }
            var tipper = "${__formdata.CTIPPER}";
            if ($("#CTIPPER").val()<"0" && objUtiles.estaVacio(tipper)){ 
                $("#CTIPPER").val("1");
            }
        }    
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axisprf004');                      
        }       
        
        function f_onchange_TIDENTI(TIDENTI) {
            formdataTIDENTI = '${__formdata.CTIPPER}';    <!-- ** LCF ** __formdata.TIDENTI -->
            if (TIDENTI != "<%= Integer.MIN_VALUE %>" && TIDENTI != formdataTIDENTI && (formdataTIDENTI == 2 || TIDENTI == 2)) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisprf004.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_aceptar(){          
          //parent.f_cerrar_modal('axisprf004');
          if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axisprf004.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando); 
          }
         // window.location.reload();
        }
        
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisprf004" c="TITULO" lit="9904719" /></c:param>
                <c:param name="nid" value="axisprf004" />
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="pCodiProf" name="pCodiProf" value="${param.pCodiProf}"/>
        <input type="hidden" id="NORDCTO" name="NORDCTO" value="${__formdata.NORDCTO}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario">
			<axis:alt c="formulario" f="axisprf004" lit="9904719" />
		   </c:param>
           <c:param name="producto">
			<axis:alt c="producto" f="axisprf004" lit="9904719" />
		   </c:param>
           <c:param name="form">axisprf004</c:param>
        </c:import>             
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
            <tr>
                <th style="width:34%;height:0px"></th>
                <th style="width:33%;height:0px"></th>
                <th style="width:33%;height:0px"></th>                                
            </tr>        
            <tr>
                <td class="titulocaja">
                    <b><axis:alt f="axisper022" c="CTIPPER" lit="102844"/></b>
                </td>
                <axis:ocultar f="axisprf004" c="CTIPIDE" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf004" c="CTIPIDE" lit="109774"/></b>
                    </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf004" c="CNUMIDE" dejarHueco="false">                 
                    <td class="titulocaja">
                        <b><axis:alt f="axisprf004" c="CNUMIDE" lit="100577"/></b>
                    </td> 
                </axis:ocultar>
            </tr> 
            <tr>
              <td class="campocaja"><!-- ** LCF ** __formdata.TIDENTI NOMBRE CAMPO -->
                  <select name="CTIPPER" id="CTIPPER" size="1" class="campowidthselect campo campotexto_ob" style="width:90%;"
                          onchange="f_onchange_TIDENTI(this.value)" title= "<axis:alt f="axisprf004" c="CTIPPER" lit="102844"/>">&nbsp;
                          <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisprf004" c="SNV_COMBO" lit="1000348"/> - </option>
                          <c:forEach var="element" items="${__formdata.tipPerson}">
                          <option value = "${element.CATRIBU}" 
                          <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> /> <!-- ** LCF ** __formdata.TIDENTI -->
                          ${element.TATRIBU} 
                          </option>
                          </c:forEach>
                  </select>
              </td>
              <axis:ocultar f="axisprf004" c="CTIPIDE" dejarHueco="false"> 
                <td class="campocaja">
                <select name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto_op"
                        <axis:atr f="axisprf004" c="CTIPIDE" a="obligatorio=true&isInputText=false"/>>
                    <option value="<%= Integer.MIN_VALUE %>">
                      <axis:alt f="axisprf004" c="SELECCIONAR" lit="108341"/>                                
                    </option>
                    <c:forEach var="tipo_doc" items="${__formdata.tipDocum}">
                        <option value="${tipo_doc.CATRIBU}"
                                <c:if test="${__formdata['CTIPIDE'] == tipo_doc.CATRIBU}">selected</c:if>>
                            ${tipo_doc.TATRIBU}
                        </option>
                    </c:forEach>
                </select>
                </td>
              </axis:ocultar> 
              <axis:ocultar f="axisprf004" c="CNUMIDE">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CNUMIDE}" name="CNUMIDE"
                           id="CNUMIDE" style="width:40%;" 
                           />
                </td>
                </axis:ocultar>
            </tr>
            <tr>
             <axis:ocultar f="axisprf004" c="TNOMBRE" dejarHueco="false">                 
                    <td class="titulocaja">
                        <b><axis:alt f="axisprf004" c="TNOMBRE" lit="105940"/></b>
                    </td> 
            </axis:ocultar>
             <axis:ocultar f="axisprf004" c="TDIREC" dejarHueco="false"> 
                    <td class="titulocaja">
                       <b><axis:alt f="axisprf004" c="TDIREC" lit="105889"/></b>
                    </td>
            </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf004" c="TNOMBRE">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE"
                           id="TNOMBRE" style="width:40%;" title= "<axis:alt f="axisprf004" c="TNOMBRE" lit="105940"/>"
                           <axis:atr f="axisprf004" c="TNOMBRE" a="obligatorio=true&isInputText=true"/>/>
                </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf004" c="TDIREC">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TDIREC}" name="TDIREC"
                           id="TDIREC" style="width:100%;" 
                           />
                </td>
                </axis:ocultar>
            </tr>
            <tr>
               <axis:ocultar f="axisprf004" c="TMOVIL" dejarHueco="false">                 
               <td class="titulocaja">
                   <b><axis:alt f="axisprf004" c="TMOVIL" lit="1000379"/></b>
               </td> 
            </axis:ocultar>
            <axis:ocultar f="axisprf004" c="TEMAIL" dejarHueco="false">                 
               <td class="titulocaja">
                   <b><axis:alt f="axisprf004" c="TEMAIL" lit="109792"/></b>
               </td> 
            </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf004" c="TMOVIL">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TMOVIL}" name="TMOVIL"
                           id="TMOVIL" style="width:40%;" 
                           />
                </td>
                </axis:ocultar>
                <axis:ocultar f="axisprf004" c="TEMAIL">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TEMAIL}" name="TEMAIL"
                           id="TEMAIL" style="width:40%;" 
                           />
                </td>
                </axis:ocultar>
            </tr>
            <tr>
                <axis:ocultar f="axisprf004" c="TCARGO" dejarHueco="false">                 
                <td class="titulocaja">
                   <b><axis:alt f="axisprf004" c="TCARGO" lit="9902638"/></b>
                </td> 
                </axis:ocultar>
            </tr>
            <tr>
             <axis:ocultar f="axisprf004" c="TCARGO">
                <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCARGO}" name="TCARGO"
                           id="TCARGO" style="width:40%;" 
                           />
                </td>
                </axis:ocultar>
            </tr>
            
        </table>	
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisprf004</c:param><c:param name="f">axisprf004</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>
