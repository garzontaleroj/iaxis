
<%/**
    *  Fichero: axislist009.jsp
    *  @author <a href = "mailto:jgutierrez @csi-ti.com">Jenny Gutierrez</a>
    *  
    *    Comentarios
    *
    *
    *  Fecha: 15/08/2013
    */
    %>
<%@ page contentType="text/html;charset=iso-8859-15"%>
<%@ page import="java.lang.String"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
<c:import url="../include/carga_framework_js.jsp"/>
<input type="hidden" name="operation" value=""/>
<html>
    <head>
<script language="Javascript" type="text/javascript">
                
/****************************************************************************************/
/*********************************** NAVEGACION *****************************************/
/****************************************************************************************/
                
                function f_onload(){
                    f_cargar_propiedades_pantalla();
                    revisarEstilos();                    
                }
                     
                
                function f_but_salir() {                                    
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist009", "cancelar", document.miForm, "_self");         
            
                }                       

        function f_but_109006() {
        
            if (objValidador.validaEntrada()){
                  var params = f_get_params();
                                   
                 objUtiles.ejecutarFormulario("axis_axislist009.do?bus=bus"+params, "ejecutar", document.miForm, "_self", '<axis:alt f="axislist009" c="MSG_CARGAR" lit="9901019"/>');   
                }                      
                    
        }
        
        
        function f_get_params ()
        {
            var params = '';
               
                if (!objUtiles.estaVacio(objDom.getValorPorId("EMPRESA"))){
                    params += "&EMPRESA="+objDom.getValorPorId("EMPRESA");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("GESTOR"))){
                    params += "&GESTOR="+objDom.getValorPorId("GESTOR");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("FORMATO"))){
                    params += "&FFORMATO="+objDom.getValorPorId("FORMATO");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("ANIO"))){
                    params += "&FANIO="+objDom.getValorPorId("ANIO");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("MES"))){
                    params += "&FMES="+objDom.getValorPorId("MES");
                }
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("DIA"))){
                    params += "&FDIA="+objDom.getValorPorId("DIA");
                }
                
               if (!objUtiles.estaVacio(objDom.getValorPorId("GDATO"))){
               params += "&FGDATO="+objDom.getValorPorId("GDATO");
               } 
               
               if (!objUtiles.estaVacio(objDom.getValorPorId("GFORMAT"))){
               params += "&FGFORMAT="+objDom.getValorPorId("GFORMAT");
               } 
                
              //  params+="&DATO="+objDom.setValorPorId("DATO",((check.checked)?1:0)););
                
                return params;
              
        }

 
               function callbackCancelar() {
                    objUtiles.ejecutarFormulario ("main.do", "cancelar", document.miForm, "_self");                   
                }                    
                
                
                function f_cargar_gestores(){
        
                     EMPRESA= objUtiles.utilSplit(objDom.getValorComponente(document.miForm.EMPRESA), "/")[0];
                     if (!objUtiles.estaVacio (EMPRESA) ){
                    objDom.setValorComponente(document.miForm.EMPRESA, objDom.getValorComponente(document.miForm.EMPRESA));
                   }else
                    objDom.setValorComponente(document.miForm.EMPRESA, null);
                     objAjax.invokeAsyncCGI("axis_axislist009.do", callbackAjaxCargarGstores, "operation=ajax_busqueda_gestores&EMPRESA=" + objDom.getValorComponente(document.miForm.EMPRESA), this, objJsMessages.jslit_cargando);
             }   
         
            function callbackAjaxCargarGstores (ajaxResponseText){
            //alert("ingresa por 5");
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("TGESTOR");
                     //alert("ingresa por 6"+elementos.length);
                    var GESTORCombo = document.miForm.GESTOR;     
                    objDom.borrarOpcionesDeCombo(GESTORCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist009" c="GESTOR" lit="108341"/> - ', GESTORCombo, 0);
                   var FORMATOCombo = document.miForm.FORMATO;
                   objDom.borrarOpcionesDeCombo(FORMATOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist009" c="FORMATO" lit="108341"/> - ', FORMATOCombo, 0);
                 // alert("ingresa por 6"+elementos.length)
                   
                       for (i = 0; i < elementos.length; i++) {
                            var GESTOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGESTOR"), i, 0)+"/"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERIOD"), i, 0);
                            var TNOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0);                                     
                            objDom.addOpcionACombo(GESTOR, TNOMBRE, GESTORCombo, i+1);
                        }
                   

                }
                        f_cargar_propiedades_pantalla();        
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            }   
            
           
            
             function f_cargar_formatos(){
             
                                  objDom.setValorPorId("ANIO", "");
                    document.getElementById("MES").selectedIndex=0;
                    document.getElementById("DIA").selectedIndex=0;
        //alert("ingresa por 1");
                     GESTOR= objUtiles.utilSplit(objDom.getValorComponente(document.miForm.GESTOR), "/")[0];
                                          
                   // alert("ingresa por 1" + GESTOR+"Periodo "+objDom.getValorComponente(document.miForm.GESTOR));
                     if (!objUtiles.estaVacio (GESTOR) ){
                   //  alert("ingresa por 2");
                    objDom.setValorComponente(document.miForm.TGESTOR, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.GESTOR), "/")[0]);
                    objDom.setValorComponente(document.miForm.TPERIOD, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.GESTOR), "/")[1]);
                    //alert("ingresa por 21"+objDom.getValorComponente(document.miForm.EMPRESA));
                    }else
                    objDom.setValorComponente(document.miForm.GESTOR, null);
                    //alert("ingresa por 3");
                    objAjax.invokeAsyncCGI("axis_axislist009.do", callbackAjaxCargarFormatos, "operation=ajax_busqueda_formatos&GESTOR=" + objDom.getValorComponente(document.miForm.TGESTOR), this, objJsMessages.jslit_cargando);
                   //// alert("ingresa por 4");
            }   
         
            function callbackAjaxCargarFormatos (ajaxResponseText){
            //alert("ingresa por 5");
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("TFORMAT");
                     //alert("ingresa por 6"+elementos.length);
                    var FORMATOCombo = document.miForm.FORMATO;     
                    objDom.borrarOpcionesDeCombo(FORMATOCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axislist009" c="FORMATO" lit="108341"/> - ', FORMATOCombo, 0);
                 // alert("ingresa por 6"+elementos.length)
                   
                       for (i = 0; i < elementos.length; i++) {
                            var FORMATO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TFORMAT"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0);
                           // var TIPOGESTOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERIOD"), i, 0);
                          //  alert ("TIPOGESTOR " + i + ":" + TIPOGESTOR);
                            objDom.addOpcionACombo(FORMATO, TITULO, FORMATOCombo, i+1);
                        }
                   

                }
                

                    f_cargar_propiedades_pantalla();            
                // recarrega scroll pane
                $.reinitialiseScroll();
                
            } 
            
            
             function f_actualizar_valor(){
            if(document.miForm.DATO.checked){
                document.miForm.GDATO.value='S';
            }else
            {
            document.miForm.GDATO.value='N';
            }
            
            if(document.miForm.GFORMATO.checked){
                document.miForm.GFORMAT.value='S';
            }else
            {
            document.miForm.GFORMAT.value='N';
            }
            
    
            }
     
            </script>
                </head>
<body onload="f_onload()">
       <c:import url="../include/modal_estandar.jsp">
    <c:param name="titulo"><axis:alt f="${fname}" c="TITULO" lit="9905940"/></c:param>
</c:import>
<c:import url="../include/precargador_ajax.jsp">
    <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
  </c:import><form name="miForm" action="" method="POST">
  <input type="hidden" name="operation" value="" />   

    <c:import url="../include/titulo_nt.jsp">
      <c:param name="titulo"><axis:alt f="${fname}" c="TITULO" lit="9905940"/></c:param>
      <c:param name="formulario"><axis:alt f="${fname}" c="TITULO" lit="9905940"/></c:param>
      <c:param name="form">axislist009</c:param>      
    </c:import>   
          
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="${fname}" c="TAXISIMPRIMIR" lit="1000205" />|true</c:param>
    </c:import>
   <input type="hidden" name="ult_proceso" id="ult_proceso" value="${__formdata.ult_proceso}" /> 
   <input type="hidden" name="aaa" id="aaa" value="5" /> 
    <input type="hidden" name="GDATO" id="GDATO" value="${__formdata.GDATO}" /> 
    <input type="hidden" name="GFORMAT" id="GFORMAT" value="${__formdata.GFORMAT}" /> 
    <input type="hidden" name="TPERIOD" id="TPERIOD" value="${__formdata.TPERIOD}" />
    <input type="hidden" name="TGESTOR" id="TGESTOR" value="${__formdata.TGESTOR}" />
      
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
                <tr>
                    <td>
                        
                        <table class="seccion" align="center">
                            <tr>
                                <td></td>
                            </tr><tr>
                                <axis:visible f="axislist009" c="TIPOPER">
                                    <td id="TIPOPER">
                                        <div class="separador">&nbsp;</div>
                                        <table class="area" id="DSP_TIPOPER" align="center">
                                            <tr style="height:0px">
                                                <th style="width:16.6%;height:0%;"/>
                                                <th style="width:16.6%;height:0%;"/>
                                                <th style="width:16.6%;height:0%;"/>
                                                <th style="width:16.6%;height:0%;"/>
                                                <th style="width:8.6%;height:0%;"/>
                                                <th style="width:8.4%;height:0%;"/>
                                            </tr>
                                                 <tr style="height:0px">
                                                <axis:ocultar f="axislist009" c="EMPRESA" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_EMPRESA">
                                                        <b>
                                                            <axis:alt f="axislist009" c="EMPRESA" lit="101619"/></b>
                                                         
                                                        <%-- EMPRESA --%>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axislist009" c="TINFORME" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_TINFORME">
                                                        <b>
                                                            <axis:alt f="axislist009" c="TINFORME" lit="9000569"/></b>
                                                         
                                                        <%-- GESTOR --%>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axislist009" c="TFORMATO" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_TFORMATO" colspan="3">
                                                        <b>
                                                            <axis:alt f="axislist009" c="TFORMATO" lit="9905788"/></b>
                                                         
                                                        <%-- FORMATO--%>
                                                    </td>
                                                </axis:ocultar>
                                               </tr>
                                               <tr style="height:0px">
                                                <%-- BODY--%>
                                                <axis:ocultar f="axislist009" c="EMPRESA">
                                        <td class="campocaja">
                                            <select name="EMPRESA" obligatorio="true" id ="EMPRESA" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="f_cargar_gestores()">
                                                <option value="null"> - <axis:alt f="axislist009" c="EMPRESACombo" lit="1000348"/> - </option>
                                                <c:forEach var="EMPRESA" items="${EMPRESAS}">
                                                    <option value="${EMPRESA.CEMPRES}"
                                                    <c:if test="${__formdata.EMPRESA != null && EMPRESA.CEMPRES == __formdata.EMPRESA}"> selected </c:if>>
                                                    ${EMPRESA.TEMPRES}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>
                                                 <axis:ocultar f="axislist009" c="GESTOR">
                                        <td class="campocaja">
                                            <select name="GESTOR" obligatorio="true" id ="GESTOR" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="f_cargar_formatos()">
                                                <option value="null"> - <axis:alt f="axislist009" c="GESTORCombo" lit="1000348"/> - </option>
                                                <c:forEach var="GESTOR" items="${GESTORES}">
                                                    <option value="${GESTOR.TGESTOR}/${GESTOR.TPERIOD}"
                                                    <c:if test="${GESTOR.TGESTOR == __formdata.TGESTOR}"> selected </c:if>>
                                                    ${GESTOR.TNOMBRE}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                            <axis:ocultar f="axislist009" c="FORMATO">
                                         <td class="campocaja">
                                            <select name="FORMATO"  id ="FORMATO" size="1" class="campowidthselect campo campotexto_ob" style="width:250px">
                                                <option value="null"> - <axis:alt f="axislist009" c="FORMATOCombo" lit="1000348"/> - </option>
                                                <c:forEach var="FORMATO" items="${FORMATOS}">
                                                    <option value="${FORMATO.TFORMAT}"
                                                    <c:if test="${__formdata.FORMATO != null && FORMATO.TFORMAT == __formdata.FORMATO}"> selected </c:if>>
                                                    ${FORMATO.TNOMBRE}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>                                
                                                </tr>
                               <tr style="height:0px">
                                                <axis:ocultar f="axislist009" c="ANIO" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_ANIO">
                                                        <b>
                                                            <axis:alt f="axislist009" c="ANIO" lit="101606"/></b>
                                                         
                                                        <%-- Nº ANIO--%>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axislist009" c="MES" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_MES">
                                                        <b>
                                                            <axis:alt f="axislist009" c="MES" lit="9000495"/></b>
                                                         
                                                        <%-- Nº MES--%>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axislist009" c="SEMANA" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_SEMANA">
                                                        <b>
                                                            <axis:alt f="axislist009" c="SEMANA" lit="9900972"/></b>
                                                         
                                                        <%-- Nº SEMANA--%>
                                                    </td>
                                                </axis:ocultar>
                                                </tr>
                                                 <tr style="height:0px">
                                                <%-- BODY--%>
                                               <axis:ocultar f="axislist009" c="ANIO">
                                        <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15"  maxlength="4"
                                            value="${__formdata.ANIO}" name="ANIO" id="ANIO" 
                                            style="width:67%;" title="<axis:alt f="axislist009" c="ANIO" lit="101606"/>"
                                            <axis:atr f="axislist009" c="ANIO" a="modificable=false&formato=entero&obligatorio=true"/> />
                                        </td>
                                        </axis:ocultar>
                                        <axis:ocultar f="axislist009" c="MES">
                                        <td class="campocaja">
                                            <select name="MES" disabled="true"  obligatorio="true" id ="MES" size="1" class="campowidthselect campo campotexto_ob" style="width:250px">
                                                <option value="null"> - <axis:alt f="axislist009" c="MESCombo"  lit="9000495"/> - </option>
                                                <c:forEach var="MES" items="${MESES}">
                                                    <option value="${MES.CATRIBU}"
                                                    <c:if test="${__formdata.MES != null && MES.CATRIBU == __formdata.MES}"> selected </c:if>>
                                                    ${MES.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar>
                                        <axis:ocultar f="axislist009" c="DIA">
                                          <td class="campocaja">
                                            <select name="DIA" disabled="true"  obligatorio="true" id ="DIA" size="1" class="campowidthselect campo campotexto_ob" style="width:250px">
                                                <option value="null"> - <axis:alt f="axislist009" c="DIACombo"  lit="9900972"/> - </option>
                                                <c:forEach var="DIA" items="${DIAS}">
                                                    <option value="${DIA.CATRIBU}"
                                                    <c:if test="${__formdata.DIA != null && DIA.CATRIBU == __formdata.DIA}"> selected </c:if>>
                                                    ${DIA.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td> 
                                        </axis:ocultar> </tr>
                                        <tr style="height:0px">
                                                <axis:ocultar f="axislist009" c="IDATO" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IDATO">
                                                        <b>
                                                            <axis:alt f="axislist009" c="IDATO" lit="9000497"/>
                                                            &nbsp;
                                                            <axis:alt f="axislist009" c="IDATO" lit="9001754"/></b>
                                                         
                                                        <%-- EMPRESA --%>
                                                    </td>
                                                </axis:ocultar>
                                                <axis:ocultar f="axislist009" c="IFORMATO" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IFORMATO">
                                                        <b>
                                                            <axis:alt f="axislist009" c="IFORMATO" lit="9000497"/>
                                                            &nbsp;
                                                            <axis:alt f="axislist009" c="IFORMATO" lit="9905788"/>
                                                            </b>
                                                         
                                                        <%-- GESTOR --%>
                                                    </td>
                                                </axis:ocultar>
                                                </tr>
                                                <tr style="height:0px">
                                                
                                                <axis:ocultar f="axislist009" c="IDATO" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IIDATO">
                                                      
                                                         <input type="checkbox" name="DATO" <c:if test="${__formdata.GDATO == 'S'}">checked</c:if> id="DATO"  style="width:40%;align:left;" onclick="javascript:f_actualizar_valor()">  
                                       

                                                    </td>
                                                </axis:ocultar>
                                                
                                                <axis:ocultar f="axislist009" c="IFORMATO" dejarHueco="false">
                                                    <td class="titulocaja" id="tit_IFORMATO">
                                                      
                                                           <input type="checkbox" name="GFORMATO" <c:if test="${__formdata.GFORMAT == 'S'}">checked</c:if>  id="GFORMATO" style="width:40%;align:left;" onclick="javascript:f_actualizar_valor()">  

                                                    </td>
                                                </axis:ocultar>
                                                </tr>
    
                                        </table>
                                    </td>
                                </axis:visible>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
    
  
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">${fname}</c:param>
        <c:param name="f">axislist009</c:param>
        <c:param name="__botones">salir,109006</c:param>
    </c:import>
  </form>
  <c:import url="../include/mensajes.jsp"/>
      </body>
</html>