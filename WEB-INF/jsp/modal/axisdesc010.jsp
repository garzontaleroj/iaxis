<%
/**
*  Fichero: axisdesc010.jsp
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  Fecha: 13/07/2010
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <c:import url="../include/carga_framework_js.jsp" />
    
    
    <script language="Javascript" type="text/javascript">
        function f_onload() {
            f_cargar_propiedades_pantalla();
            
         <c:if test="${respuestaOK == 'OK'}" >
         parent.f_recargar();
         </c:if>
         

         <c:if test="${!empty(__formdata.SPRODUC)}" >
            f_cargar_actividades();
         </c:if>
         

        }
        
        function f_but_cancelar() {
            parent.f_aceptar_axisdesc010();
        }        
        
        function f_but_buscar() {
          if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc004.do", "buscar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
            
        }
         
        function f_but_aceptar () {
        
                //calculamos el número de campos
                var campos = document.miForm.num.value;
                //calculamos el nivel correspondiente
                var NIVEL = 0;
                    if(document.miForm.SPRODUC.value != null && document.miForm.CACTIVI.value !=null && document.miForm.CGARANT.value != null)
                    {
                      if(document.miForm.SPRODUC.value >0 && document.miForm.CACTIVI.value >0 && document.miForm.CGARANT.value >0 ){
                        NIVEL = 3;
                      }else if(document.miForm.SPRODUC.value >0 && document.miForm.CACTIVI.value >0 ){
                         NIVEL = 2;
                      }else if(document.miForm.SPRODUC.value >0){
                          NIVEL = 1;
                      }
                }
               //alert("Antes de aceptar"); 
               if (objValidador.validaEntrada()) objUtiles.ejecutarFormulario("modal_axisdesc010.do?CAMPOS="+campos+"&NIVEL="+NIVEL, "aceptar", document.miForm, "_self", objJsMessages.jslit_buscando_polizas);
         
            
         }

         function f_cargar_desccuentos(){
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axisdesc004.do", callbackAjaxCargarDescuentos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
        }      

            function callbackAjaxCargarDescuentos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc010" c="MIN_VALUE" lit="108341"/> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                   amagarDisplay();

                }
            }            

            function amagarDisplay(){
                try{
                    var tbodyadded = objLista.obtenerBodyLista("miListaId");
                    var tradded = objLista.obtenerFilasBodyLista("miListaId", tbodyadded);
                    objLista.borrarFilasDeLista ("miListaId", "5", "<axis:alt f='axisdesc010' c='MENSAJE' lit='1000254' />");
                    var spanners = document.getElementsByTagName("span");
                    for(var i=0;i<spanners.length;i++) {
                        if (spanners[i].className == "gridpagebanner")
                            spanners[i].innerHTML = "";
                        if (spanners[i].className == "gridpagelinks")
                            spanners[i].innerHTML = ""; 
                    }
               } catch(e){alert(e);}
            }
            
            
       function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
                
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    
                
            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
        }
        
        function f_aceptar_axisdesc007() {
            f_cerrar_modal('axisdesc007');
        }
        
        function f_cerrar_modal(cual) {
            objUtiles.cerrarModal(cual);
        } 
        
        function f_abrir_axisdesc011 (cdesc,cmodcom,finivig) {
            var SPRODUC = null;
            var CACTIVI = null;
            var CGARANT = null;
            if (!objUtiles.estaVacio(document.miForm.SPRODUC.value)) SPRODUC = document.miForm.SPRODUC.value;
            if (!objUtiles.estaVacio(document.miForm.CACTIVI.value)) CACTIVI = document.miForm.CACTIVI.value;
            if (!objUtiles.estaVacio(document.miForm.CGARANT.value)) CGARANT = document.miForm.CGARANT.value;
            
            if (objValidador.validaEntrada()) objUtiles.abrirModal("axisdesc011", "src", "modal_axisdesc011.do?operation=init&PSPRODUC=" +SPRODUC+"&PCACTIVI="+CACTIVI+"&PCGARANT="+CGARANT+"&PCDESC="+cdesc+"&PCMODCOM="+cmodcom+"&PFINIVIG="+finivig);
        } 
        
        
        function f_cargar_actividades(){
                    
                    objAjax.invokeAsyncCGI("modal_axisdesc010.do", callbackAjaxCargarActividades, "operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&SPRODUC=" + objDom.getValorComponente(document.miForm.SPRODUC), this, objJsMessages.jslit_cargando);
            }      

        function callbackAjaxCargarActividades (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("element");
                    
                    var CACTIVICombo = document.miForm.CACTIVI;     
                    var CACTIVI1;
                    objDom.borrarOpcionesDeCombo(CACTIVICombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc010" c="MIN_VALUE" lit="108341"/> - ', CACTIVICombo, 0);
                   //alert("1");
                       for (i = 0; i < elementos.length; i++) {
                        //alert("2");
                            if(i== 0)
                                CACTIVI1 = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), i, 0);
                            var CACTIVI = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CACTIVI"), i, 0);
                            var TTITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(CACTIVI, TTITULO, CACTIVICombo, i+1);
                        }
                    objDom.setValorPorId("CACTIVI",CACTIVI1);
                    f_cargar_garantias();
                

                }
            }
            
            
            
        function f_cargar_garantias(){
        
                    CRAMO = document.miForm.CRAMO.value;
                    SPRODUC = document.miForm.SPRODUC.value;
                    CACTIVI = document.miForm.CACTIVI.value;
                 
                    objAjax.invokeAsyncCGI("modal_axisdesc010.do", callbackAjaxCargarGarantias, "operation=ajax_busqueda_garantias&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&SPRODUC=" + document.miForm.SPRODUC.value +"&CACTIVI="+document.miForm.CACTIVI.value, this, objJsMessages.jslit_cargando);
            
        }      

        function callbackAjaxCargarGarantias (ajaxResponseText){
                //alert(ajaxResponseText);
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("element");
                    
                    var CGARANTCombo = document.miForm.CGARANT;     
                   objDom.borrarOpcionesDeCombo(CGARANTCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axisdesc010" c="MIN_VALUE" lit="108341"/> - ', CGARANTCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CGARANT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CGARANT"), i, 0);
                            var TGARANT = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TGARANT"), i, 0);                                     
                            objDom.addOpcionACombo(CGARANT, TGARANT, CGARANTCombo, i+1);
                        }
                   

                }
            }
        
        
        function f_guardar_valores(num_campos){
             f_guardar_porcentaje(num_campos);
        }
        
        function f_guardar_porcentaje(num){
        
                    
                    
                   // if (objValidador.validaEntrada()) {   
                   //   alert("Antes de guardar porcentaje");          
                   //             MODALIDAD = eval("document.miForm.MODALIDAD_"+num+".value");
                   //             PORCENTAJE = eval("document.miForm.PORCENTAJE_"+num+".value");
                   //             alert("porcentaje: "+PORCENTAJE);
                   //             objAjax.invokeAsyncCGI("modal_axisdesc010.do", callbackAjaxCargarPorcentaje, "operation=ajax_guardar_porcentaje&PORCENTAJE=" + PORCENTAJE + "&MODALIDAD="+ MODALIDAD + "&CGARANT="+document.miForm.CGARANT.value +"&CACTIVI="+document.miForm.CACTIVI.value+"&SPRODUC="+document.miForm.SPRODUC.value +"&CRAMO="+document.miForm.CRAMO.value +"&CdescSI="+document.miForm.CDESC.value + "&NIVEL="+NIVEL +"&FINIVIG="+document.miForm.FINIVIG.value, this, objJsMessages.jslit_cargando);
                    
                   // }
        
        }
        
       
        //function callbackAjaxCargarPorcentaje (ajaxResponseText){
        //        var doc=objAjax.domParse(ajaxResponseText);
        //        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    

        //       }
        //}     
         
            
    </script>
  </head>
    <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisdesc007|<axis:alt f="axisdesc010" c="TIT_AXISDESC007" lit="9903508"/></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" id="CDESC" name="CDESC" value="${__formdata.CDESC}"/>
            <input type="hidden" id="FINIVIG" name="FINIVIG" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>"/>
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt f="axisdesc010" c="FORM" lit="9903506" /></c:param>
                <c:param name="producto"><axis:alt f="axisdesc010" c="FORM" lit="9903506"/></c:param>
                <c:param name="form">axisdesc010</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisdesc010" c="NIVELES" lit="9902456" /></c:param>
                <c:param name="nid" value="axisdesc011" />
            </c:import>
            <!-- Area de campos  -->
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        
                        <table class="seccion" id="LISTA">
                            <tr>
                                <th style="width:35%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                            </tr>
                            
                            <tr>
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc010" c="PRODUCTO" lit="100829" /></b><!-- Producto -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc010" c="ACTIVIDAD" lit="103481" /></b><!-- Actividad -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc010" c="GARANTIA" lit="110994" /></b><!-- Garantía -->
                                    
                                </td>
                                <td class="titulocaja">
                                    
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                        <select name = "SPRODUC" id="SPRODUC"  size="1" <axis:atr f="axisdesc010" c="SPRODUC" a="modificable=true&obligatorio=true&isInputText=false"/> onchange="f_cargar_actividades()" class="campowidthselect campo campotexto_ob">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc010" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="producto" items="${sessionScope.productos}">
                                                <option value = "${producto.SPRODUC}"
                                                    <c:if test="${producto.SPRODUC == __formdata.SPRODUC}">selected</c:if>>
                                                    ${producto.TTITULO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                 </td>
                                 <td class="campocaja">
                                        <select name = "CACTIVI" id="CACTIVI" style="width:200px;"  size="1" onchange="f_cargar_garantias()" class="campowidthselect campo campotexto_ob">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc010" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="actividad" items="${axisctr_listaActividad}">
                                                <option value = "${actividad.CRAMO}/${actividad.TRAMO}"
                                                    <c:if test="${actividad.CRAMO == __formdata.CACTIVI}">selected</c:if>>
                                                    ${actividad.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                 </td>
                                    
                                 <td class="campocaja">
                                        <select name = "CGARANT" id="CGARANT" style="width:200px;" size="1" onchange="" class="campowidthselect campo campotexto_ob">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisdesc010" c="MIN_VALUE" lit="108341"/> - </option>
                                            <c:forEach var="garantia" items="${axisctr_listaGarantia}">
                                                <option value = "${garantia.CRAMO}/${garantia.TRAMO}"
                                                    <c:if test="${garantia.CRAMO == __formdata.CGARANT}">selected</c:if>>
                                                    ${garantia.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                    
                                    
                                <td class="titulocaja">
                                </td>
                            </tr>
                            <% int i = 1; %> 
                            <c:forEach var="modalidad" items="${lista_mod}">
                                               
                                            
                            <tr>
                                
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc010" c="CMODALI" lit="100943" /></b><!-- Modalidad -->
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axisdesc010" c="PDESC" lit="101467" /></b><!-- Porcentaje -->
                                </td>
                                <td class="titulocaja">
                                    
                                    
                                </td>
                                <td class="titulocaja">
                                    
                                </td>
                            </tr>
                            <tr>
                                 <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" readonly value="${modalidad.CATRIBU} - ${modalidad.TATRIBU}" name="MODALIDAD" id="MODALIDAD"/>
                                    <input type="hidden" class="campowidthinput campo campotexto" size="15" readonly value="${modalidad.CATRIBU}" name="MODALIDAD_<%=i%>" id="MODALIDAD_<%=i%>"/>
                                 </td>
                                <td class="campocaja">
                                    <c:if test="${__configform.axisdesc010__PDESC__modificable != 'false'}">
                                        <input type="text" class="campowidthinput campo campotexto" value="<fmt:formatNumber value="" pattern="###,##0.00"/>" onblur="" name="PORCENTAJE_<%=i%>" id="PORCENTAJE_<%=i%>" size="10"/>
                                    </c:if>
                                    <c:if test="${__configform.axisdesc010__PDESC__modificable == 'false'}">
                                        <input type="hidden" class="campowidthinput campo campotexto" value="" name="PORCENTAJE_<%=i%>" id="PORCENTAJE_<%=i%>" size="10"/>
                                        <axis:visible f="axisdesc010" c="BUT_NIVELES">
                                            <img border="0" alt="<axis:alt f="axisdesc010" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axisdesc010" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                             style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc011 ('${__formdata.CDESC}','${modalidad.CATRIBU}','<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>')"/>                                     
                                        </axis:visible>
                                    </c:if>
                                    
                                </td>
                                <td class="campocaja">
                                <c:set var="num_campos"><%= i %></c:set> 
                                    <c:if test="${__configform.axisdesc010__PDESC__modificable != 'false'}">
                                        <axis:visible f="axisdesc010" c="BUT_NIVELES">
                                            <img border="0" alt="<axis:alt f="axisdesc010" c="NIVELES" lit="9902456"/>" title1="<axis:alt f="axisdesc010" c="NIVELES" lit="9902456"/>" src="images/lapiz.gif" 
                                             style="cursor:pointer;" onclick="javascript:f_abrir_axisdesc011 ('${__formdata.CDESC}','${modalidad.CATRIBU}','<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINIVIG}"/>')"/>                                     
                                        </axis:visible>
                                    </c:if>
                                </td>      
                                <td class="titulocaja">
                                </td>
                            </tr>
                            <% i++; %>
                            
                            </c:forEach>
                            <tr><td><input type="hidden" value="${num_campos}" name="num" id="num"></td></tr>                            
                        </table>
                       
                    </td>
                </tr>
                
            </table>
            
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisdesc010</c:param>
                <c:param name="f">axisdesc010</c:param>
                <c:param name="__botones">cancelar,aceptar</c:param>
            </c:import>
     </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>