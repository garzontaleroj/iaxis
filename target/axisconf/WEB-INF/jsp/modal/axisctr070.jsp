<%/*
*  Fichero: axisctr070.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 31/03/2008
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>


    <script language="Javascript" type="text/javascript">
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_but_aceptar(){
          if (objValidador.validaEntrada()) {
            f_habilitar_campos();
            objUtiles.ejecutarFormulario("modal_axisctr059.do?CACCESORIO="+$("#CACCESORIO").val(), "guardarAccesorio",  document.axisctr059Form, "_self", objJsMessages.jslit_cargando);   
          }  
        }
        
        function f_habilitar_campos(){
        
             var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
           
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "checkbox"){
                    
                         try{
                             if (document.getElementById(checkboxsId).style.visibility != 'hidden' ){
                                 if(checkboxs[i].getAttribute("type") != "button"  && objDom.estaDisabled(checkboxsId))
                                        objDom.setDisabledPorId(checkboxsId,false);
                             }
                         }catch(e){}
                    }
                }
            }
        }
        
        function f_but_cancelar() {
            var embedded = "${param.embedded}"; 
            if (embedded == "true")
                f_cerrar_axisctr070();
            else
                parent.f_cerrar_axisctr070();                
        }
          function f_act_check()
        {
              document.axisctr059Form.CASEGURABLE.value = document.getElementById("CASEGURABLE").checked ? "1" : "0";
        }   
        
        function f_accesorio_asegurable(ctipo){
                if(ctipo == 3){
                    $('#IIVALPUBL').val('');
                }
        
                f_cargar_propiedades_pantalla();               
                var caccesorio = document.axisctr059Form.CACCESORIO.value;                                               
                var strURL="modal_axisctr059.do?operation=asegurable_json&CACCESORIO="+caccesorio+"&CTIPO="+ctipo;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarVersion, ajaxTexto)
         }
         
         function callbackjsonRecuperarVersion(p){
            //alert( JSON.stringify(p) );
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            try{
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                  var casegurable = p.JSON2.lista[0].CASEGURABLE;
                  if(casegurable == 1){
                    document.axisctr059Form.CASEGURABLE.checked = true;
                    document.axisctr059Form.CASEGURABLE.value = casegurable;
                  }
                  if(casegurable == 0){
                    document.axisctr059Form.CASEGURABLE.checked = false;
                    document.axisctr059Form.CASEGURABLE.value = casegurable;
                  }
                      
                 }
           
                }catch(e){
                 
                }       
        }
        
        function f_cleartipo(){
                
                document.axisctr059Form.CASEGURABLE.checked = false; 
                document.axisctr059Form.CASEGURABLE.value = 0;
                document.axisctr059Form.CTIPO.value = "<%= Integer.MIN_VALUE %>";
         }
        
    </script>

        <input type="hidden" name="XCVERSION" id="XCVERSION" value="${CVERSION}" />
        
        <!-- Area de campos  -->
       
                    <div class="separador">&nbsp;</div>
                        <table class="seccion" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                 <axis:visible f="CACCESORIO" c="CASEGURABLE">
                                <th style="width:10%;height:0px"></th>
                                </axis:visible>
                                <th style="width:20%;height:0px"></th>
                                
                            </tr>
                            <tr>
                             <axis:ocultar f="axisctr070" c="CACCESORIO" dejarHueco="false">
                                <!-- Accesorio -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr070" c="CACCESORIO" lit="9001364" /></b>
                                </td>
                                </axis:ocultar>
                             <axis:ocultar f="axisctr070" c="CTIPO" dejarHueco="false">
                                <!-- Tipo -->
                                <td class="titulocaja" >
                                    <b><axis:alt f="axisctr070" c="CTIPO" lit="9001366" /></b>
                                </td>
                                </axis:ocultar>
                                
                                 <axis:ocultar f="axisctr070" c="TACCESORIO" dejarHueco="false">
                                <!-- Accesorio -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr070" c="TACCESORIO" lit="9001364" /></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr070" c="CASEGURABLE" dejarHueco="false">
                                <!-- Accesorio -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr070" c="CASEGURABLE" lit="9904752" /></b>
                                </td>
                                </axis:ocultar>
                                
                                  <axis:ocultar f="axisctr070" c="IIVALPUBL" dejarHueco="false">
                                <!-- Valor -->
                                <td class="titulocaja">
                                    <b><axis:alt f="axisctr070" c="IIVALPUBL" lit="9001365" /></b>
                                </td> 
                                </axis:ocultar>
                                
                            </tr>
                            <tr>
                             <axis:ocultar f="axisctr070" c="CACCESORIO" dejarHueco="false">
                                  <td class="campocaja">
                                     <select name = "CACCESORIO" id="CACCESORIO"   size="1" 
                                     <c:if test="${sessionScope.modo_modif==1}">
                                        disabled <axis:atr f="CACCESORIO" c="CACCESORIO" a="modificable=false&isInputText=false"/>
                                     </c:if>
                                     <c:if test="${sessionScope.modo_modif!=1}">
                                        <axis:atr f="CACCESORIO" c="CACCESORIO" a="modificable=true&isInputText=false&obligatorio=true"/>
                                     </c:if>
                                     title="<axis:alt c="CACCESORIO" f="CACCESORIO" lit="9001362" />"
                                     class="campowidthselect campo campotexto"   onchange="f_cleartipo()"
                                     >
                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="CACCESORIO" c="SELECCIONAR" lit="108341"/> - </option>                              
                                          <c:forEach var="tipo" items="${lstaccesorios}">
                                                <option value = "${tipo.CACCESORIO}"
                                                <c:if test="${(!empty __formdata.CACCESORIO)&& tipo.CACCESORIO == __formdata.CACCESORIO}"> selected </c:if>>
                                                    ${tipo.TACCESORIO}</option>  
                                            </c:forEach>
                                     </select>
                                  </td>
                            </axis:ocultar> 
                             <axis:ocultar f="axisctr070" c="CTIPO" dejarHueco="false">
                                  <td class="campocaja">
                                     <select name = "CTIPO" id="CTIPO"   size="1" 
                                     title="<axis:alt c="CTIPO" f="CTIPO" lit="9001366" />"
                                     class="campowidthselect campo campotexto"  onchange="f_accesorio_asegurable(this.value)" 
                                     <axis:atr f="CACCESORIO" c="CTIPO" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                      <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="CACCESORIO" c="SELECCIONAR" lit="108341"/> - </option>                              
                                          <c:forEach var="tipo" items="${TIPO}">
                                                <option value = "${tipo.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CTIPO)&& tipo.CATRIBU == __formdata.CTIPO}"> selected </c:if>>
                                                    ${tipo.TATRIBU}</option>  
                                            </c:forEach>
                                     </select>
                                  </td>
                            </axis:ocultar> 
                           
                            <axis:ocultar f="CACCESORIO" c="TACCESORIO" dejarHueco="false">
                            
                                <td class="campocaja">
                                        <input type="text" name="TTACCESORIO" id="TTACCESORIO"  
                                        value="${__formdata.TTACCESORIO}"  class="campowidthinput campo campotexto"
                                         title="<axis:alt f="axisctr070" c="TACCESORIO" lit="9001364" />"
                                        <axis:atr f="axisctr070" c="TACCESORIO" a="modificable=true&obligatorio=false"/> />
                                </td>
                            </axis:ocultar>
                            <axis:ocultar c="CASEGURABLE" f="axisctr070" dejarHueco="false">
                                                    <td class="campocaja"> 
                                                        <input type="checkbox" id="CASEGURABLE" name="CASEGURABLE" 
                                                        <c:if test="${__formdata.CASEGURABLE == 1}">checked</c:if> 
                                                         title="<axis:alt f="axisctr070" c="CASEGURABLE" lit="9904752" />"
                                                        value="${__formdata.CASEGURABLE}" onclick="f_act_check();"
                                                        <axis:atr f="axisctr070" c="CASEGURABLE" a="modificable=false&obligatorio=false&isInputText=false"/> />
                                                    </td>
                                                    </axis:ocultar>
                            <axis:ocultar f="axisctr070" c="IIVALPUBL" dejarHueco="false">
                            
                                <td class="campocaja">
                                        <input type="text" <axis:atr f="axisctr070" c="IIVALPUBL" a="modificable=true&obligatorio=false&formato=decimal"/> 
                                         title="<axis:alt f="axisctr070" c="IIVALPUBL" lit="9001365" />"
                                        name="IIVALPUBL" id="IIVALPUBL"  value="<fmt:formatNumber pattern='${__formatNumberPatterns[__defaultCMONINT]}'  value='${__formdata.IIVALPUBL}'/>" class="campowidthinput campo campotexto"/>
                                </td>
                            </axis:ocultar>
                               
                                
                                
                            </tr>
                        </table>						
                
        <div class="separador">&nbsp;</div>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr070</c:param><c:param name="f">axisctr070</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    


