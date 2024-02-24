<%
/**
*  Fichero: axissin043.jsp
*  Fecha: 26/11/1907
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<style type="text/css">
.displayspaceGrandeSinBorde {
    width:100%;
    height: expression( this.scrollHeight > 320 ? "420px" : "auto" );  
    max-height:420px;
    overflow-x: hidden;
    overflow-y: auto;
}
</style>


<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    
    <script language="Javascript" type="text/javascript">
        var vcactivi = '';
        function f_onload() {
       
            // Retocar tabla en IE
            if (document.all) // ES Explorer
                document.getElementById("tabla1").style.marginLeft="1.3%";
             
             f_cargar_propiedades_pantalla();
             
        }
        
        function f_but_cerrar() {
            parent.f_cerrar_modal('axissin043');
        }              

        function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "8", "<axis:alt f="axissin043" c="miListaId" lit='1000254' />");                    
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
        }
            
function mostrar(nombreCapa,nombreDIV){ 
  objUtiles.scrollPoll(nombreCapa,nombreDIV);
} 

function ocultar(nombreCapa){             
    document.getElementById(nombreCapa).style.visibility="hidden"; 
} 
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin043" c="TITULO" lit="9902101" /></c:param>
                <c:param name="nid" value="axisctr014" />
            </c:import>
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axissin043" c="FORM" lit="9902101" /></c:param>
                <c:param name="producto"><axis:alt f="axissin043" c="PRODUCTO" lit="9902101"/></c:param>
                <c:param name="form">axissin043</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                            <td colspan="6"> 
                                <c:set var="title1"><axis:alt f="axissin043" c="NUM_SINIESTRO" lit="800279"/></c:set>
                                <c:set var="title2"><axis:alt f="axissin043" c="FECHA_MODIF" lit="9000564"/></c:set>
                                <c:set var="title3"><axis:alt f="axissin043" c="USU_MODIF" lit="9001265"/></c:set>
                                <c:set var="title4"><axis:alt f="axissin043" c="FSINIES" lit="801256"/></c:set>
                                <c:set var="title5"><axis:alt f="axissin043" c="FNOTIFI" lit="9000452"/></c:set>
                                <c:set var="title17"><axis:alt f="axissin043" c="TCAUSIN" lit="100852"/></c:set>
                                <c:set var="title6"><axis:alt f="axissin043" c="DESCULPAB" lit="9902098"/></c:set>
                                <c:set var="title7"><axis:alt f="axissin043" c="DESMEDDEC" lit="9902099"/></c:set>
                                <c:set var="title8"><axis:alt f="axissin043" c="DESTIPDEC" lit="9902100"/></c:set>
                                <c:set var="title9"><axis:alt f="axissin043" c="TMOTSIN" lit="109651"/></c:set>
                                <c:set var="title10"><axis:alt f="axissin043" c="DECLARANTE" lit="9901032"/></c:set>
                                <c:set var="title11"><axis:alt f="axissin043" c="TNOMDEC" lit="105940"/></c:set>
                                <c:set var="title12"><axis:alt f="axissin043" c="TAPE1DEC" lit="108243"/></c:set>
                                <c:set var="title13"><axis:alt f="axissin043" c="TAPE2DEC" lit="108246"/></c:set>                            
                                <c:set var="title14"><axis:alt f="axissin043" c="TSINIES" lit="1000112"/></c:set>
                                <c:set var="title15"><axis:alt f="axissin043" c="NNUMIDE" lit="105330"/></c:set>
                                <c:set var="title16"><axis:alt f="axissin043" c="FEFECTO_MULTI" lit="100883"/></c:set> 
                                <c:set var="title18"><axis:alt f="axissin043" c="TFRAUDE" lit="9902124"/></c:set>
                                <c:set var="title19"><axis:alt f="axissin043" c="CCARPETA" lit="9902601"/></c:set>
                                <c:set var="title20"><axis:alt f="axissin043" c="CAGENTE" lit="100584"/></c:set>
                                <!-- ini bug 0024675 -->
                                <c:set var="title21"><axis:alt f="axissin043" c="CSALVAM" lit="9904530"/></c:set>
                                <c:set var="title22"><axis:alt f="axissin043" c="IPERIT" lit="9903367"/></c:set>
                                
                                <div class="separador">&nbsp;</div>
                                <div class="displayspaceGrandeSinBorde" style="height:300px" id="TRANSF">
                                 <%int contador = 0;%>
                                    <display:table name="${__formdata.miListaId}" id="miListaId" export="false" class="dsptgtable" 
                                     pagesize="-1" defaultsort="1"  sort="list" cellpadding="0" cellspacing="0" 
                                     requestURI="modal_axissin043.do?paginar=true">
                                     <c:set var="contador"><%=contador%></c:set>                                      
                                    <%@ include file="../include/displaytag.jsp"%>
                                       
                                        <display:column title="${title1}" sortable="true" sortProperty="NSINIES" headerClass="headwidth10 sortable"  media="html" autolink="false" >    
                                            <div class="dspNumber">${miListaId['NSINIES']}</div> 
                                        </display:column>
                                    
                                        <axis:visible c="FECHA_MODIF" f="axissin043">
                                            <display:column title="${title2}" sortable="true" sortProperty="FECHA_MODIF" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"> <fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FMODIFI']}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible c="USU_MODIF" f="axissin043">
                                            <display:column title="${title3}" sortable="true" sortProperty="USU_MODIF" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['CUSUMOD']}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible c="FSINIES" f="axissin043">
                                            <display:column title="${title4}" sortable="true" sortProperty="FSINIES" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FSINIES']}"/></div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible c="FNOTIFI" f="axissin043">
                                            <display:column title="${title5}" sortable="true" sortProperty="FNOTIFI" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${miListaId['FNOTIFI']}"/></div>     
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axissin043" c="TCAUSIN" >
                                            <display:column title="${title17}" sortable="true" sortProperty="TCAUSIN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TCAUSIN']}</div>
                                            </display:column>
                                        </axis:visible>
    
                                        <axis:visible f="axissin043" c="TMOTSIN" >
                                            <display:column title="${title9}" sortable="true" sortProperty="TMOTSIN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TMOTSIN']}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axissin043" c="DESCULPAB" >
                                            <display:column title="${title6}" sortable="true" sortProperty="DESCULPAB" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['DESCULPAB']}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axissin043" c="DESMEDDEC" >
                                            <display:column title="${title7}" sortable="true" sortProperty="DESMEDDEC" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['DESMEDDEC']}</div>
                                            </display:column>
                                        </axis:visible>
                                        
                                        <axis:visible f="axissin043" c="DESTIPDEC" >
                                            <display:column title="${title8}" sortable="true" sortProperty="DESTIPDEC" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['DESTIPDEC']}</div>
                                            </display:column>
                                        </axis:visible> 
                                        <axis:visible f="axissin043" c="TFRAUDE" >
                                            <display:column title="${title18}" sortable="true" sortProperty="TFRAUDE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TFRAUDE']}</div>
                                            </display:column>
                                        </axis:visible> 
                                        
                                         <axis:visible f="axissin043" c="CAGENTE" >
                                            <display:column title="${title20}" sortable="true" sortProperty="TFRAUDE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${miListaId['TAGENTE']}</div>
                                            </display:column>
                                        </axis:visible> 
                                        <%--axis:visible f="axissin043" c="CCARPETA" >
                                            <display:column title="${title19}" sortable="true" sortProperty="CCARPETA" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                 <div class="dspIcons">
                                                            <input onclick="" disabled="true"
                                                            type="checkbox" id="CCARPETA_AUX" name="CCARPETA_AUX" value="${miListaId['CCARPETA']}"  <c:if test="${miListaId['CCARPETA'] == 1}">checked</c:if>/>
                                                </div>
                                            </display:column>
                                        </axis:visible--%> 
                                        
                                        <axis:visible f="axissin043" c="BT_MASDATOS_EXTSEG">
                                            <display:column title="" sortable="true" sortProperty="" headerClass="sortable fixed" media="html" style="width:5%" autolink="false" >
                                                <div class="dspIcons">
                                                    <img border="0" alt="<axis:alt c="BT_MASDATOS_EXTSEG" f="axissin043" lit="1000113"/>" title1="<axis:alt c="BT_MASDATOS_EXTSEG" f="axissin043" lit="1000113"/>" src="images/mes.gif" width="11px" height="11px"
                                                                    style="cursor:pointer;"  onmouseout="javascript:ocultar('SECCION_${contador}')"  onmouseover="javascript:mostrar('SECCION_${contador}','TRANSF')"  />
                                                </div>
                                            </display:column>   
                                        </axis:visible>
                                    
                                        <!-- *************************** SECCION MÁS DATOS ********************************* -->
                                        <display:column class="seccion_informacion">
                                    
                                            <div id="SECCION_${contador}" class="seccion_informacion" style="height:auto;" >
                                                <table class="area" id="ivan" align="center">
                                                     <tr>
                                                        <th style="width:25%;height:0px"></th>
                                                        <th style="width:25%;height:0px"></th>
                                                        <th style="width:25%;height:0px"></th>
                                                        <th style="width:25%;height:0px"></th>    
                                                     </tr>
													<axis:visible f="axissin043" c="DECLARANTE"> 
                                                    <tr>
                                                        <td style="background-color:#FFFFFF;border: 0px solid #FFFFFF;">
                                                            <b id="label_DECLARANTE">${title10}</b>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background-color:#FFFFFF;border: 0px solid #FFFFFF;">
                                                            &nbsp;
                                                        </td>
                                                    </tr>
													</axis:visible>
                                                    <tr>
                                                        <axis:visible f="axissin043" c="NNUMIDE">
                                                        <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                            <b>${title15}</b>
                                                        </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="TNOMDEC">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b>${title11}</b>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="TAPE1DEC">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b>${title12}</b>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="TAPE2DEC">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b>${title13}</b>
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axissin043" c="NNUMIDE">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                <input type="text" class="campo campotexto" id="NNUMIDE" name="NNUMIDE"  style="width:100%"
                                                                       value="${miListaId['NNUMIDE']}" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="TNOMDEC">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                <input type="text" class="campo campotexto" id="TNOMDEC" name="TNOMDEC"  style="width:100%"
                                                                       value="${miListaId['TNOMDEC']}" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="TAPE1DEC">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                <input type="text" class="campo campotexto" id="TAPE1DEC" name="TAPE1DEC"  style="width:100%"
                                                                       value="${miListaId['TAPE1DEC']}" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="TAPE2DEC">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                <input type="text" class="campo campotexto" id="TAPE2DEC" name="TAPE2DEC"  style="width:100%"
                                                                       value="${miListaId['TAPE2DEC']}" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axissin043" c="TSINIES">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;" colspan="4">
                                                                <b>${title14}</b>
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axissin043" c="TSINIES">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;" colspan="4">
                                                                <textarea class="campo campotexto" style="width:100%;" name="TSINIES" id="TSINIES" style="width:100%" readonly="readonly">${miListaId['TSINIES']}</textarea>       
                                                            </td>
                                                        </axis:visible>
                                                    </tr>    
                                                    <tr>
                                                        <axis:visible f="axissin043" c="CCARPETA">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b>${title19}</b>
                                                            </td>
                                                        </axis:visible>
                                                         <axis:visible f="axissin043" c="CSALVAM">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b>${title21}</b>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="IPERIT">
                                                            <td class="titulocaja" style="background-color:#E6FFCC;border: 1px solid #DDDDDD;">
                                                                <b>${title22}</b>
                                                            </td>
                                                        </axis:visible>
                                                    </tr>
                                                    <tr>
                                                        <axis:visible f="axissin043" c="CCARPETA">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;" >
                                                                <input onclick="" disabled="true"
                                                                type="checkbox" id="CCARPETA_AUX" name="CCARPETA_AUX" value="${miListaId['CCARPETA']}"  <c:if test="${miListaId['CCARPETA'] == 1}">checked</c:if>/>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="CSALVAM">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;" >
                                                                <input onclick="" disabled="true"
                                                                type="checkbox" id="CSALVAM_AUX" name="CSALVAM_AUX" value="${miListaId['CSALVAM']}"  <c:if test="${miListaId['CSALVAM'] == 1}">checked</c:if>/>
                                                            </td>
                                                        </axis:visible>
                                                        <axis:visible f="axissin043" c="IPERIT">
                                                            <td class="campocaja" style="background-color:white;border-right-width: 0px;">
                                                                <input type="text" class="campo campotexto" id="IPERIT" name="IPERIT"  style="width:100%"
                                                                       value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${miListaId['IPERIT']}"/>" readonly="readonly"/>                                                      
                                                            </td>
                                                        </axis:visible>
                                                    </tr>   
                                                </table>
                                            </div>
                                        </display:column>
                                        <%contador++;%>
                                    </display:table>
                                </div> 
                            
                            </td>
                        </tr>
            </table>
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin043</c:param><c:param name="__botones">cerrar</c:param></c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

