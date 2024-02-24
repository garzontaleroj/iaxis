<%/*
*  Fichero: axisctr010.jsp
*
*  Fecha: 21/11/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="axis.mvc.control.AbstractDispatchAction"%>
<%@ page import="axis.service.axis.AxisBaseService"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css"> </style>
    <%-- FI Especial per controlar els scroll amb iPad --%>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
        
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_onload() {
           <c:if test="${ (fn:containsIgnoreCase(header['User-Agent'],'ipad') )   }">
						retocarPAGE_CSS('axisctr010');
					</c:if>
            // Retocar tabla en IE
                if (document.all) // ES Explorer
                    document.getElementById("tabla1").style.marginLeft="1.3%";
            var hayguardat   = ${!empty __formdata.guardat};  
            if (hayguardat){
                if ('0' == '${__formdata.guardat}') {
                    parent.f_aceptar_axisctr010();
                }
            }
            
            <c:if test="${__formdata.CMODO=='CONSULTA'}">
                         //   objDom.setDisabledPorId("but_guardar", true);
            </c:if>
            document.miForm.CTIPCOM.disabled = 'true'; 
            if(${__formdata.CTIPCOM != null} && ${empty __formdata.SSEGURO}){              
            
             if(document.getElementById('comisionesStr')){
                 var comisionesStr=document.getElementById('comisionesStr').value;
                 var comis = comisionesStr.split('/');
                 var tbComi = document.getElementById("miListaId");
                 var idx = tbComi.rows.length;
                 var result = '';
                 for (var i=1; i< idx; i++){
                    for(var j=0;j < comis.length-1 ;j++){
                      var comi = comis[j].split("#");
                      if(i==comi[0]){
                        document.getElementById("PCOMISI_"+i+"__").value = comi[1];
                        document.getElementById("PCOMISI"+i+"_NINIALT").value =comi[2];
                        document.getElementById("PCOMISI"+i+"_NFINALT").value =comi[3];              
                      }
                    }
                 }
             } 
                 
            }
          f_cargar_propiedades_pantalla();
        }
        
        
        function f_cargar()
        {         
             var CTIPCOM =  objDom.getValorPorId("CTIPCOM");              
             objUtiles.ejecutarFormulario("modal_axisctr010.do", "form", document.miForm, "_self");
             f_cargar_propiedades_pantalla();         
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_axisctr010();
        }
        
        function f_but_guardar() {
           // Llamada para guardar los valores de la pantalla
           if (objValidador.validaEntrada()){
              var x=document.getElementById("miListaId");
              var inputs = x.getElementsByTagName("input");                                 
              var error = 0;             
              for (var i=0; i < inputs.length; i++){  
                 var valor = parseFloat(objNumero.quitarSeparadorMiles(inputs[i].value));                                                                                
                 if(valor < parseFloat("0") || valor > parseFloat("100")) {
                    //Si es el primer error sacamos el mensaje y ponemos el foco
                    if(error == 0){ 
                       alert('<axis:alt f="axis010" c="TPORCEN" lit="9901044"/>');
                       inputs[i].focus();
                       error = 1;
                    }
                    inputs[i].value="";                                                       
                 }                
              }
              if (error ==0) {
                    objUtiles.ejecutarFormulario("modal_axisctr010.do", "guardar", document.miForm, "_self");
              }
           }   
        }        
        
        function f_but_aceptar() {
            // Llamada para guardar los valores de la pantalla
            if (objValidador.validaEntrada()){
             var x=document.getElementById("miListaId");
              var inputs = x.getElementsByTagName("input");                                 
              var error = 0;             
              for (var i=0; i < inputs.length; i++){  
                 var valor = parseFloat(objNumero.quitarSeparadorMiles(inputs[i].value));                                                                                
                 if(valor < parseFloat("0") || valor > parseFloat("100")) {
                    //Si es el primer error sacamos el mensaje y ponemos el foco
                    if(error == 0){ 
                       alert('<axis:alt f="axis010" c="TPORCEN" lit="9901044"/>');
                       inputs[i].focus();
                       error = 1;
                    }
                    inputs[i].value="";                                                       
                 }                
              }
              if (error ==0) {
             objUtiles.ejecutarFormulario("modal_axisctr010.do", "guardarCambios", document.miForm, "_self");
            }  
            }
        }
        function f_but_100009(){
           
             var tbComi = document.getElementById("miListaId");
             
             var idx = tbComi.rows.length;
             var result = '';
             for (var i=1; i< idx; i++){
                if(document.getElementById("PCOMISI_"+i+"__").value!=''){
                
                 result = result +  i +"#";
                 result = result + document.getElementById("PCOMISI_"+i+"__").value + "#";
                 result = result + document.getElementById("PCOMISI"+i+"_NINIALT").value + "#";
                 result = result + document.getElementById("PCOMISI"+i+"_NFINALT").value + "/";
                }
             }
             document.getElementById('comisionesStr').value = result;
             
        parent.aceptarModal_axisctr010(result);
        }
        
       
       
    </script>
  </head>
    <body class=" " onload="f_onload()">
    	<div id="wrapper" class="wrapper">
        
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="pSSEGURO" name="pSSEGURO" value="${__formdata.pSSEGURO}"/>
            <input type="hidden" name="operation" value=""/>
             <input type="hidden" id="comisionesStr"  name="comisionesStr" value="${__formdata.comisionesStr}"/>
                <c:import url="../include/precargador_ajax.jsp">
                    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
                </c:import>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr010" c="TITULOPANTA" lit="1000184"/></c:param>
                <c:param name="producto"><axis:alt f="axisctr010" c="TITULOPANTA" lit="1000184"/></c:param>
                <c:param name="form">axisctr010</c:param>
            </c:import>
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <axis:ocultar f="axisctr010" c="CTIPCOM" dejarHueco="false">
                <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axisctr010" c="label_CTIPCOM" lit="101509"/></b>
                    </td>
                </tr>
                <tr>
                    <td class="campocaja">
                        <select name = "CTIPCOM" id ="CTIPCOM" size="1"  <c:if test="${__formdata.CMODO=='CONSULTA'}">disabled</c:if> onchange="f_cargar();" <axis:atr f="axisctr010" c="CTIPCOM"  a="obligatorio=true&isInputText=false"/> 
                            class="campowidth campo campotexto" style="width:25%" >&nbsp; 
                            <c:forEach items="${__formdata.axisctr010_lscomisi}" var="comision">
                                <option value = "${comision.CATRIBU}" <c:if test="${comision.CATRIBU  == __formdata.axisctr_datGestion.CTIPCOM || comision.CATRIBU == __formdata.CTIPCOM}">selected</c:if>>${comision.TATRIBU}</option>
                            </c:forEach>
                    </td>
                </tr>
                </axis:ocultar>
                <tr>
                
                    <td>
                        <table class="seccion">
                            <tr>
                                <td>
                                    <!-- DisplayTag Comisiones -->
                                    <c:set var="title0"><axis:alt f="axisctr010" c="TATRIBU" lit="1000372"/></c:set>
                                    <c:set var="title1"><axis:alt f="axisctr010" c="PCOMISI" lit="101509"/></c:set>
                                    <c:set var="title2"><axis:alt f="axisctr010" c="NINIALT" lit="9902491"/></c:set>
                                    <c:set var="title3"><axis:alt f="axisctr010" c="NFINALT" lit="9902492"/></c:set>
                                    <div class="displayspace">
                                       <display:table name="${__formdata.gestionComisiones}" id="miListaId" export="false" class="dsptgtable" pagesize="-1" sort="list" cellpadding="0" cellspacing="0" 
                                        requestURI="modal_axisctr010.do?paginar=true">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="${title0}" headerClass="sortable" sortable="false" sortProperty="CATRIBU"  media="html" autolink="false" style="width:30%">
                                                <div class="dspText">${miListaId.OB_IAX_GSTCOMISION.TATRIBU}</div>
                                            </display:column>
                                            <axis:visible f="axisctr010" c="PCOMISI"> 
                                            
                                                <display:column title="${title1}" headerClass="sortable" style="width:30%" media="html" autolink="false" >
                                                    <div class="dspNumber" id="MULT_PCOMISI"><input id="PCOMISI_${miListaId.OB_IAX_GSTCOMISION.CMODCOM}_${miListaId.OB_IAX_GSTCOMISION.NINIALT}_${miListaId.OB_IAX_GSTCOMISION.NFINALT}" 
                                                    name="PCOMISI${miListaId.OB_IAX_GSTCOMISION.CMODCOM}_${miListaId.OB_IAX_GSTCOMISION.NINIALT}_${miListaId.OB_IAX_GSTCOMISION.NFINALT}" 
                                                    value="<fmt:formatNumber pattern='###,##0.00' value='${miListaId.OB_IAX_GSTCOMISION.PCOMISI}'/>"                                                    
                                                    class="campowidthinput campo campotexto" formato="decimal" title="${miListaId.OB_IAX_GSTCOMISION.TATRIBU}"
                                                    <c:if test="${__formdata.CTIPCOM == 0 || __formdata.CMODO=='CONSULTA' || __formdata.CTIPCOM == 92}"> readonly </c:if>
                                                    <axis:atr f="axisctr010" c="PCOMISI" a="obligatorio=true"/>> </div>
                                                </display:column>
                                             </axis:visible>
                                             <axis:visible f="axisctr010" c="NINIALT"> 
                                               <c:choose>
                                                <c:when test="${miListaId.isNew==1}">
                                                <display:column title="${title2}" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                    <div class="dspNumber" ><input type="text" class="campowidthinput campo campotexto campotexto_ob" id="PCOMISI${miListaId.OB_IAX_GSTCOMISION.CMODCOM}_NINIALT" name="PCOMISI${miListaId.OB_IAX_GSTCOMISION.CMODCOM}_NINIALT" value='${miListaId.OB_IAX_GSTCOMISION.NINIALT}' /></div>
                                                </display:column>
                                                </c:when>
                                                <c:otherwise>
                                                
                                                <display:column title="${title2}" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                    <div class="dspNumber" id="MULT_NINIALT">${miListaId.OB_IAX_GSTCOMISION.NINIALT} </div>
                                                </display:column>
                                                
                                                </c:otherwise>
                                                </c:choose>
                                             </axis:visible>
                                             <axis:visible f="axisctr010" c="NFINALT"> 
                                            <c:choose>
                                                <c:when test="${miListaId.isNew==1}">
                                                
                                                <display:column title="${title3}" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                    <div class="dspNumber" ><input type="text" class="campowidthinput campo campotexto campotexto_ob" id="PCOMISI${miListaId.OB_IAX_GSTCOMISION.CMODCOM}_NFINALT" name="PCOMISI${miListaId.OB_IAX_GSTCOMISION.CMODCOM}_NFINALT" value='${miListaId.OB_IAX_GSTCOMISION.NFINALT}'/></div>
                                                </display:column>
                                               </c:when>
                                                <c:otherwise>
                                                <display:column title="${title3}" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                                                    <div class="dspNumber" id="MULT_NFINALT">${miListaId.OB_IAX_GSTCOMISION.NFINALT} </div>
                                                </display:column>
                                                </c:otherwise>
                                            </c:choose>
                                                </axis:visible>
                                        </display:table>
                                        </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <!-- Botonera -->
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="f">axisctr010</c:param>
                <c:param name="__botones">cancelar<c:if test="${__formdata.CMODO!='CONSULTA'}"><axis:visible f="axisctr010" c="BTNACEPTAR">,aceptar</axis:visible><axis:visible f="axisctr010" c="BTNGUARDAR">,guardar</axis:visible><axis:visible f="axisctr010" c="BTCOMI">,100009</axis:visible></c:if></c:param>
            </c:import>
        </form>
        <c:import url="../include/mensajes.jsp"/>
    </div>
    </body>
</html>
            