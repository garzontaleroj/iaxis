<%--
      NOMBRE:    axisctr164.jsp
      @author <a href = "mailto:jboixader@csi-ti.com">JBOIXADER</a>
      Fecha: 16/11/2010
      PROPÓSITO Pantalla de parametros de clausulas
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        16/11/2010   JBN              1. Creación de la pantalla. Bug.16410
--%>

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
        <c:import url="../include/carga_framework_js.jsp" />
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
        <!--********** CALENDARIO ************************* -->
        <!-- Hoja de estilo del Calendario -->
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <!-- Script principal del calendario -->
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <!-- Idioma del calendario, en función del Locale -->
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <!-- Setup del calendario -->
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <!--*********************************** -->
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
	 	f_cargar_propiedades_pantalla();
                f_NPARAME_onchange();
            }
	    
 	   function f_getNPARAMES(){
            var url = '';
            //Recuperem tots els inputs de la pagina
            var items =(document.getElementsByTagName("INPUT"));
            if (items != null){
                for (i=0;i<items.length;i++)  {
                    //Solo inputs que empiezen por NPARAME_
                    if ((items[i].id != null)&&(items[i].id.indexOf("NPARAME_")!= -1)&&(items[i].id.indexOf("_MODIFVISIBLE")== -1)) 
                    {
                        url +="&"+items[i].id+"="+items[i].value;
                        
                    }
                }
            }
            
            var items =(document.getElementsByTagName("SELECT"));
            if (items != null){
                for (i=0;i<items.length;i++)  {
                    //Solo inputs que empiezen por NPARAME_
                    if ((items[i].id != null)&&(items[i].id.indexOf("NPARAME_")!= -1)&&(items[i].id.indexOf("_MODIFVISIBLE")== -1)) 
                    {
                        url +="&"+items[i].id+"="+items[i].value;
                        
                    }
                }
            }
            return url;
           }
           
           
           
           function f_but_aceptar() {
                var qs="operation=ajax_setParametros&SCLAGEN="+document.getElementById('SCLAGEN').value+"&NORDCLA="+document.getElementById('NORDCLA').value+"&MULT="+document.getElementById('MULT').value;
                qs += f_getNPARAMES();
                objAjax.invokeAsyncCGI("modal_axisctr164.do", callbackajaxsetparametros, qs, this)
                //parent.f_aceptar_modal('axisctr164',objDom.getValorPorId("CRAMO"));
           }
           function callbackajaxsetparametros(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    parent.f_cerrar_modalParametros(document.getElementById('TCLATEX').innerHTML, document.getElementById('SCLAGEN').value ,'axisctr164');
                }else{
                
                }
           }
           function f_but_cancelar() {
                parent.f_cerrar_modal('axisctr164');
           }
            
        function f_NPARAME_onchange(tparame){
            num = '0';
            
            var nuevo = document.getElementById('TEXTOCLAUSULA').value;
            var items =(document.getElementsByTagName("INPUT"));
            if (items != null){
                for (i=0;i<items.length;i++)  {
                    //Solo inputs que empiezen por NPARAME_
                    if ((items[i].id != null)&&(items[i].id.indexOf("NPARAME_")!= -1)&&(items[i].id.indexOf("_MODIFVISIBLE")== -1)) 
                    {
                        num =items[i].id.substring(items[i].id.indexOf('_')+1);
                        if (items[i].value.length > 0){
                            nuevo = nuevo.replace ('#'+num+'#', items[i].value);
                        }
                    }
                }
            }
            
              items =(document.getElementsByTagName("SELECT"));
            if (items != null){
                for (i=0;i<items.length;i++)  {
                    //Solo inputs que empiezen por NPARAME_
                    if ((items[i].id != null)&&(items[i].id.indexOf("NPARAME_")!= -1)&&(items[i].id.indexOf("_MODIFVISIBLE")== -1)) 
                    {
                        num =items[i].id.substring(items[i].id.indexOf('_')+1);
                        if (items[i].value.length > 0 && items[i].value >0){
                            nuevo = nuevo.replace ('#'+num+'#', items[i].value);
                        }
                    }
                }
            }
            //document.getElementById('TCLATEX').innerHTML = nuevo;
            
        }     
        
        
        

            
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="SCLAGEN" name="SCLAGEN" value="${__formdata.SCLAGEN}"/>
            <input type="hidden" id="NORDCLA" name="NORDCLA" value="${__formdata.axisctr_clausula.NORDEN}"/>
            <input type="hidden" id="TEXTOCLAUSULA" name="TEXTOCLAUSULA" value="${__formdata.axisctr_clausula.TCLATEX}"/>
            <input type="hidden" id="MULT" name="MULT" value="${__formdata.MULT}"/>
            <input type="hidden" id="TCLATEX" name="TCLATEX" value="${__formdata.TCLATEX}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axisctr164" lit="9901671"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axisctr164" lit="9901671"/></c:param>
                <c:param name="form">axisctr164</c:param>
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <!--campos-->
                        <%--table class="seccion">
                            <tr>
                                <th style="width:100%;height:0px"></th>
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr164" c="CRAMO" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" id="TCLATEX">
                                        ${__formdata.axisctr_clausula.TCLATEX}
                                    </td>
                                </axis:ocultar> 
                            </tr>
                        </table--%>
                       
                       <axis:visible f="axisctr164" c="DSP_CLAUSULAS">
                        <div class="separador">&nbsp;</div>
                            <!-- DisplayTag Pólizas -->
                            <c:set var="title1"><axis:alt f="axisctr164" c="LIT_DSP_TIT01" lit="800440"/></c:set>
                            <c:set var="title2"><axis:alt f="axisctr164" c="LIT_DSP_TIT02" lit="101761"/></c:set>
                            <c:set var="title3"><axis:alt f="axisctr164" c="LIT_DSP_TIT03" lit="105940"/></c:set>
                            <div class="seccion displayspaceGrande">
                                <display:table name="${__formdata.axisctr_clausula.PARAMETROS}" id="miListaParametrosId" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" requestURI="modal_axisctr164.do?paginar=true" sort="list" cellpadding="0" cellspacing="0">
                                    <%@ include file="../include/displaytag.jsp"%>
                                     <axis:visible f="axisctr164" c="NPARAMETABLE">
                                    <display:column title="${title1}" sortable="false" headerClass="headwidth5 sortable"  style="width:3%" media="html" autolink="false" >    
                                        <div class="dspNumber">${miListaParametrosId['OB_IAX_CLAUSUPARA'].NPARAME}</div>
                                    </display:column>
                                    </axis:visible>
                                     <axis:visible f="axisctr164" c="PARAMDESCRIP">
                                    <display:column title="${title2}" sortable="false" headerClass="headwidth5 sortable"  style="width:15%" media="html" autolink="false" >    
                                        <div class="dspTexto">${miListaParametrosId['OB_IAX_CLAUSUPARA'].TPARAME}</div>
                                    </display:column>
                                    </axis:visible>
                                    <axis:visible f="axisctr164" c="INPUTS">
                                    <display:column title="${title3}" sortable="true" sortProperty="SPRODUC" headerClass="sortable fixed" style="width:92%" media="html" autolink="false" >    
                                        <div class="dspIcons">
                                        <c:choose>
                                        <c:when test="${miListaParametrosId.OB_IAX_CLAUSUPARA.CFORMAT == 8}">
                                             <c:forEach items="${miListaParametrosId.OB_IAX_CLAUSUPARA.VALORES}" var="respuesta">
                                                    <div class="dspTexto" style="text-align:left">${respuesta.OB_IAXCLAUSUPARA_VALORES.TPARAME}</div>
                                             </c:forEach>        
                                        </c:when>
                                        <c:when test="${miListaParametrosId.OB_IAX_CLAUSUPARA.CFORMAT != 2  }">
                                        
                                            <input type="text" id="NPARAME_${miListaParametrosId['OB_IAX_CLAUSUPARA'].NPARAME}" value="${miListaParametrosId['OB_IAX_CLAUSUPARA'].TTEXTO}" class="campo campotexto"
                                            maxlength="50" size="50" onchange="f_NPARAME_onchange()" />
                                       
                                      
                                        </c:when>
                                        <c:otherwise>
                                         
                                                     <select onchange="f_NPARAME_onchange('1')" <axis:atr f="axisctr164" c="TNIVEL" a="modificable=true&isInputText=false"/>
                                                     id="NPARAME_${miListaParametrosId['OB_IAX_CLAUSUPARA'].NPARAME}" name="NPARAME_${miListaParametrosId['OB_IAX_CLAUSUPARA'].NPARAME}" 
                                                     size="1" style="width:100%" class="campo campotexto"
                                                                 <title="${miListaParametrosId['OB_IAX_CLAUSUPARA'].TPARAME}">
                                                                   <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr164" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                    <c:forEach items="${miListaParametrosId.OB_IAX_CLAUSUPARA.VALORES}" var="respuesta">
                                                                        <option value = "${respuesta.OB_IAXCLAUSUPARA_VALORES.CPARAME}"  > ${respuesta.OB_IAXCLAUSUPARA_VALORES.TPARAME}</option>
                                                                    </c:forEach>
                                                                </select>
                                        </c:otherwise>
                                        </c:choose>
                                        </div>
                                    </display:column>
                                    </axis:visible>
                                </display:table>
                            </div>
                         </axis:visible>
                    </td>
                </tr>
            </table>
    
     </form>
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr164</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr164" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisctr164" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


