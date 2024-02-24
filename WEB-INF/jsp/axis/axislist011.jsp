<%-- NOMBRE: axislist008.jsp Fecha: 17/06/2013 PROPÓSITO (descripción pantalla): Ejemplo : Pantalla de Listados generica
     REVISIONES: Ver Fecha Autor Descripción --------- ---------- --------------- ------------------------------------
     1.0 17/06/2013 XPL 1. Creación de la pantalla. bug xxxx: AGA003 - creación de pantalla de proceso--%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
   <head>
      <title></title>
      <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
      <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
      <link rel="stylesheet" href="styles/displaytag.css"></link>
      <c:import url="../include/carga_framework_js.jsp"/>
      <script type="text/javascript">
         /****************************************************************************************/
         /*********************************** NAVEGACION *****************************************/
         /****************************************************************************************/
         function f_onload() {
            f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
         }

         function f_but_salir() {                        
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
         }
          
         function f_borrar_campos() {
            document.getElementById("INFORME").selectedIndex=0;
            objDom.setValorPorId("NANIO", "");
            document.getElementById("NMES").selectedIndex=0;
            document.getElementById("NDIA").selectedIndex=0; 
            document.getElementById("EMPRESA").selectedIndex=0; 
            objDom.setValorPorId("TFORMATO", ""); 
            document.getElementById("EMPRESA").focus();
            f_actualiza_gestor();
         }         

         function f_generar_fichero() {            
             //if (objValidador.validaEntrada()){
               objUtiles.ejecutarFormulario("axis_axislist011.do", "generar_fichero", document.miForm, "_self", objJsMessages.jslit_cargando);                                   
            //}                                          
        }

        function f_actualiza_gestor(){           
            EMPRESA= document.miForm.EMPRESA.value;
            objAjax.invokeAsyncCGI("axis_axislist011.do", callbackAjaxActualizaGestor, 
                "operation=ajax_actualiza_gestores&EMPRESA="+EMPRESA, this, objJsMessages.jslit_actualizando_registro);
                
        }
        
        function callbackAjaxActualizaGestor(ajaxResponseText) {
            
                var doc=objAjax.domParse(ajaxResponseText);                
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("TGESTOR");
                    var GESTORCombo = document.miForm.INFORME;     
                    objDom.borrarOpcionesDeCombo(GESTORCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axis_axislist011" c="GESTOR" lit="108341"/> - ', GESTORCombo, 0);
                   
                       for (i = 0; i < elementos.length; i++) {
                            //var GESTOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGESTOR"), i, 0);
                            var GESTOR = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGESTOR"), i, 0)+"/"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPERIOD"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), i, 0);                                     
                            objDom.addOpcionACombo(GESTOR, TITULO, GESTORCombo, i+1);
                        }
                }
                f_cargar_propiedades_pantalla();        
            }  
            
            function f_obtiene_periodicidad(){
                     GESTOR= objUtiles.utilSplit(objDom.getValorComponente(document.miForm.INFORME), "/")[0];
                                          
                     if (!objUtiles.estaVacio (GESTOR) ){
                    objDom.setValorComponente(document.miForm.TGESTOR, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.INFORME), "/")[0]);
                    objDom.setValorComponente(document.miForm.TPERIOD, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.INFORME), "/")[1]);
                    
                    }else
                    objDom.setValorComponente(document.miForm.INFORME, null);
                    
                    objDom.setValorPorId("NANIO", "");
                    document.getElementById("NMES").selectedIndex=0;
                    document.getElementById("NDIA").selectedIndex=0;
                    //objDom.setValorComponente(document.miForm.TPERIOD, "M");
                    f_cargar_propiedades_pantalla(); 
                    
            }       
         
            
      </script>
   </head>
   <body onload="f_onload()">
      <c:import url="../include/precargador_ajax.jsp">
         <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
      </c:import>
         
      <form name="miForm" action="" method="POST">
         <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo">
               <b><axis:alt f="axislist011" c="TITULO_FORM" lit="102803"/></b>
            </c:param>
            <c:param name="formulario">
               <b><axis:alt f="axislist011" c="TITULO_FORM" lit="102803"/></b>
            </c:param>
            <c:param name="form">axislist011</c:param>
         </c:import> 
         
         <input type="hidden" name="operation" value=""/>
         <input type="hidden" name="TPERIOD" id="TPERIOD" value="${__formdata.TPERIOD}" />
         <input type="hidden" name="TGESTOR" id="TGESTOR" value="${__formdata.TGESTOR}" />
         
         <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr>
               <td>
                  <table class="seccion" align="center">
                     <tr>
                        <td></td>
                     </tr>
                     <tr>
                        <axis:visible f="axislist011" c="TIPOPER">
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
                                    <axis:ocultar f="axislist011" c="TEMPRESA" dejarHueco="false">
                                       <td class="titulocaja" id="tit_EMPRESA" >
                                          <%-- TITULO DE LA EMPRESA--%>
                                          <b><axis:alt f="axislist011" c="TEMPRESA" lit="101619"/></b>
                                       </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axislist011" c="TINFORME" dejarHueco="false">
                                       <td class="titulocaja" id="tit_TINFORME" >
                                          <%-- TITULO DEL INFORMRE--%>
                                          <b><axis:alt f="axislist011" c="TINFORME" lit="9000569"/></b>
                                       </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axislist011" c="TFORMATO" dejarHueco="false">
                                       <td class="titulocaja" id="tit_TFORMATO" colspan="3">
                                          <%-- TITULO DEL FORMATO--%>
                                          <b><axis:alt f="axislist011" c="TFORMATO" lit="9905788"/></b>
                                       </td>
                                    </axis:ocultar>
                                 </tr>
                                 
                                 <tr style="height:0px">
                                    <axis:ocultar f="axislist011" c="EMPRESA">
                                       <td class="campocaja">
                                          <select name="EMPRESA" obligatorio="true" id ="EMPRESA" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="f_actualiza_gestor()">
                                             <option value="null"> - <axis:alt f="axislist011" c="COMBONULL" lit="1000348"/> - </option>
                                             <c:forEach var="EMPRESA" items="${EMPRESAS}">
                                                <option value="${EMPRESA.CEMPRES}"
                                                   <c:if test="${__formdata.EMPRESA != null && EMPRESA.CEMPRES == __formdata.EMPRESA}"> selected </c:if>>
                                                   ${EMPRESA.TEMPRES}
                                                </option>
                                             </c:forEach>
                                          </select>
                                       </td> 
                                    </axis:ocultar>                                            
                                
                                    <axis:ocultar f="axislist011" c="INFORME">
                                       <td class="campocaja">
                                          <select name="INFORME" obligatorio="true" id ="INFORME" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="f_obtiene_periodicidad()">
                                             <option value="null"> - <axis:alt f="axislist011" c="COMBONULL" lit="1000348"/> - </option>
                                             <c:forEach var="INFORME" items="${INFORMES}">
                                                <option value="${INFORME.TGESTOR}/${INFORME.TPERIOD}"
                                                   <c:if test="${__formdata.TGESTOR != null && INFORME.TGESTOR == __formdata.TGESTOR}"> selected </c:if>>
                                                   ${INFORME.TNOMBRE}
                                                </option>
                                             </c:forEach>
                                          </select>
                                       </td> 
                                    </axis:ocultar>   

                                    <axis:ocultar f="axislist011" c="TFORMATO" dejarHueco="false">
                                       <td class="campocaja" id="TD_TFORMATO"  colspan="2">                             
                                          <%-- CAJA DE TEXTO DEL FORMATO--%>
                                          <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TFORMATO}" name="TFORMATO" id="TFORMATO" 
                                          <axis:atr f="axislist011" c="TFORMATO" a="obligatorio=false"/>    style="width:80%;"/>
                                       </td>
                                    </axis:ocultar>                                                                  
                                 </tr>
                                 
                                 <tr style="height:0px">
                                    <axis:ocultar f="axislist011" c="NANIO" dejarHueco="false">
                                       <%--TITULO DEL ANIO--%>
                                       <td class="titulocaja" id="tit_NANIO">
                                          <b><axis:alt f="axislist011" c="NANIO" lit="101606"/></b>                                          
                                       </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axislist011" c="NMES" dejarHueco="false">
                                       <%-- TITULO DEL MES--%>
                                       <td class="titulocaja" id="tit_NMES">
                                          <b><axis:alt f="axislist011" c="NMES" lit="9000495"/></b>
                                       </td>
                                    </axis:ocultar>
                                    
                                    <axis:ocultar f="axislist011" c="NSEMANA" dejarHueco="false">
                                       <%-- TITULO DEL DIA-SEMANA--%>
                                       <td class="titulocaja" id="tit_NSEMANA">
                                          <b><axis:alt f="axislist011" c="NSEMANA" lit="9900972"/></b>
                                       </td>
                                    </axis:ocultar>
                                 </tr>
                                 
                                 <tr style="height:0px">
                                    <axis:ocultar f="axislist011" c="NANIO" dejarHueco="false">
                                       <%-- CAJA DE TEXTO DEL ANIO--%>
                                       <td class="campocaja" id="td_NANIO">
                                          <input type="text" class="campowidthinput campo campotexto" size="10" value="${__formdata.NANIO}" MaxLength="4" name="NANIO" id="NANIO" onkeypress="f_valida_numeros()"
                                             <axis:atr f="axislist011" c="NANIO" a="modificable=false&formato=entero&obligatorio=true"/>  style="width:50%;"
                                             title="<axis:alt f="axislist011" c="NANIO" lit="1000559"/>" />
                                       </td>
                                    </axis:ocultar> 
                                      
                                    <axis:ocultar f="axislist011" c="NMES">
                                       <td class="campocaja">
                                          <select name="NMES" disabled="true" obligatorio="true" id ="NMES" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="">
                                             <option value="null"> - <axis:alt f="axislist011" c="COMBONULL" lit="1000348"/> - </option>
                                             <c:forEach var="MES" items="${MESES}">
                                                <option value="${MES.CATRIBU}"
                                                   <c:if test="${__formdata.MES != null && MES.CATRIBU == __formdata.MES}"> selected </c:if>>
                                                   ${MES.TATRIBU}
                                                </option>
                                             </c:forEach>
                                          </select>
                                       </td> 
                                    </axis:ocultar>   
                                    
                                    <axis:ocultar f="axislist011" c="NDIA">
                                       <td class="campocaja">
                                          <select name="NDIA" obligatorio="false" id ="NDIA" size="1" class="campowidthselect campo campotexto_ob" style="width:250px" onchange="">
                                             <option value="null"> - <axis:alt f="axislist011" c="COMBONULL" lit="1000348"/> - </option>
                                             <c:forEach var="DIA" items="${DIAS}">
                                                <option value="${DIA.CATRIBU}"
                                                   <c:if test="${__formdata.DIA != null && DIA.TATRIBU == __formdata.DIA}"> selected </c:if>>
                                                   ${DIA.TATRIBU}
                                                </option>
                                             </c:forEach>
                                          </select>
                                       </td> 
                                    </axis:ocultar>   
                                 </tr>
                                 
                                 <tr>                                 
                                    <td align="center" colspan="5">
                                       <div class="separador">&nbsp;</div>
                                       <axis:ocultar f="axislist011" c="BT_BORRAR_CAMPOS" dejarHueco="false">
                                          <input type="button" class="boton" value="<axis:alt f="axislist011" c="CAMPO004" lit="9000440"/>" onclick="f_borrar_campos()" />
                                       </axis:ocultar>
                                       &nbsp;&nbsp;&nbsp;&nbsp;
                                      
                                      <axis:ocultar f="axislist011" c="BT_EJECUTAR" dejarHueco="false">
                                         <input type="button" id = "BT_EJECUTAR" class="boton" value="<axis:alt f="axislist011" c="CAMPO005" lit="109006"/>" onclick="f_generar_fichero()" />
                                      </axis:ocultar>
                                    </td>
                                    
                                      <div class="separador">&nbsp;</div>
                                   </td>
                                </tr>
                             </table>
                          </td>
                       </axis:visible>
                    </tr>
                 </table>
              </td>
           </tr>
        </table>
     <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axislist011</c:param>        
        <c:param name="__botones">salir</c:param>
     </c:import>

     </form>
     <c:import url="../include/mensajes.jsp"/>
   </body>
</html>