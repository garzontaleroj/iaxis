<%/**
*  Fichero: axisctr216.jsp
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
        <title><axis:alt f="axisctr216" c="TITOLAXISCRT007" lit="1000197"/></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <%-- Especial per controlar els scroll amb iPad --%>
        <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
        <style type="text/css" id="page-css" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)"> .wrapper{width: 100%;height: 230px;overflow: auto;} </style>
        <%-- FI Especial per controlar els scroll amb iPad --%>
        <link rel="stylesheet" href="styles/displaytag.css">        
        <c:import url="../include/carga_framework_js.jsp" />
         <script  type="text/javascript">
         
    function f_onload_axisctr216(){
             
    
  
       
               if( document.axisctr216Form.CMODINV.value && document.axisctr216Form.CMODINV.value >=0){
                   f_recargarInversion(document.axisctr216Form.CMODINV.value );
       
         }
    }
    function f_recargarInversion(idModelo){
              
              if(idModelo >=0){
                 document.axisctr216Form.CMODINV.value = idModelo;
              
                var params="&CMODINV="+idModelo;
                params = params + "&SPRODUC="+document.axisctr216Form.SPRODUC.value; 
                objAjax.invokeAsyncCGI("axis_axisctr216.do", callbackRecargarFondos, "operation=recargarMODINVFONDO" + params, this, objJsMessages.jslit_cargando);
              }else{
                  objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axisctr216' c='litvacio' lit='1000254' />");
              }
          
          }
          
    function callbackRecargarFondos(ajaxResponseText){
              var is_ie = navigator.userAgent.toLowerCase().indexOf('msie ') > -1;
              var doc=objAjax.domParse(ajaxResponseText);
          
            if (!objAppMensajes.existenErroresEnAplicacion(doc)){
                var table = document.getElementById("MODINVFONDO");
                var tbody = table.getElementsByTagName("tbody")[0];
                var tr = tbody.getElementsByTagName("tr");
                
                // Borrar todos los registros existentes
                objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axisctr216' c='litvacio' lit='1000254' />");
                
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
                   
                   
                   
                    if(document.axisctr216Form.CMODINV.value != document.axisctr216Form.perfLibre.value){
                        newtd[0] =  objLista.addCheckBoxEnLista("ccodfon"+valorCheck,valorCheck,'',true);
                        newtd[0].getElementsByTagName("input")[0].disabled=true;
                        //newtd[0] = objLista.addNumeroEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0));
                        newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFON"), i, 0)+" - "+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFONL"), i, 0));
                        var valorCheck = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0);
                         var newtdSel = document.createElement("td");
                           var inputSel = document.createElement("select");
                              inputSel.setAttribute("id","selcmodabo"+valorCheck);
                              inputSel.setAttribute("name","selcmodabo"+valorCheck);
                              inputSel.setAttribute("title",'<axis:alt f="axisctr216" c="CMODABO" lit="100943"/> '+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0));
                              inputSel.setAttribute("style","width:100%");
                             
                              if("${__formdata.permiteModif}"=="1"){
                               inputSel.disabled=true;
                              }
                              if(is_ie){
                                  inputSel.setAttribute("onchange",new Function( "guardarFondos(this,"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+")"));
                              }else
                                inputSel.setAttribute("onchange","guardarFondos(this,"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+")");
                              inputSel.setAttribute("class","campotexto_ob");
                              inputSel.setAttribute("obligatorio","true");
                              inputSel.add(new Option('<axis:alt f="axisctr216" c="LST_PERFILES" lit="1000348"/>',"<%= Integer.MIN_VALUE %>", false,false));
                    
                          <c:forEach var="element" items="${LST_MODABO}">
                             
                                 if(doc.getElementsByTagName("CMODABO")[i].childNodes[0] && "${element.CATRIBU}" == objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMODABO"), i, 0)){
                                    inputSel.add(new Option("${element.TATRIBU}", "${element.CATRIBU}",false,true));                    
                                 }else {
                                    inputSel.add(new Option("${element.TATRIBU}", "${element.CATRIBU}",false,false));                    
                                 }
                           </c:forEach>
                    
                    if(doc.getElementsByTagName("PINVERS")[i].childNodes[0]){
                            newtd[2] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0));
                        }else{
                            newtd[2]=objLista.addTextoEnLista(""); 
                       }
                       newtdSel.appendChild(inputSel); 
                       <axis:visible f="axisctr216" c="CMODABO">
                       newtd[3] = newtdSel;
                       </axis:visible>
                       

                        
                    }else {
                        
                        
                        var valorCheck = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0);
                        var checked = false;
                
                        if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0)!=0){
                                      checked = true;
                        }
                        
                        newtd[0] =  objLista.addCheckBoxEnLista("ccodfon"+valorCheck,valorCheck,'guardarFondos(this,'+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+')',checked);
                        newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFON"), i, 0)+"-"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFONL"), i, 0));
                        
                       var newtdInv = document.createElement("td");
                       var newdivInv = document.createElement("div");
                            newdivInv.className = "dspText";
                       var inputInv = document.createElement("input");
                       
                           inputInv.setAttribute("type", "text");
                           inputInv.setAttribute("name" , "pinvers"+valorCheck);
                           inputInv.setAttribute("id" , "pinvers"+valorCheck);
                           if(is_ie){
                               inputInv.setAttribute("onchange",new Function( "guardarFondos(this,"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+")"));
                           }else
                            inputInv.setAttribute("onchange", "guardarFondos(this,"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+")");
                          
                           if(doc.getElementsByTagName("PINVERS")[i].childNodes[0])
                                    inputInv.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0) );
                       
                       
                       
                       var newtdSel = document.createElement("td");
                      var inputSel = document.createElement("select");
                      inputSel.setAttribute("id","selcmodabo"+valorCheck);
                      inputSel.setAttribute("name","selcmodabo"+valorCheck);
                      inputSel.setAttribute("title",'<axis:alt f="axisctr216" c="CMODABO" lit="100943"/> ' + valorCheck);
                      inputSel.setAttribute("style","width:100%");
                      if(is_ie){
                          inputSel.setAttribute("onchange",new Function("guardarFondos(this,"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+")"));
                      }else
                        inputSel.setAttribute("onchange","guardarFondos(this,"+objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0)+")");
                         

                         inputSel.add(new Option('<axis:alt f="axisctr216" c="LST_PERFILES" lit="1000348"/>',"<%= Integer.MIN_VALUE %>", false,false));
                    
                          <c:forEach var="element" items="${LST_MODABO}">
                             
                             if(doc.getElementsByTagName("CMODABO")[i].childNodes[0] && "${element.CATRIBU}" == objDom.getValorNodoDelComponente(doc.getElementsByTagName("CMODABO"), i, 0)){
                                inputSel.add(new Option("${element.TATRIBU}", "${element.CATRIBU}",false,true));                    
                             }else {
                                inputSel.add(new Option("${element.TATRIBU}", "${element.CATRIBU}",false,false));                    
                             }
                           </c:forEach>
                     
                           if (checked){
                               inputInv.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0));
                            
                            }
                        newdivInv.appendChild(inputInv);
                        newtdInv.appendChild(newdivInv);
                        
                        newtd[2] = newtdInv;
                        
                       newtdSel.appendChild(inputSel); 
                       <axis:visible f="axisctr216" c="CMODABO">
                            newtd[3] = newtdSel;
                       </axis:visible>
                      
                      
                        
                    }
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbody);
                }
                
            }
             
          }
    function guardarFondos(linea,indice){

                // alert(cmodabo+' '+ccodfon+' '+pinvers);
                 
/*              if(document.axisctr216Form.CMODINV.value != document.axisctr216Form.perfLibre.value){
                
                    var cmodabo = document.getElementById("selcmodabo"+indice).value;
                    if(!cmodabo){
                        return;
                    }
                        
                    var params = '&pccodfon='+indice+'&pcmodabo='+cmodabo+'&pcmodinv='+document.axisctr216Form.CMODINV.value ;
                    objAjax.invokeAsyncCGI("axis_axisctr216.do", null, "operation=guardarFondo" + params, this, objJsMessages.jslit_cargando);
                 
              }else*/
            
              if( document.axisctr216Form.CMODINV.value == document.axisctr216Form.perfLibre.value/*(document.getElementById("selcmodabo"+indice).value>=0)*/ &&  document.getElementById("ccodfon"+indice).value && document.getElementById("pinvers"+indice).value ){
           
                /* var cmodabo = document.getElementById("selcmodabo"+indice).value;
                 if(!cmodabo){
                        return;
                    }*/
                 var ccodfon = document.getElementById("ccodfon"+indice).value;
                 var pinvers = document.getElementById("pinvers"+indice).value;
                var cmodabo="";
                 if (linea.name.indexOf("pinvers")>-1){
                    if(!objValidador.esCampoNumerico(pinvers,true,-1,linea.name))
                            return;  
                 }
                // alert(document.getElementById("ccodfon"+indice).checked);
                 if(!document.getElementById("ccodfon"+indice).checked){
                    var params = '&pccodfon='+ccodfon+'&pcmodabo='+cmodabo+'&ppinvers='+pinvers+'&pcmodinv='+document.axisctr216Form.CMODINV.value ;
                    objAjax.invokeAsyncCGI("axis_axisctr216.do", null, "operation=borrarFondo" + params, this, objJsMessages.jslit_cargando);
                 }else{
                  
                    var params = '&pccodfon='+ccodfon+'&pcmodabo='+cmodabo+'&ppinvers='+pinvers+'&pcmodinv='+document.axisctr216Form.CMODINV.value ;
                    objAjax.invokeAsyncCGI("axis_axisctr216.do", null, "operation=guardarFondo" + params, this, objJsMessages.jslit_cargando);
                   
                 }
                }
                 
             }
             
             
             
    function f_but_siguiente() {
                        
               if(document.axisctr216Form.CMODINV.value != document.axisctr216Form.perfLibre.value){
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
                      //  if(document.getElementById('selcmodabo'+inputs[i].value).value < 0){
                       //     alert(document.getElementById('selcmodabo'+inputs[i].value).title + " : " + objJsMessages.jslit_campo_obligatorio + ".");
                       //     return;                            
                       // }
                        if(document.getElementById('pinvers'+inputs[i].value).value < 0){
                            alert(document.getElementById('pinvers'+inputs[i]).title + " : " + objJsMessages.jslit_campo_obligatorio + ".");
                            return;                            
                        }
                    }
                    
                }
              
                if (document.axisctr216Form.CMODINV.value == document.axisctr216Form.perfLibre.value && checkeds <= 0){
                   alert(objJsMessages.jslit_selecciona_registro + ".");
                   return;  
                }
                   
                   
                objDom.setValorPorId("FORM_ACT","axisctr216");
                //f_habilitar_campos();
                objUtiles.ejecutarFormulario("axis_axisctr216.do", "siguiente", document.axisctr216Form, "_self");
             }
    
    function f_but_anterior(){
        objUtiles.ejecutarFormulario("axis_axisctr216.do", "anterior", document.axisctr216Form, "_self");
    }
    function f_but_cancelar() {
        
         objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axisctr216", "cancelar", document.axisctr216Form, "_self");
        
        
            } 
         </script>

    </head>
    <body onload="f_onload_axisctr216()">
       <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
         <c:set var="pantalla" value="axisctr216"/>
<form name="${pantalla}Form" action="" method="POST">
     <input type="hidden" name="operation" value=""/>
       <input type="hidden" name="FORM_ACT" id="FORM_ACT" value="${__formdata.FORM_ACT}"/>
      <input type="hidden" name="SPRODUC" value="${__formdata.SPRODUC}"/>
      <input type="hidden" name="CMODINV" value="${__formdata.CMODINV}"/>
       <input type="hidden" name="perfLibre" value="${__formdata.perfLibre}"/>
        <c:set var="modalidad">
            <c:choose>
                <c:when test="${sessionScope.MODO eq 'SIMULACION'}">
                <axis:alt f="axisctr216" c="MODO_SIMULACION" lit="108021" />
                </c:when>
                <c:when test="${sessionScope.MODO eq 'ALTA_POLIZA'}">
                <axis:alt f="axisctr216" c="MODO_ALTA" lit="101110" />
                </c:when>
                <c:otherwise>
                <axis:alt f="axisctr216" c="MODO_OTROS" lit="104752" />
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
                        <axis:alt f="axisctr216" c="DSP_MODELOSINV_lit" lit="9001351"></axis:alt> 
                    </div> 
                    <table class="seccion">
                        <tr>
                            <td align="left">
                                <table class="area" align="center">
                                    <tr>
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisctr216" c="NMODELO" lit="9001350"></axis:alt> </b>
                                        </td>
                                    </tr>
                                    <tr>
                                      
                                           <td class="campocaja">
                                                    <select name="NMODELO" id="NMODELO" title="<axis:alt f="axisctr216" c="NMODELO" lit="9001350"/>"                                           
                                                      <axis:atr f="axisctr216" c="NMODELO" a="obligatorio=true&modificable=true&isInputText=false"/>                                   
                                                      <c:if test="${sessionScope.MODO != 'SIMULACION'  && sessionScope.MODO != 'ALTA_POLIZA'}">disabled='disabled'</c:if>
                                                      size="1" class="campowidthselect campo campotexto" style="width:40%;"
                                                       onchange="f_recargarInversion(this.value)">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr216" c="LST_PERFILES" lit="1000348"/> - </option>
                                                        
                                                        <c:forEach var="element" items="${requestScope.LST_PERFILES}">
                                                            <option value="${element.CMODINV}"
                                                                        <c:if test="${__formdata.CMODINV == element.CMODINV }"> selected="selected"</c:if>>
                                                                ${element.TMODINV}   
                                                            </option>
                                                        </c:forEach>
                                                    </select>                                            
                                            </td>   
                                    </tr>                                        
                                    
                                        <tr>
                                            <td>
                                                <c:set var="title0"><axis:alt f="axisctr216" c="CODFONDO" lit="9001352"/></c:set>    <!-- Cod. Fondo -->
                                                <c:set var="title1"><axis:alt f="axisctr216" c="FONDO" lit="108263"/></c:set>     <!-- Fondo -->
                                                <c:set var="title2"><axis:alt f="axisctr216" c="100INVERSION" lit="9001353"/></c:set>    <!-- % de inversión -->
                                                <c:set var="title3"><axis:alt f="axisctr216" c="CMODABO" lit="100943"/></c:set>
                                                <div class="displayspace" style="width:70%;max-height:100%">
                                                    <display:table name="${__formdata.MODINVFONDO}" id="MODINVFONDO" export="false" class="dsptgtable" pagesize="-1"
                                                       defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" requestURI="axis_${pantalla}.do?paginar=true">
                                                         <%@ include file="../include/displaytag.jsp"%>
                                                        <axis:visible f="axisctr216" c="CCODFON">
                                                             <display:column title="" sortable="true" sortProperty="MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                
                                                                  <c:choose>
                                                                          <c:when test="${__formdata.perfLibre == __formdata.CMODINV }">
                                                                          <div class="dspIcons">
                                                                           <input type="checkbox" id="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" title='${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}' onclick="guardarFondos(this,${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON})" <c:if test="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.COBLIGA == 1}">checked</c:if> ></input>
                                                                           </div>
                                                                          </c:when>
                                                                          <c:otherwise>
                                                                           <div class="dspText">
                                                                                <input type="checkbox" id="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="ccodfon${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" title='${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}' onclick="guardarFondos(this,${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON})" checked='true' disabled="true" ></input>
                                                                                </div>
                                                                          </c:otherwise>
                                                                    </c:choose>
                                                                
                                                             </display:column>
                                                         </axis:visible> 
                                                         <axis:visible f="axisctr216" c="TCODFON">
                                                             <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.TCODFONL" headerClass="sortable"  media="html" autolink="false" >
                                                                 <div class="dspText"> ${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFON}-${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFONL}</div>
                                                             </display:column>
                                                         </axis:visible> 
  
                                                         <axis:visible f="axisctr216" c="PINVERS">
                                                             <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                 <div class="dspText">
                                                                        <c:choose>
                                                                          <c:when test="${__formdata.perfLibre == __formdata.CMODINV }">
                                                                                <input type="text" id="pinvers${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name=="pinvers${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}" onchange="guardarFondos(this,'${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}');"></input>
                                                                          </c:when>
                                                                          <c:otherwise>
                                                                            ${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}
                                                                         </c:otherwise>
                                                                        </c:choose>
                                                                </div>
                                                             </display:column>
                                                        </axis:visible>
                                                        <axis:visible f="axisctr216" c="CMODABO" >
                                                         <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.CTIPABO" headerClass="headwidth20 sortable"  media="html" autolink="false" >
                                                                   
                                                                 
                                                              <select name="selcmodabo${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" id="selcmodabo${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}" title="<axis:alt f="axisctr216" c="CTIPABO" lit="100943"/> ${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}"                                           
                                                                             <axis:atr f="axisctr216" c="CMODABO" a="obligatorio=true&modificable=true&isInputText=false"/>  size="1" <c:if  test="${__formdata.perfLibre != __formdata.CMODINV }">class="campotexto_ob"</c:if> style="width:100%"
                                                                            <c:if test="${__formdata.permiteModif == null || __formdata.permiteModif == 1}">disable</c:if>
                                                                            onchange="guardarFondos(this,${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON})">&nbsp;
                                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr216" c="LST_PERFILES" lit="1000348"/> - </option>
                                                                
                                                                <c:forEach var="element" items="${LST_MODABO}">
                                                                    <option value="${element.CATRIBU}"
                                                                            <c:if  test='${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CMODABO == element.CATRIBU}'>selected</c:if>>
                                                                            
                                                                        ${element.TATRIBU}   
                                                                </option>
                                                                </c:forEach>
                                                                </select>    
                                                        
                                                         </display:column>
                                                        </axis:visible>
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
         <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisctr216_body</c:param><c:param name="f">axisctr216</c:param>
            <c:param name="f">axisctr216</c:param>
            <c:param name="__botones"><axis:visible f="axisctr216" c="BT_CANCELAR">cancelar</axis:visible><c:if test="${sessionScope.MODO == 'SIMULACION'  || sessionScope.MODO == 'ALTA_POLIZA'}"><axis:visible f="axisctr216" c="BT_ANT">,anterior</axis:visible></c:if><axis:visible f="axisctr216" c="BT_SIG">,siguiente</axis:visible></c:param>
         </c:import>
    
      <c:import url="../include/mensajes.jsp" />
    </body>
</html>

