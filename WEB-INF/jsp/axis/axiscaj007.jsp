<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp"/>        
        <script type="text/javascript">
        
            function f_onload() {
                f_cargar_propiedades_pantalla();
              <% if (request.getAttribute("__formdata") != null )
                {  %>
                    var SPERSON = "${__formdata.SPERSON}";
                    if (!objUtiles.estaVacio(SPERSON)) {
                        $("#pSPERSON").val(SPERSON);
                    }
             <% }  %>  
            }
            
            function f_aceptar_modal(pantalla){
                f_cerrar_modal(pantalla);
                objUtiles.ejecutarFormulario("axis_axiscaj007.do", "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_modal(pantalla, param){
                f_cerrar_modal(pantalla);
               objUtiles.ejecutarFormulario("axis_axiscaj007.do?"+param, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
    
            function f_abrir_modal(cual, noXButton, optionalQueryString) {
              
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";
                
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
            }
            
            function f_aceptar_axisper001 (selectedPerson){
                $("#SPERSON").val(selectedPerson);
                f_cerrar_modal("axisper008");
                objUtiles.ejecutarFormulario("axis_axiscaj007.do?SPERSON="+selectedPerson, "form", document.miForm, "ftrabajo", objJsMessages.jslit_cargando);
            }
            
            function f_aceptar_axisper010(selectedPerson,selectedagent){
                $("#SPERSON").val(selectedPerson);
                objUtiles.cerrarModal("axisper010");
                objUtiles.ejecutarFormulario("axis_axiscaj007.do?&SPERSON="+selectedPerson+"&CAGENTEselected="+selectedagent, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
            }
            
            function f_cerrar_axisper008(){
                objUtiles.cerrarModal("axisper008");
            }            
            
            function f_but_nueva_persona() {
                f_abrir_axisper005();
            }
            
            function  f_abrir_axisper005() {
                objUtiles.cerrarModal("axisper001");
                objUtiles.abrirModal("axisper005", "src", "modal_axisper005.do?operation=form&faceptar=f_aceptar_axisper005"+"&ORIGEN=AXISPRF001" );
            }
            
            function f_abrir_axisper010NOU(isNew){
                f_cerrar_axisper008();
                objDom.setVisibilidadPorId('but_cerrar_modal_axisper010', 'hidden');
                objUtiles.abrirModal("axisper010","src","modal_axisper010.do?operation=form&isNew="+isNew);
            }  
            
        function  f_cerrar_axisper010(isNew){
            objUtiles.cerrarModal('axisper010');
          }
            
            function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
            }      
            
            function f_but_cancelar(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj007", "cancelar", document.miForm, "_self");            
            }
            
            function f_but_aceptar(){
                objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axiscaj007", "cancelar", document.miForm, "_self");            
            }
            
            function f_post_cierre_modalaxiscaj011(){
                 objUtiles.cerrarModal("axiscaj011");
                 f_but_buscar();
            }
            
            function f_but_buscar() {
                if (objValidador.validaEntrada()) {
                    objUtiles.ejecutarFormulario("axis_axiscaj007.do","busqueda_cheques",document.miForm, "_self", objJsMessages.jslit_cargando);   
                }
            }
             function f_but_9001333() {
                objDom.setValorPorId ("TNOMBRE", "");
                objDom.setValorPorId ("NNUMIDE", "");
                objDom.setValorPorId ("SPERSON", "");
                objDom.setValorPorId ("CCHEQUE", "");
                 
            }
            function f_but_9000552(){
          
                if (!objUtiles.estaVacio($("#HNCHEQUE").val())|| !objUtiles.estaVacio($("#HSCAJA").val())){
                //  objUtiles.ejecutarFormulario("axis_axiscaj007.do","m_listar_estados",document.miForm,objJsMessages.jslit_cargando);
              var query= "FFECHAC="+$("#HFECHA").val()+
                                                    "&CCHEQUE="+$("#HNCHEQUE").val()+
                                                    "&NNUMIDE="+$("#HRUT").val()+
                                                    "&TNOMBRE="+$("#HNOMBRE").val()+
                                                    "&HCESTADO="+$("#HCESTADO").val()
                                                    +"&HSCAJA="+$("#HSCAJA").val()
                                                    +"&HNUMLIN="+$("#HNNUMLIN").val();
                /*    f_abrir_modal("axiscaj011",null,"&FFECHAC="+$("#HFECHA").val()+
                                                    "&CCHEQUE="+$("#HNCHEQUE").val()+
                                                    "&NNUMIDE="+$("#HRUT").val()+
                                                    "&TNOMBRE="+$("#HNOMBRE").val()+
                                                    "&HCESTADO="+$("#HCESTADO").val()
                                                    +"&HSCAJA="+$("#HSCAJA").val());*/
                 objUtiles.abrirModal("axiscaj011", "src", "modal_axiscaj011.do?operation=form&"+query );
                  }
                 
                
            }
           
          function f_seleccionar_cheque_abre_modal(ncheque,rut,nombre,cestado,fecha,scaja,nnumlin){   
            objDom.setValorPorId ("HNCHEQUE", ncheque);
            objDom.setValorPorId ("HRUT", rut);
             objDom.setValorPorId ("HNOMBRE", nombre);
             objDom.setValorPorId ("HCESTADO", cestado);
              objDom.setValorPorId ("HFECHA", fecha);
               objDom.setValorPorId ("HSCAJA", scaja);
               objDom.setValorPorId ("HNNUMLIN", nnumlin);
             f_but_9000552();
        }
        
        function f_seleccionar_cheque(ncheque,rut,nombre,cestado,fecha,scaja){   
            objDom.setValorPorId ("HNCHEQUE", ncheque);
            objDom.setValorPorId ("HRUT", rut);
             objDom.setValorPorId ("HNOMBRE", nombre);
             objDom.setValorPorId ("HCESTADO", cestado);
              objDom.setValorPorId ("HFECHA", fecha);
               objDom.setValorPorId ("HSCAJA", scaja);
        }
       </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>

    <form name="miForm" action="axis_axiscaj007.do" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="SPERSON" name="SPERSON" value="${__formdata.SPERSON}"/>
            <input type="hidden" id="HRUT" name="HRUT" value=""/>
            <input type="hidden" id="HNOMBRE" name="HNOMBRE" value=""/>
            <input type="hidden" id="HNCHEQUE" name="HNCHEQUE" value=""/>
            <input type="hidden" id="HSCAJA" name="HSCAJA" value=""/>
             <input type="hidden" id="HCESTADO" name="HCESTADO" value=""/>
             <input type="hidden" id="HFECHA" name="HFECHA" value=""/>
             <input type="hidden" id="HSCAJA" name="HSCAJA" value=""/>
             <input type="hidden" id="HNNUMLIN" name="HNNUMLIN" value=""/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="form" f="axiscaj007" lit="9905828"/></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj007" lit="9905827"/></c:param>
                <c:param name="form">axiscaj007</c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscaj011|<axis:alt f="axiscaj007" c="MODAL_AXISCAJ011" lit="9905095" /></c:param>
            </c:import> 
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper008|<axis:alt f="axiscaj007" c="MODAL_AXISPER008" lit="1000235" /></c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axisper010|<axis:alt f="axiscaj007" c="MODAL_AXISPER010" lit="110275" /></c:param>
            </c:import>
            <axis:visible c="DSP_CUENTAS" f="axiscaj007"> 
              <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                <td>
                <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axiscaj007" c="LIT32" lit="9905087"/></b>
                        </div>     
                <table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:30%;height:0px"></th>
                    <th style="width:10%;height:0px"></th>
                    <th style="width:40%;height:0px"></th>
                 </tr>
                 <tr>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj007" c="TIT_CCHEQUE" lit="9905071"/></b>
                    </td>
                </tr>
                 <tr>
                    <td>
                        <input type="text" class="campo campotexto" value="${__formdata.CCHEQUE}"  name="CCHEQUE" id="CCHEQUE" size="15"
                               style="width:50%" onkeypress="if (event.keyCode==13)  { f_but_buscar() }"/>
                    </td>
                </tr>
                <tr>
                    <td class="titulocaja">
                        <div class="separador">&nbsp;</div> 
                        <b><axis:alt f="axiscaj007" c="TIT_NNUMIDE" lit="9903661"/></b>
                    </td>
                    <td class="titulocaja">
                        <b><axis:alt f="axiscaj007" c="TIT_TNOMBRE" lit="9905826"/></b>
                    </td>
                </tr>
                  
                 <tr>
                    <td>
                        <input type="text" class="campo campotexto" name="NNUMIDE" id="NNUMIDE" size="15" style="width:50%" value="${__formdata.NNUMIDE}"
                               disabled />
                    </td>
                    <td>
                        <input type="text" class="campo campotexto" name="TNOMBRE" id="TNOMBRE" size="15" value="${__formdata.TNOMBRE}"
                               disabled />
                    </td>
                    <td><img id="findTarifa" border="0" src="images/find.gif" onclick="f_abrir_modal('axisper008',null,null);"</td>
                </tr>
                <c:import url="../include/botonera_nt.jsp">              
                <c:param name="__botones"><axis:ocultar f="axiscaj007" c = "BT_9001333" dejarHueco="false">9001333</axis:ocultar>,<axis:ocultar f="axiscaj007" c = "BT_BUSCAR" dejarHueco="false">buscar</axis:ocultar></c:param>
               </c:import>
               <tr>
                    <td colspan="4">
                       <div class="separador">&nbsp;</div>            
                       <div class="titulo">
                              <img src="images/flecha.gif"/><b><axis:alt f="axiscaj007" c="LIT32" lit="1000345"/></b>
                        </div>                        
                        <table class="seccion">         
                          <tr><td>
                                       <c:set var="title0"><axis:alt f="axiscaj007" c="CCHEQUE" lit="9905071"/></c:set>
                                       <c:set var="title1"><axis:alt f="axiscaj007" c="NNUMIDE" lit="9903067"/></c:set>
                                       <c:set var="title2"><axis:alt f="axiscaj007" c="TNOMBRE" lit="9905826"/></c:set>
                                       <c:set var="title3"><axis:alt f="axiscaj007" c="CESTADO" lit="9002027"/></c:set>
                                       <c:set var="title4"><axis:alt f="axiscaj007" c="FFECHA" lit="100562"/></c:set>
                               </td>
                               <td>
                              <div class="seccion">
                                <display:table name="${sessionScope.axiscaj007_listaCheques}"
                                               id="miListaId" export="false"
                                               class="dsptgtable" pagesize="15"
                                               defaultsort="1"
                                               defaultorder="ascending"
                                               sort="list" cellpadding="0"
                                               cellspacing="0"
                                               requestURI="axis_axiscaj007.do?paginar=true">
                                  <%@ include file="../include/displaytag.jsp"%>
                                  <display:column sortable="true"
                                                  sortProperty=""
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false" style="width:4%">
                                    <div class="dspText">
                                    <input type="radio" id="CCHEQUE_sel" name="CCHEQUE_sel" value="${miListaId['NCHEQUE']}"
                                    onclick='javascript:f_seleccionar_cheque("${miListaId['NCHEQUE']}","${miListaId['RUT']}","${fn:trim(fn:escapeXml(miListaId['NOMBRE']))}","${miListaId['CESTADO']}","${miListaId['FECHA']}","${miListaId['SCAJA']}","${miListaId['NNUMLIN']}")'
                                    class="CCHEQUE_sel"/>
                                    </div>
                                  </display:column>
                                  <axis:visible f="axiscaj007" c="SSERVIC">
                                   <display:column title="${title0}"
                                                  sortable="true"
                                                  sortProperty="NCHEQUE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <a href='javascript:f_seleccionar_cheque_abre_modal("${miListaId['NCHEQUE']}","${miListaId['RUT']}","${fn:trim(fn:escapeXml(miListaId['NOMBRE']))}","${miListaId['CESTADO']}","${miListaId['FECHA']}","${miListaId['SCAJA']}","${miListaId['NNUMLIN']}")'>${miListaId['NCHEQUE']}</a></div>
                                    </div>
                                  </display:column>
                                  </axis:visible>
                                  <display:column title="${title1}"
                                                  sortable="true"
                                                  sortProperty="RUT"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     <a href='javascript:f_seleccionar_cheque_abre_modal("${miListaId['NCHEQUE']}","${miListaId['RUT']}","${fn:trim(fn:escapeXml(miListaId['NOMBRE']))}","${miListaId['CESTADO']}","${miListaId['FECHA']}","${miListaId['SCAJA']}","${miListaId['NNUMLIN']}")'>${miListaId['RUT']}</a></div>    
                                    
                                  </display:column>
                                  <display:column title="${title2}"
                                                  sortable="true"
                                                  sortProperty="NOMBRE"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                     <a href='javascript:f_seleccionar_cheque_abre_modal("${miListaId['NCHEQUE']}","${miListaId['RUT']}","${fn:trim(fn:escapeXml(miListaId['NOMBRE']))}","${miListaId['CESTADO']}","${miListaId['FECHA']}","${miListaId['SCAJA']}","${miListaId['NNUMLIN']}")'>${miListaId['NOMBRE']}</a></div>   
                                    </div>
                                  </display:column>
                                  <display:column title="${title3}"
                                                  sortable="true"
                                                  sortProperty="ESTADO"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                    <a href='javascript:f_seleccionar_cheque_abre_modal("${miListaId['NCHEQUE']}","${miListaId['RUT']}","${fn:trim(fn:escapeXml(miListaId['NOMBRE']))}","${miListaId['CESTADO']}","${miListaId['FECHA']}","${miListaId['SCAJA']}","${miListaId['NNUMLIN']}")'> ${miListaId['ESTADO']}</a></div>   
                                   
                                  </display:column>
                                  <display:column title="${title4}"
                                                  sortable="true"
                                                  sortProperty="FECHA"
                                                  headerClass="sortable fixed"
                                                  media="html" autolink="false">
                                    <div class="dspText">
                                   <a href='javascript:f_seleccionar_cheque_abre_modal("${miListaId['NCHEQUE']}","${miListaId['RUT']}","${fn:trim(fn:escapeXml(miListaId['NOMBRE']))}","${miListaId['CESTADO']}","${miListaId['FECHA']}","${miListaId['SCAJA']}","${miListaId['NNUMLIN']}")'>  <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FECHA']}"/></a></div>   
                                   </display:column>
                                </display:table>
                                <br>
                                </td></tr>
                        </table>
                    </td>
                </tr>
            </table>
        </axis:visible>    
        <div class="separador">&nbsp;</div>   
        <div class="separador">&nbsp;</div>
        <div class="separador">&nbsp;</div>
    </form>    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axiscaj007</c:param>
       <c:param name="__botones"><axis:ocultar f="axiscaj007" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:visible f="axiscaj007" c="BT_9000552"><c:if test="true">,9000552</c:if></axis:visible></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />    
</body>
</html>


