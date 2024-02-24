<%--
/**
*  Fichero: axispro008.jsp
*  @author <a href = "mailto:xpastor@csi-ti.com">Xavier Pastor</a>
*  
*  T?tulo: Modal datos Dades Unit Linked 
* 
*  Fecha: 08/05/2008
*/
--%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<%@ page contentType="text/html;charset=iso-8859-15" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
    <title><axis:alt f='axispro008' c='tittle' lit='151090'/></title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
    <c:import url="../include/carga_framework_js.jsp"/>
    <script type="text/javascript">
        function f_onload() { 
			f_cargar_propiedades_pantalla();   
       if( '${__formdata.MODINVFONDO2size  }' > 0  && '${__formdata.guradadoOK  }' >= 1 ){
            document.getElementById('editFondos').style.display='';
       }
       
   }
        
        function f_but_aceptar(){
        
             objUtiles.ejecutarFormulario("modal_axispro008.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
          
    

        }
        
        function f_but_cancelar(){
            parent.f_cerrar_modal("axispro008");
        }
        function f_crear_modelo(){
            objLista.borrarFilasDeLista ("MODINVFONDO2", "3", "<axis:alt f='axispro008' c='empty' lit='1000254'/>");
            document.getElementById('editFondos').style.display='none';
            document.getElementById('editModInv').style.display='';
        }
        
        function f_crear_fondo(){
            
             var params="&SPRODUC="+document.miForm.SPRODUC.value+"&CMODINV="+document.miForm.CMODINVH.value;
              objAjax.invokeAsyncCGI("modal_axispro008.do", callbackRecargarFondos, "operation=recargarFondos" + params, this, objJsMessages.jslit_cargando);
        }
        
        function callbackRecargarFondos(ajaxResponseText){
        document.getElementById('editFondos').style.display='';
        var doc=objAjax.domParse(ajaxResponseText);

        if (!objAppMensajes.existenErroresEnAplicacion(doc)){
            var table = document.getElementById("MODINVFONDO2");
            var tbody = table.getElementsByTagName("tbody")[0];
            var tr = tbody.getElementsByTagName("tr");
            
            // Borrar todos los registros existentes
            objLista.borrarFilasDeLista ("MODINVFONDO2", "4", "<axis:alt f='axispro008' c='empty' lit='1000254'/>");
            
            if (objDom.existeTag(doc, "CCODFON"))
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
                var valorCheck = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0);
                var checked = false;
        
                if (objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBLIGA"), i, 0)==1){
                
                   checked = true;
                }
               
               //AÑADIMOS CHECKBOX 
                newtd[0] =  objLista.addCheckBoxEnLista("ccodfon"+valorCheck,valorCheck,'',checked);
                newtd[0].style.width = "5%";
               //AÑADIMOS TEXTO
                newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFONL"), i, 0));
               newtd[1].style.width = "85%";
               //AÑADIMOS INPUT Por. MINIMO
               
               var newtdInv = document.createElement("td");
                newtdInv.style.width = "5%" ;
               var newdivInv = document.createElement("div");
                    newdivInv.className = "dspText";
               var inputInv = document.createElement("input");
                   
                    inputInv.setAttribute("type", "text");
                   inputInv.setAttribute("name" , "pinvers"+valorCheck);
                   inputInv.setAttribute("id" , "pinvers"+valorCheck);
                   inputInv.style.width="100%";
                   inputInv.setAttribute("onchange", "validaPercent(this)");
              
                    if (checked)
                       inputInv.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0));
                    
                newdivInv.appendChild(inputInv);
                newtdInv.appendChild(newdivInv);
                
                newtd[2] = newtdInv;
               
               //AÑADIMOS INPUT Por. MAXIM
               
               var newtdInv2 = document.createElement("td");  
               newtdInv2.style.width = "5%" ;
               var newdivInv2 = document.createElement("div");
                    newdivInv2.className = "dspText";
               var inputInv2 = document.createElement("input");
                    
                    inputInv2.setAttribute("type", "text");
                   inputInv2.setAttribute("name" , "pmaxcont"+valorCheck);
                   inputInv2.setAttribute("id" , "pmaxcont"+valorCheck);
                     inputInv2.style.width="100%";
                   inputInv2.setAttribute("onchange", "validaPercent(this)");
              
                    if (checked && doc.getElementsByTagName("PMAXCONT")[i].childNodes && doc.getElementsByTagName("PMAXCONT")[i].childNodes[0]){
                       inputInv2.setAttribute("value",objDom.getValorNodoDelComponente(doc.getElementsByTagName("PMAXCONT"), i, 0));
                    }else{
                        inputInv2.setAttribute("value","0");
                    }
                newdivInv2.appendChild(inputInv2);
                newtdInv2.appendChild(newdivInv2);
                
                newtd[3] = newtdInv2;
                
                
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbody);
            }
        }
            
        }
        function recargarMODINVFONDO(idModelo){
                objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axispro008' c='empty' lit='1000254'/>");
                document.getElementById('editFondos').style.display='none';
                document.miForm.CMODINVH.value = idModelo;
                var params="&CMODINV="+idModelo;
                params = params + "&SPRODUC="+document.miForm.SPRODUC.value;
                 objAjax.invokeAsyncCGI("modal_axispro008.do", callbackRecargarMODINVFONDO, "operation=recargarMODINVFONDO" + params, this, objJsMessages.jslit_cargando);
                        
        }
        
        function callbackRecargarMODINVFONDO(ajaxResponseText) {
       
     
        var doc=objAjax.domParse(ajaxResponseText);

        if (!objAppMensajes.existenErroresEnAplicacion(doc)){
            var table = document.getElementById("MODINVFONDO");
            var tbody = table.getElementsByTagName("tbody")[0];
            var tr = tbody.getElementsByTagName("tr");
            
            // Borrar todos los registros existentes
            objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axispro008' c='empty' lit='1000254'/>");
            
            if (objDom.existeTag(doc, "CCODFON"))
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
                
                newtd[0] = objLista.addNumeroEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCODFON"), i, 0));
                newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFONL"), i, 0));
                newtd[2] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PINVERS"), i, 0));
                 if (doc.getElementsByTagName("PMAXCONT")[i].childNodes && doc.getElementsByTagName("PMAXCONT")[i].childNodes[0]){
                    newtd[3] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("PMAXCONT"), i, 0));
                 }else{
                       newtd[3] = objLista.addTextoEnLista("0");
                 }
                // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                objLista.addNuevaFila(newtd, newtr, tbody);
            }
        }
            
        }
        
      
        function validaCodiModel(idModelo){
             if(!objNumero.validaNumero(idModelo)){
                 document.miForm.cmodinv.value='';
                  alert(objJsMessages.jslit_se_esperaba+' '+objJsMessages.jslit_un_numero_entero);
                 
             }
             document.miForm.CMODINVH.value = idModelo;
        
        }
        
        function validaPercent(campo){
             if(!objNumero.validaNumero(campo.value)){
                  
                  alert(objJsMessages.jslit_se_esperaba+' '+objJsMessages.jslit_un_numero_entero);
                 
             }
            
        }
        
        
    </script>
</head>
<body onload="javascript:f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axispro008.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="guardar" />
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${mntproducto.SPRODUC}"/>
    <input type="hidden" id="subpantalla" name="subpantalla" value="datosunitlinked"/>
     <input type="hidden" id="nIdiomas" name="nIdiomas" value="${__formdata.nIdiomas}"/>
     <input type="hidden" id="CMODINVH" name="CMODINVH" value="${ __formdata.CMODINV }"/>
     
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f='axispro008' c='titulo2' lit='9906892'/></c:param>
        <c:param name="formulario"><axis:alt f='axispro008' c='titulo2' lit='9906892'/></c:param>
        <c:param name="form">axispro008</c:param>
    </c:import>
    <div class="separador">&nbsp;</div>
  
  
        
  <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
       <tr>
            <td>
             <table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f='axispro008' c='titulo2' lit='1000115'/></b>
            </td>
            <td align="left" class="titulocaja">
                <b><axis:alt f='axispro008' c='tituloCaja' lit="1000337"/></b>
                <input type="checkbox" name="CPROVAL" <c:if test="${mntproducto.UNITULK.CPROVAL == 1}">checked</c:if> 
                    onclick="javascript:${nombrePantalla}ActualizarResumen()" 
                    <axis:atr f="axispro001" c="CPROVAL" a="modificable=false"/> disabled/> <!-- TODO: Modificar tag axis:atr para que deshabilite checkbox's-->
            </td>
        </tr>
        <tr>
            <td align="left" class="campocaja">
                <input type="text" name="NDIARIA" value="${mntproducto.UNITULK.NDIARIA}" class="campowidthinput campo campotexto" 
                <axis:atr f="axispro001" c="NDIARIA" a="modificable=false"/> style="width:90%"/> 
            </td>
            
        </tr>
        <tr>
            <td class="titulocaja">
                <b><<axis:alt f='axispro008' c='titulo' lit="1000291"/></b>
            </td>
        </tr>
    </table>
    <div class="separador">&nbsp;</div>
        <table cellpadding="0" cellspacing="5" style="padding-left:1%" class="seccion">
        <tr>
            <th style="width:45%;height:0%;"/>
            <th style="width:1%;height:0%;"/>
            <th style="width:45%;height:0%;"/>
        </tr>
        <tr>
            <td >
                           <div style="float:right;">   
                                    <img border="0" src="images/new.gif" title="" alt="" onclick="f_crear_modelo()"></img>       
                           </div>

                <div class="displayspace">
                     <c:set var="title0"><axis:alt f='axispro008' c='titulo2' lit="108515" /></c:set>
                     <display:table name="${mntproducto.UNITULK.MODELOSINV}" id="MODELOSINV" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="modal_axispro008.do?paginar=true&operation=form"> 
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="" sortable="true" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspIcons">
                               <input type="radio" id="radioMODINV" name="radioMODINV" <c:if test="${ __formdata.CMODINV == MODELOSINV.OB_IAX_PRODULKMODELOSINV.CMODINV }" > checked='true'</c:if> value="${MODELOSINV.OB_IAX_PRODULKMODELOSINV.CMODINV}"
                                onclick="recargarMODINVFONDO(this.value)"
                               />
                                <%-- sessionScope.CMODINV se establece al llamar a Ajax y se pone en Session --%>
                           </div>
                       </display:column>
                       <display:column title="" sortable="true" sortProperty="OB_IAX_PRODULKMODELOSINV.CMODINV" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${MODELOSINV.OB_IAX_PRODULKMODELOSINV.CMODINV}</div>
                       </display:column>
                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODULKMODELOSINV.TMODINV" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${MODELOSINV.OB_IAX_PRODULKMODELOSINV.TMODINV}</div>
                       </display:column>
                    </display:table>
                </div>
            </td>
            <td>
                &nbsp;
            </td>
            <td >
              <div style="float:right;">   
                                    <img border="0" src="images/new.gif" title="" alt="" onclick="f_crear_fondo()"></img>       
                </div>
                <div class="displayspace">
                     <c:set var="title0"><axis:alt f='axispro008' c='titulo2' lit="1000179" /></c:set>
                      <c:set var="title1"><axis:alt f='axispro008' c='titulo2' lit="9906894" /></c:set>
                      <c:set var="title2"><axis:alt f='axispro008' c='titulo2' lit="9906893" /></c:set>
                     <%-- sessionScope.MODINVFONDO es una tabla ubicada en ${mntproducto.MODELOSINV.OB_IAX_PRODULKMODELOSINV}, se establece al llamar a Ajax y se pone en Session --%>
                     <display:table name="${__formdata.MODINVFONDO}" id="MODINVFONDO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="modal_axispro008.do?paginar=true&operation=recargarMODINVFONDO">
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.CCODFON" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}</div>
                       </display:column>
                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.TCODFONL" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFONL}</div>
                       </display:column>
                       <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspNumber"> <fmt:formatNumber pattern="${__formatNumberPatterns[__formatNumberPorcentajeDefault]}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}"/></div>
                       </display:column>
                        <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspNumber"> <fmt:formatNumber pattern="${__formatNumberPatterns[__formatNumberPorcentajeDefault]}" value="${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PMAXCONT}"/></div>
                       </display:column>
                    </display:table>
                </div>
            </td>
        </tr>
        </table>
       <table cellpadding="0" cellspacing="5" style="padding-left:1%" >
        <tr>
            <th style="width:45%;height:0%;"/>
            <th style="width:1%;height:0%;"/>
            <th style="width:45%;height:0%;"/>
        </tr>
        <tr>
            <td  >
            <div id="editModInv" name="editMovInv" style="display:none">
              <table  class="seccion">

                <tr>   
                <td>
                <b><axis:alt f='axispro008' c='tablaIdiomas' lit="1000109"/></b>
                </td>
                </tr>
                <tr>
                    <td>
                        <input type="text" id="cmodinv" name="cmodinv" onChange="validaCodiModel(this.value);" class="campotexto_ob" value=""></input>
                    </td>
                </tr>
                <tr>
                 <td>
                    <div class="displayspace" >
                      <display:table name="${__formdata.lstIdiomas}" id="idioma" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                 requestURI="modal_axispro008.do?paginar=true&operation=form">
                                   <c:set var="title0"><axis:alt f='axispro008' c='title0' lit="1000246" /></c:set>
                                   <c:set var="title1"><axis:alt f='axispro008' c='title1' lit="100785" /></c:set>
                                   <%@ include file="../include/displaytag.jsp"%>
                                   <display:column title="${title0}"   headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                       <div class="dspText">${idioma.TIDIOMA}</div>
                                   </display:column>
                                   <display:column title="${title1}"   headerClass="headwidth10 sortable"  media="html" autolink="false" >
                                       <div class="dspText"><input type="text" id="idioma${idioma.CIDIOMA}" name="idioma${idioma.CIDIOMA}" class="campowidthinput campo campotexto"/></div>
                                   </display:column>               
                    </display:table>
                    </div>

                </td>
                </tr>
                </table>
            </div>
                </td>
                <td>
                </td>
                <td>
                <div id="editFondos" name="editFondos" style="display:none">
                <table  class="seccion">
                    <tr >
                    <td >
                    &nbsp;
                    </td>
                    </tr>
                    <tr >
                    <td class="campocaja">
                    &nbsp;
                    </td>
                    </tr>
                     <tr>
                        <td >
                            <div class="displayspace">                 
                                 <c:set var="title0"><axis:alt f='axispro008' c='title01' lit="1000179" /></c:set>
                                 <c:set var="title1"><axis:alt f='axispro008' c='title02' lit="9906894" /></c:set>
                                 <c:set var="title2"><axis:alt f='axispro008' c='title03' lit="9906893" /></c:set>
                                 <%-- sessionScope.MODINVFONDO es una tabla ubicada en ${mntproducto.MODELOSINV.OB_IAX_PRODULKMODELOSINV}, se establece al llamar a Ajax y se pone en Session --%>
                                 <display:table name="${__formdata.MODINVFONDO2}" id="MODINVFONDO2" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" style="border-right:17px"
                                 requestURI="modal_axispro008.do?paginar=true&operation=recargarFondos">
                                   <%@ include file="../include/displaytag.jsp"%>
                                   <display:column title="" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.CCODFON" headerClass="headwidth10 sortable"  media="html" autolink="false" style="width:5%">
                                        <div class="dspIcons">
                                           <input type="checkbox" id="ccodfon${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="ccodfon${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}" value="${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}" <c:if test='${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.COBLIGA == 1 }'>checked ="true"</c:if>/>
                                       </div>
                                   </display:column>
                                   <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.TCODFONL" headerClass="sortable"  media="html" autolink="false" style="width:85%" >
                                       <div class="dspText">${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.TCODFONL}</div>
                                   </display:column>
                                   <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:5%">
                                       <div class="dspNumber"><input type="text" style="width:100%" id="pinvers${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="pinvers${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}"  value="${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.PINVERS}" onchange="validaPercent(this);" /></div>
                                   </display:column>
                                   <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.PMAXCONT" headerClass="headwidth5 sortable"  media="html" autolink="false" style="width:5%">
                                       <div class="dspNumber"><input type="text" style="width:100%" id="pmaxcont${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}" name="pmaxcont${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.CCODFON}"  value="${MODINVFONDO2.OB_IAX_PRODULKMODINVFONDO.PMAXCONT}" onchange="validaPercent(this);" /></div>
                                   </display:column>
                                </display:table>
                            </div>
                        </td>
                    </tr>
                </table>
                </div>
                </td>
                </tr>
       </table>
    </table>
	   <c:import url="../include/botonera_nt.jsp">
	   	   <c:param name="f">axispro008</c:param><c:param name="__botones">cancelar,aceptar</c:param>
		   </c:import>
</form>
	<c:import url="../include/mensajes.jsp" />
  </body>
  </html>