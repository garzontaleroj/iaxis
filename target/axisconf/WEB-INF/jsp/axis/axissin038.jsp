<%/*
*  Fichero: Axissin038.jsp
* 08/02/2009
* @author <a href="amartinez@csi-ti.com">Alex Martinez</a>
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
    <title> <axis:alt f="axissin038" c="title" lit="9001551"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
        
    <c:import url="../include/carga_framework_js.jsp"/>
    
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
    
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/ 
        
        function f_onload() {
        
            var cobrados = "${__formdata.COBRADOS}";
            if(!objUtiles.estaVacio(cobrados)){
                alert("<axis:alt f='axissin038' c='cobrados' lit='9901005'/>"+cobrados);
                mensaje = "<axis:alt f='axissin038' c='cobrados' lit='9901005'/>"+cobrados;
                //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE="+mensaje);
            }
               
                  cobrados = "${__formdata.COBRADOS_RENTAS}";
            if(!objUtiles.estaVacio(cobrados)){
                alert("<axis:alt f='axissin038' c='cobrados' lit='9901005'/>"+cobrados);
                mensaje = "<axis:alt f='axissin038' c='cobrados' lit='9901005'/>"+cobrados;
                //objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_doc&MENSAJE="+mensaje);
            }
                   
       
        
           f_cargar_propiedades_pantalla();
           
        }
        
        function f_cargar_propiedades_pantalla(){
            f_cargapropietatexpander();
            f_cargar_valores_defecto();
            objDependencias.modificarPropiedadesSegunModificableYVisible();
            f_carga_dependencias();
            revisarEstilos();
            }
      
        function f_but_salir() {
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }      
        
        function f_but_aceptar(){
         if (objValidador.validaEntrada()) {
            objUtiles.ejecutarFormulario ("axis_axissin038.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);    
            }
        }
        

        function f_actualizar_check(thiss,valor){
                thiss.value = thiss.checked ? valor : 0;
                objUtiles.ejecutarFormulario ("axis_axissin038.do", "actualitzarProd", document.miForm, "_self", objJsMessages.jslit_cargando);    
                
        }
        function f_seleccionarProd(valor,SPRODUC) {
             
             var parametres = '&SPRODUC='+SPRODUC;
             objAjax.invokeAsyncCGI('axis_axissin038.do?SELECCIO='+valor, callbackAjaxSeleccionarProd, 'operation=ajaxseleccionarProd'+parametres, this, objJsMessages.jslit_cargando,SPRODUC);
             
        }   
        
        function callbackAjaxSeleccionarProd(ajaxResponseText,SPRODUC) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var operationOK = objAppMensajes.existenErroresEnAplicacion(doc);  
                     if(objUtiles.estaVacio(SPRODUC)){
                        objUtiles.ejecutarFormulario ("axis_axissin038.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);    
                     }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        } 
       function f_cerrar_axisimprimir() {
              objUtiles.cerrarModal("axisimprimir");
       }
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
        
    <form name="miForm" action="" method="POST">         

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"> <b> <axis:alt c="LIT_TITOL_1" f="axissin038" lit="9901003"/></b></c:param>    
            <c:param name="formulario"> <b> <axis:alt c="LIT_TITOL_2" f="axissin038" lit="9901003"/></b></c:param> 
            <c:param name="form">Axissin038</c:param>
        </c:import>
         <c:import url="../include/modal_estandar.jsp">
                    <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axissin038" c="imprimir" lit="1000205" />|true</c:param>
            </c:import>  
        <input type="hidden" name="operation" value=""/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:25%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axissin038" c="FECHAINI" lit="100562"/></b>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="campocaja">                        
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                                   name="FECHAINI" id="FECHAINI" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata['FECHAINI']}"/>"
                                                   style="width:30%;" <axis:atr f="axissin010" c="FECHAINI" a="formato=fecha&modificable=true&obligatorio=true"/>
                                                   title="<axis:alt f="axissin038" c="FECHAINI" lit="100562"/>"/>
                                                   <a  style="vertical-align:middle;"><img id="icon_FECHAINI" alt="<axis:alt f="axissin038" c="icon_FECHAINI" lit="108341"/>" title="<axis:alt f="axissin038" c="icon_FECHAINI" lit="9000539" />" src="images/calendar.gif"/></a>
                                        </td> 
                                        </tr>
                                        <tr>
                                         <axis:ocultar c="CK_BAJAS" f="axissin038" dejarHueco="false">
                                                    <td class="campocaja"> 
                                                        <input type="radio" id="CK_OPCION" name="CK_OPCION" <c:if test="${__formdata.CK_OPCION == 2}">checked</c:if> value="${__formdata.CK_OPCION}" onclick="f_actualizar_check(this,2);"
                                                        <axis:atr f="axissin038" c="CK_OPCION" a="modificable=true"/> />
                                                       <b> <axis:alt c="CK_BAJAS" f="axissin038" lit="9901519"/></b>
                                                    </td>
                                        </axis:ocultar>
                                        
                                         <axis:ocultar c="CK_RENTAS" f="axissin038" dejarHueco="false">
                                                    <td class="campocaja"> 
                                                        <input type="radio" id="CK_OPCION" name="CK_OPCION" <c:if test="${__formdata.CK_OPCION == 1}">checked</c:if> value="${__formdata.CK_OPCION}" onclick="f_actualizar_check(this, 1);"
                                                        <axis:atr f="axissin038" c="CK_OPCION" a="modificable=true"/> />
                                                       <b> <axis:alt c="CK_RENTAS" f="axissin038" lit="109005"/></b>
                                                    </td>
                                        </axis:ocultar>
                                    </tr>   
                                    <tr>
                                     <axis:ocultar c="DSP_PRODUCTOS" f="axissin038" dejarHueco="false">
                                            <td colspan="2" class="campocaja">
                                               <!-- DisplayTag productes -->
                                                <c:set var="title0">
                                                   <axis:alt f="axissin038" c="DSP_PRODUCTOS" lit="1000307"/>
                                                </c:set>
                                                <div id="dt_productos" class="displayspace">
                                               
                                                    <display:table name="${__formdata.LSTPRODUCTOS}" id="miListaIdProductes" export="false" class="dsptgtable" pagesize="-1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                     requestURI="axis_axissin038.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column headerClass="headwidth5 sortable" title=" " media="html" autolink="false" sortable="false">
                                                            <div class="dspIcons">
                                                            <input <c:if test="${miListaIdProductes.OB_IAX_INFO.SELECCIONADO == 1}">checked</c:if> 
                                                            onclick="f_seleccionarProd(  ((this.checked)?1:0)    ,'${miListaIdProductes.OB_IAX_INFO.VALOR_COLUMNA}');"
                                                                 type="checkbox" name="checkProducto" id="checkProducto"/></div>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_INFO.NOMBRE_COLUMNA" headerClass="sortable"  media="html" autolink="false" >
                                                            <div class="dspText">${miListaIdProductes.OB_IAX_INFO.NOMBRE_COLUMNA}</div>
                                                        </display:column>
                                                        
                                                     
                                                    </display:table>
                                                </div>
                                            </td>
                                    </axis:ocultar>
                                    </tr>
                                      <tr>
                                                <td>
                                                <input type="button" onclick="f_seleccionarProd('1','')" class="boton" value="<axis:alt f="axissin038" c="SELTODOS" lit="9000756"/>"/>
                                                <input type="button" onclick="f_seleccionarProd('0','')" class="boton" value="<axis:alt f="axissin038" c="DESTODOS" lit="9000757"/>"/>
                                                </td>
                                      </tr>
                                      
                                      <c:if test="${__formdata.LISTADO == 'SI'}">
                                          <tr id="listaImpresion">
                                            <td colspan="2">
                                                <div class="separador">&nbsp;</div>     
                                                <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axissin038" c="listaImpresion" lit="112247"/></div>
                                                            
                                                <c:set var="title0"><axis:alt f="axissin038" c="FICHERO" lit="107913"/></c:set>
                                                <div class="displayspaceMaximo">
                                                <display:table name="${__formdata.LIST_FICHEROS}" id="ReportsList" export="false" class="dsptgtable" pagesize="-1" cellpadding="0" cellspacing="0"
                                                               requestURI="axis_axissin038.do?paginar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="${title0}" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                                        <div class="dspText">
                                                            <div style="cursor:pointer" onclick="objUtiles.abrirModal('axisimprimir', 'src', 'modal_axisimprimir.do?operation=tunnel&file='+escape( (this.innerText!=undefined)?this.innerText:this.textContent))"><u>${ReportsList.OB_IAX_IMPRESION.FICHERO}</u></div>
                                                         </div>
                                                        </display:column>                                                             
                                                    </display:table>                                          
                                                </div>                                                         
                                                <div class="separador">&nbsp; </div>
                                            </td>
                                          </tr>
                                      </c:if>
                                      
                                </table>  
                            </td>
                        </tr>                              
                    </table>
                </td>
            </tr>                                
        </table>

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axissin038</c:param><c:param name="f">axissin038</c:param>
            <c:param name="__botones">salir,aceptar</c:param> 
        </c:import>
    
    </form>

    <c:import url="../include/mensajes.jsp"/>

    <script type="text/javascript">       
        Calendar.setup({
            inputField     :    "FECHAINI",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FECHAINI",  
            singleClick    :    true,
            firstDay       :    1
        });
    </script>
    
</body>
</html>