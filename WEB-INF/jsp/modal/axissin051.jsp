<%--
/**
*  Fichero: axissin051.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
*  
*  T?tulo: Modal modificar datos DESTINATARIOS  
*
*  Fecha: 19/02/2009
*/
--%>


<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt c='TITLE' f='axissin051' lit='151090'/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
    
    function f_onload() { 
            
            var val1 = "${__formdata.val1}";
            var NSINIES = "${__formdata.NSINIES}";
            
            if (val1=="OK"){
                parent.f_aceptar_axissin051(NSINIES); //TODO: Dato EJ. para volver a la pantalla
                this.f_but_cancelar();
            }
            
            
             if (objDom.getValorPorId("MODO")=='2'){
                    setWindowsReadOnly();
                }
             f_cargar_propiedades_pantalla();   
     }
        
	 function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listvalores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listvalores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
        }        

      function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAISRE");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin051.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAISRE", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                
            }
        }        

        function callbackajaxdireccion (ajaxResponseText){
        try{
                 var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAISRE", "");
                            
                        }else{
                            objDom.setValorPorId("CPAISRE", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                            }
                        }
                    }
                }
                 
   
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }        
        
        function f_but_aceptar(){
            objUtiles.ejecutarFormulario ("modal_axissin051.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin051");
        }
        function f_recargar(thiss){
        if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'CTIPDES')){
        objDom.setValorPorId("SPERSON",'');
        objDom.setValorPorId("SNIP",'');
        if (!objUtiles.estaVacio( objDom.getValorPorId("NOMBRE") )){
            objDom.setValorPorId("NOMBRE",'');
            objDom.setValorPorId("NNUMIDE",'');
            
        }
        
        }

           if (!objUtiles.estaVacio(thiss) && objUtiles.utilEquals(thiss.id,'BANC')){
                var CBANCAR = objUtiles.utilSplit(thiss.value, "/")[0]; // CBANCAR
                var CTIPBAN = objUtiles.utilSplit(thiss.value, "/")[1]; // CTIPBAN
                objDom.setValorPorId("CBANCAR", CBANCAR);
                objDom.setValorPorId("CTIPBAN", CTIPBAN);
            }             
        
            objUtiles.ejecutarFormulario ("modal_axissin051.do", "recargar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }   
        
        
        
/*axisper021 i axisper022x*/

      function f_abrir_axisper021 (PERSONA) {
            
            objDom.setValorPorId("IDEPERSONA", PERSONA);
            objUtiles.abrirModal("axisper021", "src", "modal_axisper021.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value);
      }
      function f_cerrar_axisper022(){
      f_cerrar_modalespersona("axisper022");
      }          
      function f_cerrar_axisper021(){
      f_cerrar_modalespersona("axisper021");
      }   
      function f_nova_persona(){
      f_cerrar_modalespersona("axisper021");
      objUtiles.abrirModal("axisper022","src","modal_axisper022.do?operation=form&MODO_SWPUBLI=PERSONAS_PUBPRIV&CAGENTE="+document.miForm.CAGENTE.value);  
      }
      function f_cerrar_modalespersona(modal){
      objUtiles.cerrarModal(modal);
      } 
      
      function f_aceptar_persona(SPERSON,CAGENTE, SNIP, modal){
        
        f_cerrar_modalespersona(modal);
        var porigen = 'INT';
        if (modal =='axisper022')
         porigen = 'NUEVO';
    
        var IDEPERSONA = document.miForm.IDEPERSONA.value;
       
        document.miForm.ORIGEN.value = porigen;
        document.miForm.CAGENTE_VISIO.value = CAGENTE;
        
        if (IDEPERSONA == 1){
            document.miForm.SNIP.value = SNIP;
            document.miForm.SPERSON.value = SPERSON;}
        else{
            document.miForm.SNIPABOGADO.value = SNIP;
            document.miForm.ABOGADO.value = SPERSON;
        }
         if (!objUtiles.estaVacio(SPERSON) ){
            objUtiles.ejecutarFormulario ("modal_axissin051.do?CAGE="+document.miForm.CAGENTE.value, "traspasar", document.miForm, "_self", objJsMessages.jslit_cargando);   
        }
      }
      
      function setWindowsReadOnly(){
                objDom.setVisibilidadPorId("but_aceptar", "hidden");
                var inputs=document.getElementsByTagName("input");
                for (i=0;i<inputs.length;i++) {
                    if ((inputs[i].id != null) && (inputs[i].id != "")&& (inputs[i].id != "but_cancelar")){
                        objDom.setDisabledPorId(inputs[i].id, true);
                        inputs[i].setAttribute("obligatorio", "false");
                    }
                }
    }
    
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_022" f="axissin051" lit="1000214"/></c:param>
                <c:param name="nid" value="axisper022"/>
            </c:import> 
                        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt c="TITULO_021" f="axissin051" lit="1000235"/></c:param>
                <c:param name="nid" value="axisper021"/>
            </c:import>    
    <!-- MODAL -->
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
        </c:import>            
        <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo"><axis:alt c="TITULO_014" f="axissin051" lit="1000235"/></c:param>
        <c:param name="nid" value="axisper014" />
        </c:import>         
    <form name="miForm" action="modal_axissin051.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    
    <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" name="CAGENTE" value="${__formdata.CAGENTE}"/>
    <input type="hidden" name="CAGENTE_VISIO" value="${__formdata.CAGENTE_VISIO}"/>
    <input type="hidden" name="SNIP" value="${__formdata.SNIP}"/>
    <input type="hidden" name="SNIPABOGADO" value="${__formdata.SNIPABOGADO}"/>
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="tramitaciones_destinatarios"/>
    <input type="hidden" name="isNew" value="${__formdata.isNew}"/>
    <input type="hidden" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    
    <input type="hidden" name="SPRODUC"  value="${__formdata.SPRODUC}" />
    <input type="hidden" name="CACTIVI"  value="${__formdata.CACTIVI}" />
    <input type="hidden" name="CTRAMIT"  value="${__formdata.CTRAMIT}" />
    <input type="hidden" name="CCAUSIN"  value="${__formdata.CCAUSIN}" />
    <input type="hidden" name="CMOTSIN"  value="${__formdata.CMOTSIN}" />
    
    
    <input type="hidden" name="IDEPERSONA"  value="${__formdata.IDEPERSONA}" />
    <input type="hidden" name="NTIPODEM2"  value="${__formdata.NTIPODEM}" />
    <input type="hidden" name="NLINDEM"  value="${__formdata.NLINDEM}" />
    <input type="hidden" name="MODO" id="MODO" value="${__formdata.MODO}"/>
    
    
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt c="TITULO" f="axissin051" lit="9903435"/></c:param>
        <c:param name="formulario"><axis:alt c="TITULO" f="axissin051" lit="9903435"/></c:param>
        <c:param name="form">axissin051</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin017" lit="9903435" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                    <tr>
                        <th style="width:1%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:24%;height:0px"></th>
                    </tr>
                    <tr>
                        <td></td>
                        <axis:ocultar f="axissin051" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="LIT_SPERSON" lit="9903434"/></b>                                
                        </td>
                        </axis:ocultar>
                        
                    </tr>
                    <tr>
                        <td></td>
                        <td class="campocaja">
                           <select name = "NTIPODEM" id="NTIPODEM "  size="1"  class="campowidthselect campo campotexto" 
                                alt="<axis:alt c="NTIPODEM " f="axissin051" lit="9000974" />" title="<axis:alt c="NTIPODEM " f="axissin051" lit="9000974" />"
                                <axis:atr f="axissin051" c="NTIPODEM" a="modificable=false&obligatorio=true&isInputText=false"/>> 
                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt c="BLANCO" f="axissin051" lit="1000348"/> - </option>
                                <c:forEach var="reclam" items="${__formdata.listvalores.lsttipdeman}">
                                    <option value = "${reclam.CATRIBU}"
                                        <c:if test="${reclam.CATRIBU == __formdata.NTIPODEM }">selected</c:if>>
                                        ${reclam.TATRIBU}
                                    </option>
                                </c:forEach>
                            </select>  
                        </td>
                    </tr>
                    <tr>
                        <td></td>
                      <axis:ocultar f="axissin051" c="SPERSON" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="LIT_SPERSON" lit="105330"/></b><!-- Document -->                                
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin051" c="NOMBRE" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="LIT_NOMBRE" lit="105940"/></b><!-- Nombre -->                                
                        </td>
                        </axis:ocultar>
                        
                    </tr>
                    
                    <tr>
                        <td></td>
                        <axis:ocultar f="axissin051" c="SPERSON" dejarHueco="false">
                        <td class="campocaja">
                        <input type="hidden" name="SPERSON" id="SPERSON" value="${__formdata.SPERSON}" class="campowidthinput campo campotexto" style="width:75%"
                            <axis:atr f="axissin051" c="SPERSON" a="modificable=true"/> /> 
                            <input type="text" name="NNUMIDE" value="${__formdata.NNUMIDE}" class="campowidthinput campo campotexto_ob" style="width:75%"
                            <axis:atr f="axissin051" c="NNUMIDE" a="modificable=false"/> /> 
                           <c:if test="${__formdata.MODO == 1}"> 
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021(1)" style="cursor:pointer"/>  
                            </c:if>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin051" c="NOMBRE" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                            <input type="text" name="NOMBRE" value="${__formdata.NOMBRE}" class="campowidthinput campo campotexto_ob" style="width:90%"
                            <axis:atr f="axissin012" c="NOMBRE" a="modificable=false"/> /> 
                        </td>
                        <td></td>
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <td></td>
                        <axis:ocultar f="axissin051" c="NPROCEDI" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="NPROCEDI" lit="9902763"/></b>                                
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin051" c="COMPANI" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="COMPANI" lit="9000600"/></b>                                
                        </td>
                        </axis:ocultar>
                        
                    </tr>
                    <tr>
                        <td></td>
                       <axis:ocultar f="axissin051" c="NPROCEDI">
                            <td class="campocaja" >
                                <input type="text" class="campo campotexto" id="NPROCEDI" name="NPROCEDI" size="15" style="width:90%"
                                    <axis:atr f="axissin051" c="NPROCEDI" a="obligatorio=false"/> value="${__formdata.NPROCEDI}"  
                                        title="<axis:alt f="axissin051" c="NPROCEDI" lit="9902763"/>"/>
                            </td>
                        </axis:ocultar>
                    
                        <axis:ocultar f="axissin051" c="COMPANI">
                            <td class="campocaja" colspan="2"> 
                                 <input type="text" class="campo campotexto" id="COMPANI" name="COMPANI" size="15"
                                    <axis:atr f="axissin051" c="COMPANI" a="obligatorio=false"/> value="${__formdata.COMPANI}"
                                        title="<axis:alt f="axissin051" c="COMPANI" lit="9000600"/>"/>
                            </td>
                        </axis:ocultar>
                    </tr>
                
                </table>
            </td>
        </tr>
        <tr>
            <td>
                <div class="separador">&nbsp;</div>
                <div class="titulo"> 
                    <img  src="images/flecha.gif"/>
                    <axis:alt c="flecha" f="axissin017" lit="9903414" /> 
                </div>  
                <div class="separador">&nbsp;</div>
                <table class="seccion">
                    <tr>
                        <th style="width:1%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:24%;height:0px"></th>
                    </tr>
                   
                    <tr>
                        <td></td>
                      <axis:ocultar f="axissin051" c="NNUMIDEABOGADO" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="NNUMIDEABOGADO" lit="105330"/></b>                              
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin051" c="NOMBREABOGADO" dejarHueco="false">
                        <td class="titulocaja">
                                <b><axis:alt f="axissin051" c="NOMBREABOGADO" lit="105940"/></b>                               
                        </td>
                        </axis:ocultar>
                        <td></td>
                        <td></td>
                    </tr>
                    
                    <tr>
                        <td></td>
                        <axis:ocultar f="axissin051" c="NNUMIDEABOGADO" dejarHueco="false">
                        <td class="campocaja" >
                            <input type="hidden" name="ABOGADO" id="ABOGADO" value="${__formdata.ABOGADO}" class="campowidthinput campo campotexto" style="width:90%"
                                <axis:atr f="axissin051" c="ABOGADO" a="modificable=true"/> /> 
                            <input type="text" name="NNUMIDEABOGADO" value="${__formdata.NNUMIDEABOGADO}" class="campowidthinput campo campotexto" style="width:75%"
                                <axis:atr f="axissin051" c="NNUMIDEABOGADO" a="modificable=false"/> /> 
                            <c:if test="${__formdata.MODO == 1}"> 
                            <img id="find" border="0" src="images/find.gif" onclick="f_abrir_axisper021(2)" style="cursor:pointer"/>  
                            </c:if>
                        </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin051" c="NOMBREABOGADO" dejarHueco="false">
                        <td class="campocaja" colspan="2">
                            <input type="text" name="NOMBREABOGADO" id="NOMBREABOGADO" value="${__formdata.NOMBREABOGADO}" class="campowidthinput campo campotexto" style="width:90%"
                                <axis:atr f="axissin012" c="NOMBREABOGADO" a="modificable=false"/> /> 
                        </td>
                        <td></td>
                        </axis:ocultar>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin051</c:param><c:param name="__botones">cancelar,aceptar</c:param></c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>