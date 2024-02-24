<%/*
*  Fichero: mensajes.jsp
*  Fecha: 22/10/2007
*/%>
<%@ page contentType="text/html;charset=iso-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle basename="axis.bundle.Mensajes"/>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<style type="text/css">
#mensajes_frame { position: absolute; left: 0px; bottom: 0px; }
body > div#mensajes_frame { position: fixed; left: 0px; bottom: 0px;}
div#mensajes_frame {
right: auto; bottom: auto;
left: 0px;
/*_top solo para IE6 o inferiores*/
_top: expression( ( 0 - mensajes_frame.offsetHeight + ( document.documentElement.clientHeight ? document.documentElement.clientHeight : document.body.clientHeight ) + ( ignoreMe = document.documentElement.scrollTop ? document.documentElement.scrollTop : document.body.scrollTop ) ) + 'px' );
}
</style>
<%
HashMap mensajes=(HashMap)request.getAttribute(Constantes.MENSAJES);

Map configuracio =(java.util.Map)request.getAttribute("__configform");
String form = "mensajes";
Iterator it = configuracio.entrySet().iterator();
while (it.hasNext()) {
    java.util.Map.Entry e = (java.util.Map.Entry)it.next();
    String[] valor = e.getKey().toString().split("__");
    form =  valor[0];
    break;
}

if (mensajes!=null) { //ecg20111027: evitar trazas inutiles

    Vector m__clave=(Vector)mensajes.get("m__clave");
    Vector m__nivel=(Vector)mensajes.get("m__nivel");
    Vector m__infos=(Vector)mensajes.get("m__infos");
    Integer m__maxistipo=(Integer)mensajes.get("m__maxistipo");
    String locale=(String)session.getAttribute("__locale"); if (locale==null) locale="ca";

    String img="images/mensaje_info.gif";
    switch (m__maxistipo.intValue()) {
        case Constantes.MENSAJE_FATAL: img="images/mensaje_fatal.gif"; break;
        case Constantes.MENSAJE_ERROR: img="images/mensaje_error.gif"; break;
        case Constantes.MENSAJE_WARN: img="images/mensaje_warn.gif"; break;
        default: break;    
    }

    ArrayList textos=new ArrayList();
    ArrayList warnings=new ArrayList();
    String visible = "hidden";
    if (m__clave.size()>0) {
        visible = "visible";
        // tratamiento de fatales
        for (int i=0;i<m__clave.size();i++) {           
                textos.add(Traductor.s_traducir(locale, (String)m__clave.elementAt(i), (Object[])m__infos.elementAt(i) ));
                textos.add("<br />");
        }
    }
    %>
    <div id="mensajes_frame" name="mensajes_frame" style="background-color:#ffffff;width:100%;visibility:<%=visible%>;background:trasparent;border:0px; z-index:1;">
        <iframe id="mensajes_frame1" name="mensajes_frame1"  height="40px" width="100%" scrolling="no" style="width:100%;visibility:<%=visible%>;background:trasparent;border:0px; z-index:1;" frameborder="0"></iframe>
    </div>
      <div id="mensajes_div" style="width:100%;visibility:<%=visible%>;background:trasparent;border:0px; z-index:1;">
       <div class="titulo" onclick="toggleMensajes()" id="mensajes_toggle"><img  src="images/flecha.gif"/><fmt:message key="1000277" /> <img  src="images/menos.gif"/></div>    
       <table id="mensajes_table" class="base area" style="visibility:<%=visible%>; background-color:#FEE9E1;font-size:11px">
        <tbody>
            <tr>
                <td style="width:50px;vertical-align: middle;" id="mensajes_iconwrapper_<%=m__maxistipo.intValue()%>"  >
                    <% if(m__clave.size()>0){%>
                        <img src="<%=img%>" border="0"  id="mensajes_icon_<%=m__maxistipo.intValue()%>" />
                    <%}else{%>
                        &nbsp;
                    <%}%>
                </td>
                <td id="mensajes_textowrapper_<%=m__maxistipo.intValue()%>" style="vertical-align: middle;"> 
                    <% 
                    String texto=null;
                    for (int i=0;i<textos.size();i++) { 
                        texto=(String)textos.get(i);
                        texto=texto.replaceAll("\n","<br />");
                        texto=texto.replaceAll("\r","");
                        %><%=texto%><% }%>
                </td>
            <axis:visible c="ALERT_WARNS" f="<%=form%>">
            <%if (m__maxistipo.intValue() == Constantes.MENSAJE_WARN){%>
            <td id="mensajes_textowrapper_but_4001" style="vertical-align: middle;"  align="right">
                <b><axis:alt f="mensajes" c="lbl_menswarninfo" lit="9908448"/></b>&nbsp;
                <input type="button" style="width:100px;" class="boton" id="but_menswarninfo" value="<axis:alt f='mensajes' c='but_menswarninfo' lit='100009'></axis:alt>" onclick="f_but_mensaje();"/>&nbsp;
            </td>
            <%}%>
            </axis:visible>
            </tr>
        </tbody>
    </table>
    </div>
    <script language="Javascript">
    function toggleMensajes() {
        var at=document.getElementById('mensajes_table'); 
        var dt=document.getElementById('mensajes_toggle'); 
        var md=document.getElementById('mensajes_div'); 
        var mf=document.getElementById('mensajes_frame'); 
        //var fr=document.getElementById('ajax4ie'); 


        //alert("Frame: "+fr);
        if (at.style.visibility=='visible') {
        //alert("close");
            at.style.visibility='hidden'; 
            at.style.display='none'; 
            dt.innerHTML='<img  src="images/mas.gif"/>'
            md.style.width="25px";
            mf.style.width="25px";
        } 
        else {
        //alert("open");
            md.style.width="100%";
            mf.style.width="100%";
            at.style.visibility='visible'; 
            at.style.display='block'; 
            dt.innerHTML='<img  src="images/flecha.gif"/><fmt:message key="1000277" /> <img  src="images/menos.gif"/>';
            
            
        }
    }
    
    function f_but_mensaje(){
        document.getElementById("MENSWARNINFO").value = 'OK'; 
        
        if(document.getElementById('mensajes_textowrapper_but_4001')){
            document.getElementById('mensajes_textowrapper_but_4001').style.display = 'none';
        }
    }
    </script>
<% } //end-if mensajes!=null %>    
<%@ page import="java.util.*, axis.util.Constantes, axis.util.* " %>
