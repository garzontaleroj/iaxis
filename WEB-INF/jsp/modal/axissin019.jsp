<%/* Revision:# 0RavBFHt/gdUwZTa8Q9jBA== # */%>
<%/**
*  Fichero: axissin006.jsp
*  @author <a href = "mailto:xvila@csi-ti.com">Xavi Vila</a>
*  @author <a href = "mailto:xpator@csi-ti.com">Xavi Pastor</a>
*  @author <a href = "mailto:lcalvo@csi-ti.com">Luz Calvo</a>
*  
*  Primera pantalla del flujo de trabajo "Consulta de Siniestro". En ella:
*
* Descripción de pantalla
*
*  Fecha: 19/10/2007
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ page import="java.lang.String" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<link rel="stylesheet" href="styles/genericosHtml.css" type="text/css"></link>
<link rel="stylesheet" href="styles/axisnt.css" type="text/css"></link>
<link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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

<script language="Javascript" type="text/javascript">
// Código javascript

var vcactivi = '';

   /* *************************************  ACTUALIZAR COBJASE ***********************************        */  
    function f_cargar_cobjase(){
        f_carga_dependencias();
        f_cargar_propiedades_pantalla();
        SPRODUC = document.miForm.SPRODUC.value;
            if (!objUtiles.estaVacio(SPRODUC)){
                objAjax.invokeAsyncCGI("modal_axissin019.do", callbackAjaxCargarCobjase, "operation=ajax_busqueda_cobjase&SPRODUC=" + SPRODUC , this, objJsMessages.jslit_cargando); 
            }             
       }
       
    function callbackAjaxCargarCobjase (ajaxResponseText){
        //alert(ajaxResponseText);        
        var doc=objAjax.domParse(ajaxResponseText);
        //alert("Entrada");
        if(!objAppMensajes.existenErroresEnAplicacion(doc)){
            var COBJASE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBJASE"), 0, 0);
            
            //antes de marcar, desmarcamos todos posibles, recorriendo todos los radios con id de "CTIPRIESGO_*"
                var radios=document.getElementsByTagName("input");
                for (var iradios=0;iradios<radios.length;iradios++) {
                    if (radios[iradios].id!=undefined&&radios[iradios].id.indexOf("CTIPRIESGO_")==0) {
                        radios[iradios].checked=false;
                    }
                }
                
            document.miForm.COBJASE.value = COBJASE; 
            try {
                    document.getElementById("CTIPRIESGO_"+COBJASE).checked = true;
                }
                catch(eee) {
                }
         //   if (objUtiles.estaVacio(COBJASE) || COBJASE ==0){
         //       document.miForm.TIPRIESGO.disabled = false;               
         //   }
         //   else{
         //       document.miForm.TIPRIESGO.value = COBJASE;               
         //       document.miForm.TIPRIESGO.disabled = true;               
         //   }           
            f_cargar_propiedades_pantalla();
            f_carga_dependencias();
            f_cargar_actividades();
        }
    }

    function f_refrescarDependencias(){
           f_cargar_propiedades_pantalla();                  
           //objUtiles.ejecutarFormulario("modal_axissin019.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
    }
    
    function f_refrescarDependencias2(valor){
            document.miForm.COBJASE.value = valor;
           f_cargar_propiedades_pantalla();                  
        } 
    
    function f_onload() {
            document.miForm.NSINIES.focus();  
            f_deshabilitar_boton_nuevo();
            // Si la lista de pólizas sólo contiene una fila, buscamos automaticamente los siniestros  
            <c:if test="${!empty __formdata.AXISSIN_POLIZAS && fn:length(__formdata.AXISSIN_POLIZAS) == 1 && empty __formdata.AXISSIN_LISTASINIESTROS}" >
            
                 f_seleccionar_poliza_2('${__formdata.AXISSIN_POLIZAS[0].NPOLIZA}','${__formdata.AXISSIN_POLIZAS[0].NCERTIF}', 
                                      '${__formdata.AXISSIN_POLIZAS[0].NSINIES}','${__formdata.AXISSIN_POLIZAS[0].SSEGURO}', 
                                      '${__formdata.AXISSIN_POLIZAS[0].SPRODUC}','${__formdata.AXISSIN_POLIZAS[0].CACTIVI}',
                                      '${__formdata.AXISSIN_POLIZAS[0].NRIESGO}');
            </c:if>
            var COBJASE = document.miForm.COBJASE;                 
          //  if (objUtiles.estaVacio(COBJASE) || COBJASE.value==0 ){
                        
          //      document.miForm.TIPRIESGO.disabled=false;
          //      }
          //  else{                
          //      document.miForm.TIPRIESGO.value = document.miForm.COBJASE.value;
          //      document.miForm.TIPRIESGO.disabled=true;
          //  }
            
            
            formdataPAIS = '${__formdata.CPAIS}';
            vcactivi = '${__formdata['CACTIVI']}';
            
            if (!objUtiles.estaVacio(formdataPAIS)){
                if (!objUtiles.estaVacio(f_buscar_TPAIS(formdataPAIS))){
                    objDom.setValorHTMLPorId("TPAIS_span", "<b>" + f_buscar_TPAIS(formdataPAIS)+"</b>");
                }
            }
            f_habilitar_trefext();
            f_cargar_propiedades_pantalla();
            // INI BUG CONF_309 - 10/09/2016 - JAEG
            $("input:radio").on( "click", tipoPersonaChecked );
            if ($('#TIPOPERSONA:checked').val() == 4){
                $("#TDESCRIE").removeAttr('disabled');
                $("#TDESCRIE").removeAttr('readonly');
                $("#TDESCRIE").attr('class', 'campowidthinput campo campotexto');
                $("#NNUMIDE").attr('disabled', true);
                $("#NNUMIDE").attr('readonly', true);
                $("#NNUMIDE").val('');
                $("#NNUMIDE").attr('class', 'campowidthinput campo campotexto campodisabled');
                $("#BUSCAR").attr('disabled', true);
                $("#BUSCAR").attr('readonly', true);
                $("#BUSCAR").val('');
                $("#BUSCAR").attr('class', 'campowidthinput campo campotexto campodisabled');                   
            }
            else{
                $("#TDESCRIE").attr('disabled', true);
                $("#TDESCRIE").attr('readonly', true);
                $("#TDESCRIE").val('');
                $("#TDESCRIE").attr('class', 'campowidthinput campo campotexto campodisabled');
                $("#NNUMIDE").removeAttr('disabled');
                $("#NNUMIDE").removeAttr('readonly');
                $("#NNUMIDE").attr('class', 'campowidthinput campo campotexto');
                $("#BUSCAR").removeAttr('disabled');
                $("#BUSCAR").removeAttr('readonly');
                $("#BUSCAR").attr('class', 'campowidthinput campo campotexto');                 
            }
            // FIN BUG CONF_309 - 10/09/2016 - JAEG
    }
    // INI BUG CONF_309 - 10/09/2016 - JAEG 
    var tipoPersonaChecked = function() {
        if (this.value == 4){
            $("#TDESCRIE").removeAttr('disabled');
            $("#TDESCRIE").removeAttr('readonly');
            $("#TDESCRIE").attr('class', 'campowidthinput campo campotexto');
            $("#NNUMIDE").attr('disabled', true);
            $("#NNUMIDE").attr('readonly', true);
            $("#NNUMIDE").val('');
            $("#NNUMIDE").attr('class', 'campowidthinput campo campotexto campodisabled');
            $("#BUSCAR").attr('disabled', true);
            $("#BUSCAR").attr('readonly', true);
            $("#BUSCAR").val('');
            $("#BUSCAR").attr('class', 'campowidthinput campo campotexto campodisabled');            
        }
        else{
            $("#TDESCRIE").attr('disabled', true);
            $("#TDESCRIE").attr('readonly', true);
            $("#TDESCRIE").val('');
            $("#TDESCRIE").attr('class', 'campowidthinput campo campotexto campodisabled');
            $("#NNUMIDE").removeAttr('disabled');
            $("#NNUMIDE").removeAttr('readonly');
            $("#NNUMIDE").attr('class', 'campowidthinput campo campotexto');
            $("#BUSCAR").removeAttr('disabled');
            $("#BUSCAR").removeAttr('readonly');
            $("#BUSCAR").attr('class', 'campowidthinput campo campotexto');            
        }      
    }
    // FIN BUG CONF_309 - 10/09/2016 - JAEG 

    function f_buscar_TPAIS(CPAIS) {
                <% 
                if (((java.util.Map) request.getAttribute("__formdata"))!= null){
                java.util.Map formdata = ((java.util.Map) request.getAttribute("__formdata"));
                if (((java.util.Map) formdata.get("listValores"))!= null){
                java.util.Map lista = (java.util.Map)formdata.get("listValores");
                if (((java.util.ArrayList)lista.get("lstPaises"))!= null){
                java.util.ArrayList paises = (java.util.ArrayList)lista.get("lstPaises");
                for(int i = 0;i<paises.size();i++){
                java.util.HashMap paisHash = (java.util.HashMap)paises.get(i);
                %>
                pais = <%=paisHash.get("CPAIS")%>
                if (CPAIS == pais){
                return "<%=paisHash.get("TPAIS")%>"
                }
                <%}}}}%> 
    }

    function f_but_109808()
    {
        //alert("En alta SINIESTRO");
            var hayChecked = objUtiles.f_GuardaCasillasChecked("radioPoliza");
            if(typeof hayChecked == 'boolean') {
                alert(objJsMessages.jslit_selecciona_una_poliza);
            }else{
                var NSINIES = objUtiles.utilSplit(hayChecked, "/")[0]; // NSINIES
                var SSEGURO = objUtiles.utilSplit(hayChecked, "/")[1]; // SSEGURO
                var SPRODUC = objUtiles.utilSplit(hayChecked, "/")[2]; // SPRODUC
                var CACTIVI = objUtiles.utilSplit(hayChecked, "/")[3]; // CACTIVI
                //alert(SPRODUC);
                //alert(SSEGURO);
                param = "&SPRODUC="+SPRODUC+"&SSEGURO="+SSEGURO;
                //alert("antes de llamar");
                //parent.f_aceptar_axissin019(NSINIES, SSEGURO, SPRODUC, CACTIVI);
                
                parent.f_oberturasini( SSEGURO);
            }
    }

    
    // Primero miramos si hay alguna opción de la lista seleccionada
    function f_but_aceptar() {     
        //alert("En boton aceptar");
            var hayChecked = objUtiles.f_GuardaCasillasChecked("radioSiniestro");
            if(typeof hayChecked == 'boolean') {
                alert(objJsMessages.jslit_seleccione_un_siniestro);
            }else{
                var NSINIES = objUtiles.utilSplit(hayChecked, "/")[0]; // NSINIES
                var SSEGURO = objUtiles.utilSplit(hayChecked, "/")[1]; // SSEGURO
                var SPRODUC = objUtiles.utilSplit(hayChecked, "/")[2]; // SPRODUC
                var CACTIVI = objUtiles.utilSplit(hayChecked, "/")[3]; // CACTIVI
                f_seleccionar_siniestro (NSINIES, SSEGURO,SPRODUC, CACTIVI);
            }
    }
        
    function f_but_cancelar() {
            parent.f_cerrar_axissin019();
    }
        
    function f_but_buscar(){
        
        if (objValidador.validaEntrada()) {
            try { document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
            try { document.miForm.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
            try { document.miForm.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
            if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                objDom.setDisabledPorId("but_aceptar", true);
            
            if (objUtiles.estaVacio(objDom.getValorPorId("TREFEXT"))){
                objDom.setValorPorId("CTIPREF", null);
            }

            objUtiles.ejecutarFormulario("modal_axissin019.do", "busqueda_poliza", document.miForm, "_self", objJsMessages.jslit_cargando);
         
          }
      }
        
      function f_seleccionar_siniestro(NSINIES, SSEGURO, SPRODUC, CACTIVI){
            // if (objUtiles.estaVacio(NSINIES) || objUtiles.estaVacio(SSEGURO))
            //alert("En seleccionar siniestro");
            if (objUtiles.estaVacio(NSINIES))
               alert (objJsMessages.jslit_error_de_seleccion);
            else
               parent.f_aceptar_axissin019(NSINIES, SSEGURO, SPRODUC, CACTIVI);
               
      }         
         
         
      function f_seleccionar_poliza(NPOLIZA, NCERTIF, NSINIES,SSEGURO,SPRODUC,CACTIVI,NRIESGO){
       //Marcar el registro de la póliza selecccionada
      
                    var valor_establecido = NSINIES+"/"+SSEGURO+"/"+SPRODUC+"/"+CACTIVI+"/"+NRIESGO;
                    //alert(valor_establecido);
                    var checkBoxRadioPoliza = document.getElementsByName("radioPoliza");
                    for (var i=0; i < checkBoxRadioPoliza.length; i++) {
                           if(checkBoxRadioPoliza[i].value == valor_establecido){
                                 checkBoxRadioPoliza[i].checked = true;
                           }
                    }
           
           
           
           
         /*  objDom.setValorPorId("NPOLIZA", NPOLIZA);
           objDom.setValorPorId("NSINIES", NSINIES);
           objDom.setValorPorId("NCERTIF", NCERTIF);*/
            if (objUtiles.estaVacio(NPOLIZA) ||objUtiles.estaVacio(NCERTIF)){
                alert (objJsMessages.jslit_error_de_seleccion);
            }else{
              
                var qs="operation=ajax_busqueda_siniestros";
                    qs=qs+"&NPOLIZA="+NPOLIZA;
                    qs=qs+"&NSINIES="+NSINIES;
                    qs=qs+"&NCERTIF="+NCERTIF;
                    qs=qs+"&NRIESGO="+NRIESGO;
                    
                    if (document.getElementById('CESTSIN')!=null){
                        if (!objUtiles.estaVacio (document.getElementById('CESTSIN').value) ){
                            qs=qs+"&CESTSIN="+document.getElementById('CESTSIN').value;
                        }
                    }
                objAjax.invokeAsyncCGI("modal_axissin019.do", callbackajaxSiniestros, qs, this);
                
                
                
            }   
        }
        
        function f_habilitar_boton_aceptar(){
            objDom.setDisabledPorId("but_aceptar", false);
        }
        
        function f_habilitar_boton_nuevo(){
            //objDom.setDisabledPorId("but_109808", false);
        }
        
        function f_deshabilitar_boton_nuevo(){
            //objDom.setDisabledPorId("but_109808", true);
        }
      
        function callbackajaxSiniestros(ajaxResponseText){
            try{ 
                //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
        
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    var tbody = objLista.obtenerBodyLista("miListaId");
                    var tr = objLista.obtenerFilasBodyLista("miListaId", tbody);                  
                    
                    objLista.borrarFilasDeLista ("miListaId", "15", '<axis:alt f="axissin019" c="NOREG" lit="1000254"/>');
                    
                    if (objDom.existeTag(doc, "NSINIES"))
                        // Si hay registros, eliminamos el tr "No se han encontrado datos"
                        
                        objLista.borrarFilaVacia(tbody, tr);
                        
                    
                    // Bucle para insertar cada una de las filas
                    for (var i = 0; i < objDom.numeroDeTags(doc, "NSINIES") ; i++) {
                        // Obtenemos el estilo para la fila que insertaremos
                        var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                        // Creamos una nueva fila vacia y le damos el estilo obtenido
                        var newtr = objLista.crearNuevaFila(rowstyle);
                        // Creamos un array de columnas a añadir a la nueva fila del displayTag
                        var newtd = new Array(15);
                       
                        var NPOLIZA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPOLIZA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPOLIZA"), i, 0) : "";
                        var NSINIES = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NSINIES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NSINIES"), i, 0) : ""; 
                        var TRIESGO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TRIESGO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TRIESGO"), i, 0) : "";
                        
                        var TESTSIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TESTSIN")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TESTSIN"), i, 0) : "";
                        var TPRODUC   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPRODUC")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPRODUC"), i, 0) : "";
                        var NCERTIF   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NCERTIF")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NCERTIF"), i, 0) : "";
                        var SSEGURO   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SSEGURO")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("SSEGURO"), i, 0) : "";
                        var SPRODUC   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("SPRODUC")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0) : "";
                        
                        var FSINIES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FSINIES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FSINIES"), i, 0) : "";
                        var TSINIES   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TSINIES")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TSINIES"), i, 0) : "";  
                            
                                               
                        var CSINCIA   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NSINCIA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NSINCIA"), i, 0) : "";
                        // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.    
                        var FALTA  = objUtiles.hayValorElementoXml(doc.getElementsByTagName("FALTA")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("FALTA"), i, 0) : "";
                         // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.              
                            
                        var CCOMPANI   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CCOMPANI")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOMPANI"), i, 0) : "";
                            
                        var NPRESIN   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("NPRESIN")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("NPRESIN"), i, 0) : "";
                        
                        
                        var CTIPREF   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("CTIPREF")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPREF"), i, 0) : "";
                            
                        var TREFEXT   = objUtiles.hayValorElementoXml(doc.getElementsByTagName("TREFEXT")[i]) ? 
                            objDom.getValorNodoDelComponente(doc.getElementsByTagName("TREFEXT"), i, 0) : "";
                        
                        // Creamos todas las columnas (newtdX) asociadas a la fila que estamos creando
 												var ttd=0;
 			<axis:visible c="NPOLIZA_LSSIN" f="axissin019">									
                        newtd[ttd] = objLista.addNumeroEnLista(NPOLIZA);ttd++;
                        </axis:visible>
                        newtd[ttd] = objLista.addNumeroEnLista(NSINIES); ttd++; 
                        <axis:visible c="NSINCIA" f="axissin019">
                        newtd[ttd] = objLista.addTextoEnLista(CSINCIA); ttd++;
                        </axis:visible>
                        // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.
                        <axis:visible c="FALTA" f="axissin019">
                          if (FALTA != "") 
                            FSINIES = objUtiles.formateaTimeStamp2(FALTA);
                            newtd[ttd] = objLista.addTextoEnLista(FALTA);ttd++;
                        </axis:visible>
                        // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.
                        <axis:visible c="FALTA" f="axissin019">
                            if (FSINIES != "") 
                             FSINIES = objUtiles.formateaTimeStamp2(FSINIES);
                        newtd[ttd] = objLista.addTextoEnLista(FSINIES);ttd++;
                        </axis:visible>
                        <axis:visible c="TSINIES" f="axissin019">
                        newtd[ttd] = objLista.addTextoEnLista(TSINIES);ttd++;
                        </axis:visible>
                        newtd[ttd] = objLista.addTextoEnLista(TRIESGO); ttd++;                           
                        newtd[ttd] = objLista.addTextoEnLista(TESTSIN);ttd++;
                        <axis:visible c="TPRODUC" f="axissin019">
                        newtd[ttd] = objLista.addTextoEnLista(TPRODUC);ttd++;                     
                        </axis:visible>
                        <axis:visible c="CCOMPANI" f="axissin019">
                        newtd[ttd] = objLista.addTextoEnLista(CCOMPANI);     ttd++;
                         </axis:visible>
                        <axis:visible c="NPRESIN" f="axissin019">
                        newtd[ttd] = objLista.addTextoEnLista(NPRESIN);   ttd++;
                        </axis:visible>
                         <axis:visible c="CTIPREF" f="axissin019">
                        newtd[ttd] = objLista.addNumeroEnLista(CTIPREF);     ttd++;
                         </axis:visible>
                        <axis:visible c="TREFEXT" f="axissin019">
                        newtd[ttd] = objLista.addTextoEnLista(TREFEXT);   ttd++;
                          </axis:visible>
                        <axis:visible c="BT_EDIT_SINI" f="axissin019">
                        newtd[ttd] = objLista.addImagenEnLista("javascript:f_seleccionar_siniestro('"+ NSINIES +"','" + SSEGURO +"','"+ SPRODUC + "');",
                                    "0", "<axis:alt f="axissin019" c="EDITAR" lit="100002" />", "<axis:alt f="axissin019" c="EDITAR" lit="100002"/>", "images/lapiz.gif");ttd++;
                          </axis:visible>
                        <axis:visible c="BT_BUSCAR_SINI" f="axissin019">
                        newtd[ttd] = objLista.addImagenEnLista("javascript:f_seleccionar_siniestro('"+ NSINIES +"','" + SSEGURO +"','"+ SPRODUC+ "');",
                                    "0", "<axis:alt f="axissin019" c="DET_SINI" lit="9001131" />", "<axis:alt f="axissin019" c="DET_SINI" lit="9001131" />", "images/mes.gif");ttd++;
                       
                        </axis:visible>
                           
                        // Añadimos la nueva fila(con sus nuevas columnas) al cuerpo del displayTag
                        objLista.addNuevaFila(newtd, newtr, tbody);
                    }
 
                } // Fi if 
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }       
        
        function f_seleccionar_poliza_2(NPOLIZA, NCERTIF, NSINIES,SSEGURO,SPRODUC,CACTIVI,NRIESGO){
        
            var CESTSIN;                    
            if (document.getElementById('CESTSIN')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CESTSIN').value) ){
                    CESTSIN = document.getElementById('CESTSIN').value;
                }
            }
            
            //INICIO Ajuste que pasa todos los parámetros a la función
            var CRAMO;
            if (document.getElementById('CRAMO')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CRAMO').value) ){
                    CRAMO = document.getElementById('CRAMO').value;
                }
            }
            
            var NNUMIDE;
            if (document.getElementById('NNUMIDE')!=null){
                if (!objUtiles.estaVacio (document.getElementById('NNUMIDE').value) ){
                    NNUMIDE = document.getElementById('NNUMIDE').value;
                }
            }
            
            var SNIP;
            if (document.getElementById('SNIP')!=null){
                if (!objUtiles.estaVacio (document.getElementById('SNIP').value) ){
                    SNIP = document.getElementById('SNIP').value;
                }
            }
            
            var BUSCAR;
            if (document.getElementById('BUSCAR')!=null){
                if (!objUtiles.estaVacio (document.getElementById('BUSCAR').value) ){
                    BUSCAR = document.getElementById('BUSCAR').value;
                }
            }
            
            var TIPOPERSONA;
            for (var i = 0; i < document.miForm.TIPOPERSONA.length; i++) {
				if (document.miForm.TIPOPERSONA[i].checked) {
					TIPOPERSONA =document.miForm.TIPOPERSONA[i].value;
					break;
				}
            }
            
            var NSINCIA;
            if (document.getElementById('NSINCIA')!=null){
                if (!objUtiles.estaVacio (document.getElementById('NSINCIA').value) ){
                    NSINCIA = document.getElementById('NSINCIA').value;
                }
            }
            // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.
            var FALTA;
            if (document.getElementById('FALTA')!=null){
                if (!objUtiles.estaVacio (document.getElementById('FALTA').value) ){
                	FALTA = document.getElementById('FALTA').value;
                }
            }
            // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.
            var CCOMPANI;
            if (document.getElementById('CCOMPANI')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CCOMPANI').value) ){
                    CCOMPANI = document.getElementById('CCOMPANI').value;
                }
            }
            
            var NPRESIN;
            if (document.getElementById('NPRESIN')!=null){
                if (!objUtiles.estaVacio (document.getElementById('NPRESIN').value) ){
                    NPRESIN = document.getElementById('NPRESIN').value;
                }
            }
            
            var CSIGLAS;
            if (document.getElementById('CSIGLAS')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CSIGLAS').value) ){
                    CSIGLAS = document.getElementById('CSIGLAS').value;
                }
            }
            
            var TNOMVIA;
            if (document.getElementById('TNOMVIA')!=null){
                if (!objUtiles.estaVacio (document.getElementById('TNOMVIA').value) ){
                    TNOMVIA = document.getElementById('TNOMVIA').value;
                }
            }
            
            var NNUMVIA;
            if (document.getElementById('NNUMVIA')!=null){
                if (!objUtiles.estaVacio (document.getElementById('NNUMVIA').value) ){
                    NNUMVIA = document.getElementById('NNUMVIA').value;
                }
            }
            var TCOMPLE;
            if (document.getElementById('TCOMPLE')!=null){
                if (!objUtiles.estaVacio (document.getElementById('TCOMPLE').value) ){
                    TCOMPLE = document.getElementById('TCOMPLE').value;
                }
            }
            
            var CPOSTAL;
            if (document.getElementById('CPOSTAL')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CPOSTAL').value) ){
                    CPOSTAL = document.getElementById('CPOSTAL').value;
                }
            }
            
            var CPOBLAC;
            if (document.getElementById('CPOBLAC')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CPOBLAC').value) ){
                    CPOBLAC = document.getElementById('CPOBLAC').value;
                }
            }
            var CPROVIN;
            if (document.getElementById('CPROVIN')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CPROVIN').value) ){
                    CPROVIN = document.getElementById('CPROVIN').value;
                }
            }
            
            var FGISX;
            if (document.getElementById('FGISX')!=null){
                if (!objUtiles.estaVacio (document.getElementById('FGISX').value) ){
                    FGISX = document.getElementById('FGISX').value;
                }
            }
            var FGISY;
            if (document.getElementById('FGISY')!=null){
                if (!objUtiles.estaVacio (document.getElementById('FGISY').value) ){
                    FGISY = document.getElementById('FGISY').value;
                }
            }
            
            var FGISZ;
            if (document.getElementById('FGISZ')!=null){
                if (!objUtiles.estaVacio (document.getElementById('FGISZ').value) ){
                    FGISZ = document.getElementById('FGISZ').value;
                }
            }
            
            var TDESCRI;
            if (document.getElementById('TDESCRI')!=null){
                if (!objUtiles.estaVacio (document.getElementById('TDESCRI').value) ){
                    TDESCRI = document.getElementById('TDESCRI').value;
                }
            }
			
			/*bug 4713 busqueda de siniestro espesifica*/
			 var TDESCRIE;
            if (document.getElementById('TDESCRIE')!=null){
                if (!objUtiles.estaVacio (document.getElementById('TDESCRIE').value) ){
                	TDESCRIE = document.getElementById('TDESCRIE').value;
                }
            }
			
            var CTIPMAT;
            if (document.getElementById('CTIPMAT')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CTIPMAT').value) ){
                    CTIPMAT = document.getElementById('CTIPMAT').value;
                }
            }
            
            var CMATRIC;
            if (document.getElementById('CMATRIC')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CMATRIC').value) ){
                    CMATRIC = document.getElementById('CMATRIC').value;
                }
            }
            var TIPRIESGO;
            if (document.getElementById('TIPRIESGO')!=null){
                if (!objUtiles.estaVacio (document.getElementById('TIPRIESGO').value) ){
                    TIPRIESGO = document.getElementById('TIPRIESGO').value;
                }
            }
            
            var CPOLCIA;
            if (document.getElementById('CPOLCIA')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CPOLCIA').value) ){
                    CPOLCIA = document.getElementById('CPOLCIA').value;
                }
            }
            
            var CAGENTE;
            if (document.getElementById('CAGENTE')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CAGENTE').value) ){
                    CAGENTE = document.getElementById('CAGENTE').value;
                }
            }
            
            var TREFEXT;
            if (document.getElementById('TREFEXT')!=null){
                if (!objUtiles.estaVacio (document.getElementById('TREFEXT').value) ){
                    TREFEXT = document.getElementById('TREFEXT').value;
                }
            }
            
            var CTIPREF;
            if (document.getElementById('CTIPREF')!=null){
                if (!objUtiles.estaVacio (document.getElementById('CTIPREF').value) ){
                    CTIPREF = document.getElementById('CTIPREF').value;
                }
            }
            //FIN Ajuste que pasa todos los parámetros a la función
            
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
            // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.
            $.get("modal_axissin019.do", {'operation': 'busqueda_siniestro', 'CRAMO':CRAMO, 'SPRODUC':SPRODUC, 'NPOLIZA':NPOLIZA, 'NCERTIF':NCERTIF,
                'NSINIES':NSINIES, 'CESTSIN':CESTSIN, 'NNUMIDE':NNUMIDE, 'SNIP':SNIP, 'BUSCAR':BUSCAR, 'TIPOPERSONA':TIPOPERSONA, 'NSINCIA':NSINCIA,
                'FALTA':FALTA,'CCOMPANI':CCOMPANI, 'NPRESIN':NPRESIN, 'CSIGLAS':CSIGLAS, 'TNOMVIA':TNOMVIA, 'NNUMVIA':NNUMVIA, 'TDESCRIE':TDESCRIE,
                'TCOMPLE':TCOMPLE, 'CPOSTAL':CPOSTAL,'CPOBLAC':CPOBLAC, 'CPROVIN':CPROVIN, 'FGISX':FGISX, 'FGISY':FGISY, 'FGISZ':FGISZ, 'TDESCRI':TDESCRI, 
                'CTIPMAT':CTIPMAT, 'CMATRIC':CMATRIC,'TIPRIESGO':TIPRIESGO, 'CPOLCIA': CPOLCIA, 'CACTIVI':CACTIVI, 'CAGENTE':CAGENTE, 'TREFEXT':TREFEXT, 
                'CTIPREF':CTIPREF, 'NRIESGO':NRIESGO,'forward':'lstSiniestros'}, showListaSiniestros, "text");
           // IAXIS-2169 AABC Adicion de fecha de apertura a la consulta.
        }
                    
        function showListaSiniestros(res){
        
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
            
            $("#divSiniestros").html(res);
        }
                
           function f_cargar_productos(){
                    //alert("En cargar productos");
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     if (!objUtiles.estaVacio (CRAMO) ){
                    objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    objAjax.invokeAsyncCGI("modal_axissin019.do", callbackAjaxCargarProductos, "operation=ajax_busqueda_productos&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO) + 
                        "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value, this, objJsMessages.jslit_cargando);
                    //alert("Fin cargar productos");
            }      
            
             

            function callbackAjaxCargarProductos (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("SPRODUC");
                    
                    var SPRODUCCombo = document.miForm.SPRODUC;     
                    objDom.borrarOpcionesDeCombo(SPRODUCCombo);
                   objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin019" c="SELECCIONAR" lit="108341" /> - ', SPRODUCCombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var SPRODUC = objDom.getValorNodoDelComponente(doc.getElementsByTagName("SPRODUC"), i, 0);
                            var TITULO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TTITULO"), i, 0);                                     
                            objDom.addOpcionACombo(SPRODUC, TITULO, SPRODUCCombo, i+1);
                        }
                        
                        f_cargar_cobjase();
                        f_cargar_actividades();

                }
            }       

      /****************************************************************************************/
        /************************************** MODAL *******************************************/
        /****************************************************************************************/
                
        function f_abrir_axiscom001(CODIGO_LITERAL, CODIGO_CONSULTA, CODIGO_CONDICION){
             objUtiles.abrirModal("axiscom001", "src", "modal_axiscom001.do?operation=form&CODIGO_LITERAL=" + CODIGO_LITERAL +
              "&CODIGO_CONSULTA=" + CODIGO_CONSULTA + "&CODIGO_CONDICION=" + CODIGO_CONDICION);
        }
        
        function f_aceptar_axiscom001(CODIGO, TEXTO, CODIGO_CONSULTA){
            f_cerrar_axiscom001();
            if (!objUtiles.estaVacio(TEXTO))
                TEXTO = objUtiles.replaceAll(TEXTO, "-quote-", "\'");
            if (CODIGO_CONSULTA == "LISTA_PAIS") {
                objDom.setValorPorId("CPAIS", CODIGO);
                objDom.setVisibilidadPorId("findProvincia", "visible");                
                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPAIS");
            }
            else if (CODIGO_CONSULTA == "LISTA_PROVINCIA") {
                objDom.setValorPorId("CPROVIN", CODIGO);
                objDom.setVisibilidadPorId("findPoblacion", "visible");
                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + TEXTO + "</b>");
                limpiaCampos("CPROVIN");
            }
            else if (CODIGO_CONSULTA == "LISTA_POBLACION") {
                objDom.setValorPorId("CPOBLAC", CODIGO);
                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + TEXTO + "</b>");
            }   
        }
        
        function f_cerrar_axiscom001() {
            objUtiles.cerrarModal("axiscom001");
        }
        
        /****************************************************************************************/
        /************************************** UTILES *******************************************/
        /****************************************************************************************/
        function limpiaCampos (CAMPO){
            if(objUtiles.utilEquals(CAMPO, "CPAIS")){
                //Limpio província
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
            }
            
            if(objUtiles.utilEquals(CAMPO, "CPAIS") ||
                objUtiles.utilEquals(CAMPO, "CPROVIN")){
                    //Limpio población
                    objDom.setValorPorId("CPOBLAC", "");
                    objDom.setValorHTMLPorId("TPOBLAC_span", "");
            }
        }
            
        function f_onchange_CPAIS() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            if (!objUtiles.estaVacio(CPAIS)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPAIS";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin019.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPAIS", "");
                objDom.setValorHTMLPorId("TPAIS_span", "");
                objDom.setVisibilidadPorId("findProvincia", "hidden");
                limpiaCampos("CPAIS");
            }
        }
        function f_onchange_CPOBLAC() {
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPOBLAC=objDom.getValorPorId("CPOBLAC");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPOBLAC)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPOBLAC";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPOBLAC="+CPOBLAC
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin019.do", callbackajaxdireccion, qs, this)
            } else {
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        function f_onchange_CPROVIN() {            
            var CPAIS=objDom.getValorPorId("CPAIS");
            var CPROVIN=objDom.getValorPorId("CPROVIN");
            if (!objUtiles.estaVacio(CPROVIN)){
                var qs="operation=ajax_direccion";
                qs=qs+"&op="+"CPROVIN";
                qs=qs+"&CPAIS="+CPAIS
                qs=qs+"&CPROVIN="+CPROVIN
                qs=qs+"&dt="+(new Date().getTime())
                objAjax.invokeAsyncCGI("modal_axissin019.do", callbackajaxdireccion, qs, this)
            }else{
                objDom.setValorPorId("CPROVIN", "");
                objDom.setValorHTMLPorId("TPROVIN_span", "");
                objDom.setVisibilidadPorId("findPoblacion", "hidden");
                limpiaCampos("CPROVIN");
            }
        }
        
         function f_onblur_CPOSTAL(CPOSTAL) {
            if (!objUtiles.estaVacio(CPOSTAL)){
				document.miForm.CPAIS.focus();
                objAjax.invokeAsyncCGI('modal_axissin019.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);
            }
        }
          /****************************************************************************************/
        /*********************************** CALLBACK AJAX **************************************/
        /****************************************************************************************/
        
        function callbackAjaxOnblurCPOSTAL(ajaxResponseText) {
            try{
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
				
					var ban = objDom.getValorNodoDelComponente(doc.getElementsByTagName("RETURN"), 0, 0);
                    
                    if (ban == 2){
                        objUtiles.abrirModal("axisper041", "src", "modal_axisper041.do?operation=form&CPOSTAL=" + document.getElementById("CPOSTAL").value);
                    }
                    else
                    {
                    // País
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                        objDom.setVisibilidadPorId("findProvincia", "visible");
                    } else {
                       objDom.setValorPorId("CPAIS", "");
                       objDom.setVisibilidadPorId("findProvincia", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPAIS_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPAIS_span").innerHTML = "";
                    }
                    
                    // Provincia
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));           
                        objDom.setVisibilidadPorId("findPoblacion", "visible");
                    } else {
                        objDom.setValorPorId("CPROVIN", "");
                        objDom.setVisibilidadPorId("findPoblacion", "hidden");                    
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])) {
                        document.getElementById("TPROVIN_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPROVIN_span").innerHTML = "";                        
                    }
                    
                    // Población
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));           
                    } else {
                        objDom.setValorPorId("CPOBLAC", "");
                    }
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0])) {
                        document.getElementById("TPOBLAC_span").innerHTML = "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>";
                    } else {
                        document.getElementById("TPOBLAC_span").innerHTML = "";       
                    }
					}
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
          function callbackajaxdireccion (ajaxResponseText){
            try{ 
                 //alert(ajaxResponseText);
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPAIS")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPAIS", "");
                            objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objJsMessages.jslit_codigo_pais_incorrecto +"</b>");
                            limpiaCampos("CPAIS");
                        }else{
                            objDom.setValorPorId("CPAIS", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPAIS"), 0, 0));
                            objDom.setVisibilidadPorId("findProvincia", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPAIS")[0])){
                                objDom.setValorHTMLPorId("TPAIS_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPAIS"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPAIS");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPROVIN")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPROVIN", "");
                            objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objJsMessages.jslit_codigo_provincia_incorrecto +"</b>");
                            limpiaCampos("CPROVIN");
                        }else{
                            objDom.setValorPorId("CPROVIN", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPROVIN"), 0, 0));
                            objDom.setVisibilidadPorId("findPoblacion", "visible");
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPROVIN")[0])){
                                objDom.setValorHTMLPorId("TPROVIN_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPROVIN"), 0, 0) + "</b>");
                                
                                limpiaCampos("CPROVIN");
                            }
                        }
                    }
                    
                    if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("CPOBLAC")[0])) {
                        if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("OPERACION_AJAX_ERROR")[0])){
                            objDom.setValorPorId("CPOBLAC", "");
                            objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objJsMessages.jslit_codigo_poblacion_incorrecto +"</b>");
                        }else{
                            objDom.setValorPorId("CPOBLAC", objDom.getValorNodoDelComponente(doc.getElementsByTagName("CPOBLAC"), 0, 0));
                            if (objUtiles.hayValorElementoXml(doc.getElementsByTagName("TPOBLAC")[0]))
                                objDom.setValorHTMLPorId("TPOBLAC_span", "<b>" + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TPOBLAC"), 0, 0) + "</b>");
                        }
                    }
                }
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                alert (e.name + " " + e.message);
            }
        }
        
        function f_cargar_actividades(){
                
                if (document.getElementById('CACTIVI')!=null){
                    //CCOMPANI
                    CRAMO = objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0];
                     
                     if (!objUtiles.estaVacio (CRAMO) ){
                        objDom.setValorComponente(document.miForm.CRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[0]);
                    objDom.setValorComponente(document.miForm.TRAMO, objUtiles.utilSplit(objDom.getValorComponente(document.miForm.ramoProducto), "/")[1]);
                    }else
                    objDom.setValorComponente(document.miForm.CRAMO, null);
                    
                    url ="operation=ajax_busqueda_actividades&CRAMO=" + objDom.getValorComponente(document.miForm.CRAMO);
                    
                    
                    if (document.miForm.CCOMPANI!=null){
                        if (!objUtiles.estaVacio (objDom.getValorComponente(document.miForm.CCOMPANI)) ){
                            url += "&CCOMPANI=" + objDom.getValorComponente(document.miForm.CCOMPANI);
                        }
                    }
                    
                    url += "&TRAMO=" + objDom.getValorComponente(document.miForm.TRAMO)+"&tipo="+document.miForm.tipo.value;
                    url += "&SPRODUC="+objDom.getValorComponente(document.miForm.SPRODUC);
                    
                    objAjax.invokeAsyncCGI("modal_axissin019.do", callbackAjaxCargarActividades, url, this, objJsMessages.jslit_cargando);
                }
            }  
            function callbackAjaxCargarActividades (ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var elementos = doc.getElementsByTagName("OB_IAX_PRODACTIVIDADES");
                    var CACTIVICombo = document.miForm.CACTIVI;     
                    objDom.borrarOpcionesDeCombo(CACTIVICombo);
                    objDom.addOpcionACombo("<%= Integer.MIN_VALUE %>", '- <axis:alt f="axissin019" c="CSITUAC" lit="108341"/> - ', CACTIVICombo, 0);
                       for (i = 0; i < elementos.length; i++) {
                            var CACTIVI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CACTIVI"), 0, 0);
                            var TITULO = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TACTIVI"), 0, 0);
                            objDom.addOpcionACombo(CACTIVI, TITULO, CACTIVICombo, i+1);
                        }
                }
                if (!objUtiles.estaVacio(vcactivi)) {
                    document.miForm.CACTIVI.value = vcactivi; 
                    vcactivi = '';
                }
            } 
            
            function f_onchangeproductos(valor){
                if (!objUtiles.estaVacio(valor)){
                    f_cargar_cobjase();
                }else {
                    f_cargar_actividades();
                }
                
           }
           
           function f_cambia_cunitra(obj){
            if (obj.value != "null"){
                objAjax.invokeAsyncCGI("modal_axissin019.do", callbackAjaxSelectedCunitra, 
                    "operation=ajax_selected_cunitra&CUNITRA="+document.miForm.CUNITRA.value+"&CEMPRES="+document.miForm.CEMPRES.value, this, objJsMessages.jslit_actualizando_registro);}
        }
        
        function callbackAjaxSelectedCunitra(ajaxResponseText) {
            var tramitadoresCombo = document.miForm.CTRAMIT;
            try {
               var doc=objAjax.domParse(ajaxResponseText);
                                    
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    if(objUtiles.existeObjetoXml(doc.getElementsByTagName("element")[0])){
                        objDom.borrarOpcionesDeCombo(tramitadoresCombo);
                        
                        for(var i = 0;i < doc.getElementsByTagName("element").length;i++){
                            var TTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("TTRAMITAD")[0].childNodes[0].nodeValue : "");
                            var CTRAMITAD = ((objUtiles.hayValorElementoXml(doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0])) ? doc.getElementsByTagName("element")[i].getElementsByTagName("CTRAMITAD")[0].childNodes[0].nodeValue : "");
                           
                            objDom.addOpcionACombo(CTRAMITAD, TTRAMITAD, tramitadoresCombo, i);
                        }
                    }else{
                        objDom.borrarOpcionesDeCombo (tramitadoresCombo);
                        objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                    }
                }
                
            } catch (e) {
                objDom.addOpcionACombo("", " - " + objJsMessages.jslit_seleccionar + " - ", tramitadoresCombo, null);
                alert(objJsMessages.jslit_sin_tramitadores);
            }
        }

        function f_actualizar_agente(){
        // joan
         if (objValidador.validaEntrada()) {
             objAjax.invokeAsyncCGI("modal_axissin019.do", callbackAjaxCargarAgente, "operation=ajax_actualizar_agente&CAGENTE=" + objDom.getValorComponente(document.miForm.CAGENTE), this, objJsMessages.jslit_cargando);
          }  
        } 

        function callbackAjaxCargarAgente(ajaxResponseText){
        // joan    
            var doc=objAjax.domParse(ajaxResponseText);
            var elementos = doc.getElementsByTagName("element");
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                if(objUtiles.hayValorElementoXml(doc.getElementsByTagName("CODI")[0]) && elementos[0]){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado); 
                    objDom.setValorPorId("TAGENTE", NOMBREformateado); 
                }else{
                    objDom.setValorPorId("TAGENTE",""); 
                    objDom.setValorPorId("CAGENTE","");
                }
            }
            // recarrega scroll pane
            $.reinitialiseScroll();
        }

        function f_abrir_axisctr014() {
            objUtiles.abrirModal("axisctr014","src","modal_axisctr014.do?operation=form");
        }
        
        function f_but_100797(){
            
            if (objValidador.validaEntrada()) {
                var CESTSIN = null;
                var FSINIES = null;
                var CACTIVI = null;
                
                var CRAMO = document.miForm.CRAMO.value;
                var SPRODUC = document.miForm.SPRODUC.value;
                var NPOLIZA = document.miForm.NPOLIZA.value;
                var NCERTIF = document.miForm.NCERTIF.value;
                var NSINIES = document.miForm.NSINIES.value;
                <axis:ocultar f="axissin019" c="CESTSIN" dejarHueco="false"> 
                 CESTSIN = document.miForm.CESTSIN.value;
                </axis:ocultar>
                <axis:ocultar f="axissin019" c="CACTIVI" dejarHueco="false">
                 CACTIVI = document.miForm.CACTIVI.value;
                </axis:ocultar>
                var CUNITRA = document.miForm.CUNITRA.value;
                var CTRAMIT = document.miForm.CTRAMIT.value;
                
                <axis:visible f="axissin019" c="FSINIESBUS">
                 FSINIES = document.miForm.FSINIES.value;
                </axis:visible>
                
                parent.f_aceptar_axissin019(CRAMO,SPRODUC,NPOLIZA,NCERTIF,NSINIES,CESTSIN,CACTIVI,CUNITRA,CTRAMIT,FSINIES);
            }
        }
        
// Fin código javascript

       function f_cerrar_axisctr014() {
                objUtiles.cerrarModal("axisctr014")
            }    
            
       
            
            function f_aceptar_axisctr014 (CAGENTE){
                objDom.setValorPorId("CAGENTE", CAGENTE);
                f_cerrar_axisctr014();
                objAjax.invokeAsyncCGI("axis_axisctr001.do", callbackAjaxCambiarAgente, "operation=ver_agente&CODI=" + CAGENTE, this, objJsMessages.jslit_actualizando_registro);
            }  
            
            
            function callbackAjaxCambiarAgente(ajaxResponseText){
                var doc=objAjax.domParse(ajaxResponseText);

                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var CAGENTEformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("CODI"), 0, 0);
                    var NOMBREformateado = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NOMBRE"), 0, 0);
                    objDom.setValorPorId("CAGENTE", CAGENTEformateado);
                    objDom.setValorPorId("TAGENTE", NOMBREformateado);
                }
               
                
            }
            
            function f_but_9000508(){
                if (objValidador.validaEntrada()) {
                    try { document.miForm.TPAIS.value = document.getElementById("TPAIS_span").innerHTML;} catch (e) {}
                    try { document.miForm.TPROVIN.value = document.getElementById("TPROVIN_span").innerHTML;} catch (e) {}
                    try { document.miForm.TPOBLAC.value = document.getElementById("TPOBLAC_span").innerHTML;} catch (e) {}
                    if(!objUtiles.estaVacio(document.getElementById("but_aceptar"))) 
                            objDom.setDisabledPorId("but_aceptar", true);
                    objUtiles.ejecutarFormulario("modal_axissin019.do", "busqueda_siniestro", document.miForm, "_self", objJsMessages.jslit_cargando);
             
                 }
            }
			
		function f_cerrar_modal(pantalla){
            objUtiles.cerrarModal(pantalla);
        }
		
		function f_aceptar_axisper041 (CPAIS, TPAIS, CPROVIN, TPROVIN, CPOBLAC, TPOBLAC){
            f_cerrar_modal("axisper041");
            objDom.setValorPorId("CPAIS", CPAIS);
            objDom.setVisibilidadPorId("findProvincia", "visible");
            document.getElementById("TPAIS_span").innerHTML = "<b>" + TPAIS + "</b>";
            
            objDom.setValorPorId("CPROVIN", CPROVIN);           
            objDom.setVisibilidadPorId("findPoblacion", "visible");
            document.getElementById("TPROVIN_span").innerHTML = "<b>" + TPROVIN + "</b>";
            
            objDom.setValorPorId("CPOBLAC", CPOBLAC);     
            document.getElementById("TPOBLAC_span").innerHTML = "<b>" + TPOBLAC + "</b>";
                    
        }
		
		function f_aceptar_axisper042(CPOSTAL){
			f_cerrar_modal("axisper042");
			objDom.setValorPorId("CPOSTAL", CPOSTAL);
			document.miForm.CPOSTAL.focus();   
			objAjax.invokeAsyncCGI('modal_axissin017.do', callbackAjaxOnblurCPOSTAL, 'operation=getProvinPobla&CPOSTAL=' + CPOSTAL, this);  			
		}
				
		function f_abrir_axisper042 () {
			objUtiles.abrirModal("axisper042", "src", "modal_axisper042.do?operation=form");
		}
		
		
		function f_habilitar_trefext(){
        
            var CTIPREF=objDom.getValorPorId("CTIPREF");
            if (objUtiles.estaVacio(CTIPREF)){
                objDom.setDisabledPorId("TREFEXT", true);
                objDom.setValorPorId("TREFEXT", null);
            } else{
                objDom.setDisabledPorId("TREFEXT", false);
                document.miForm.TREFEXT.focus();
            }
            
        }

</script>

<body onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_buscar() }">

            <c:import url="../include/precargador_ajax.jsp">
                <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
            </c:import>
			
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper041|<axis:alt c="axisper041_TITULO" f="axisper041" lit="9002274"/></c:param>
    </c:import>
	
	<c:import url="../include/modal_estandar.jsp">
		<c:param name="nid_y_titulo">axisper042|<axis:alt c="axisper042_TITULO" f="axisper042" lit="9002274"/></c:param>
	</c:import>
            
<form name="miForm" action="" method="POST">
            <input type="hidden" name="operation" value=""/>
            <input type="hidden" name="radioSiniestro" value=""/>
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/> <!-- Revisar -->
            <input type="hidden" id="CRAMO" name="CRAMO" value="${__formdata.CRAMO}"/>
            <input type="hidden" id="TRAMO" name="TRAMO" value="${__formdata.TRAMO}"/>
            <input type="hidden" name="SPERSON" id="SPERSON" value="12345"/>
            <input type="hidden" name="SIDENTIFICADOREXTERNO" id="SIDENTIFICADOREXTERNO" value="12345"/>
            <input type="hidden" name="SDOCUMENTO" id="SDOCUMENTO" value="12345"/>
            <input type="hidden" name="MODO" id="MODO" value="<c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">${__formdata['MODO']}</c:if>"/>
            <input type="hidden" id="COBJASE" name="COBJASE" value="${__formdata.COBJASE}"/>
            <input type="hidden" name="TPAIS" value="${__formdata.TPAIS}"/>
            <input type="hidden" name="TPROVIN" value="${__formdata.TPROVIN}"/>
            <input type="hidden" name="TPOBLAC" value="${__formdata.TPOBLAC}"/>
            
            <input type="hidden" id="CEMPRES" name="CEMPRES" value="${__formdata.CEMPRES}"/>
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario">
                    <axis:alt f="axissin019" c="BUSQ_SINI" lit="9001334"/>
                </c:param>
                <c:param name="producto">
                    <axis:alt f="axissin019" c="SELECCIONAR_SINI" lit="9001334"/>
                </c:param>
                <c:param name="form">axissin019</c:param>
            </c:import>
            
                        <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axiscom001|axiscom001</c:param>
            </c:import>
            <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axissin019" c="CAGENTE" lit="100584"/></c:param>
                <c:param name="nid" value="axisctr014"></c:param>
            </c:import>
            <!-- Area de campos  -->
            <table class="mainModalDimensions base" align="center"
                   cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                  <!-- Situacion -->
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axissin019" c="DATOS_GENE" lit="103593"/>
                        </div>
                        <!--campos-->
                        <table class="seccion" >
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:15%;height:0px"></th>
                                <th style="width:5%; height:0px"></th>
                                <th style="width:15%; height:0px"></th>
                                <th style="width:15%; height:0px"></th>
                                
                            </tr>
                             <!--Nova secció agent ini joan -->
                            <axis:visible f="axissin019" c="CAGENTE">
                            <tr>
                                 <axis:ocultar f="axissin019" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="titulocaja" colspan="3">
                                        <b><axis:alt f="axissin019" c="CAGENTE" lit="100584"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <axis:ocultar f="axissin019" c="CAGENTE" dejarHueco="false"> <!-- TODO C -->
                                    <td class="campocaja" colspan="5">
                                        <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAGENTE}" name="CAGENTE" id="CAGENTE"  title="<axis:alt f="axissin019" c="CAGENTE" lit="100584"/>"  style="width:15%"
                                        title="<axis:alt f="axissin019" c="CAGENTE" lit="100584" />" onchange="f_actualizar_agente()"/>
                                        
                                        <img border="0" src="images/find.gif" onclick="f_abrir_axisctr014()" style="cursor:pointer"/>
                                        
                                        <input type="text" class="campo campotexto" value="${__formdata.TAGENTE}" name="TAGENTE" id="TAGENTE" title="<axis:alt f="axissin019" c="TAGENTE" lit="100584"/>" size="15" style="width:70%" readonly="true"
                                        title="<axis:alt f="axissin019" c="TAGENTE" lit="100584"/>"/>
                                    </td>
                                </axis:ocultar>                       
                            </tr>
                            </axis:visible>
                            <!--fi joan  -->
                            <tr>
                                <!-- Ramo -->
                                <axis:ocultar f="axissin019" c="CRAMO" dejarHueco="false"> 
                                <td class="titulocaja">
                                   
                                     <b><axis:alt f="axissin019" c="RAMO" lit="100784"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Sproduc -->
                                <axis:ocultar f="axissin019" c="SPRODUC" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axissin019" c="PRODUCTO" lit="100829"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Póliza -->
                                <axis:ocultar f="axissin019" c="NPOLIZA" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axissin019" c="NPOLIZA" lit="9001514"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Certificado -->
                                <axis:ocultar f="axissin019" c="NCERTIF" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axissin019" c="CERTIFICADO" lit="101300"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Siniestro -->
                                <axis:ocultar f="axissin019" c="NSINIES" dejarHueco="false"> 
                                <td class="titulocaja">
                                   <b><axis:alt f="axissin019" c="NSINIES" lit="101298"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Situación / Estado siniestro -->
                                <axis:ocultar f="axissin019" c="CESTSIN" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin019" c="CESTSIN" lit="112259"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                            
                                <!-- Ramo -->
                                                            
                                <axis:ocultar f="axissin019" c="CRAMO" dejarHueco="false"> 
                                    <td class="campocaja">
                                        <select name = "ramoProducto" id="ramoProducto" style="width:100%;" id ="ramoProducto" size="1" onchange="f_cargar_productos()" class="campowidthselect campo campotexto">
                                            <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach var="ramos" items="${axisctr_listaRamos}">
                                                <option value = "${ramos.CRAMO}/${ramos.TRAMO}"
                                                    <c:if test="${ramos.CRAMO == __formdata.CRAMO}">selected</c:if>>
                                                    ${ramos.TRAMO}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                                      <!-- Producto -->
                                <axis:ocultar f="axissin019" c="SPRODUC" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name = "SPRODUC" id ="SPRODUC" size="1" onchange="f_onchangeproductos(this.value)" class="campowidthselect campo campotexto">
                                        <option value="<%= Integer.MIN_VALUE %>">  <axis:alt f="axissin019" c="SELECCIONAR" lit="108341" />  </option>
                                        <c:forEach items="${__formdata.productos}" var="item">
                                            <option value = "${item.SPRODUC}" <c:if test="${__formdata['SPRODUC']==item.SPRODUC}">selected</c:if> >${item.TTITULO}</option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <!-- Póliza -->
                                <axis:ocultar f="axissin019" c="NPOLIZA" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NPOLIZA']}"
                                           name="NPOLIZA" id="NPOLIZA" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axissin019" c="NPOLIZA" lit="9001514"/>'
                                           <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                </axis:ocultar>
                                <!-- Certificado -->
                                <axis:ocultar f="axissin019" c="NCERTIF" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           id="NCERTIF" name="NCERTIF" size="15" style="width:100%;"
                                           value="${__formdata['NCERTIF']}"
                                           formato="entero"
                                           title='<axis:alt f="axissin019" c="CERTIFICADO" lit="101300"/>'
                                           <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>/>
                                </td>
                                </axis:ocultar>       
                                
                                
                                
                                <!-- Siniestro -->
                                <axis:ocultar f="axissin019" c="NSINIES" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NSINIES']}"
                                           name="NSINIES" id="NSINIES" size="15"
                                           formato="entero"
                                           title='<axis:alt f="axissin019" c="SINIESTRO" lit="101298"/>'/>
                                </td>
                                </axis:ocultar>
                                <!-- Situación / Estado siniestro -->
                                <axis:ocultar f="axissin019" c="CESTSIN" dejarHueco="false"> 
                                <td class="campocaja">
                                    <select name="CESTSIN" id="CESTSIN" size="1"
                                            class="campowidthselect campo campotexto"
                                            <c:if test="${!empty __formdata['MODO'] && __formdata['MODO']=='APERTURASINIESTROS'}">readonly</c:if>>
                                        <option value="<%= Integer.MIN_VALUE %>">
                                           <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/>
                                        
                                        </option>
                                        <c:forEach var="estado"
                                                   items="${__formdata.AXISSIN_ESTADOSSINI}">
                                            <option value="${estado.CATRIBU}"
                                                    <c:if test="${__formdata['CESTSIN'] == estado.CATRIBU}">selected</c:if>>
                                                ${estado.TATRIBU}
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>

                            </tr>
                            <tr>                                       
                                 <!--Ref externa Sinistre compania Ref externa AABC IAXIS-2067-->
                                    <axis:visible f="axissin019" c="NSINCIA">
                                        <td class="titulocaja">                                
                                            <b><axis:alt f="axissin019" c="NSINCIA" lit="89906253"></axis:alt></b>                                
                                        </td>
                                     </axis:visible>       
                                     <!-- IAXIS-2169 AABC Adicion campo Fecha de apertura -->     
                                     <axis:visible f="axissin019" c="FALTA">
                                        <td class="titulocaja">
                                    		<b><axis:alt f="axisagd003" c="FALTA" lit="9910210"/></b>                                
                                		</td>
                                     </axis:visible> 
                                     <!-- IAXIS-2169 AABC Adicion campo Fecha de apertura -->    
                                     <!--Sinistre compania -->
                                    <axis:visible f="axissin019" c="CCOMPANI">  
                                        <td class="titulocaja">                                
                                            <b><axis:alt f="axissin019" c="CCOMPANI" lit="9000600"></axis:alt></b>                               
                                        </td>
                                     </axis:visible>   
                                     
                                     <!--Poliza compania -->
                                     <axis:ocultar f="axissin019" c="CPOLCIA" dejarHueco="false">                            
                                         <td class="titulocaja" id="LIT_CPOLCIA">
                                             <b><axis:alt f="axissin019" c="CPOLCIA" lit="9001766"/></b><%-- Nº Póliza Compania --%>                              
                                         </td>
                                     </axis:ocultar> 
                                     
                                       <!--Presinistre -->
                                    <axis:visible f="axissin019" c="NPRESIN">  
                                        <td class="titulocaja">                                
                                            <b><axis:alt f="axissin019" c="NPRESIN" lit="9901400"></axis:alt></b>                               
                                        </td>
                                     </axis:visible>     
                                     <!--Tipo de riesgo-->                                             
                           <%--         <axis:ocultar c="TIPRIESGO" f="axissin019" dejarHueco="false">  
                                        <td class="titulocaja" colspan="2">                                
                                            <b><axis:alt f="axissin019" c="TIPRIESGO" lit="103417"></axis:alt></b>                               
                                        </td>
                                    </axis:ocultar>     --%>                               
                            </tr>
                            <tr>
                             <!--Ref externa Sinistre compania -->
			     <!-- AABC IAXIS-2067 TIPO DE SINIESTRO -->
                                <axis:visible f="axissin019" c="NSINCIA">
                                    <td class="campocaja" colspan="1">                                        
                                        <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NSINCIA']}"
                                           name="NSINCIA" id="NSINCIA" size="15"
                                           title='<axis:alt f="axissin019" c="NO_COMPANY" lit="89906253"/>'/>
                                    </td> 
                                </axis:visible>                                
                                <!-- IAXIS-2169 AABC Adicion campo Fecha de apertura -->                              
                                <axis:ocultar c="FALTA" f="axissin019" dejarHueco="false">
                                   <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" 
                                            value="<fmt:formatDate value='${__formdata.FALTA}' pattern='dd/MM/yyyy'/>" name="FALTA" id="FALTA"
                                            style="width:60%;" <axis:atr f="axisadm048" c="FALTA" a="formato=fecha"/>
                                            title="<axis:alt f="axisadm048" c="FALTA" lit="9001192"/>"/><a id="icon_FALTA" style="vertical-align:middle;"><img 
                                            alt="<axis:alt f="axisadm048" c="FALTA" lit="9001192"/>" title="<axis:alt f="axisadm048" c="FALTA" lit="9001192" />" src="images/calendar.gif"/></a>                                    
                                </axis:ocultar>
                                <!-- IAXIS-2169 AABC Adicion campo Fecha de apertura -->                              
                                    <!--Sinistre compania -->
                                <axis:visible f="axissin019" c="CCOMPANI">
                                    <td class="campocaja" colspan="1">                                   
                                        <select  name = "CCOMPANI" id ="CCOMPANI" size="1"  class="campowidthselect campo campotexto">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>
                                            <c:forEach items="${CIAS}" var="cia">
                                                <option value = "${cia.CCOMPANI}" <c:if test="${__formdata['CCOMPANI'] == cia.CCOMPANI}">selected</c:if>>${cia.TCOMPANI}</option>
                                            </c:forEach>                                                    
                                        </select>
                                                            <!--
                                        <input type="text" class="campodisabled campo campotexto" style="width:95%;" <axis:atr f="axissin019" c="CSINCIA" a="modificable=false"/> id="CSINCIA" name="CSINCIA" size="15"  value="${__formdata['CSINCIA']}"/>                                    
                                        -->
                                    </td> 
                                </axis:visible>
                                
                                 <!--Poliza compania -->
                                <axis:ocultar f="axissin019" c="CPOLCIA" dejarHueco="false">
                                     <td class="campocaja">                             
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOLCIA}" name="CPOLCIA" id="CPOLCIA"
                                            style="width:91%;" title="<axis:alt f="axissin019" c="CPOLCIA" lit="9001766"/>" <axis:atr f="axissin019" c="CPOLCIA"/> />
                                    </td>
                                </axis:ocultar>  
                                
                                
                                <!-- Pre siniestro -->
                               <axis:visible f="axissin019" c="NPRESIN">
                                    <td class="campocaja">
                                        <input type="text"
                                               class="campowidthinput campo campotexto"
                                               value="${__formdata['NPRESIN']}"
                                               name="NPRESIN" id="NPRESIN" size="15"
                                               formato="entero"
                                               title='<axis:alt f="axissin019" c="PRESINIESTRO" lit="9901400"/>'/>
                                    </td>    
                                </axis:visible>
                                
                                <!--Sinistre compania -->                                
                           <%--     <axis:ocultar c="TIPRIESGO" f="axissin019" dejarHueco="false">                                  
                                    <td class="campocaja" colspan="2">                                  
                                        <select  name = "TIPRIESGO" id ="TIPRIESGO" size="1"  class="campowidthselect campo campotexto" 
                                            <axis:atr f="axissin019" c="TIPRIESGO" a="modificable=true&obligatorio=false"/> onchange="f_refrescarDependencias();">
                                          <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>  
                                            <c:forEach items="${LST_TIPRIESGO}" var="tpr">
                                                <option value = "${tpr.CATRIBU}" <c:if test="${__formdata['TIPRIESGO'] == tpr.CATRIBU}">selected</c:if>>${tpr.TATRIBU}</option>
                                                </c:forEach>                                                                                      
                                        </select>
                                    </td> 
                                </axis:ocultar>     --%>                                                          
                            </tr>
                            <tr>
                                <axis:ocultar f="axissin019" c="CACTIVI" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin019" c="CACTIVI" lit="103481"></axis:alt></b>
                                    </td>
                                </axis:ocultar>
                                <!-- Tipo referencia -->
                               <axis:ocultar f="axissin019" c="CTIPREF" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin019" c="CTIPREF" lit="9908027"/></b>
                                    </td>
                                </axis:ocultar>
                                <!-- Código de Referencia -->
                                 <axis:ocultar f="axissin019" c="TREFEXT" > 
                                <td class="titulocaja">
                                     <b><axis:alt f="axissin019" c="TREFEXT" lit="9908028"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr019" c="NCONTRATO">
                                        <td id="tit_NCONTRATO" class="titulocaja">
                                            <b id="label_NCONTRATO"><axis:alt f="axisctr019" c="NCONTRATO" lit="9000536"></axis:alt></b>
                                        </td>
                               </axis:ocultar>
                                
                            </tr>
                            <tr> 
                                <axis:ocultar f="axissin019" c="CACTIVI" dejarHueco="false">
                                    <td class="campocaja">
                                        <select name="CACTIVI" id ="CACTIVI" size="1" onchange="" class="campowidthselect campo campotexto">
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="BLANCO" lit="108341" /> - </option>
                                            <c:forEach items="${__formdata.actividades}" var="item">
                                                <option value = "${item.OB_IAX_PRODACTIVIDADES.CACTIVI}" <c:if test="${__formdata['CACTIVI']==item.OB_IAX_PRODACTIVIDADES.CACTIVI}">selected</c:if> >${item.OB_IAX_PRODACTIVIDADES.TACTIVI}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                <!--Tipo referencia -->
                                <axis:ocultar f="axissin019" c="CTIPREF" >
                                    <td class="campocaja">
                                        <select name="CTIPREF" id ="CTIPREF" size="1" onchange="f_habilitar_trefext()" class="campowidthselect campo campotexto">
                                            <option value=""> - <axis:alt f="axissin019" c="BLANCO" lit="108341" /> - </option>
                                            <c:forEach items="${__formdata.listaCTIPREF}" var="item">
                                                <option value = "${item.CATRIBU}" <c:if test="${!empty __formdata['CTIPREF'] && __formdata['CTIPREF']==item.CATRIBU}">selected</c:if> >${item.TATRIBU}</option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:ocultar>
                                 <!-- Código Referencia -->
                                <axis:ocultar f="axissin019" c="TREFEXT" > 
                                <td class="campocaja">
                                      <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata['TREFEXT']}" name="TREFEXT" id="TREFEXT"
                                            style="width:91%;" title="<axis:alt f="axissin019" c="TREFEXT" lit="9908028"/>" <axis:atr f="axissin019" c="TREFEXT"/> />
                                </td>
                                </axis:ocultar>
                               <axis:ocultar f="axisctr019" c="NCONTRATO">
                                        <td id="td_NCONTRATO" class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NCONTRATO}" name="NCONTRATO" id="NCONTRATO"
                                             title="<axis:alt f="axisctr019" c="NCONTRATO" lit="9000536"/>"/>
                                        </td>
                               </axis:ocultar>
                             </tr>
                                
                            <tr>
                                <axis:visible c="CUNITRA" f="axissin019">                            
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin019" c="CUNITRA" lit="9000900"/></b><!-- Unidad de tramitacion -->
                                    </td>
                                </axis:visible>  
                                <axis:visible c="CTRAMIT" f="axissin019">
                                <td class="titulocaja" >
                                    <b><axis:alt f="axissin019" c="CTRAMIT" lit="9910018"/></b><!-- Tramitador nuevo -->
                                </td>
                                </axis:visible>
                                <axis:visible c="FSINIESBUS" f="axissin019">
                                <td class="titulocaja" >
                                    <b><axis:alt f="axissin019" c="FSINIES" lit="110521"/></b><!-- Fecha siniestro -->
                                </td>
                                </axis:visible>
                            </tr>
                            <tr>
                                <!-- Unitat Tramitació -->
                                <axis:visible c="CUNITRA" f="axissin019">
                                    <td class="campocaja">
                                        <select name = "CUNITRA" id ="CUNITRA" size="1" onchange="f_cambia_cunitra(this)" class="campowidthselect campo campotexto"
                                        title="<axis:alt f='axissin019' c='CUNITRA' lit='9000900'/>"
					<axis:atr f="axissin019" c="CUNITRA" a="modificable=true&obligatorio=true"/>>                                                    
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="COMBO_CUNITRA" lit="1000348"/> - </option>
                                            <c:forEach var="cunitraOp" items="${__formdata.listvalores.lstcunitra}">
                                                <option value = "${cunitraOp.CTRAMITAD}" 
                                                   <c:if test="${cunitraOp.CTRAMITAD == __formdata.CUNITRA}">selected</c:if>>
                                                   ${cunitraOp.TTRAMITAD}
                                                </option>
                                            </c:forEach>
                                        </select>
                                    </td>
                                </axis:visible>  
                               
                                <!-- Tramitador -->
                                <axis:visible c="CTRAMIT" f="axissin019">                        
                                <td class="campocaja">
                                    <select name = "CTRAMIT" id ="CTRAMIT" size="1" class="campowidthselect campo campotexto"
                                    title="<axis:alt f='axissin019' c='CTRAMIT' lit='9910018'/>"
                                     <axis:atr f="axissin019" c="CTRAMIT" a="modificable=true&obligatorio=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="COMBO_CTRAMIT" lit="1000348"/> - </option>
                                        <c:forEach var="ttramitadOp" items="${__formdata.listvalores.lsttramit}">
                                            <option value = "${ttramitadOp.CTRAMITAD}" 
                                            <c:if test="${__formdata.CTRAMITAD  != 'null' && ttramitadOp.CTRAMITAD == __formdata.CTRAMIT}">selected</c:if>>
                                                ${ttramitadOp.TTRAMITAD} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:visible> 
                                
                                <axis:visible f="axissin019" c="FSINIESBUS">
                                <td class="campocaja">  
                                     <input style="width:50%;"  type="text" class="campowidthinput campo campotexto" id="FSINIES" name="FSINIES" size="15"  title="<axis:alt f='axissin019' c='FSINIES' lit='9901534' />" 
                                                        value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FSINIES}"/>" <axis:atr f="axissin019" c="FSINIES" a="modificable=true&formato=fecha"/> />
                                     <a id="icon_FSINIES" style="vertical-align:middle;">
                                     <img alt="<axis:alt f="axissin019" c="DATE" lit="108341"/>" title="<axis:alt f="axissin019" c="FSINIES" lit="9001861" />" src="images/calendar.gif"/></a>                  
                                </td>
                                </axis:visible> 
                                
                            </tr>
                            
                        </table>
                    </td>
                </tr>
                
               
                <axis:visible f="axissin019" c="DSP_DATOS_PERSO">
                <tr>
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                           <axis:alt f="axissin019" c="DATOS_PERSO" lit="110275"/>
                        </div>
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%; height:0px"></th>
                            </tr>
                            <tr>
                                <!-- Número de documento -->
                                <axis:ocultar f="axissin019" c="NNUMIDE" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin019" c="DOCUMENTO" lit="105330"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Nombre -->
                                <axis:ocultar f="axissin019" c="BUSCAR" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin019" c="NOMBRE" lit="105940"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- Identificador externo -->
                                <axis:ocultar f="axissin019" c="SNIP" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin019" c="COD_TERC" lit="1000088"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                                <axis:ocultar f="axissin019" c="TDESCRIE" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin019" c="TDESCRIE" lit="101761"/></b>
                                </td>
                                </axis:ocultar>
                                <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                                <axis:ocultar f="axissin019" c="TIPOPERSONA" dejarHueco="false"> 
                                <td class="titulocaja">
                                    <input type="radio" id="TIPOPERSONA"
                                           name="TIPOPERSONA" value="1"
                                           <c:if test="${__formdata['TIPOPERSONA'] == '1' || empty __formdata['TIPOPERSONA']}">checked</c:if>/>
                                    <b><axis:alt f="axissin019" c="TOMADOR" lit="101027"/>?</b>
                                </td>
                                </axis:ocultar>

                            </tr>
                            <tr>
                                <!-- Número de documento -->
                                <axis:ocultar f="axissin019" c="NNUMIDE" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           value="${__formdata['NNUMIDE']}"
                                           name="NNUMIDE" id="NNUMIDE"
                                           size="15"/>
                                </td>
                                </axis:ocultar>
                                <!-- Nombre -->
                                <axis:ocultar f="axissin019" c="BUSCAR" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           name="BUSCAR" id="BUSCAR" size="15"
                                           value="${__formdata['BUSCAR']}"/>
                                </td>
                                </axis:ocultar>
                                <!-- Identificador externo -->
                                <axis:ocultar f="axissin019" c="SNIP" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           name="SNIP" id="SNIP" size="15"
                                           value="${__formdata['SNIP']}"
                                           title='<axis:alt f="axissin019" c="COD_TERCE" lit="1000088"/>'/>
                                </td>
                                </axis:ocultar>
                                <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                                <axis:ocultar f="axissin019" c="TDESCRIE" dejarHueco="false"> 
                                <td class="campocaja">
                                    <input type="text"
                                           class="campowidthinput campo campotexto"
                                           name="TDESCRIE" id="TDESCRIE" size="15"
                                           <axis:atr f="axissin019" c="TDESCRIE" a="modificable=false"/>
                                           value="${__formdata['TDESCRIE']}"
                                           title='<axis:alt f="axissin019" c="TDESCRIE" lit="102524"/>'/>
                                </td>
                                </axis:ocultar>                                
                                <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                                <axis:ocultar f="axissin019" c="TIPOPERSONA" dejarHueco="false"> 
                                <td class="titulocaja">
                                    
                                    <input type="radio" id="TIPOPERSONA"
                                           name="TIPOPERSONA" value="2"
                                           <c:if test="${__formdata['TIPOPERSONA'] == '2'}">checked</c:if>/>
                                    <b><axis:alt f="axissin019" c="ASSEGURADO" lit="1000078"/></b>
                                </td>
                                </axis:ocultar>
                        
                            </tr>
                            <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                            <axis:visible f="axissin019" c="RADIO_OTROS">
                            <tr>
                                <td class="campocaja">                                    
                                </td>
                                <td class="campocaja">                                    
                                </td>
                                <td class="campocaja">                                    
                                </td>
                                <td class="titulocaja">          
                                <axis:visible f="axissin019" c="RADIO_OTROS">
                                    <input type="radio" id="TIPOPERSONA"
                                           name="TIPOPERSONA" value="3"
                                           <c:if test="${__formdata['TIPOPERSONA'] == '3'}">checked</c:if>/>
                                    <b><axis:alt f="axissin019" c="RADIO_OTROS" lit="110031"></axis:alt></b>                                                                   
                                </axis:visible>
                                </td>
                            </tr>                            
                            </axis:visible>
                            <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                            <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                            <axis:visible f="axissin019" c="DESCRIPCION_RIESGO">
                                <tr>
                                    <td class="campocaja">                                    
                                    </td>
                                    <td class="campocaja">                                    
                                    </td>
                                    <td class="campocaja">                                    
                                    </td>
                                    <td class="titulocaja">          
                                    <axis:visible f="axissin019" c="DESCRIPCION_RIESGO">
                                        <input type="radio" id="TIPOPERSONA"
                                               name="TIPOPERSONA" value="4"
                                               <c:if test="${__formdata['TIPOPERSONA'] == '4'}">checked</c:if>/>
                                        <b><axis:alt f="axissin019" c="RADIO_OTROS" lit="101761"></axis:alt>?</b>                                                                   
                                    </axis:visible>
                                    </td>
                                </tr>
                            </axis:visible>
                            <!-- BUG CONF_309 - 10/09/2016 - JAEG -->
                        </table>
                    </td>
                </tr>
                </axis:visible>
                <!--Nova secció dades del risc -->
                <c:if test="${!empty LST_TIPRIESGO}">
                <axis:visible f="axissin019" c="DSP_TIPRIESGO">
                <tr id = "DSP_TIPRIESGO"> 
        
                   <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/>
                            <axis:alt f="axissin019" c="DSP_DATOSRIESGO" lit="1000100"></axis:alt>
                        </div>
                        <table class="seccion">                   
                            <tr>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                                <th style="width:20%; height:0px"></th>
                            </tr>                                    
                            <tr>
                                 <c:forEach items="${LST_TIPRIESGO}" var="item" varStatus="status" >
                                    <td class="titulocaja">
                                        <b>${item.TATRIBU}?</b>
                                        <input type="radio" id="CTIPRIESGO_${item.CATRIBU}" name="CTIPRIESGO" value="${item.CATRIBU}" onclick="f_refrescarDependencias2('${item.CATRIBU}');" <c:if test="${__formdata['COBJASE'] == item.CATRIBU}">checked</c:if>/>
                                    </td>
                                </c:forEach>
                            </tr> 
                            <axis:visible f="axissin019" c="td_NOMVIA_etiq">
                            <tr id="td_NOMVIA_etiq">
                              <!-- Tipo via   -->
                               <axis:visible f="axissin019" c="CSIGLAS">
                                    <td class="titulocaja" id="label_CSIGLAS">                                                
                                        <b><axis:alt f="axissin019" c="CSIGLAS" lit="110028"></axis:alt></b>                                                                                                                                   
                                    </td>
                                </axis:visible>                              
                                <!-- Nombre via-->
                                <axis:visible f="axissin019" c="TNOMVIA">
                                   <td class="titulocaja" id="label_TNOMVIA">               
                                        <b><axis:alt f="axissin019" c="TNOMVIA" lit="110029"></axis:alt></b>                                        
                                   </td>
                                </axis:visible>
                               <!-- Número -->                               
                               <axis:visible f="axissin019" c="NNUMVIA">
                                   <td class="titulocaja" id="label_NNUMVIA">               
                                        <b><axis:alt f="axissin019" c="NNUMVIA" lit="800440"></axis:alt></b>                                        
                                   </td>
                                </axis:visible>
                                  <!--  Otros datos complementarios-->
                                <axis:visible f="axissin019" c="TCOMPLE">
                                   <td class="titulocaja" id="label_TCOMPLE">               
                                        <b><axis:alt f="axissin019" c="TCOMPLE" lit="9901149"></axis:alt></b>                                        
                                   </td>
                                </axis:visible>
                            </tr>  
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_NOMVIA">
                            <tr id="td_NOMVIA">
                               <!-- Tipo via   -->                               
                               <axis:visible f="axissin019" c="CSIGLAS">
                                   <td class="campocaja">
                                     <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELLECIONI" lit="1000348"/> - </option>
                                        <c:forEach  items="${lstTipoVia}" var="elem">
                                            <option value = "${elem.CSIGLAS}" <c:if test="${elem.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if>>
                                                ${elem.TDENOM} 
                                            </option>
                                        </c:forEach>                               
                                     </select>
                                    </td>
                               </axis:visible>                                                                 
                                 <!-- Nombre via-->                                
                                <axis:visible f="axissin019" c="TNOMVIA">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto"
                                        id="TNOMVIA" name="TNOMVIA" style="width:90%;" <axis:atr f="axissin019" c="TNOMVIA" a="modificable=true"/> size="15"  value="${__formdata.TNOMVIA}"/>                                
                                    </td>
                                </axis:visible>
                                <!-- Número -->                                
                                <axis:visible f="axissin019" c="NNUMVIA">
                                    <td class="campocaja">
                                        <input  type="text" class="campowidthinput campo campotexto"
                                        id="NNUMVIA" name="NNUMVIA" size="15" style="width:60%;" <axis:atr f="axissin019" c="NNUMVIA" a="modificable=true"/>  value="${__formdata.NNUMVIA}"/>
                                    </td>
                                </axis:visible>                                
                                <!-- Otros -->
                                <axis:visible f="axissin019" c="TCOMPLE">
                                    <td class="campocaja" colspan="2">
                                        <input  type="text" style="width:90%;" class="campowidthinput campo campotexto" <axis:atr f="axissin019" c="TCOMPLE" a="modificable=true"/>  id="TCOMPLE" name="TCOMPLE" 
                                        value="${__formdata.TCOMPLE}"/>
                                    </td>
                                </axis:visible>
                            </tr> 
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_CPOBLAC_etiq">
                            <tr id="td_CPOBLAC_etiq">
                                <!-- C.P -->
                                <axis:visible f="axissin019" c="CPOSTAL">
                                    <td class="titulocaja" id="label_CPOSTAL">
                                        <b><axis:alt f="axissin019" c="CPOSTAL" lit="100823"></axis:alt></b>                                    
                                    </td>
                                </axis:visible>    
                                <!-- País-->
                                <axis:visible f="axissin019" c="CPAIS">
                                    <td class="titulocaja" id="label_CPAIS">
                                        <b><axis:alt f="axissin019" c="CPAIS" lit="100816"/></b>
                                    </td>
                                </axis:visible>
                                <!-- Provincia -->
                                <axis:visible f="axissin019" c="CPROVIN">
                                    <td class="titulocaja" id="label_CPROVIN">
                                        <b><axis:alt f="axissin019" c="CPROVIN" lit="100756"></axis:alt></b>                                    
                                    </td>
                                </axis:visible>    
                                <!--  Población -->
                                <axis:visible f="axissin019" c="CPOBLAC">
                                    <td class="titulocaja" id="label_CPOBLAC">                                                     
                                        <b><axis:alt f="axissin019" c="CPOBLAC" lit="100817"></axis:alt></b>                                                                        
                                    </td>
                                </axis:visible>
                            </tr>
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_CPOBLAC">
                            <tr id="td_CPOBLAC">
                                <!-- C.P -->  
                                <axis:visible f="axissin019" c="CPOSTAL">
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                        <axis:atr f="axissin019" c="CPOSTAL"/> title="<axis:alt f="axissin019" c="CPOSTAL" lit="100823"/>"
                                        style="width:60%;" onblur="f_onblur_CPOSTAL(this.value)"/>
										&nbsp;
										<axis:ocultar c="CPOSTALFIND" f="axissin019" dejarHueco="false">
											<img id="findCpostal" border="0" src="images/find.gif" onclick="f_abrir_axisper042();" style="cursor:pointer" alt=""/>
										</axis:ocultar>
                                    </td>      
                                </axis:visible>
                                <axis:visible f="axissin019" c="CPAIS">
                                    <!-- País-->
                                      <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:18%;" 
                                        <axis:atr f="axissin019" c="CPAIS" a="formato=entero"/> title="<axis:alt f="axissin019" c="CPAIS" lit="100816"/>"/>&nbsp;
                                        <axis:visible c="findPais" f="axissin019">
                                        <img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                        </axis:visible>
                                        &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                      </td>
                                 </axis:visible>     
                                 <!-- Provincia -->
                                <axis:visible f="axissin019" c="CPROVIN">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;"
                                        <axis:atr f="axissin019" c="CPROVIN" a="formato=entero"/> />&nbsp;
                                        <img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)"/>                
                                        &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>                                  
                                    </td>
                                </axis:visible>
                                <!--  Población -->
                                <axis:visible f="axissin019" c="CPOBLAC">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;"
                                        <axis:atr f="axissin019" c="CPOBLAC" a="formato=entero"/> title="<axis:alt f="axissin019" c="CPOBLAC" lit="100817"/>"/>
                                        &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value)"/>                
                                        &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>                                        
                                    </td>    
                                </axis:visible>
                            </tr>
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_FGIS_etiq">
                             <tr id="td_FGIS_etiq">
                                <!--Coordenada GIS X (GPS) --> 
                                <axis:visible f="axissin019" c="FGISX">
                                    <td class="titulocaja" id="label_FGISX">
                                        <b><axis:alt f="axissin019" c="FGISX" lit="9901026"></axis:alt></b>                                    
                                    </td>
                                </axis:visible>
                                <!-- Coordenada GIS Y (GPS) -->
                                <axis:visible f="axissin019" c="FGISY">
                                    <td class="titulocaja" id="label_FGISY">
                                        <b><axis:alt f="axissin019" c="FGISY" lit="9901027"></axis:alt></b>                                    
                                    </td>
                                </axis:visible>
                                <!--  Coordenada GIS Z (GPS) -->
                                <axis:visible f="axissin019" c="FGISZ">
                                    <td class="titulocaja" id="label_FGISZ">                                                     
                                        <b><axis:alt f="axissin019" c="FGISZ" lit="9901028"></axis:alt></b>                                                                        
                                    </td>
                                </axis:visible>
                            </tr>
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_FGIS">
                            <tr id="td_FGIS">
                                <!--Coordenada GIS X (GPS) --> 
                                <axis:visible f="axissin019" c="FGISX">
                                     <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.FGISX}" name="FGISX" id="FGISX" 
                                         <axis:atr f="axissin019" c="FGISX" a="formato=decimal"/> title="<axis:alt f="axissin019" c="FGISX" lit="9901026"/>"
                                        style="width:60%;" />
                                    </td>       
                                </axis:visible>
                                <!--Coordenada GIS Y (GPS) --> 
                                <axis:visible f="axissin019" c="FGISY">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.FGISY}" name="FGISY" id="FGISY"  style="width:18%;"
                                        <axis:atr f="axissin019" c="FGISY"/> title="<axis:alt f="axissin019" c="FGISY" lit="9901027"/>"
                                        <axis:atr f="axissin019" c="FGISY" a="formato=decimal"/> />
                                    </td>
                                </axis:visible>
                                <!--Coordenada GIS Z (GPS) --> 
                                <axis:visible f="axissin019" c="FGISZ">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.FGISZ}" name="FGISZ" id="FGISZ"  style="width:18%;"
                                        <axis:atr f="axissin019" c="FGISZ"/> title="<axis:alt f="axissin019" c="FGISZ" lit="9901028"/>"
                                        <axis:atr f="axissin019" c="FGISZ" a="formato=decimal"/> />                                    
                                    </td>    
                                </axis:visible>
                            </tr>    
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_TDESCRI_etiq">
                            <tr id="td_TDESCRI_etiq">
                                <!--Descripción --> 
                                <axis:visible f="axissin019" c="TDESCRI">
                                    <td class="titulocaja" id="label_TDESCRI">
                                        <b><axis:alt f="axissin019" c="TDESCRI" lit="100588"></axis:alt></b>                                    
                                    </td>
                                </axis:visible>                                
                            </tr>
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_TDESCRI">
                            <tr id="td_TDESCRI">
                                <!--Descripción --> 
                                <axis:visible f="axissin019" c="TDESCRI">
                                     <td class="campocaja" colspan="3">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TDESCRI}" name="TDESCRI" id="TDESCRI" 
                                        <axis:atr f="axissin019" c="TDESCRI"/> title="<axis:alt f="axissin019" c="TDESCRI" lit="100588"/>"
                                        style="width:100%;" />
                                    </td>       
                                </axis:visible>                                
                           </tr>
                           </axis:visible>
                           <axis:visible f="axissin019" c="td_CMATRIC_etiq">
                           <tr id="td_CMATRIC_etiq">
                                <!--Tipo de matrícula --> 
                                <axis:visible f="axissin019" c="CTIPMAT">
                                    <td class="titulocaja" id="label_CTIPMAT">
                                        <b><axis:alt f="axissin019" c="CTIPMAT" lit="9001056"></axis:alt></b>                                    
                                    </td>
                                </axis:visible>
                                <!-- Número de matrícula -->
                                <axis:visible f="axissin019" c="CMATRIC">
                                    <td class="titulocaja" id="label_CMATRIC">
                                        <b><axis:alt f="axissin019" c="CMATRIC" lit="9001057"></axis:alt></b>                                    
                                    </td>
                                </axis:visible> 
                                <axis:ocultar f="axissin019" c="CMOTOR" dejarHueco="false"> 
                                    <td id="tit_CMOTOR" class="titulocaja">
                                        <b id="label_CMOTOR"><axis:alt c="CMOTOR" f="axisctr019" lit="9904654"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axissin019" c="CCHASIS" dejarHueco="false"> 
                                    <td id="tit_CCHASIS" class="titulocaja">
                                        <b id="label_CCHASIS"><axis:alt c="CCHASIS" f="axissin019" lit="9904655"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axissin019" c="NBASTID" dejarHueco="false"> 
                                    <td id="tit_NBASTID" class="titulocaja">
                                        <b id="label_NBASTID"><axis:alt c="NBASTID" f="axissin019" lit="9001061"/></b>
                                    </td>
                                </axis:ocultar>
                                
                            </tr>
                            </axis:visible>
                            <axis:visible f="axissin019" c="td_CMATRIC">
                            <!--Tipo de matrícula --> 
                            <tr id="td_CMATRIC">                                
                                <axis:visible f="axissin019" c="CTIPMAT">
                                    <td class="campocaja">
                                      <select name = "CTIPMAT" id="CTIPMAT" <axis:atr f="axissin019" c="CTIPMAT" a="modificable=true&isInputText=false"/>  
                                                size="1" class="campowidthselect campo campotexto"   title="<axis:alt f="axissin019" c="CTIPMAT" lit="9001056"/>" > 
                                                    <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin019" c="SELECCIONAR" lit="108341"/> - </option>    
                                                    <c:forEach var="tip_matricula" items="${TMATRICULA}">
                                                        <option value = "${tip_matricula.CATRIBU}"
                                                           <c:if test="${tip_matricula.CATRIBU == __formdata.CTIPMAT}"> selected </c:if>>
                                                            ${tip_matricula.TATRIBU}</option>  
                                                    </c:forEach>
                                                </select> 
                                    </td>       
                                </axis:visible>
                                <!-- Número de matrícula -->
                                <axis:visible f="axissin019" c="CMATRIC">
                                    <td class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CMATRIC}" name="CMATRIC" id="CMATRIC"  
                                        title="<axis:alt f="axissin019" c="CMATRIC" lit="9001057"/>"/>
                                    </td>
                                </axis:visible>  
                                <axis:ocultar f="axissin019" c="CMOTOR" dejarHueco="false">
                                    <td id="td_CMOTOR" class="campocaja">
                                        <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axisctr019" c="CMOTOR" a="modificable=true"/> size="15" value="${__formdata.CMOTOR}" name="CMOTOR" id="CMOTOR"
                                                title="<axis:alt f="axisctr019" c="CMOTOR" lit="9904654"/>"
                                                onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!?#$%&/()=¡Ñ\ ¡?#$%&/()=?¡*?][_:;?¿+?}{-.,|°¬\~')"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axissin019" c="CCHASIS" dejarHueco="false">
                                        <td id="td_CCHASIS" class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axissin019" c="CCHASIS" a="modificable=true"/> size="15" value="${__formdata.CCHASIS}" name="CCHASIS" id="CCHASIS"
                                                     title="<axis:alt f="axissin019" c="CCHASIS" lit="9904655"/>"
                                                     onchange="objValidador.f_validarCaracters(this,'%?*.;,:_-&$()!+°!?#$%&/()=¡Ñ\ ¡?#$%&/()=?¡*?][_:;?¿+?}{-.,|°¬\~ÑOIQ')"/>
                                        </td>
                                </axis:ocultar>
                                <axis:ocultar f="axissin019" c="NBASTID" dejarHueco="false">
                                        <td id="td_NBASTID" class="campocaja">
                                            <input type="text" class="campowidthinput campo campotexto" <axis:atr f="axissin019" c="NBASTID" a="modificable=true"/> size="15" value="${__formdata.NBASTID}" name="NBASTID" id="NBASTID"
                                                 title="<axis:alt f="axisctr019" c="NBASTID" lit="9001061"/>" onchange="objValidador.f_validarCaracters(this,'IOQÑ')"/>
                                        </td>
                                </axis:ocultar>
                            </tr>     
                            </axis:visible>
                        </table>
                    </td>
                </tr>
                </axis:visible>      
                </c:if>
                <!--Fi nova secció dades del risc -->
                <tr>
                   
                </tr>
                <!-- Lista de pólizas -->
                <tr>
                <axis:ocultar f="axissin019" c="LST_POLIZAS" dejarHueco="false"> 
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axissin019" c="LISTADO_POLIZAS" lit="9001349"/>
                        </div>
                        <!-- Lista de pólizas -->
                        <table class="seccion">
                            <tr>
                                <td>
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                        <axis:alt f="axissin019" c="NPOLIZA" lit="9001514"/>
                                    </c:set>
                                    
                                    <!-- ini bug 0021781 -->
                                    <axis:visible c="NCERTIF2" f="axissin019">
                                    <c:set var="title9">
                                        <axis:alt f="axissin019" c="TCERTIF2" lit="104595"/>
                                    </c:set>
                                    </axis:visible>
                                    <!-- fin bug 0021781 -->
                                    
                                    <c:set var="title2">
                                        <axis:alt f="axissin019" c="SINIS" lit="101298"/>
                                    </c:set>
                                  
                                    <c:set var="title4">
                                        <axis:alt f="axissin019" c="ESTAT_SINIS" lit="112259"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axissin019" c="DESC_PRODUCTO" lit="1000111"/>
                                    </c:set>
                                    <c:set var="title6">
                                        <axis:alt f="axissin019" c="CPOLCIA" lit="9001766"/>
                                    </c:set>
                                    
                                    <c:set var="title5">
                                       <axis:alt f="axissin019" c="TACTIVIDAD" lit="103481"></axis:alt>
                                    </c:set>
                                    
                                    <c:set var="title8">
                                       <axis:alt f="axissin019" c="TAGENTE" lit="100584"></axis:alt>
                                    </c:set>
                                    
                                    <c:set var="title13">
                                       <axis:alt f="axissin019" c="TTOMADOR" lit="9908119"></axis:alt>
                                    </c:set>
                                    
                                    <c:set var="title14">
                                       <axis:alt f="axissin019" c="TASEGURADO" lit="9904824"></axis:alt>
                                    </c:set>
                                    
                                    <div class="seccion displayspaceGrande">
                                        <display:table name="${__formdata.AXISSIN_POLIZAS}"
                                                       id="miListaPolizas"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="4"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="modal_axissin019.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <display:column headerClass="headwidth5 sortable"
                                                            title=""
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcons">
                                                    <!--input value="${miListaPolizas['NPOLIZA']}/${miListaPolizas['NCERTIF']}/${miListaPolizas.NSINIES}" -->
                                                    <input value="${miListaPolizas['NSINIES']}/${miListaPolizas['SSEGURO']}/${miListaPolizas.SPRODUC}/${miListaPolizas.CACTIVI}/${miListaPolizas.NRIESGO}"
                                                           type="radio"
                                                           onclick="f_seleccionar_poliza_2('${miListaPolizas.NPOLIZA}','${miListaPolizas['NCERTIF']}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.SPRODUC}','${miListaPolizas.CACTIVI}');"
                                                           <c:if test="${!empty __formdata.AXISSIN_POLIZAS && fn:length(__formdata.AXISSIN_POLIZAS) == 1}" >checked</c:if>
                                                           id="radioPoliza"
                                                           name="radioPoliza"/>
                                                </div>
                                            </display:column>
                                            
                                            <display:column title="${title1}"
                                                            sortable="true"
                                                            sortProperty="NPOLIZA"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <!--a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}', '${miListaPolizas['NCERTIF']}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.SPRODUC}','${miListaPolizas.CACTIVI}');" -->
                                                        ${miListaPolizas['NPOLIZA']}
                                                    <!--/a-->
                                                </div>
                                            </display:column>
                                            
                                            <!-- ini bug 0021781 -->
                                            <axis:visible c="NCERTIF2" f="axissin019"> 
                                            <display:column title="${title9}"
                                                            sortable="true"
                                                            sortProperty="NCERTIF"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    <!--a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}', '${miListaPolizas['NCERTIF']}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.SPRODUC}','${miListaPolizas.CACTIVI}');" -->
                                                        ${miListaPolizas['NCERTIF']}
                                                    <!--/a-->
                                                </div>
                                            </display:column>       
                                            </axis:visible>
                                            <!-- fin bug 0021781 -->
                                            
                                            <axis:visible c="CPOLCIA_CAB" f="axissin019">                                            
                                             <display:column title="${title6}"
                                                            sortable="true"
                                                            sortProperty="CPOLCIA"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                        ${miListaPolizas['CPOLCIA']}
                                                </div>   
                                            </display:column>    
                                            </axis:visible>
                                            
                                            <axis:visible c="TOMADOR" f="axissin019">                                            
                                             <display:column title="${title13}"
                                                            sortable="true"
                                                            sortProperty="TOMADOR"
                                                            headerClass="headwidth11 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                        ${miListaPolizas['TOMADOR']}
                                                </div>   
                                            </display:column>    
                                            </axis:visible>
                                            <axis:visible c="ASEGURADO" f="axissin019">                                            
                                             <display:column title="${title14}"
                                                            sortable="true"
                                                            sortProperty="ASEGURADO"
                                                            headerClass="headwidth11 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                        ${miListaPolizas['ASEGURADO']}
                                                </div>   
                                            </display:column>    
                                            </axis:visible>
                                            <axis:visible c="TPRODUC_CAB" f="axissin019"> 
                                            <display:column title="${title3}"
                                                            sortable="true"
                                                            sortProperty="TPRODUC"
                                                            headerClass="headwidth11 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <!--a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}', '${miListaPolizas['NCERTIF']}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.SPRODUC}','${miListaPolizas.CACTIVI}');"-->
                                                        ${miListaPolizas['TPRODUC']}
                                                    <!--/a-->
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible f="axissin019" c="TACTIVI">
                                            <display:column title="${title5}"
                                                            sortable="true"
                                                            sortProperty="TACTIVI"
                                                            headerClass="headwidth11 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                    <!--a onclick="f_seleccionar_poliza('${miListaPolizas.NPOLIZA}', '${miListaPolizas['NCERTIF']}','${miListaPolizas.NSINIES}','${miListaPolizas.SSEGURO}','${miListaPolizas.SPRODUC}','${miListaPolizas.CACTIVI}');"-->
                                                        ${miListaPolizas['TACTIVI']}
                                                    <!--/a-->
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="TAGENTE_CAB" f="axissin019"> 
                                            <display:column title="${title8}"
                                                            sortable="true"
                                                            sortProperty="TAGENTE"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                        ${miListaPolizas['TAGENTE']}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                        </display:table>
                                        <c:choose>
                                            <c:when test="${!empty  __formdata.AXISSIN_POLIZAS}">
                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:when>
                                            <c:otherwise>
                                                <script language="javascript">
                                                        </script>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                    </axis:ocultar>
                </tr>
                                
                <!-- Listado de siniestros por poliza -->
                <!-- Lista de Siniestros por póliza -->
                <tr>
                <axis:ocultar f="axissin019" c="LST_SINIESPOLIZAS" dejarHueco="false"> 
                    <td>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt f="axissin019" c="LISTADO_SINI" lit="102163"/>
                        </div>
                        <!-- Lista de siniestros -->
                        <table class="seccion">                         
                            <tr>
                                <td>
                                <div id="divSiniestros">
                                    <c:set var="title0">&nbsp;</c:set>
                                    <c:set var="title1">
                                        <axis:alt f="axissin019" c="NPOLIZA" lit="9001514"/>
                                    </c:set>
                                    <c:set var="title2">
                                        <axis:alt f="axissin019" c="NSINIES" lit="101298"/>
                                    </c:set>
                                    <c:set var="title3">
                                        <axis:alt f="axissin019" c="DESC_RIESGO" lit="102524"/>
                                    </c:set>
                                    <c:set var="title4">
                                        <axis:alt f="axissin019" c="ESTAT_SINISTRE" lit="112259"/>
                                    </c:set>
                                    <c:set var="title5">
                                        <axis:alt f="axissin019" c="DESC_PRODUCTO" lit="1000111"/>
                                    </c:set>
                                    <c:set var="title6">
                                        <axis:alt f="axissin019" c="MOD" lit="9000724"/>
                                    </c:set>
                                    <c:set var="title7">
                                        <axis:alt f="axissin019" c="CONS" lit="103101"/>
                                    </c:set>
                                     <c:set var="title8">
				        <!-- AABC IAXIS-2067 TIPO DE SINIESTRO -->
                                        <axis:alt f="axissin019" c="CSINCIA" lit="89906253"></axis:alt>
                                    </c:set>
                                    <c:set var="title9">
                                        <axis:alt f="axissin019" c="CCOMPANI" lit="9000600"></axis:alt>
                                    </c:set>
                                    <c:set var="title10">
                                        <axis:alt f="axissin019" c="NPRESIN" lit="9901400"></axis:alt>
                                    </c:set>
                                    <c:set var="title11">
                                        <axis:alt f="axissin019" c="FSINIES" lit="1000510"></axis:alt>
                                    </c:set>
                                     <c:set var="title12">
                                        <axis:alt f="axissin019" c="TSINIES" lit="1000112"></axis:alt>
                                    </c:set>
                                    <div class="seccion  displayspace">
                                        <display:table name="${__formdata.AXISSIN_LISTASINIESTROS}"
                                                       id="miListaId"
                                                       export="false"
                                                       class="dsptgtable"
                                                       pagesize="4"
                                                       defaultsort="2"
                                                       defaultorder="ascending"
                                                       requestURI="modal_axissin019.do?paginar=true"
                                                       sort="list"
                                                       cellpadding="0"
                                                       cellspacing="0">
                                            <%@ include file="../include/displaytag.jsp"%>
                                            <axis:visible c="NPOLIZA_LSSIN" f="axissin019"> 
                                            <display:column title="${title1}"
                                                            sortable="false"
                                                            sortProperty="NPOLIZA"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                    ${miListaId['NPOLIZA']}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <display:column title="${title2}"
                                                            sortable="false"
                                                            sortProperty="NSINIES"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspNumber">
                                                     ${miListaId['NSINIES']}
                                                </div>
                                            </display:column>
                                            
                                            <axis:visible c="NSINCIA" f="axissin019">
                                                 <display:column title="${title8}"
                                                                sortable="false"
                                                                sortProperty="NSINCIA"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        ${miListaId['NSINCIA']}
                                                    </div>
                                                </display:column>
                                             </axis:visible>   
                                            
                                            <axis:visible c="FSINIES" f="axissin019">
                                                <display:column title="${title11}"
                                                                sortable="false"
                                                                sortProperty="FSINIES"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        <fmt:formatDate value='${miListaId.FSINIES}' pattern='dd/MM/yyyy'/>
                                                     </div>
                                                </display:column>
                                            </axis:visible>
                                            
                                            <axis:visible c="TSINIES" f="axissin019">
                                                  <display:column title="${title12}"
                                                                sortable="false"
                                                                sortProperty="TSINIES"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                         ${miListaId['TSINIES']}
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            
                                            
                                             <axis:visible c="DESC_RIESGO" f="axissin019">
	                                            <display:column title="${title3}"
	                                                            sortable="false"
	                                                            sortProperty="TRIESGO"
	                                                            headerClass="sortable"
	                                                            media="html"
	                                                            autolink="false">
	                                                <div class="dspText">
	                                                     ${miListaId['TRIESGO']}
	                                                </div>
	                                            </display:column>
                                            </axis:visible>
                                            
                                            <display:column title="${title4}"
                                                            sortable="false"
                                                            sortProperty="TESTSIN"
                                                            headerClass="headwidth10 sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                     ${miListaId['TESTSIN']}
                                                </div>
                                            </display:column>
                                            <axis:visible c="TPRODUC" f="axissin019"> 
                                            <display:column title="${title5}"
                                                            sortable="false"
                                                            sortProperty="TPRODUC"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspText">
                                                     ${miListaId['TPRODUC']}
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            
                                             <axis:visible c="CCOMPANI" f="axissin019">
                                                 <display:column title="${title9}"
                                                                sortable="false"
                                                                sortProperty="TCOMPANI"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                        ${miListaId['TCOMPANI']}
                                                    </div>
                                                </display:column>
                                            </axis:visible>
                                            <axis:visible c="NPRESIN" f="axissin019">
                                                 <display:column title="${title10}"
                                                                sortable="true"
                                                                sortProperty="NPRESIN"
                                                                headerClass="sortable"
                                                                media="html"
                                                                autolink="false">
                                                    <div class="dspText">
                                                         ${miListaId['NPRESIN']}
                                                    </div>
                                                </display:column>
                                            </axis:visible>                                             
                                            
                                            <axis:visible c="BT_EDIT_SINI" f="axissin019">
                                            <display:column title="${title6}"
                                                            sortable="false"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcon">
                                                   <a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}',  '${miListaId['SSEGURO']}','${miListaId.SPRODUC}','${miListaId.CACTIVI}')"><img border="0" alt="<axis:alt f="axissin019" c="EDITAR" lit="100002" />" title="<axis:alt f="axissin019" c="EDITAR" lit="100002" />" src="images/lapiz.gif"/></a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                            <axis:visible c="BT_BUSCAR_SINI" f="axissin019">
                                            <display:column title="${title7}"
                                                            sortable="false"
                                                            headerClass="sortable"
                                                            media="html"
                                                            autolink="false">
                                                <div class="dspIcon">
                                                   <a href="javascript:f_seleccionar_siniestro('${miListaId.NSINIES}',  '${miListaId['SSEGURO']}','${miListaId.SPRODUC}','${miListaId.CACTIVI}')"><img border="0" alt="<axis:alt f="axissin019" c="CONSULTA" lit="109142" />" title="<axis:alt f="axissin019" c="CONSULTA" lit="109142" />" src="images/lapiz.gif"/></a>
                                                </div>
                                            </display:column>
                                            </axis:visible>
                                        </display:table>
                                         
                                        <c:choose>
                                            <c:when test="${!empty  __formdata.AXISSIN_LISTASINIESTROS}">
                                                <script language="javascript">//objUtiles.retocarDsptagtable("miListaId");</script>
                                            </c:when>
                                            <c:otherwise>
                                                <script language="javascript">
                                                //objLista.esconderListaSpans();
                                                //objLista.esconderListaLinks();     
                                                        </script>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                                </td>
                            </tr>
                        </table>
                    </td>
                </axis:ocultar>
                </tr>
            </table>
            
            <!-- Area campos -->
            
            
            
            <c:import url="../include/botonera_nt.jsp">
                <c:param name="__botones">cancelar<axis:visible c="BT_BUSCAR" f="axissin019">,buscar</axis:visible><axis:visible c="BT_BUSCARMDP" f="axissin019">,9000508</axis:visible><axis:visible c="BT_ALTA_SINI" f="axissin019">,109808</axis:visible><axis:visible c="BT_BUSCARTRAM" f="axissin019">,100797</axis:visible></c:param>
                <c:param name="f">axissin019</c:param>

            </c:import>
            
</form>
<!-- IAXIS-2169 AABC Adicion campo Fecha de apertura --> 
 <script type="text/javascript">
            <axis:ocultar f="axissin019" c="FSINIES" dejarHueco="false">
            Calendar.setup({
                inputField     :    "FSINIES",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FSINIES", 
                singleClick    :    true,
                firstDay       :    1
            });
            </axis:ocultar>
            Calendar.setup({
                inputField     :    "FALTA",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "icon_FALTA", 
                singleClick    :    true,
                firstDay       :    1
            });
        </script>
<!-- IAXIS-2169 AABC Adicion campo Fecha de apertura --> 
<c:import url="../include/mensajes.jsp"/>
</body>



