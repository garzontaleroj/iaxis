<%/**
*  Fichero: axisdesc047.jsp
* 
*  Master/detail campanyas
*	
*
*
*  Fecha: 08/05/2013
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        
        <script language="Javascript" type="text/javascript">
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
             function f_onload(){
                
                f_cargar_propiedades_pantalla();
                //revisarEstilos();                
                //Si la selecció es buida, obrim cercador automàticament
                var hayErrores = ${!empty requestScope.__mensajes.m__clave};
                if (${empty sessionScope.AXIS_CAMPANYAS} && !hayErrores){
                   if (${__formdata.NCONSULTA == 1})
                      alert('<axis:alt f="axisdesc011" c="ALRT_011" lit="112112"/>');
                   f_but_buscar_campanya();
                }
                    
             }         
           
             function f_cerrar_modal(cual) {
                objUtiles.cerrarModal(cual);
               }
            
            function f_aceptar_axisdesc012(CCAMPANYA,TCAMPANYA) {
                objUtiles.cerrarModal("axisdesc012");
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);            
                objDom.setValorPorId("TCAMPANYA", TCAMPANYA);
                
                objUtiles.ejecutarFormulario("axis_axisdesc011.do", "busqueda_campanyas", document.miForm, "_self", objJsMessages.jslit_cargando);          
            }
            
            function f_aceptar_axisdesc013(CCAMPANYA) {
                objUtiles.cerrarModal("axisdesc013");
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);
                objUtiles.ejecutarFormulario("axis_axisdesc011.do", "busqueda_campanyas", document.miForm, "_self", objJsMessages.jslit_cargando);          
            }     

                        
           function f_abrir_axisdesc013(CCAMPANYA,MODO){
                objUtiles.abrirModal("axisdesc013", "src", "modal_axisdesc013.do?operation=init&CCAMPANYA="+CCAMPANYA+"&CMODO="+MODO); 
            }            
             
             function f_but_buscar_campanya() {
                f_abrir_modal("axisdesc012");                
             }       
           
            
             
            function f_modificar_det_campanya() {
               f_abrir_modal("axisdesc013",null,"&CMODO=mod&CCAMPANYA="+document.miForm.CCAMPANYA.value);
            }
             
             function f_abrir_modal(cual, noXButton, optionalQueryString) {         
                if (objUtiles.estaVacio(optionalQueryString))                
                    optionalQueryString = "";                    
                if (noXButton) 
                    objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");             
                objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=form" + optionalQueryString);        
                }
            
                  
             function f_seleccionar_campanya(CCAMPANYA,contador){
                //Marcar el registro de la garantía selecccionada 
                objDom.setValorPorId("CCAMPANYA", CCAMPANYA);
                objDom.setValorPorId("NCONTADOR", contador);
                
/*              objUtiles.ejecutarFormulario("axis_axisdesc011.do", "busqueda_detalle", document.miForm, "_self", objJsMessages.jslit_cargando); */
                
                //Inici Bug 0028012 - 10/10/2013 - RCL - Validación Campos Campañas/Dtos especiales
                var strURL="axis_axisdesc011.do?operation=busqueda_detalle_json&CCAMPANYA="+CCAMPANYA;
                var ajaxTexto=objJsMessages.jslit_cargando;
                objAjax.invokeAsyncCGI_JSON(strURL, callbackjsonRecuperarCampanya, ajaxTexto)
                //Fi Bug 0028012 - 10/10/2013 - RCL - Validación Campos Campañas/Dtos especiales
            }
           
           function callbackjsonRecuperarCampanya(p) {
    	
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            
            if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                
                try{
                    if (!objUtiles.estaVacio(p.JSON2.campanya) &&  p.JSON2.campanya.length > 0 ){   
                        var tbody = objLista.obtenerBodyLista("miListaId");
                        var tr = objLista.obtenerFilasBodyLista("miListaId", tbody);                  
                        objLista.borrarFilasDeLista ("miListaId", "15", '<axis:alt f="axisdesc011" c="NOREG" lit="1000254"/>');
                        objLista.borrarFilaVacia(tbody, tr);
                        
                        for (var i = 0 ; i<p.JSON2.campanya.length;i++){
                
                             var campanya = p.JSON2.campanya[i];
                             var ccampanya = objUtiles.estaVacio(campanya.OB_IAX_CAMPANYAS.TCAMPANYA)? '' : campanya.OB_IAX_CAMPANYAS.CCAMPANYA;
                             var tcampanya = objUtiles.estaVacio(campanya.OB_IAX_CAMPANYAS.TCAMPANYA)? '' : campanya.OB_IAX_CAMPANYAS.TCAMPANYA;
                             var tidioma = objUtiles.estaVacio(campanya.OB_IAX_CAMPANYAS.TIDIOMA)? '' : campanya.OB_IAX_CAMPANYAS.TIDIOMA;
                             var cidioma = objUtiles.estaVacio(campanya.OB_IAX_CAMPANYAS.CIDIOMA)? '' : campanya.OB_IAX_CAMPANYAS.CIDIOMA;
                
                            // Obtenemos el estilo para la fila que insertaremos
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven",i);
                            // Creamos una nueva fila vacia y le damos el estilo obtenido
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            newtr.setAttribute("title",ccampanya+"-"+tcampanya);
                            // Creamos un array de columnas a añadir a la nueva fila del displayTag
                            var newtd = new Array(4);
                            
                            var ttd=0;
                            
                            newtd[ttd] = objLista.addTextoEnLista(ccampanya);ttd++;
                            newtd[ttd] = objLista.addTextoEnLista(tcampanya);ttd++;
                            newtd[ttd] = objLista.addTextoEnLista(tidioma);ttd++;
                            
                            var cidioma_usu = document.miForm.CIDIOMA_USU.value;
                            if(cidioma_usu != cidioma){
                                var imgtd=document.createElement("td");
                                    imgtd.setAttribute('class','dspText');       
                                    imgtd.setAttribute('align','left');       
                                    imgtd.className="dspText";       
                                    
                                var ael = document.createElement("a");
                                var stringId = "DEL_"+ccampanya;
                                    ael.setAttribute('id',stringId);
                                var funcion_img = "javascript:f_borrar_campanyalin("+ccampanya+","+cidioma+")";
                                    ael.setAttribute('href',funcion_img);
                                var imgel = document.createElement("img");
                                    imgel.setAttribute('border','0');
                                    imgel.setAttribute('id','img_DEL_'+ccampanya);
                                    imgel.setAttribute('src','images/delete.gif');
                                    ael.appendChild(imgel);        
                                 //Cargamos el icono eliminar en el TD  
                                    //  div1.appendChild(ael);
                                    imgtd.appendChild(ael);   
                                
                                    newtd[ttd] = imgtd;ttd++; 
                            }
                            // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                            objLista.addNuevaFila(newtd, newtr, tbody); 
                        }
                        
                        // Inici - BUG 28012/157091 - RCL - 30/10/2013 - No se actualiza el 'Total' del detalle
                        var totalItems = '<axis:alt f="axisdesc011" c="TOTALREGS" lit="1000260"/>';
                        totalItems = totalItems.replace(/\{([^}]+)\}/, p.JSON2.campanya.length);
                        $("div#listaDetCapanyas .gridpagebanner").replaceWith(totalItems);
                        // Fi - BUG 28012/157091 - RCL - 30/10/2013 - No se actualiza el 'Total' del detalle
                    }
                   
                }catch(e){
                    if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
                }
                
            }
           }
        
            function f_but_salir() {
               objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }
                    
            function f_borrar_campanya(codigo){
               objDom.setValorPorId("CCAMPANYA", codigo);
               var answer = confirm(objJsMessages.jslit_confirma_borrar);
               if (answer)
                  objUtiles.ejecutarFormulario("axis_axisdesc011.do", "borrarCampanya", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }    
            
            function f_borrar_campanyalin(codigo,idioma){
            
               objDom.setValorPorId("CCAMPANYA", codigo);
               objDom.setValorPorId("CIDIOMA", idioma);
               var answer = confirm(objJsMessages.jslit_confirma_borrar);
               if (answer)
                  objUtiles.ejecutarFormulario("axis_axisdesc011.do", "borrarCampanyaLin", document.miForm, "_self", objJsMessages.jslit_borrando_registro);
            }  
            
           
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <input type="hidden" name="operation"/>
        <input type="hidden" name="radioFondos" value=""/>                
        
        <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"><axis:alt f="axispro047_mod" c="modalidad" lit="9900733"/></c:param>
                <c:param name="formulario"><axis:alt f="axispro047_frm" c="formul" lit="9900733"/></c:param>
                <c:param name="form">axisdesc011</c:param>
        </c:import>       
      
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">
                axisdesc012|<axis:alt f="axisdesc11_12" c="tit12" lit="9902359"/><%-- Cercador de campanyas --%>
            </c:param>
        </c:import>
        
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axisdesc013|<axis:alt f="axisdesc11_13" c="tit13" lit="101603"/><%-- alta/mod campanyas --%>
                </c:param>
            </c:import> 
           <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">
                    axispro050|<axis:alt f="axispro047_50" c="tit50" lit="101603"/><%-- alta/mod det garantias --%>
                </c:param>
            </c:import>             
        <input type="hidden" name="NCONTADOR" id = "NCONTADOR" value="${__formdata.NCONTADOR}" />  
        <input type="hidden" name="NCONSULTA" id = "NCONSULTA" value="${__formdata.NCONSULTA}" />  
        <input type="hidden" id="CCAMPANYA" name="CCAMPANYA" value="${__formdata.CCAMPANYA}"/>        
        <input type="hidden" id="TCAMPANYA" name="TCAMPANYA" value="${__formdata.TCAMPANYA}"/>        
        <input type="hidden" id="CIDIOMA" name="CIDIOMA" value="${__formdata.CIDIOMA}"/>     
        <input type="hidden" name="ORIGEN" id="ORIGEN" value="${__formdata.ORIGEN}" />
        <input type="hidden" name="CIDIOMA_USU" id="CIDIOMA_USU" value="${__formdata.CIDIOMA_USU}">
        <!-- Area de campos  -->
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">       
                    <tr>
                        <td> 
                          <table class="seccion">  
                           <tr>
                            <td>
                             <div class="separador">&nbsp;</div>
                             <div class="separador">&nbsp;</div>  
                          
                             <div class="titulo">
                                 <img src="images/flecha.gif"/><axis:alt f="BCamp" c="BCamp" lit="9901923"/> <img border="0" src="images/find.gif" onclick="f_but_buscar_campanya()" style="cursor:pointer" alt="<axis:alt f="BGarA1" c="BGarA1" lit="9000508"/>" title="<axis:alt f="BGarT1" c="BGarT1" lit="9000508"/>"/>
                             </div>
                             <!-- Lista de Garantías -->                           
                              <table class="area" align="center">     
                                <tr>
                                    <td>
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1">
                                           <axis:alt f="CGar" c="CGar" lit="103465"/>
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:alt f="CDGS" c="CDGS" lit="9900734"/>
                                        </c:set>
                                          <!--Imatge nou registre-->
                                         <div style="float:right;">
                                            <a href="javascript:f_abrir_axisdesc013('','NUEVO')"><img border="0" alt="<axis:alt f="NGar" c="NGar" lit="104825"/>" title="<axis:alt f="NGarA" c="NGarA" lit="104825"/>" src="images/new.gif"/></a>
                                        </div>                                    
                                        <!--Fi imatge nou registre--> 
                                        <% int contador = 0;%>                                     
                                        <div class="seccion  displayspaceGrande" >

                                            <display:table name="${sessionScope.AXIS_CAMPANYAS}"
                                                           id="miListaCampanyas"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="10"
                                                           requestURI="axis_axisdesc011.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <c:set var="contador"><%=contador%></c:set>                                            
                                              <display:column headerClass="sortable"
                                                                title=""
                                                                media="html"
                                                                autolink="false" style="width:3%">
                                                    <% 
                                                    //Bug 0028012 - 10/10/2013 - RCL - Validación Campos Campañas/Dtos especiales
                                                    String sMinValue = (String) request.getParameter(new org.displaytag.util.ParamEncoder("miListaCampanyas").encodeParameterName(org.displaytag.tags.TableTagParameters.PARAMETER_PAGE));
                                                    Integer minValue = 0;
                                                    Integer maxValue = 9;
                                                    if (sMinValue != null)
                                                    {
                                                        minValue = Integer.parseInt(sMinValue);
                                                        minValue = (minValue - 1) * 10;
                                                        maxValue = (minValue - 1) + 10;
                                                    }
                                                    %>
                                                    <c:set var="minValue"><%=minValue%></c:set>
                                                    <c:set var="maxValue"><%=maxValue%></c:set>
                                                    <div class="dspIcons">
                                                        <input type="radio" id="radioCamp_${miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}" 
                                                               name="radioCamp" value="${miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}" 
                                                               onclick="f_seleccionar_campanya('${miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}','${contador}');"
                                                               <c:if test="${__formdata.CCAMPANYA == miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}"> checked="checked" </c:if>
                                                               <c:if test="${__formdata.CCAMPANYA != miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}">
                                                                    <c:if test="${__formdata.NCONTADOR < minValue || __formdata_NCONTADOR > maxValue}">
                                                                        <c:if test="${minValue == contador}">
                                                                            checked="checked" 
                                                                        </c:if>
                                                                    </c:if>
                                                               </c:if>
                                                        />
                                                        <c:if test="${__formdata.NCONTADOR < minValue || __formdata_NCONTADOR > maxValue}">
                                                            <c:if test="${minValue == contador}">
                                                                <script language="Javascript">
                                                                    f_seleccionar_campanya('${miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}','${contador}');
                                                                </script>
                                                            </c:if>
                                                        </c:if>
                                                    </div>
                                                </display:column>                                            
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCAMPANYA"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false"  style="width:5%">
                                                   <div class="dspText">
                                                           ${miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}
                                                    </div>                                                            
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TCAMPANYA"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false"   style="width:40%">
                                                   <div class="dspText">
                                                            ${miListaCampanyas.OB_IAX_CAMPANYAS.TCAMPANYA}
                                                    </div>                                               
                                                </display:column>                                       
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   <div class="dspIcons"><a href="javascript:f_borrar_campanya('${miListaCampanyas.OB_IAX_CAMPANYAS.CCAMPANYA}');"><img border="0" alt="<axis:alt f="BGarB1" c="BGarB1" lit="1000127"/>" title="<axis:alt f="BGarB1" c="BGarB1" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                                </display:column>
                                            <%contador++;%>                                         
                                            </display:table>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>     
                    <tr>
                        <td>
                         <div class="separador">&nbsp;</div>
                          <div class="separador">&nbsp;</div>                    
                            
                             </td> 
                            </tr>  
                            <div class="separador">&nbsp;</div>                   
                        <!--Tercera part Planes Pensiones -->                    
                            <tr>
                              <td>
                            <!-- Lista de Fons -->
                              <div class="separador">&nbsp;</div>
                              <div class="separador">&nbsp;</div>   
                              <table class="area" align="center" id="tablaPla">                       
                                <tr>
                                  <th style="width:100%;height:0px"></th>                                                     
                                </tr>
                                <tr>
                                  <td>
                                      <div class="titulo">
                                        <img src="images/flecha.gif"/><axis:alt f="CampTT" c="CampTT" lit="9905558"/><!-- tit -->
                                      </div>                                
                                        <c:set var="title0">&nbsp;</c:set>
                                        <c:set var="title1">
                                            <axis:alt f="COD" c="COD" lit="1000109"/><!-- Código  -->
                                        </c:set>
                                        <c:set var="title2">
                                            <axis:alt f="DES" c="DES" lit="9900734"/>
                                        </c:set>
                                        <c:set var="title3">
                                            <axis:alt f="IDI" c="IDI" lit="1000246"/><!-- idioma -->
                                        </c:set>                                             
                                        
                                        <!--Imatge nou registre-->
                                        <div style="float:right;">
                                           <a href="javascript:f_modificar_det_campanya(${__formdata.CCAMPANYA});"><img border="0" alt="<axis:alt f="MDGAR" c="MDGAR" lit="9905026"/>" title="<axis:alt f="MDGAR" c="MDGAR" lit="9905026"/>" src="images/lapiz.gif"/></a>
                                        </div>                                    
                                        <!--Fi imatge nou registre--> 
                                        <div id="listaDetCapanyas" class="seccion  displayspaceGrande">  
                                            <display:table name="${listaDetCapanyas}"
                                                           id="miListaId"
                                                           export="false"
                                                           class="dsptgtable"
                                                           pagesize="10"
                                                           requestURI="axis_axisdesc011.do?paginar=true"
                                                           sort="list"
                                                           cellpadding="0"
                                                           cellspacing="0">
                                                <%@ include file="../include/displaytag.jsp"%>
                                                <display:column title="${title1}"
                                                                sortable="true"
                                                                sortProperty="CCAMPANYA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false" style="width:10%">
                                                               
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_CAMPANYAS['CCAMPANYA']}
                                                    </div>   
                                                </display:column>
                                                <display:column title="${title2}"
                                                                sortable="true"
                                                                sortProperty="TCAMPANYA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"
                                                                style="width:40%">
                                                   <div class="dspText">
                                                            ${miListaId.OB_IAX_CAMPANYAS['TCAMPANYA']}
                                                    </div>                                               
                                                </display:column>
                                                <display:column title="${title3}"
                                                                sortable="true"
                                                                sortProperty="CIDIOMA"
                                                                headerClass="sortable fixed"
                                                                media="html"
                                                                autolink="false"  style="width:10%">
                                                   <div class="dspText">
                                                       ${miListaId.OB_IAX_CAMPANYAS['TIDIOMA']}
                                                   </div>                                                                  
                                                </display:column>                                                 
                                                <display:column title="" sortable="false" sortProperty=""  style="width:5%" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                   
                                                   <c:if test="${__formdata.CIDIOMA_USU != miListaId.OB_IAX_CAMPANYAS['CIDIOMA']}">
                                                   <div class="dspIcons"><a href="javascript:f_borrar_campanyalin('${miListaId.OB_IAX_CAMPANYAS['CCAMPANYA']}','${miListaId.OB_IAX_CAMPANYAS['CIDIOMA']}')"><img border="0" alt="<axis:alt f="BDGAR" c="BDGAR" lit="1000127"/>" title="<axis:alt f="BDGAR" c="BDGAR" lit="1000127"/>" src="images/delete.gif"/></a></div>
                                                   </c:if> 
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
    <c:import url="../include/botonera_nt.jsp"><c:param name="f">axispro047</c:param>
      <c:param name="__botones">salir</c:param>
    </c:import>
</form><c:import url="../include/mensajes.jsp" />
</body>
</html>

