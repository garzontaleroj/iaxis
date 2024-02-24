<%/*
*  Fichero: axispro041.jsp
*
*  @author <a href="mailto:amartinez@csi-ti.com">Alex Martinez</a>
*  Fecha: 06/04/2010
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        
        function f_but_salir() {
           parent.f_cerrar_modal("axispro041");
        }
        
        function f_onload(){
        
            var ok = "${OK}";
            if (ok == 1)
                parent.f_aceptar_axispro041();
            
          /*
            var modo = "${__formdata.MODO}";
            if (modo == 'ACT' || modo == 'GAR'){
                objDom.setDisplayPorId("TPREGUNACT","block");
                objDom.setDisplayPorId("TPREGUNACT","none");
                objDom.setDisplayPorId("PREGUNACT","block");
                objDom.setDisplayPorId("PREGUNACT","none");
            }*/
            
            revisarEstilos();
            f_cargar_propiedades_pantalla();
        }
        
        function f_abrir_modal() {
            objUtiles.abrirModal("axispro042", "src", "modal_axispro042.do?operation=form");        
        }
        
      
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        }
        
        function f_aceptar_axispro042(CPREGUN){
            f_cerrar_modal("axispro042");
            objDom.setValorPorId("CPREGUN",CPREGUN);
            f_get_textopreg();
        }
        
        function f_get_textopreg(){
            objUtiles.ejecutarFormulario("modal_axispro041.do", "buscarpreg", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada())
                objUtiles.ejecutarFormulario("modal_axispro041.do", "guardarpreg", document.miForm, "_self", objJsMessages.jslit_cargando);            
        }
           
    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="titulo">
            <axis:alt f="axispro041" c="tpantalla" lit="9901152"/>
        </c:param>
        <c:param name="nid" value="axispro042"/>
    </c:import>
    
    <form name="miForm" action="modal_axispro041.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axispro041" c="tformulario" lit="9901125"/></c:param>
            <c:param name="form">axispro041</c:param>
            <c:param name="titulo"><axis:alt f="axispro041" c="ttitulo" lit="9901125"/></c:param>
        </c:import>

        <input type="hidden" id="CTIPPRE" name="CTIPPRE" value="${__formdata.CTIPPRE}"/>
        <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
        <input type="hidden" id="CACTIVI" name="CACTIVI" value="${__formdata.CACTIVI}"/>
        <input type="hidden" id="CGARANT" name="CGARANT" value="${__formdata.CGARANT}"/>
    
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>
                    <table class="seccion">
                        <tr>
                            <th style="width:2%;height:0px"></th>
                            <th style="width:5%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                            <th style="width:20%;height:0px"></th>
                            <th style="width:15%;height:0px"></th>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="tcpregun" lit="1000109" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="ttpregun" lit="102738" /></b>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" class="campowidthinput campo campotexto_ob" value="${__formdata.CPREGUN}" name="CPREGUN" id="CPREGUN" style="width:75px" size="15" onchange="f_get_textopreg()" obligatorio="true"/>
                            </td>
                            <td class="campocaja" colspan="4">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.TPREGUN}" name="TPREGUN" id="TPREGUN" size="15" readonly="true" style="width:90%"/>
                                <img id="find" border="0" src="images/find.gif" onclick="f_abrir_modal()" style="cursor:pointer"/> 
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t1" lit="500102" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t2" lit="100565" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t3" lit="112347" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t4" lit="111496" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t5" lit="1000487" /></b>
                            </td>
                            <c:if test="${__formdata.CTIPPRE >= 1 && __formdata.CTIPPRE <= 3}">
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro041" c="ttippre" lit="9901127" /></b>
                                </td>
                            </c:if>
                            
                        </tr>
                        <tr>
                            <td></td>
                            <td class="campocaja">
                                <input type="text" title="<axis:alt f="axispro041" c="tnpreord" lit="500102" />" class="campowidthinput campo campotexto" value="${__formdata.NPREORD}" 
                              <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="true"</c:if>   name="NPREORD" id="NPREORD" size="15"/>
                            </td>
                            <td class="campocaja">
                                <select name = "CPRETIP" id="CPRETIP" title="<axis:alt f="axispro041" c="tcpretip" lit="100565" />"  size="1" style="width:80%"
                                    <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="true"</c:if>  class="campowidthselect campo campotexto" >
                                    <option value = ""> - <axis:alt f="axispro041" c="toption" lit="108341"/> - </option>
                                    <c:forEach var="tipos" items="${LISTTIPO}">
                                        <option value = "${tipos.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CPRETIP)&& tipos.CATRIBU == __formdata.CPRETIP}"> selected </c:if>>
                                                    ${tipos.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="campocaja">
                                <select name = "CPREOBL" id="CPREOBL" title="<axis:alt f="axispro041" c="tcpreobl" lit="112347" />"  size="1" style="width:80%"
                                    <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="true"</c:if> class="campowidthselect campo campotexto">
                                    <option value = ""> - <axis:alt f="axispro041" c="topcpre" lit="108341"/> - </option>
                                    <c:forEach var="listobli" items="${LISTOBLI}">
                                        <option value = "${listobli.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CPREOBL)&& listobli.CATRIBU == __formdata.CPREOBL}"> selected </c:if>>
                                            ${listobli.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            
                            <td class="campocaja" >
                                <select name = "COFERSN" id="COFERSN" title="<axis:alt f="axispro041" c="tcofersn" lit="111496" />" obligatorio="true" size="1" style="width:80%"
                                        class="campowidthselect campo campotexto_ob"> 
                                    <option value = ""> - <axis:alt f="axispro041" c="topccofersn" lit="108341"/> - </option>
                                    <c:forEach var="listoferta" items="${LISTOBLI}">
                                        <option value = "${listoferta.CATRIBU}"
                                            <c:if test="${(!empty __formdata.COFERSN)&& listoferta.CATRIBU == __formdata.COFERSN}"> selected </c:if>>
                                            ${listoferta.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                            <td class="campocaja" >
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NPREIMP}" name="NPREIMP" id="NPREIMP" size="15" style="width:30%"/>
                            </td>
                            <c:if test="${__formdata.CTIPPRE == 1 || __formdata.CTIPPRE == 2}">
                                <td>
                                    <select name = "CRESDEF" id="CRESDEF" title="<axis:alt f="axispro041" c="tcresdef" lit="9002142" />"  size="1" 
                                            class="campowidthselect campo campotexto">
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcresdef" lit="108341"/> - </option>
                                        <c:forEach var="listresp" items="${LISTARESP}">
                                            <option value = "${listresp.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CRESDEF)&& listresp.CATRIBU == __formdata.CRESDEF}"> selected </c:if>>
                                                ${listresp.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </c:if>
                            <c:if test="${__formdata.CTIPPRE == 3}">
                                <td class="campocaja" >
                                   <input type="text" class="campowidthinput campo campotexto" value='<fmt:formatNumber pattern="#.###########" value="${__formdata.CRESDEF}"/>' 
                                    <axis:atr f="axispro041" c="CRESDEF" a="modificable=true&obligatorio=false&formato=decimal"/>
                                    name="CRESDEF" id="CRESDEF" size="15"/>
                                </td>
                            </c:if> 
                        </tr>
                        <c:if test="${__formdata.MODO == 'GAR'}">
                        <tr>
                        <td></td>
                          <td class="titulocaja">
                                    <b><axis:alt f="axispro041" c="t8" lit="9901139" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro041" c="t9" lit="9901141" /></b>
                                </td>
                            </tr>
                        <tr>
                        <td></td>
                        <td class="campocaja">
                                    <select name = "CMODO" id="CMODO" title="<axis:alt f="axispro041" c="tcmodo" lit="9901140" />"  size="1" style="width:100%"
                                        class="campowidthselect campo campotexto" >
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcarmodo" lit="108341"/> - </option>
                                        <c:forEach var="modo" items="${LISTMODO}">
                                            <option value = "${modo.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CMODO)&& modo.CATRIBU == __formdata.CMODO}"> selected </c:if>>
                                                        ${modo.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name = "CVISIBLE" id="CVISIBLE" title="<axis:alt f="axispro041" c="tcvisible" lit="9002142" />"  size="1" style="width:80%"
                                            class="campowidthselect campo campotexto">
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcvisible" lit="108341"/> - </option>
                                        <c:forEach var="listtarpol" items="${LISTVISI}">
                                            <option value = "${listtarpol.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CVISIBLE)&& listtarpol.CATRIBU == __formdata.CVISIBLE}"> selected </c:if>>
                                                ${listtarpol.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </c:if>
                        <c:if test="${__formdata.MODO == 'PROD'}">
                            <tr id="TPREGUNACT">
                                <td></td>
                                <td class="titulocaja" colspan="2">
                                    <b><axis:alt f="axispro041" c="t6" lit="9001802" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro041" c="t7" lit="9901140" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro041" c="t8" lit="9901139" /></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axispro041" c="t9" lit="9901141" /></b>
                                </td>
                            </tr>
                            <tr id="PREGUNACT">
                                <td></td>
                                <td class="campocaja" colspan="2" >
                                    <select name = "CNIVEL" id="CNIVEL" title="<axis:alt f="axispro041" c="tcnivel" lit="9002142" />"  size="1" style="width:87%"
                                            class="campowidthselect campo campotexto">
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcnivel" lit="108341"/> - </option>
                                        <c:forEach var="listnivel" items="${LISTNIVEL}">
                                            <option value = "${listnivel.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CNIVEL)&& listnivel.CATRIBU == __formdata.CNIVEL}"> selected </c:if>>
                                                ${listnivel.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                
                                <td class="campocaja" >
                                    <select name = "CTARPOL" id="CTARPOL" title="<axis:alt f="axispro041" c="tctarpol" lit="9901140" />"  size="1" style="width:80%"
                                            class="campowidthselect campo campotexto_ob" obligatorio="true">
                                        <option value = ""> - <axis:alt f="axispro041" c="topttarpol" lit="108341"/> - </option>
                                        <c:forEach var="listtarpol" items="${LISTOBLI}">
                                            <option value = "${listtarpol.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CTARPOL)&& listtarpol.CATRIBU == __formdata.CTARPOL}"> selected </c:if>>
                                                ${listtarpol.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name = "CMODO" id="CMODO" title="<axis:alt f="axispro041" c="tcmodo" lit="9901140" />"  size="1" style="width:80%"
                                        class="campowidthselect campo campotexto" >
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcarmodo" lit="108341"/> - </option>
                                        <c:forEach var="modo" items="${LISTMODO}">
                                            <option value = "${modo.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CMODO)&& modo.CATRIBU == __formdata.CMODO}"> selected </c:if>>
                                                        ${modo.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                    <select name = "CVISIBLE" id="CVISIBLE" title="<axis:alt f="axispro041" c="tcvisible" lit="9002142" />"  size="1" style="width:80%"
                                            class="campowidthselect campo campotexto">
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcvisible" lit="108341"/> - </option>
                                        <c:forEach var="listtarpol" items="${LISTVISI}">
                                            <option value = "${listtarpol.CATRIBU}"
                                                <c:if test="${(!empty __formdata.CVISIBLE)&& listtarpol.CATRIBU == __formdata.CVISIBLE}"> selected </c:if>>
                                                ${listtarpol.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                            </tr>
                        </c:if>
                        
                        <tr>
                            <td></td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t10" lit="108347" /></b>
                            </td>
                        </tr>    
                        <tr>
                            <td></td>
                            <td class="campocaja" colspan="4">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.TPREFOR}" name="TPREFOR" id="TPREFOR" size="15"/>
                            </td>
                        </tr>   
                        <tr>
                            <td></td>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axispro041" c="t11" lit="9001550" /></b>
                            </td>
                        </tr>    
                        <tr>
                            <td></td>
                            <td class="campocaja" colspan="4">
                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.TVALFOR}" name="TVALFOR" id="TVALFOR" size="15"/>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td class="titulocaja" colspan="2">
                                <b><axis:alt f="axispro041" c="t12" lit="9904779" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t13" lit="9904780" /></b>
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axispro041" c="t14" lit="9904781" /></b>
                            </td>
                            <axis:ocultar f="axispro041" c="CRECARG"> 
                                <c:if test="${__formdata.MODO == 'PROD'}">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axispro041" c="t15" lit="9904782" /></b>
                                    </td>
                                </c:if>
                           </axis:ocultar>	
                        </tr>
                        
                        
                        <tr>
                            <td></td>
                            <td class="campocaja" colspan="2">
                                <select name = "ESCCERO" id="ESCCERO" title="<axis:alt f="axispro041" c="tesccero" lit="9904779" />"  size="1" style="width:80%"
                                    <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="false"</c:if> class="campowidthselect campo campotexto">
                                    <option value = ""> - <axis:alt f="axispro041" c="toptesccero" lit="108341"/> - </option>
                                    <c:forEach var="listobli" items="${LISTOBLI}">
                                        <option value = "${listobli.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CESCCERO)&& listobli.CATRIBU == __formdata.CESCCERO}"> selected </c:if>>
                                            ${listobli.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>                            
                            <td class="campocaja">
                                <select name = "VISIBLECOL" id="VISIBLECOL" title="<axis:alt f="axispro041" c="tvisiblecol" lit="9904780" />"  size="1" style="width:80%"
                                    <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="false"</c:if> class="campowidthselect campo campotexto">
                                    <option value = ""> - <axis:alt f="axispro041" c="toptvisiblecol" lit="108341"/> - </option>
                                    <c:forEach var="listobli" items="${LISTOBLI}">
                                        <option value = "${listobli.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CVISIBLECOL)&& listobli.CATRIBU == __formdata.CVISIBLECOL}"> selected </c:if>>
                                            ${listobli.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>                            
                            <td class="campocaja">
                                <select name = "VISIBLECERT" id="VISIBLECERT" title="<axis:alt f="axispro041" c="tvisilecert" lit="9904781" />"  size="1" style="width:80%"
                                    <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="false"</c:if> class="campowidthselect campo campotexto">
                                    <option value = ""> - <axis:alt f="axispro041" c="toptvisiblecert" lit="108341"/> - </option>
                                    <c:forEach var="listobli" items="${LISTOBLI}">
                                        <option value = "${listobli.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CVISIBLECERT)&& listobli.CATRIBU == __formdata.CVISIBLECERT}"> selected </c:if>>
                                            ${listobli.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>    

                            <axis:ocultar f="axispro041" c="CRECARG"> 
                            <c:if test="${__formdata.MODO == 'PROD'}">
                                <td class="campocaja">
                                    <select name = "CRECARG" id="CRECARG" title="<axis:alt f="axispro041" c="tcrearg" lit="9904782" />"  size="1" style="width:80%"
                                        <c:if test="${__formdata.MODO == 'GAR'}">obligatorio="false"</c:if> class="campowidthselect campo campotexto">
                                        <option value = ""> - <axis:alt f="axispro041" c="toptcrearg" lit="108341"/> - </option>
                                        <c:forEach var="listobli" items="${LISTOBLI}">
                                        <option value = "${listobli.CATRIBU}"
                                            <c:if test="${(!empty __formdata.CRECARG)&& listobli.CATRIBU == __formdata.CRECARG}"> selected </c:if>>
                                            ${listobli.TATRIBU}</option>
                                        </c:forEach>
                                    </select>
                                </td>                            
                            </c:if>    
                            </axis:ocultar>							
                        </tr>
                        
                        
                    </table>
                    
                </td>
            </tr>
            
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro041</c:param><c:param name="f">axispro041</c:param><c:param name="__botones">salir,aceptar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
</body>
</html>