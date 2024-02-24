<%/*
*  Fichero: axispro022.jsp
*
*  @author <a href="mailto:rkirchner@csi-ti.com">Roger Kirchner</a>
*  Fecha: 30/06/2008
*/
%>

<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">
    <link rel="StyleSheet" href="styles/displaytag.css" type="text/css"></link>
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

    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">

        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
    
        function f_but_cancelar() {
            parent.f_cerrar_modal('axispro022');                      
        }
    
        function f_but_guardar() {
            if (objValidador.validaEntrada()) {
                objUtiles.ejecutarFormulario("modal_axispro022.do", "guardar", document.miForm, "_self");      
            }
        }
        
        function f_onload() {
            if (!objDom.estaDisabled("CTIPO") )
                document.getElementById("CTIPO").focus();
                
            var ok = "${__formdata.OK}";
            
            if(!objUtiles.estaVacio(ok) && ok == 0){
                parent.f_aceptar_modal('axispro022'); 
                }
                
            f_cargar_propiedades_pantalla();    
            
        }
        
        function f_cargar_propiedades_pantalla(){
                f_cargapropietatexpander();
                f_cargar_valores_defecto();
                objDependencias.modificarPropiedadesSegunModificableYVisible();
                f_carga_dependencias();
                revisarEstilos();
            }


        
        /****************************************************************************************/
        /******************************** CALLBACK AJAX *****************************************/
        /****************************************************************************************/
        
         function callbackGuardar (ajaxResponseText) {
            try {
                var doc = objAjax.domParse(ajaxResponseText);
                if (!objAppMensajes.existenErroresEnAplicacion(doc)) {
                    parent.f_aceptar_modal('axispro022');                      
                }
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
            var table_tramos = document.getElementById("tramos");
             if(table_tramos!=null){
             var tr_tramos = table_tramos.getElementsByTagName("tr");
             var filas=0;             
             for (i=0; i < tr_tramos.length; i++) {                        
                 if(tr_tramos[i].getAttribute("tipo")=='ri'){                            
                 filas=filas+1;
                 }
             }          
             //Obtenemos el siguiente numero no dado de alta
             //alert("El numero que se desea insertar es: "+filas);
             var myCounter=0;             
             while(myCounter < tr_tramos.length){                
                texto_id="fila_"+filas;
                if(tr_tramos[myCounter].getAttribute("id")==texto_id){
                //El numero ya existe intentamos asignar otro
                filas=filas+1;
                myCounter=0;
                }
                myCounter++;
            }
             return filas;
             }else{
             //alert("No existen filas de rentas irre");
             return 0;
             }          
    }    
        
     // **************************************
    // **************************************
    // Añadir nueva fila a tabla compañía
    // **************************************
    // **************************************
        
    function anyadir_fila_tramo(){   
        
             //primero llamamos a la funcion que nos devuelve el número de filas rellenadas
             //sabremos que el id_ sera i+1
             var numero_filas = obtenerNuevoIndice(); //Si el número de filas =3 la siguiente será 3          
             
             //alert("valor de la nueva fila:"+numero_filas)
             // recogemos el tag de companyias
             var table_tramos = document.getElementById("tramos");     
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
             //creamos el td de companyia i la apariencia
             var mitd = document.createElement("td");         
             mitd.setAttribute('class','campocaja');     
             mitd.className ="campocaja";                  
        
             
             //creamos nuevo TD de desde y le damos la apariéncia    
             var desdetd=document.createElement("td");
             desdetd.setAttribute('class','campocaja');
             desdetd.className="campocaja";
             
             var desdeinput = document.createElement("input");
                    //anyadir variables al input
                    var texto_desde='NDESDE_'+numero_filas;
                    desdeinput.setAttribute('id',texto_desde);                        
                    desdeinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                    desdeinput.className="campowidthinput campo campotexto";                    
                    desdeinput.setAttribute('title','DESDE_'+numero_filas);
                    desdeinput.setAttribute('name','name_'+texto_desde);
                    desdeinput.name=texto_desde;
                    desdeinput.setAttribute('type','text');
                    desdeinput.type="text";
                    desdeinput.style.width="50%";
                    desdeinput.style.fontFamily="arial";
                    desdeinput.style.fontSize="11px";                               
                    //Asignar al onchange la función AJAX de actualixación.
                   // desdeinput.onchange = function (evt) {
                   //     comprovarTramoRepetida();                         
                   // };
                    
                    desdeinput.onblur = function (evt) {
                        comprovarTramoRepetida("DESDE");                         
                    };
                    
            //Cargamos el campo agente en el TD de agente.
             desdetd.appendChild(desdeinput);
             
             //creamos nuevo TD de agentes y le damos la apariéncia    
             var ninttectd=document.createElement("td");
             ninttectd.setAttribute('class','campocaja');
             ninttectd.className="campocaja";
             
             var ninttecinput = document.createElement("input");
                    //anyadir variables al input
                    var texto_ninttec='NINTTEC_'+numero_filas;
                    ninttecinput.setAttribute('id',texto_ninttec);                        
                    ninttecinput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                    ninttecinput.className="campowidthinput campo campotexto";                    
                    ninttecinput.setAttribute('title','NINTTEC_'+numero_filas);
                    ninttecinput.setAttribute('name','name_'+texto_ninttec);
                    ninttecinput.name=texto_ninttec;
                    ninttecinput.setAttribute('type','text');
                    ninttecinput.type="text";
                    ninttecinput.style.width="50%";
                    ninttecinput.style.fontFamily="arial";
                    ninttecinput.style.fontSize="11px";                               
                    //Asignar al onchange la función AJAX de actualixación.
                    //ninttecinput.onchange = function (evt) {
                    //    comprovarTramoRepetida();                        
                    //};
            //Cargamos el campo agente en el TD de agente.
             ninttectd.appendChild(ninttecinput);
             
            //creamos nuevo TD de desde y le damos la apariéncia    
             var hastatd=document.createElement("td");
             hastatd.setAttribute('class','campocaja');
             hastatd.className="campocaja";
             
             var hastainput = document.createElement("input");
                    //anyadir variables al input
                    var texto_hasta='NHASTA_'+numero_filas;
                    hastainput.setAttribute('id',texto_hasta);                        
                    hastainput.setAttribute('class','campowidthinput campo campotexto'); //Será obligatorio?
                    hastainput.className="campowidthinput campo campotexto";                    
                    hastainput.setAttribute('title','HASTA_'+numero_filas);
                    hastainput.setAttribute('name','name_'+texto_hasta);
                    hastainput.name=texto_hasta;
                    hastainput.setAttribute('type','text');
                    hastainput.type="text";
                    hastainput.style.width="50%";
                    hastainput.style.fontFamily="arial";
                    hastainput.style.fontSize="11px";                               
                    //Asignar al onchange la función AJAX de actualixación.
                     hastainput.onblur = function (evt) {
                        comprovarTramoRepetida("HASTA");                         
                    };
                    
            //Cargamos el campo agente en el TD de agente.
             hastatd.appendChild(hastainput); 
             
             
            //Creamos TD para el sigo de eliminación de fila 
            var imgtd=document.createElement("td");
            imgtd.setAttribute('class','dspText');       
            imgtd.className="dspText";
            var ael = document.createElement("a");
                var stringId = "eliminar_"+numero_filas;
                ael.setAttribute('id',stringId);
            var funcion_borrar = "javascript:borrar_fila_tramos("+ numero_filas +")";
          //  var funcion_borrar = "javascript:borrar_fila_renta()";
                ael.setAttribute('href',funcion_borrar);
            var imgel = document.createElement("img");
                imgel.setAttribute('border','0');
                imgel.setAttribute('src','images/delete.gif');
                ael.appendChild(imgel);        
             //Cargamos el icono eliminar en el TD     
            imgtd.appendChild(ael);            
            // Apend en el tr todos los td's de los campos
            
            mitr.appendChild(desdetd);
            mitr.appendChild(hastatd);
            mitr.appendChild(ninttectd);
            mitr.appendChild(imgtd);  
            //Por último añadimos el TR a la tabla
            table_tramos.appendChild(mitr);    
            revisarEstilos();
             
    }
    
    // **************************************
    // **************************************
    // Borra una fila determinada
    // **************************************
    // **************************************
    function borrar_fila_tramos(num){         
         
      if(document.getElementById("NDESDE_"+num).value != <%= Integer.MIN_VALUE %>){        
        //Es una fila existente en BBDD, lo eliminamos primero en BBDD
         f_delete_tramo(num);           
      }
      else{            
        borrar_fila_tramos_js(num);                
      }  
    }
    
    // **************************************
    // **************************************
    // Borra una fila determinada por js
    // **************************************
    // **************************************
    function borrar_fila_tramos_js(num){         
         
               //Control de única fila, si es la única del grid no la borramos visualmente
               if(obtenerNuevoIndice() != 1){
                    var table_tramos = document.getElementById("tramos");
                    var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente   
                    table_tramos.removeChild(elemento);
                    modificarIdentificadorsPostEliminaciotramos(num);
                    
               }else{
               //La fila está vacia, y además es la única, no se puede eliminar
                    var table_tramos = document.getElementById("tramos");
                    var elemento = document.getElementById("fila_"+num); //selecciona el tr correspondiente   
                    table_tramos.removeChild(elemento);
                    modificarIdentificadorsPostEliminaciotramos(num);
                    anyadir_fila_tramo();
                    
               //alert(objJsMessages.jslit_no_borrar);
               }
    }
    
  // **************************************
    // **************************************
    // Actualiza los componentes al eliminar una fila por js
    // **************************************
    // **************************************
    
    function modificarIdentificadorsPostEliminaciotramos(filaEliminada){    
        
        var indiceATratar = filaEliminada +1;
        var nuevoIndice = filaEliminada;
        var  totalFilas = obtenerNuevoIndice();
        
        
        for(i=filaEliminada; i < (totalFilas-1) ;i++){
            
            //Recuparamos la fila a tratar
            var elemento = document.getElementById("fila_" + indiceATratar); 
            //Cambiamos class de la fila
            if ((indiceATratar % 2)==0){
                elemento.classname ="";
                elemento.setAttribute('class','gridNotEven');
                elemento.className = "gridEven";            
            }
             else{
                elemento.classname ="";
                elemento.setAttribute('class','gridEven');
                elemento.className = "gridNotEven";            
            }                        
            //Cambiamos title de la fila
            elemento.setAttribute('title','fila_' + nuevoIndice);                                
            //Cambiamos id's y name's de los campos de la fila            
            var elementoDesde = document.getElementById("DESDE_"+indiceATratar); 
            elementoDesde.name = "DESDE_" + nuevoIndice;           
            elementoDesde.id = "DESDE_" + nuevoIndice;           
            elementoDesde.setAttribute('title','DESDE_' + nuevoIndice);  
            //Problemas de asignacion de memoria por tratarse de funcion, el volor pasaba por referencia y siempre quedava el ultimo valor(bug JS)
            //;recuperamos el valor del ID, una vez se ejecuta el onchange, dentro del objeto select.
            elementoDesde.onchange = function (evt) {
                    var cadenaTexto = this.id;                    
                    var fragmentoTexto = cadenaTexto.split('DESDE_');
                    var numero = fragmentoTexto[1];                    
                    f_guardar_tramo(numero);                        
            };   
            
            var elementoHasta = document.getElementById("HASTA_"+indiceATratar); 
            elementoHasta.name = "HASTA_" + nuevoIndice;            
            elementoHasta.setAttribute('title','HASTA_' + nuevoIndice);  
            //Problemas de asignacion de memoria por tratarse de funcion, el volor pasaba por referencia y siempre quedava el ultimo valor(bug JS)
            //;recuperamos el valor del ID, una vez se ejecuta el onchange, dentro del objeto input-text.
            elementoHasta.onchange = function (evt) {
                    var cadenaTexto = this.id;                    
                    var fragmentoTexto = cadenaTexto.split('HASTA_');
                    var numero = fragmentoTexto[1];                    
                    f_guardar_companyia(numero);                        
            };   
            
            
            
            elementoHasta.id = "HASTA_" + nuevoIndice;  
            
            var elementoNinttec = document.getElementById("NINTTEC_"+indiceATratar); 
            elementoNinttec.name = "NINTTEC_" + nuevoIndice;
            elementoNinttec.id = "NINTTEC_" + nuevoIndice;
            elementoNinttec.setAttribute('title','NINTTEC_' + nuevoIndice);             
            //Problemas de asignacion de memoria por tratarse de funcion, el volor pasaba por referencia y siempre quedava el ultimo valor(bug JS)
            //;recuperamos el valor del ID, una vez se ejecuta el onchange, dentro del objeto select.
            elementoNinttec.onchange = function (evt) {
                    var cadenaTexto = this.id;                    
                    var fragmentoTexto = cadenaTexto.split('NINTTEC_');
                    var numero = fragmentoTexto[1];                    
                    f_guardar_companyia(numero);                        
            };     
            //Cambiamos id's de la fila
            elemento.id = "fila_" + nuevoIndice;                             
            //Cambiamos id del botón eliminar registre
            var elemento = document.getElementById("eliminar_"+indiceATratar);    
            elemento.id = "eliminar_" + nuevoIndice;
            
            var funcion_borrar = "javascript:borrar_fila_tramo("+ nuevoIndice +")";
            elemento.setAttribute('href',funcion_borrar);
          
            nuevoIndice = nuevoIndice + 1;            
            indiceATratar = indiceATratar + 1;    
            
    }
    revisarEstilos();   
}

 // **************************************
    // **************************************
    // Compueba que la fila no esté repetida(valor de la companyia)
    // **************************************
    // **************************************
    function comprovarTramoRepetida(DONDE){
     
     if(DONDE == "DESDE"){   
       var  totalFilas = obtenerNuevoIndice()-1;
       
       if (totalFilas > 0){
        var elementoComFinal = document.getElementById("NDESDE_"+totalFilas);        
        var valorTramoFinal = elementoComFinal.value;
        var filaAnterior = obtenerNuevoIndice()-2;
        var elementoAnterior = document.getElementById("NHASTA_"+filaAnterior); 
        var valorAnterior = elementoAnterior.value;
       
        if( !objUtiles.estaVacio(valorTramoFinal) && parseInt(valorTramoFinal) <= parseInt(valorAnterior)){
            alert('<fmt:message key="180018"/>');
            document.getElementById("NDESDE_"+totalFilas).value = '';
            document.getElementById("NDESDE_"+totalFilas).focus();
        }
       }
     }
    
     if(DONDE == "HASTA"){   
       var  totalFilas = obtenerNuevoIndice()-1;
       if (totalFilas > 0){
           var elementoComFinal = document.getElementById("NDESDE_"+totalFilas);        
           var valorTramoFinal = elementoComFinal.value;
           
           var elementoAnterior = document.getElementById("NHASTA_"+totalFilas); 
           var valorAnterior = elementoAnterior.value;
           
           if( !objUtiles.estaVacio(valorAnterior) &&  parseInt(valorAnterior) <= parseInt(valorTramoFinal) ){
                alert('<fmt:message key="180018"/>');
                document.getElementById("NHASTA_"+totalFilas).value = '';
                document.getElementById("NHASTA_"+totalFilas).focus();
           }
       }    
     }
    }
    
    function f_delete_tramo(FILA) {
        
        //objUtiles.ejecutarFormulario("modal_axispro022.do"+params, "deleteTramo", document.miForm, "_self"); 
        
        var NCODINT = document.getElementById("NCODINT").value;
        var CTIPO = document.getElementById("CTIPO").value;
        var FINICIO = document.getElementById("FINICIO").value;
        var NDESDE = document.getElementById("NDESDE_"+FILA).value;
        
        var params = "?NCODINT=" + NCODINT + "&CTIPO=" + CTIPO + "&FINICIO=" + FINICIO + "&NDESDE=" + NDESDE; 
        
        objAjax.invokeAsyncCGI("modal_axispro022.do"+params, callbackAjaxEliminarTramo, "operation=deleteTramo", this, objJsMessages.jslit_cargando,FILA);
        
    }
    
    function callbackAjaxEliminarTramo(ajaxResponseText, num_fila) {
               
                try {                
                    var doc=objAjax.domParse(ajaxResponseText);
                    //alert(doc);
                    var error = objUtiles.hayValorElementoXml(doc.getElementsByTagName("ERROR")[0]) ? 
                    objDom.getValorNodoDelComponente(doc.getElementsByTagName("ERROR"), 0, 0) : ""; 
                    if(error!=""){
                    alert(error);
                    }
                    //la boorramos por js para no afecta a otras posibles filas vacias
                    else{
                        borrar_fila_tramos_js(num_fila);
                    }
                
                } catch (e) {
                    if (isDebugAjaxEnabled == "true")
                        alert (e.name + " " + e.message);
                }
                   
    }     


    </script>
  </head>
  
  <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" action="modal_axispro022.do" method="POST">         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><fmt:message key="1000541"/></c:param>
            <c:param name="form">axispro022</c:param>
        </c:import>
        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="NCODINT" name="NCODINT" value="${__formdata.NCODINT}"/>
        <input type="hidden" id="NCTIPO" name="NCTIPO" value="${__formdata.CTIPO}"/>
        <input type="hidden" id="MODO" name="MODO" value="${__formdata.MODO}"/>
        <input type="hidden" id="NCTRAMTIP" name="NCTRAMTIP" value="${__formdata.CTRAMTIP}"/>
        
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                        
                    <div class="titulo"><img src="images/flecha.gif"/>${__formdata.TNCODINT}</div>
                    
                    <table class="seccion">
                        <tr>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                            <th style="width:25%;height:0%;"/>
                        </tr>                        
                        <tr>
                            <td class="titulocaja">
                                <b><fmt:message key="1000543"/></b> <%-- TIPO DE INTERÉS --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="104095"/></b> <%-- DESDE --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="103051"/></b> <%-- HASTA --%>
                            </td>
                            <td class="titulocaja">
                                <b><fmt:message key="1000544"/></b> <%-- CONCEPTO DEL TRAMO --%>
                            </td>
                        </tr>
                        <tr>
                            <td class="campocaja">                                
                                <select name="CTIPO" id="CTIPO" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                <axis:atr f="axispro022" c="CTIPO" a="modificable=true&obligatorio=true"/>
                                <c:if test="${!empty __formdata.CTIPO}"> disabled </c:if>>&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTTIPINTERES}">
                                        <option value = "${element.CATRIBU}"
                                         <c:if test="${element.CATRIBU == __formdata.CTIPO}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>        
                            <td class="campocaja">                             
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FINICIO}"/>" name="FINICIO" id="FINICIO"
                                <axis:atr f="axispro22" c="FINICIO" a="modificable=true&obligatorio=true&formato=fecha"/>
                                <c:if test="${!empty __formdata.FINICIO}"> readonly </c:if> /><c:if test="${empty __formdata.FINICIO}"><a style="vertical-align:middle;"><img
                                id="icon_FINICIO" alt="<fmt:message key="108341"/>" title="<fmt:message key="104095" />" src="images/calendar.gif"/></a>
                                </c:if>
                            </td>
                            <td class="campocaja">                                
                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FFIN}"/>" name="FFIN" id="FFIN" 
                                <axis:atr f="axispro22" c="FFIN" a="modificable=true&obligatorio=false&formato=fecha"/> /><a style="vertical-align:middle;"><img 
                                id="icon_FFIN" alt="<fmt:message key="108341"/>" title="<fmt:message key="103051" />" src="images/calendar.gif"/></a>
                            </td>
                            <td class="campocaja">                        
                                <select name="CTRAMTIP" id="CTRAMTIP" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                <axis:atr f="axispro22" c="CTRAMTIP" a="modificable=true&obligatorio=true"/>
                                <c:if test="${!empty __formdata.CTRAMTIP}"> disabled </c:if> >&nbsp;
                                    <option value="<%= Integer.MIN_VALUE %>"> - <fmt:message key="1000348"/> - </option>
                                    <c:forEach var="element" items="${__formdata.LISTVALORES.LSTCTRAMTIP}">
                                        <option value = "${element.CATRIBU}"                                        
                                        <c:if test="${element.CATRIBU == __formdata.CTRAMTIP}"> selected </c:if> />
                                            ${element.TATRIBU} 
                                        </option>
                                    </c:forEach>
                                </select>
                            </td>        
                        </tr>
                    </table>
                </td>
            </tr>


        <!--Tabla compañías -->
        <axis:ocultar f="axispro022" c="TABLA_TRAMOS" dejarHueco="false">                                 
            <tr>
                <td> 
                    <div class="separador">&nbsp;</div>
                    <div class="titulo" ><img src="images/flecha.gif"/><fmt:message key="1000542" /></div>
                    
                    <table class="seccion"  align="left" >
                        <tr>
                            <td>
                                <table style="width:75%;">
                                    <tbody id="tramos" align="right">
                                            <tr>
                                                <th style="width:15%;height:0px;"></th>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:15%;height:0px;"></th>
                                                <th style="width:5%;height:0px"></th>  
                                                <th style="width:50%;height:0px"></th>
                                            </tr>
                                            <tr class="gridEvenHover">                                                                               
                                                <td class="dspText" align="center"><b><fmt:message key="104095" /></b></td>
                                                <td class="dspText" align="center"><b><fmt:message key="103051" /></b></td>
                                                <td class="dspText" align="center"><b><fmt:message key="101467" /></b></td>                                        
                                                <td>&nbsp;</td>
                                            </tr>
                                                        
                                            <!-- C:IF  SI EL OBJETO LISTA ES NULO PINTAMOS UNA LINEA EN BLANCO -->
                                            <c:if test="${empty sessionScope.DATTECN_INTERTECMOVDET || __formdata.MODO == 'NUEVO' || __formdata.MODO == 'NUEVO_TRAMO'}">  
                                                <tr tipo="ri" id="fila_0" class="gridNotEven" >                                  
                                                        <td class="campocaja">                           
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                                                        value="${__formdata.NDESDE}" name="NDESDE_0" id="NDESDE_0" title="NDESDE_0" 
                                                                        onblur="comprovarTramoRepetida('DESDE')"
                                                                        <axis:atr f="axispro22" c="NDESDE" a="modificable=true&obligatorio=false&formato=entero"/>
                                                                <c:if test="${!empty __formdata.NDESDE}"> readonly='readonly' </c:if> />                                
                                                        </td>
                                                        <td class="campocaja">                             
                                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                                                    value="${__formdata.NHASTA}" name="NHASTA_0" id="NHASTA_0" title="NHASTA_0"
                                                                    <axis:atr f="axispro22" c="NHASTA" a="modificable=true&obligatorio=false&formato=entero"/>
                                                                    onblur="comprovarTramoRepetida('HASTA')" />  
                                                        </td>
                                                        <td class="campocaja">                             
                                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                                                   value="<fmt:formatNumber pattern="###,##0.00" value="${__formdata.NINTTEC}"/>" name="NINTTEC_0" id="NINTTEC_0" title="NINTTEC_0"
                                                            <axis:atr f="axispro22" c="NINTTEC" a="modificable=true&obligatorio=false&formato=decimal"/> />
                                                        </td>                                         
                                                    <td class="dspText">
                                                        <a  href="javascript:borrar_fila_tramos(0)"><img border="0" alt="<fmt:message key="1000127" />" title="<fmt:message key="1000127" />" src="images/delete.gif"/></a>
                                                    </td>                                            
                                                </tr>
                                            </c:if>
                                            <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                            <c:if test="${!empty sessionScope.DATTECN_INTERTECMOVDET && __formdata.MODO != 'NUEVO' && __formdata.MODO != 'NUEVO_TRAMO'}">                                                                      
                                                <c:forEach items="${sessionScope.DATTECN_INTERTECMOVDET}" var="lista" varStatus="i">                                    
                                                    <tr tipo="ri" id="fila_${i.count-1}" title="fila_${i.count-1}"
                                                        <c:if test="${i.count mod 2 ==0}">                                                                      
                                                            class="gridEven"                                                        
                                                        </c:if>
                                                        <c:if test="${i.count mod 2 !=0}">                                                                      
                                                            class="gridNotEven"                                                        
                                                        </c:if>>                                        
                                                                       
                                                        <td class="campocaja">                          
                                                                <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;" title="NDESDE_${i.count-1}" 
                                                                        value="${lista.OB_IAX_INTERTECMOVDETPROD.NDESDE}" name="NDESDE_${i.count-1}" id="NDESDE_${i.count-1}" title="NDESDE_${i.count-1}"
                                                                        onblur="comprovarTramoRepetida('DESDE')"
                                                                        <axis:atr f="axispro22" c="DESDE" a="modificable=true&obligatorio=false&formato=entero"/>
                                                                        <c:if test="${!empty __formdata.NDESDE}"> readonly='readonly' </c:if> />                                
                                                        </td>
                                                        <td class="campocaja">                             
                                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                                                    value="${lista.OB_IAX_INTERTECMOVDETPROD.NHASTA}" name="NHASTA_${i.count-1}" id="NHASTA_${i.count-1}" title="NHASTA_${i.count-1}"
                                                                    onblur="comprovarTramoRepetida('HASTA')"
                                                                    <axis:atr f="axispro22" c="NHASTA" a="modificable=true&obligatorio=false&formato=entero"/> />  
                                                        </td>
                                                        <td class="campocaja">                             
                                                            <input type="text" class="campowidthinput campo campotexto" size="15" style="width:50%;"
                                                                   value="<fmt:formatNumber pattern="###,##0.00" value="${lista.OB_IAX_INTERTECMOVDETPROD.NINTTEC}"/>" name="NINTTEC_${i.count-1}" id="NINTTEC_${i.count-1}" title="NINTTEC_${i.count-1}"
                                                            <axis:atr f="axispro22" c="NINTTEC" a="modificable=true&obligatorio=false&formato=decimal"/> />
                                                        </td>                                                               
                                                        <td class="dspText">
                                                                <a href="javascript:borrar_fila_tramos(${i.count-1})"  id ="eliminar_${i.count-1}"><img border="0" alt="<fmt:message key="1000127" />"  title="<fmt:message key="1000127"/>" src="images/delete.gif"/></a>
                                                        </td>                                                         
                                                    </tr>    
                                                </c:forEach> 
                                            </c:if>
                                        <!--SI NO PINTAMOS LAS FILAS RELLENADAS -->
                                        <!-- ******************** fin filas: boton anyadir  ******************************** -->                                            
                                        </tbody> 
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>                            
                <!--Fin tabla tramos -->
                <tr>
                    <td colspan="4">
                        <table cellpadding="0" cellspacing="0" >
                            <tr>
                                <th style="width:35%;height:0px;"></th>
                                <th style="width:30%;height:0px"></th>
                                <th style="width:25%;height:0px;"></th>
                                <th style="width:10%;height:0px"></th>   
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                            <tr>                  
                                <td style="text-align:right">
                                    <input type="button" class="boton" id="but_anadir" value="<fmt:message key="104825" />" onclick="javascript:anyadir_fila_tramo()" />
                                </td>
                                <td></td>
                                <td></td>
                                <td></td>
                            </tr>
                        </table>
                    </td>                                        
                </tr>
            </axis:ocultar>
        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="__botones">cancelar,guardar</c:param></c:import>
        
    </form>
    <c:import url="../include/mensajes.jsp" />
    
    <script type="text/javascript">
       <c:if test="${empty __formdata.FINICIO}">
        Calendar.setup({
            inputField     :    "FINICIO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINICIO", 
            singleClick    :    true,
            firstDay       :    1
        });
        </c:if>
        
        Calendar.setup({
            inputField     :    "FFIN",    
            ifFormat       :    "%d/%m/%Y",     
            button         :    "icon_FFIN",  
            singleClick    :    true,
            firstDay       :    1
        });
    </script>

</body>
</html>