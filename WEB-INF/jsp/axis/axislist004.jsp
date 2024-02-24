<%--
      NOMBRE:    axislist004.jsp
      Fecha: 
      PROPÓSITO (descripción pantalla): ANT__REFERENCIA 
      Ejemplo : 
  
      REVISIONES:
      Ver        Fecha       Autor            Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0                                     
      
--%>

<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="axis.util.Constantes, java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
    <head>
        <title></title>
        <link rel="StyleSheet" href="styles/genericosHtml.css" type="text/css"></link>
        <link rel="StyleSheet" href="styles/axisnt.css" type="text/css"></link>
        <link rel="stylesheet" href="styles/displaytag.css">
        <c:import url="../include/carga_framework_js.jsp" />
        <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
        <script type="text/javascript" src="scripts/calendar.js"></script>
        <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
        <script type="text/javascript" src="scripts/calendar-setup.js"></script>
        <script type="text/javascript">
var miXC=0; <c:if test="${!empty INFORMEPARAMS}">miXC=${fn:length(INFORMEPARAMS)};</c:if> 


function f_anyadir_new() {
	var errmsg="";
	//validacion minima de los valores del "new*"
	if (document.miForm.newTPARAM.value=="") {
		errmsg=errmsg+ '<axis:alt f="axislist004" c="ERROR" lit="9905658" />' + "\n";
	}
	if (document.miForm.newCTIPO.value=="") {
		errmsg=errmsg+ '<axis:alt f="axislist004" c="ERROR" lit="9905659" />' + "\n";
	}
    if (document.miForm.newLVALOR.value!=""){
        //Debe validar que empieze por SELECT:  o LISTA:
        var valor =document.miForm.newLVALOR.value;
        var pos1 =  valor.indexOf("SELECT:");
        var pos2 = valor.indexOf("LISTA:");
        if ((pos1==-1) && (pos2==-1)){
            errmsg=errmsg+ '<axis:alt f="axislist004" c="ERROR" lit="9905660" />' + "\n";
        }
    }
 
	if (document.miForm.newSLITERA.value!="") {
        //Debe ser numerico
        if (parseFloat(document.miForm.newSLITERA.value)+"" == "NaN") {
            errmsg=errmsg+ '<axis:alt f="axislist004" c="ERROR" lit="9905664" />' + "\n";
        }
    }

	if (errmsg.length>0) {
		alert(errmsg)
	}
	else {
		miXC=miXC+1;
		var plantilla="";
		plantilla=plantilla+"<tr id=\"XCxc\">                                                              ";
		plantilla=plantilla+"<td><input class=\"campo campodisabled\" type=\"text\" maxlength=\"20\" readonly=\"readonly\" name=\"pTPARAMxc\"  id=\"pTPARAMxc\"  value=\"\" /></td> ";
		plantilla=plantilla+"<td><input class=\"campo campodisabled\" type=\"text\" readonly=\"readonly\" name=\"pNORDERxc\"  id=\"pNORDERxc\"  value=\"\" /></td> ";
		plantilla=plantilla+"<td><input class=\"campo campodisabled\" type=\"text\"  formato=\"entero\" readonly=\"readonly\" formato=\"entero\" name=\"pSLITERAxc\" id=\"pSLITERAxc\" value=\"\" /></td> ";
		plantilla=plantilla+"<td><input type=\"hidden\" readonly=\"readonly\" name=\"pCTIPOxc\"   id=\"pCTIPOxc\"   value=\"\" /><input class=\"campo campodisabled\" type=\"text\" readonly=\"readonly\" name=\"pWRAPPERCTIPOxc\"   id=\"pWRAPPERCTIPOxc\"   value=\"\" /></td> ";
        plantilla=plantilla+"<td><input type=\"hidden\" readonly=\"readonly\" name=\"pNOTNULLxc\" id=\"pNOTNULLxc\" value=\"\" /><input class=\"campo campodisabled\" type=\"text\" readonly=\"readonly\" name=\"pWRAPPERNOTNULLxc\" id=\"pWRAPPERNOTNULLxc\" value=\"\" /></td> ";
		plantilla=plantilla+"<td><input class=\"campo campodisabled\" type=\"text\" readonly=\"readonly\" name=\"pLVALORxc\"  id=\"pLVALORxc\"  value=\"\" /></td> ";
		plantilla=plantilla+"<td style=\"text-align:right\"><img src=\"images/delete.gif\" onclick=\"f_remove_new(\'XCxc\')\" /></td> ";
		plantilla=plantilla+"</tr>                                                                         ";
		for (var i=0;i<100;i++) {
			plantilla=plantilla.replace("xc", ""+miXC)                                                            
		}
		$('#DSP_PARAMSsur tr:last').after(plantilla);
		
		$('#pTPARAM'+miXC).val(document.miForm.newTPARAM.value);
		$('#pNORDER'+miXC).val(document.miForm.newNORDER.value);
		$('#pSLITERA'+miXC).val(document.miForm.newSLITERA.value);
		$('#pCTIPO'+miXC).val(document.miForm.newCTIPO.value);
        switch (document.miForm.newCTIPO.value) {
            case "1": $('#pWRAPPERCTIPO'+miXC).val("<axis:alt f="axislist004" c="newCTIPO" lit="100566" />"); break;
            case "2": $('#pWRAPPERCTIPO'+miXC).val("<axis:alt f="axislist004" c="newCTIPO" lit="9905670" />"); break;
            case "3": $('#pWRAPPERCTIPO'+miXC).val("<axis:alt f="axislist004" c="newCTIPO" lit="100562" />"); break;
        }
		if (document.miForm.newNOTNULL.checked) {
			$('#pNOTNULL'+miXC).val(1);
            $('#pWRAPPERNOTNULL'+miXC).val("true");
		}
		else {
			$('#pNOTNULL'+miXC).val(0);
            $('#pWRAPPERNOTNULL'+miXC).val("false");
		}
		$('#pLVALOR'+miXC).val(document.miForm.newLVALOR.value);

        //falta limpiar new*
        document.miForm.newTPARAM.value="";
        document.miForm.newNORDER.value="";
        document.miForm.newSLITERA.value="";
        document.miForm.newCTIPO.value="1";
        document.miForm.newNOTNULL.checked=false;
        document.miForm.newLVALOR.value="";
        document.getElementById("newTSLITERA").innerHTML="";

    }
    
}  

function f_remove_new(trid) {
	var parillatrid="#"+trid;
	$(parillatrid).remove();
} 

function f_but_aceptar() {
    if (objValidador.validaEntrada()){
		objUtiles.ejecutarFormulario ("axis_axislist004.do", "aceptar", document.miForm, "_self", "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905678"/>");
    }
}

function f_cerrar_axislist005() {
    objUtiles.cerrarModal("axislist005");
}

function f_abrir_axislist005(cont){                    
	var URLext="";
	URLext=URLext+"&CFORM="+escape(document.miForm.CFORM.value);
	URLext=URLext+"&CEMPRES="+escape(document.miForm.CEMPRES.value);
    objUtiles.abrirModal("axislist005", "src", "modal_axislist005.do?operation=form&origen=axislist004.jsp"+URLext);//,600,200);
}  

function f_onload(){
    f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
	var CMAP = document.miForm.CMAP.value;
    if (document.miForm.CMAP.value=="" && document.miForm.mimodo.value!="ALTA"){
        f_abrir_axislist005();
	}
	else {
		f_onchange(document.miForm.SLITERA)
	}
}

function f_onchange(ths){
	var QUE="";
	if (ths.id=='SLITERA') {
		//hay que buscar un nuevo literal
		QUE="TSLITERA";
		var SLITERA=document.miForm.SLITERA.value;
		var url="axis_axislist004.do?operation=miajaxjson&QUE="+escape(QUE)+"&SLITERA="+escape(SLITERA);
		jQuery.ajax({
			url: url,
			dataType: 'json',
			success: callBack_miajaxjson
		});
	}
	if (ths.id=='newSLITERA') {
		//hay que buscar un nuevo literal
		QUE="newTSLITERA";
		var newSLITERA=document.miForm.newSLITERA.value;
		var url="axis_axislist004.do?operation=miajaxjson&QUE="+escape(QUE)+"&newSLITERA="+escape(newSLITERA);
		jQuery.ajax({
			url: url,
			dataType: 'json',
			success: callBack_miajaxjson
		});
	}
    if (ths.id=='newCTIPO') {
        if (ths.value=='3') { //FECHA
            $('#newLVALOR').hide();     
        }
        else {
            $('#newLVALOR').show();            
        }
    }    
}

function activar(elemento){
    if (elemento.name.indexOf("TIDIOMA_")==0){
        if (elemento.checked) {
            var posicion = elemento.name.substring(8);
            var nombreInforme  =  "CINFORME_" + posicion;
            var nombreTDescrip =  "TDESCRIP_" + posicion;
            var informe =  document.getElementById(nombreInforme);
            var descripcion = document.getElementById(nombreTDescrip);
            informe.disabled=  false;
            descripcion.disabled = false;
            $("#"+nombreInforme).addClass("campotexto_ob");
            $("#"+nombreInforme).removeClass("campodisabled");

            $("#"+nombreTDescrip).addClass("campotexto_ob");
            $("#"+nombreTDescrip).removeClass("campodisabled");            
            
            
        }else{
            var posicion = elemento.name.substring(8);
            var nombreInforme  =  "CINFORME_" + posicion;
            var nombreTDescrip =  "TDESCRIP_" + posicion;
            var informe =  document.getElementById(nombreInforme);
            var descripcion = document.getElementById(nombreTDescrip);
            informe.disabled=  true;
            descripcion.disabled = true;      
            $("#"+nombreInforme).addClass("campodisabled");
            $("#"+nombreInforme).removeClass("campotexto_ob");

            $("#"+nombreTDescrip).addClass("campodisabled");
            $("#"+nombreTDescrip).removeClass("campotexto_ob");            
        }
    }    

}
function f_but_salir() {
    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislist004", "cancelar", document.miForm, "_self");
}

function f_but_nuevo() {
	document.miForm.CMAP.value="";
	document.miForm.mimodo.value="ALTA";
    objUtiles.ejecutarFormulario ("axis_axislist004.do", "nuevo", document.miForm, "_self");
}

function validar_det_plantillas(){
    var elementCheck =  document.getElementsByTagName("input");
    var k=0;
    var totalChecks = 0;
    if (elementCheck!=null){
        for (k=0;k<elementCheck.length;k++) {
            if (elementCheck[k].name.indexOf("TIDIOMA_")==0) {
                if (elementCheck[k].checked){
                   var nombreinforme="CINFORME_" +  elementCheck[k].name.substring(8);
                   var nombredescrip="TDESCRIP_" +  elementCheck[k].name.substring(8); 
                    var cinforme=document.getElementById(nombreinforme);
                    var cdescrip= document.getElementById(nombredescrip);
                    if ((cinforme.value=="") || (cdescrip.value=="")){
                       totalChecks++;
                    }
                }
            }
        }  
     }   
     return totalChecks;           
}

function validar_plantillas(){
    var elementCheck =  document.getElementsByTagName("input");
    var k=0;
    var totalChecks = 0;
    if (elementCheck!=null){
        for (k=0;k<elementCheck.length;k++) {
            if (elementCheck[k].name.indexOf("TIDIOMA_")==0) {
                if (elementCheck[k].checked){
                    totalChecks++;
                }
            }
        }  
     }   
     return totalChecks; 


}

function obligatorio_exports(){
 var elementCheck =  document.getElementsByTagName("input");
    var k=0;
    var totalChecks = 0;
    if (elementCheck!=null){
        for (k=0;k<elementCheck.length;k++) {
            if (elementCheck[k].name.indexOf("LEXPORT_")==0) {
                if (elementCheck[k].checked){
                    totalChecks++;
                }
            }
        }  
     }   
     return totalChecks; 

}

function formato_plantillas(){
  var elementCheck =  document.getElementsByTagName("input");
    var k=0;
    var totalChecks = 0;
    if (elementCheck!=null){
        for (k=0;k<elementCheck.length;k++) {
            if (elementCheck[k].name.indexOf("TIDIOMA_")==0) {
                if (elementCheck[k].checked){
                   var nombreinforme="CINFORME_" +  elementCheck[k].name.substring(8);
                    var cinforme=document.getElementById(nombreinforme).value;
                    var posicion =cinforme.indexOf(".");
                    if (posicion!=-1){
                        var extension = cinforme.substring(posicion+1);
                        if (extension!="jasper" && extension!="jrxml"){
                            totalChecks++;
                        }	
                    }else{
                        totalChecks++;
                    
                    }
                }               
            }
        }  
     }   
     return totalChecks;           

}



function validarDatos(){
  // cmap,lexport,ctipo, y alguno de cinforme, tdescrip
  var msg="";
  var total =0;
  total =obligatorio_exports();
  if (total==0){
    msg =  msg + '<axis:alt f="axislist004" c="ERROR" lit="9905654" />' + "\n";
  }
  //Valida que haya algun check de idioma marcado
  total =  validar_plantillas();
  if (total==0){
    msg = msg + '<axis:alt f="axislist004" c="ERROR" lit="9905656" />' + "\n";
  }
  total = validar_det_plantillas();
  if (total>0){
    msg = msg + '<axis:alt f="axislist004" c="ERROR" lit="9905655" />' + "\n";
  }else{
    //Valida que el formato del informe se xxxx.jasper o xxxx.jrxml
    total = formato_plantillas();
    if (total>0){
        msg = msg + '<axis:alt f="axislist004" c="ERROR" lit="9905657" />' + "\n";
    }
  }
 
  return msg;
}  


function f_but_guardar() {
    var msg="";
	if (!objValidador.validaEntrada()){
        msg =  validarDatos();
        if (msg!=""){
            alert(msg);
        }
    }else{
        msg =  validarDatos();
        if (msg!=""){
            alert(msg);
         }else{   
            document.miForm.IDENTIFICADOR.value=document.miForm.CMAP.value + "|" + document.miForm.CEMPRES.value +"|"+ document.miForm.CFORM.value+"|"+document.miForm.CMAP.value+"|"+document.miForm.TEVENTO.value+"|"+document.miForm.SPRODUC.value+"|"+document.miForm.CCFGFORM.value + "|" + document.miForm.CTIPO.value;
			objUtiles.ejecutarFormulario ("axis_axislist004.do", "guardar", document.miForm, "_self", "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905678"/>");        
         }   
    }
    
}


function callBack_miajaxjson(p) {
  //alert(JSON.stringify(p))
  if (p.JSON2.QUE=='TSLITERA') {
	document.getElementById("TSLITERA").innerHTML=p.JSON2.TSLITERA;
  }
  if (p.JSON2.QUE=='newTSLITERA') {
	document.getElementById("newTSLITERA").innerHTML=p.JSON2.newTSLITERA;
  }
}

//TODO: lo que pasamos como identificador debe ser justamente lo que se necesita para identificar un registro
//TODO: este identificador es la concadenacion de los valores de las claves para identificar el regsitro
// IDENTIFICADOR: CCODPLAN | CEMPRES | CFORM | CMAP | TEVENTO | SPRODUC | CCFGFORM |  CTIPO
function f_recuperar(identificador) { //TODO: todos los parametros para recuperar el registro
	//ver axislist005 como se monta el IDENTIFICADOR
	document.miForm.mimodo.value=='MODIFICACION';
	document.miForm.IDENTIFICADOR.value=identificador;
	objUtiles.ejecutarFormulario ("axis_axislist004.do", "recuperar", document.miForm, "_self", "<axis:alt f="axislist004" c="MSG_CARGAR" lit="9905683"/>");

}

        </script>
    </head>
    <body  onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <c:import url="../include/modal_estandar.jsp">
        <c:param name="nid_y_titulo">unamodal|<axis:alt f="axislist004" c="TIT_UNAMODAL" lit="1000205" />|true</c:param>
    </c:import>
	<c:import url="../include/modal_estandar.jsp"><c:param name="titulo"><axis:alt f="axislist004" c="TIT_AXISLIST004" lit="9905620"/></c:param><c:param name="nid" value="axislist005"/></c:import>
    
    <form name="miForm" action="" method="POST">         

        <c:import url="../include/titulo_nt.jsp">
            <c:param name="titulo"><b><axis:alt f="axislist004" c="TITULO_FORM" lit="9905620"/></b></c:param>    
            <c:param name="formulario"> <b><axis:alt f="axislist004" c="TITULO_FORM" lit="9905620"/></b></c:param> 
            <c:param name="form">axislist004</c:param>
        </c:import> 
        <input type="hidden" name="operation" value=""/>
        <input type="hidden" name="mimodo" value="${__formdata.mimodo}"/>
        <input type="hidden" name="IDENTIFICADOR" value=""/>
        <input type="hidden" id="TEVENTO" name="TEVENTO"      value="${__formdata.TEVENTO}"/>     
        <input type="hidden" id="CCFGFORM" name="CCFGFORM"      value="${__formdata.CCFGFORM}"/> 
        <input type="hidden" id="SPRODUC" name="SPRODUC"      value="${__formdata.SPRODUC}"/> 
        <input type="hidden" id="CFORM" name="CFORM"      value="${__formdata.CFORM}"/> 
        <input type="hidden" name="CPATH" value="*" />

        <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:20px">
            <tr> 
                <td> 
                    <table class="seccion" align="center">
                        <tr>
                            <td >
                                <table class="area"  align="center">
                                    <tr>
                                        <th style="width:17%;height:0px"></th>
                                        <th style="width:17%;height:0px"></th>
                                        <th style="width:3%;height:0px"></th>
                                        <th style="width:20%;height:0px"></th>
                                        <th style="width:17%;height:0px"></th>
                                        <th style="width:17%;height:0px"></th>
                                        <th style="width:17%;height:0px"></th>
                                        <th style="width:17%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td colspan="8">
											<div class="titulo">
												<img src="images/flecha.gif"/><axis:alt f="axislist004" c="TIT_LISTADOS" lit="9901994"/>
												<img id="find" border="0" src="images/find.gif" onclick="f_abrir_axislist005()" style="cursor:pointer"/>
											</div>
                                         </td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" id="tit_CEMPRES">
                                            <b label="label_CEMPRES"><axis:alt f="axislist004" c="CEMPRES" lit="101619" /></b> <!--empresa-->
                                        </td>
                                        <td class="titulocaja" id="tit_CMAP">
                                            <b label="label_CMAP"><axis:alt f="axislist004" c="CMAP" lit="9905639" /></b> <!--CMAP -->
                                        </td>
                                        <td class="titulocaja" id="tit_SLITERA" colspan="2">
                                            <b label="label_SLITERA"><axis:alt f="axislist004" c="SLITERA" lit="9905640" /></b> <!--SLITERA -->
                                        </td>
                                        
                                        <td class="titulocaja" id="tit_CTIPO">
                                            <b label="label_CTIPO"><axis:alt f="axislist004" c="CTIPO" lit="9905645" /></b> <!--CTIPO (del informe, no de los params!)-->
                                        </td>                                        
                                    </tr>
                                    <tr>
										<axis:ocultar f="axislist004" c="CEMPRES">
                                        <td class="campocaja">                                            
                                            <select name = "CEMPRES" id="CEMPRES" paramMap="true"   size="1" onchange="f_onchange(this)" class="campowidthinput campo campotexto"   title="<axis:alt f="axislist004" c="CEMPRES" lit="101619"/>" <axis:atr f="axislist004" c="CEMPRES" a="modificable=true&isInputText=false&obligatorio=true"/> >
                                                <option value = "<%= Integer.MIN_VALUE %>"> - <axis:alt f="axislist004" c="CEMPRES" lit="108341"/> - </option>
                                                <c:forEach var="empresas" items="${EMPRESAS}">
                                                    <option value = "${empresas.CEMPRES}" <c:if test="${(!empty __formdata.CEMPRES)&& empresas.CEMPRES == __formdata.CEMPRES}"> selected </c:if>>${empresas.TEMPRES}</option>
                                                </c:forEach>
                                            </select>
                                        </td>
										</axis:ocultar>
										<axis:ocultar f="axislist004" c="CMAP">
											<td class="campocaja">
                                            <c:choose>
                                                <c:when test="${(!empty __formdata.mimodo)&& __formdata.mimodo=='MODIFICACION'}">
                                                    <input type="text" class="campo campotexto" maxlength="20" value="${__formdata.CMAP}" name="CMAP" id="CMAP"  <axis:atr f="axislist004" c="CMAP"  a="modificable=false&obligatorio=true&isInputText=true"/>
                                                </c:when>
                                                <c:otherwise>
                                                    <input type="text" class="campo campotexto"  maxlength="20" value="${__formdata.CMAP}" name="CMAP" id="CMAP"   <axis:atr f="axislist004" c="CMAP"  a="modificable=true&obligatorio=true&isInputText=true"/>
                                                </c:otherwise>
                                            </c:choose>
                                            </td>
										</axis:ocultar>
										<axis:ocultar f="axislist004" c="SLITERA">
                                            <td class="campocaja" colspan="2">
                                                <input type="text" class="campo campotexto" formato="entero" value="${__formdata.SLITERA}" name="SLITERA" id="SLITERA" <axis:atr f="axislist004" c="SLITERA"  a="modificable=true&obligatorio=true&isInputText=true"/> onblur="f_onchange(this)" />
                                            </td>
										</axis:ocultar>
                                        
										<axis:ocultar f="axislist004" c="CTIPO">
                                        <td class="campocaja">                                            
                                            <select name = "CTIPO" id="CTIPO"  size="1" onchange="f_onchange(this)" class="campowidthinput campo campotexto"   title="<axis:alt f="axislist004" c="CTIPO" lit="LIT_CTIPO"/>" <axis:atr f="axislist004" c="CTIPO" a="modificable=false&isInputText=false&obligatorio=true"/> >
                                                    <option value = ""  <c:if test="${(empty __formdata.CTIPO)}">                            selected </c:if>>MAP</option>
                                                   <!-- <option value = "0" <c:if test="${(!empty __formdata.CTIPO)&& '0' == __formdata.CTIPO}"> selected </c:if>>MAP</option>-->
                                                    <option value = "1"  <c:if test="${(empty __formdata.CTIPO)|| '1' == __formdata.CTIPO}" > selected </c:if>>Jasper</option>
                                            </select>
                                        </td>
										</axis:ocultar>                                        
                                    </tr>
                                    <tr>
                                        <td class="campocaja" colspan="2">                                            
                                        </td>
                                        <td class="campocaja" colspan="2" id="TSLITERA">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td class="titulocaja" id="tit_LEXPORT">
                                            <b label="label_LEXPORT"><axis:alt f="axislist004" c="LEXPORT" lit="9905641" /></b> <!--LEXPORT-->
                                        </td>
                                        <td class="titulocaja" id="tit_CIDIOMA" colspan="2">
                                            <b label="label_CIDIOMA"><axis:alt f="axislist004" c="CIDIOMA" lit="100654" /></b> <!--CIDIOMA-->
                                        </td>
                                        <td class="titulocaja" id="tit_CINFORME">
                                            <b label="label_CINFORME"><axis:alt f="axislist004" c="CINFORME" lit="9905642" /></b> <!--CINFORME-->
                                        </td>
                                        <td class="titulocaja" id="tit_TDESCRIP" colspan="2">
                                            <b label="label_TDESCRIP"><axis:alt f="axislist004" c="TDESCRIP" lit="100588" /></b> <!--TDESCRIP-->
                                        </td>
                                    </tr>
                                    <tr>
										<axis:ocultar f="axislist004" c="LEXPORT">
                                        <td class="campocaja" xrowspan="3">    
											<c:set var="miLEXPORT">|${__formdata.LEXPORT}|</c:set>
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_PDF" value="LEXPORT_PDF" <c:if test="${fn:contains(miLEXPORT,'|PDF|')}">checked</c:if> />: PDF
											<br />
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_CSV" value="LEXPORT_CSV" <c:if test="${fn:contains(miLEXPORT,'|CSV|')}">checked</c:if> />: CSV
											<br />
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_XML" value="LEXPORT_XML" <c:if test="${fn:contains(miLEXPORT,'|XML|')}">checked</c:if> />: XML
											<br />
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_HTML" value="LEXPORT_HTML" <c:if test="${fn:contains(miLEXPORT,'|HTML|')}">checked</c:if> />: HTML
											<br />
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_XLS" value="LEXPORT_XLS" <c:if test="${fn:contains(miLEXPORT,'|XLS|')}">checked</c:if> />: XLS
											<br />
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_XLSX" value="LEXPORT_XLSX" <c:if test="${fn:contains(miLEXPORT,'|XLSX|')}">checked</c:if> />: XLSX
											<br />        
											<input class="campo" style="width:40px" type="checkbox" name="LEXPORT_TXT" value="LEXPORT_TXT" <c:if test="${fn:contains(miLEXPORT,'|TXT|')}">checked</c:if> />: TXT
											<br />                                                 
                                        </td>
										</axis:ocultar>
										<axis:ocultar f="axislist004" c="CIDIOMA">
                                            <td class="campocaja"  xrowspan="3">  
                                            <c:forEach var="idiomas" items="${IDIOMAS}">
                                            <input type="hidden" name="CIDIOMA_${idiomas.CIDIOMA}" value="${idiomas.CIDIOMA}" />
                                            <input type="text" class="campo campotexto" name="TIDIOMA_${idiomas.CIDIOMA}" value="${idiomas.TIDIOMA}" readonly />
                                            </c:forEach>
										</td>
                                        </axis:ocultar>
                                        
										<axis:ocultar f="axislist004" c="CIDIOMA">
                                            <td class="campocaja"  xrowspan="3">  
                                            <c:forEach var="idiomas" items="${IDIOMAS}">
                                            <c:set var="CHECK_CIDIOMA" value="" />
													<c:forEach var="plantillas" items="${LISTAPLANTILLAS}">
														<c:if test="${plantillas.CIDIOMA==idiomas.CIDIOMA}"><c:set var="CHECK_CIDIOMA" value="${plantillas.CINFORME}" /></c:if>
													</c:forEach>                                            
                                            <div class="dspIcons">
                                            <!--<input class="campo campotexto" <c:if test="$(empty CHECK_CIDIOMA}">checked</c:if> type="checkbox" name="TIDIOMA_${idiomas.CIDIOMA}" value="${CHECK_CIDIOMA}" onclick="activar(this)"/>-->
                                            <input type="checkbox"  id="CVALIDADO" name="TIDIOMA_${idiomas.CIDIOMA}" value="${CHECK_CIDIOMA}" 
                                                <c:if test="${CHECK_CIDIOMA != ''}">checked</c:if> onclick="activar(this)" > 
                                            
                                            </div>
                                            </c:forEach>
										</td>
                                        </axis:ocultar>                                        
                         
										<axis:ocultar f="axislist004" c="CINFORME">
											<td class="campocaja"  xrowspan="3">
												<c:forEach var="idiomas" items="${IDIOMAS}">
													<c:set var="CINFORME_CIDIOMA" value="" />
													<c:forEach var="plantillas" items="${LISTAPLANTILLAS}">
														<c:if test="${plantillas.CIDIOMA==idiomas.CIDIOMA}"><c:set var="CINFORME_CIDIOMA" value="${plantillas.CINFORME}" /></c:if>
													</c:forEach>
                                                <!--<input type="text" class="campo campotexto"  name="CINFORME_${idiomas.CIDIOMA}" id="CINFORME_${idiomas.CIDIOMA}" value="${CINFORME_CIDIOMA}" <axis:atr f="axislist004" c="CINFORME"  a="modificable=true&obligatorio=false&isInputText=true"/> />-->
                                                <input type="text"   maxlength="100" class="campo campotexto" <c:if test="${empty CINFORME_CIDIOMA}">disabled="disabled"</c:if> name="CINFORME_${idiomas.CIDIOMA}" id="CINFORME_${idiomas.CIDIOMA}" value="${CINFORME_CIDIOMA}" <axis:atr f="axislist004" c="CINFORME"  a="obligatorio=false&isInputText=true"/> />
                                                </c:forEach>
											</td>
										</axis:ocultar>
										<axis:ocultar f="axislist004" c="TDESCRIP">
											<td class="campocaja" colspan="2"  xrowspan="3">
												<c:forEach var="idiomas" items="${IDIOMAS}">
													<c:set var="CINFORME_TDESCRIP" value="" />
													<c:forEach var="plantillas" items="${LISTAPLANTILLAS}">
														<c:if test="${plantillas.CIDIOMA==idiomas.CIDIOMA}"><c:set var="CINFORME_TDESCRIP" value="${plantillas.TDESCRIP}" /></c:if>
													</c:forEach>
                                                    <input type="text" maxlength="250" class="campo campotexto" <c:if test="${empty CINFORME_TDESCRIP}">disabled="disabled"</c:if> name="TDESCRIP_${idiomas.CIDIOMA}" id="TDESCRIP_${idiomas.CIDIOMA}" value="${CINFORME_TDESCRIP}" <axis:atr f="axislist004" c="TDESCRIP"  a="modificable=true&obligatorio=false&isInputText=true"/> />
												</c:forEach>
											</td>
										</axis:ocultar>
   					                    
					</table>
                                <table class="area" id="DSP_PARAMS" align="center"  xstyle="background-color:blue">
                                    <tr>
                                        <th style="width:30%;height:0px"></th>
                                        <th style="width:70%;height:0px"></th>
                                    </tr>
                                    <tr>
                                        <td colspan="2" id="TITULO_PARAMS">
                                            <div class="separador">&nbsp;</div>
                                            <div class="titulo">
                                                <img src="images/flecha.gif"/><b><axis:alt f="axislist004" c="TIT_PARAMS" lit="103694"/> </b>
                                            </div>
                                         </td>
                                    </tr>
                                </table>

<table class="area" id="DSP_PARAMSlist" align="center"  xstyle="background-color:green">
<tr>
<td>

	<table class="dsptgtable grid" id="DSP_PARAMSsur" align="center"  xstyle="background-color:pink">
	<tr>
	<th class="sortable fixed gridsortable" style="width:15%;height:0px"><axis:alt f="axislist004" c="TPARAM"  lit="9905647"  /></th>
	<th class="sortable fixed gridsortable" style="width:15%;height:0px"><axis:alt f="axislist004" c="NORDER"  lit="500102"  /></th>
	<th class="sortable fixed gridsortable" style="width:15%;height:0px"><axis:alt f="axislist004" c="SLITERA" lit="9905640" /></th>
	<th class="sortable fixed gridsortable" style="width:15%;height:0px"><axis:alt f="axislist004" c="CTIPO"   lit="100565"   /></th>
	<th class="sortable fixed gridsortable" style="width:15%;height:0px"><axis:alt f="axislist004" c="NOTNULL" lit="9905652" /></th>
	<th class="sortable fixed gridsortable" style="width:15%;height:0px"><axis:alt f="axislist004" c="LVALOR"  lit="101159"  /></th>
	<th class="sortable fixed gridsortable" style="width:10%;height:0px"></th>
	</tr>
<c:forEach items="${INFORMEPARAMS}" var="item" varStatus="status">
<tr id="XC${status.count}">                                                               
<td><input type="text" class="campo" readonly="readonly" name="pTPARAM${status.count}"  id="pTPARAM${status.count}"  value="${item.TPARAM}" /></td>  
<td><input type="text" class="campo" readonly="readonly" name="pNORDER${status.count}"  id="pNORDER${status.count}"  value="${item.NORDER}" /></td>  
<td><input type="text" class="campo" readonly="readonly" name="pSLITERA${status.count}" id="pSLITERA${status.count}" value="${item.SLITERA}" /></td>  
<td><input type="hidden" readonly="readonly" name="pCTIPO${status.count}"   id="pCTIPO${status.count}"   value="${item.CTIPO}" />
    <c:set var="itemCTIPO" value="false" />
    <c:choose>
    <c:when test="${item.CTIPO==1}"><c:set var="itemCTIPO"><axis:alt f="axislist004" c="newCTIPO" lit="100566" /></c:set></c:when>
    <c:when test="${item.CTIPO==2}"><c:set var="itemCTIPO"><axis:alt f="axislist004" c="newCTIPO" lit="9905670" /></c:set></c:when>   
    <c:when test="${item.CTIPO==3}"><c:set var="itemCTIPO"><axis:alt f="axislist004" c="newCTIPO" lit="100562" /></c:set></c:when>
    </c:choose>
    <input type="text" class="campo" readonly="readonly" value="${itemCTIPO}" />
</td>  
<td><input type="hidden" readonly="readonly" name="pNOTNULL${status.count}" id="pNOTNULL${status.count}" value="${item.NOTNULL}" />
    <c:set var="itemNOTNULL" value="false" />
    <c:choose>
    <c:when test="${item.NOTNULL==1}"><c:set var="itemNOTNULL" value="true" /></c:when>
    <c:otherwise><c:set var="itemNOTNULL" value="false" /></c:otherwise>
    </c:choose>
    <input type="text" class="campo" readonly="readonly" value="${itemNOTNULL}" />
</td>  
<td><input type="text" class="campo" readonly="readonly" name="pLVALOR${status.count}"  id="pLVALOR${status.count}"  value="${item.LVALOR}" /></td>  
<td style="text-align:right"><img src="images/delete.gif" onclick="f_remove_new('XC${status.count}')" /></td>  
</tr>    
</c:forEach>




	</table>
</td>
</tr>
</table>

<table class="area" id="DSP_PARAMSnew" align="center" xstyle="background-color:red">
<tr>
<th style="width:15%;height:0px"></th>
<th style="width:15%;height:0px"></th>
<th style="width:15%;height:0px"></th>
<th style="width:15%;height:0px"></th>
<th style="width:15%;height:0px"></th>
<th style="width:15%;height:0px"></th>
<th style="width:10%;height:0px"></th>
</tr>
<tr>
<td class="campocaja"><input class="campo campotexto" type="text" name="newTPARAM"  maxlength="20" id="newTPARAM"  value="" onblur="this.value=this.value.toUpperCase();"/></td>
<td class="campocaja"><select name="newNORDER"   id="newNORDER" class="campo"><option value=""></option><% for (int cnewNORDER=1;cnewNORDER<100;cnewNORDER++) { %><option value="<%=cnewNORDER%>"><%=cnewNORDER%></option><%}%></select></td>
<td class="campocaja"><input class="campo campotexto" type="text" name="newSLITERA" id="newSLITERA" value="" onblur="f_onchange(this)" /></td>
<td class="campocaja"><select name="newCTIPO"   id="newCTIPO" onchange="f_onchange(this)" class="campo"><option value="1" selected><axis:alt f="axislist004" c="newCTIPO" lit="100566" /></option><option value="2"><axis:alt f="axislist004" c="newCTIPO" lit="9905670" /></option><option value="3"><axis:alt f="axislist004" c="newCTIPO" lit="100562" /></option></select></td>
<td class="campocaja"><input class="campo campotexto" type="checkbox" style="size:40px" name="newNOTNULL" id="newNOTNULL" value="1" /></td>
<td class="campocaja"><input class="campo campotexto" type="text" name="newLVALOR"  id="newLVALOR"  value="" /></td>
<td class="campocaja"><img src="images/new.gif" onclick="f_anyadir_new()" /></td>
</tr>
<tr>
<td></td>
<td></td>
<td class="campocaja" colspan="2" id="newTSLITERA">&nbsp;</td>
</tr>
</table>
                            
                            </td>
                        </tr>                              
                    </table>
                </td>
            </tr>                                
        </table>

        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisrea035</c:param><c:param name="f">axisrea035</c:param>
            <c:param name="__botones">salir,nuevo,guardar</c:param>
        </c:import>        
    </form>    

<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


