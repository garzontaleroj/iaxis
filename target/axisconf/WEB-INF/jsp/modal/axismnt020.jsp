<%--
      NOMBRE:    axismnt020.jsp
      @author <a href = "mailto:joan_torres@csi-ti.com">Joan Torres</a>
      Fecha: 13/09/2012
      PROPÓSITO (descripción pantalla): Nueva CFG
  
      REVISIONES:
      Ver        Fecha        Autor             Descripción
      ---------  ----------  ---------------  ------------------------------------
      1.0        13/09/2012   JTS             1. Creación de la pantalla. Bug.23079
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
        <script type="text/javascript">

            /****************************************************************************************/
            /*********************************** NAVEGACION *****************************************/
            /****************************************************************************************/            
            function f_onload(){
                f_cargar_propiedades_pantalla();//Función que nos carga todas las propiedades de pantalla
                
                f_onchange_cprpty("");
                
                var ok = "${__formdata.OK}";        
                if (!objUtiles.estaVacio(ok) && ok==1){
                    parent.f_aceptar_axismnt020();
                }   
            }
            
            function f_but_aceptar() {
                //Validamos los campos de pantalla, ahora llamaríamos a la función que tocara
                /*if((document.miForm.CPRPTY.value == "<%= Integer.MIN_VALUE %>" ||
                    document.miForm.CITEM.value == "") ||
                   (document.miForm.CVALUE_LLIURE.value == "" &&
                    document.miForm.CVALUE_SINO.value == "<%= Integer.MIN_VALUE %>" &&
                    document.miForm.CVALUE_MASC.value == "<%= Integer.MIN_VALUE %>")){
                   alert("<axis:alt c='ALERT_OBLIGATORIO' f='axismnt020' lit='9001768'/>");
                }else{
                    var tmp = document.miForm.CVALUE_LLIURE.value;
                
                    if(!objUtiles.estaVacio(tmp) && isNaN(tmp)){
                        alert("<axis:alt c='ALERT_NONUMERICO' f='axismnt020' lit='9904241'/>");
                    }else{
                        objUtiles.ejecutarFormulario("modal_axismnt020.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                    }
                }*/
                
                if(objValidador.validaEntrada()){
                    objUtiles.ejecutarFormulario("modal_axismnt020.do", "guardar", document.miForm, "_self", objJsMessages.jslit_cargando);
                }
            }
            
            function f_but_salir() {
                parent.f_cerrar_modal("axismnt020");
            }
            
            function f_onchange_cprpty(pcprpty){
                
                document.miForm.CVALUE_LLIURE.value = "";
                document.miForm.CVALUE_SINO.value = "<%= Integer.MIN_VALUE %>";
                document.miForm.CVALUE_MASC.value = "<%= Integer.MIN_VALUE %>";
                        
                if(objUtiles.estaVacio(pcprpty)){
                    try{
                        /*var o=document.getElementById("CVALUE_LLIURE");
                        o.style.display="";
                        o=document.getElementById("CVALUE_SINO");
                        o.style.display="none";
                        o=document.getElementById("CVALUE_MASC");
                        o.style.display="none";*/
                        objDom.setDisplayPorId("CVALUE_LLIURE","");
                        objDom.setVisibilidadPorId("CVALUE_LLIURE",true);
                        objDom.setDisplayPorId("CVALUE_SINO","none");
                        objDom.setVisibilidadPorId("CVALUE_SINO",false);
                        objDom.setDisplayPorId("CVALUE_MASC","none");
                        objDom.setVisibilidadPorId("CVALUE_MASC",false);
                    }catch(e){}
                }
                else if(pcprpty==1||pcprpty==2||pcprpty==3||pcprpty==9||pcprpty==10||pcprpty==12){
                    try{
                        /*var o=document.getElementById("CVALUE_LLIURE");
                        o.style.display="none";
                        o=document.getElementById("CVALUE_SINO");
                        o.style.display="";
                        o=document.getElementById("CVALUE_MASC");
                        o.style.display="none";*/
                        objDom.setDisplayPorId("CVALUE_LLIURE","none");
                        objDom.setVisibilidadPorId("CVALUE_LLIURE",false);
                        objDom.setDisplayPorId("CVALUE_SINO","");
                        objDom.setVisibilidadPorId("CVALUE_SINO",true);
                        objDom.setDisplayPorId("CVALUE_MASC","none");
                        objDom.setVisibilidadPorId("CVALUE_MASC",false);
                    }catch(e){}
                }
                else if(pcprpty==11){
                    try{
                        /*var o=document.getElementById("CVALUE_LLIURE");
                        o.style.display="none";
                        o=document.getElementById("CVALUE_SINO");
                        o.style.display="none";
                        o=document.getElementById("CVALUE_MASC");
                        o.style.display="";*/
                        objDom.setDisplayPorId("CVALUE_LLIURE","none");
                        objDom.setVisibilidadPorId("CVALUE_LLIURE",false);
                        objDom.setDisplayPorId("CVALUE_SINO","none");
                        objDom.setVisibilidadPorId("CVALUE_SINO",false);
                        objDom.setDisplayPorId("CVALUE_MASC","");
                        objDom.setVisibilidadPorId("CVALUE_MASC",true);
                    }catch(e){}
                }else{
                    try{
                        /*var o=document.getElementById("CVALUE_LLIURE");
                        o.style.display="";
                        o=document.getElementById("CVALUE_SINO");
                        o.style.display="none";
                        o=document.getElementById("CVALUE_MASC");
                        o.style.display="none";*/
                        objDom.setDisplayPorId("CVALUE_LLIURE","");
                        objDom.setVisibilidadPorId("CVALUE_LLIURE",true);
                        objDom.setDisplayPorId("CVALUE_SINO","none");
                        objDom.setVisibilidadPorId("CVALUE_SINO",false);
                        objDom.setDisplayPorId("CVALUE_MASC","none");
                        objDom.setVisibilidadPorId("CVALUE_MASC",false);
                    }catch(e){}
                }                
            }
            
        </script>
    </head>
    <body onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp">
        <c:param name="imagen" value="images/ajax-loader.gif"></c:param>
    </c:import> 

    <form name="miForm" action="" method="POST">
       <input type="hidden" name="operation" value=""/>
       <input type="hidden" name="CEMPRESCAB" id="CEMPRESCAB" value="${__formdata.CABCFG[0].CEMPRES}"/>
       <input type="hidden" name="CIDCFG" id="CIDCFG" value="${__formdata.CABCFG[0].CIDCFG}"/>
       <input type="hidden" name="CFORMCAB" id="CFORMCAB" value="${__formdata.CABCFG[0].CFORM}"/>
       <input type="hidden" name="OK" id="OK" value="${__formdata.OK}"/>

       <input type="hidden" name="PCEMPRES" id="PCEMPRES" value="${__formdata.PCEMPRES}"/>
       <input type="hidden" name="PCFORM" id="PCFORM" value="${__formdata.PCFORM}"/>
       <input type="hidden" name="PCMODO" id="PCMODO" value="${__formdata.PCMODO}"/>
       <input type="hidden" name="PCCFGFORM" id="PCCFGFORM" value="${__formdata.PCCFGFORM}"/>
       <input type="hidden" name="PSPRODUC" id="PSPRODUC" value="${__formdata.PSPRODUC}"/>
        
            <c:import url="../include/titulo_nt.jsp">
                <c:param name="formulario"><axis:alt c="lit_form" f="axismnt020" lit="9904153"/></c:param>
                <c:param name="producto"><axis:alt c="lit_form" f="axismnt020" lit="9904153"/></c:param>
                <c:param name="form">axismnt020</c:param>
            </c:import>
            <div class="separador">&nbsp;</div>
                      <!-- Área de campos  -->
            <table class="mainTableDimensions base" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td>
                    <axis:visible c="SEC_CAB" f="axismnt020">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO1" f="axismnt020" lit="9901994"/>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33.33%;height:0px"></th>
                                            <th style="width:33.33%;height:0px"></th>
                                            <th style="width:33.33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axismnt020" c="CEMPRES" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axismnt020" c="CEMPRES" lit="101619"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="SPRODUC" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axismnt020" c="SPRODUC" lit="100829"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CCFGFORM" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axismnt020" c="CCFGFORM" lit="9001350"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axismnt020" c="CEMPRES" dejarHueco="false">
                                                <td class="campocaja" >                                
                                                    <input type= "text" class="campo campotexto" id="CEMPRES" name="CEMPRES" value="${__formdata.CABCFG[0].TEMPRES}" 
                                                        <axis:atr f="axismnt020" c="CEMPRES" a="modificable=false&obligatorio=false"/> style="width:100%;" />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="SPRODUC" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <input type= "text" class="campo campotexto" id="SPRODUC" name="SPRODUC" value="${__formdata.CABCFG[0].TTITULO}" 
                                                        <axis:atr f="axismnt020" c="SPRODUC" a="modificable=false&obligatorio=false"/> style="width:100%;" />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CCFGFORM" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <input type= "text" class="campo campotexto" id="CCFGFORM" name="CCFGFORM" value="${__formdata.CABCFG[0].TDESC}" 
                                                        <axis:atr f="axismnt020" c="CCFGFORM" a="modificable=false&obligatorio=false"/> style="width:100%;" />
                                                </td> 
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axismnt020" c="CMODO" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axismnt020" c="CMODO" lit="9901139"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CODFORM" dejarHueco="false">
                                                <td class="titulocaja" >
                                                    <b><axis:alt f="axismnt020" c="CODFORM" lit="9904237"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <td class="titulocaja" >
                                                   &nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                           <axis:ocultar f="axismnt020" c="CMODO" dejarHueco="false">
                                                <td class="campocaja" >                                
                                                    <input type= "text" class="campo campotexto" id="CMODO" name="CMODO" value="${__formdata.CABCFG[0].CMODO} - ${__formdata.CABCFG[0].TMODO}" 
                                                        <axis:atr f="axismnt020" c="CMODO" a="modificable=false&obligatorio=false"/> style="width:100%;" />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CODFORM" dejarHueco="false">
                                                <td class="campocaja" >
                                                    <input type= "text" class="campo campotexto" id="CODFORM" name="CODFORM" value="${__formdata.CABCFG[0].CFORM} - ${__formdata.CABCFG[0].TFORM}" 
                                                        <axis:atr f="axismnt020" c="CODFORM" a="modificable=false&obligatorio=false"/> style="width:100%;" />
                                                </td>
                                            </axis:ocultar>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>

                    </td> 
                </tr>
                
                <tr>
                    <td>
                    <axis:visible c="SEC_NOU" f="axismnt020">
                        <div class="separador">&nbsp;</div>
                        <div class="titulo">
                            <img src="images/flecha.gif"/><axis:alt c="LIT_TITULO2" f="axismnt020" lit="9904153"/>
                        </div>
                        <!-- Sección 1 -->
                        <table class="seccion">
                            <tr>
                                <td >
                                    <!-- Área 1 -->
                                    <table class="area" align="center">
                                        <tr>
                                            <th style="width:33.33%;height:0px"></th>
                                            <th style="width:33.33%;height:0px"></th>
                                            <th style="width:33.33%;height:0px"></th>
                                        </tr>
                                        <tr>
                                            <axis:ocultar f="axismnt020" c="CPRPTY" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axismnt020" c="CPRPTY" lit="9904238"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CITEM" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axismnt020" c="CITEM" lit="109373"/></b>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CVALUE" dejarHueco="false">
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axismnt020" c="CVALUE" lit="101159"/></b>
                                                </td>
                                            </axis:ocultar>
                                        </tr>
                                        
                                        <tr>
                                            <axis:ocultar f="axismnt020" c="CPRPTY" dejarHueco="false">
                                                <td class="campocaja">
                                                    <select title="<axis:alt f="axismnt020" c="CPRPTY" lit="9904238"/>" name="CPRPTY" id="CPRPTY" onchange="f_onchange_cprpty(this.value)" <axis:atr f="axismnt020" c="CPRPTY" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:75%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt020" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTPROPIEDADES}">
                                                            <option value = "${element.CATRIBU}" >
                                                                ${element.CATRIBU} - ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CITEM" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type= "text" class="campo campotexto" id="CITEM" name="CITEM" title="<axis:alt f="axismnt020" c="CITEM" lit="109373"/>" 
                                                        <axis:atr f="axismnt020" c="CITEM" a="modificable=true&obligatorio=true"/> style="width:50%;" />
                                                </td>
                                            </axis:ocultar>
                                            <axis:ocultar f="axismnt020" c="CVALUE" dejarHueco="false">
                                                <td class="campocaja">
                                                    <input type= "text" formato="entero" class="campo campotexto" id="CVALUE_LLIURE" name="CVALUE_LLIURE" title="<axis:alt f="axismnt020" c="CVALUE" lit="101159"/>" 
                                                        <axis:atr f="axismnt020" c="CVALUE" a="modificable=true&obligatorio=true"/> style="width:50%;" />
                                               
                                                    <select title="<axis:alt f="axismnt020" c="CVALUE" lit="101159"/>" name="CVALUE_SINO" id="CVALUE_SINO" onchange="" <axis:atr f="axismnt020" c="CVALUE" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:52%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt020" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTSINO}">
                                                            <option value = "${element.CATRIBU}" >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                         
                                                    <select title="<axis:alt f="axismnt020" c="CVALUE" lit="101159"/>" name="CVALUE_MASC" id="CVALUE_MASC" onchange="" <axis:atr f="axismnt020" c="CVALUE" a="obligatorio=true&isInputText=false"/>  size="1" class="campowidthselect campo campotexto" style="width:52%;">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axismnt020" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.LISTVALORES.LSTENMASCARA}">
                                                            <option value = "${element.CATRIBU}" >
                                                                ${element.TATRIBU} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </axis:ocultar>
                                        </tr>   
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </axis:visible>

                    </td> 
                </tr>
            </table>
        
             <div class="separador">&nbsp;</div>
    </form>
    
    <c:import url="../include/botonera_nt.jsp">
       <c:param name="f">axismnt020</c:param>
       <c:param name="__botones"><axis:ocultar f="axismnt020" c = "BT_SALIR" dejarHueco="false">salir</axis:ocultar><axis:ocultar f="axismnt020" c = "BT_ACEPTAR" dejarHueco="false">,aceptar</axis:ocultar></c:param>
    </c:import>
    <c:import url="../include/mensajes.jsp" />
    
    </body>
</html>