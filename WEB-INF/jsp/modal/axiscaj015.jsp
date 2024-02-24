<%/*
*  Fichero: axiscaj015.jsp
*
*  Fecha: 29/06/2009
*/
%>
<%@ page contentType="text/html;charset=windows-1252" errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>


<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
    <link type="text/css" href="styles/jquery.jscrollpane.css" rel="stylesheet" media="only screen and (min-device-width: 768px) and (max-device-width: 1024px)" />
    <link rel="stylesheet" type="text/css" media="all" href="styles/calendar-green.css" title="green" />
    <script type="text/javascript" src="scripts/calendar.js"></script>    
    <script type="text/javascript" src="scripts/calendar-${sessionScope.__locale}.js"></script>
    <script type="text/javascript" src="scripts/calendar-setup.js"></script>           
    <style type="text/css" id="page-css"> </style>
    <c:import url="../include/carga_framework_js.jsp" />
    <script language="Javascript" type="text/javascript">
    
    
     function f_onload() {
       f_cargar_propiedades_pantalla(); 
          var guardat = "${__formdata.guardar}";
            if ((!objUtiles.estaVacio(guardat))&&(guardat=="0")){
             f_but_cancelar(); 
              alert("<axis:alt f="axiscaj015" c="RECIBO" lit="103887"/>");   
              
                }
         }
        
        
    
    function f_cerrar_axiscaj015(){
        objUtiles.cerrarModal("axiscaj015");
    }
    
    function f_cambiar_saldo(){
            if($("#SMONPAG").val()!=0){
                $("#SMONPAG").val((parseFloat($("#IMOVIMI").val()) + parseFloat($("#IMOVDIF").val())) - parseFloat($("#MONPAG").val()));
            }
        }
    
    function f_cambiar(){
        f_cargar_propiedades_pantalla();
    }
        
              
       function f_onchangeIMOVDIF(){
            if (objUtiles.estaVacio($("#IMOVDIF").val())){
            $("#IMOVDIF").val(0);
            }
            if (!objUtiles.estaVacio($("#IMOVIMI").val()) && !objUtiles.estaVacio($("#MONPAG").val())){
            $("#SMONPAG").val((parseFloat($("#IMOVIMI").val()) + parseFloat($("#IMOVDIF").val())) - parseFloat($("#MONPAG").val()));
            }
       }
        
        var monto_pagar = 0;
          function f_onclickCheckRebut(input){
            
            if (input.checked){
                if ($("#IMOVIMI").val()==0){
                    alert("Debe ingresar el importe a pagar");
                    input.checked = false;
                    return false;
                }
                var reciboac = input.name;
                reciboac = reciboac.split(",");
                var idpoliza= parseFloat(reciboac[0]);
                var idrecibo = parseFloat(reciboac[1]);
                var exrecibosant = false;
                var diferencial=0;
                $(".LISTADORECIBOS:checkbox").each(function(){
                    var reciboactual =  (this).name;
                    reciboactual = reciboactual.split(",");
                    var idpolizaac = parseFloat(reciboactual[0]);
                    var idreciboac = parseFloat(reciboactual[1]);
                    if ((idpolizaac == idpoliza) && (idreciboac < idrecibo) && (this.checked == false)){
                        input.checked = false;
                        exrecibosant = true;
                        alert("Existen recibos anteriores impagos, por favor seleccione antes");
                        return false;                    
                    }
                });
                
                if(exrecibosant){
                    return false;
                }
                
                    monto_pagar+=parseFloat(input.value);
                if(parseFloat(monto_pagar) > (parseFloat($("#IMOVIMI").val())+parseFloat($("#IMOVDIF").val()))){
                    alert("El monto del recibo seleccionado supera el importe a pagar ingresado");
                    input.checked = false;
                    monto_pagar-=parseFloat(input.value);
                    return false;
                }
                    $("#MONPAG").val(monto_pagar);
                diferencia = (parseFloat($("#IMOVIMI").val()) + parseFloat($("#IMOVDIF").val())) - parseFloat($("#MONPAG").val());
                $("#SMONPAG").val(diferencia);
            }else {
                monto_pagar -= parseFloat(input.value);
                $("#MONPAG").val(monto_pagar);
                diferencia = (parseFloat($("#IMOVIMI").val()) + parseFloat($("#IMOVDIF").val())) + parseFloat($("#MONPAG").val());
                $("#SMONPAG").val(diferencia);
            }
                
        }
        
        function f_but_cancelar() {
            parent.f_cerrar_modal('axiscaj015');                      
        }           
        
        function f_but_aceptar(){
            if (!objValidador.validaEntrada()) {
                    return false;
                }
                var recibos = "";
                $(".LISTADORECIBOS:checkbox:checked").each(function(){                   
                    recibos += (this).id+"+";
                });
                if(recibos != ""){
                    if(parseFloat($("#SMONPAG").val())!=0){
                        alert("El campo Importe pendiente de asignar debe ser 0");
                    }else{
                        recibos = recibos.substring(0, recibos.length-1);
                        $("#LSTRECIBOSINS").val(recibos);
                        //objUtiles.ejecutarFormulario("modal_axiscaj015.do", "ins_pago_recibos", document.miForm, "_self", objJsMessages.jslit_cargando);
                        
                        $.ajax({ //Comunicación jQuery hacia Strut
                           type: "POST",
                           url: "modal_axiscaj015.do",
                           data: {
                               operation:"m_ajax_ins_pago_recibos",
                               SPERSON:$("#SPERSON").val(),
                               IAUTOLIQ:$("#IAUTOLIQ").val(),
                               IPAGSIN:$("#IPAGSIN").val(),
                               IMOVIMI:$("#IMOVIMI").val(),
                               moneda:$("#moneda").val(),
                               CMETMOV:$("#CMETMOV").val(),
                               FICHEROS:$("#FICHEROS").val(),
                               NCHEQUE:$("#NCHEQUE").val(),
                               CCHQORI:$("#CCHQORI").val(),
                               CBANTRANS:$("#CBANTRANS").val(),
                               CCC:$("#CCC").val(),
                               FEMISIO:$("#FEMISIO").val(),
                               IMOVDIF:$("#IMOVDIF").val(),
                               LSTRECIBOSINS:$("#LSTRECIBOSINS").val(),
                                // Bug 0032660/0190245 - 12/11/2014 - JMF
                                CAUTORIZA:$("#CAUTORIZA").val(),                            
                                NULTDIGTAR:$("#NULTDIGTAR").val(),                            
                                NCUOTAS:$("#NCUOTAS").val(),                            
                                CCOMERCIO:$("#CCOMERCIO").val()                           
                           },
                           dataType: "html",
                           success: function(ajaxResponseText){
                               callbackAjaxInsPagoInicial(ajaxResponseText);
                           },
                           error: function(xml,msg){
                               alert("error: "+ xml +"\n\n msg:" +msg );
                           }
                        });
                    }
                }else{
                    alert("Debe Seleccionar al menos un recibo");
                }
        }
        
        function callbackAjaxInsPagoInicial(ajaxResponseText){
            var doc = objAjax.domParse(ajaxResponseText); 
            var elementos = doc.getElementsByTagName("PSEQCAJA");
            
            if ((elementos != null) && (elementos.length > 0)){
                var SEQCAJA = objDom.getValorNodoDelComponente(elementos, 0, 0);
                objDom.setValorPorId("SEQCAJA", SEQCAJA);
                
                if (!objUtiles.estaVacio(objDom.getValorPorId("SEQCAJA"))){
					<c:if test="${__configform.axiscaj015__IMPR_REC__visible== 'true'}">
						objUtiles.abrirModal("axisimprimir", "src", "modal_axisimprimir.do?dt=<%=new java.util.Date().getTime()%>&operation=impresion_proceso&SPROCES=" + SEQCAJA + "&CTIPO=COMP_REC", 0, 0);
					</c:if>
					<c:if test="${__configform.axiscaj015__IMPR_REC__visible!= 'true'}">
						parent.f_cerrar_axiscaj015();
						alert("<axis:alt f="axiscaj015" c="RECIBO" lit="103887"/>");
					</c:if>
                } else {
                    alert ("Error ");
                }
            }else {
                var error = doc.getElementsByTagName("TERROR");
                var dserror = objDom.getValorNodoDelComponente(error, 0, 0).split(":");
                alert (dserror[1]);
            }
        }
        
        function f_cerrar_axisimprimir() {
            f_limpiarForm();
            objUtiles.cerrarModal("axisimprimir");
            parent.f_cerrar_axiscaj015();
            alert("<axis:alt f="axiscaj015" c="RECIBO" lit="103887"/>"); 
        }
        
        function f_limpiarForm(){
            objDom.setValorPorId("SPERSON","");
            objDom.setValorPorId("IAUTOLIQ","");
            objDom.setValorPorId("IPAGSIN","");
            objDom.setValorPorId("IMOVIMI","");
            objDom.setValorPorId("moneda","");
            objDom.setValorPorId("CMETMOV","");
            objDom.setValorPorId("FICHEROS","");
            objDom.setValorPorId("NCHEQUE","");
            objDom.setValorPorId("CCHQORI","");
            objDom.setValorPorId("CBANTRANS","");
            objDom.setValorPorId("CCC","");
            objDom.setValorPorId("FEMISIO","");
            objDom.setValorPorId("IMOVDIF","");
            objDom.setValorPorId("LSTRECIBOSINS","");
            // Bug 0032660/0190245 - 12/11/2014 - JMF
            objDom.setValorPorId("CAUTORIZA","");
            objDom.setValorPorId("NULTDIGTAR","");
            objDom.setValorPorId("NCUOTAS","");
            objDom.setValorPorId("CCOMERCIO","");
        }
        
        function  f_abrir_axisper008_caj015() {
            objUtiles.abrirModal("axisper008", "src", "modal_axisper008.do?operation=form&faceptar=f_aceptar_mtn_axisper008_caj015&ORIGEN=AXISCAJ015" );
        }
        function f_aceptar_mtn_axisper008_caj015 (selectedPerson,selectedAgent){
            obtenerPersona2(selectedPerson, selectedAgent); 
            
            f_cerrar_axisper008();
        }        
        function f_cerrar_axisper008(){
            objUtiles.cerrarModal("axisper008");
        }
        function obtenerPersona2(selectedPerson, selectedAgent){
            objAjax.invokeAsyncCGI("modal_axiscaj015.do?", callbackAjaxObtenerPersona, "operation=ajax_obtener_persona&SPERSON="+selectedPerson+
                                "&CAGENTE="+selectedAgent, this, objJsMessages.jslit_cargando);
            objDom.setValorPorId ("SPERSON", selectedPerson);
            
        }
        function callbackAjaxObtenerPersona(ajaxResponseText){
      var NNUMIDE = "";
      var NOMBRE ="";
      var TDIGITOIDE="";
      var result="";
        if (window.DOMParser)
        {
                  doc = objAjax.domParse(ajaxResponseText);
                  try{
                   //NNUMIDE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("NNUMIDE"), 0, 0);
                        result = doc.evaluate('/ajax/__node/OBPERSONA/__node/NNUMIDE', doc, null, XPathResult.STRING_TYPE, null);
                        NNUMIDE=  result.stringValue;
                  }catch(e){}
                  
                  try{
                   //NOMBRE = objDom.getValorNodoDelComponente(doc.getElementsByTagName("TNOMBRE"), 0, 0);
                        result = doc.evaluate('/ajax/__node/OBPERSONA/__node/TNOMBRE', doc, null, XPathResult.STRING_TYPE, null);
                        NOMBRE = result.stringValue;
                        }catch(e){}
                  try{
                   //NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI1"), 0, 0);
                  result = doc.evaluate('/ajax/__node/OBPERSONA/__node/TAPELLI1', doc, null, XPathResult.STRING_TYPE, null);
                       NOMBRE+=" " +result.stringValue;
                        }catch(e){}
                  try{
                  // NOMBRE +=" " + objDom.getValorNodoDelComponente(doc.getElementsByTagName("TAPELLI2"), 0, 0);
                  result = doc.evaluate('/ajax/__node/OBPERSONA/__node/TAPELLI2', doc, null, XPathResult.STRING_TYPE, null);
                        NOMBRE+=" " +result.stringValue;
                        }catch(e){}
        }
        else 
        {
             try {
                    doc = new ActiveXObject("Microsoft.XMLDOM");
                    doc.async = "false";
                    doc.loadXML(ajaxResponseText);
                 } catch (e) {
                   try {
                        parser = new DOMParser();
                        doc = parser.parseFromString(ajaxResponseText, "text/xml");
                        } catch (e) {
                            alert(e.message);
                            return;
                        }
                    }

          if(doc != null){
            var _node1_tag = doc.getElementsByTagName("ajax")[0].getElementsByTagName("__node");
            for(var x = 0; x <= _node1_tag[0].childNodes.length; x++){
                if(_node1_tag[0].childNodes[x].nodeName == "OBPERSONA"){
                    _obpersona2 = _node1_tag[0].childNodes[x];
                    break;
                }
            }
            if(_obpersona2 != null && _obpersona2.nodeName == "OBPERSONA"){
                var _node2 = _obpersona2.childNodes[0];
                for(var j=0; j<_node2.childNodes.length; j++){
                    if(_node2.childNodes[j].tagName == "NNUMIDE"){
                        var _nnumide = _node2.childNodes[j];
                        if(_nnumide != null && _nnumide.childNodes[0] && _nnumide.childNodes[0].nodeValue){
                            NNUMIDE = _nnumide.childNodes[0].nodeValue;
                            
                        }
                    }
                    if(_node2.childNodes[j].tagName == "TNOMBRE"){
                        var _tnombre = _node2.childNodes[j];
                        if(_tnombre != null && _tnombre.childNodes[0] && _tnombre.childNodes[0].nodeValue){
                            NOMBRE = _tnombre.childNodes[0].nodeValue;
                            
                        }
                    }
                    if(_node2.childNodes[j].tagName == "TAPELLI1"){
                        var _tapelli1 = _node2.childNodes[j];
                        if(_tapelli1 != null && _tapelli1.childNodes[0] && _tapelli1.childNodes[0].nodeValue){
                            NOMBRE +=" "+ _tapelli1.childNodes[0].nodeValue;
                        }
                    }
                    if(_node2.childNodes[j].tagName == "TAPELLI2"){
                        var _tapelli2 = _node2.childNodes[j];
                        if(_tapelli2 != null && _tapelli2.childNodes[0] && _tapelli2.childNodes[0].nodeValue){
                            NOMBRE +=" "+ _tapelli2.childNodes[0].nodeValue;
                            
                        }
                    }
                 }
            
             }
          }
        }
      objDom.setValorPorId ("NNUMIDE2", objNumero.formateaNumeroPattern(  "#.###,#", NNUMIDE) + TDIGITOIDE);
      objDom.setValorPorId ("TNOMBRE2", NOMBRE);
     }
        
    </script>
    
  </head>
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import>
    <form name="miForm" action="" method="POST">
        <c:import url="../include/modal_estandar.jsp">
                <c:param name="titulo"><axis:alt f="axiscaj015" c="TITULO" lit="9906272" /></c:param>
                <c:param name="producto"><axis:alt c="form" f="axiscaj015" lit="9906272"/></c:param>
                <c:param name="nid" value="axiscaj015" />
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="nid_y_titulo">axisper008|<axis:alt f="axiscaj015" c="MODAL_AXISper008" lit="1000065" /></c:param>
        </c:import>
        <input type="hidden" name="operation" value=""/>  
        <input type="hidden" id="SPERSON"  name="SPERSON"  value="${__formdata.SPERSON}"/>
        <input type="hidden" id="FICHEROS" name="FICHEROS" value="${__formdata.FICHEROS}"/>
        <input type="hidden" id="CAGENTE" name="CAGENTE_BUSCAR" value="${__formdata.CAGENTE}"/>
        <input type="hidden" id="CAGENTE_BUSCAR" name="CAGENTE_BUSCAR" value="${__formdata.CAGENTE_BUSCAR}"/>
        <input type="hidden" id="CLIQUIDOAL" name="CLIQUIDOAL" value="${__formdata.CLIQUIDO}"/>
        <input type="hidden" id="moneda" name="moneda" value="${__formdata.moneda}"/>
        <input type="hidden" id="FEMISIO" name="FEMISIO" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FEMISIO}"/>"/>
        <input type="hidden" id="LSTRECIBOSINS" name="LSTRECIBOSINS" value=""/>
        <input type="hidden" id="SEQCAJA" name="SEQCAJA" value="${__formdata.SEQCAJA}"/>
        <c:import url="../include/titulo_nt.jsp">
           <c:param name="formulario"><axis:alt c="formulario" f="axiscaj015" lit="9906272" /></c:param>
           <c:param name="form">axiscaj015</c:param>           
        </c:import>
        <c:import url="../include/modal_estandar.jsp">
            <c:param name="titulo"><axis:alt f="axiscaj002" c="TITULOIMPRIMIR" lit="1000205" /></c:param>
            <c:param name="nid" value="axisimprimir"></c:param>
        </c:import>        
        <div class="separador">&nbsp;</div>        
        <!-- Area de campos  -->
        <table class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0" style="height:10px;">
        
            <tr>
                <td>
                     <div class="separador">&nbsp;</div>
                     <table class="seccion" align="center" cellpadding="0" cellspacing="0">
                          <tr>
                               <td align="left" >                                    
                                    <table>
                                        <tr>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>
                                            <th style="width:25%;height:0px"></th>                                
                                            <th style="width:25%;height:0px"></th>   
                                        </tr>
                                        <tr>
                                            <td class="titulocaja"  id="tit_CMETMOV">
                                               <b id="label_CMETMOV" ><axis:alt f="axiscaj015" c="CMETMOV" lit="9902938"/></b>
                                            </td>                               
                                        </tr>
                                        <tr>
                                            <td class="campocaja"  id = "td_CMETMOV">
                                                <select name="CMETMOV" id="CMETMOV" size="1" class="campowidthselect campo campotexto_ob" style="width:84%;" 
                                                        title="<axis:alt f="axiscaj015" c="CMETMOV" lit="9902938"/>" onchange="f_cambiar();"
                                                    <axis:atr f="axiscaj015" c="CMETMOV" a="obligatorio=true&isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        <axis:alt f="axiscaj015" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="medio_mov" items="${__formdata.FORMAPAGO}">
                                                        <option value="${medio_mov.CATRIBU}"
                                                        <c:if test="${__formdata.CMETMOV == medio_mov.CATRIBU}">selected</c:if>>
                                                        ${medio_mov.TATRIBU}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <td class="titulocaja"  id="tit_NCHEQUE">
                                                <b id="label_NCHEQUE" ><axis:alt f="axiscaj015" c="NCHEQUE" lit="9905071"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_CCHQORI">
                                               <b id="label_CCHQORI"><axis:alt f="axiscaj015" c="CCHQORI" lit="9905072"/></b>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja" id = "td_NCHEQUE">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCHEQUE}" name="NCHEQUE" id="NCHEQUE" 
                                                      <axis:atr f="axiscaj015" c="NCHEQUE" a="obligatorio=true"/> 
                                                       onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                                       title="<axis:alt f="axiscaj015" c="NCHEQUE" lit="9905071"/>" size="20" maxlength="20" />
                                            </td>
                                            <td class="campocaja" id = "td_CCHQORI">
                                                <select name="CCHQORI" id="CCHQORI" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                                    title="<axis:alt f="axiscaj015" c="CCHQORI" lit="9905072"/>"
                                                    <axis:atr f="axiscaj015" c="CCHQORI" a="obligatorio=true&isInputText=false"/> >
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        <axis:alt f="axiscaj015" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="cheque_ori" items="${__formdata.BANCOS}">
                                                        <option value="${cheque_ori.CBANCO}"
                                                        <c:if test="${__formdata.CCHQORI == cheque_ori.CBANCO}">selected</c:if>>
                                                        ${cheque_ori.TBANCO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                       
                                        
                                        <tr>
                                            <td class="titulocaja"  id="tit_CBANTRANS">
                                               <b id="label_CBANTRANS"><axis:alt f="axiscaj015" c="CBANTRANS" lit="9000964"/></b>
                                            </td>
                                            <td class="titulocaja"  id="tit_CCC"> 
                                               <b id="label_CCC"><axis:alt f="axiscaj015" c="CCC" lit="9903154"/></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="campocaja" id = "td_CBANTRANS">
                                                <select name="CBANTRANS" id="CBANTRANS" size="1" class="campowidthselect campo campotexto" style="width:84%;;" 
                                                    title="<axis:alt f="axiscaj015" c="CBANTRANS" lit="9000964"/>"
                                                    <axis:atr f="axiscaj015" c="CBANTRANS" a="obligatorio=true&isInputText=false"/>>
                                                    <option value="<%= Integer.MIN_VALUE %>">
                                                        <axis:alt f="axiscaj015" c="SELECCIONAR" lit="108341"/>                                
                                                    </option>
                                                    <c:forEach var="bancos" items="${__formdata.BANCOS}">
                                                        <option value="${bancos.CBANCO}"
                                                        <c:if test="${__formdata.CBANTRANS == bancos.CBANCO}">selected</c:if>>
                                                        ${bancos.TBANCO}
                                                        </option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                            <td class="campocaja" id = "td_CCC">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCC}" name="CCC" id="CCC" 
                                                      <axis:atr f="axiscaj015" c="CCC" a="obligatorio=true"/> 
                                                      onchange="f_cleanInvalidChars(this.id)"  onkeyup="f_cleanInvalidChars(this.id)"
                                                     title="<axis:alt f="axiscaj015" c="CCC" lit="9903154"/>"  size="15" />
                                            </td>
                                        </tr>
                                        <!-- *************************** ini Bug 0032660/0190245 - 12/11/2014 - JMF ********************************* -->
                                        <tr>                                
                                            <td class="titulocaja"  id="tit_CAUTORIZA">
                                               <b id="label_CAUTORIZA" ><axis:alt f="axiscaj015" c="CAUTORIZA" lit="9907244"/></b>
                                            </td>
                                            <td class="titulocaja"  id="tit_NULTDIGTAR">
                                               <b id="label_NULTDIGTAR" ><axis:alt f="axiscaj015" c="NULTDIGTAR" lit="9907241"/></b>
                                            </td>
                                            <td class="titulocaja"  id="tit_NCUOTAS">
                                               <b id="label_NCUOTAS" ><axis:alt f="axiscaj015" c="NCUOTAS" lit="9907242"/></b>
                                            </td>
                                            <td class="titulocaja"  id="tit_CCOMERCIO">
                                               <b id="label_CCOMERCIO" ><axis:alt f="axiscaj015" c="CCOMERCIO" lit="9907243"/></b>
                                            </td>
                                        </tr>
                                        <tr>                                
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CAUTORIZA}" name="CAUTORIZA" id="CAUTORIZA" 
                                                    <axis:atr f="axiscaj015" c="CAUTORIZA" a="obligatorio=true&formato=decimal"/> 
                                                    title="<axis:alt f="axiscaj015" c="CAUTORIZA" lit="9907244"/>" size="15" />
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NULTDIGTAR}" name="NULTDIGTAR" id="NULTDIGTAR" 
                                                    <axis:atr f="axiscaj015" c="NULTDIGTAR" a="obligatorio=true&formato=decimal"/> 
                                                    title="<axis:alt f="axiscaj015" c="NULTDIGTAR" lit="9907241"/>" size="15" />
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.NCUOTAS}" name="NCUOTAS" id="NCUOTAS" 
                                                    <axis:atr f="axiscaj015" c="NCUOTAS" a="obligatorio=true&formato=decimal"/> 
                                                    title="<axis:alt f="axiscaj015" c="NCUOTAS" lit="9907242"/>" size="15" />
                                            </td>
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" value="${__formdata.CCOMERCIO}" name="CCOMERCIO" id="CCOMERCIO" 
                                                    <axis:atr f="axiscaj015" c="CCOMERCIO" a="obligatorio=true&formato=decimal"/> 
                                                    title="<axis:alt f="axiscaj015" c="CCOMERCIO" lit="9907243"/>" size="15" />
                                            </td>
                                        </tr>
                                        <!-- *************************** fin Bug 0032660/0190245 - 12/11/2014 - JMF ********************************* -->

                                        <tr>
                                            <td class="titulocaja">
                                               <b><axis:alt f="axiscaj015" c="IMOVIMI" lit="9000475"/></b>
                                            </td>
                                            <axis:ocultar f="axiscaj015" c="IMOVDIF" dejarHueco="false">
                                            <td class="titulocaja">
                                               <b><axis:alt f="axiscaj015" c="IMOVDIF" lit="9907005"/></b>
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                            <td class="campocaja">

                                                <input type="text" class="campowidthinput campo campotexto" name="IMOVIMI" id="IMOVIMI" onchange = "f_cambiar_saldo();"
                                                    title="<axis:alt f="axiscaj001" c="IMOVIMI" lit="9000475"/>"
                                                    <axis:atr f="axiscaj015" c="IMOVIMI" a="obligatorio=true&formato=decimal"/> 
                                                     formato="decimal"
                                                   size="15" 
                                                   value="<fmt:formatNumber pattern="${__formatNumberPatterns[__defaultCMONINT]}" value="${__formdata.IMOVIMI}"/>"
                                               />
                                            </td>
                                            <axis:ocultar f="axiscaj015" c="IMOVDIF" dejarHueco="false">
                                            <td class="campocaja">
                                                <input type="text" class="campowidthinput campo campotexto" size="15" value="<c:if test="${empty __formdata.IMOVDIF}">0</c:if><c:if test="${not empty __formdata.IMOVDIF}">${__formdata.IMOVDIF}</c:if>" name="IMOVDIF" id="IMOVDIF"
                                                        onchange="javascript:f_onchangeIMOVDIF();" style="width:91%;" title="<axis:alt f="axiscaj015" c="IMOVDIF" lit="9907005"/>"
                                                         />
                                            </td>
                                            </axis:ocultar>
                                        </tr>
                                    </table>
                               </td>
                          </tr>
                     </table>
                </td>
            </tr>
            
            
            <tr>
                    <td>
                         <div class="separador">&nbsp;</div>
                         <table class="seccion" align="center" cellpadding="0" cellspacing="0">
                              <tr>
                                   <td align="left" >
                                        <table class="area" align="center">
                                                <tr>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>
                                                    <th style="width:25%;height:0px"></th>                                
                                                    <th style="width:25%;height:0px"></th>   
                                                </tr>                                                       
                                                <tr>
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axiscaj015" c="NNUMIDE2" lit="9903158"/></b> <%-- Nº identificatiu --%>
                                                    </td>                             
                                                    <td class="titulocaja" colspan="3">
                                                        <b><axis:alt f="axiscaj015" c="TNOMBRE2" lit="1000560"/> <axis:alt f="axiscaj015" c="TNOMBRE2" lit="105940"/></b> <%-- Cognoms Nom --%>
                                                    </td>
                                                </tr>
                                            <tr>
                                                <td class="campocaja">                             
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE2}" name="NNUMIDE2" id="NNUMIDE2" 
                                                    <axis:atr f="axiscaj015" c="NNUMIDE2" a="obligatorio=true"/>" style="width:50%;"
                                                    title="<axis:alt f="axiscaj015" c="NNUMIDE2" lit="9903158"/>" />                                                            
                                                </td>
                                                <td class="campocaja" colspan="3">                             
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE2}" name="TNOMBRE2" id="TNOMBRE2" 
                                                    <axis:atr f="axiscaj015" c="TNOMBRE2" a="obligatorio=true" /> "  style="width:80%;"
                                                    title="<axis:alt f="axiscaj015" c="NNUMIDE2" lit="1000560"/>" />
                                                            &nbsp;<img border="0" src="images/find.gif" onclick="f_abrir_axisper008_caj015()" style="cursor:pointer"/>
                                                </td>
                                            </tr>
                                        </table>
                                   </td>
                              </tr>
                         </table>
                    </td>
               </tr>
        
        
            
        <%--Nova secció resultat de la recerca --%> <!-- pago de recibos -->
        
          <tr>
           <td>
            <div class="separador">&nbsp;</div>
              <table class="seccion" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><b><axis:alt f="axiscaj015" c="CAMPO008" lit="1000343"/>&nbsp; </b>                            
                        </div>
                        <div class="separador">&nbsp;</div>
                        
                        <c:set var="title0"><axis:alt f="axiscaj015" c="NUMERO" lit="800440"/></c:set>   <%-- Nº --%>
                        <c:set var="title1"><axis:alt f="axiscaj015" c="NPOLIZA" lit="9001639"/></c:set>  <%-- Poliza --%>
                        <c:set var="title2"><axis:alt f="axiscaj015" c="PRODUCTO" lit="100829"/></c:set>   <%-- Producte --%>
                        <c:set var="title3"><axis:alt f="axiscaj015" c="TOTAL_REB" lit="100563"/> </c:set>   <%-- Total rebut --%>
                        <c:set var="title4"><axis:alt f="axiscaj015" c="FEFECTE" lit="100883"/></c:set>   <%-- Data efecte --%>
                        <c:set var="title5"><axis:alt f="axiscaj015" c="FVENCIMIENTO" lit="100885"/></c:set>   <%-- Data venciment --%>
                        <c:set var="title6"><axis:alt f="axiscaj015" c="FEMISIO" lit="1000562"/></c:set>  <%-- Data emissió --%>
                        <c:set var="title7"><axis:alt f="axiscaj015" c="TREBUT" lit="9902656"/></c:set>  <%-- Total rebut --%>
                        <c:set var="title9"><axis:alt f="axiscaj015" c="TIPOREBUT" lit="102302"/></c:set>   <%-- Tipo de rebut --%>
                        <c:set var="title8"><axis:alt f="axiscaj015" c="ESTREBUT" lit="1000553"/></c:set> <%-- Estat rebut --%>
                        <c:set var="title9"><axis:alt f="axiscaj015" c="TIPOPREC" lit="9902181"/></c:set> <%-- Tipo Precio --%>
                          <c:set var="title10"><axis:alt f="axiscaj015" c="NCERTIFIC" lit="9902911"/></c:set> <%-- certificado --%>
                          <c:set var="title11"><axis:alt f="axiscaj015" c="PAGADOR" lit="9903157"/></c:set> <%-- pagador --%>
                          <c:set var="title12"><axis:alt f="axiscaj015" c="NCOMPANI" lit="9002152"/></c:set> <%-- importe pendiente --%>
                         

                        
                        <div id="dt_recibos" class="seccion displayspace">
                            <display:table name="${__formdata.LSTRECIBOS}" id="LSTRECIBOS" export="false" class="dsptgtable" pagesize="-1" defaultsort="2" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0" 
                                 requestURI="modal_axiscaj015.do?paginar=true">
                                <%@ include file="../include/displaytag.jsp"%>
                                <display:column title="${title13}" sortable="false" headerClass="sortable headwidth5 fixed"  media="html" autolink="false">
                                    <div class="dspNumber">
                                        <input type="checkbox" name="${LSTRECIBOS.NPOLIZA},${LSTRECIBOS.NRECIBO}" id="${LSTRECIBOS.NRECIBO}_${LSTRECIBOS.DIV_PROD}_${LSTRECIBOS.SPRODUC}_${LSTRECIBOS.SSEGURO}" value="${LSTRECIBOS.IMPORTE_PDTE_MONEMP}" onclick="f_onclickCheckRebut(this)" class="LISTADORECIBOS"/>
                                             
                                             </div>
                                </display:column>
                                <display:column title="${title0}" sortable="true" sortProperty="NRECIBO" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspNumber">                                        
                                            ${LSTRECIBOS.NRECIBO}
                                   </div>
                                </display:column>
                                <display:column title="${title11}" sortable="true" sortProperty="NOM_PAGADOR" headerClass="sortable fixed"  media="html" autolink="false" >
                                             <div class="dspText">                                             
                                                       ${LSTRECIBOS.NOM_PAGADOR}
                                         </div>                                
                                        </display:column>                            
                                <display:column title="${title1}" sortable="true" sortProperty="NPOLIZA" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                        ${LSTRECIBOS.NPOLIZA}
                                  </div>
                                </display:column>
                                
                                <display:column title="${title10}" sortable="true" sortProperty="NCERTIFIC" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">                                       
                                            ${LSTRECIBOS.NCERTIF}                                       
                                    </div>
                                </display:column>
                                
                                <display:column title="${title2}" sortable="true" sortProperty="TSPRODUC" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                            ${LSTRECIBOS.TSPRODUC}
                                    </div>
                                </display:column>
                                <display:column title="${title4}" sortable="true" sortProperty="FEFECTO" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                    <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEFECTO}"/>
                                   </div>
                                </display:column>
                                <display:column title="${title5}" sortable="true" sortProperty="FVENCIM" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">                                       
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FVENCIM}"/>
                                  </div>
                                </display:column>
                                <display:column title="${title6}" sortable="true" sortProperty="FEMISIO" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspNumber">                                      
                                            <fmt:formatDate pattern="dd/MM/yyyy" value="${LSTRECIBOS.FEMISIO}"/>
                                    </div>
                                </display:column>
                                <display:column title="${title3}" sortable="true" sortProperty="TOTAL_REB" headerClass="sortable fixed"  media="html" autolink="false" >
                                     <div class="dspNumber">
                                     <fmt:formatNumber pattern="${__formatNumberPatterns[LSTRECIBOS.DIV_PROD]}"    value="${LSTRECIBOS.TOTAL_REB}"/> </div>
                                 </display:column>
                                
                                
                                <display:column title="${title7}" sortable="true" sortProperty="TOT_REB_MONEMP" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">                                        
                                            ${LSTRECIBOS.TOT_REB_MONEMP}                                        
                                    </div>
                                </display:column>
                                        
                                <display:column title="${title8}" sortable="true" sortProperty="TESTREC" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">
                                    ${LSTRECIBOS.TESTREC}                                     
                                    </div>
                                </display:column>
                                        
                                <display:column title="${title9}" sortable="true" sortProperty="TTIPREC" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">                                       
                                            ${LSTRECIBOS.TTIPREC}                                        
                                    </div>
                                </display:column>
                                <display:column title="${title12}" sortable="true" sortProperty="IMPORTE_PDTE" style="width:10%" headerClass="sortable fixed"  media="html" autolink="false" >
                                    <div class="dspText">                                     
                                            ${LSTRECIBOS.IMPORTE_PDTE_MONEMP}                                     
                                    </div>
                                </display:column>                                                                           
                                
                            </display:table>
                            
                        </div>
                    </td>
                </tr>
            </table>              
       </td>
      </tr>
                      
          <!-- fin tabla pago de recibos -->
      <tr>
        <td>
            <div class="separador">&nbsp;</div>
            <table class="seccion">
                <tr>
                    <th style="width:15%;height:0%;"/>
                    <th style="width:15%;height:0%;"/>
                    <th style="width:20%;height:0%;"/>
                    <th style="width:15%;height:0%;"/>
                    <th style="width:15%;height:0%;"/>
                    <th style="width:20%;height:0%;"/>
                </tr>
                <tr>
                     <td class="titulocaja">
                        <axis:alt f="axiscaj015" c="IMPASIGAL" lit="9905084"/><%-- Monto Seleccionado --%>                               
                    </td>
                           <td class="titulocaja">
                        <axis:alt f="axiscaj015" c="IMPPENDAL" lit="9905085"/><%-- Saldo --%>
                    </td>
                           
                </tr>
                <tr>
                     <td class="campocaja" >                             
                        <input type="text" class="campowidthinput campo campotexto" size="15" value="" name="MONPAG" id="MONPAG" 
                        style="width:70%;"  title="<axis:alt f="axiscaj015" c="MONPAG" lit="9905084"/>"
                        <axis:atr f="axiscaj015" c="MONPAG" a="formato=decimal"/> />
                        
                    </td>
                           <td class="campocaja">
                        <input type="text" class="campowidthinput campo campotexto" size="15" value="" name="SMONPAG" id="SMONPAG"
                        style="width:91%;" title="<axis:alt f="axiscaj015" c="SMONPAG" lit="9905085"/>"
                                <axis:atr f="axiscaj015" c="SMONPAG" a="formato=decimal"/> />
                           </td>
                           
                </tr>
            </table>
        </td>
    </tr>
          <!-- fin tabla pago de recibos -->     
        </table>    
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axiscaj015</c:param><c:param name="f">axiscaj015</c:param>
            <c:param name="__botones"><axis:ocultar f="axiscaj015" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axiscaj015" c="BT_ACEPTAR">,aceptar</axis:ocultar></c:param>
        </c:import>
    </form>
        
    <c:import url="../include/mensajes.jsp" />
   </body>
</html>