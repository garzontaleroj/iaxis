<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="datosunitlinked"/>
<c:set var="tabulador" value="&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"/>

<script type="text/javascript">
    function ${nombrePantalla}RecargarMODINVFONDO(CMODINV) {
        // Recargar tabla detalle MODINVFONDO
        
        var params = "&metodo=RecargarMODINVFONDO&CMODINV=" + CMODINV+"&SPRODUC="+'${mntproducto.SPRODUC}';
        objAjax.invokeAsyncCGI("axis_axispro001.do", ${nombrePantalla}CallbackRecargarMODINVFONDO, "operation=${nombrePantalla}" + params, this, objJsMessages.jslit_cargando);
    }

    function ${nombrePantalla}ActualizarResumen() {
        var params = "&CPROVAL=" + document.${nombrePantalla}.CPROVAL.checked;
        params += "&metodo=ActualizarResumen";
        objAjax.invokeAsyncCGI("axis_axispro001.do", ${nombrePantalla}CallbackActualizarResumen, "operation=${nombrePantalla}" + params, this, objJsMessages.jslit_cargando);
    }

    function ${nombrePantalla}CallbackRecargarMODINVFONDO(ajaxResponseText) {
       
     
        var doc=objAjax.domParse(ajaxResponseText);

        if (!objAppMensajes.existenErroresEnAplicacion(doc)){
            var table = document.getElementById("MODINVFONDO");
            var tbody = table.getElementsByTagName("tbody")[0];
            var tr = tbody.getElementsByTagName("tr");
            
            // Borrar todos los registros existentes
            objLista.borrarFilasDeLista ("MODINVFONDO", "4", "<axis:alt f='axispro001_datosunitlinked' c='MODINVFONDO_LIT_EMPTY' lit='1000254' />");
            
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
                newtd[1] = objLista.addTextoEnLista(objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCODFON"), i, 0));
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
    
    function ${nombrePantalla}CallbackActualizarResumen(ajaxResponseText) {
        var doc = objAjax.domParse(ajaxResponseText);        
        if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
            var resumen = objDom.getValorNodoDelComponente(doc.getElementsByTagName("resumen"), 0, 0);
            document.getElementById("datosunitlinked_resumen").innerHTML =  '<b><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="1000103"/></b>&nbsp;&nbsp;' + resumen;
        }
    }

</script>

<form name="${nombrePantalla}" action="" method="POST">
        
<table cellpadding="0" cellspacing="5" class="seccion">
        <tr>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="1000115"/></b>
            </td>
            
            <td align="left" class="titulocaja">
                <b><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="1000337"/></b>
                <input type="checkbox" name="CPROVAL" <c:if test="${mntproducto.UNITULK.CPROVAL == 1}">checked</c:if> 
                    onclick="javascript:${nombrePantalla}ActualizarResumen()" 
                    <axis:atr f="axispro001" c="CPROVAL" a="modificable=false"/> disabled/> <!-- TODO: Modificar tag axis:atr para que deshabilite checkbox's-->
            </td>
            
        </tr>
            <td align="left" class="campocaja">
                <input type="text" name="NDIARIA" value="${mntproducto.UNITULK.NDIARIA}" class="campowidthinput campo campotexto campodisabled" 
                <axis:atr f="axispro001" c="NDIARIA" a="modificable=false"/> style="width:90%"/> 
            </td>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="1000291"/></b>
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
       <!-- <tr>
        
             <td class="titulocaja">
                    <div style="float:right;">   
                            <img border="0" src="images/new.gif" title="Crear fondo" alt="Crear fondo" onclick="f_crear_fondo()"></img>       
                   </div>
             </td>
        </tr>-->
        <tr>
             <td class="titulocaja">
                <div class="displayspace">
                     
                        
                     <c:set var="title0"><axis:alt f="axispro001_datosunitlinked" c="tit0" lit="108515" /></c:set>
                     <c:set var="title1"><axis:alt f="axispro001_datosunitlinked" c="tit1" lit="108515" /></c:set>
                     <display:table name="${mntproducto.UNITULK.MODELOSINV}" id="MODELOSINV" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                        requestURI="axis_axispro001.do?paginar=true&operation=datosunitlinked"> 
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="" sortable="false" sortProperty="" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspIcons">
                               <input type="radio" id="radioMODINV" name="radioMODINV" value="${MODELOSINV.OB_IAX_PRODULKMODELOSINV.CMODINV}"
                                onclick="${nombrePantalla}RecargarMODINVFONDO(this.value)"
                                <c:if test="${sessionScope.CMODINV == MODELOSINV.OB_IAX_PRODULKMODELOSINV.CMODINV}"> checked </c:if>/>
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
            <td>
                
                <div class="displayspace">
                     <c:set var="title0"><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="1000179" /></c:set>
                     <c:set var="title1"><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="9906894" /></c:set>
                     <c:set var="title2"><axis:alt f="axispro001_datosunitlinked" c="RESUM" lit="9906893" /></c:set>
                     <%-- sessionScope.MODINVFONDO es una tabla ubicada en ${mntproducto.MODELOSINV.OB_IAX_PRODULKMODELOSINV}, se establece al llamar a Ajax y se pone en Session --%>
                     <display:table name="${__formdata.MODINVFONDO}" id="MODINVFONDO" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                     requestURI="axis_axispro001.do?paginar=true&operation=datosunitlinked">
                       <%@ include file="../include/displaytag.jsp"%>
                       <display:column title="" sortable="true" sortProperty="MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON" headerClass="headwidth10 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.CCODFON}</div>
                       </display:column>
                       <display:column title="${title0}" sortable="true" sortProperty="OB_IAX_PRODULKMODINVFONDO.TCODFON" headerClass="sortable"  media="html" autolink="false" >
                           <div class="dspText">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.TCODFON}</div>
                       </display:column>
                       <display:column title="${title1}" sortable="true" sortProperty="MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PINVERS}</div>
                       </display:column>
                       <display:column title="${title2}" sortable="true" sortProperty="MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PMAXCONT" headerClass="headwidth5 sortable"  media="html" autolink="false" >
                           <div class="dspNumber">${MODINVFONDO.OB_IAX_PRODULKMODINVFONDO.PMAXCONT}</div>
                       </display:column>
                    </display:table>
                </div>
            </td>
        </tr>

    </table>
</form>