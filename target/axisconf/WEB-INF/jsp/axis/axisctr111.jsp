<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<%--
  Fichero: axisctr111.jsp
  Fecha: 15/09/2010
--%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<html>
    <head>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>        
        <c:import url="../include/carga_framework_js.jsp" />
        <script type="text/javascript">
        
            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/
            
            function f_onload(){
                revisarEstilos();
                <c:if test="${empty __formdata['SSEGURO']}">
                f_abrir_axisctr019();
                </c:if>
                
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
            }
                      
            function f_but_9900785() {        
            
            var inputs = document.getElementsByTagName("input");
            var params = '';
            var cont = 1;
            for(var i=0;i<inputs.length;i++){
                if(inputs[i].attributes.length>0) {
                    var inputId = inputs[i].getAttribute("id");
                      if (inputs[i].getAttribute('type') == 'checkbox'){
                          if (objDom.getComponenteMarcado(inputs[i])){
                          	idd = inputId.substr(3);
                          	valor = objDom.getValorPorId(idd);
                            params = params +'SPERSON'+cont+'='+valor+';';
                            cont++;
                          }
                      
                      }
                }
            }

               objUtiles.ejecutarFormulario ("axis_axisctr111.do?PARAMS="+params, "confirmar", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            
            function f_but_salir() {
                objUtiles.ejecutarFormulario ("main.do", "trabajo", document.miForm, "_self");
            }   
         
            /****************************************************************************************/
            /************************************* MODAL ********************************************/
            /****************************************************************************************/
            
            function f_abrir_axisctr019() {
                objUtiles.abrirModal("axisctr019","src","modal_axisctr019.do?operation=form&tipo=FE_DE_VIDA");
            }
            
            function f_cerrar_axisctr019() {
                objUtiles.cerrarModal("axisctr019");
            }    
            
            function f_aceptar_axisctr019 (SSEGURO) {
                f_cerrar_axisctr019();
                objDom.setValorComponente(document.miForm.SSEGURO, SSEGURO);
                objDom.setValorPorId("LIMPIAR_DATOS", "true");
                objUtiles.ejecutarFormulario ("axis_axisctr111.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);     
            }
            function f_marcar(thiss){
                thiss.value = thiss.checked ? 1:0;
            }
            
           

        </script>
    </head>
    <body onload="f_onload()">
        <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
        <form name="miForm" action="axis_axisctr111.do" method="POST">
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axisctr111" c="MDL_AXISCTR019" lit="1000188" /></c:param>
                <c:param name="nid" value="axisctr019" />
            </c:import>

            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="LIMPIAR_DATOS" id="LIMPIAR_DATOS" value="" />
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="modalidad"> </c:param>
                <c:param name="titulo"><axis:alt f="axisctr111" c="TITULO_PANTALLA" lit="9901459"/></c:param>
                <c:param name="formulario"><axis:alt f="axisctr111" c="TIT_FORM" lit="9901459" /></c:param>
                <c:param name="producto"> </c:param>
                <c:param name="form">axisctr111</c:param>
            </c:import>             
<!-- Area de campos  -->
    <input type="hidden" name="SSEGURO" value="${__formdata['SSEGURO']}" />
    <input type="hidden" name="SPRODUC" value="${__formdata['SPRODUC']}" />
    
    <div class="separador">&nbsp;</div>
    <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td>
            <div class="titulo"><img src="images/flecha.gif"/><axis:alt f="axisctr111" c="DATOS_POLIZA" lit="110853" /></div>
            <!--campos-->
            <table class="seccion">
                <tr>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
                    <th style="width:20%;height:0px"></th>
               </tr>
                <tr>
                    <axis:ocultar dejarHueco="false" c="NPOLIZA" f="axisctr111">
                        <td class="titulocaja"><b id="label_NPOLIZA"><axis:alt f="axisctr111" c="NPOLIZA" lit="100624"></axis:alt></b><img border="0" src="images/find.gif" onclick="f_abrir_axisctr019()" style="cursor:pointer"/></td>
                    </axis:ocultar>    
                    <axis:ocultar dejarHueco="false" c="NCERTIF" f="axisctr111">                     
                        <td class="titulocaja"><b id="label_NCERTIF"><axis:alt f="axisctr111" c="NCERTIF" lit="101168"></axis:alt></b></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="TSITUAC" f="axisctr111">
                        <td class="titulocaja"><b id="label_TSITUAC"><axis:alt f="axisctr111" c="TSITUAC" lit="100874"></axis:alt></b></td>
                    </axis:ocultar>    
                    <axis:ocultar dejarHueco="false" c="TPRODUC" f="axisctr111">
                        <td class="titulocaja"><b id="label_TPRODUC"><axis:alt f="axisctr111" c="TPRODUC" lit="100829"></axis:alt></b></td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:ocultar dejarHueco="false" c="NPOLIZA" f="axisctr111">
                        <td>
                            <input type="text" class="campowidthinput campo campotexto"  id = "NPOLIZA" name = "NPOLIZA" value="${datpoliza.NPOLIZA}" readonly="true" style="width:90%"/>                            
                        </td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="NCERTIF" f="axisctr111">
                        <td><input type="text" class="campowidthinput campo campotexto" id ="NCERTIF" name ="NCERTIF" value="${datpoliza.NCERTIF}" readonly="true" style="width:90%"/></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="TSITUAC" f="axisctr111">
                        <td>
                            <input type="text" class="campowidthinput campo campotexto"   value="${datpoliza.TSITUAC}" readonly="true" style="width:90%"/>
                        </td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="TPRODUC" f="axisctr111">
                        <td colspan="2">
                            <input type="text" class="campowidthinput campo campotexto" style="width:99%" value="${datpoliza.TPRODUC}" readonly="true" />
                        </td>
                    </axis:ocultar>                        
                </tr>
                <tr>
                    <axis:ocultar dejarHueco="false" c="FEFECTO" f="axisctr111">
                        <td class="titulocaja"><b id="label_FEFECTO"><axis:alt f="axisctr111" c="FVENCIM" lit="100883"></axis:alt></b></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FVENCIM" f="axisctr111">
                        <td class="titulocaja"><b id="label_FVENCIM"><axis:alt f="axisctr111" c="FVENCIM" lit="100885"></axis:alt></b></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FRENOVAC" f="axisctr111">
                        <td class="titulocaja"><b id="label_FRENOVAC"><axis:alt f="axisctr111" c="FRENOVAC" lit="800314"></axis:alt></b></td>
                    </axis:ocultar>
                </tr>
                <tr>
                    <axis:ocultar dejarHueco="false" c="FEFECTO" f="axisctr111">
                    <td><input type="text" class="campowidthinput campo campotexto"  value="<fmt:formatDate value="${datpoliza.FEFECTO}" pattern="dd/MM/yyyy" />" style="width:90%" readonly="true" /></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FVENCIM" f="axisctr111">
                        <td><input type="text" class="campowidthinput campo campotexto"  value="<fmt:formatDate value="${datpoliza.FVENCIM}" pattern="dd/MM/yyyy" />" style="width:90%" readonly="true" /></td>
                    </axis:ocultar>
                    <axis:ocultar dejarHueco="false" c="FRENOVAC" f="axisctr111">    
                        <td><input type="text" class="campowidthinput campo campotexto"  value="<fmt:formatDate value="${datpoliza.FCARANU}" pattern="dd/MM/yyyy" />" style="width:90%" readonly="true" /></td>
                    </axis:ocultar>
                </tr>
            </table>   
            
            <axis:ocultar dejarHueco="false" c="DSP_TOMADORES" f="axisctr111">
               <div class="separador">&nbsp;</div>
               <div class="titulo"><axis:alt f="axisctr111" c="DSP_TOMADORES" lit="1000181"></axis:alt></div>
               <!-- DisplayTag TOMADORES -->
               <c:set var="title0"><axis:alt f="axisctr111" c="TTIPIDE" lit="109774" /></c:set>
               <c:set var="title1"><axis:alt f="axisctr111" c="NNUMIDE" lit="105330" /></c:set>
               <c:set var="title2"><axis:alt f="axisctr111" c="TNOMBRE" lit="105940" /></c:set>                               
               <c:set var="title3"><axis:alt f="axisctr111" c="TSEXPER" lit="100962" /></c:set>
               <c:set var="title4"><axis:alt f="axisctr111" c="FNACIMI" lit="1000064" /></c:set>
               <c:set var="title5"><axis:alt f="axisctr111" c="TDOMICI" lit="101078" /></c:set>
                <div class="displayspace">
                     <display:table name="${tomadores}" id="tomadores" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axisctr111.do?paginar=true&tabla=tomador"> 
                       <%@ include file="../include/displaytag.jsp"%>
                       <axis:visible c="TTIPIDE" f="axisctr111">
                           <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_TOMADORES.TTIPIDE" headerClass="sortable"  style="width:11%" media="html" autolink="false" >
                               <div class="dspText">${tomadores.OB_IAX_TOMADORES.TTIPIDE}</div>
                           </display:column>
                       </axis:visible>
                       <axis:visible c="NNUMIDE" f="axisctr111">
                           <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_TOMADORES.NNUMIDE" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspText">${tomadores.OB_IAX_TOMADORES.NNUMIDE}</div>
                           </display:column>
                       </axis:visible>
                       <axis:visible c="TNOMBRE" f="axisctr111">
                           <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_TOMADORES.TNOMBRE" headerClass="sortable" style="width:23%" media="html" autolink="false" >
                               <div class="dspText">${tomadores.OB_IAX_TOMADORES.TAPELLI1} ${tomadores.OB_IAX_TOMADORES.TAPELLI2}, ${tomadores.OB_IAX_TOMADORES.TNOMBRE}</div>
                           </display:column>
                        </axis:visible>   
                        <axis:visible c="TSEXPER" f="axisctr111">
                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_TOMADORES.TSEXPER" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                               <div class="dspText">${tomadores.OB_IAX_TOMADORES.TSEXPER}</div>
                           </display:column>      
                       </axis:visible>
                       <axis:visible c="FNACIMI" f="axisctr111">
                            <display:column title="${title4}" sortable="true" sortProperty="OB_IAX_TOMADORES.FNACIMI" headerClass="sortable" style="width:20%" media="html" autolink="false" >
                               <div class="dspText"><fmt:formatDate value='${tomadores.OB_IAX_TOMADORES.FNACIMI}' pattern='dd/MM/yyyy'/></div>
                           </display:column>       
                       </axis:visible>        
                       <axis:visible c="TDOMICI" f="axisctr111">
                           <display:column title="${title5}" sortable="true" sortProperty="OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI" headerClass="sortable" style="width:33%" media="html" autolink="false" >
                               <div class="dspText">${tomadores.OB_IAX_TOMADORES.DIRECCIONES[0].OB_IAX_DIRECCIONES.TDOMICI}</div>
                           </display:column>    
                       </axis:visible>        
                    </display:table>
                </div>
            </axis:ocultar>
           
            <axis:visible c="DSP_PERCEPTORES" f="axisctr111">
                <div class="separador">&nbsp;</div>
               <div class="titulo"><axis:alt f="axisctr111" c="DSP_PERCEPTORES" lit="9901813"></axis:alt></div>
               <!-- DisplayTag TOMADORES -->
               <c:set var="title0"><axis:alt f="axisctr111" c="TIPODOC" lit="109774" /></c:set>
               <c:set var="title1"><axis:alt f="axisctr111" c="DOC" lit="105330" /></c:set>
               <c:set var="title2"><axis:alt f="axisctr111" c="NOMBRE" lit="105940" /></c:set>                               
               <c:set var="title4"><axis:alt f="axisctr111" c="FECHA_ENVIO_CARTA" lit="9901812" /></c:set>
                 <div class="displayspace">
              
        <%int cont = 0;%>
          <%  java.util.Map formdata = (java.util.Map) request.getAttribute(axis.util.Constantes.FORMDATA);%>
                <display:table name="${PERCEPTORES}" 
                id="LST_PERCEPTORES" export="false" 
                class="dsptgtable" pagesize="-1" defaultsort="1" 
                defaultorder="ascending" sort="list" 
                cellpadding="0" cellspacing="0"
                requestURI="axis_axisctr111.do?paginar=true"> 
                <c:set var="i"><%=cont%></c:set>
                <!-- Esta no necesitamos desplegarla al volver de ordenar - siempre estÃ¡ desplegada -->
                       <%@ include file="../include/displaytag.jsp"%>   
                       
                       <axis:visible c="CHECK_PERCEPTORES" f="axisctr111">
                           <display:column title="" sortable="false" 
                           sortProperty="" 
                           style="width:5%"
                           headerClass="headwidth5 sortable"  
                           media="html"  >
                           <% if (formdata.get("ck_perceptores_"+cont)!= null  ){%>
                                 <c:set var="marcado"><%=formdata.get("ck_perceptores_"+cont)%></c:set> 
                           <%}else{%>
                            <c:set var="marcado" value="0" />
                           <%}%>
                            <div class="dspIcons">
                                <input onclick="javascript:f_marcar(this)" 
                                 <c:if test="${!empty marcado && marcado == 1}">checked</c:if>
                                 type="checkbox" id="ck_perceptores_${i}" name="ck_perceptores_${i}" value="${LST_PERCEPTORES.SPERSON}"  />
                                 
                                 <input type="hidden"  id="perceptores_${i}" name="perceptores_${i}" value="${LST_PERCEPTORES.SPERSON}">
                            </div> 
                           </display:column>
                       </axis:visible>
                       <axis:visible c="TIPODOC" f="axisctr111">
                           <display:column title="${title0}" sortable="true" 
                           sortProperty="TIPODOC" 
                          style="width:10%"
                           headerClass="headwidth5 sortable"  
                           media="html" autolink="false" >
                           <div class="dspText">
                           ${LST_PERCEPTORES.TIPODOC}
                           </div>
                           </display:column>
                       </axis:visible>
                       <axis:visible c="DOC" f="axisctr111">
                           <display:column title="${title1}" sortable="true" 
                           sortProperty="DOC" 
                           style="width:15%"
                           headerClass="sortable"  media="html" 
                           autolink="false" >
                           <div class="dspText">
                           ${LST_PERCEPTORES.DOC}
                           </div>
                           </display:column>
                       </axis:visible>     
                        <axis:visible c="NOMBRE" f="axisctr111">
                           <display:column title="${title2}" sortable="true" 
                           sortProperty="NOMBRE" 
                           style="width:55%"
                           headerClass="sortable"  media="html" 
                           autolink="false" >
                           <div class="dspText">
                           ${LST_PERCEPTORES.NOMBRE}
                           </div>
                           </display:column>
                       </axis:visible> 
                       <axis:visible c="FECHA_ENVIO_CARTA" f="axisctr111">
                           <display:column title="${title4}" sortable="true" 
                           sortProperty="FECHA_ENVIO_CARTA" 
                           style="width:15%"
                           headerClass="sortable"  media="html" 
                           autolink="false" >
                           <div class="dspText">
                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LST_PERCEPTORES.FECHA_ENVIO_CARTA}"/>
                           </div>
                           </display:column>
                       </axis:visible> 
                       	  <%cont = cont +1;%>
                </display:table>
                
                </div>
            </axis:visible>
          </td>
        </tr>
    </table>
    
            <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr111</c:param>
             <c:param name="f">axisctr111</c:param>
             <c:param name="__botones">salir,9900785</c:param>
            </c:import>
            
        </form>
    <c:import url="../include/mensajes.jsp" />
    </body>
</html>

