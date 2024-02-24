<%-- 
*  Fichero: axisper014.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*
*  Fecha: 23/07/2008
*/
--%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

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

        function f_onload() {
       f_cargar_propiedades_pantalla();
 
        }
                
        function f_but_aceptar() {
            if (objValidador.validaEntrada()) {
                    parent.f_aceptar_axisctr076(document.miForm.CAGENTE_TEXT.value);
                    //objUtiles.ejecutarFormulario("modal_axisper014.do", "grabarCCC", document.axisper014Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_but_cancelar() {
                parent.f_cerrar_axisctr076();                
        }    
        
       
            function f_abrir_axisctr014() {
                objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
            }
            
            function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("modal_axisctr076.do", callbackAjaxCambiarAgente, "operation=ajax_cargarAgente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }    

            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado);
                objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado);
                    }
            }   

            function f_actualizar_agente(){
             if (objValidador.validaEntrada()) {
                 objAjax.invokeAsyncCGI("modal_axisctr076.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE_TEXT), this, objJsMessages.jslit_cargando);
              }  
            }   

            function callbackAjaxCargarAgente(ajaxResponseText){
                
                var doc=objAjax.domParse(ajaxResponseText);

                var elementos = doc.getElementsByTagName("element");
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                        var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                        var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                        objDom.setValorPorId("CAGENTE_TEXT", CAGENTEformateado); 
                        objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                        objDom.setValorPorId("NOMBRE_TEXT", NOMBREformateado); 
                    }else{
                        
                        objDom.setValorPorId("NOMBRE_TEXT",""); 
                        objDom.setValorPorId("CAGENTE_TEXT","");
                        objDom.setValorPorId("CAGENTE","");
                    }
            
                
                }
             
            }            

    </script>
  
  
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  
 
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisctr076" c="FORMCAGENTE" lit="101024" /></c:param>
            <c:param name="producto"><axis:alt f="axisctr076" c="FORMCAGENTE" lit="101024" /></c:param>
            <c:param name="form">axisctr076</c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr076" c="BUSQAGEN" lit="1000234" /></c:param>
                <c:param name="nid" value="axisctr014" />
        </c:import>        



        <!-- Area de campos  -->
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:130px">
            <div class="separador">&nbsp;</div>
            <tr>
                <td>
                    <table class="seccion">
                <tr>
                    <td align="left">
                         <table class="area" align="center">
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:50%;height:0px"></th>
                                <th style="width:10%; height:0px"></th>
                            </tr>
                            <tr>
                            <td></td>
                                <axis:visible f="axisctr076" c="CAGENTE"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr076" c="CAGENTE" lit="100584" /></b>
                                    </td>
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisctr076" c="NOMBRE" lit="105940" /></b>
                                    </td>
                                </axis:visible>
                             </tr>
                             <tr>
                             
                             <td></td>
                                <axis:visible f="axisctr076" c="CAGENTE"> 
                                    <td class="campocaja">
                                        <input type="text" name="CAGENTE_TEXT" id="CAGENTE_TEXT" class="campowidthinput campo campotexto" value="${requestScope.axisctr_agente.CODI}"  style="width:70%"
                                        <axis:atr f="axisctr076" c="CAGENTE" a="formato=entero&modificable=true"/> onchange="f_actualizar_agente()" />
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                    </td>
                                     <td class="campocaja">    
                                        <input <axis:atr f="axisctr076" c="TAGENTE" a="modificable=false"/> class="campowidthinput campo campotexto"
                                        type="text" name="NOMBRE_TEXT" id="NOMBRE_TEXT" value="${requestScope.axisctr_agente.NOMBRE}"/>
                                    </td>
                             </axis:visible>

                             </tr>
                            </table>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
            </table>
                    
                    
                </td>
            </tr>
        </table>			
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr076</c:param><c:param name="f">axisctr076</c:param>
          <c:param name="f">axisctr076</c:param>
            <c:param name="__botones">cancelar,aceptar</c:param>
        </c:import>
    </form>
    
   
 
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>


