<%/* Revision:# hlJvrOVFhzLhPgdMknGpEg== # */%>
<%--
/**
*  Fichero: axissin045.jsp
*  T?tulo: Siniestros GESTION
*  Fecha: 20/02/2009
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
    <title><axis:alt f="axissin045" c="TIT1" lit="9902550"/> <axis:alt f="axissin045" c="TIT2" lit="9902550"/> </title>
    <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
    <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
    <link rel="stylesheet" href="styles/displaytag.css">
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
    
    <script type="text/javascript">

        function f_onload() { 
        var SPROFES="${__formdata.SPROFES}";
        $('#SPROFES').val(SPROFES);
        var SCONVEN="${__formdata.SCONVEN}";
        $('#SCONVEN').val(SCONVEN);
        var NLOCALI="${__formdata.NLOCALI}";
        $('#NLOCALI').val(NLOCALI);
            f_cargar_propiedades_pantalla();
             var NSINIES = "${__formdata.NSINIES}"; 
        objDom.setValorPorId("NSINIES_O",NSINIES);
            var ok = "${__formdata.OK}";        
            var mensaje = "${__formdata.MENSAJE}";
			var SGESTIO = "${__formdata.SGESTIO}";
			if (!objUtiles.estaVacio(ok) && ok==1){
                if (!objUtiles.estaVacio(mensaje)){
                    alert(mensaje);
                }
                parent.f_aceptar_axissin045(SGESTIO);
            }
            var tdescri = "${__formdata.TDESCRI}";
            if (!objUtiles.estaVacio(tdescri) &&
                (objUtiles.estaVacio(ok) || ok!=1)){
                $("#TDESCRI").val(tdescri);
                f_but_buscar();
            }
            f_onloadCombos();
            if(!objUtiles.estaVacio($("#SCONVEN").val())){
                $("#TDESCRI").removeAttr("disabled");
                $("#TDESCRI").removeClass("campodisabled");
            }
        }
        
        function f_abrir_modal(cual, noXButton, optionalQueryString) {
            if (objUtiles.estaVacio(optionalQueryString))                
                optionalQueryString = "";
            
            if (noXButton) 
                objDom.setVisibilidadPorId("but_cerrar_modal_" + cual, "hidden");    

            objUtiles.abrirModal(cual, "src", "modal_" + cual + ".do?operation=init" + optionalQueryString);   
        }
        
        function f_cerrar_modal(pantalla){
                objUtiles.cerrarModal(pantalla);
        }
        
        function f_aceptar_modal(pantalla, param){
            f_cerrar_modal(pantalla);
            f_guardar_tabla_servicios();
            objUtiles.ejecutarFormulario("modal_axissin045.do?"+param, "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
    
        function f_guardar_tabla_servicios(){
            var servicios='';
            var fecha;
            var sincargo;
            $('#T_SELECCIONATS tr').each(function() {
            filas = $(this);
            if(i>0){
                var j=0;
                filas.find("td").each(function(){
                    columnas = $(this);
                    if (filas.find("td").length>1){
                        if (j==0){
                        servicios += columnas.find("div").html().replace(/\s/g,''); //SSERVIC
                    }
                    if (j==1){
                        servicios += "#"+columnas.find("div").html().replace(/\s/g,'');//TSERVIC    
                    }
                    if (j==2){
                        servicios += "#"+columnas.find("div").html().replace(/\s/g,'');//FCAMBIO
                    }
                    if (j==3){
                        servicios += "#"+columnas.find("div input").val();//NCANTID
                    }
                    if (j==4){
                        servicios += "#"+columnas.find("div").html().replace(/\s/g,'');//ITOTAL
                    }
                    if (j==5){
                        servicios += "#"+columnas.find("div").html().replace(/\s/g,'');//NVALSER
                    }
                    if (j==6){
                        if (columnas.find("div input").attr("checked") == "checked"){//CNOCARG
                            servicios += "#"+0+",";
                        }else{
                            servicios += "#"+1+",";
                        }
                    }
                    j++;
                    }
                });
            }
            i++;
            });
            $("#SERVICIOS_TABLA").val(servicios);
        }
        
        function f_onloadCombos(){
            if (document.getElementById('NLOCALI')!=null){
                f_selOpcio(document.getElementById('NLOCALI'),2);
            }
        }
        
        function f_selOpcio(combo, num){
            if (combo.length == num){
                combo.value = combo.options[num-1].value;
            }
        }
        
        function f_but_aceptar(){
            if (objValidador.validaEntrada()&&$("#pantallaDesactivada").val()!=1) {
                var servicios='';
                var fecha;
                var sincargo;
               
              
                	$('#T_SELECCIONATS tr').each(function() {
                        filas = $(this);
                        if(i>0){
                            var j=0;
                            filas.find("td").each(function(){
                                columnas = $(this);
                                if (j==0){
                                	if(columnas.find("div").html()!=null){
                                		servicios += columnas.find("div").html().replace(/\s/g,'');
                                    }   
                                }
                                if (j==2){
                                    fecha = columnas.find("div").html().replace(/\s/g,'');
                                }
                                if (j==3){
                                    servicios += "#"+columnas.find("div input").val();
                                }
                                if (j==4){
                                    importe = columnas.find("div").html().replace(/\s/g,'');
                                    importe = objNumero.quitarSeparadorMiles(importe);
                                }
                                if (j==5){
                                    imp_total = columnas.find("div").html().replace(/\s/g,'');
                                    imp_total = objNumero.quitarSeparadorMiles(imp_total);
                                }
                                if (j==6){
                                    if (columnas.find("div input").attr("checked") == "checked"){
                                        sincargo=0
                                    }else{
                                        sincargo=1;
                                    }
                                    servicios += "#"+sincargo;
                                    servicios += "#"+fecha;
                                    servicios += "#"+importe;
                                    servicios += "#"+imp_total+";";
                                }
                                j++;
                            });
                        }
                        i++;
                        });
                	
                	$("#SERVICIOS").val(servicios);
                    
                    if ($("#MODO").val()=="modificar"){
                        $("#NLOCALI_MOD").val($("#NLOCALI").val());
                        $("#CTIPGES_MOD").val($("#CTIPGES").val());
                        $("#CTIPPRO_MOD").val($("#CTIPPRO").val());
                        $("#CSUBPRO_MOD").val($("#CSUBPRO").val());
                        $("#SPROFES_MOD").val($("#SPROFES").val());
                        $("#SPERSED_MOD").val($("#SPERSED").val());
                        $("#SCONVEN_MOD").val($("#SCONVEN").val());
                        $("#CGARANT_MOD").val($("#CGARANT").val());
                        $("#CESTGES_MOD").val($("#CESTGES").val());
                        $("#CSUBGES_MOD").val($("#CSUBGES").val());
                    }
                    
                    if ((document.getElementById('SERVICIOS').value != null)&&(document.getElementById('SERVICIOS').value.length > 0)){
                        objUtiles.ejecutarFormulario("modal_axissin045.do", "aceptar", document.miForm, "_self", objJsMessages.jslit_cargando);        
                    }else{
                    	//validar literal al mostrar
                        var missatge = "<axis:alt f="axissin045" c="MSG_SERVICIOS" lit="9902621"/>";
                        objAppMensajes.pintarMensajePantalla(missatge, "error"); 
                    }     
            }
        }
        
        
        function f_but_cancelar(){
            if(!objUtiles.estaVacio($("#SCONVEN").val())){
                var qs="operation=ajax_cancela_pantalla";
                    qs=qs+"&SCONVEN="+$("#SCONVEN").val();
                    qs=qs+"&SPROFES="+$("#SPROFES").val();
                    qs=qs+"&NSINIES="+$("#NSINIES").val();
                    qs=qs+"&NTRAMIT="+$("#NTRAMIT").val();
                objAjax.invokeAsyncCGI("modal_axissin045.do", f_callbackajaxCancelaPantalla, qs, this);
            }else{
                parent.f_cerrar_modal("axissin045");
            }
        }
        
        function f_callbackajaxCancelaPantalla(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                parent.f_cerrar_modal("axissin045");
            }
        }
        
        function f_recargar(){
            if(!objUtiles.estaVacio($("#SCONVEN").val())){
                $("#TDESCRI").removeAttr("disabled");
                $("#TDESCRI").removeClass("campodisabled");
            }
            objUtiles.ejecutarFormulario("modal_axissin045.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_recargar_tipo_gestion(){
            var qs="operation=gestionPermitida";
            qs=qs+"&NSINIES="+objDom.getValorPorId("NSINIES");
            qs=qs+"&NTRAMIT="+objDom.getValorPorId("NTRAMIT");
            qs=qs+"&CTIPGES="+objDom.getValorPorId("CTIPGES");
            objAjax.invokeAsyncCGI_JSON("modal_axissin045.do?"+qs, f_callbackajaxGestPermitida, objJsMessages.jslit_cargando);
        }
        
        function f_callbackajaxGestPermitida(p){
            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", "", "none");
                if(!objAppMensajes.existenErroresEnAplicacion_JSON(p, true, "resultado")){
                    var mensajes = p.JSON2.resultado.PTLITERA;
                    if (!objUtiles.estaVacio(p.JSON2.resultado.PTLITERA)){
                       alert(mensajes);
                       //desactivaPantalla();
                       $("#CTIPGES").val("");
                    }else{
                        $("#pantallaDesactivada").val(0);
                        $("#comprovarFecha").val(1);
                        objUtiles.ejecutarFormulario("modal_axissin045.do", "form", document.miForm, "_self", objJsMessages.jslit_cargando)
                    };
                }  else{alert ("hay errores");}
        }
        
        function desactivaPantalla(){
            $("#pantallaDesactivada").val(1);
            $("#NLOCALI").attr('disabled', 'disabled');
            $("#NLOCALI").addClass("campodisabled");
            $("#CTIPGES").attr('disabled', 'disabled');
            $("#CTIPGES").addClass("campodisabled");
            $("#CTIPPRO").attr('disabled', 'disabled');
            $("#CTIPPRO").addClass("campodisabled");
            $("#CSUBPRO").attr('disabled', 'disabled');
            $("#CSUBPRO").addClass("campodisabled");
            $("#SPROFES").attr('disabled', 'disabled');
            $("#SPROFES").addClass("campodisabled");
            $("#SPERSED").attr('disabled', 'disabled');
            $("#SPERSED").addClass("campodisabled");
            $("#SCONVEN").attr('disabled', 'disabled');
            $("#SCONVEN").addClass("campodisabled");
            $("#CGARANT").attr('disabled', 'disabled');
            $("#CGARANT").addClass("campodisabled");
            $("#CESTGES").attr('disabled', 'disabled');
            $("#CESTGES").addClass("campodisabled");
            $("#CSUBGES").attr('disabled', 'disabled');
            $("#CSUBGES").addClass("campodisabled");
            $("#TCOMENT").attr('disabled', 'disabled');
            $("#TCOMENT").addClass("campodisabled");
            $("#SSERVIC").attr('disabled', 'disabled');
            $("#SSERVIC").addClass("campodisabled");
            $("#TDESCRI").attr('disabled', 'disabled');
            $("#TDESCRI").addClass("campodisabled");
            $("#but_buscar").attr('disabled', 'disabled');
        }
        
        function f_but_nuevo_serv(){
            if(!objUtiles.estaVacio($("#SCONVEN").val())&&
               !objUtiles.estaVacio($("#SPROFES").val())){
                f_abrir_modal('axisprf105',null,'&pSCONVEN='+$("#SCONVEN").val()+
                              '&pSPROFES='+$("#SPROFES").val()+'&MODO=alta');
            }   
        }
        
        function f_but_buscar(){
            if (objValidador.validaEntrada()) {
                var qs="operation=cargar_servicios";
                qs=qs+"&SSERVIC="+objDom.getValorPorId("SSERVIC");
                qs=qs+"&SCONVEN="+objDom.getValorPorId("SCONVEN");
                qs=qs+"&TDESCRI="+objDom.getValorPorId("TDESCRI");
                /*objAjax.invokeAsyncCGI("modal_axissin045.do", f_callbackajaxBuscar, qs, this);*/
                $("#formula_seccion").attr("src", "modal_axissin045.do?"+qs);
                
                /*
                objUtiles.ejecutarFormulario("modal_axissin045.do", "cargar_servicios", document.formula_seccion,
                                             "_self", objJsMessages.jslit_cargando);        */
            }else{
                $("#formula_seccion").attr("src", "modal_axissin045.do?operation=cargar_servicios");
            }
        }
        function f_callbackajaxBuscar(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
                if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                    var tbody = objLista.obtenerBodyLista("T_BUSQUEDA");
                    var tr = objLista.obtenerFilasBodyLista("T_BUSQUEDA", tbody);                  
                    objLista.borrarFilasDeLista ("T_BUSQUEDA", "4", '<axis:alt f="axissin045" c="NOREG" lit="1000254"/>');
                    var elementos = doc.getElementsByTagName("element");
                    if (elementos.length > 0){
                       objLista.borrarFilaVacia(tbody, tr);
                       for (i = 0; i < elementos.length; i++) {
                            var ttd=0;
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            var newtd = new Array(4);
                            var STARIFA = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("STARIFA"), 0, 0);
                            var NLINEA = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("NLINEA"), 0, 0);
                            var SSERVIC = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("SSERVIC"), 0, 0);
                            var TDESCRI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TDESCRI"), 0, 0);
                            var IPRECIO = parseFloat(objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("IPRECIO"), 0, 0));
                            var CCODMON = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CCODMON"), 0, 0);
                            var CTIPCAL = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CTIPCAL"), 0, 0);
                            var NVALMIN = parseFloat(objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("IMINIMO"), 0, 0));
                            newtd[ttd] = objLista.addRadioButtonEnLista("radiobusc", SSERVIC,"javascript:f_addServei(" + STARIFA + "," + NLINEA + "," + SSERVIC + ",'" + TDESCRI+ "'," + IPRECIO+  ",'" + CCODMON + "'," + CTIPCAL + "," + NVALMIN +")"); 
                            ttd++;
                            newtd[ttd] = objLista.addTextoEnLista(SSERVIC);ttd++;
                            newtd[ttd] = objLista.addTextoEnLista(TDESCRI);ttd++;
                            newtd[ttd] = objLista.addNumeroEnLista(IPRECIO);ttd++;
                            objLista.addNuevaFila(newtd, newtr, tbody); 
                        }
                    }
                }
        }
        
        function f_addServei(STARIFA, NLINEA, SSERVIC, TDESCRI,IPRECIO, CCODMON, CTIPCAL, NVALMIN){
            if (document.getElementById("SSERVIC_"+SSERVIC)== null){
                $("#SSERVIC_aux").val(SSERVIC);
                $("#TDESCRI_aux").val(TDESCRI);
                $("#CCODMON_aux").val(CCODMON);
                $("#CTIPCAL_aux").val(CTIPCAL);
                $("#NVALMIN_aux").val(NVALMIN);
                if (objValidador.validaEntrada()) {
                    //var qs="operation=ajax_calc_importe";
                    var qs="operation=ajax_get_servicios";
                    qs=qs+"&STARIFA="+STARIFA;
                    qs=qs+"&NLINEA="+NLINEA;
                    qs=qs+"&SSERVIC="+SSERVIC;
                    qs=qs+"&TDESCRI="+TDESCRI;
                    qs=qs+"&IPRECIO="+IPRECIO;
                    qs=qs+"&CCODMON="+CCODMON;
                    qs=qs+"&CTIPCAL="+CTIPCAL;
                    qs=qs+"&NVALMIN="+NVALMIN;
                    qs=qs+"&SCONVEN="+$("#SCONVEN").val();
                    //objAjax.invokeAsyncCGI("modal_axissin045.do", f_callbackajaxCalcPrecio, qs, this);
                    objAjax.invokeAsyncCGI("modal_axissin045.do", f_callbackajaxGetServicios, qs, this);
                }
            }
        }
        
        function f_callbackajaxCalcPrecio(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("element");
                
                if (elementos.length > 0){
                    var SSERVIC = $("#SSERVIC_aux").val();
                    var TDESCRI = $("#TDESCRI_aux").val();
                    var ele = doc.getElementsByTagName("PIPRECIO");
                    var e;
                    var IPRECIO = ele[0].textContent;
                    if (isNaN(IPRECIO)){
                        IPRECIO = ele.context.text;
                    }
                    var CCODMON = $("#CCODMON_aux").val();
                    var CTIPCAL = $("#CTIPCAL_aux").val();
                    var NVALMIN = $("#NVALMIN_aux").val();

                    objDom.setValorPorId("SERVICIOS", objDom.getValorPorId("SERVICIOS")+SSERVIC+",");
                    var tbody = objLista.obtenerBodyLista("T_SELECCIONATS");
                    var tr = objLista.obtenerFilasBodyLista("T_SELECCIONATS", tbody);
                    objLista.borrarFilaVacia(tbody, tr);
                    var ttd=0;
                    var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                    var newtr = objLista.crearNuevaFila(rowstyle);
                    newtr.id = "SSERVIC_"+SSERVIC;
                    var newtd = new Array(4);
                    newtd[ttd] = objLista.addTextoEnLista(SSERVIC);ttd++;
                    newtd[ttd] = objLista.addTextoEnLista(TDESCRI);ttd++;
                    newtd[ttd] = objLista.addTextoEnLista(f_hoy());ttd++;
                    newtd[ttd] = f_addInputEnLista("text","NCANTID"+SSERVIC,1,"f_actualizaImporte("+IPRECIO+", "+SSERVIC+ ",this)","f_keepValue(this)");ttd++;
                    newtd[ttd] = objLista.addNumeroEnLista(objNumero.formateaNumeroMoneda(IPRECIO ,null));ttd++;
                    if (parseFloat(IPRECIO) < parseFloat(NVALMIN)){
                        newtd[ttd] = f_addDivEnLista("ITOTAL"+SSERVIC, objNumero.formateaNumeroMoneda(NVALMIN ,null));ttd++;
                    }else{
                        newtd[ttd] = f_addDivEnLista("ITOTAL"+SSERVIC, objNumero.formateaNumeroMoneda(IPRECIO ,null));ttd++;
                    }
                    newtd[ttd] = f_addInputEnLista("checkbox","SINCARGO"+SSERVIC,0,"f_actualizaImporte("+IPRECIO+", "+SSERVIC+")");ttd++;
                    //newtd[ttd] = objLista.addCheckBoxEnLista("SINCARGO"+SSERVIC, 0, "f_actualizaImporte("+IPRECIO+", "+SSERVIC+")", null);
                    newtd[ttd] = objLista.addImagenEnLista("javascript:f_delete_Serveis('" + SSERVIC + "')",
                                 "0", "<axis:alt f="axissin045" c="BORRAR" lit="1000127"/>", "<axis:alt f='axissin047' c='DELETE' lit='1000127'/>", "images/delete.gif");
                    objLista.addNuevaFila(newtd, newtr, tbody);
                }
            }
        }
        
        function f_callbackajaxGetServicios(ajaxResponseText){
            var doc=objAjax.domParse(ajaxResponseText);
            if(!objAppMensajes.existenErroresEnAplicacion(doc)){
                var elementos = doc.getElementsByTagName("element");
                
                if (elementos.length > 0){
                    for (i = 0; i < elementos.length; i++) {
                        var SSERVIC = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("SSERVIC"), 0, 0);
                        var TDESCRI = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TDESCRI"), 0, 0);
                        var IPRECIO = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("PRECIO_UNI"), 0, 0);
                        var NVALMIN = objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("IMINIMO"), 0, 0);
                                               
                        if (document.getElementById("SSERVIC_"+SSERVIC)== null){
                            objDom.setValorPorId("SERVICIOS", objDom.getValorPorId("SERVICIOS")+SSERVIC+",");
                            var tbody = objLista.obtenerBodyLista("T_SELECCIONATS");
                            var tr = objLista.obtenerFilasBodyLista("T_SELECCIONATS", tbody);
                            objLista.borrarFilaVacia(tbody, tr);
                            var ttd=0;
                            var rowstyle = objLista.addEstiloEnFilaDeLista(tr, "gridEven", "gridNotEven");
                            var newtr = objLista.crearNuevaFila(rowstyle);
                            newtr.id = "SSERVIC_"+SSERVIC;
                            var newtd = new Array(4);
                            newtd[ttd] = objLista.addTextoEnLista(SSERVIC);ttd++;
                            newtd[ttd] = objLista.addTextoEnLista(TDESCRI);ttd++;
                            newtd[ttd] = objLista.addTextoEnLista(f_hoy());ttd++;
                            newtd[ttd] = f_addInputEnLista("text","NCANTID"+SSERVIC,1,"f_actualizaImporte("+IPRECIO+", "+SSERVIC+ ",this)","f_keepValue(this)");ttd++;
                            newtd[ttd] = objLista.addNumeroEnLista(objNumero.formateaNumeroMoneda(IPRECIO ,null));ttd++;
                            if (parseFloat(IPRECIO) < parseFloat(NVALMIN)){
                                newtd[ttd] = f_addDivEnLista("ITOTAL"+SSERVIC, objNumero.formateaNumeroMoneda(NVALMIN ,null));ttd++;
                            }else{
                                newtd[ttd] = f_addDivEnLista("ITOTAL"+SSERVIC, objNumero.formateaNumeroMoneda(IPRECIO ,null));ttd++;
                            }
                            newtd[ttd] = f_addInputEnLista("checkbox","SINCARGO"+SSERVIC,0,"f_actualizaImporte("+IPRECIO+", "+SSERVIC+")");ttd++;
                            newtd[ttd] = objLista.addImagenEnLista("javascript:f_delete_Serveis('" + SSERVIC + "')", "0", "<axis:alt f='axissin045' c='BORRAR' lit='1000127'/>", "<axis:alt f='axissin047' c='DELETE' lit='1000127'/>", "images/delete.gif");
                            objLista.addNuevaFila(newtd, newtr, tbody);
                        }
                    }
                }
            }
        }
        
        function f_hoy(){
            var f = new Date();   
            var month=new Array();
            month[0]="01";
            month[1]="02";
            month[2]="03";
            month[3]="04";
            month[4]="05";
            month[5]="06";
            month[6]="07";
            month[7]="08";
            month[8]="09";
            month[9]="10";
            month[10]="11";
            month[11]="12";
            var hoy = f.getDate() + "/" + month[f.getMonth()] + "/" + f.getFullYear();
            return hoy;
        }
        function f_addInputEnLista(type, idInput, val, accion, accion2){
            var newtd = document.createElement("td");
            newtd.style.width = "auto";
            
            var newdiv= document.createElement("div");
            newdiv.className = "dspIcons";
            var newinputch;
            
            if (document.all) {
                //Para ie que no deja generar el name via runtime
                newinputch = document.createElement('<input name="'+idInput+'" style="text-align:center"/>');
                newinputch.setAttribute("type" , type);
            } 
            else {
                newinputch = document.createElement("input");
                //newinputch.setAttribute('name', idInput);
                newinputch.name=idInput;
                //newinputch.setAttribute=("style","text-align: center;");
                newinputch.style="text-align: center;";
                newinputch.type=type;
            }
            if(type == "checkbox"){
                    newinputch.onclick = new Function(accion);
            }else{
                    newinputch.onchange = new Function(accion);
                    newinputch.onfocus = new Function(accion2);
            }
            newinputch.value = val;
            newinputch.id = idInput;
            newinputch.className = "campo campotexto";           
            
            newdiv.appendChild(newinputch);
            newtd.appendChild(newdiv);
            
            return newtd;
            
            /*var newtd = $(document.createElement('td'));
            if (type == "checkbox"){
                newtd.attr("style", "width:12%");
            }else if (type == "text"){
                newtd.attr("style", "width:9%");
            }
            
            newdiv= $(document.createElement('div'));
            newdiv.addClass("dspIcons");
            var newinputch = $(document.createElement('input'));
                newinputch.attr("type", type);
                if (type == "checkbox"){
                    newinputch.attr("onclick", accion);
                }else if (type == "text"){
                    newinputch.attr("onblur", accion);      
                }
                newinputch.attr("name", idInput);
                newinputch.attr("id", idInput);
                //newinputch.attr("onchange", accion);
                //newinputch.addClass("campo campotexto");
                newinputch.attr("style", "text-align:center");
                newinputch.attr("value", val);
            
            newdiv.append(newinputch);
            newtd.append(newdiv);
            return newtd[0];*/
        }
        
        function f_addDivEnLista(id, val){
            var newtd = $(document.createElement('td'));
            newtd.attr("style", "width:12%");
            
            newdiv= $(document.createElement('div'));
            newdiv.addClass("dspNumber");
            newdiv.attr("id",id);
            newdiv.text(val);
            newtd.append(newdiv);
            return newtd[0];
        }
        function f_delete_Serveis(SSERVIC){
            /***Borrar las que ya existian al entrar en modo modificacion ***/
            var codigo = 'SSERVIC_'+SSERVIC;
            var i = 0;
            $('#T_SELECCIONATS tr').each(function() {
                /*if (($('#T_SELECCIONATS tr td div').attr("id") == codigo) && (i>0)){
                    //alert($(this).html());
                    $(this).remove();
                }*/
				if (($(this).find('td').find('div').attr("id") == codigo)){
                    //alert($(this).html());
                    $(this).remove();
                }
                i++;
            });
            
            if($('#T_SELECCIONATS tr').length== 1){
                objLista.borrarFilasDeLista ("T_SELECCIONATS", "8", '<axis:alt f="axissin045" c="NOSELECT" lit="9900849"/>');
            }
            /***Fin borrar las que ya existian al entrar en modo modificacion ***/
            
            /***Borrar las añadidas ahora ***/
            var tabledeleted = document.getElementById("T_SELECCIONATS");
            var tbodydeleted = tabledeleted.getElementsByTagName("tbody") 
            var trdeleted = tbodydeleted[0].getElementsByTagName("tr");            
            var trComponent4Delete = new Array();
            
            for (var i=0;i < trdeleted.length; i++) {
               try{
                 if (trdeleted[i].id== 'SSERVIC_'+SSERVIC){
                    tbodydeleted[0].removeChild(trdeleted[i]);
                 }
                
                }catch(e){}
            }
            if (trdeleted.length==0){
                objLista.borrarFilasDeLista ("T_SELECCIONATS", "8", '<axis:alt f="axissin045" c="NOSELECT" lit="9900849"/>');
            }
            /***Fin Borrar las añadidas ahora ***/
            
            var valor = objDom.getValorPorId("SERVICIOS");
            valor = valor.replace(SSERVIC+",", "");
            objDom.setValorPorId("SERVICIOS", valor);
        }
        
        function f_keepValue(elem){
        	elem.setAttribute('oldValue',elem.value);
        }
                      
        function f_actualizaImporte(iprecio, id, elem){
        	
        	  var TOTAL;
              var idSincargo = "#SINCARGO"+id;
              var idCantid = "#NCANTID"+id;
              var idTotal = "#ITOTAL"+id;              
              var oldValue;
        	  if(!objUtiles.estaVacio(elem)) oldValue = elem.getAttribute('oldValue');             
                                        
              if (objNumero.validaNumeroNeg($(idCantid).val(), false, false)){	            	  
            	  TOTAL = $(idCantid).val() * iprecio;	              
              }else{	            	  
            	  $(idCantid).val(oldValue);
            	  TOTAL  = oldValue * iprecio;
              }
              
              if ($(idSincargo).is(':checked')) TOTAL = 0;
                          
              $(idTotal).html(objNumero.formateaNumeroMoneda(TOTAL+"" ,null));
        }
        
        function f_but_nuevo_conv(){
            if(!objUtiles.estaVacio($("#NSINIES").val())&&
               !objUtiles.estaVacio($("#NTRAMIT").val())&&
               !objUtiles.estaVacio($("#NLOCALI").val())&&
               !objUtiles.estaVacio($("#CTIPPRO").val())&&
               !objUtiles.estaVacio($("#CSUBPRO").val())){
                f_abrir_modal('axissin058',null,'&NSINIES='+$("#NSINIES").val()+
                                                '&NTRAMIT='+$("#NTRAMIT").val()+
                                                '&NLOCALI='+$("#NLOCALI").val()+
                                                '&CTIPPRO='+$("#CTIPPRO").val()+
                                                '&CSUBPRO='+$("#CSUBPRO").val()+'&MODO=alta');
            }  
        }
    </script>
</head>
<body onload="javascript:f_onload()" style="height: 100%">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="modal_axissin045.do" method="POST">
    <input type="hidden" id="operation" name="operation" value="form"/>
    <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
    <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
    <input type="hidden" id="SGESTIO" name="SGESTIO" value="${__formdata.SGESTIO}"/>
    <input type="hidden" id="SPRODUC" name="SPRODUC" value="${__formdata.SPRODUC}"/>
    <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
    <input type="hidden" id="comprovarFecha" name="comprovarFecha" value="${__formdata.CFECHA}"/>
    <input type="hidden" id="NLOCALI_MOD" name="NLOCALI_MOD" value=""/>
    <input type="hidden" id="CTIPGES_MOD" name="CTIPGES_MOD" value=""/>
    <input type="hidden" id="CTIPPRO_MOD" name="CTIPPRO_MOD" value=""/>
    <input type="hidden" id="CSUBPRO_MOD" name="CSUBPRO_MOD" value=""/>
    <input type="hidden" id="SPROFES_MOD" name="SPROFES_MOD" value=""/>
    <input type="hidden" id="SPERSED_MOD" name="SPERSED_MOD" value=""/>
    <input type="hidden" id="SCONVEN_MOD" name="SCONVEN_MOD" value=""/>
    <input type="hidden" id="CGARANT_MOD" name="CGARANT_MOD" value=""/>
    <input type="hidden" id="CESTGES_MOD" name="CESTGES_MOD" value=""/>
    <input type="hidden" id="CSUBGES_MOD" name="CSUBGES_MOD" value=""/>
    <input type="hidden" id="SSERVIC_aux" name="SSERVIC_aux" value=""/>
    <input type="hidden" id="TDESCRI_aux" name="TDESCRI_aux" value=""/>
    <input type="hidden" id="CCODMON_aux" name="CCODMON_aux" value=""/>
    <input type="hidden" id="CTIPCAL_aux" name="CTIPCAL_aux" value=""/>
    <input type="hidden" id="NVALMIN_aux" name="NVALMIN_aux" value=""/>
    <input type="hidden" id="SERVICIOS" name="SERVICIOS" value=""/>
    <input type="hidden" id="SERVICIOS_TABLA" name="SERVICIOS_TABLA" value=""/>
    <input type="hidden" id="subpantalla" name="subpantalla" value="tramitaciones"/>
    <input type="hidden" id="seccion" name="seccion" value="tramitaciones_gestiones"/>
    <input type="hidden" id="indexTramitacio" name="indexTramitacio" value="${__formdata.indexTramitacio}"/>    
    <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
    <input type="hidden" id="pantallaDesactivada" name="pantallaDesactivada" value="${__formdata.pantallaDesactivada}"/>
  
    <c:set var="linea_trami">
        ${__formdata.indexTramitacio}
    </c:set>
    <c:import url="../include/titulo_nt.jsp">
        <c:param name="titulo"><axis:alt f="axissin045" c="TIT_PANTALLA" lit="9902629"/></c:param>
        <c:param name="formulario"><axis:alt f="axissin045" c="TIT_PANTALLA" lit="9902629"/></c:param>
        <c:param name="form">axissin045</c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">axisprf105|<axis:alt f="axissin045" c="MODAL_AXISPRF105" lit="9904855" /></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
                <c:param name="nid_y_titulo">axissin058|<axis:alt f="axissin045" c="MODAL_AXISSIN058" lit="9905759" /></c:param>
        </c:import>
    <div class="separador">&nbsp;</div>
    <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
        <tr>
            <td>
            <table class="seccion">
            <tr>
                     <axis:ocultar f="axissin045" c="NSINIES" dejarHueco="false"> 
                                    <td class="titulocaja">
                                        <b><axis:alt f="axissin045" c="NSINIES" lit="101298"/></b>
                                    </td>
                     </axis:ocultar>
                    </tr>
                    <tr>
                     <axis:ocultar f="axissin045" c="NSINIES" dejarHueco="false"> 
                             <td class="campocaja">
                              <input type="text" name="NSINIES_O" id="NSINIES_O"  class="campodisabled campo campotexto" style="width:200px"
                                <axis:atr f="axissin045" c="NSINIES" a="modificable=false"/> />
                                
                            </td>
                        </axis:ocultar>
                    </tr>
            </table>
            </td>
            </tr>
            <tr>
            <td>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    
                    
                    <tr>
                    
                       <axis:ocultar f="axissin045" c="NLOCALI" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="NLOCALI" lit="9002272"/></b>
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin045" c="CTIPGES" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="CTIPGES" lit="9902564"/></b>
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin045" c="CTIPPRO" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="CTIPPRO" lit="9902569"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin045" c="CSUBPRO" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="CSUBPRO" lit="9902570"/></b>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                     
                        <axis:ocultar f="axissin045" c="NLOCALI" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="NLOCALI" id="NLOCALI" title="<axis:alt f="axissin045" c="NLOCALI" lit="9002272"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="NLOCALI" a="modificable=false&isInputText=false&obligatorio=true"/> 
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="NLOCALI" a="isInputText=false&obligatorio=true"/> 
                                    </c:if>>
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstlocalizacion}">
                                        <option value = "${listados.NLOCALI}"
                                        >
                                        ${listados.TLOCALI}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin045" c="CTIPGES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CTIPGES" id="CTIPGES" title="<axis:alt f="axissin045" c="CTIPGES" lit="9902564"/>"  size="1" onchange="f_recargar_tipo_gestion();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="CTIPGES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="CTIPGES" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if>>
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lsttipgestion}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CTIPGES)&& listados.CATRIBU == __formdata.CTIPGES}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin045" c="CTIPPRO" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CTIPPRO" id="CTIPPRO" title="<axis:alt f="axissin045" c="CTIPPRO" lit="9902569"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="CTIPPRO" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="CTIPPRO" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if>>
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstprof}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CTIPPRO)&& listados.CATRIBU == __formdata.CTIPPRO}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin045" c="CSUBPRO" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CSUBPRO" id="CSUBPRO" title="<axis:alt f="axissin045" c="CSUBPRO" lit="9902570"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="CSUBPRO" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="CSUBPRO" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if>>
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstsubprof}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CSUBPRO)&& listados.CATRIBU == __formdata.CSUBPRO}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                       <axis:ocultar f="axissin045" c="SPROFES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="SPROFES" lit="9902565"/></b>
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin045" c="SPERSED" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="SPERSED" lit="9902589"/></b>
                            </td>         
                        </axis:ocultar>    
                        <axis:ocultar f="axissin045" c="SCONVEN" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="SCONVEN" lit="9902590"/></b>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin045" c="CGARANT" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="CGARANT" lit="110994"/></b>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin045" c="SPROFES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="SPROFES" id="SPROFES" title="<axis:alt f="axissin045" c="SPROFES" lit="9902565"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    >
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstprofesinal}">
                                        <option value = "${listados.SPROFES}"
                                        <c:if test="${(!empty __formdata.SPROFES)&& listados.SPROFES == __formdata.SPROFES}"> selected </c:if>
                                        <c:if test="${(empty __formdata.SPROFES)&& listados.SPROFES == __formdata.pSPROFES}"> selected </c:if>>
                                        ${listados.NOMBRE}</option>
                                    </c:forEach>
                            </td>
                        </axis:ocultar>    
                        <axis:ocultar f="axissin045" c="SPERSED" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="SPERSED" id="SPERSED" title="<axis:alt f="axissin045" c="SPERSED" lit="9902589"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="SPERSED" a="modificable=true&isInputText=false&obligatorio=false"/>
                                    </c:if>
                                    >
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstsedes}">
                                        <option value = "${listados.SPERSON}"
                                        <c:if test="${(!empty __formdata.SPERSED)&& listados.SPERSON == __formdata.SPERSED}"> selected </c:if>>
                                        ${listados.TNOMBRE}</option>
                                    </c:forEach>
                                </select>
                            </td>                        
                        </axis:ocultar>    
                        <axis:ocultar f="axissin045" c="SCONVEN" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="SCONVEN" id="SCONVEN" title="<axis:alt f="axissin045" c="SCONVEN" lit="9902590"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="SCONVEN" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if> >
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lsttarifas}">
                                        <option value = "${listados.SCONVEN}"
                                        >
                                        ${listados.TDESCRI}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin045" c="CGARANT" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CGARANT" id="CGARANT" title="<axis:alt f="axissin045" c="CGARANT" lit="110994"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="CGARANT" a="modificable=true&isInputText=false&obligatorio=false"/>
                                    </c:if>
                                     >
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstgarantias}">
                                        <option value = "${listados.CGARANT}"
                                        <c:if test="${(!empty __formdata.CGARANT)&& listados.CGARANT == __formdata.CGARANT}"> selected </c:if>>
                                        ${listados.TGARANT}</option>
                                    </c:forEach>
                            </td>
                        </axis:ocultar>  
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin045" c="CESTGES" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="CESTGES" lit="100587"/></b>
                            </td>
                       </axis:ocultar>    
                       <axis:ocultar f="axissin045" c="CSUBGES" dejarHueco="false"> 
                           <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="CSUBGES" lit="9902593"/></b>
                            </td>         
                        </axis:ocultar>
                        <axis:ocultar f="axissin045" c="FGESTIO" dejarHueco="false"> 
                           <td class="titulocaja" id="tit_FGESTIO" 
                         <c:if test="${__formdata.CFECHA!=1}">
                            style="display:none">
                         </c:if>
                         <c:if test="${__formdata.CFECHA==1}">
                            >
                         </c:if>
                                <b><axis:alt f="axissin045" c="FGESTIO" lit="9905757"/></b>
                            </td>         
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin045" c="CESTGES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CESTGES" id="CESTGES" title="<axis:alt f="axissin045" c="CESTGES" lit="100587"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="CESTGES" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                     >
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstestados}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CESTGES)&& listados.CATRIBU == __formdata.CESTGES}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>
                        <axis:ocultar f="axissin045" c="CSUBGES" dejarHueco="false"> 
                            <td class="campocaja">
                                <select name ="CSUBGES" id="CSUBGES" title="<axis:alt f="axissin045" c="CSUBGES" lit="9902593"/>"  size="1" onchange="f_recargar();"
                                    class="campowidthselect campo campotexto_ob"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="SPROFES" a="modificable=false&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="CSUBGES" a="modificable=true&isInputText=false&obligatorio=true"/>
                                    </c:if>
                                    >
                                    <option value = ""> - <axis:alt f="axissin045" c="SELECCIONES" lit="108341"/> - </option>
                                    <c:forEach var="listados" items="${__formdata.lstsubestados}">
                                        <option value = "${listados.CATRIBU}"
                                        <c:if test="${(!empty __formdata.CSUBGES)&& listados.CATRIBU == __formdata.CSUBGES}"> selected </c:if>>
                                        ${listados.TATRIBU}</option>
                                    </c:forEach>
                                </select>
                            </td>
                        </axis:ocultar>  
                        <axis:ocultar f="axissin045" c="FGESTIO" dejarHueco="false">                 
                         <td class="campocaja" id="td_FGESTIO"
                         <c:if test="${__formdata.CFECHA!=1}"> style="display:none"</c:if>>
                             <input type="text" class="campowidthinput campo campotexto_ob" size="10" 
                                    value="<fmt:formatDate pattern='dd/MM/yyyy' value='${__formdata.FGESTIO}'/>" name="FGESTIO" id="FGESTIO"  
                                     <c:if test="${__formdata.CFECHA!=1}">
                                        style="display:none;width:50%;" 
                                     </c:if>
                                     <c:if test="${__formdata.CFECHA==1}">
                                        style="width:50%;" 
                                     </c:if>
                                    title= "<axis:alt f="axissin045" c="FGESTIO" lit="9905757"/>"  
                                    <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="FGESTIO" a="modificable=false&obligatorio=true&formato=fecha"/>  />
                                    </c:if>
                                    <c:if test="${__formdata.MODO!='modificar'}">
                                        <axis:atr f="axissin045" c="FGESTIO" a="modificable=true&obligatorio=true&formato=fecha"/>  />
                                    </c:if>
                             <c:if test="${__formdata.MODO!='modificar'}">
                                    <a style="vertical-align:middle;">
                                        <img id="popup_calendario_FGESTIO" alt="<axis:alt f="axissin045" c="FGESTIO" lit="108341"/>"  
                                             src="images/calendar.gif" />
                                    </a>
                             </c:if>       
                             
                          </td>            
                        </axis:ocultar>
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin045" c="TCOMENT" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="TCOMENT" lit="101162"/></b>
                            </td>
                        </axis:ocultar> 
                    </tr>
                    <tr>
                        <axis:ocultar f="axissin045" c="TCOMENT" dejarHueco="false"> 
                            <td class="campocaja" colspan="3">
                                <textarea id="TCOMENT" name="TCOMENT" rows="2" cols="50" class="campo campotexto" obligatorio="false" 
                                <c:if test="${__formdata.MODO=='modificar'}">
                                        <axis:atr f="axissin045" c="TCOMENT" a="modificable=false&isInputText=false&obligatorio=false"/>
                                </c:if>
                                <c:if test="${__formdata.MODO!='modificar'}">
                                    <axis:atr f="axissin045" c="TCOMENT" a="modificable=true&isInputText=false&obligatorio=false"/>
                                </c:if>>${__formdata['TCOMENT']}</textarea>
                            </td>
                        </axis:ocultar> 
                    </tr>
                </table>
                <table class="seccion">
                    <tr>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                        <th style="width:25%;height:0px"></th>
                    </tr>
                    <tr>
                        <axis:visible f="axissin045" c="TSSERVIC"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin045" c="SSERVIC" lit="1000109"/></b>
                            </td>
                       </axis:visible>
                       <axis:ocultar f="axissin045" c="TDESCRI" dejarHueco="false"> 
                            <td class="titulocaja">
                                <b><axis:alt f="axissin047" c="TDESCRI" lit="100588"/></b>
                            </td>
                       </axis:ocultar> 
                    </tr>
                    <tr>
                        <axis:visible f="axissin045" c="TSSERVIC"> 
                            <td class="campocaja">
                                <input type="text" class="campo campotexto" id="SSERVIC" name="SSERVIC" <axis:atr f="axissin045" c="SSERVIC" a="modificable=true&obligatorio=false"/> size="15" style="width:90%"
                                value="${__formdata.SSERVIC}" />
                            </td>
                        </axis:visible> 
                        <axis:ocultar f="axissin045" c="TDESCRI" dejarHueco="false"> 
                            <td class="campocaja" colspan="1">
                                <input type="text" class="campo campotexto" onkeypress="if (event.keyCode==13) {f_but_buscar();}" id="TDESCRI" name="TDESCRI" <axis:atr f="axissin045" c="SSERVIC" a="modificable=true&obligatorio=false"/> size="100" style="width:90%"
                                value="${__formdata.TDESCRI}" disabled/>
                            </td>
                        </axis:ocultar>
                            <td>
                                <table>
                                    <tr>
                                        <td class="campocaja" colspan="1">
                                         <input type="button" class="boton" id="but_buscar" onclick="f_but_buscar()" value="<axis:alt f="axissin045" c="BUSCAR" lit="9000508"/>"/>                                            
                                        </td>
                                        <td class="campocaja" colspan="1">
                                         <input type="button" class="boton" id="but_nuevo_serv" onclick="f_but_nuevo_serv()" value="<axis:alt f="axissin045" c="NUEVO_SERV" lit="9905608"/>"/>                                            
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <c:if test="${__formdata.CCONVEN == 1 && __formdata.MODO!='modificar'}">
                                <td class="campocaja" colspan="1">
                                 <input type="button" class="boton" id="but_nuevo_conv" onclick="f_but_nuevo_conv()" value="<axis:alt f="axissin045" c="NUEVO_CONV" lit="9905759"/>" style="width:auto"/>                                            
                                </td>
                            </c:if>
                    </tr>
                    <tr>
                        <td colspan="4">
                            <iframe id="formula_seccion" name="formula_seccion"  style="width:100%;padding-top:2%" 
                                    src="blanco.html"  scrolling="yes" frameborder="0">
                            </iframe>
                         </td>
                    </tr>
                    </table>
                    <table class="seccion">                    
                    <tr>
                        <td class="titulocaja">
                                <b><axis:alt f="axissin047" c="SER_SELEC" lit="9902622"/></b>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4">
                        <c:set var="title1"><axis:alt f="axissin047" c="SSERVIC" lit="1000109"/></c:set><!-- codigo servicio -->
                        <c:set var="title2"><axis:alt f="axissin047" c="TDESCRI" lit="100588"/></c:set><!-- texto servicio -->
                        <c:set var="title7"><axis:alt f="axissin047" c="FALTA" lit="9001192"/></c:set><!-- fecha alta -->
                        <c:set var="title3"><axis:alt f="axissin047" c="NCANTID" lit="9904949" /></c:set><!-- Cantidad -->
                        <c:set var="title4"><axis:alt f="axissin047" c="IPRECIO" lit="9001165" /></c:set><!-- Importe unitario -->
                        <c:set var="title5"><axis:alt f="axissin047" c="ITOTAL" lit="9000474" /></c:set><!-- Importe total -->
                        <c:set var="title6"><axis:alt f="axissin047" c="SINCARGO" lit="9904950" /></c:set><!-- Sin cargo -->
                        <c:set var="title8"><axis:alt f="axissin047" c="ELIMINAR" lit="1000127" /></c:set><!-- Eliminar -->
                        <div class="displayspace">
                            <table id="T_SELECCIONATS" cellpadding="0" class="dsptgtable grid" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th class="sortable fixed gridsortable">${title1}</th>
                                        <th class="sortable fixed gridsortable">${title2}</th>
                                        <th class="sortable fixed gridsortable">${title7}</th>
                                        <th class="sortable fixed gridsortable">${title3}</th>
                                        <th class="sortable fixed gridsortable">${title4}</th>
                                        <th class="sortable fixed gridsortable">${title5}</th>
                                        <th class="sortable fixed gridsortable">${title6}</th>
                                        <th class="sortable fixed gridsortable">${title8}</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:if test="${empty __formdata.SERVICIOS}">
                                        <tr class="gridempty">
                                            <td colspan="8" class="emptyTextGrid">
                                                <axis:alt f="axissin047" c="NODATOS" lit="120135" />
                                            </td>
                                        </tr>
                                    </c:if>
                                    <c:if test="${!empty __formdata.SERVICIOS}">
                                        <% int contador = 0; %>
                                        <%
                                        try {
                                        %>

                                        <c:forEach items="${__formdata.SERVICIOS}" var="T_SELECCIONATS" >
                                            <% if (contador%2==0){ %> 
                                            <tr class="gridEven">
                                            <% } 
                                            else {%>
                                            <tr class="gridNotEven">
                                            <%}%>
                                                <td>
                                                    <div class="dspText" id="SSERVIC_${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}">
                                                        ${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}
                                                    </div>																    
                                                </td>
                                                <td>
                                                    <div class="dspText">${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.TSERVIC}</div>
                                                </td>
                                                <td>
                                                    <div class="dspText" id="FCAMBIO">
                                                        <fmt:formatDate pattern="dd/MM/yyyy" value="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.FCAMBIO}"/>   
                                                    </div>
                                                </td>
                                                <td style="width:9%">
                                                    <div class="dspIcons">
                                                        <input type="text" class="campo campotexto" id="NCANTID${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}" name="NCANTID" value="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.NCANTID}"
                                                               style="text-align:center"
                                                               onfocus="f_keepValue(this)"
                                                               onchange="f_actualizaImporte(${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.NVALSER},${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC},this)"/>
                                                    </div>
                                                </td> 
                                                <td style="width:12%">
                                                    <div class="dspNumber"><fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.NVALSER}"/></div>
                                                </td>
                                                <td style="width:12%">
                                                    <div class="dspNumber" id="ITOTAL${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}" >
	                                                    <c:if test="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.CNOCARG!=0}">
	                                                    	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.ITOTAL}"/>
	                                                    </c:if>
	                                                    <c:if test="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.CNOCARG==0}">
	                                                    	<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="0"/>
	                                                    </c:if>
                                                    </div>
                                                </td>
                                                <td style="width:12%">
                                                    <div class="dspIcons" >
                                                        <input type="checkbox" class="campo campotexto" id="SINCARGO${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}" name="SINCARGO" value="1"
                                                               onchange="f_actualizaImporte(${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.NVALSER},${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC})"
                                                               <c:if test="${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.CNOCARG==0}">checked</c:if> />
                                                    </div>
                                                </td>
                                                <td style="width:5%">
                                                    <div class="dspIcons" id="BT_DELETE_SERVICIO">
                                                        <img border="0" alt="<axis:alt f="axisprf001" c="BT_DELETE_SERVICIO" lit="1000127"/>" 
                                                             title1="<axis:alt f="axisprf001" c="BT_DELETE_SERVICIO" lit="1000127"/>" 
                                                             src="images/delete.gif" width="15px" height="15px"  
                                                             style="cursor:pointer;" onclick="f_delete_Serveis('${T_SELECCIONATS.OB_IAX_SIN_TRAMITA_DETGESTION.SSERVIC}')"/>
                                                    </div>
                                                </td>
                                            </tr>
                                         <% contador++; %>
                                        </c:forEach>



                                        <%
                                        }
                                        catch(Exception e) {
                                        }
                                        %>
                                    </c:if>
                                </tbody>
                            </table>	                        
                        </div>
                      </td>
                    </tr>
                </table>                
            </td>
        </tr>
    </table>
    <c:import url="../include/botonera_nt.jsp">
    	  <c:param name="f">axissin045</c:param>
        <c:param name="__botones">cancelar,aceptar</c:param>
    </c:import>
    </form>
    <script type="text/javascript">
            Calendar.setup({
                inputField     :    "FGESTIO",     
                ifFormat       :    "%d/%m/%Y",      
                button         :    "popup_calendario_FGESTIO", 
                singleClick    :    true,
                firstDay       :    1
            });
    </script>     
    <c:import url="../include/mensajes.jsp" />
    

</body>
</html>