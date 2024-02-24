<%/* Revision:# Hy51FdfvKQAPHyOf0N1oqA== # */%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

    <c:set var="mprlistasize" value="15" /><c:if test="${!empty param.mprlistasize}"><c:set var="mprlistasize" value="${param.mprlistasize}" /></c:if>
    <c:if test="${sessionScope.AXISMPRXXX ne 'axisper023'}" >
    <c:set var="title1"><axis:alt f="axismprlista" c="title" lit="104111"/></c:set>
    <c:set var="tipo_pantalla">axis</c:set>
    </c:if>
    <c:if test="${sessionScope.AXISMPRXXX eq 'axisper023'}" >
    <c:set var="title1"><axis:alt f="axismprlista" c="title1" lit="9001819"/></c:set>
    <c:set var="tipo_pantalla">modal</c:set>
    </c:if>
    <c:if test="${sessionScope.AXISMPRXXX eq 'axisage022'}" >
    <c:set var="title1"><axis:alt f="axismprlista" c="title1" lit=""/></c:set>
    <c:set var="tipo_pantalla">modal</c:set>
    </c:if>
    <c:set var="title2"><axis:alt f="axismprlista" c="title2" lit="101159"/></c:set>
    <c:set var="confkey2" value="${sessionScope.AXISMPRXXX}__TVALPAR__modificable" />
    <c:if test="${(__configform[confkey2] == 'false')}" var="ret">
        <c:set var="soloLecturaInput" value="readonly" /> 
        <c:set var="soloLecturaSelect" value="disabled" /> 
    </c:if>
     
    <div class="seccion" xstyle="height:350px">

        <c:set var="NVALPARoCVALPAR">${param.NVALPARoCVALPAR}</c:set>
        <c:if test="${empty NVALPARoCVALPAR}"><c:set var="NVALPARoCVALPAR">CVALPAR</c:set></c:if>
        <display:table name="${sessionScope.axismprxxx_lista}" id="miListaId" export="false" class="dsptgtable" pagesize="${mprlistasize}" requestURI="${tipo_pantalla}_${sessionScope.AXISMPRXXX}.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
            <%@ include file="../include/displaytag.jsp"%>
            <c:set var="XCUTILI" value="${miListaId.CUTILI}" /><c:if test="${empty XCUTILI}"><c:set var="XCUTILI" value="-" /></c:if>
            <c:if test="${__formdata.PARAGRUPA == 1}">
            <display:column title="" sortable="true" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:15%">    
                <div class="dspText" style="width:99%;overflow:hidden;"><b>${miListaId['TGRPPAR']}</b></div> 
            </display:column>
            </c:if>
            <display:column title="${title1}" sortable="true" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:30%">    
                <div class="dspText" style="width:99%;overflow:hidden;">${miListaId['TPARAM']}</div> 
            </display:column>
             <display:column title="${title2}" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:40%" >    
                    
            <c:choose>
                <c:when test="${miListaId.CTIPO==1}">
                <%--  INI -IAXIS-5338 - JLTS -08/10/2019 - Se comentariza  
                       <input type="text" class="campo"  <c:if test="${miListaId.COBLIGA==1}"> obligatorio="true" </c:if>  name="val<c:out value="${XCUTILI}" />_1_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_1_<c:out value="${miListaId.CPARAM}" />" value="<c:out value="${miListaId.TVALPAR}" />" style="width:250px" ondblclick="f_ondblclick(val<c:out value='${XCUTILI}' />_1_<c:out value='${miListaId.CPARAM}' />)" onchange="f_onchange(this)" <c:out value="${soloLecturaInput}" />/>
                --%>
                <%-- INI -IAXIS-5338 - JLTS -08/10/2019 -Se adiciona el pattern --%> 
                       <input type="text" class="campo"  <c:if test="${miListaId.COBLIGA==1}"> obligatorio="true" </c:if>  name="val<c:out value="${XCUTILI}" />_1_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_1_<c:out value="${miListaId.CPARAM}" />" value="<fmt:formatNumber pattern="###,##0.00" value="${miListaId.TVALPAR}" />" style="width:250px" ondblclick="f_ondblclick(val<c:out value='${XCUTILI}' />_1_<c:out value='${miListaId.CPARAM}' />)" onchange="f_onchange(this)" <c:out value="${soloLecturaInput}" />/>
                <%-- FIN -IAXIS-5338 - JLTS -08/10/2019 -Se adiciona el pattern --%>
                    <%--    </display:column>  --%>
                    </c:when>
                <c:when test="${miListaId.CTIPO==2}">
                    <%--
                    Eso tiene truco: el valor puede venir o en CVALPAR o en NVALPAR - segun que tabla original. Lo controlamos con un parametro desde la JSP "padre". Por defecto: NVALPAR
                    --%>
                 <%--   <display:column title="${title2}"  sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:40%" >    
                     --%>
                     
                     <c:if test="${!empty miListaId.NVALPAR}">
                        <%--  INI -IAXIS-5338 - JLTS -08/10/2019 - Se comentariza  
                        <input type="text" formato="entero" class="campo" name="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" value="<c:out value="${miListaId.NVALPAR}" />" style="width:125px" ondblclick="f_ondblclick(this)" onchange="f_onchange(this)"  <c:out value="${soloLecturaInput}" />/>
                        --%>
                        <%-- INI -IAXIS-5338 - JLTS -08/10/2019 -Se adiciona el pattern --%>
                        <input type="text" formato="entero" class="campo" name="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" value="<fmt:formatNumber pattern="###,##0.00" value="${miListaId.NVALPAR}" />" style="width:125px" ondblclick="f_ondblclick(this)" onchange="f_onchange(this)"  <c:out value="${soloLecturaInput}" />/>
			<%-- FIN -IAXIS-5338 - JLTS -08/10/2019 -Se adiciona el pattern --%>
                        </c:if>
                        <c:if test="${empty miListaId.NVALPAR}">
                        <input type="text" formato="entero" class="campo" name="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" value="<c:out value="${miListaId.CVALPAR}" />" style="width:125px" ondblclick="f_ondblclick(this)" onchange="f_onchange(this)"  <c:out value="${soloLecturaInput}" />/>
                        </c:if>
                     <%--  Este código se comenta ya que no funciona desde el mant. de personas sección de propiedades.                            
                        <c:if test="${NVALPARoCVALPAR=='NVALPAR'}">
                        <input type="text" formato="entero" class="campo" name="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" value="<c:out value="${miListaId.NVALPAR}" />" style="width:50px" ondblclick="f_ondblclick(this)" onchange="f_onchange(this)"/>
                        </c:if>
                        <c:if test="${NVALPARoCVALPAR=='CVALPAR'}">
                        <input type="text" formato="entero" class="campo" name="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_2_<c:out value="${miListaId.CPARAM}" />" value="<c:out value="${miListaId.CVALPAR}" />" style="width:50px" ondblclick="f_ondblclick(this)" onchange="f_onchange(this)"/>
                        </c:if>
                        --%>
                    <%--    </display:column>  --%>
                    </c:when>
                <c:when test="${miListaId.CTIPO==3}">
               <%--     <display:column title="${title2}" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:40%" >    
                   --%>
                        <input type="text" formato="fecha" class="campo" <c:if test="${miListaId.COBLIGA==1}"> obligatorio="true" </c:if>  name="val<c:out value="${XCUTILI}" />_3_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_3_<c:out value="${miListaId.CPARAM}" />" size="15" value="<fmt:formatDate value="${miListaId.FVALPAR}" pattern="dd/MM/yyyy"/>" style="width:250px" xondblclick="f_ondblclick(this)" onchange="f_onchange(this)"   <c:out value="${soloLecturaInput}" /> /> <c:if test="!ret" ><a style="vertical-align:middle;" href="#"><img id="popup_val<c:out value="${XCUTILI}" />_3_<c:out value="${miListaId.CPARAM}" />" border="0" src="images/calendar.gif"/></a></c:if>
                        <script type="text/javascript">
                        Calendar.setup({
                        inputField     :    "val<c:out value="${XCUTILI}" />_3_<c:out value="${miListaId.CPARAM}" />",    
                        ifFormat       :    "%d/%m/%Y",     
                        button         :    "popup_val<c:out value="${XCUTILI}" />_3_<c:out value="${miListaId.CPARAM}" />",  
                        singleClick    :    true,
                        firstDay       :    1
                        });
                        </script>
                   <%--    </display:column>  --%>
                </c:when>
                <c:when test="${miListaId.CTIPO==4}">
              <%--      <display:column title="${title2}"  sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:40%">
                  --%>


                         <c:if test="${!empty miListaId.NVALPAR}">
                        <select class="campo" <c:if test="${miListaId.COBLIGA==1}"> obligatorio="true" </c:if>  style="width:250px" name="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" onchange="f_onchange(this)" mivalue="${miListaId.NVALPAR}"  <c:out value="${soloLecturaSelect}" />>
                            <option value=""></option>
                        </select>
                        </c:if>
                        <c:if test="${empty miListaId.NVALPAR}">
                             <select class="campo" <c:if test="${miListaId.COBLIGA==1}"> obligatorio="true" </c:if>  style="width:250px" name="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" onchange="f_onchange(this)" mivalue="${miListaId.CVALPAR}"  <c:out value="${soloLecturaSelect}" />>
                            <option value=""></option>
                        </select>
                        </c:if>
                        
<%--                  
                         <c:if test="${NVALPARoCVALPAR=='NVALPAR'}">
                        <select class="campo" style="width:250px" name="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" onchange="f_onchange(this)" mivalue="${miListaId.NVALPAR}">
                            <option value=""></option>
                        </select>
                        </c:if>
                        <c:if test="${NVALPARoCVALPAR=='CVALPAR'}">
                             <select class="campo" style="width:250px" name="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_4_<c:out value="${miListaId.CPARAM}" />" onchange="f_onchange(this)" mivalue="${miListaId.CVALPAR}">
                            <option value=""></option>
                        </select>
                         </c:if>
                         --%>
                 <%--    </display:column>  --%>
                </c:when>
                <c:when test="${miListaId.CTIPO==5}">
                 <%--   <display:column title="${title2}"  sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:40%">
                     --%>
                         <c:if test="${NVALPARoCVALPAR=='NVALPAR'}">
                                
                                <input type="text" class="campowidthinput campo campotexto" size="15" value="${miListaId.NVALPAR}" name="val<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />"  style="width:8%;" onchange="f_onchange(this)" ondblclick="f_ondblclick(this)" readonly="readonly"/>
                                    &nbsp;<img id="findParam" border="0" src="images/find.gif" onclick="f_abrir_axiscom002('9001817', '${miListaId.CPARAM}', null,'val<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />','texto<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />')" style="cursor:pointer"/>
                                    &nbsp;<span id="TEXTO5_span"><b>${__formdata.TEXTO5}</b></span>
                                     <input type="text" class="campowidthinput campo campotexto" size="15" value="${miListaId.RESP}" name="texto<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />" id="texto<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />" style="width:80%;border: 0px;"  readonly="readonly"/>
                        </c:if>
                        <c:if test="${NVALPARoCVALPAR=='CVALPAR'}">
                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${miListaId.NVALPAR}" name="val<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />" id="val<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />"  style="width:8%;" onchange="f_onchange(this)" ondblclick="f_ondblclick(this)" readonly="readonly"/>
                                    &nbsp;<img id="findParam" border="0" src="images/find.gif" onclick="f_abrir_axiscom002('9001817', '${miListaId.CPARAM}', null,'val<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />','texto<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />')" style="cursor:pointer"/>
                                    &nbsp;<span id="TEXTO5_span"><b>${__formdata.TEXTO5}</b></span> 
                                     <input type="text" class="campowidthinput campo campotexto" size="15" value="${miListaId.RESP}" name="texto<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />" id="texto<c:out value="${XCUTILI}" />_5_<c:out value="${miListaId.CPARAM}" />" style="width:80%;border: 0px;"  readonly="readonly" />
                         </c:if>
                    
                </c:when>
                <c:otherwise>
                </c:otherwise>
                </c:choose>
                 </display:column>  
               <c:if test="${sessionScope.AXISMPRXXX ne 'axisfic006'}" > 
                <c:set var="confkey" value="${sessionScope.AXISMPRXXX}__BT_BORRAR__visible" />
                <c:if test="${(empty __configform[confkey] ) || (__configform[confkey] == 'true')}">
                <display:column title="" sortable="false" headerClass="headwidth5 sortable"  media="html" autolink="false" style="text-align:center; width:5%">    
                   <c:if test="${!empty miListaId['CPARAM']}">
                                <img src="images/delete.gif" onclick="borrar('${miListaId['CPARAM']}')" style="cursor:pointer"/>
                   </c:if> 
                </display:column>
               </c:if >
			  </c:if> 
        </display:table>
    </div>

<script language="Javascript">
function parseVal( val) {
    var retVal=new Array(4);    
    var fraxis=val.substring(3).split("_");
    retVal[0]=fraxis[0]; // CUTILI
    retVal[1]=fraxis[1]; // CTIPO
    retVal[2]=val.substring( ("val"+fraxis[0]+"_"+fraxis[1]+"_").length ); // CPARAM
    return retVal;
}

var valSelects=document.getElementsByTagName("select");
var i=0;
var oselect=null;
var CUTILICTIPOCPARAM="";
for (i=0;i<valSelects.length;i++) {
    if (valSelects[i].name.indexOf("val")==0) {
        if (CUTILICTIPOCPARAM.length>0) CUTILICTIPOCPARAM=CUTILICTIPOCPARAM+",";
        oselect=document.getElementById(valSelects[i].name);
//        alert(oselect.getAttribute("mivalue"))
        CUTILICTIPOCPARAM=CUTILICTIPOCPARAM+oselect.id;
    }
}
var qs="operation=listavalores";
qs=qs+"&CUTILICTIPOCPARAM="+CUTILICTIPOCPARAM
qs=qs+"&dt="+(new Date().getTime())


if ("${sessionScope.AXISMPRXXX}" == "axisper023" || "${sessionScope.AXISMPRXXX}" == "axisfic006") {
    objAjax.invokeAsyncCGI("modal_${sessionScope.AXISMPRXXX}.do", callbacklistavalores, qs, this);
    // INI -IAXIS-5338 - JLTS -08/10/2019 -Se adiciona el alert para que se ejecute el asincrónico de la lista
    alert("Lista cargada con exito");
    // FIN -IAXIS-5338 - JLTS -08/10/2019
}
else if ("${sessionScope.AXISMPRXXX}" == "axisage022")
    objAjax.invokeAsyncCGI("modal_${sessionScope.AXISMPRXXX}.do", callbacklistavalores, qs, this);    
else
    objAjax.invokeAsyncCGI("axis_${sessionScope.AXISMPRXXX}.do", callbacklistavalores, qs, this);

function callbacklistavalores(responseText) {
    //alert("["+ responseText +"]")
    var data=responseText.split("\n")
    var i=0
    //alert(data.length)
    var actualO=null;
    var actualV=null;
    var actualT=null;
    var actualM=null;
    var actualI=0;
    
    // llenamos los cambos
    for (i=0;i<data.length;i++) {
        if (data[i].indexOf("e:")==0) break;
        if (data[i].indexOf("c:")==0) {
            actualO=document.getElementById(data[i].substring(2));
        }
        if (data[i].indexOf("v:")==0) {
            actualV=data[i].substring(2);
        }
        if (data[i].indexOf("t:")==0) {
            actualT=data[i].substring(2);
            actualO.options[actualO.options.length]=new Option(actualT, actualV)
        }

    }
    
    // intenamos prepmarcar un dato con la info del atributo:mivalor
    for (i=0;i<data.length;i++) {
        if (data[i].indexOf("e:")==0) break;
        if (data[i].indexOf("c:")==0) {
            actualO=document.getElementById(data[i].substring(2));
            actualM=actualO.getAttribute("mivalue");
            if (actualM.length>0) {
                actualO.value=actualM
            }
        }
        
    }
}

function f_abrir_axiscom002(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION,DONDE,TEXTO){
             document.miForm.CAMPO.value = DONDE;
             document.miForm.TEXTO5.value = TEXTO;
             objUtiles.abrirModal("axiscom002", "src", "modal_axiscom002.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
        }
        
function f_aceptar_axiscom002(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom002();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            
            var donde = document.miForm.CAMPO.value;
            var texto = document.miForm.TEXTO5.value;
            objDom.setValorPorId(donde,CODIGO);
            objDom.setValorPorId(texto,TEXTO);
            f_onchange(document.getElementById(donde));
        }
        
        function f_cerrar_axiscom002() {
            objUtiles.cerrarModal("axiscom002");
        }        
</script>