<%/*
*  Fichero: axiscomi012.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axiscomi012();
       }
       
       
       function f_onload(){
        
            var ok = "${__formdata.OK}";
            var modo = "${__formdata.CMODO}";
            
            if ( !objUtiles.estaVacio(ok) && ok == 0){
               parent.f_aceptar_axiscomi12();
            }
           f_cargar_propiedades_pantalla();
       }
       
        function f_tab2_input(){
            var codi = document.getElementById("CCOMISI");
            if(codi.addEventListener) {
               codi.addEventListener('keydown',this.keyHandler,false);
            }            
       }
       
        function keyHandler(e) {
            //TAB key on keyboard is identified by 9
            var TABKEY = 9;
            if(e.keyCode == TABKEY) {
                //this.value += "    ";
                if(e.preventDefault) {
                    e.preventDefault();
                    document.getElementById('TTITULO_0').focus();
                }
                return false;
            }
        }       
       
       
       function f_but_aceptar(){
            if (objValidador.validaEntrada()) {
                f_habilitar_campos();
               objUtiles.ejecutarFormulario ("modal_axiscomi012.do", "aceptar", document.axiscomi012Form, "_self", objJsMessages.jslit_cargando);
            }
       }
       
       function f_guardar_fila(CATRIBU,VALOR){
            var strURL="modal_axiscomi012.do?operation=guardar_desglose_json&CATRIBU="+CATRIBU+"&VALOR="+ VALOR;
            var ajaxTexto=objJsMessages.jslit_cargando;
            objAjax.invokeAsyncCGI_JSON(strURL, callbackdetalle_desglose, ajaxTexto)
        
        }
        
        function callbackdetalle_desglose(p) {
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                
        }
       
        function f_habilitar_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
            for(var i=0;i<selects.length;i++){
                if(selects[i].attributes.length>0) {
                   var selectId = selects[i].getAttribute("id");
                     try{
                         if (document.getElementById(selectId).style.visibility != 'hidden' ){
                             if(selects[i].getAttribute("type") != "button"  &&
                                objDom.estaDisabled(selectId))
                                    objDom.setDisabledPorId(selectId,false);
                         }
                     }catch(e){}
                }
            }
            
        }
    
       
       
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axiscomi012Form" action="" method="POST">
            <input type="hidden" name="operation" value="">
            <input type="hidden" name="CMODO" value="${__formdata.CMODO}">
            <input type="hidden" name="ESTADO" value="${__formdata.CESTADO}">
            <input type="hidden" name="TIPO" value="${__formdata.CTIPO}">
            <input type="hidden" name="CIDIOMA_USU" id="CIDIOMA_USU" value="${__formdata.CIDIOMA_USU}">
            
            <input type="hidden" name="CACTIVI" id="CACTIVI" value="${__formdata.CACTIVI}">
            <input type="hidden" name="CGARANT" id="CGARANT" value="${__formdata.CGARANT}">
            <input type="hidden" name="CCOMISI" id="CCOMISI" value="${__formdata.CCOMISI}">
            <input type="hidden" name="CMODCOM" id="CMODCOM" value="${__formdata.CMODCOM}">
            <input type="hidden" name="FINIVIG" id="FINIVIG" value="<fmt:formatDate value="${__formdata.FINIVIG}" pattern="dd/MM/yyyy" />" >
            <input type="hidden" name="NINIALT" id="NINIALT" value="${__formdata.NINIALT}">
            <input type="hidden" name="SPRODUC" id="SPRODUC" value="${__formdata.SPRODUC}">
            <input type="hidden" name="NFINALT" id="NFINALT" value="${__formdata.NFINALT}">
            <input type="hidden" name="NIVEL" id="NIVEL" value="${__formdata.NIVEL}">
            

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axiscomi012" c="FORM" lit="9904658" /></c:param>
                <c:param name="producto"><axis:alt f="axiscomi012" c="FORM" lit="9904658" /></c:param>
                <c:param name="form">axiscomi012</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <table class="seccion">    
                        <tr>
                            <td align="left" >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                        <th style="width:40%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        
                                        <td colspan="4"> 
                                            <div class="separador">&nbsp;</div>
                                        <div class="separador">&nbsp;</div>
                                            <c:set var="title1"><axis:alt f="axiscomi012" c="CIDIOMA" lit="100654"/></c:set>
                                            <c:set var="title2"><axis:alt f="axiscomi012" c="TTITULO" lit="9901320"/></c:set>
                                            <div class="seccion displayspacePersonas">
                                                <c:set var="miI" value="0" />
                                                
                                                  <display:table name="${DESGLOSES}" id="LISTDESGLOSE"  export="false" class="dsptgtable" defaultsort="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                   requestURI="modal_axispro012.do?paginar=true">
                                                    <%@ include file="../include/displaytag.jsp"%>
                                                   
                                                    <display:column title="${title1}" sortable="false" sortProperty="LISTDESGLOSE.TATRIBU" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:70%;"  >
                                                        <div class="dspText">${LISTDESGLOSE.TATRIBU}</div>
                                                    </display:column>
                                                    <display:column title="${title2}" sortable="false" sortProperty="LISTDESGLOSE.VALOR" headerClass="headwidth20 sortable" media="html" autolink="false" style="width:30%;"  >
                                                        <div class="dspText">
                                                            <input type="text" class="campowidthinput campo campotexto" style="width:80%" id="PCOMISI_${LISTDESGLOSE.CATRIBU}" name="PCOMISI_${LISTDESGLOSE.CATRIBU}" size="30"
                                                                value="${LISTDESGLOSE.PCOMISI}" onchange="f_guardar_fila('${LISTDESGLOSE.CATRIBU}',this.value)"/>
                                                        </div>
                                                    </display:column>
                                                    <c:set var="miI" value="${miI+1}" />
                                                  </display:table>
                                            </div>	
                                            <div class="separador">&nbsp;</div>
                                            <div class="separador">&nbsp;</div>
                                        </td>
                                    </tr>
                                    
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
             
              
            <c:choose>                        
            <c:when test="${__formdata.CESTADO != 2}">
             <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi012</c:param><c:param name="f">axiscomi012</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
            </c:when>
            <c:otherwise>
              <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi012</c:param><c:param name="f">axiscomi012</c:param>
                <c:param name="__botones">cancelar</c:param>
            </c:import>
            </c:otherwise>
            </c:choose>
          
     </form>              
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

