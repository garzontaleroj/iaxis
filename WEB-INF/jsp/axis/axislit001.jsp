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
        
        <%--Inicio Sólo si vamos a tener un campo fecha --%>
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
        <%-- fin Sólo si vamos a tener un campo fecha --%>

<script language="Javascript" src="scripts/json2.js" ></script>
<script language="Javascript">
 function f_but_salir() {
                    objUtiles.ejecutarFormulario ("flujodetrabajo.do?forigen=axislit001", "cancelar", document.miForm, "_self");
                
  }
function ayuda(q) {
	var ayudas=""
	/*if (q=="BUSCAR") {
			//ayudas="> Buscar literal\nPermite buscar entre literales o SLITERAs (nuevo!) existentes.\nCriterio mínimo de la búsqueda son 3 carácteres (o cifras). Solo de demuestra un máximo de "+(maxshow+1)+" registros."
	}
	if (q=="CREAR") {
			//ayudas="> Crear literal\nPermite crear literales nuevos en la BBDD.\nHay que seleccionar el tipo de literal, e informar a los literales en los idiomas respectivos.\nAntes de ejecutar contra la BBDD, se recomienda de probar la SQL.\nEl código generado se puede marcar/copiar para los ficheros SQL de los patches."
                     //   ayudas="> Crear literal\nPermite crear literales nuevos en la BBDD.\nHay que informar a los literales en los idiomas respectivos.\n"
	}
	if (ayudas.length>0) {
		ayudas="Ayuda: "+ayudas;
		alert(ayudas)
	}*/
}	
function pulso(onOff) {
    var pulsodiv=document.getElementById("pulso");
    if (onOff=="ON" && pulsodiv.style.visibility=="hidden") pulsodiv.style.visibility="visible";
    if (onOff=="OFF" && pulsodiv.style.visibility=="visible") pulsodiv.style.visibility="hidden";
}

function f_onkeyup(ths) {
    if (ths.id=="buscar") {
        var tTLITERA=trim(document.getElementById("buscar").value)
        var names=new Array();
        var values=new Array();
        if (tTLITERA.length>=3) {
        	//names[0]="TLITERA";
        	//values[0]=tTLITERA
        	//alert("llamare a:"+"hotspot.jsp?"+"TLITERA="+escape(tTLITERA))
        //invokeAsyncCGI("hotspot.jsp?"+"TLITERA="+escape(tTLITERA), hitmecallback, "GET", null, null, null)
        objAjax.invokeAsyncCGI("axis_axislit001.do", hitmecallback, "operation=buscar&TLITERA=" + escape(tTLITERA), this, objJsMessages.jslit_actualizando_registro);
        }
    }
    if (ths.id.indexOf("t_")==0) {
        remontarCodigo()
    }
}

function f_but_buscar() {
        var tTLITERA=trim(document.getElementById("buscar").value)
        var names=new Array();
        var values=new Array();
        if (tTLITERA.length>=3) {
        	//names[0]="TLITERA";
        	//values[0]=tTLITERA
        	//alert("llamare a:"+"hotspot.jsp?"+"TLITERA="+escape(tTLITERA))
        //invokeAsyncCGI("hotspot.jsp?"+"TLITERA="+escape(tTLITERA), hitmecallback, "GET", null, null, null)
        objAjax.invokeAsyncCGI("axis_axislit001.do", hitmecallback, "operation=buscar&TLITERA=" + escape(tTLITERA), this, objJsMessages.jslit_actualizando_registro);
        }
   
}



function parseResponseIntoJSONObject(jsonText) {
    var myObject = JSON.parse(jsonText);
    return myObject;
}
 function callBackActualizarfechahoras(r){
        try{
            var jsonObject=parseResponseIntoJSONObject(r);
            var errmsg=show__errmsgs(jsonObject, true);

    if (errmsg.length>0) {
            alert(errmsg)
        }
        else {
            document.getElementById("SUMBSNHORASMAX").value = (jsonObject.PSUMBSNHORASMAX != null)? jsonObject.PSUMBSNHORASMAX : '';
            document.getElementById("SUMBSNHORASREAL").value = (jsonObject.PSUMBSNHORASREAL!= null)?jsonObject.PSUMBSNHORASREAL:'';
            document.getElementById("SUMBSNHORASMAXNOCERRADOS").value = (jsonObject.PSUMBSNHORASMAXNOCERRADOS != null) ? jsonObject.PSUMBSNHORASMAXNOCERRADOS :'' ;
            document.getElementById("SUMBSNHORASREALNOCERRADOS").value = (jsonObject.PSUMBSNHORASREALNOCERRADOS!= null) ? jsonObject.PSUMBSNHORASREALNOCERRADOS : '';
        }
        }catch(e){
            alert(e);
        }
    }
function f_onclick(ths) {
    if (ths.id=="buscar") {
        document.getElementById("resultats").options.length=0
        document.getElementById("buscar").value=""
    }
    if (ths.id=="resultats") {
        var si=document.getElementById("resultats").selectedIndex
        var MiOption=document.getElementById("resultats").options[si];
        alert(MiOption.value+" "+MiOption.text)
    }
    if (ths.id=="t_cod") {
        remontarCodigo()
    }
    if (ths.id.indexOf("c_t")==0) {

        remontarCodigo()
    }

}

function remontarCodigo(pOe) {

		var pOeValor="PROBAR"; if (pOe!=undefined) pOeValor=pOe;
    var CATRIBU=document.getElementById("t_cod").value;

    var cgiStr="dt="+(new Date());
    var CIDIOMAS="";
    cgiStr=cgiStr+"&pOe="+pOeValor;
    cgiStr=cgiStr+"&CATRIBU="+CATRIBU;
    var t_ioks=true;

  	//var names=new Array();
  	//var values=new Array();
  	//names[0]="CIDIOMAS"; values[0]=CIDIOMAS
  	//names[1]="pOe"; values[1]=pOeValor
  	//names[2]="CATRIBU"; values[2]=CATRIBU

<%
for (int i=1;i<15;i++) {
%>
    if (document.getElementById("c_t<%=i%>")!=undefined && document.getElementById("c_t<%=i%>").checked) {
        if (CIDIOMAS.length>0) CIDIOMAS=CIDIOMAS+",";
        CIDIOMAS=CIDIOMAS+"<%=i%>"; 
        cgiStr=cgiStr+"&t_<%=i%>="+ escape(trim(document.getElementById("t_<%=i%>").value)) ;
        // if ( trim(document.getElementById("t_<%=i%>").value).length==0 ) t_ioks=false;
		  	//names[names.length]="t_<%=i%>"; values[values.length]=trim(document.getElementById("t_<%=i%>").value);
    }
<%
}
%>

    cgiStr=cgiStr+"&CIDIOMAS="+CIDIOMAS
 
    if (CIDIOMAS.length>0 && t_ioks) {
    	var conf=true;
    	if (pOeValor=="EJECUTAR") {
    		conf=confirm("Está apunta de ejecutar los INSERTs contra la BBDD. Quiere continuar?");
    	}

	    if (conf){
             objAjax.invokeAsyncCGI("axis_axislit001.do?"+cgiStr, remontarcallback, "operation=remontar", this, objJsMessages.jslit_actualizando_registro);
            }//invokeAsyncCGI("remontar.jsp?"+cgiStr, remontarcallback, "GET", null, null, null)
    }
    if (CIDIOMAS.length==0) {
    		document.getElementById("sqlmontado").value="";
  	}
        
          alert("fi func");  
        
}

var maxshow=200
function hitmecallback(responseText) {
    pulso("OFF")
    var trimmedText=trim(responseText)


		if (trimmedText.indexOf("<html>")==0) {
			alert(trimmedText)
		}
		else {

	    var response = parseResponseIntoJSONObject(trimmedText) //eval("(" + responseText + ")");


	    document.getElementById("resultats").options.length=0
	    if (response.resultats.length>0) {
	        var i=0;
	        var oT=""
	        var tT=""
	        for (i=0;i<response.resultats.length;i++) {
	            if (i>maxshow) break;
	            oT=response.resultats[i].SLITERA
	            tT=response.resultats[i].TLITERA
	            MiOption = new Option(tT, oT);
	            document.getElementById("resultats").options[document.getElementById("resultats").options.length]=MiOption
	        }
	    }
	    document.getElementById("meta").innerHTML=""+document.getElementById("resultats").options.length+" de "+response.size
		}
    
}

function parseResponseIntoJSONObject(jsonText) {
    var myObject = JSON.parse(jsonText);
    return myObject.JSON2;
}

function remontarcallback(responseText) {
    pulso("OFF")
    var trimmedText=trim(responseText)
    //alert(trimmedText)
    var response = JSON.parse(trimmedText) //eval("(" + responseText + ")");
    if (response.sql!=undefined && response.sql.length>0) {
        var d="";
        for (i=0;i<response.sql.length;i++) {
        	d=d+response.sql[i]+";\n";
        }
        document.getElementById("sqlmontado").value=d
    }
    
}

function trim(str) {
  var newstr;
  newstr = str.replace(/^\s*/, "").replace(/\s*$/, ""); 
  newstr = newstr.replace(/\s{2,}/, " "); 
  return newstr;
} 

function invokeAsyncCGI (strURL, callback, metodo, names, values, qs) {
    //alert(strURL+";"+ names+" "+values+" "+qs)
    pulso("ON")

    var xmlHttpReq = false;
    var self = this;
    // Mozilla/Safari
    if (window.XMLHttpRequest) {
        self.xmlHttpReq = new XMLHttpRequest();
    }
    // IE
    else if (window.ActiveXObject) {
        self.xmlHttpReq = new ActiveXObject("Microsoft.XMLHTTP");
    }
    if (metodo=='GET') {
        self.xmlHttpReq.open('POST', strURL, true);
        self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        self.xmlHttpReq.onreadystatechange = function() {
            if (self.xmlHttpReq.readyState==1) {
                // capaContenedora.innerHTML="Cargando.......";
            }
            if (self.xmlHttpReq.readyState == 4) {
                callback(self.xmlHttpReq.responseText);
            }
        }
        self.xmlHttpReq.send(null);
    }
    if (metodo=='POST') {
        self.xmlHttpReq.open('POST', strURL, true);
        self.xmlHttpReq.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
        self.xmlHttpReq.onreadystatechange = function() {
            if (self.xmlHttpReq.readyState==1) {
                // capaContenedora.innerHTML="Cargando.......";
            }
            if (self.xmlHttpReq.readyState == 4) {
                callback(self.xmlHttpReq.responseText);
            }
        }
        self.xmlHttpReq.send(qs);
    }
    return;
}

function marcartexto() {
    document.getElementById("sqlmontado").select(); 
    document.getElementById("sqlmontado").focus();
}

function f_but_copiar() {
    marcartexto();
    if ((navigator.appName=="Microsoft Internet Explorer")&&(parseInt(navigator.appVersion)>=4)) {
        var textRange = document.getElementById("sqlmontado").createTextRange();
        textRange.execCommand("RemoveFormat");
        textRange.execCommand("Copy");
    } 
    else {
        alert("Copiar solo funciona con el IE4+. Usuarios de FireFox, Mozilla, Safari etc. deben copiar explicitamente (Ctrl-C).")
    }
}


function f_but_guardar(){
if (objValidador.validaEntrada()){
    objUtiles.ejecutarFormulario ("axis_axislit001.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
}

}

</script>
    </head>
    <body>
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
  
  <form name="miForm" action="" method="POST">
  <input type="hidden" name="operation" id="operation"/>
  <input type="hidden" name="idRequest" id="idRequest" value = "LITERALES"/>
      


   <br />
<!-- Area de campos  -->
<table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
<tr><td>

<table>
<tr>

<td>
<div class="titulo"><img src="images/flecha.gif"/><axis:alt c="TIT_LIT" f="axislit001" lit="102089"/> <%--img src="images/ayuda.gif" onclick="ayuda('CREAR')" style="cursor:help" /--%></div>

<table class="seccion" align="center">
    <tr>
    <td>
    <br />
    <table class="area" align="center">
    <tr>
        <td style="width:15%"></td>
        <td style="width:85%"></td>
    </tr>
<c:forEach var="i" items="${__formdata.listValores.lstIdiomas}">
    <tr>
        <td class="titulocaja"><%--${i.CIDIOMA} - --%><b>${i.TIDIOMA}</b>  </td>
        <td class="campocaja"> <input  class="campowidthinput campo campotexto"  title="<axis:alt f="axislist002" c="TIDIOMA_${i.CIDIOMA}"  lit="${i.TIDIOMA}"/>"
 obligatorio="true" type="text" id="TIDIOMA_${i.CIDIOMA}" name="TIDIOMA_${i.CIDIOMA}" style="width:80%"  /></td>
    </tr>
</c:forEach>
</table>
</td>
</tr>
</table>
<br />
</td>
</tr>
</table>



</td></tr>
</table>
</form>
    

<c:import url="../include/botonera_nt.jsp">
   <c:param name="f">axislit001</c:param>
   <c:param name="__botones"><axis:visible f="axislit001" c = "BT_SALIR">salir</axis:visible><axis:visible f="axislit001" c = "BT_GUARDAR">,guardar</axis:visible></c:param>
</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


