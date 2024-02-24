<%/*
*  Fichero: Axiscomi002.jsp
*  @author <a href = "mailto:amartinez@csi-ti.com">Alex Martinez</a> 
*
*  Fecha: 12/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>

<%@ page import="java.util.List" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    
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
    
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/

       function f_but_cancelar() {
            parent.f_cerrar_axisctr201();
       }
       
       
       function f_onload(){
        	f_cargar_propiedades_pantalla();
       }
       
       function f_but_buscar(){
       
           var TPERSONA = document.axisctr201Form.TPERSONA.value;
           var TIDENTIFICACION = document.axisctr201Form.TIDENTIFICACION.value;
           var NIDENTIFICACION = document.axisctr201Form.NIDENTIFICACION.value;
           var NOMBREPER = document.axisctr201Form.NOMBREPER.value;
           var CLASELISTA = document.axisctr201Form.CLASELISTA.value;
           var TIPOLISTA = document.axisctr201Form.TIPOLISTA.value;
           var FINCLUDESDE = document.axisctr201Form.FINCLUDESDE.value;
           var FINCLUHASTA = document.axisctr201Form.FINCLUHASTA.value;
           var FEXCLUDESDE = document.axisctr201Form.FEXCLUDESDE.value;
           var FEXCLUHASTA = document.axisctr201Form.FEXCLUHASTA.value;
           
           var FNACIMI = null;
           if(document.axisctr201Form.FNACIMI){
             FNACIMI = document.axisctr201Form.FNACIMI.value;
           }
           
           parent.f_but_buscar(TPERSONA,TIDENTIFICACION,NIDENTIFICACION,NOMBREPER,CLASELISTA,TIPOLISTA,
                               FINCLUDESDE,FINCLUHASTA,FEXCLUDESDE,FEXCLUHASTA,FNACIMI);
        
       }
       
       function f_onchange_CTIPPERcerca(TIDENTI) {
            formdataTIDENTI = '${__formdata.TPERSONA}';
            if ( TIDENTI != formdataTIDENTI ) {
                // Recargar formulario para esconder/mostrar campos en función de TIDENTI
                objUtiles.ejecutarFormulario("modal_axisctr201.do", "form", document.axisctr201Form, "_self", objJsMessages.jslit_cargando);   
            }
        }
        
        function f_actualiza_tipo(){
            //  objValidador.validaEntrada();
            
            CLASELISTA= document.axisctr201Form.CLASELISTA.value;
            objAjax.invokeAsyncCGI("modal_axisctr201.do", callbackAjaxActualizaTipo, 
                "operation=ajax_actualiza_tipo&CLASELISTA="+CLASELISTA, this, objJsMessages.jslit_actualizando_registro);
                
        }
        
        function callbackAjaxActualizaTipo(ajaxResponseText) {
                
            var versionCombo = document.axisctr201Form.TIPOLISTA;
            try {
                var doc=objAjax.domParse(ajaxResponseText);
                                        
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(versionCombo);
                        objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, 0);
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var NVERSIO = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CATRIBU")[0].childNodes[0].nodeValue : "");
                            var TCONTRA = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TATRIBU")[0].childNodes[0].nodeValue : "");
                            objDom.addOpcionACombo(NVERSIO, TCONTRA, versionCombo, i+1);
                        }
                    }
                }
            } catch (e) {
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", " - " + objJsMessages.jslit_seleccionar + " - ", versionCombo, null);
                //alert(objJsMessages.jslit_sin_motivos);
            }
        }
        
    </script>
  </head>
    <body onload="f_onload()" class=" ">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="axisctr201Form" action="" method="POST">
            <input type="hidden" name="operation" value="">

            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisctr201" c="formulario" lit="9904437" /></c:param>
                <c:param name="producto"><axis:alt f="axisctr201" c="producto" lit="9904437" /></c:param>
                <c:param name="form">Axisctr201</c:param>
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
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:15%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <!-- Tipo persona -->
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr201" c="TPERSONA" lit="102844"/></b>
                                        </td>
                                        <!-- Tipo identificacion -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="TIDENTIFICACION" lit="9904433"/></b>
                                        </td>
                                        <!-- Número identificación -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="NIDENTIFICACION" lit="9904434"/></b>
                                        </td>
                                        
                                    </tr>
                                    <tr>
                                         <td class="campocaja">
                                            <select name = "TPERSONA" id="TPERSONA"  style="width:100%;"  size="1" <axis:atr f="axisctr201" c="TPERSONA" a="modificable=true&obligatorio=false&isInputText=false"/> 
                                                  onchange="f_onchange_CTIPPERcerca(this.value)" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr201" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.tipPerson}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TPERSONA)&& estado.CATRIBU == __formdata.TPERSONA}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                             <select name = "TIDENTIFICACION" id="TIDENTIFICACION"  style="width:100%;" value="" 
                                                    size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr201" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="estado" items="${__formdata.listValores.tipDocum}">
                                                    <option value = "${estado.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIDENTIFICACION)&& estado.CATRIBU == __formdata.TIDENTIFICACION}"> selected </c:if>>
                                                     ${estado.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja">
                                            <input type="text" name="NIDENTIFICACION" id="NIDENTIFICACION"  value="${__formdata.NIDENTIFICACION}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                       
                                    </tr>
                                    <tr>
                                        <!-- Nombre persona -->
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="NOMBREPER" lit="105940"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                         <td class="campocaja" colspan="2">
                                            <input type="text" name="NOMBREPER" id="NOMBREPER"  value="${__formdata.NOMBREPER}"  class="campowidthinput campo campotexto"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="CLASELISTA" lit="9904431"/></b><!-- Clase lista -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="TIPOLISTA" lit="9904432"/></b><!-- Tipo lista -->
                                        </td> 
                                        
                                    </tr>
                                    <tr> 
                                        <td class="campocaja" > 
                                            <select name = "CLASELISTA" id="CLASELISTA" size="1" class="campowidthselect campo campotexto" onchange="f_actualiza_tipo();"
                                            <axis:atr f="axisctr201" c="CLASELISTA" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr201" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.claseList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CLASELISTA)&& tipo.CATRIBU == __formdata.CLASELISTA}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td class="campocaja" > 
                                            <select name = "TIPOLISTA" id="TIPOLISTA" size="1" class="campowidthselect campo campotexto"
                                                <axis:atr f="axisctr201" c="TIPOLISTA" a="modificable=true&obligatorio=false&isInputText=false"/>>
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr201" c="BLANCO" lit="108341"/> - </option>
                                                <c:forEach var="tipo" items="${__formdata.listValores.tipoList}">
                                                    <option value = "${tipo.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.TIPO)&& tipo.CATRIBU == __formdata.TIPO}"> selected </c:if>>
                                                     ${tipo.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="FINCLUDESDE" lit="9902640"/>
                                               <axis:alt f="axisctr201" c="FINCLUDESDE2" lit="104095"/></b><!--F. Inclusion desde -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="FINCLUHASTA" lit="9902640"/>
                                               <axis:alt f="axisctr201" c="FINCLUHASTA2" lit="103051"/></b><!-- F. Inclusion hasta -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="FEXCLUDESDE" lit="9902639"/>
                                               <axis:alt f="axisctr201" c="FEXCLUDESDE2" lit="104095"/></b><!-- F. Exclusión desde -->
                                        </td> 
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr201" c="FEXCLUHASTA" lit="9902639"/>
                                               <axis:alt f="axisctr201" c="FEXCLUHASTA2" lit="103051"/></b><!-- F. Exclusión hasta -->
                                        </td> 
                                        <axis:visible c="FNACIMI" f="axisctr201" >  
                                            <td class="titulocaja" >
                                             <b><axis:alt f="axisctr201" c="FNACIMI" lit="1000064"/></b><!-- F. Nacimiento -->
                                             </td> 
                                        </axis:visible>
                                    </tr>
                                    <tr>
                                        <td class="campocaja" > 
                                            <input type="text" formato="fecha" name="FINCLUDESDE" id="FINCLUDESDE" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FINIVIG}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FINCLUDESDE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr201" c="FINCLUDESDE1" lit="108341"/>" title="<axis:alt f="axisctr201" c="FINCLUDESDE2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FINCLUHASTA" id="FINCLUHASTA" style="width:30%;"   value="<fmt:formatDate value="${__formdata.FINCLUHASTA}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FINCLUHASTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr201" c="FINCLUHASTA1" lit="108341"/>" title="<axis:alt f="axisctr201" c="FINCLUHASTA2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FEXCLUDESDE" id="FEXCLUDESDE" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FEXCLUDESDE}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FEXCLUDESDE" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr201" c="FEXCLUDESDE1" lit="108341"/>" title="<axis:alt f="axisctr201" c="FEXCLUDESDE2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FEXCLUHASTA" id="FEXCLUHASTA" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FEXCLUHASTA}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FEXCLUHASTA" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr201" c="FEXCLUHASTA1" lit="108341"/>" title="<axis:alt f="axisctr201" c="FEXCLUHASTA2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                        <axis:visible c="FNACIMI" f="axisctr201" >   
                                          <td class="campocaja" >
                                            <input type="text" formato="fecha" name="FNACIMI" id="FNACIMI" style="width:40%;"   value="<fmt:formatDate value="${__formdata.FNACIMI}" pattern="dd/MM/yyyy" />" class="campowidthinput campo campotexto"/>
                                            <a id="icon_FNACIMI" style="vertical-align:middle;">
                                            <img alt="<axis:alt f="axisctr201" c="FNACIMI1" lit="108341"/>" title="<axis:alt f="axisctr201" c="FNACIMI2" lit="100883" />" src="images/calendar.gif"/></a>
                                        </td>
                                       </axis:visible>             
                                    </tr>
                                </table>    
                            </td>
                        </tr>
                        </table>
                    </td>
                </tr>
            </table>					
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscomi002</c:param><c:param name="f">axiscomi002</c:param>
                <c:param name="__botones">cancelar,buscar</c:param>
            </c:import>
            
            <script type="text/javascript">
            Calendar.setup({
            inputField     :    "FINCLUDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINCLUDESDE", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            
            Calendar.setup({
            inputField     :    "FINCLUHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINCLUHASTA", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            Calendar.setup({
            inputField     :    "FEXCLUDESDE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEXCLUDESDE", 
            singleClick    :    true,
            firstDay       :    1
            });
            
            
            Calendar.setup({
            inputField     :    "FEXCLUHASTA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FEXCLUHASTA", 
            singleClick    :    true,
            firstDay       :    1
            });
            
<axis:visible c="FNACIMI" f="axisctr201" >
            Calendar.setup({
            inputField     :    "FNACIMI",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FNACIMI", 
            singleClick    :    true,
            firstDay       :    1
            });
</axis:visible>
        
            </script>
            
        </form>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

