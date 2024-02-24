<%@ page contentType="text/html;charset=windows-1252"%>
<%@ page import="java.util.*" %>
<%@ page import="axis.util.*,axis.mvc.model.*" %>
<%/*
*  Fichero: axismenu.jsp
*  Pantalla que printea el menu principal del aplicativo.
*
*  Fecha: 22/10/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
 
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<html xmlns="http://www.w3.org/1999/xhtml">
<%
UsuarioBean usuario=(UsuarioBean)session.getAttribute("__usuario");
usuario.getContenedor().put("CONTINUE",session.getAttribute("CONTINUE")); //siempre lo pasamos, sea que es nulo o no

%>
<head>
    <link rel="stylesheet" href="styles/genericosHtml.css" />
    <link rel="stylesheet" href="styles/menu.css" />
    <c:import url="./include/carga_framework_js.jsp" />
    
    <script language="Javascript" type="text/javascript">
        function medianoche() {
            var ahora = new Date();
            ahora.setHours       (23);
            ahora.setMinutes     (59);
            ahora.setSeconds     (59);
            ahora.setMilliseconds(999);
            return ahora;
        }
        function linkDirecto(PRODUCTO, MODO, FORM_ACT, CMENU) {
            setCookie ('iaxis_CMENU', CMENU, medianoche());

            document.miFormMenu.CMENU.value=CMENU;
            document.miFormMenu.PRODUCTO.value=PRODUCTO;
            document.miFormMenu.MODO.value=MODO;
            document.miFormMenu.FORM_ACT.value=FORM_ACT;
            
            objUtiles.ejecutarFormulario( FORM_ACT, "init", document.miFormMenu, "ftrabajo");
        }
        function iniciarFlujo(PRODUCTO, MODO, FORM_ACT, CMENU) {
            setCookie ('iaxis_CMENU', CMENU, medianoche());
        
            document.miFormMenu.CMENU.value=CMENU;
            document.miFormMenu.PRODUCTO.value=PRODUCTO;
            document.miFormMenu.MODO.value=MODO;
            document.miFormMenu.FORM_ACT.value=FORM_ACT;
            objUtiles.ejecutarFormulario("flujodetrabajo.do", "init", document.miFormMenu, "ftrabajo");
        }
        function logout(error_menu) {
            setCookie ('iaxis_CMENU', 'null', medianoche());
            
            if (!objUtiles.estaVacio(error_menu)){
                objDom.setValorPorId("error_menu", error_menu);
            }
            var frameCierre= objUtiles.estaVacio(window.parent.parent.name)?"_top":window.parent.parent.name;
            objUtiles.ejecutarFormulario("axis.do", "salir", document.miFormMenu, frameCierre);
        }   
        
        var CMENUInicial='';
        function f_activar_menu_inicial(){
            cmenu = getCookie('iaxis_CMENU');
            //alert(cmenu)

            if ((cmenu == null)||(cmenu == 'null')){
                cmenu=CMENUInicial;
            }
            //alert(cmenu)
            var trmenu=document.getElementById(cmenu);
            if (trmenu!=null) {
                var trpadres=trmenu.getAttribute("padres");
                //alert(trpadres)
                var trpadresSplitted=trpadres.split("_");
                var candidatos=document.getElementsByTagName("tr");
                for (var i=0; i < candidatos.length; i++) {
                    if (candidatos[i].getAttribute('padres')!=null) {
                        var temptrpadres="";
                        for (var j=0;j<trpadresSplitted.length;j++) {
                            if (temptrpadres.length>0) temptrpadres=temptrpadres+"_";
                            temptrpadres=temptrpadres+trpadresSplitted[j]
                            if ( (temptrpadres+"]").indexOf(candidatos[i].getAttribute('padres')+"]")==0  ) {
                                candidatos[i].style.visibility="visible"
                                candidatos[i].style.display="block"
                            }
                        }
                    }
                }
            }

        }
        
        function getCookie(name){
            var cname = name + "=";
            var dc = document.cookie;
            if (dc.length > 0) {
                begin = dc.indexOf(cname);
                if (begin != -1) {
                    begin += cname.length;
                    end = dc.indexOf(";", begin);
                    if (end == -1) end = dc.length;
                return unescape(dc.substring(begin, end));
                }
            }
            return null;
        }
        function setCookie(name, value, expires, path, domain, secure) {
            document.cookie = name + "=" + escape(value) +
            ((expires == null) ? "" : "; expires=" + expires.toGMTString()) +
            ((path == null) ? "" : "; path=" + path) +
            ((domain == null) ? "" : "; domain=" + domain) +
            ((secure == null) ? "" : "; secure");
            //((window.location.protocol == "https:") ? "; secure" : "") +
            //"; HttpOnly";
        }
        
        /**
        * Cierra todos los demas items del menu (de otros ramos del arbol)
        */
        function cerrarTodosLosDemas(thsid) {
            var padresThsid=document.getElementById(thsid).getAttribute('padres');
            //alert("cerrarTodosLosDemas con thsid="+padresThsid+"_"+thsid)
            var candidatos=document.getElementsByTagName("tr");
            for (var i=0; i < candidatos.length; i++) {
                if (candidatos[i].getAttribute('padres')!=null) {
                    var padrecandidato=candidatos[i].getAttribute('padres');
                    if ( (padresThsid+"_"+thsid+"_").indexOf(padrecandidato+"_")==0  ) {
                        // no hace falta de cerrarlo
                    }
                    else {
                        candidatos[i].style.visibility="hidden"
                        candidatos[i].style.display="none"
                        // ecg20100311 AXIS1718 bug 13476 mejorar rendimiento del menu cerrarHijosDe(candidatos[i].getAttribute('padres')+"_"+candidatos[i].getAttribute('id'))
                    }
                }
            }

        }
        function cerrarHijosDe(padre) {
            //alert("cerrarHijosDe intento cerrar los hijos de:"+padre)
            var candidatos=document.getElementsByTagName("tr");
            for (var i=0; i < candidatos.length; i++) {
                if (candidatos[i].getAttribute('padres')!=null) {
                    if ( (candidatos[i].getAttribute('padres')).indexOf(padre)==0 ) {
                        //alert("_"+candidatos[i].getAttribute('padres')+"_")
                        candidatos[i].style.visibility="hidden"
                        candidatos[i].style.display="none"
                        cerrarHijosDe(candidatos[i].getAttribute('padres')+"_"+candidatos[i].getAttribute('id'))
                    }
                }
            }
        }

        function menu_toggleHijo(thsid) {
            //alert(thsid)
            if (thsid.indexOf("td_")==0) {
                var thsid=thsid.substring(3)
                var padrethsid=document.getElementById(thsid).getAttribute("padres");
                //alert("toggle todos con:"+padrethsid+"_"+thsid+"]")
                cerrarTodosLosDemas(thsid) ;
                var candidatos=document.getElementsByTagName("tr");
                for (var i=0; i < candidatos.length; i++) {
                    if (candidatos[i].getAttribute('padres')!=null) {
                        
                        if ( (candidatos[i].getAttribute('padres')+"]").indexOf(padrethsid+"_"+thsid+"]")==0 ) {
                            // si son visibles, hacer invisibles, y viceversa
                            if ( candidatos[i].style.visibility=="visible" ) {
                                candidatos[i].style.visibility="hidden"
                                candidatos[i].style.display="none"
                                // si lo cerramos, debemos cerrar a saco todos sus hijos! tambien
                                cerrarHijosDe(candidatos[i].getAttribute('padres')+"_"+candidatos[i].getAttribute('id'))
                            }
                            else {
                                candidatos[i].style.visibility="visible"
                                candidatos[i].style.display="block"
                            }
                        }
                    }
                }

            }
        }
    </script>
</head>
<body onLoad="f_activar_menu_inicial()">
<form name="miFormMenu" method="POST" action="" >
    <input type="hidden" name="operation" value="" />
    <input type="hidden" name="PRODUCTO" value="" />
    <input type="hidden" name="MODO" value="" />
    <input type="hidden" name="FORM_ACT" value="" />
    <input type="hidden" name="CMENU" value="" />
    <input type="hidden" name="error_menu" id="error_menu" value="" />
<table cellspacing="0" cellpadding="0" id="menu_table_id" >
<%
String CMENUInicial=null;
ArrayList<HashMap> axis_menu2= (ArrayList)session.getAttribute("axis_menu");
if (axis_menu2==null) axis_menu2=new ArrayList();
axis_menu2 = ArbolNTUtil.recolocararray(axis_menu2);
int nivel2 =0; String nivel2_css="";
HashMap padresPorNivel=new HashMap();
padresPorNivel.put(""+nivel2, "000");
if (session.getAttribute("CONTINUE")!=null) {
    //    axis_menu2.clear(); // asi evitamos que pinta el menu si hay un CONTINUE
}
for (int i=0;i<axis_menu2.size();i++){

    
    nivel2 = Integer.parseInt( axis_menu2.get(i).get("NIVEL").toString() );
    if ( nivel2>1){
        if (nivel2>2 && CMENUInicial==null) CMENUInicial=axis_menu2.get(i).get("COPCION").toString();
        padresPorNivel.put(""+nivel2, axis_menu2.get(i).get("COPCION"));
        if (new Integer(nivel2)> 4) {nivel2_css ="4";}else{ nivel2_css = ""+nivel2;}
        %>
        <tr id="<%=axis_menu2.get(i).get("COPCION")%>" 
            style="cursor:pointer;<%=(nivel2==2)?"visibility:visible; display:block":"visibility:hidden; display:none"%>"
        nivel="<%=nivel2%>" 
        padres="<%=detectarMiPadres(padresPorNivel, nivel2)%>">
            <td 
                    class="menu menuItemLv<%=nivel2_css%>" 
                    id="td_<%=axis_menu2.get(i).get("COPCION")%>"
                    <%if (axis_menu2.get(i).get("FORM")!=null){%>
                        onclick="iniciarFlujo('*','<%=axis_menu2.get(i).get("CMODO")%>','<%=((String)axis_menu2.get(i).get("FORM")).toLowerCase()%>','<%=axis_menu2.get(i).get("COPCION")%>');"
                    <%} else {%>
                        onclick="menu_toggleHijo(this.id);"
                    <%} %>
                    <%if (nivel2>2){%>
                    onmouseover="objEstilos.cambiaLookAndFeelTab(this, objEstilos.getCssColorNaranja());"
                    onmouseout="objEstilos.cambiaLookAndFeelTab(this, objEstilos.getMenuItemLv<%=nivel2%>());"
                    <%}%>
            ><%for (int z=2;z<nivel2;z++){%>&nbsp;&nbsp;<%}%><%=axis_menu2.get(i).get("LITERAL")%> </td>
        </tr>
        <%
    }
}
%>
            <tr><td class="menu menuItemLv2" onclick="logout()" style="cursor:pointer" onmouseover="objEstilos.cambiaLookAndFeelTab(this, objEstilos.getCssColorNaranja());" onmouseout="objEstilos.cambiaLookAndFeelTab(this, objEstilos.getMenuItemLv2());"><fmt:message key="100000"/></td></tr>
</table>
<script language="Javascript">

    <%--ecg20130429 http://mantis.srvcsi.com/view.php?id=26785#c143385 si hay un sola opcion en el menu, y sin CONTINUE, y si es empresa={18}, hacemos un 'Salir'--%>
    var sacarDeLaPantallaSiHayUnaSolaOpcion=false; 
    <c:if test="${sessionScope.__usuario.cempres==18}">sacarDeLaPantallaSiHayUnaSolaOpcion=true;</c:if>
    
    <% if (session.getAttribute("CONTINUE")!=null) { %>
        // recuperar la informacion
        //document.getElementById("menu_table_id").style.visibility="hidden";
		sacarDeLaPantallaSiHayUnaSolaOpcion=false;
        var CONTINUE="<%=session.getAttribute("CONTINUE")%>";
        if (CONTINUE.indexOf("axismenu:")==0) { //ejemplo: axismenu:axisctr020  encoded: CONTINUE=axismenu%3Aaxisctr020
            CONTINUE=CONTINUE.substring(9);
            var CONTINUEs=CONTINUE.split("|"); // para mas info ver AxisService
            document.miFormMenu.CMENU.value="-1";
            document.miFormMenu.PRODUCTO.value="*";
            document.miFormMenu.MODO.value="null";
            if (CONTINUEs.length>2 && CONTINUEs[2].length>0) {
                document.miFormMenu.MODO.value=CONTINUEs[2];
                //alert(document.miFormMenu.MODO.value)
            }
            document.miFormMenu.FORM_ACT.value=CONTINUEs[0]
            objUtiles.ejecutarFormulario("flujodetrabajo.do", "init", document.miFormMenu, "ftrabajo");
            <%session.removeAttribute("CONTINUE");%>
        }
        else {
            // borrarlo de la session: <% session.removeAttribute("CONTINUE"); %>
            // y actuar sobre ella
            parent.location.href=CONTINUE
        }
    <% } %>
    
    CMENUInicial='<%=CMENUInicial%>';

    //Si no se carga ningún elemento de menú volvemos a la pagina de login con un mensaje de error.
    <% if (axis_menu2.size() <= 0 && request.getSession().getAttribute("axis_menu_mensajes") == null){%>
        logout("<fmt:message key='9000768'/>");
    <%}%>

    <% if (axis_menu2!=null && axis_menu2.size() == 1&& request.getSession().getAttribute("axis_menu_mensajes") == null){%>
        if (sacarDeLaPantallaSiHayUnaSolaOpcion) { 
            var validez = 30;
            var caduca = new Date();
            caduca.setTime(caduca.getTime() + (validez*24*60*60*1000));
            setCookie ('iaxis_CMENU', 'null');
            var frameCierre2= objUtiles.estaVacio(window.parent.parent.name)?"_top":window.parent.parent.name;
            objUtiles.ejecutarFormulario("axis.do?sin_but_reconectar=1", "salir", document.miFormMenu, frameCierre2);
        }
    <%}%>

</script>

    <c:import url="./include/mensajes.jsp"></c:import>
</form>

</body>
</html>
<%!
private String detectarMiPadres(HashMap padresPorNivel, int miNivel) {
    String retVal="";
    for (int i=miNivel-1;i>=0;i--) {
        if (padresPorNivel.get(""+i)!=null) {
            retVal=padresPorNivel.get(""+i).toString()+"_"+retVal;
        }
    }
    if (retVal.endsWith("_")) retVal=retVal.substring(0, retVal.length()-1);
    return retVal;
}
%>