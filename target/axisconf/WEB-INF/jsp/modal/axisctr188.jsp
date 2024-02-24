

<%--
      NOMBRE:    axisctr188.jsp
      @author <a href = "mailto:xpastor@csi-ti.com">Xavi Pastor</a>
      Fecha: 07/05/2012
      PROPÓSITO (descripción pantalla):  Preguntas a nivel de tabla
  

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
        
        <!--Inicio Sólo si vamos a tener un campo fecha !-->
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
        <!-- fin Sólo si vamos a tener un campo fecha !-->
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                var ok = "${__formdata.ok}";
                
                
                if (!objUtiles.estaVacio(ok))
                     parent.f_cerrar_modal('axisctr188');
                
	 	f_cargar_propiedades_pantalla();
                f_tratarDisplayTagsPorConfiguracion();
	    }
            
            
           
           function f_but_aceptar() {
                if (objValidador.validaEntrada()){
                    if (f_valida_campos())   
                        objUtiles.ejecutarFormulario("modal_axisctr188.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                        else
                        alert("<axis:alt f="axisctr188" c="INCORRECTA" lit="1000150"/>");
                }
           }
           
           
        function f_valida_campos(){
            var checkboxs = document.getElementsByTagName("input");//mirem els checkbox
            var selects = document.getElementsByTagName("select");
           // var checkboxs = document.getElementsByTagName("checkbox");
           //alert(document.getElementById("COLUMNA_0#1").formatoespecial)
             for(var i=0;i<checkboxs.length;i++){
                if(checkboxs[i].attributes.length>0) {
                   var checkboxsId = checkboxs[i].getAttribute("id");
                    if(document.getElementsByTagName("input")[i].type == "text"){
                        if (!objUtiles.estaVacio(document.getElementsByTagName("input")[i].formatoespecial) && 
                        document.getElementsByTagName("input")[i].formatoespecial  == 1){
                            if ( objUtiles.estaVacio( validarNumeros(document.getElementsByTagName("input")[i].value)))
                                return false;
                        }
                     
                     }
                }
            }
            return true;
        }
        
          /*******************************************
                  Formateo Numeros
             ********************************************/
             function validarNumeros(IMPORT){
                 if (!objUtiles.estaVacio(IMPORT)){
                   /*  IMPORT = objValidador.valorFormateadoCampoNumerico(IMPORTE, true, true);
                     alert(IMPORT);*/
                     if(objNumero.validaNumero(IMPORT, true)){
                         return IMPORT;
                     }
                     else{
                         return   '';
                     }
                 }
                 else return IMPORTE;
             }
             
            function formateaNumeroCero(entrada, isDecimal){
                // es crida al reformateixador  ###.###,00
                var fnum=objNumero.formateaNumero(entrada,isDecimal);
                if(entrada.indexOf(objNumero.getSeparadorDecimales())<0){
                    fnum += objNumero.getSeparadorDecimales() + '00';
                }
                // si es tracta d'un 0 el converteix a 0,00
                if(fnum=='0') fnum += objNumero.getSeparadorDecimales() + '00';
                return fnum;
    
            }
             
            function f_formatear(thiss){
                thiss.value = validarNumeros(thiss.value);
            }
       
           
           
           function f_but_cancelar() {
             parent.f_cerrar_modal('axisctr188');
           }
        
        function anyadir_fila(){
             CPREGUN = document.getElementById("CPREGUN").value;
             CGARANT = document.getElementById("CGARANT").value;
             TIPO_PREGUNTA = document.getElementById("TIPO_PREGUNTA").value;
             objAjax.invokeAsyncCGI("modal_axisctr188.do?CPREGUN="+CPREGUN+"&TIPO_PREGUNTA="+TIPO_PREGUNTA+"&CGARANT="+CGARANT, anyadir_linea, "operation=ajax_rellenacabecera", this, objJsMessages.jslit_cargando);
        }
        
        function anyadir_linea(ajaxResponseText){    
         try {                
                var doc = objAjax.domParse(ajaxResponseText);
              //  alert(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){   
					 var CPREGUN = document.getElementById("CPREGUN").value;//bartolo
                     var numero_filas = obtenerNuevoIndice(); //Si el número de filas =3 la siguiente será 3  
					 
					 if(numero_filas > 0 && CPREGUN == "6581"){//bartolo
                    	 alert("Este producto solo permite 1 especialidad");//bartolo
                     }else{//bartolo
					 
                     var table_preguntab = document.getElementById("preguntab");     
                     // creamos la tr y la td
                     var mitr = document.createElement("tr");
                     //Comprovamos el color de la fila
                     if ((numero_filas % 2)==0){
                            mitr.classname ="";
                            mitr.setAttribute('class','gridNotEven');
                            mitr.className = "gridNotEven";            
                        }
                     else{
                            mitr.classname ="";
                            mitr.setAttribute('class','gridEven');
                            mitr.className = "gridEven";            
                        }                
                     //preparamos identificador de fila y lo cargamos   
                     var texto="fila_"+numero_filas;       
                     mitr.setAttribute('id',texto);
                     mitr.setAttribute('tipo','ri');
                     mitr.setAttribute('title',texto);
                
                
                
                      var elementos = doc.getElementsByTagName("OB_IAX_PREGUNTASTAB_COLUMNS");
                       for (indice = 0; indice < elementos.length; indice++) {

                            mitd = anyadir_linea_js(doc, indice, numero_filas,elementos.length);
           
                            mitr.appendChild(mitd);   
            

                        }
                        
                         <axis:visible f="axisctr188" c="ELIMINAR">
                        //Creamos TD para el sigo de eliminación de fila 
                        var imgtd=document.createElement("td");
                        imgtd.setAttribute('class','dspText');       
                        imgtd.className="dspText";
                        var ael = document.createElement("a");
                            var stringId = "eliminar_"+numero_filas;
                            ael.setAttribute('id',stringId);
                        var funcion_borrar = "javascript:borrar_fila_preguntab("+ numero_filas +")";
                            ael.setAttribute('href',funcion_borrar);
                        var imgel = document.createElement("img");
                            imgel.setAttribute('border','0');
                            imgel.setAttribute('src','images/delete.gif');
                            ael.appendChild(imgel);        
                         //Cargamos el icono eliminar en el TD     
                        imgtd.appendChild(ael);   
                          mitr.appendChild(imgtd);  
                        </axis:visible>
                        
                        table_preguntab.appendChild(mitr);    
                        revisarEstilos();
                    }//BARTOLO
				}
                
            } catch (e) {
               if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
        }
    function anyadir_linea_js(doc, indice, numero_filas,tamano){    
          
          try{
             var desctd=document.createElement("td");
            var ctipcol =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPCOL"), indice, 0);
            var TCOLUMN =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("TCOLUMNA"), indice, 0);
            var CCOLUMN =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("CCOLUMNA"), indice, 0);
            var CTIPDATO =  objDom.getValorNodoDelComponente(doc.getElementsByTagName("CTIPDATO"), indice, 0);
            try{
                var OB_IAX_PREGUNTASTAB_COLUMNS =  doc.getElementsByTagName("OB_IAX_PREGUNTASTAB_COLUMNS")[indice];
            }catch(e){}
            
            
            /*                                                                                <c:choose>
                                                                                    <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPDATO == 1}">
                                                                                       <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true&formato=entero"/>
                                                                                        value="<fmt:formatNumber pattern="###,##0" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR}"/>"
                                                                                    </c:when>
                                                                                      <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPDATO == 3}">
                                                                                        <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true"/>
                                                                                        formatoespecial = '1'
                                                                                        value="<fmt:formatNumber pattern="###,##0.######" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR}"/>"
                                                                                      </c:when>
                                                                                    <c:otherwise>
                                                                                        <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true&formato=decimal"/>
                                                                                        value="<fmt:formatNumber pattern="###,##0.00" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR}"/>"
                                                                                    </c:otherwise>
                                                                                </c:choose>
*/
            
            try{
            var OBLIGATORIO = objDom.getValorNodoDelComponente(doc.getElementsByTagName("COBLIGA"), indice, 0);
            }catch(e){var OBLIGATORIO= 0;}
            
            var anchura = eval(95/tamano);
             
            if (ctipcol == 1){
            
                                              
            
            
              desctd.setAttribute('class','campocaja');
              desctd.className="campocaja";
              desctd.style.width=anchura+"%";
              var descdiv=document.createElement("div");
              descdiv.setAttribute('class','dspNumber');
              descdiv.className="dspNumber";
              
              var descinput = document.createElement("input");
                  
                    //anyadir variables al input
                    var texto_desc=numero_filas+'-'+TCOLUMN;
                    descinput.setAttribute('id','COLUMNA_'+numero_filas+'#'+CCOLUMN);  
                    
                   if (!objUtiles.estaVacio(OBLIGATORIO) && OBLIGATORIO == 1){
                         descinput.setAttribute('obligatorio','true');  
                    }
                    descinput.setAttribute('class','campo campotexto'); 
                    descinput.className="campo campotexto";                    
                    descinput.setAttribute('title',texto_desc);
                    descinput.setAttribute('name','COLUMNA_'+numero_filas+'#'+CCOLUMN);
                    descinput.name='COLUMNA_'+numero_filas+'#'+CCOLUMN;
                    descinput.setAttribute('type','text');
                    descinput.type="text";
                    descinput.style.width="100%";
                    
                    if (objUtiles.estaVacio(CTIPDATO)){
                        descinput.setAttribute('formato','decimal');  
                    }else{
                        if (CTIPDATO==1)
                            descinput.setAttribute('formato','entero');  
                            else if (CTIPDATO==2)
                                descinput.setAttribute('formato','decimal');  
                                else if (CTIPDATO==3)
                                    descinput.setAttribute('formatoespecial','1');  
                            
                    
                    }
                    
                    
                    descdiv.appendChild(descinput);
                    desctd.appendChild(descdiv);  
                   
              }else if (ctipcol == 2){//texto
                    desctd.setAttribute('class','campocaja');
                    
                    desctd.className="campocaja";
                   desctd.style.width=anchura+"%";
                    var descdiv=document.createElement("div");
                    descdiv.setAttribute('class','dspText');
                    descdiv.className="dspText";
                    var descinput = document.createElement("input");
                    //anyadir variables al input
                    var texto_desc=numero_filas+'-'+TCOLUMN;
                    descinput.setAttribute('id','COLUMNA_'+numero_filas+'#'+CCOLUMN);  
                    
                   if (!objUtiles.estaVacio(OBLIGATORIO) && OBLIGATORIO == 1){
                         descinput.setAttribute('obligatorio','true');  
                    }
                    descinput.setAttribute('class','campo campotexto'); //Será obligatorio?
                    descinput.className="campo campotexto";                    
                    descinput.setAttribute('title',texto_desc);
                    descinput.setAttribute('name','COLUMNA_'+numero_filas+'#'+CCOLUMN);
                    descinput.name='COLUMNA_'+numero_filas+'#'+CCOLUMN;
                    descinput.setAttribute('type','text');
                    descinput.type="text";
                    descinput.style.width="100%";
                    
                    descdiv.appendChild(descinput);
                    desctd.appendChild(descdiv);  
              }else if (ctipcol == 3){//fecha               
                    desctd.setAttribute('class','campocaja');
                    desctd.className="campocaja";
                    desctd.style.width=anchura+"%";
                    var descdiv=document.createElement("div");
                    descdiv.setAttribute('class','dspText');
                    descdiv.className="dspText";
                    
                    
                    var descinput = document.createElement("input");
                    var texto_desc=numero_filas+'-'+TCOLUMN;
                    descinput.setAttribute('id','COLUMNA_'+numero_filas+'#'+CCOLUMN);  
                    
                   if (!objUtiles.estaVacio(OBLIGATORIO) && OBLIGATORIO == 1){
                         descinput.setAttribute('obligatorio','true');  
                    }
                    descinput.setAttribute('class','campo campotexto'); //Será obligatorio?
                    descinput.className="campo campotexto";                    
                    descinput.setAttribute('title',texto_desc);
                    descinput.setAttribute('name','COLUMNA_'+numero_filas+'#'+CCOLUMN);
                    descinput.name='COLUMNA_'+numero_filas+'#'+CCOLUMN;
                    descinput.setAttribute('type','text');
                    descinput.type="text";
                    descinput.style.width="100%";
                    descinput.setAttribute('formato','fecha');  
                
                   
                    descdiv.appendChild(descinput);
                    desctd.appendChild(descdiv);  
                
              }else if (ctipcol == 4 || ctipcol == 5 ){//lista y select
               
                    desctd.setAttribute('class','campocaja');
                    desctd.className="campocaja";
                    desctd.style.width=anchura+"%";
                    var descdiv=document.createElement("div");
                    descdiv.setAttribute('class','dspText');
                    descdiv.className="dspText";
                    try{
                     //   var TLISTA = doc.getElementsByTagName("TLISTA")[indice];//
                     //   var elementos = TLISTA.getElementsByTagName("OB_IAX_PREGLISTATAB");
                  
                     var TLISTAxxx = OB_IAX_PREGUNTASTAB_COLUMNS.getElementsByTagName("TLISTA")[0];//
                     var elementos = TLISTAxxx.getElementsByTagName("OB_IAX_PREGLISTATAB");
                    }catch(e){}
                     
                     
                       if (elementos.length > 0 ) {
                          //Creamos el select de comppanyia
                         var miselect = document.createElement("select");            
                                var texto_concepto = numero_filas+'-'+TCOLUMN;;
                                miselect.setAttribute('class','campowidthselect campo campotexto'); //Será obligatorio?
                                miselect.className="campowidthselect campo campotexto";            
                                miselect.style.width="100%";
                                miselect.setAttribute('id','COLUMNA_'+numero_filas+'#'+CCOLUMN);
                                miselect.setAttribute('name','COLUMNA_'+numero_filas+'#'+CCOLUMN);
                                miselect.name='COLUMNA_'+numero_filas+'#'+CCOLUMN;
                                  if (!objUtiles.estaVacio(OBLIGATORIO) && OBLIGATORIO == 1){
                                         miselect.setAttribute('obligatorio','true');  
                                    }
                               
                                  miselect.setAttribute('title',texto_concepto);
                 
                                
                         var mioption = document.createElement("option");
                         //Primer option con min value
                         mioption.setAttribute('value', <%= Integer.MIN_VALUE %>);
                         miconcepto=document.createTextNode('- ' + '<axis:alt f="axisctr188" c="SNV_COMBO" lit="108341"/>' + ' -');
                         mioption.appendChild(miconcepto);
                         miselect.appendChild(mioption);
              
                       }
                
                       
                   for (i = 0; i < elementos.length; i++) {
                        var CLISTA =  objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("CLISTA"), 0, 0);
                        var TLISTA =  objDom.getValorNodoDelComponente(elementos[i].getElementsByTagName("TLISTA"), 0, 0);
                   
                          var mioption = document.createElement("option");
                         mioption.setAttribute('value', CLISTA);
                         miconcepto=document.createTextNode(TLISTA);
                         mioption.appendChild(miconcepto);
                         miselect.appendChild(mioption);
            
                         }
                    descdiv.appendChild(miselect);
                    desctd.appendChild(descdiv);  
              
              }
              
              
             
             
    
            return desctd;
            } catch (e) {
                if (isDebugAjaxEnabled == "true")
                    alert (e.name + " " + e.message);
            }
           
            
             
    }
    
    
         // **************************************
        // **************************************
        // Recalculammos el índice de una nueva fila
        // **************************************
        // **************************************
        function obtenerNuevoIndice(){    
                var table_preguntab = document.getElementById("preguntab");
                 if(table_preguntab!=null){
                 var tr_columns = table_preguntab.getElementsByTagName("tr");
                 var filas=0;             
                 for (i=0; i < tr_columns.length; i++) {                        
                     if(tr_columns[i].getAttribute("tipo")=='ri'){                            
                     filas=filas+1;
                     }
                 }          
                 //Obtenemos el siguiente numero no dado de alta
                 //alert("El numero que se desea insertar es: "+filas);
                 var myCounter=0;             
                 while(myCounter < tr_columns.length){                
                    texto_id="fila_"+filas;
                    if(tr_columns[myCounter].getAttribute("id")==texto_id){
                    //El numero ya existe intentamos asignar otro
                    filas=filas+1;
                    myCounter=0;
                    }
                    myCounter++;
                }
                 return filas;
                 }else{
                 //alert("No existen filas");
                 return 0;
                 }          
        }    
    function borrar_fila_preguntab(NLINEA){         
           f_del_preguntab(NLINEA);                
    }
   
    
    function f_del_preguntab(NLINEA){                 
  
         CPREGUN = document.getElementById("CPREGUN").value;
         CGARANT = document.getElementById("CGARANT").value;
         TIPO_PREGUNTA = document.getElementById("TIPO_PREGUNTA").value;
   
         objAjax.invokeAsyncCGI("modal_axisctr188.do?NLINEA="+NLINEA+"&CPREGUN="+CPREGUN+"&CGARANT="+CGARANT+"&TIPO_PREGUNTA="+TIPO_PREGUNTA, callbackAjaxEliminarpreguntab, "operation=ajax_delpreguntastab", this, objJsMessages.jslit_cargando,NLINEA);
          
    }

 
     function callbackAjaxEliminarpreguntab(ajaxResponseText,NLINEA) {
                try {           
            
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)){                
                     var table_preguntab = document.getElementById("preguntab");
                     var elemento = document.getElementById("fila_"+NLINEA); //selecciona el tr correspondiente  
                     table_preguntab.removeChild(elemento);
                 }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }  
    
   
              
        </script>
    </head>
 <body class=" " onload="f_onload()" onkeypress="if (event.keyCode==13)  { f_but_aceptar() }">
        <c:import url="../include/precargador_ajax.jsp">
            <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
        </c:import>
        <form name="miForm" action="" method="POST">
            <input type="hidden" id="operation" name="operation" value=""/>
            
            <input type="hidden" id="tipo" name="tipo" value="${__formdata.tipo}"/>
            
            <input type="hidden" id="SSEGURO" name="SSEGURO" value="${__formdata.SSEGURO}"/>
            <input type="hidden" id="NRIESGO" name="NRIESGO" value="${__formdata.NRIESGO}"/>
            <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${__formdata.NMOVIMI}"/>
            <input type="hidden" id="CPREGUN" name="CPREGUN" value="${__formdata.CPREGUN}"/>
            <input type="hidden" id="CGARANT" name="CGARANT" value="${__formdata.CGARANT}"/>
            <input type="hidden" id="TIPO_PREGUNTA" name="TIPO_PREGUNTA" value="${__formdata.TIPO_PREGUNTA}"/>
            <input type="hidden" id="TPREGUN" name="TPREGUN" value="${__formdata.TPREGUN}"/>
            <input type="hidden" name="CONSULTA" id="CONSULTA" value="${__formdata.CONSULTA}"/>   
            
            
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="LIT_FORM" f="axisctr188" lit="9901369"/></c:param>
                <c:param name="producto"><axis:alt c="LIT_FORM" f="axisctr188" lit="9901369"/></c:param>
                <c:param name="form">axisctr188</c:param>
            </c:import>
            <!-- Area de campos  -->
              
            <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    
                        <!--campos-->
                        <table class="seccion">
                            <tr>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                                <th style="width:25%;height:0px"></th>
                            </tr>
                            
                                <axis:ocultar f="axisctr188" c="DSP_PREGUNTAB" dejarHueco="false"> 
                                <tr>
                                    <td class="campocaja" colspan="4">
                                                                                        
                                               <%--div class="titulo">
                                               
                                               
                                                <c:if test="${!empty __formdata.lstcabecera}">  
                                    <tr>
                                    	 <axis:visible f="axisctr188" c="BUT_ANADIR" >
                                                     <input type="button" class="boton" id="but_anadir" value="<axis:alt f="axisctr188" c="ANADIR" lit="104825" />" onclick="javascript:anyadir_fila()" />
                                        </axis:visible>
                                     </tr>  
                                     </c:if>
                                               </div--%>
                                               
                                               
                                               
                                                <div class="titulo">
                                                  <div style="float:left;">
                                                  <%--img src="images/flecha.gif"/--%>${__formdata.CPREGUN} - ${__formdata.TPREGUN} 
                                                </div>
                                                      <div style="float:right;">
                                                          <axis:visible f="axisctr188" c="BUT_ANADIR">
                                                                <div style="float:right;">
                                                                  
                                                                    <img border="0"
                                                                         id="ICO_ANADIR"
                                                                         name="ICO_ANADIR"
                                                                         alt='<axis:alt f="axisctr188" c="ANADIR" lit="104825"/>'
                                                                         title='<axis:alt f="axisctr188" c="ANADIR" lit="104825"/>'
                                                                         src="images/new.gif"
                                                                         onclick="javascript:anyadir_fila()"/>
                                                                  
                                                                </div>
                                                             
                                                          </axis:visible>
                                                      </div>
                                                  </div>
                                               
                                               
                                            <div class="separador">&nbsp;</div>   
                                        
                                         <div id="DSP_PREGUNTASTABLA" class="displayspaceOver" style="visibility:hidden;">&nbsp;</div>
                                         <div id="Dt_PREGUNTASTABLA" class="displayspaceMaximo">
                                        <table class="seccion" cellpadding="0" cellspacing="0" align="right" style="width:99%">
                                    
                                        <tbody id="preguntab" align="right">
                                             <tr class="gridEvenHover">
                                             
                                           
                                                     <c:if test="${!empty __formdata.lstcabecera}">      
                                                     <c:set var="total">${95/fn:length(__formdata.lstcabecera)}</c:set>
                                                       <c:forEach items="${__formdata.lstcabecera}" var="lista" varStatus="i">                                    
                                                               <td class="dspText"  style="width:${total}%"><b>${lista.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}</b></td>
                                                        </c:forEach> 
                                                           <c:if test="${empty __formdata.CONSULTA || __formdata.CONSULTA != 1}">
                                                        <td class="dspText" align="center"  style="width:5%"></td>                
                                                        </c:if>
                                                      </c:if>
                                              </tr>   
                                               <c:if test="${!empty __formdata.lstpreguntab}">     
                                           
                                                  
                                                         <c:forEach items="${__formdata.lstpreguntab}" var="lista" varStatus="x"> 
                                                         
                                                              <tr tipo="ri" id="fila_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}" title="fila_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}"
                                                            <c:if test="${x.count mod 2 ==0}">                                                                      
                                                                class="gridEven"                                                        
                                                            </c:if>
                                                            <c:if test="${x.count mod 2 !=0}">                                                                      
                                                                class="gridNotEven"                                                        
                                                            </c:if>
                                                        >     
                                                        
                                                            <c:forEach items="${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.TCOLUMNAS}" var="listacolumns" varStatus="j">   
                                                              <td  class="campocaja" style="width:${total}%">
                                                              
                                                                   <c:choose>
                                                                        <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPCOL == 1}">
                                                                            
                                                                            <div class="dspNumber">
                                                                            
                                                                                <input type="text" style="width:100%" id="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}" name="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}"
                                                                                class="campo campotexto" 
                                                                                <c:choose>
                                                                                    <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPDATO == 1}">
                                                                                       <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true&formato=entero"/>
                                                                                        value="<fmt:formatNumber pattern="###,##0" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR}"/>"
                                                                                    </c:when>
                                                                                      <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPDATO == 3}">
                                                                                        <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true"/>
                                                                                        formatoespecial = '1'
                                                                                        value="<fmt:formatNumber pattern="###,##0.######" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR}"/>"
                                                                                      </c:when>
                                                                                    <c:otherwise>
                                                                                        <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true&formato=decimal"/>
                                                                                        value="<fmt:formatNumber pattern="###,##0.00" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR}"/>"
                                                                                    </c:otherwise>
                                                                                </c:choose>
                                                                                <c:if test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.COBLIGA == 1}">obligatorio=true</c:if>
                                                                                title = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                alt = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                 >
                                                                            </div>
                                                                        </c:when>
                                                                        <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPCOL == 2}">
                                                                                <div class="dspText">
                                                                                    <input type="text" style="width:100%" id="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}" name="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}"
                                                                                    class="campo campotexto" <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true"/>
                                                                                    <c:if test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.COBLIGA == 1}">obligatorio=true</c:if>
                                                                                    title = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                    alt = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                    value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TVALOR}" >
                                                                                </div>
                                                                        </c:when>
                                                                        <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPCOL == 3}">
                                                                                <div class="dspText">
                                                                                    <input type="text" style="width:100%" id="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}" name="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}"
                                                                                    class="campo campotexto" <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true&formato=fecha"/>
                                                                                    <c:if test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.COBLIGA == 1}">obligatorio=true</c:if>
                                                                                    title = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                    alt = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                    value="<fmt:formatDate pattern="dd/MM/yyyy" value="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.FVALOR}"/>" >
                                                                                </div>                                                                  
                                                                        </c:when>
                                                                        <c:when test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPCOL == 4 || listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CTIPCOL == 5}">
                                                                                 <div class="dspText">
                                                                                  <select id="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}" name="COLUMNA_${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}#${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.CCOLUMNA}" 
                                                                                   title = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"  alt = "${x.count-1}-${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TCOLUMNA}"
                                                                                    style="width:100%" class="campowidthselect campo campotexto"   <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="modificable=true&isInputText=false"/>
                                                                                    <c:if test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.COBLIGA == 1}"> <axis:atr f="axisctr188" c="COLUMNA_${x.count-1}" a="obligatorio=true&modificable=true&isInputText=false"/></c:if>/>                                                                >
                                                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr007" c="COMBO_SNV" lit="108341"/> - </option> 
                                                                                        <c:forEach items="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.TLISTA}" var="lista">   
                                                                                            <option value = "${lista.OB_IAX_PREGLISTATAB.CLISTA}"
                                                                                                    <c:if test="${listacolumns.OB_IAX_PREGUNTASTAB_COLUMNS.NVALOR == lista.OB_IAX_PREGLISTATAB.CLISTA}">selected</c:if>>
                                                                                               ${lista.OB_IAX_PREGLISTATAB.TLISTA} 
                                                                                            </option>
                                                                                        </c:forEach>
                                                                                </select>
                                                                                </div>
                                                                        </c:when>
                                                                    </c:choose>
                                                              </td>                                   
                                                              </td>
                                                              </c:forEach> 
                                                              
                                                              
                                                              <c:if test="${empty __formdata.CONSULTA || __formdata.CONSULTA != 1}">
                                                                       <axis:ocultar f="axisctr163" c="ELIMINAR" dejarHueco="false">
                                                                    <td class="dspText">
                                                                        <a href="javascript:borrar_fila_preguntab('${__formdata.lstpreguntab[x.count-1].OB_IAX_PREGUNTASTAB.NLINEA}')"  id ="eliminar_${x.count-1}"><img border="0" alt="<axis:alt f="axisctr163" c="DELETE" lit="1000127" />"  title="<axis:alt f="axisctr163" c="DELETE" lit="1000127"/>" src="images/delete.gif"/></a>
                                                                    </td>   
                                                                 
                                                                    </axis:ocultar>   
                                                                 </c:if>
                                                              </tr>
                                                         </c:forEach> 
                                               
                                                        
                                                        </tr>
                                                        </c:if>
                                            </tbody>  
                                            
                                        </table>
                                        </div>
                                             
                                            
                                    </td>
                                    </tr>
                                    
                                </axis:ocultar> 
                               
                            
                               
                           
                            
                            
                        </table>
                       
                     
                    </td>
                </tr>
            </table>
    
     </form>
    
    
    

<c:import url="../include/botonera_nt.jsp">
           <c:param name="f">axisctr188</c:param>
            <c:param name="__botones"><axis:ocultar f="axisctr188" c = "BT_CANCELAR" dejarHueco="false">cancelar</axis:ocultar><axis:ocultar f="axisctr188" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar> </c:param>

</c:import>
<c:import url="../include/mensajes.jsp" />
    
</body>
</html>


