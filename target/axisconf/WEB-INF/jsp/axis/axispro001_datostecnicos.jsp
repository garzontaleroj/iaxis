<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="datostecnicos"/>

<script type="text/javascript">
    
    /* 2o Displaytag */
    function f_recargar_vigencias(NCODINT, CTIPO) {
        var params = "&metodo=RecargarVigencias&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO; 
        objAjax.invokeAsyncCGI("axis_axispro001.do", callbackRecargarVigencias,
            "operation=${nombrePantalla}" + params, this);
    }
    
    /* 3r Displaytag */
    function f_recargar_tramos(NCODINT, CTIPO, FINICIO) {
        var params = "&metodo=RecargarTramos&NCODINT=" + NCODINT + "&CTIPO=" + CTIPO + "&FINICIO=" + FINICIO;
        objAjax.invokeAsyncCGI("axis_axispro001.do", callbackRecargarTramos,
            "operation=${nombrePantalla}" + params, this);    
    }
    
    /* 2o Displaytag */
    function callbackRecargarVigencias(ajaxResponseText) {
        try {
            var doc = objAjax.domParse(ajaxResponseText);
    
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var tbody = objLista.obtenerBodyLista("INTERTECMOV");
                var tr = objLista.obtenerFilasBodyLista("INTERTECMOV", tbody);
                var primerRadio;     
                var primerNCODINT; 
                var primerCTIPO;
                var primerFINICIO; 
                objLista.borrarFilasDeLista ("INTERTECMOV", "4", "<fmt:message key='1000254' />");
                objLista.borrarFilasDeLista ("INTERTECMOVDET", "3", "<fmt:message key='1000254' />");
                
                if (objDom.existeTag(doc, "OB_IAX_INTERTECPROD"))
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbody, tr);
                
                // Bucle para insertar cada una de las filas
                for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECPROD") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(4);
                    
                    var NCODINT = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCODINT")[i]) ? 
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCODINT"), i, 0) : "";
                    var FINICIO = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FINICIO")[i]) ? 
                        objUtiles.formateaTimeStamp(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FINICIO"), i, 0)) : "";
                    var FFIN    = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FFIN")[i]) ? 
                        objUtiles.formateaTimeStamp(objDom.getValorNodoDelComponente(doc.getElementsByTagName("FFIN"), i, 0)) : "";                    
                    var CTIPO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPO")[i]) ? 
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPO"), i, 0) : "";
                    var TTRAMOTIP = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TTRAMOTIP")[i]) ? 
                                objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTRAMOTIP"), i, 0) : "";
                                
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    newtd[0] = objLista.addRadioButtonEnLista("radioFINICIO", FINICIO,
                                        "javascript:f_recargar_tramos('" + NCODINT + "', '" + CTIPO + "', '" + FINICIO + "');");      
                    if (i == 0) {
                        primerRadio = newtd[0];                                        
                        primerNCODINT = NCODINT;
                        primerCTIPO   = CTIPO;
                        primerFINICIO = FINICIO;
                    }
                    newtd[1] = objLista.addTextoEnLista(FINICIO); 
                    newtd[2] = objLista.addTextoEnLista(FFIN); 
                    newtd[3] = objLista.addTextoEnLista(TTRAMOTIP); 
                    
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbody);                    
                }
                
                // Marcamos el primero
                objLista.estadoRadioCheckBox(primerRadio.getElementsByTagName("input"), true);                                                                          
                f_recargar_tramos(primerNCODINT, primerCTIPO, primerFINICIO);
            } // Fi if
        } catch (e) {
            if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
        }
    }
    
    /* 3r Displaytag */
    function callbackRecargarTramos(ajaxResponseText) {
        try {        
            var doc = objAjax.domParse(ajaxResponseText);
    
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var tbody = objLista.obtenerBodyLista("INTERTECMOVDET");
                var tr = objLista.obtenerFilasBodyLista("INTERTECMOVDET", tbody);
                                
                objLista.borrarFilasDeLista ("INTERTECMOVDET", "3", "<fmt:message key='1000254' />");
                
                if (objDom.existeTag(doc, "OB_IAX_INTERTECMOVDETPROD"))
                    // Si hay registros, eliminamos el tr "No se han encontrado datos"
                    objLista.borrarFilaVacia(tbody, tr);
                
                // Bucle para insertar cada una de las filas
                for (var i = 0; i < objDom.numeroDeTags(doc, "OB_IAX_INTERTECMOVDETPROD") ; i++) {
                    // Obtenemos el estilo para la fila que insertaremos
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                    // Creamos una nueva fila vacia y le damos el estilo obtenido
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    // Creamos un array de columnas a añadir a la nueva fila del displayTag
                    var newtd = new Array(3);
                    
                    var NHASTA  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NHASTA")[i]) ? 
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("NHASTA"), i, 0) : "";
                    var NDESDE  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NDESDE")[i]) ? 
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("NDESDE"), i, 0) : "";
                    var NINTTEC = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NINTTEC")[i]) ? 
                        objDom.getValorNodoDelComponente(doc.getElementsByTagName("NINTTEC"), i, 0) : "";                    
                    
                    // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
                    newtd[0] = objLista.addNumeroEnLista(NDESDE); 
                    newtd[1] = objLista.addNumeroEnLista(NHASTA); 
                    newtd[2] = objLista.addNumeroEnLista(NINTTEC); 
                    
                    // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                    objLista.addNuevaFila(newtd, newtr, tbody);
                }                
            } // Fi if    
        } catch (e) {
            if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
        }
    }
                        
</script>

<form name="${nombrePantalla}" action="" method="POST">

    <table cellpadding="0" cellspacing="5" style="padding:1%" class="seccion">
    
        <tr>
            <th style="width:25%;height:0%;"/>
            <th style="width:25%;height:0%;"/>
            <th style="width:25%;height:0%;"/>
            <th style="width:25%;height:0%;"/>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><fmt:message key="1000238"/></b>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="TNNIGGAR" value="${mntproducto.DATTECN.TNNIGGAR}" class="campowidthinput campo campotexto" style="width:95%"
                    <axis:atr f="axispro001" c="TNNIGGAR" a="modificable=false"/> />
            </td>        
        </tr>
        <c:if test="${mntproducto.DATTECN.NNIGGAR == 0}">
        <tr>
            <td class="titulocaja">
                <b><fmt:message key="1000331"/></b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="1000331"/> <fmt:message key="1000486"/></b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="1000331"/> <fmt:message key="1000327"/> </b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="1000333"/></b>
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="PGASEXT" value="${mntproducto.PGASEXT}" class="campowidthinput campo campotexto" style="width:95%"
                    <axis:atr f="axispro001" c="PGASEXT" a="modificable=false"/> />
            </td>
            <td>
                <input type="text" name="PGASEXEX" value="${mntproducto.PGASEXEX}" class="campowidthinput campo campotexto" style="width:95%"
                    <axis:atr f="axispro001" c="PGASEXEX" a="modificable=false"/> />
            </td>
            <td>
                <input type="text" name="PGASEXIN" value="${mntproducto.PGASEXIN}" class="campowidthinput campo campotexto" style="width:95%"
                    <axis:atr f="axispro001" c="PGASEXIN" a="modificable=false"/> />
            </td>
            <td>
                <input type="text" name="PGASINT" value="${mntproducto.PGASINT}" class="campowidthinput campo campotexto" style="width:95%"
                    <axis:atr f="axispro001" c="PGASINT" a="modificable=false"/> />
            </td>
        </c:if>
 
        <tr>
        </tr>
        <tr>
            <td colspan="4">
                <hr class="seccion"/>
            </td>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><fmt:message key="1000249"/></b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="1000354"/></b>
            </td>
            <td class="titulocaja">
                <b><fmt:message key="1000292"/></b>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="CMODINT" 
                <c:if test="${mntproducto.DATTECN.CMODINT == 1}"> checked</c:if>
                <axis:atr f="axispro001" c="CMODINT" a="modificable=false"/> disabled /> 
            </td>
        </tr>
        <tr>
            <td>
                <input type="text" name="TNNIIGAR" value="${mntproducto.DATTECN.TNNIIGAR}" class="campowidthinput campo campotexto" style="width:95%"
                    <axis:atr f="axispro001" c="TNNIIGAR" a="modificable=false"/> />
            </td>        
            <td>
                <input type="text" name="TTABLA" value="${mntproducto.DATTECN.TTABLA}" class="campowidthinput campo campotexto" style="width:95%"
                <axis:atr f="axispro001" c="TTABLA" a="modificable=false"/> />
            </td>
            <c:if test="${mntproducto.DATTECN.CMODINT == 1}">
            <td class="titulocaja" colspan="3">
                <b><fmt:message key="1000329"/></b>&nbsp;&nbsp;&nbsp;<input type="checkbox" name="CINTREV" 
                <c:if test="${mntproducto.DATTECN.CINTREV == 1}"> checked</c:if>
                <axis:atr f="axispro001" c="CINTREV" a="modificable=false"/> disabled /> 
            </td>
            </c:if>
        </tr>
            
        <c:if test="${mntproducto.DATTECN.NNIIGAR == 0}">
        <tr>
        </tr>
        <tr>
            <td class="campocaja" colspan="4">
                <%-- Sub-subsección intereses por producto --%> 
                <table class="area" align="center" cellspacing="0">                
                    <tr>
                        <td>                               
                            <div style="float:left;">
                                <img id="datostecnicos_intereses_parent" src="images/mes.gif" onclick="objEstilos.toggleDisplay('datostecnicos_intereses', this)" style="cursor:pointer" alt="+"/>
                                <span id="datostecnicos_intereses_resumen"> <b><fmt:message key="1000090"/></b> &nbsp; ${mntproducto.DATTECN.TCODINT}</span>
                            </div>
                            <%-- 
                            <axis:visible f="axispro001" c="EDIT_DATOSTECNICOS_INTERESESPRODUCTO">
                                <div style="float:right;">
                                    <a href="javascript:void(0)"><img border="0" alt="<fmt:message key="100002"/> <fmt:message key="1000252"/>" title="<fmt:message key="100002"/> <fmt:message key="1000252"/>" src="images/lapiz.gif"/></a>
                                </div>
                            </axis:visible>
                            --%>
                            <div style="clear:both;">
                                <hr class="titulo">
                            </div>
                        </td>            
                    </tr>
                    <tr id="datostecnicos_intereses_children" style="display:none">   
                        <td>
                            <table cellspacing="5">
                                <tr>
                                    <th style="width:45%;height:0%;"/>
                                    <th style="width:55%;height:0%;"/>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2">
                                        <c:set var="title1"><fmt:message key="100588"/></c:set>   <%-- DESCRIPCIÓN --%>
                                        <!-- DisplayTag 1 -->                                
                                        <div class="displayspace">
                                          <display:table name="${mntproducto.DATTECN.INTERESPROD}" id="INTERESPROD" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                           requestURI="axis_axispro001.do?paginar=true&operation=datostecnicos_intereses">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <input type="radio" id="radioCTIPO" name="radioCTIPO" value="${INTERESPROD.OB_IAX_INTERTECPROD.CTIPO}"
                                                    onclick="f_recargar_vigencias(${INTERESPROD.OB_IAX_INTERTECPROD.NCODINT}, ${INTERESPROD.OB_IAX_INTERTECPROD.CTIPO})"
                                                    <c:if test="${sessionScope.DATTECN_CTIPO == INTERESPROD.OB_IAX_INTERTECPROD.CTIPO}"> checked </c:if>/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.TTIPO" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERESPROD.OB_IAX_INTERTECPROD.TTIPO}</div>
                                            </display:column>
                                          </display:table>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <!-- DisplayTag 2 -->
                                        <c:set var="title1"><fmt:message key="101159"/></c:set> <%-- VALOR --%>
                                        <c:set var="title2"><fmt:message key="103051"/></c:set> <%-- HASTA --%>   
                                        <c:set var="title3"><fmt:message key="1000540"/></c:set> <%-- TIPO DE TRAMO --%>                                           
                                        <div class="displayspace">
                                          <display:table name="${sessionScope.DATTECN_INTERTECMOV}" id="INTERTECMOV" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                           requestURI="axis_axispro001.do?paginar=true&operation=datostecnicos_intereses">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column title="" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                <div class="dspIcons">
                                                    <input type="radio" id="radioFINICIO" name="radioFINICIO" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"
                                                    onclick="f_recargar_tramos('${INTERTECMOV.OB_IAX_INTERTECPROD.NCODINT}', '${sessionScope.DATTECN_CTIPO}', '<fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"/>')"
                                                    <c:if test="${sessionScope.DATTECN_FINICIO == INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"> checked </c:if>/>
                                                </div>
                                            </display:column>
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.FINICIO" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FINICIO}"/></div>                                                
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.FFIN" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText"><fmt:formatDate pattern="dd/MM/yyyy" value="${INTERTECMOV.OB_IAX_INTERTECPROD.FFIN}"/></div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_INTERTECPROD.TTRAMOTIP" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOV.OB_IAX_INTERTECPROD.TTRAMOTIP}</div>
                                            </display:column>
                                          </display:table>
                                        </div>
                                    </td>
                                    <td>
                                        <!-- DisplayTag 3 -->
                                        <c:set var="title1"><fmt:message key="100804"/></c:set> <%-- DES DE --%>
                                        <c:set var="title2"><fmt:message key="103051"/></c:set> <%-- HASTA --%>   
                                        <c:set var="title3"><fmt:message key="101467"/></c:set> <%-- PORCENTAJE --%>   
                                        <div class="displayspace">
                                          <display:table name="${sessionScope.DATTECN_INTERTECMOVDET}" id="INTERTECMOVDET" export="false" class="dsptgtable" pagesize="6" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                           requestURI="axis_axispro001.do?paginar=true&operation=datostecnicos_intereses">
                                            <%@ include file="../include/displaytag.jsp"%>                                            
                                            <display:column title="${title1}" sortable="true" sortProperty="OB_IAX_INTERTECMOVDETPROD.NDESDE" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NDESDE}</div>
                                            </display:column>
                                            <display:column title="${title2}" sortable="true" sortProperty="OB_IAX_INTERTECMOVDETPROD.NHASTA" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NHASTA}</div>
                                            </display:column>
                                            <display:column title="${title3}" sortable="true" sortProperty="OB_IAX_INTERTECMOVDETPROD.NINTTEC" headerClass="sortable" media="html" autolink="false" >
                                                <div class="dspText">${INTERTECMOVDET.OB_IAX_INTERTECMOVDETPROD.NINTTEC}</div>
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
        </c:if>
        
    </table>
</form>