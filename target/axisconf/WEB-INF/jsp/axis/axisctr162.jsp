<%/*
*  Fichero: axisctr162.jsp
* 15/06/2010/
* @author <a href="jdelrio@csi-ti.com">Javi del Rio</a>
*
*/
%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f="axisctr162" c="TITULO" lit="9901610"/></title> 
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css"> 
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
        
    <c:import url="../include/carga_framework_js.jsp"/>

    
  <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
        function f_onload() {
            f_cargar_propiedades_pantalla();                
           
        }      
      
        function f_but_salir() {
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr162", "cancelar", document.miForm, "_self");
            //objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr162", "cancelar", document.miForm, "_self");
            objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
        }      

        
        function f_cargar_productos(){
          
            CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
            if (!objUtiles.estaVacio (CRAMO) ){
                objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CRAMO, null);
            
            objAjax.invokeAsyncCGI("axis_axisctr162.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }     
        
        function f_cargar_ramos(){
            CAGRPRO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CAGRPRO), "/")[0];
            if (!objUtiles.estaVacio (CAGRPRO) ){
                objDom.setValorComponente(document.miForm.CAGRUPA, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CAGRPRO), "/")[0]);
                objDom.setValorComponente(document.miForm.TAGRUPA, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.CAGRPRO), "/")[1]);
            }else
                objDom.setValorComponente(document.miForm.CAGRUPA, null);
            
            objAjax.invokeAsyncCGI("axis_axisctr162.do", callbackAjaxCargarRamos, "operation=ajax_busqueda_ramos&CAGRPRO=" + objDom.getValorComponente(document.miForm.CAGRUPA) + 
                        "&TAGRUPA=" + objDom.getValorComponente(document.miForm.TAGRUPA)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }

        function callbackAjaxCargarProductos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("SPRODUC");
                var SPRODUCCombo = document.miForm.SPRODUC;     
                objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr162" c="MIN_VAL_PROD" lit="108341"/> - ', SPRODUCCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                    objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                }
            }
        }
        
        function callbackAjaxCargarRamos (ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("CRAMO");
                var RamoCombo = document.miForm.ramoProducto;     
                objDom.borrarOpcionesDeCombo(RamoCombo);
                objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisctr162" c="RAMO_MINVAL" lit="108341"/> - ', RamoCombo, 0);
                for (i = 0; i < elementos.length; i++) {
                    var CRAMO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CRAMO"), i, 0);
                    var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRAMO"), i, 0);    
                    objDom.addOpcionACombo(CRAMO, TITULO, RamoCombo, i+1);
                }
            }
        } 
             
        
        function f_but_109006() {                                                                
                    
           if (objValidador.validaEntrada()) {              
               objUtiles.abrirModal("axisctr162export","src","modal_axisexporter.do?operation=axisctr162export&FDESDE="+document.miForm.FDESDE.value+"&FHASTA="+document.miForm.FHASTA.value+"&CLISTADO="+document.miForm.CLISTADO.value+"&COMPANIA="+document.miForm.COMPANIA.value+"&SPRODUC="+document.miForm.SPRODUC.value,400,120);           
           }
        }
        
        
        function thiss(thiss){
        thiss.value = f_formatdate(thiss);
        }
        
        function f_formatdate(entrada){
         var jDate = new JsFecha();

            if(entrada.value.length>0){
                entrada.value=jDate.formateaFecha(entrada.value);            
                if(jDate.validaFecha(entrada.value)){
                    entrada.value=jDate.formateaFecha(entrada.value);
                }else{
                    entrada.value = '';//alert('Formato fecha incorrecto para el campo '+ title);
                }
        }
         return entrada.value;
        }
      
    </script>   
</head>

<body  onload="f_onload()">
    
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisimprimir|<axis:alt f="axisctr162" c="TIT_AXISIMP" lit="1000205" />|true</c:param>
    </c:import>     
    
    <form name="miForm" action="" method="POST">         
    
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axisctr162" c="TITULO" lit="9901610"/></b></c:param>    
            <c:param name="formulario"> <b> <axis:alt f="axisctr162" c="FORM" lit="9901610"/></b></c:param> 
            <c:param name="form">axisctr162</c:param>
        </c:import> 
        
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
        <input type="hidden" name="abremodal" value="${abremodal}"/>
        <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
        <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
        <input type="hidden" id="CAGRUPA" name="CAGRUPA" value="${__formdata.CAGRUPA}"/>
        <input type="hidden" id="TAGRUPA" name="TAGRUPA" value="${__formdata.TAGRUPA}"/>
        
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
          <tr> 
                <td>   
            <table class="seccion" align="center">
                        <tr>
                            <td >
                                <%-- Área 1 --%>
                                <table class="area" align="center">
        
        <tr>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:60%;height:0px"></th>
                                    </tr>
                                    
                                    <tr>
                                        <td class="titulocaja">
                                            <b>
                                            <axis:alt f="axisctr162" c="CLISTADO" lit="102146"/> 
                                            </b>
                                        </td>
                                    </tr>
                                    <tr>
                                    <axis:ocultar c="CLISTADO" f="axisctr162" dejarHueco="false">
                                        <td class="campocaja" id="td_CLISTADO">                                                                                
                                            <select name = "CLISTADO" id="CLISTADO" title="<axis:alt f="axisctr162" c="CLISTADO" lit="9002142" />"  size="1" onchange=""
                                                class="campowidthselect campo campotexto_ob" <axis:atr f="axisctr162" c="CLISTADO" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                                <option value = ""> - <axis:alt f="axisctr162" c="CLISTADO" lit="108341"/> - </option>
                                                <c:forEach var="listados" items="${LISTADOS}">
                                                    <option value = "${listados.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CLISTADO)&& listados.CATRIBU == __formdata.CLISTADO}"> selected </c:if>>
                                                    ${listados.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                     </axis:ocultar>
                                    </tr>
                                    </table>
                                    
                                    <div class="separador">&nbsp;</div>
                                <div class="titulo"></div>
                                <div class="separador">&nbsp;</div>
                                <table class="area" align="center">
                                    <tr>
                                        <th style="width:25%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:5%;height:0px"></th>
                                        <th style="width:55%;height:0px"></th>
                                        
                                        
                                    </tr>
                                    
                                     <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr162" c="COMPANIA" lit="9000600"/></b>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                    
                                    <axis:ocultar c="COMPANIA" f="axisctr162" dejarHueco="false">
                                    <td class="campocaja" id="td_COMPANIA">
                                            <select name = "COMPANIA" id="COMPANIA"   size="1" onchange=""
                                                class="campowidthselect campo campotexto"  <axis:atr f="axisctr162" c="COMPANIA" a="modificable=true&isInputText=false"/> >
                                               <option value = ""> - <axis:alt f="axisctr162" c="COMPANIA" lit="108341"/> - </option>                                                
                                                <c:forEach var="companias" items="${COMPANIAS}">
                                                    <option value = "${companias.CCOMPANI}"  
<%--
                                                    <c:if test="${(!empty __formdata.COMPANIA.CCOMPANI)&& companias.CCOMPANI == __formdata.COMPANIA.CCOMPANI}"> selected </c:if>
                                                    --%>
                                                    <c:if test="${__formdata.COMPANIA==companias.CCOMPANI}"> selected </c:if>
                                                    >   
                                                    ${companias.TCOMPANI}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        </tr>                                        
                                          
                                          <tr>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr162" c="CAGRPRO" lit="111471"/></b>
                                        </td>
                                        <td></td>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr162" c="ramoProducto" lit="100784"/></b>                                            
                                        </td>
                                        <td></td>
                                        <td class="titulocaja" >
                                            <b><axis:alt f="axisctr162" c="SPRODUC" lit="100829"/></b>                                            
                                        </td>
                                    </tr>
                                          
                                        <axis:ocultar c="CAGRPRO" f="axisctr162" dejarHueco="false">  
                                        <td class="campocaja" id="td_CAGRPRO">
                                            <select name = "CAGRPRO" id="CAGRPRO"   size="1" onchange="f_cargar_ramos()"
                                                class="campowidthselect campo campotexto"  <axis:atr f="axisctr162" c="CAGRPRO" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value = ""> - <axis:alt f="axisctr162" c="CAGRPRO" lit="108341"/> - </option>  
                                                <c:forEach var="agrupaciones" items="${AGRUPACIONES}">   
                                                    <option value = "${agrupaciones.CATRIBU}"                                                  
                                                    >
                                                    ${agrupaciones.TATRIBU}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <td></td>
                                        <axis:ocultar c="ramoProducto" f="axisctr162" dejarHueco="false">  
                                        <td class="campocaja" id="td_ramoProducto">   
                                            <select name = "ramoProducto" id ="ramoProducto"   size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr162" c="ramoProducto" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr162" c="ramoProducto" lit="108341"/> - </option>   
                                                <c:forEach var="ramos" items="${RAMOS}">    
                                                    <option value = "${ramos.CRAMO}"
                                                        <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>   
                                                        ${ramos.TRAMO}
                                                    </option>
                                                </c:forEach>
                                            </select>
                                        </td>   
                                        </axis:ocultar>
                                        <td></td>          
                                        <axis:ocultar c="SPRODUC" f="axisctr162" dejarHueco="false">  
                                        <td class="campocaja" id="td_SPRODUC">
                                            <select name = "SPRODUC" id ="SPRODUC" size="1" style="width:60%;" onchange="" class="campowidthselect campo campotexto"
                                            <axis:atr f="axisctr162" c="SPRODUC" a="modificable=true&obligatorio=false&isInputText=false"/> >
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr162" c="SPRODUC" lit="108341" /> - </option>                                                
                                                <c:forEach items="${productos}" var="item">
                                                    <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        </axis:ocultar>
                                        <tr>                                                            
                                    <td class="titulocaja">                                    
                                            <b><axis:alt f="axisctr162" c="FDESDE" lit="9000526"/></b> <!--DATA INICI-->
                                        </td>
                                        <td class="titulocaja" colspan="2">
                                            <b><axis:alt f="axisctr162" c="FHASTA" lit="9000527"/></b> <!--DATA FI-->
                                        </td>                                       
                                        </tr>
            <tr> 
          
            <axis:ocultar c="FDESDE" f="axisctr162" dejarHueco="false">  
              <td class="campocaja">
                    <input type="text" class="campowidthinput campo campotexto" id="FDESDE" name="FDESDE" size="15" onchange="thiss(this);"
                    <axis:atr f="axisctr162" c="FDESDE" a="formato=fecha&obligatorio=true"/>
                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FDESDE}"/>" style="width:35%"
                    title="<axis:alt f="axisctr162" c="FDESDE" lit="9000526"/>"/><a style="vertical-align:middle;"><img
                    id="icon_FDESDE" alt="<axis:alt f="axisctr162" c="ICON_FDESDE" lit="108341"/>" title="<axis:alt f="axisctr162" c="ICON_FDESDE" lit="108341" />" src="images/calendar.gif"/></a>
                </td>    
             </axis:ocultar>
             <axis:ocultar c="FHASTA" f="axisctr162" dejarHueco="false">  
              <td class="campocaja" colspan="2">
                    <input type="text" class="campowidthinput campo campotexto" id="FHASTA" name="FHASTA" size="15" onchange="thiss(this);"
                    <axis:atr f="axisctr162" c="FHASTA" a="formato=fecha&obligatorio=true"/>
                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FHASTA}"/>" style="width:35%"
                    title="<axis:alt f="axisctr162" c="FHASTA" lit="9000527"/>"/><a style="vertical-align:middle;"><img
                    id="icon_FHASTA" alt="<axis:alt f="axisctr162" c="ICON_FHASTA" lit="108341"/>" title="<axis:alt f="axisctr162" c="ICON_FHASTA" lit="108341" />" src="images/calendar.gif"/></a>
                </td>    
             </axis:ocultar>                
           
           </table>
            </td>
            </tr>  
           </table>
           </td>
           </tr>           
         </table>
                

        <c:import url="../include/botonera_nt.jsp">
            <c:param name="f">axisctr162</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr162" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axisXXXplantilla" c = "BT_EJECUTAR" dejarHueco="false">,109006</axis:ocultar></c:param>
        </c:import>
        
        <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FDESDE",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FDESDE", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
     <script type="text/javascript">
    Calendar.setup({
        inputField     :    "FHASTA",     
        ifFormat       :    "%d/%m/%Y",      
        button         :    "icon_FHASTA", 
        singleClick    :    true,
        firstDay       :    1
    });
    </script>
    
    </form>   
    
    <c:import url="../include/mensajes.jsp"/>
    
    <c:import url="../include/modal_estandar.jsp">
            <c:param name="f">axisctr162</c:param>        
            <c:param name="nid">axisctr162export</c:param>
            <c:param name="botonCerrar" value="true" />
    </c:import>  
    
</body>
</html>