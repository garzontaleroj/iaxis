<%/*
*  Fichero: axisctr075.jsp
* 12/12/2008/
* @author <a href="xpastor@csi-ti.com">Xavi Pastor</a>
*
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>



<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title> <axis:alt f="axisctr075" c="LANZADORINFORMES" lit="9001551"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    
        
    <c:import url="../include/carga_framework_js.jsp"/>

    
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_cerrar_axisimprimir() {
                objUtiles.cerrarModal("axisimprimir");
        }
        
        function f_onload() {
           f_cargar_propiedades_pantalla();
        }
      
        function f_but_salir() {
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr075", "cancelar", document.miForm, "_self");
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr075", "cancelar", document.miForm, "_self");
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }      

        
        function f_actualitzar()
              {
       
            if (!objUtiles.estaVacio(objDom.getValorPorId("CFITXER")) && 
                 objDom.getValorPorId("CFITXER") !=  "" )
                 {
                 objUtiles.ejecutarFormulario("axis_axisctr075.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
                 }
              }
             
        
        function f_but_109006() {

                    var CFICHERO = objDom.getValorPorId("CFITXER");
                    var SPARAMETROS = objDom.getValorPorId("SPARAM");
           if (objValidador.validaEntrada()) {              
                                objAjax.invokeAsyncCGI("axis_axisctr075.do?CMAP=" + CFICHERO + 
                                                            "&CPARAMETROS=" + SPARAMETROS
                                                , callbackAjaxGenerarResultado_map, "operation=ajax_generar_resultados_map", this, objJsMessages.jslit_cargando);
                                }
        }

            function callbackAjaxGenerarResultado_map (ajaxResponseText) {

                var doc = objAjax.domParse(ajaxResponseText);
               
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var fichero = objUtiles.hayValorElementoXml(doc.getElementsByTagName("RETURN")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0) : "";
                    var pinta =  objUtiles.hayValorElementoXml(doc.getElementsByTagName("PEJECUTAREP")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("PEJECUTAREP"), 0, 0) : "";
                    var resultado = objUtiles.hayValorElementoXml(doc.getElementsByTagName("VALOR")[0]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("VALOR"), 0, 0) : "-1";
                    if(objUtiles.utilEquals(fichero, "-0.csv")){
                        alert("<axis:alt f='axisctr075' c='ERRORFICHERO' lit='9000620' />");
                        document.miForm.CFICHERO.focus();
                    }else{
                        var tableM = document.getElementById("OBFICHERO");
                        var tbodyM = tableM.getElementsByTagName("tbody")[0];
                        var trM = tbodyM.getElementsByTagName("tr");
                        objLista.borrarFilasDeLista ("OBFICHERO", "1", "<axis:alt f='axisctr075' c='NOVALORES' lit='1000254' />");
                        objLista.borrarFilaVacia(tbodyM, trM);
                        
                        //Per cada fitxer
                        for (var i = 0; i < objDom.numeroDeTags(doc, "FICHERO") ; i++) {
                            fichero = (((objUtiles.hayValorElementoXml(doc.getElementsByTagName("FICHERO")[i]))? objDom.getValorNodoDelComponente(doc.getElementsByTagName("FICHERO"), i, 0) : ""));
                            if (!objUtiles.estaVacio(fichero)) {
                                // Obtenemos el estilo para la fila que insertaremos
                                var rowstyle = objLista.addEstiloEnFilaDeLista(trM, "gridEven", "gridNotEven");
                                // Creamos una nueva fila vacia y le damos el estilo obtenido
                                var newtr = objLista.crearNuevaFila(rowstyle);
                                // Creamos un array de columnas a añadir a la nueva fila del displayTag
                                var newtd = new Array(1);
                                sfichero = fichero.replace(/\\/gi, "barrainvertida");
                                newtd[0] = objLista.addTextoEnLista(fichero,
                                  "javascript:f_imprimir_fitxer('"+sfichero+"')");
                                objLista.addNuevaFila(newtd, newtr, tbodyM);  

                            }
                        }
                        
                                                          

                    }
                    
                }                
            }        

            function f_but_100001 (){ //Resultado   
                objUtiles.ejecutarFormulario("axis_axisctr075.do", "imprimir_report", document.miForm, "_new");
            }        

            function f_imprimir_fitxer(pfitxer){
                pfitxer= pfitxer.replace(/barrainvertida/gi, "\\"); 
                objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?operation=tunnel&file="+pfitxer);
            }        
          
               
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr075" c="IMP_DOCUMENTOS" lit="1000205" />|true</c:param>
    </c:import>    
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axisctr075" c="LANZA_INFORMES" lit="9001551"/></b></c:param>    
            <c:param name="formulario"> <b> <axis:alt f="axisctr075" c="LANZA_INFORMES" lit="9001551"/></b></c:param> 
            <c:param name="form">axisctr075</c:param>
        </c:import>
        
        <input type="hidden" name="operation" value=""/>
        
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <div class="separador">&nbsp;</div>
                    
                    <div class="titulo"><b><axis:alt f="axisctr075" c="LANZA_INFORMES" lit="9001551"/></b>
                    </div>

                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <%-- Área 1 --%>
                                
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:50%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>

                                    </tr>
                                    <tr> <%-- Camp1 - FITXER --%>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr075" c="CFITXER" lit="1000574" /></b>
                                                </td>
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axisctr075" c="SDESCRIPCIO" lit="100588" /></b>
                                                </td>                                                   
                                    </tr>
                                    <tr>
                                                    <axis:visible f="axisctr075" c="CFITXER">
                                                     <td class="campocaja">
                                                            <select name = "CFITXER" id ="CFITXER" size="1" onchange="f_actualitzar();"  
                                                                title="<axis:alt f="axisctr075" c="CFITXER" lit="1000574" />"
                                                                class="campowidthselect campo campotexto" 
                                                                style="width:400px" <axis:atr f="axisctr075" c="CFITXER" a="obligatorio=true"/> 
                                                                >&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr075" c="SELECCIONAR" lit="108341"/> - </option> 
                                                                <c:forEach items="${__formdata.LSTVALORES.LSTMAPS}" var="ListaMap">
                                                                    <option value = "${ListaMap.CODIGO}"
                                                                    <c:if test="${ListaMap.CODIGO  == __formdata.CFITXER}">selected
                                                                    </c:if>
                                                                    >${ListaMap.TTITULO}
                                                                    </option>
                                                                    <%-- Con esto de arriba tras seleccionar el item y recargar mantengo el valor --%>
                                                                </c:forEach>
                                                            </select>
                                                     </td>     
                                                    </axis:visible> 
                                                    <td class="campocaja">
                                                        <input type="text"  
                                                        class="campowidthinput campo campotexto" 
                                                        <axis:atr f="axisctr075" c="SDESCRIPCIO" a="modificable=false"/> 
                                                        size="15" style="width:400px"
                                                        value="${__formdata.F_GET_DATMAP.RETURN[0].TCOMENTARIO}" name="SDESCRIPCIO" id="SDESCRIPCIO"
                                                        title="<axis:alt f="axisctr075" c="SDESCRIPCIO" lit="100588"/>"/>                                     
                                                    </td>                                                     
                                      </tr>              
                                    <tr>
                                        <td class="titulocaja">
                                              <b><axis:alt f="axisctr075" c="SGUIA" lit="9001556" /></b>
                                        </td>                                    
                                    </tr> 
                                    <tr> 
                                        <td colspan="2" class="campocaja">   
                                                    <input type="text"  
                                                    <axis:atr f="axisctr075" c="SGUIA" a="modificable=false"/>  
                                                    class="campowidthinput campo campotexto" 
                                                    size="15"
                                                    value="${__formdata.F_GET_DATMAP.RETURN[0].TPARAMETROS}" name="SGUIA" id="SGUIA"
                                                    title="<axis:alt f="axisctr075" c="SGUIA" lit="9001556"/>"/>                                     
                                        </td> 
                                    </tr>
                                </table>
                            </td>
                       </tr>                              
                    </table>
                </td>
            </tr>
            <tr> 
                <td>
                    <div class="separador">&nbsp;</div>
                    <div class="titulo"><b><axis:alt f="axisctr075" c="PARAMETROS_FICHERO" lit="9001567"/></b>
                    </div>
                    <table class="seccion" align="center">
                        <tr>
                            <td>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:50%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>
                                        <th style="width:33%;height:0px"></th>

                                    </tr>
                                    <tr> <%-- Camp1 - Paràmetres--%>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr075" c="SPARAM" lit="103694" /></b>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja">
                                            <input type="text"   class="campowidthinput campo campotexto" obligatorio="true" size="15"  name="SPARAM" id="SPARAM"
                                            title="<axis:alt f="axisctr075" c="SPARAM" lit="103694"/>"/>                                     
                                        </td> 
                                    </tr> 
                                    <%-- ----------------------------- --%>
                                    <tr> <%-- Ficheros --%>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr075" c="TIT_FITX" lit="9901019"/></b>
                                        </td>   
                                    </tr>
                                    <tr>
                                        <td class="campocaja" id="fichero">
                                        <%int cont = 0;%>
                                         <c:set var="title0"><axis:alt f="axisctr075" c="FICHERO" lit="1000574"/>  </c:set>
                                          <div class="seccion displayspace">
                                            <display:table name="${__formdata.LIST_FICHEROS}" id="OBFICHERO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                             requestURI="axis_axisctr075.do?paginar=true" style="width:99.9%">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title0}" sortable="false" sortProperty="" headerClass="sortable"  media="html"  autolink="false" >
                                                </display:column>   
                                            </display:table>
                                        </div>
                        
                                          </td> 
                                    </tr>
                                </table>
                             </td>
                        </tr>
                    </table>
                </td>
            </tr>                                
         </table>
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr075</c:param>
            <c:param name="__botones">salir,109006</c:param> 
        </c:import>
    
    </form>
    
    <c:import url="../include/mensajes.jsp"/>
</body>
</html>