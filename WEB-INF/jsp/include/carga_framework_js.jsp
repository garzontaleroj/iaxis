<%/* Revision:# Qid1zVjyMn58N5juyxFwcg== # */%>
<%@page import="com.sun.corba.se.spi.activation.ServerOperations"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import= "axis.util.Constantes, axis.cache.ConfigCache" %> 
<%@ page import="org.apache.commons.logging.*" %>
<%@page import="axis.util.ConversionUtil"%>

<%!
    static Log logger=LogFactory.getLog("cargar_framework_js");   

%>
<%--
 El siguiente código genera el framework propio de javascript, con todos sus mensajes cargados de un bundle y todo.
 Modificado: ecg20141218 http://mantis.srvcsi.com/view.php?id=33925#c194367 (fase 2)
 Importante que funciones Javascript que se montan a base de interaciones, como por ejemplo las dependencias, mantener el numero de caracteres lo mas reducido posible - aunque eso significa que el codigo se hace dificil de entender.
--%>
        <c:if test="${empty applicationScope.__formatNumberPatterns }">
            <c:set var="__formatNumberPatterns" value="<%= Constantes.FORMAT_CURRENCY_PATTERNS %>" scope="application" />
            <c:set var="__defaultCMONINT" value="<%= Constantes.DEFAULT_CMONINT %>" scope="application" />
            <c:set var="__defaultCMONEDA" value="<%= Constantes.DEFAULT_CMONEDA %>" scope="application" />
            <c:set var="__formatNumberPorcentajeDefault" value="###,##0.00" scope="application" />
        </c:if>
        <c:if test="${empty sessionScope.__locale}">           
            <c:set var="__locale" value="<%= ConversionUtil.getDefaultLocale() %>" scope="session" />
        </c:if>
        <c:if test="${empty sessionScope.__locale_formato_numerico}">           
            <c:set var="__locale_formato_numerico" value="<%= ConversionUtil.getLocaleFormatoNumerico() %>" scope="session" />
        </c:if>
        <c:if test="${empty sessionScope.__locale_formato_separadorDecimales}">           
            <c:set var="__locale_formato_separadorDecimales" value="<%= ConversionUtil.getLocaleSeparadorDecimales() %>" scope="session" />
        </c:if>
        <c:if test="${empty sessionScope.__locale_formato_separadorMiles}">           
            <c:set var="__locale_formato_separadorMiles" value="<%= ConversionUtil.getLocaleSeparadorMiles() %>" scope="session" />
		</c:if>        
        <c:if test="${empty applicationScope.__showAyuda }">
        	<c:set var="__showAyuda" value="<%= Constantes.SHOW_AYUDA.get(Constantes.SHOW_AYUDA_STR) %>" scope="application" />
        </c:if>

        <%@ include file="/scripts/cargarBundle.jsp"%>
        <script type="text/javascript" src="scripts/json2.js"></script>
        <script type="text/javascript" src="scripts/jsJson2.js"></script>
        <script type="text/javascript" src="scripts/jsValidador.js"></script>
        <script type="text/javascript" src="scripts/jsAlert.js"></script>
        <script type="text/javascript" src="scripts/jsUtiles.js"></script>
        <script type="text/javascript" src="scripts/jsFecha.js"></script>
        <script type="text/javascript" src="scripts/jsNumero.js"></script>
        <script type="text/javascript" src="scripts/jsCorreo.js"></script>
        <script type="text/javascript" src="scripts/jsTelefono.js"></script>
        <script type="text/javascript" src="scripts/jsNif.js"></script>
        <script type="text/javascript" src="scripts/jsCodigoPostal.js"></script>
        <script type="text/javascript" src="scripts/jsHora.js"></script>
        <script type="text/javascript" src="scripts/jsbn.js"></script>
        <script type="text/javascript" src="scripts/jsbn2.js"></script>
        <script type="text/javascript" src="scripts/jsIban.js"></script>
        <script type="text/javascript" src="scripts/jsDom.js"></script>
        <script type="text/javascript" src="scripts/jsLista.js"></script>
        <script type="text/javascript" src="scripts/jsAppMensajes.js"></script>
        <script type="text/javascript" src="scripts/jsEventos.js"></script>
        <script type="text/javascript" src="scripts/jsAjax.js"></script>
        <script type="text/javascript" src="scripts/jsEstilos.js"></script>
        <script type="text/javascript" src="scripts/jsAyuda.js"></script>
        <script type="text/javascript" src="scripts/jsDependencias.js"></script>
        <script type="text/javascript" src="scripts/jsEdicionTexto.js"></script>
        <!-- Especial per controlar els scroll amb iPad -->
        <script type="text/javascript" src="scripts/jquery-1.7.1.min.js"></script>
        <script type="text/javascript" src="scripts/jquery.import_js.js"></script>
        <script type="text/javascript" src="scripts/jscroll.js"></script>
        <!-- FI Especial per controlar els scroll amb iPad -->
        <script type="text/javascript" src="scripts/jquery.cookie.js"></script>
        <script type="text/javascript" src="scripts/jsSeccion.js"></script>
        
        <script type="text/javascript">
            var objUtiles = new JsUtiles();
            //Objeto para printear las validaciones segun locale (partiendo de jsMesssages.properties)
            var objJsMessages = new JsMessages();
            //Definimos los objetos genéricos para poder trabajar con ellos en todo el aplicativo
            var objAlert = new JsAlert();
            var objValidador = new JsValidador();
            var objNumero = new JsNumero();
            objNumero.init('${sessionScope.__locale_formato_numerico}');
	        <c:forEach items="${__formatNumberPatterns}" var="item">
	            objNumero.addFormatNumberPatterns('${item.key}','${item.value}');                     
	        </c:forEach>
            objNumero.addFormatNumberPatterns('USA', '###.###.##0,00');
            objNumero.setFormatDefault('${__formatNumberPatterns[sessionScope.__locale_formato_numerico]}');
            objNumero.setDefaultCMONEDA('${__defaultCMONEDA}');
            objNumero.setDefaultCMONINT('${sessionScope.__locale_formato_numerico}');
            var objDom = new JsDom();
            var objLista = new JsLista();
            var objAppMensajes = new JsAppMensajes();
            var objEventos = new JsEventos();
            var objAjax = new JsAjax();
            var objEstilos = new JsEstilos();
            var objAyuda = new JsAyuda();
            var objDependencias = new JsDependencias();
            var objEdicionTexto = new JsEdicionTexto();
            var isDebugAjaxEnabled = '${applicationScope.isDebugAjaxEnabled}';
            var nuevaVentana      = null;
            var idVentanas        = new Array();
            var contadorVentanas  = 0;
            var toggles_js = new Array();
            var objSeccion = new JsSeccion();
	       
	<%
		String serverInfo = "Tomcat/6.0";
	
	
		try{
		  if(request.getClass().getMethod("getServletContext")!=null && request.getClass().getMethod("getServletContext").isAccessible())
			serverInfo = ((ServletContext)request.getClass().getMethod("getServletContext").invoke(request,null)).getServerInfo();
		}catch(NoSuchMethodException e){
			logger.debug(serverInfo+" request");	
		}
		try{
		if(this.getClass().getMethod("getServletContext")!=null )
			serverInfo = ((ServletContext)this.getClass().getMethod("getServletContext").invoke(this,null)).getServerInfo();		
		}catch(NoSuchMethodException e){
			logger.debug(serverInfo+" this");	
		}
		logger.debug(serverInfo);
		
%>
        	var version = "<%=serverInfo%>"; 
	     var version_tomcat = "6";
             if(version.indexOf("Tomcat") != -1){ 
        		 version_tomcat = version.split("/")[1].substring(0,1); 
             }
        	
    
            //Función para abrir docs de GEDOX,  XPL
            this.f_ver_doc = function(IDDOC){
                //document.miForm.IDDOC.value = IDDOC;
                nuevaVentana = window.open("modal_axisgedox.do?operation=tunnel&IDDOC=" + IDDOC);    
                   
                // Abrir un proceso con setInterval para cerrar la ventana recién abierta
                
                if (document.all) {
                    idVentanas[contadorVentanas] = setInterval("f_cerrar_nuevaVentana()", 100);
                    contadorVentanas++;
                }  
            }  
             this.f_cerrar_nuevaVentana = function(){
                    try {
                        if (nuevaVentana != null && nuevaVentana.document.readyState != 'loading') {
                            nuevaVentana.window.close();
                        }
                    } catch (e) {}
                } 
            
            /*** Prevenir Backspace y F5 en IE6 ***/   
            if (document.all && navigator.userAgent.indexOf("MSIE 6.0") > -1) {
                document.onkeydown = function() {                     
                    if ( window.event && ( (window.event.keyCode == 8  && window.event.srcElement.type != "password") || window.event.keyCode == 116 )  ) {

                          if((window.event.srcElement.type != "text" && window.event.srcElement.type != "textarea") || (window.event.srcElement.disabled==true || window.event.srcElement.readOnly==true )){

                            window.event.keyCode = 505; 
                          }
                    }
                    
                    if (window.event.keyCode == 505) { 
                        return false; 
                    }
                }
            }               
            /*****/
            
<%
//Si en la pantalla que cargamos, hay campos asociados a displayTags (DSP_XXX)
if(request.getAttribute("DISPLAY_ITEMS")!=null){
%>
function f_tratarDisplayTagsPorConfiguracion(){
    try{
        <%
        int valores_defecto_size = ((java.util.List)request.getAttribute("DISPLAY_ITEMS")).size();
		//ecg AXIS7851
		%>
		var CAMPOID    =null;
		var visible    =null;
		var modificable=null;
		<%
        for(int i=0;i<valores_defecto_size;i++){ 
        %>
            CAMPOID = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("DISPLAY_ITEMS")).get(i)).get("CAMPOID")%>';
            visible = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("DISPLAY_ITEMS")).get(i)).get("visible")%>';
            modificable = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("DISPLAY_ITEMS")).get(i)).get("modificable")%>';                           
            if(document.getElementById(CAMPOID) && objUtiles.utilEquals(visible, "true") && objUtiles.utilEquals(modificable, "false")) {  objDom.setVisibilidadPorId(CAMPOID, "visible"); }
        <%
        }
        %>
    } catch (e) {
        if (isDebugAjaxEnabled == "true") alert (e.name + " " + e.message);
    }
}
<%
}else{
%>
    function f_tratarDisplayTagsPorConfiguracion(){} 
<%
}
%>
            
            <%
            //Si en la pantalla que cargamos, hay campos con algun valor por defecto o no
            if(request.getAttribute("VALOR_POR_DEFECTO")!=null){
            %>
     //Método que gestiona los campos que tienen valores por defecto
 function f_cargar_valores_defecto(){
     try{
         <%
         int valores_defecto_size = ((java.util.List)request.getAttribute("VALOR_POR_DEFECTO")).size();
                               //ecg AXIS7851
	   %>
	   var CAMPOID =null;
	   var VALOR = null;
		<%
         for(int i=0;i<valores_defecto_size;i++){ 
             String campoid = (String)((java.util.Map)((java.util.List)request.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("CAMPOID");
             String valor = (String)((java.util.Map)((java.util.List)request.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("VALOR");
             request.getSession().setAttribute(campoid+"__DEFAULT",valor);
         %>
     CAMPOID = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("CAMPOID")%>';
     VALOR = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("VALOR_POR_DEFECTO")).get(i)).get("VALOR")%>';

     if (objUtiles.existeObjeto(document.getElementById(CAMPOID))){

		var integerMinValue = '<%= Integer.MIN_VALUE %>';
         if(objUtiles.estaVacio(objDom.getValorPorId(CAMPOID)) ||
              objUtiles.utilEquals(objDom.getValorPorId(CAMPOID), "null") ||
              objUtiles.utilEquals(objDom.getValorPorId(CAMPOID), integerMinValue)) {
            
             if(objUtiles.utilEquals(document.getElementById(CAMPOID).type,"checkbox") || objUtiles.utilEquals(document.getElementById(CAMPOID).type,"radio") ){
                 if(VALOR==1){
                    document.getElementById(CAMPOID).checked = true;
                 }else{
                     document.getElementById(CAMPOID).checked = false;
                 }
             }else{
                 objDom.setValorPorId(CAMPOID, VALOR);
             }
         
          
          }
     }
         <%
         }
         %>
     } catch (e) {
         if (isDebugAjaxEnabled == "true")
         alert (e.name + " " + e.message);
     }
 }
 <%
 }else{
 %>
 function f_cargar_valores_defecto(){}  
 <%
 }
            
            
//Si en la pantalla que cargamos, hay dependencias o no
if(request.getAttribute("NUM_DEPENDENCIAS")!=null){
%>


function f_prevalece_especificio_body(__CITORIG, CITORIG, TVALORIG) {
         if    (  objUtiles.utilEquals(__CITORIG, CITORIG) ){
             if(!objUtiles.estaVacio(((document.getElementById(CITORIG)!=undefined)? objDom.getValorPorId(CITORIG) : null))) {
                      if(objUtiles.utilEquals(objDom.getValorPorId(CITORIG), TVALORIG)) {  return 1;  }
                }
         }
}


//XPL#17313#18/01/2011
//Función donde miramos si existe algun valor especificio para el campo de la dependencia,
//en caso de que haya valor para el campo de pantalla en la configuración que nos llega
//de bd no haremos caso a la configuración del notnull        
function f_prevalece_especificio(__CITORIG,__TVALORIG){
try{ 
  //Miramos si el valor a evaluar es notnull
  if    (  objUtiles.utilEquals(__TVALORIG, 'notnull')    ){
    
     var propiedades = objDependencias.cargaPropiedadesPantalla();
    <%
    int dependencias_sizes = ((java.lang.Integer)request.getAttribute("NUM_DEPENDENCIAS")).intValue();
	//ecg AXIS7851
	%>
	var CITORIG = null;
	var TVALORIG =null;
	<%
	String javaCITORIG = null;
	String javaTVALORIG= null;
	java.util.HashMap yaLoHeTratado=new java.util.HashMap();				
    for(int x=0;x<dependencias_sizes;x++){
        for(int jj=0;jj<((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(x))).size();jj++){
		//if (gremlin&&jj>10) break;
		javaCITORIG =(String)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(x))).get(jj)).get("CITORIG");
		javaTVALORIG=(String)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(x))).get(jj)).get("TVALORIG");
		if (yaLoHeTratado.get("CITORIG_"+javaCITORIG+"_TVALORIG_"+javaTVALORIG)==null) { //aun no lo hemos tratado
        %>
<%--		
		//aun no yaLoHeTratado <%=javaCITORIG%>,<%=javaTVALORIG%>
         CITORIG = '<%=javaCITORIG%>';
         TVALORIG = '<%=javaTVALORIG%>';    

		 f_prevalece_especificio_body(__CITORIG, CITORIG, TVALORIG) 	;
--%>
		 f_prevalece_especificio_body(__CITORIG, '<%=javaCITORIG%>', '<%=javaTVALORIG%>') 	;

<%--		
         if    (  objUtiles.utilEquals(__CITORIG, CITORIG) ){
             if(!objUtiles.estaVacio(((document.getElementById(CITORIG)!=undefined)? objDom.getValorPorId(CITORIG) : null))) {
                      if(objUtiles.utilEquals(objDom.getValorPorId(CITORIG), TVALORIG)) {  return 1;  }
                }
         }
--%>
         <% 
		 } //end-if yaLoHeTratado
			yaLoHeTratado.put("CITORIG_"+javaCITORIG+"_TVALORIG_"+javaTVALORIG, true); //dejar la marca q ya lo he tratao
			} //end-for jj
         } //end-for x
		 %>
    }   
    return 0;
    }catch(e){
        return 0;
    }

} 


function f_carga_dependencias_body(CITORIG,TVALORIG,CITDEST,CPRPTY,TVALUE1_LITERAL_CUANDO_CPRPTY_ES_8,TVALUE2_LITERAL_CUANDO_CPRPTY_ES_8,propiedades,TVALUE) {
	if (f_prevalece_especificio(CITORIG,TVALORIG)  == 0){


	if(!objUtiles.estaVacio(((document.getElementById(CITORIG)!=undefined)? objDom.getValorPorId(CITORIG) : null)))  {
         if(objUtiles.utilEquals(objDom.getValorPorId(CITORIG), TVALORIG) || (!objUtiles.estaVacio(document.getElementById(CITORIG)) && objUtiles.utilEquals ('notnull', TVALORIG))  ) {
			if (CPRPTY==8) {
				TVALUE = TVALUE1_LITERAL_CUANDO_CPRPTY_ES_8;
			}
            objDependencias.cambiarPropiedades(CITDEST, CPRPTY, TVALUE, propiedades);
         }
       } else {
			if (TVALORIG=="null") {
				if (CPRPTY==8) {
					TVALUE = TVALUE2_LITERAL_CUANDO_CPRPTY_ES_8;
				}
				objDependencias.cambiarPropiedades(CITDEST, CPRPTY, TVALUE, propiedades);
			}
		}
    }

	
	
	
}


      //Método que gestiona las dependencias de cada pantalla
function f_carga_dependencias(){
try{
    var propiedades = objDependencias.cargaPropiedadesPantalla();
    <%
    int dependencias_size = ((java.lang.Integer)request.getAttribute("NUM_DEPENDENCIAS")).intValue();
	//ecg AXIS7851
	%>
	var CITORIG  = null;
	var TVALORIG = null;
	var CITDEST  = null;
	var CPRPTY   = null;
	var TVALUE   = null;
	var TVALUE1_LITERAL_CUANDO_CPRPTY_ES_8=null;
	var TVALUE2_LITERAL_CUANDO_CPRPTY_ES_8=null;
	var jsJj=0;
	<%
	String CPRPTY   = null;
	String TVALORIG   = null;
    for(int i=0;i<dependencias_size;i++){
        for(int j=0;j<((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).size();j++){
			//if (gremlin&&j>490) break;
			request.setAttribute("TVALOR",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALUE")); 
		    CPRPTY=""+(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("CPRPTY");
		    TVALORIG=""+(String)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALORIG"); %>
	jsJj=<%=j%>;     
	CITORIG = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("CITORIG")%>';
    TVALORIG = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALORIG")%>';     
	CITDEST = '<%=(String)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("CITDEST")%>'; 
    CPRPTY = <%=(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("CPRPTY")%>;     
	TVALUE = <%=(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALUE")%>;
<%--
	TVALUE1_LITERAL_CUANDO_CPRPTY_ES_8 = "<axis:alt f="carga_framework" c="TVALOR1" lit="${requestScope.TVALOR}"/>";
	TVALUE2_LITERAL_CUANDO_CPRPTY_ES_8 = "<axis:alt f="carga_framework" c="TVALOR2" lit="${requestScope.TVALOR}"/>";
--%>
<% if ((CPRPTY).equals("8")) {  	request.setAttribute("TVALOR",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALUE")); %>
	TVALUE1_LITERAL_CUANDO_CPRPTY_ES_8 = "<axis:alt f="carga_framework" c="TVALOR1" lit="${requestScope.TVALOR}"/>"; <% } //end-if CPRPTY == 8 %> 
<% if (TVALORIG.equals("null")) { 
	   if ((CPRPTY).equals("8")) {  	request.setAttribute("TVALOR",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALUE"));	%>
	TVALUE2_LITERAL_CUANDO_CPRPTY_ES_8 = "<axis:alt f="carga_framework" c="TVALOR2" lit="${requestScope.TVALOR}"/>"; <% } //end-if CPRPTY == 8 %><% } //end-if TVALORIG.equals("null") %>
	f_carga_dependencias_body(CITORIG,TVALORIG,CITDEST,CPRPTY,TVALUE1_LITERAL_CUANDO_CPRPTY_ES_8,TVALUE2_LITERAL_CUANDO_CPRPTY_ES_8,propiedades,TVALUE);
<%--
	if (f_prevalece_especificio(CITORIG,TVALORIG)  == 0){
       if(!objUtiles.estaVacio(((document.getElementById(CITORIG)!=undefined)? objDom.getValorPorId(CITORIG) : null)))  {
         if(objUtiles.utilEquals(objDom.getValorPorId(CITORIG), TVALORIG) || (!objUtiles.estaVacio(document.getElementById(CITORIG)) && objUtiles.utilEquals ('notnull', TVALORIG))  ) {
			<% if ((CPRPTY).equals("8")) {  	request.setAttribute("TVALOR",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALUE")); %>
            TVALUE = "<axis:alt f="carga_framework" c="TVALOR1" lit="${requestScope.TVALOR}"/>"; <% } //end-if CPRPTY == 8 %> 
            objDependencias.cambiarPropiedades(CITDEST, CPRPTY, TVALUE, propiedades);
         }
       } <% if (TVALORIG.equals("null")) { %> else { <%
				if ((CPRPTY).equals("8")) {  	request.setAttribute("TVALOR",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getAttribute("DEPENDENCIA"+java.lang.Integer.toString(i))).get(j)).get("TVALUE"));	%>
				TVALUE = "<axis:alt f="carga_framework" c="TVALOR2" lit="${requestScope.TVALOR}"/>"; <% } //end-if CPRPTY == 8 %> 
            objDependencias.cambiarPropiedades(CITDEST, CPRPTY, TVALUE, propiedades);
		}
		<% } //end-if TVALORIG.equals("null") %>
    }
--%>
	
	<%
        }
    }
    %>
} catch (e) {
    if (isDebugAjaxEnabled == "true") alert (e.name + " " + e.message);
}
}
  <%   } else {   %>
function f_carga_dependencias(){
}
<% } %>
            
            function f_clear_resources(d) {            
                try {
                    objUtiles       = null;
                    objJsMessages   = null;                
                    objAlert        = null;
                    objValidador    = null;                
                    objNumero       = null;                
                    objDom          = null;
                    objLista        = null;
                    objAppMensajes  = null;
                    objEventos      = null;
                    objAjax         = null;
                    objEstilos      = null;
                    objAyuda        = null;
                    objDependencias = null;
                    
                    var a = d.attributes, i, l, n;
                    if (a) {
                        l = a.length;
                        for (i = 0; i < l; i += 1) {
                            n = a[i].name;                        
                                d[n] = null;
                        }
                    }
                    a = d.childNodes;
                    if (a) {
                        l = a.length;
                        for (i = 0; i < l; i += 1) {
                            f_clear_resources(d.childNodes[i]);
                        }
                    }
                } catch (e) {}                        
            }
function f_cargapropietatexpander_arbol() {            
    try {
    <%
   java.util.Map configuracio =(java.util.Map)request.getAttribute("__configform");
   
       java.util.Iterator it = configuracio.entrySet().iterator();
	   //ecg AXIS7851
	   %> 
	   var form     =null;      
	   var camp     =null; 
	   var propietat=null; 
	   var valor    =null; 
	   var keySplitted=null;
	   <%
        while (it.hasNext()) {
            java.util.Map.Entry e = (java.util.Map.Entry)it.next();
			boolean isExpander=(""+e.getKey()).indexOf("expander")>=0; //solo tiene sentido valida si isExpander==true
			//out.println("//isExpander="+isExpander);
			if (isExpander) {
            %>
	keySplitted=objUtiles.utilSplit("<%=e.getKey()%>", "__");
	form      = keySplitted[0];  camp      = keySplitted[1];   propietat = keySplitted[2];   valor     = "<%=e.getValue()%>";
	if (!objUtiles.estaVacio(propietat) && propietat == "expander" &&  !objUtiles.estaVacio(valor)     && valor     == "true"){
		   try{ f_abrir_secciones_js(camp, document.getElementById(camp + "_parent"));  }catch(e){}
	}
        <% } //end-if isExpander
		}
		%>
    } catch (e) {}  
    
}  
            
function f_abrir_secciones_js (ths, objeto, img_mes, img_menys) {
           
    var pimg_mes="images/mes.gif"
    var pimg_menys="images/menys.gif"
    
    if (img_mes!=undefined || img_mes!=null) pimg_mes=img_mes;
    if (img_menys!=undefined || img_menys!=null) pimg_menys=img_menys;
    
    var thisChildrenId=ths+"_children";
    if (document.getElementById(thisChildrenId)!=null){
        var actualDisplayValue=document.getElementById(thisChildrenId).style.display;
    }
        
    var resto = document.getElementsByTagName("tr");


    for (i=0; i < resto.length; i++) {            
        if(resto[i].getAttribute("tipo")=='cont'){
             resto[i].style.display="none";
        }
    }

    if (actualDisplayValue=="none"){ 
        actualDisplayValue="";// en vez de "block", mejor "" para evitar FireFox bug
        var imagen =	document.getElementById("img_"+ths);
          if ( imagen.src.indexOf("plus.gif") > -1)
         	pimg_menys = "images/minus.gif";
         else if ( imagen.src.indexOf("plusbottom.gif")  > -1 )
         	pimg_menys = "images/minusbottom.gif";
	
        			                      
        toggles_js[toggles_js.length]= ths;  
              
        if ( !objUtiles.estaVacio(imagen)) {imagen.src=pimg_menys; }//"images/menys.gif";
        }else{ 
            actualDisplayValue="none";
               var imagen =	document.getElementById("img_"+ths);
           			if ( imagen.src.indexOf("minus.gif")  > -1)
                 	pimg_mes = "images/plus.gif";
                 else if ( imagen.src.indexOf("minusbottom.gif")  > -1)
                 	pimg_mes = "images/plusbottom.gif";     
                    toggles_js[toggles_js.length]= ths;
                    
            if ( !objUtiles.estaVacio(imagen)) imagen.src=pimg_mes;//"images/mes.gif";
        }
        if (document.getElementById(thisChildrenId)!=null){
            document.getElementById(thisChildrenId).style.display=actualDisplayValue;
        }
      }          

function f_cargapropietatexpander_body(form, camp, propietat, valor) {
    if (!objUtiles.estaVacio(propietat) && propietat == "expander" &&   !objUtiles.estaVacio(valor)     && valor     == "true"){
        
        if (camp.indexOf("exp_dinam") > -1){
            var i = 1;
            var camp2 = camp.replace("exp_dinam",i);
            while(!objUtiles.estaVacio( document.getElementById(camp2 + "_parent") )){
                objEstilos.toggleDisplay(camp2, document.getElementById(camp2 + "_parent"));
                i++;
                camp2 = camp.replace("exp_dinam",i);
            }
        }else{
            if (!objUtiles.estaVacio( document.getElementById(camp + "_parent") ) ){
                objEstilos.toggleDisplay(camp, document.getElementById(camp + "_parent"));
            }
        }
    }
}	  
	  
function f_cargapropietatexpander() {            
	var form      =null;
	var camp      =null;
	var propietat =null;
	var valor     =null;
	var egetKeySplit=null;

	/*Se adapta el codigo para que se puedan configurar por cfg's DSP's generadas , ver "exp_dinam"
	 *dinamicamente
	 */
    try {
    <%
	configuracio =(java.util.Map)request.getAttribute("__configform");
       
    it = configuracio.entrySet().iterator();
    while (it.hasNext()) {
        java.util.Map.Entry e = (java.util.Map.Entry)it.next();
        %>
	egetKeySplit=objUtiles.utilSplit("<%=e.getKey()%>", "__");
    form      = egetKeySplit[0];   camp      = egetKeySplit[1];   propietat = egetKeySplit[2];   valor     = "<%=e.getValue()%>";  
	f_cargapropietatexpander_body(form, camp, propietat, valor);
<%--	//en vez del codigo que sigue, se hace la llamada a f_cargapropietatexpander_body
    if (!objUtiles.estaVacio(propietat) && propietat == "expander" &&   !objUtiles.estaVacio(valor)     && valor     == "true"){
        
        if (camp.indexOf("exp_dinam") > -1){
            var i = 1;
            var camp2 = camp.replace("exp_dinam",i);
            while(!objUtiles.estaVacio( document.getElementById(camp2 + "_parent") )){
                objEstilos.toggleDisplay(camp2, document.getElementById(camp2 + "_parent"));
                i++;
                camp2 = camp.replace("exp_dinam",i);
            }
        }else{
            if (!objUtiles.estaVacio( document.getElementById(camp + "_parent") ) ){
                objEstilos.toggleDisplay(camp, document.getElementById(camp + "_parent"));
            }
        }
    }
--%>       
    <%}%>
    } catch (e) {}                        
}            

			
        function revisarEstilos() {
            var itemsArray=null;
            var emptyClassAttribute = document.createAttribute("class");
            //emptyClassAttribute.nodeValue = "";
			emptyClassAttribute.value = "";
            
            // Inici BUG 26923 - 12/07/2013 - RCL
            //Llista d´elements a revisar estils
            $.each([ "input", "select", "textarea" ],function(indice,valor) 
            {
                itemsArray=document.getElementsByTagName(valor);
                if (itemsArray!=null && itemsArray!=undefined) {
                    var miItem=null;
                    var className=null;
                    for (i=0;i<itemsArray.length;i++) {
                        miItem=itemsArray[i];
                        if (miItem.className==undefined || miItem.className==null) {
                            miItem.setAttributeNode(emptyClassAttribute);
                        }
                        className=miItem.className;
                        if (!( miItem.type=="hidden" || miItem.type=="button" || miItem.style.visibility == "hidden"   )) { // no aplica para hidden's o button's
                            
                            // test campotexto 
                            if (className.indexOf("campo")>=0 && className.indexOf("campotexto")<0) {
                                miItem.className="campotexto "+miItem.className
                            }
                            
                            // test readonly & disabled
                            var underscoreReadonly="_"+miItem.getAttribute("readonly");
                            var underscoreDisabled="_"+miItem.getAttribute("disabled");
                            
                            if (underscoreReadonly=="_" || underscoreReadonly=="_true" || underscoreReadonly=="_readonly" ||
                                underscoreDisabled=="_" || underscoreDisabled=="_true" || underscoreDisabled=="_disabled") 
                            {
                                // añadir un "campodisabled" si aun no esta puesto en ClassName
                                if (className.indexOf("disabled")<0) 
                                {
                                    $(miItem).addClass("campodisabled");
                                }
                            }
                            else
                            {
                                $(miItem).removeClass("campodisabled");
                            }
            
                            // test obligatorio=true
                            if (miItem.getAttribute("obligatorio")!=null && miItem.getAttribute("obligatorio")=='true') {
                                // añadir un "campotexto_ob" si aun no esta puesto en ClassName
                                if (className.indexOf("_ob")<0) {
                                    $(miItem).addClass("campotexto_ob");
                                }
                            }else{
                                if(miItem.className.indexOf("campotexto_ob")>0){                                   
                                    miItem.className= miItem.className.replace("campotexto_ob","");
                                }
                            }
                        }                      
                    }
                }
            });
            // Fi BUG 26923 - 12/07/2013 - RCL

        }

function f_cargar_suplementos () {
  try{
        var afegits = new Array(0);
        <%
        if (request.getSession().getAttribute("CONF_SUPL")!= null){
			//ecg AXIS7851
			%>
		var TGRUPDADES =null;
		var CMOTMOV=null;
		var TMOTMOV=null;
		var SLITERA=null;
		<%
        for(int j=0;j<((java.util.List)request.getSession().getAttribute("CONF_SUPL")).size();j++){
            String  gd = (String)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("TGRUPDADES");  %>
            TGRUPDADES = '<%=gd%>';
            if(!objUtiles.existeObjeto(document.getElementById("DSP_"+TGRUPDADES))){
				CMOTMOV =    '<%=(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("CMOTMOV")%>';
				TMOTMOV = "<%=(String)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("TMOTMOV")%>";
				SLITERA = '<%=(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("SLITERA")%>';
            <%
            if (java.util.Collections.frequency((java.util.List)request.getSession().getAttribute("GRUP_DADES"),gd) < 2){
              request.setAttribute("SLITERA",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("SLITERA")); %>
            if (!objUtiles.estaVacio(SLITERA) && SLITERA!= 'null' )
                TMOTMOV = "<axis:alt f="carga_framework" c="SLITERA2" lit="${requestScope.SLITERA}"/>";
                afegirSuplement(TGRUPDADES,CMOTMOV, TMOTMOV);
                <%
            }else{
                %>
                  if (!estaAfegit(afegits, TGRUPDADES)){
                    afegits[afegits.length]= TGRUPDADES;
                    afegirSuplements(TGRUPDADES,CMOTMOV, TMOTMOV, SLITERA);
                  }
                <% } %>
            }
        <% } }%>
    
    } catch (e) {
           // alert (e.name + " " + e.message);
    }
} 
        
function f_limpiar_secciones_vacias(){
     <%
    if (request.getSession().getAttribute("CONF_SUPL")!= null){
	//ecg AXIS7851
	%>
	var TGRUPDADES=null;
	var CMOTMOV   =null; 
	
	<%
	for(int j=0;j<((java.util.List)request.getSession().getAttribute("CONF_SUPL")).size();j++){
		String  gd = (String)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("TGRUPDADES");
		String  CMOTMOV = (String)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("TGRUPDADES"); %>
	 var TGRUPDADES = '<%=gd%>';
	 var CMOTMOV = '<%=CMOTMOV%>';
   
	if(objUtiles.existeObjeto(document.getElementById("SECCION_"+TGRUPDADES))){
	  try{
		if (!objUtiles.estaHidden("SECCION_"+TGRUPDADES)){
			var tab=document.getElementById("SECCION_"+TGRUPDADES);
			cont = 0;
			var elea = tab.getElementsByTagName('a');
			 for (i=0; i<elea.length;  i++) {
				   if (!objUtiles.estaHidden(elea[i].id)) cont ++;
			}
			  if (cont == 0){
				
				if(objUtiles.existeObjeto(document.getElementById("SUPL_"+TGRUPDADES))){
					document.getElementById("SUPL_"+TGRUPDADES).style.display="none";
					document.getElementById("SUPL_"+TGRUPDADES).style.visibility="hidden";
				}
			  }
		   }
		}catch(e){}
		
	}
            
        <%}
		}%>     

}
        
        function estaAfegit(afegit, GRUPDADES){
            if (afegit.length > 0 ) {
                for (var i = 0;i<afegit.length;i++){
                     if ( objUtiles.utilEquals(afegit[i],GRUPDADES)){
                     return true;
                     }
                }
             }
           return false;
       }
        
         /**
         * Función llamada desde el onload de las pantallas
         **/
         function f_cargar_propiedades_pantalla(pantalla){
                if(typeof f_cargapropietatexpander == 'function') { 
                  if (!objUtiles.estaVacio(pantalla)){
                    toggles_js = new Array();
                    f_cargapropietatexpander_arbol();
                  }else
                    f_cargapropietatexpander();
                }
                if(typeof f_cargar_valores_defecto == 'function') { 
                    f_cargar_valores_defecto();
                }
                if ((objDependencias!=null)&&(typeof objDependencias.modificarPropiedadesSegunModificableYVisible == 'function')) { 
                    objDependencias.modificarPropiedadesSegunModificableYVisible();
                }
                if(typeof f_carga_dependencias == 'function') { 
                    f_carga_dependencias();
                }
                if(typeof revisarEstilos == 'function') { 
                    revisarEstilos();
                }
                
                if (!objUtiles.estaVacio(pantalla) &&  ( objUtiles.utilEquals(pantalla,'axisctr020')) ) {
                  if(typeof f_limpiar_secciones_vacias == 'function') 
                        f_limpiar_secciones_vacias();
                }
              if (!objUtiles.estaVacio(toggles_js)){
              
                return toggles_js;
                }
            }
            
         function afegirSuplement(GRUPDADES, CMOTMOV, TMOTMOV){
             try {
                     var linea =  '<a id="'+CMOTMOV+'" name="'+CMOTMOV+'" href="javascript:f_inicializar_suplemento('+CMOTMOV+', \'DSP_'+GRUPDADES+'\')">';
                     linea = linea +'<img border="0" alt="'+TMOTMOV+'" src="images/suplemento.gif"/></a>';
                     document.getElementById(GRUPDADES).innerHTML = linea;
              } catch (e) {
              }
        }
        
 function afegirSuplements(GRUPDADES, CMOTMOV, TMOTMOV, SLITERA){
     try {
     
     var linea = '<img id="SUPL_'+GRUPDADES+'" name="SUPL_'+GRUPDADES+'" border="0" alt="<axis:alt f="carga_framework" c="LITSUP" lit="1000126"/>"  src="images/suplemento.gif"';
     linea = linea +'onclick="javascript:mostrar_ocultar(\'SECCION_'+GRUPDADES+'\')" />'; 
     document.getElementById(GRUPDADES).innerHTML = linea;
      
     var linea = '<table class="area" align="center">';
     linea = linea +'<tr><th style="width:100%;height:0px"></th></tr>'; 
    linea = linea +'<tr><td><div style="float:right;"> <img style="width:12px;height:12px" onclick="javascript:ocultar(\'SECCION_'+GRUPDADES+'\');" src="images/but_cerrar.gif"></img></div></td></tr>'; 
 
    <%
	if (request.getSession().getAttribute("CONF_SUPL")!= null){
	//ecg AXIS7851
	%>
	var CMOTMOV=null;
	var TMOTMOV=null;
	var SLITERA=null;
		
	<%
	for(int j=0;j<((java.util.List)request.getSession().getAttribute("CONF_SUPL")).size();j++){
		String  gd = (String)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("TGRUPDADES");
		String SLITERA=null; %>
		var TGRUPDADES = '<%=gd%>';
		if ( objUtiles.utilEquals(TGRUPDADES,GRUPDADES)){
			CMOTMOV =    '<%=(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("CMOTMOV")%>';
			TMOTMOV = "<%=(String)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("TMOTMOV")%>";
			SLITERA = '<%=(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("SLITERA")%>';
			<%SLITERA=""+((java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("SLITERA"));
			request.setAttribute("SLITERA",(java.math.BigDecimal)((java.util.Map)((java.util.List)request.getSession().getAttribute("CONF_SUPL")).get(j)).get("SLITERA")); %>

		<% if (SLITERA!=null && !SLITERA.equals("null")) { %>
		TMOTMOV = "<axis:alt f="carga_framework" c="SLITERA" lit="${requestScope.SLITERA}"/>";
		<% } //end-if SLITERA !vacio %>
		linea = linea +'<tr><td class="titulocaja">';
		linea = linea +'<a id="'+CMOTMOV+'" name="'+CMOTMOV+'" href="javascript:ocultar(\'SECCION_'+GRUPDADES+'\');f_inicializar_suplemento('+CMOTMOV+', \'DSP_'+GRUPDADES+'\')">';
		linea = linea + TMOTMOV+'</a></td></tr>'; 
		}
            <%
            }
        } 
    %>
         linea = linea +'</table>';
         document.getElementById("SECCION_"+GRUPDADES).innerHTML = linea;
  } catch (e) {
                //alert (e.name + " " + e.message);
        }
}
        
function retocarPAGE_CSS(pantalla) {
	try{
		var heightmodal = this.f_get_height_modal(pantalla);
		if (heightmodal < 485) heightmodal = 485;
		if(heightmodal > 950) heightmodal = 950;
		var PAGE_CSS=document.getElementById("page-css");
		PAGE_CSS.innerText=".wrapper{width:100%;height:"+heightmodal+"px;overflow: auto;}"
		$.reinitialiseScroll(); 
	}catch(e){ }
}		
			
function f_get_height_modal(nid) { //retorna el tamaño de una modal construida en pantalla
	 try{ 
	 	
	 	
		 var mws=parent.document.getElementById("mw_"+nid+"_s");
	
		  var st_heightpx=mws.style.height;
		  var st_height=-1;
			  if (st_heightpx.indexOf("px")>=0) {
			   	st_height=eval(st_heightpx.substring(0,st_heightpx.indexOf("px")));
			  }
			  else {
			   	st_height=eval(st_heightpx);
			  }
			  if (st_height>0) {
			   	st_height=st_height*0.95; // hacerlo un poco mas pequeño - probar cual es el valor correcto
			  }
			
			  
		  return st_height;
		  
	  } catch (e) {
      return 485;//Si hi ha error, tornem 485 que per defecte es veurà correctament.
    }
}
            
document.onkeydown = function(e){
   
    evt = e ? e:window.event;
    var elem;
    
    if (evt.srcElement)  elem = evt.srcElement;
    else if (evt.target) elem = evt.target;
    
    var charCode = (evt.which) ? evt.which : evt.keyCode;               
    var nameElement  =elem.tagName.toUpperCase();
    
    // PULSAR BOTON SUPR. (tecla 8).
    if(charCode == 8 && (elem.readOnly || elem.disabled || (nameElement!='INPUT' && nameElement!='TEXTAREA'))){                  
        try{                        
            evt.preventDefault();
        }catch(error){ evt.returnValue = false;}
    }
}

function f_valida_numeros() {
    if ((event.keyCode < 48) || (event.keyCode > 57)) 
        event.returnValue = false;
}
function f_truncator(numToTruncate, intDecimalPlaces) {
    var p = Math.pow(10, intDecimalPlaces);
    return Math.round(numToTruncate * p) / p;
}

function f_formatNumber(num, simbol) {
    var locale = "<%=ConversionUtil.getLocaleFormatoNumerico()%>";
    var separador;
    var sepDecimal;
    if (locale =="EUR"){
        separador = ".";
        sepDecimal = ',';
    }else if (locale =="USA"){
        separador = ",";
        sepDecimal = '.';
    }
    simbol = simbol ||'';
    num +='';
    var splitStr = num.split('.');
    var splitLeft = splitStr[0];
    var splitRight = splitStr.length > 1 ? sepDecimal + splitStr[1] : '';
    var regx = /(\d+)(\d{3})/;
    while (regx.test(splitLeft)) {
        splitLeft = splitLeft.replace(regx, '$1' + separador + '$2');
    }
    return simbol + splitLeft  +splitRight;
}
</script>
        
