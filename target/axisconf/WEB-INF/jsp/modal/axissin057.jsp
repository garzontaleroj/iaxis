<%/* Revision:# PuGJU0W7sO4UVuKoUXYs5A== # */%>
<%/*
*  Fichero: axissin057.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Titulo: Modal movimiento siniestro
*
*  Fecha: 23/10/2012
*/
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>
    <c:set var="linea_trami" value="${__formdata.indexTramitacio}"/> <!-- ${LINEATRAM} -->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axissin057" c="TITULO" lit="9001473"/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
            var val1 = "<%=request.getAttribute("OK")%>"; 
            var tramdef = "<%=request.getAttribute("TRAMDEF")%>"; 
            var NSINIES = "${__formdata.NSINIES}";
            
            if (val1=="OK"){
                parent.f_aceptar_axissin057(NSINIES); //TODO: Dato EJ. para volver a la pantalla
            }

            f_cargar_propiedades_pantalla();
        }
        
        function f_but_aceptar(){
            $("#preg_resp").val(f_guardar_preguntas());
            objUtiles.ejecutarFormulario ("modal_axissin057.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_guardar_preguntas(){
            //   Se monta una estructura tipo (para solo una respuesta):
            //   CPREGUN#TPREGUN#CRESPUE*TRESPUE*/#, 
            //   Se monta una estructura tipo (para más de una respuesta):
            //   CPREGUN#TPREGUN#CRESPUE*TRESPUE*/CRESPUE*TRESPUE*/#, 
            
            var preguntas='';
			var cont_filas=-1;
            var CPREGUN='';var TPREGUN='';var CRESPUE='';var TRESPUE='';
            $("#LSTPREGUNTAS tr").each(function (){
                var fila = $(this);
                var cont_colum = 0;
                var idPadre = fila.parent().parent().attr("id");
                
                if (idPadre=="LSTPREGUNTAS"){
                fila.find("td").each(function (){
                    var columna = $(this);
                    var fila_blanca;
                    if (cont_colum == 0){/*Codigo pregunta CPREGUN*/
                        fila_blanca = columna.find("div").html();
                        if ((!objUtiles.estaVacio(fila_blanca))&&fila_blanca!="<br>"){
                            CPREGUN = columna.find("div").html()+"#";
                        }
                    }
                    if (cont_colum == 1){/*Descripcion pregunta TPREGUN*/
                        fila_blanca = columna.find("div").html();
                        if (!objUtiles.estaVacio(fila_blanca)){
                            TPREGUN = columna.find("div").html()+"#";
                        }
                    }
                    if (cont_colum == 2){/*Respuestas*/
                        fila_blanca = columna.find("div").html();
                        if (!objUtiles.estaVacio(fila_blanca)){
                            if ($("#respuesta_"+cont_filas).is("select")){/*TIPO RESPUESTA LISTA VALORES*/
                                var selector = "#respuesta_"+cont_filas+" option:selected";
                                CRESPUE = $("#respuesta_"+cont_filas).val();
                                if (CRESPUE!='null'){
                                    TRESPUE = $(selector).text();
                                    preguntas += CPREGUN;
                                    preguntas += TPREGUN;
                                    if (TRESPUE!=null){
                                        TRESPUE = reemplazarCaracteres("/",TRESPUE);
                                        TRESPUE = reemplazarCaracteres(",",TRESPUE);
                                        TRESPUE = reemplazarCaracteres("#",TRESPUE);
                                        TRESPUE = reemplazarCaracteres("*",TRESPUE);
                                    }
                                    preguntas += CRESPUE+"*"+TRESPUE+"*/";
                                }else{
                                    TRESPUE = '';
                                }
                            }
                            else if ($("#respuesta_"+cont_filas).is(":checkbox")){/*TIPO RESPUESTA MULTISELECCION*/
                                var cuantos_check = $(".respuesta_"+cont_filas).length;
                                var checks = $(".respuesta_"+cont_filas);
                                var respuesta = false;
                                var respuestas = '';
                                for (var i=0;i < cuantos_check;i++){
                                    if (checks.get(i).checked){
                                        respuesta=true;
                                        respuestas += checks.get(i).value+"*"; /*CRESPUE*/
                                        var divv = $("#"+CPREGUN+i);
                                        TRESPUE = ' ';
                                        if ($("#"+CPREGUN+i).html()!=null){
                                            TRESPUE = reemplazarCaracteres("/",$("#"+CPREGUN+i).html());
                                            TRESPUE = reemplazarCaracteres(",",TRESPUE);
                                            TRESPUE = reemplazarCaracteres("#",TRESPUE);
                                            TRESPUE = reemplazarCaracteres("*",TRESPUE);
                                        }
                                        respuestas += TRESPUE+"*/"; /*TRESPUE*/ 
                                    }
                                }
                                if (respuesta){
                                    preguntas += CPREGUN;
                                    preguntas += TPREGUN;
                                    preguntas += respuestas;
                                    TRESPUE = ' ';
                                }else{
                                    TRESPUE = '';
                                }
                                cont_filas += cuantos_check;
                            }
                            else if ($("#respuesta_"+cont_filas).is("input")){/*TIPO RESPUESTA VALOR O TEXTO*/
                                 TRESPUE = $("#respuesta_"+cont_filas).val();
                                 TRESPUE = reemplazarCaracteres("/",TRESPUE);
                                 TRESPUE = reemplazarCaracteres(",",TRESPUE);
                                 TRESPUE = reemplazarCaracteres("#",TRESPUE);
                                 TRESPUE = reemplazarCaracteres("*",TRESPUE);
                                 if (!objUtiles.estaVacio(TRESPUE)){
                                     preguntas += CPREGUN;
                                     preguntas += TPREGUN;
                                     preguntas += "1*"+TRESPUE+"*/";
                                 }
                            }
                            if (TRESPUE!=''){
                                preguntas += "#,";
                            }
                        }
                    }
                    cont_colum++;
                });
                cont_filas++;
                }
            });
            return preguntas;
        }
        
        function reemplazarCaracteres(caracter, texto){
            var texto_separado = texto.split(caracter);
            var TPREGUN = "";
            for (var i = 0;i<texto_separado.length;i++){
                TPREGUN +=texto_separado[i]+" ";
            }
            return TPREGUN;
        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axissin057");
        }
</script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin057.do" method="POST">
    <input type="hidden" name="operation" value="guardar" />
    <input type="hidden" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" name="seccion" value="preguntas"/>
    <input type="hidden" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" name="CACTIVI" value="${__formdata.CACTIVI}"/>
    <input type="hidden" name="preg_resp" id="preg_resp" value=""/>

    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin057" c="TITULO" lit="102299"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin057" c="TITULO" lit="102299"/></c:param>
        <c:param name="form">axissin057</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
    
    <!--  PREGUNTAS -->
     <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
    <% int contador = 0; %>

<c:if test="${!empty sessionScope.axissin_preguntasSiniestro}">
    <axis:ocultar f="axissin032" c="DSP_PREG" dejarHueco="false">  
        <tr>
            <td colspan="3">
                <table>
                    <tr>
                        <td class="titulocaja" style="padding-right:31px">
                            <b><axis:alt c="LIT_PREGUNTES" f="axissin032" lit="102299"/></b>
                            <!-- DisplayTag preguntas -->
                            <c:set var="title0"><axis:alt f="axissin032" c="LIT_800440" lit="800440"/></c:set>
                            <c:set var="title1"><axis:alt f="axissin032" c="LIT_102738" lit="102738"/></c:set>
                            <c:set var="title2"><axis:alt f="axissin032" c="LIT_103712" lit="103712"/></c:set>
                            <div id="DSP_PREG" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                            <div id="Dt_PREG" class="displayspace" style="max-height:none;height:auto;overflow:hidden;border: 1px solid #DDDDDD;border-right-width: 0px;"> 
                                <display:table name="${sessionScope.axissin_preguntasSiniestro}" id="LSTPREGUNTAS" export="false" class="dsptgtable" 
                                               pagesize="-1"  sort="list" cellpadding="0" cellspacing="0"
                                               style="border:1px"  requestURI="axis_${pantalla}.do?paginar=true">
                                    <%@ include file="../include/displaytag.jsp"%>
                                    <axis:visible f="axissin032" c="DPS_CPREGUN">
                                    <axis:ocultar f="${pantalla}" c="CPREGUN" dejarHueco="false">
                                        <display:column title="${title0}" sortable="true" sortProperty="CPREGUN" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                                            <div class="dspNumber">${LSTPREGUNTAS.CPREGUN}</div>
                                        </display:column>
                                    </axis:ocultar>
                                    </axis:visible>
                                    <display:column title="${title1}" sortable="true" sortProperty="TPREGUN" headerClass="sortable"  media="html" autolink="false" >
                                        <div class="dspText" id="mipregunta_<%=contador%>">${LSTPREGUNTAS.TPREGUN}</div>
                                        <c:if test="${LSTPREGUNTAS.TIMAGEN != null}">
                                            <img border="0" alt="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" title="<axis:alt f="axissin032" c="LIT_1000577" lit="1000577"/>" src="images/${LSTPREGUNTAS.TIMAGEN}"/>
                                        </c:if>
                                    </display:column>
                                    <display:column style="width:25%" title="${title2}" sortable="false" sortProperty="pregunta" headerClass="sortable" media="html" autolink="false">
                                        <c:choose>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '1' || LSTPREGUNTAS.CTIPPRE == '2'}"> 
                                                <div class="dspIcons">        
                                                    <select <axis:atr f="axissin032" c="CRESPUE" a="modificable=true&isInputText=false"/> 
                                                    name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>"  pregunta="${LSTPREGUNTAS.CPREGUN}" size="1" style="width:100%" class="campo campotexto">
                                                    <option value="null"> - <axis:alt f="axissin032" c="COMBO_SNV" lit="108341"/> - </option> 
                                                        <c:forEach items="${sessionScope.axissin_respuestasSiniestro}" var="valores_respuesta">
                                                        <c:if test="${LSTPREGUNTAS.CPREGUN==valores_respuesta.CPREGUN }">
                                                        <option value = "${valores_respuesta.CRESPUE}" 
                                                        <c:forEach items="${LSTPREGUNTAS.TRESPUESTAS}" var="respuesta">
                                                        <c:if test="${valores_respuesta.CRESPUE == respuesta.OB_IAX_SIN_RESPUESTAS.CRESPUE}">selected</c:if>
                                                        </c:forEach>>${valores_respuesta.TRESPUE}</option>
                                                        </c:if>
                                                        </c:forEach>
                                                    </select>
                                                </div>
                                            </c:when>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '3' || LSTPREGUNTAS.CTIPPRE == '5'}"> 
                                                <div class="dspIcons">        
                                                    <input <axis:atr f="axissin032" c="CRESPUE" a="modificable=true&isInputText=true"/> type="text" 
                                                           name = "respuesta_<%= contador %>" id="respuesta_<%= contador %>" pregunta="${LSTPREGUNTAS.CPREGUN}"
                                                           value="${LSTPREGUNTAS.TRESPUESTAS[0].OB_IAX_SIN_RESPUESTAS.TRESPUE}"
                                                           class="campowidthinput campo campotexto" title="<axis:alt f="axissin032" c="RESPOSTA" lit="102740"/> ${LSTPREGUNTAS.CPREGUN}"
                                                           <c:if test="${LSTPREGUNTAS.CTIPPRE == '3'}"> formato="decimal" </c:if>>
                                                    
                                                </div>
                                            </c:when>
                                            <c:when test="${LSTPREGUNTAS.CTIPPRE == '9'}"> 
                                                <div class="dspIcons"> 
                                                    <table>
                                                            <% int c_chec = 0; %>
                                                            <% int cont_comun = contador; %>
                                                            <c:forEach items="${sessionScope.axissin_respuestasSiniestro}" var="respuesta">
                                                            <c:if test="${LSTPREGUNTAS.CPREGUN==respuesta.CPREGUN }">
                                                            <tr>
                                                                <td style="border:0px;width:10%;">
                                                                <input type="checkbox" value = "${respuesta.CRESPUE}" id="respuesta_<%= contador %>"  
                                                                       name="respuesta_<%= contador %>" class="respuesta_<%= cont_comun %>"  
                                                                       <c:forEach items="${LSTPREGUNTAS.TRESPUESTAS}" var="valores_respuesta">
                                                                       <c:if test="${respuesta.CRESPUE == valores_respuesta.OB_IAX_SIN_RESPUESTAS.CRESPUE}">checked</c:if>
                                                                       </c:forEach>/> 
                                                                </td>
                                                                <td style="text-align:left"><div id="${respuesta.CPREGUN}#<%= c_chec %>">${respuesta.TRESPUE} </div></td>
                                                            </tr>
                                                            <% c_chec++; %>
                                                            <% contador++; %>
                                                            </c:if>
                                                            </c:forEach>
                                                    </table>
                                                </div>
                                            </c:when>
                                            <c:otherwise><div class="dspText">${LSTPREGUNTAS.TPREGUN}</div></c:otherwise> 
                                            </c:choose>
                                        </div>
                                    </display:column>
                                    <% contador++; %>
                                </display:table>
                            </div>
                            <div class="separador">&nbsp;</div>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </axis:ocultar>
    </c:if>                         
    </table>
    <c:import url="../include/botonera_nt.jsp">
        <c:param name="f">axissin057</c:param>
        <c:param name="__botones">cancelar<axis:visible f="axissin057" c="BT_ACEPTAR">,aceptar</axis:visible></c:param>
    </c:import>
    </form>
  <c:import url="../include/mensajes.jsp" />
</body>
</html>