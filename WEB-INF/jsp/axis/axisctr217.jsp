<%/**
*  Fichero: axisctr217.jsp
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavier Gallego</a>
*  
*  S?ptima pantalla del flujo de trabajo "Ahorros y rentas". 
*
*
*  Fecha: 12/03/2007
*/
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title><axis:alt f="axisctr217" c="TITOLAXISCRT007" lit="1000197"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <link rel="stylesheet" href="styles/displaytag.css">        
        <c:import url="../include/carga_framework_js.jsp" />
         <script  type="text/javascript">
         
    function f_onload_axisctr217(){
      f_recargarInversion(document.getElementById("NMODELO").value); 
      f_cargar_propiedades_pantalla();         
    }

    function f_recargarInversion(idModelo){
              
              if(idModelo >=0){
                 document.axisctr217Form.CMODINV.value = idModelo;
              
                var params="&CMODINV="+idModelo+"&TIPMOD="+document.getElementById("TIPMOD").value;
                
                params = params + "&SPRODUC="+document.axisctr217Form.SPRODUC.value; 
                objAjax.invokeAsyncCGI("axis_axisctr217.do", callbackRecargarFondos, "operation=recargarMODINVFONDO" + params, this, objJsMessages.jslit_cargando);
              }else{
                  objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axisctr217' c='litvacio' lit='1000254' />");
              }
          
          }
          
    function callbackRecargarFondos(ajaxResponseText){
              var is_ie = navigator.userAgent.toLowerCase().indexOf('msie ') > -1;
              var doc=objAjax.domParse(ajaxResponseText);
          
            if (!objAppMensajes.existenErroresEnAplicacion(doc)){
                var table = document.getElementById("MODINVFONDO");
                var tHead = table.getElementsByTagName("thead")[0];
                var trHead = tHead.getElementsByTagName("tr");               
                var tbody = table.getElementsByTagName("tbody")[0];
                var tr = tbody.getElementsByTagName("tr");
                
                // Borrar todos los registros existentes
                objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axisctr217' c='litvacio' lit='1000254' />");
                
               if (objDom.existeTag(doc, "CCODFON") )
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbody, tr);
                
                // Bucle para insertar cada una de las filas
                
                for (var i = 0; i < objDom.numeroDeTags(doc, "CCODFON") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(4);
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                   
                    if(document.axisctr217Form.CMODINV.value != document.axisctr217Form.perfLibre.value){
                        newtd[0] =  objLista.addCheckBoxEnLista("ccodfon"+valorCheck,valorCheck,'',true);
                        newtd[0].getElementsByTagName("input")[0].disabled=true;
                        //newtd[0] = objLista.addNumeroEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0));
                        newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFON"), i, 0)+" - "+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFONL"), i, 0));
                        var valorCheck = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0);
                   
                    if(document.getElementById("TIPMOD").value == 2){
                            if(doc.getElementsByTagName("PINVERS")[i].childNodes[0] != null){
                                    newtd[2] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0));

                                    if ( ths != null ) {
                                     ths[ths.length-1].InnerHTML='<axis:alt f="axisctr217" c="100INVERSION" lit="sssssssss"/>';
                                    }
                                }else{
                                    newtd[2]=objLista.addTextoEnLista(""); 


                                    if ( ths != null ) {
                                      ths[ths.length-1].InnerHTML='<axis:alt f="axisctr217" c="100INVERSION" lit="sssssssss"/>';
                                    }
                               }
                            }else if(document.getElementById("TIPMOD").value == 1){
        
                                if(doc.getElementsByTagName("IVALACT")[i].childNodes[0] != null ){
                                    newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALACT"), i, 0));
                                }else{
                                    newtd[3]=objLista.addTextoEnLista(""); 
                               }



                            }
                    }else{
                        
                        
                        var valorCheck = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0);
                        var checked = false;
                
                        if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBLIGA"), i, 0)==1){
                                      checked = true;
                        }
                        
                        newtd[0] =  objLista.addCheckBoxEnLista("ccodfon"+valorCheck,valorCheck,'',checked);
                        newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFON"), i, 0)+"-"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFONL"), i, 0));
                    
                       var newtdInv = document.createElement("td");
                       var newdivInv = document.createElement("div");
                            newdivInv.className = "dspText";
                 
                 if(document.getElementById("TIPMOD").value == 2){
                       var inputInv = document.createElement("input");
                       
                           inputInv.setAttribute("type", "text");
                           inputInv.setAttribute("name" , "pinvers"+valorCheck);
                           inputInv.setAttribute("id" , "pinvers"+valorCheck);
                          
                     
                           if(doc.getElementsByTagName("PINVERS")[i].childNodes[0] != null )
                             //inputInv.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0) );


                             if (checked){
                                inputInv.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0));
                             }
                        newdivInv.appendChild(inputInv);
                        newtdInv.appendChild(newdivInv);
                        
                        newtd[2] = newtdInv;
                     
                 }else if(document.getElementById("TIPMOD").value == 1){
                        var newtdImp = document.createElement("td");
                           var newdivImp = document.createElement("div");
                               newdivImp.className = "dspText";
                           var inputImp = document.createElement("input");
                           
                           inputImp.setAttribute("type", "text");
                           inputImp.setAttribute("name" , "ivalact"+valorCheck);
                           inputImp.setAttribute("id" , "ivalact"+valorCheck);



                           if(doc.getElementsByTagName("IVALACT")[i].childNodes[0] != null )
                            //inputImp.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALACT"), i, 0) );


                             if (checked){
                              inputImp.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("IVALACT"), i, 0));


                             }
                            newdivImp.appendChild(inputImp);
                            newtdImp.appendChild(newdivImp);
                            
                            newtd[3] = newtdImp;
                               
                             
                 }
                        
                        
                    }
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbody);
                    
                }
                if(document.getElementById("TIPMOD").value == 2){
                       var ths = trHead[0].getElementsByTagName("th");
                        if(ths.length <3){
                            var th = document.createElement("th");
                              th.setAttribute("class",  "sortable gridsortable");
                             th.innerHTML='<axis:alt f="axisctr217" c="100INVERSION" lit="9001353"/>';
                             trHead[0].appendChild(th);
                        }else{
                            
                           ths[ths.length-1].innerHTML = '<axis:alt f="axisctr217" c="100INVERSION" lit="9001353"/>';
                        }
                    }else if (document.getElementById("TIPMOD").value == 1){
                        var ths = trHead[0].getElementsByTagName("th");
                        if(ths.length <3){
                           var th = document.createElement("th");
                                th.innerHTML='<axis:alt f="axisctr217" c="IVALACT" lit="100563"/>';
                                th.setAttribute("class",  "sortable gridsortable");
                               trHead[0].appendChild(th);
                        }else{
                            
                            ths[ths.length-1].innerHTML = '<axis:alt f="axisctr217" c="IVALACT" lit="100563"/>';
                        }
                               
                    }else{
                        var ths = trHead[0].getElementsByTagName("th");
                         trHead.removeChild(ths.length-1);
                    }
                
            }
             
          }

             
             
    function f_but_siguiente() {
                        
               if(document.axisctr217Form.CMODINV.value != document.axisctr217Form.perfLibre.value){
                    if(!objValidador.validaEntrada()){
                        return;
                    }
                }
                
                var lista = document.getElementById("MODINVFONDO");
                
                var inputs  = lista.getElementsByTagName("input");
                var checkeds =0;
                for ( i in inputs){
                    if(inputs[i].type == 'checkbox' && inputs[i].checked && !inputs[i].disabled){
                        checkeds += 1;
                    if (document.getElementById("TIPMOD").value == 1){  
                       if(document.getElementById('ivalact'+inputs[i].value).value < 0){
                            alert(document.getElementById('ivalact'+inputs[i]).title + " : " + objJsMessages.jslit_campo_obligatorio + ".");
                            return;                            
                        }
                    }else if (document.getElementById("TIPMOD").value == 2){
                        if(document.getElementById('pinvers'+inputs[i].value).value < 0){
                            alert(document.getElementById('pinvers'+inputs[i]).title + " : " + objJsMessages.jslit_campo_obligatorio + ".");
                            return;                            
                        }
                       }
                    }
                    
                }
              
                if (document.axisctr217Form.CMODINV.value == document.axisctr217Form.perfLibre.value && checkeds <= 0){
                   alert(objJsMessages.jslit_selecciona_registro + ".");
                   return;  
                }
                   
                   
                objDom.setValorPorId("FORM_ACT","axisctr217");
                //f_habilitar_campos();
                objUtiles.ejecutarFormulario("axis_axisctr217.do", "siguiente", document.axisctr217Form, "_self");
             }
    
    function f_but_anterior(){
        objUtiles.ejecutarFormulario("axis_axisctr217.do", "anterior", document.axisctr217Form, "_self");
    }
    function f_but_cancelar() {
        
         objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr217", "cancelar", document.axisctr217Form, "_self");
        
        
            } 
    function f_change_tipmod(val){
             f_recargarInversion(document.getElementById("NMODELO").value);         
    }
         </script>

    </head>
    <body onload="f_onload_axisctr217();">
       <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
         <c:set var="pantalla" value="axisctr217"/>
<form name="${pantalla}Form" action="" method="POST">
     <input type="hidden" name="operation" value=""/>
       <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="${__formdata.FORM_ACT}"/>
      <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
      <input type="hidden" name="CMODINV" value="${__formdata.CMODINV}"/>
       <input type="hidden" name="perfLibre" value="${__formdata.perfLibre}"/>
        <c:set var="modalidad">
            <c:choose>
                <c:when test="${sessionScope.MODO eq 'SIMULACION'}">
                <axis:alt f="axisctr217" c="MODO_SIMULACION" lit="108021" />
                </c:when>
                <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA'}">
                <axis:alt f="axisctr217" c="MODO_ALTA" lit="101110" />
                </c:when>
                <c:otherwise>
                <axis:alt f="axisctr217" c="MODO_OTROS" lit="104752" />
                </c:otherwise>
            </c:choose>
        </c:set>
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="modalidad">${modalidad}</c:param>
            <c:param name="titulo"></c:param>
            <c:param name="formulario">${literalPantalla}</c:param>
            <c:param name="form">${pantalla}</c:param>
        </c:import>
        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
            <tr>
                 <td align="left">
                   <div class="titulo"><img src="images/flecha.gif"/>
                        <axis:alt f="axisctr217" c="DSP_MODELOSINV_lit" lit="9001351"></axis:alt> 
                    </div> 
                    <table class="seccion">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr217" c="NMODELO" lit="9001350"></axis:alt> </b>
                                        </td>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr217" c="TIPMOD" lit="9901139"></axis:alt> </b>
                                        </td>
                                    </tr>
                                    <tr>
                                           <td class="campocaja">
                                                    <select name="NMODELO" id="NMODELO" title="<axis:alt f="axisctr217" c="NMODELO" lit="9001350"/>"                                           
                                                         <axis:atr f="axisctr217" c="NMODELO" a="obligatorio=true&modificable=true&isInputText=false"/>                                                    
                                                         <c:if test="${sessionScope.MODO != 'SIMULACION'  && sessionScope.MODO != 'ALTA_POLIZA'}">disabled='disabled'</c:if>
                                                         size="1" class="campowidthselect campo campotexto" style="width:20%;"
                                                         onchange="f_recargarInversion(this.value)">&nbsp;
                                                         <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr217" c="LST_PERFILES" lit="1000348"/> - </option>
                                                        
                                                        <c:forEach var="element" items="${requestScope.LST_PERFILES}">
                                                            <option value="${element.CMODINV}"
                                                                        <c:if test="${__formdata.CMODINV == element.CMODINV }"> selected="selected"</c:if>>
                                                                ${element.TMODINV}   
                                                            </option>
                                                        </c:forEach>
                                                    </select>                                            
                                            </td>
                                            <td class="campocaja">
                                            <!--LSTTIPMOD-->
                                                    <select name="TIPMOD" id="TIPMOD"                                         
                                                            <axis:atr f="axisctr217" c="TIPMOD" a="obligatorio=true&modificable=true&isInputText=false"/>                                                    
                                                            size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                                    onchange="f_change_tipmod(this.value)">
                                                        <c:forEach var="element" items="${requestScope.LSTTIPMOD}">
                                                            <option value="${element.CATRIBU}"
                                                                        <c:if test="${__formdata.TIPMOD == element.CATRIBU }">selected</c:if>>
                                                                ${element.TATRIBU}   
                                                            </option>
                                                        </c:forEach>
                                                    </select>                                            
                                            </td>
                                    </tr>                                        
                                        <tr>
                                            <td>
                                                <c:set var="title0"><axis:alt f="axisctr217" c="CODFONDO" lit="9001352"/></c:set>    <!-- Cod. Fondo -->
                                                <c:set var="title1"><axis:alt f="axisctr217" c="FONDO" lit="108263"/></c:set>     <!-- Fondo -->
                                                <c:set var="title2"><axis:alt f="axisctr217" c="100INVERSION" lit="9001353"/></c:set>    <!-- % de inversión -->
                                                <c:set var="title3"><axis:alt f="axisctr217" c="IVALACT" lit="100943"/></c:set>
                                                <div class="displayspace" style="width:60%;max-height:100%">
                                                    <display:table name="${__formdata.MODINVFONDO}" id="MODINVFONDO" export="false" class="dsptgtable" pagesize="-1"
                                                       defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
                                                         <%@ include file="../include/displaytag.jsp"%>
                                                        <axis:visible f="axisctr217" c="CCODFON">
                                                             <display:column title="" sortable="true" sortProperty="MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                  <c:choose>
                                                                          <c:when test="${__formdata.perfLibre == __formdata.CMODINV }">
                                                                          <div class="dspIcons">
                                                                           <input type="checkbox" id="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" title='${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}'  <c:if test="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.COBLIGA == 1}">checked</c:if> ></input>
                                                                           </div>
                                                                          </c:when>
                                                                          <c:otherwise>
                                                                           <div class="dspText">
                                                                                <input type="checkbox" id="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" title='${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}' checked='true' disabled="true" ></input>
                                                                                </div>
                                                                          </c:otherwise>
                                                                    </c:choose>
                                                             </display:column>
                                                         </axis:visible> 
                                                         <axis:visible f="axisctr217" c="TCODFON">
                                                             <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.TCODFONL" headerClass="sortable"  media="html" autolink="false" >
                                                                 <div class="dspText"> ${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFON}-${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFONL}</div>
                                                             </display:column>
                                                         </axis:visible>          
                                                         <c:choose>
                                                         <c:when test="${__formdata.TIPMOD == Integer.MIN_VALUE}">
                                                         </c:when>
                                                         <c:when test="${__formdata.TIPMOD == 2}">
                                                         <axis:visible f="axisctr217" c="PINVERS">
                                                             <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">
                                                                        <c:choose>
                                                                          <c:when test="${__formdata.perfLibre == __formdata.CMODINV }">
                                                                                <input type="text" id="pinvers${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="pinvers${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}"></input>
                                                                          </c:when>
                                                                          <c:otherwise>
                                                                            ${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}
                                                                         </c:otherwise>
                                                                        </c:choose>
                                                                </div>
                                                             </display:column>
                                                        </axis:visible>
                                                        </c:when>
                                                        <c:otherwise>
                                                        <axis:visible f="axisctr217" c="IAVALACT">
                                                             <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.IAVALACT" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">
                                                                        <c:choose>
                                                                          <c:when test="${__formdata.perfLibre == __formdata.CMODINV }">
                                                                                <input type="text" id="ivalact${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="ivalact${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.IVALACT}" ></input>
                                                                          </c:when>
                                                                          <c:otherwise>
                                                                            ${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.IVALACT}
                                                                         </c:otherwise>
                                                                        </c:choose>
                                                                </div>
                                                             </display:column>
                                                        </axis:visible>
                                                        </c:otherwise>
                                                        </c:choose>
                                                  </display:table>
                                                    <c:choose>
                                                        <c:when test="${!empty requestScope.MODINVFONDO}">
                                                            <c:if test="${ !(fn:containsIgnoreCase(header['User-Agent'],'ipad') ) }">
                                                                <script language="javascript">objUtiles.retocarDsptagtable("MODINVFONDO");</script>
                                                            </c:if>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <script language="javascript">
                                                               objLista.esconderListaSpans();
                                                               objLista.esconderListaLinks();     
                                                            </script>
                                                        </c:otherwise>
                                                    </c:choose>
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
        </form>
         <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr217_body</c:param><c:param name="f">axisctr217</c:param>
            <c:param name="f">axisctr217</c:param>
            <c:param name="__botones"><axis:visible f="axisctr217" c="BT_CANCELAR">cancelar</axis:visible><c:if test="${sessionScope.MODO == 'SIMULACION'  || sessionScope.MODO == 'ALTA_POLIZA'}"><axis:visible f="axisctr217" c="BT_ANT">,anterior</axis:visible></c:if><axis:visible f="axisctr217" c="BT_SIG">,siguiente</axis:visible></c:param><c:param name="__botones"><axis:visible f="axisctr217" c="BT_CANCELAR">cancelar</axis:visible><axis:visible f="axisctr217" c="BT_ANT">,anterior</axis:visible><axis:visible f="axisctr217" c="BT_SIG">,siguiente</axis:visible></c:param>
         </c:import>
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

