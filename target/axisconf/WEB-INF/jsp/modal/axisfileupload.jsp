 <%/* Revision:# 4VeYxtKmCb5eYf5kH9YGRQ== # */%>
<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <link rel="stylesheet" href="styles/genericosHtml.css" type="text/css">
    <link rel="stylesheet" href="styles/axisnt.css" type="text/css">

    <c:import url="../include/carga_framework_js.jsp" />    
    <script type="text/javascript">
    
        /****************************************************************************************/
        /*********************************** NAVEGACION *****************************************/
        /****************************************************************************************/
    
          function f_but_salir() {
        	if(document.miForm.TIPO.value == 'EXC'){
        		parent.f_cerrar_modal('axisfileupload_exc'); 
        	}else{
        		parent.f_cerrar_modal('axisfileupload'); 
        	}
                                 
        }
        
        function f_onload() {
         f_cargar_propiedades_pantalla();
         
        var isUpload = "${isUpload}";
        
        try{
            if (!objUtiles.estaVacio(isUpload) && objUtiles.utilEquals(isUpload, 'ok'))       
                parent.f_aceptar_axisfileupload('${IDFICHERO}');  
        }catch(e){}
            document.getElementById("myTDESC").focus();
        }
        
        function f_enviar_datos() {
            var userAgent = "${header['User-agent']}";
            
			//ecg2013119 http://mantis.srvcsi.com/view.php?id=26733#c159251 aplicamos la copia del nombre real de fichero para todos los browsers			
			var tf1=objDom.getValorPorId("TFILE");
			while (tf1.indexOf("\\")>=0) { //quitando posibles fakepath y otros
				tf1=tf1.substring(tf1.indexOf("\\")+1);
			}
			objDom.setValorPorId("TFILENAME", tf1);			
            
            objDom.setValorPorId("TDESC", objDom.getValorPorId("myTDESC"));
            objDom.setValorPorId("IDCAT", objDom.getValorPorId("myIDCAT"));
            
            objDom.setValorPorId("USERAGENT", userAgent);

            objEventos.showHideLoader("ajaxLoader", "ajaxContent", "ajaxText", objJsMessages.jslit_cargando, "inline");
            document.miForm.submit();            
        }
            
    </script>
  </head>
 
  <body onunload="try { f_clear_resources(document.body) } catch (e) {}" onload="f_onload()">
    <c:import url="../include/precargador_ajax.jsp"><c:param name="imagen" value="images/ajax-loader.gif"></c:param></c:import>
    
    <form name="miForm" enctype='multipart/form-data' action="Axisfileupload" method="POST" accept-charset='UTF-8'>         
        <c:import url="../include/titulo_nt.jsp">
            <c:param name="formulario"><axis:alt f="axisfileupload" c="TITFORM" lit="1000614"/></c:param>
            <c:param name="form">axisfileupload</c:param>
        </c:import>
         <!--  ${__formdata}    -->
        <input type="hidden" id="TDESC" name="TDESC" value=""/>
        <input type="hidden" id="SSEGURO" name="SSEGURO" value="${param.SSEGURO}"/>
        <input type="hidden" id="NMOVIMI" name="NMOVIMI" value="${param.NMOVIMI}"/>
        <input type="hidden" id="CCOMPANI" name="CCOMPANI" value="${param.CCOMPANI}"/>
        <input type="hidden" id="IDOBS" name="IDOBS" value="${param.IDOBS}"/>
        <input type="hidden" id="NSINIES" name="NSINIES" value="${__formdata.NSINIES}"/>
        <input type="hidden" id="NDOCUME" name="NDOCUME" value="${__formdata.NDOCUME}"/>
        <input type="hidden" id="NTRAMIT" name="NTRAMIT" value="${__formdata.NTRAMIT}"/>
        <input type="hidden" id="ORIGEN" name="ORIGEN" value="${__formdata.ORIGEN}"/>
        <input type="hidden" id="IDCAT" name="IDCAT" value=""/>
        <input type="hidden" id="TFILENAME" name="TFILENAME" value=""/>        
        <input type="hidden" id="operation" name="operation" value=""/>
        <input type="hidden" id="USERAGENT" name="USERAGENT" value="${header['User-agent']}"/>
        <input type="hidden" name="TIPO" value="${__formdata.TIPO}">
        
    
        <table id="tabla1" class="mainModalDimensions base" align="center" cellpadding="0" cellspacing="3">
            
            <tr>
                <td>
                    <div class="separador">&nbsp;</div>                                            
                    
                    <table class="seccion">                                            
                        <tr>
                            <th style="width:25%;height:0%">&nbsp;</th>
                            <th style="width:50%;height:0%">&nbsp;</th>
                            <th style="width:25%;height:0%">&nbsp;</th>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>                            
                            <td class="titulocaja">
                                <b><axis:alt f="axisfileupload" c="FITXER" lit="1000574"/></b> <%-- FITXER --%>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" align="center">                             
                                <input type="file" size="70" name="TFILE" id="TFILE" title="<axis:alt f="axisfileupload" c="TFILE" lit="1000574"/>" obligatorio="true"/>                                
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisfileupload" c="myTDESC" lit="100588"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" align="center">                             
                                <input type="text" name="myTDESC" id="myTDESC" class="campowidthinput campo campotexto" 
                                title="<axis:alt f="axisfileupload" c="myTDESC" lit="100588"/>" obligatorio="true"/>                                
                                <div class="separador">&nbsp;</div>                               
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="titulocaja">
                                <b><axis:alt f="axisfileupload" c="myIDCAT" lit="1000612"/></b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" align="center">                             
                                <select name = "myIDCAT" id ="myIDCAT" size="1" obligatorio="true" title="<axis:alt f="axisfileupload" c="myIDCAT" lit="1000612"/>" 
                                    class="campowidthselect campo campotexto_ob">&nbsp;
                                        <option value="null"> - <axis:alt f="axisfileupload" c="SNV_COMBO" lit="108341"/> - </option> 
                                    <c:forEach items="${__formdata.LSTCATEGOR}" var="LSTCATEGOR">
                                    	<!--INI - IAXIS - 3951 - ML - 07/05/2019 - Validacion ternaria para establecer otros por defecto-->
                                        <option value = "${LSTCATEGOR.IDCAT}"  ${__formdata.myIDCAT == null ? (LSTCATEGOR.IDCAT == 8 ? " selected": "") : (LSTCATEGOR.IDCAT == __formdata.myIDCAT ? " selected":"")} />
                                        ${LSTCATEGOR.TDESCRIP}</option>
                                        <!--INI - IAXIS - 3951 - ML - 07/05/2019 - Validacion ternaria para establecer otros por defecto-->
                                    </c:forEach>
                                </select>
                                <div class="separador">&nbsp;</div>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                &nbsp;
                            </td>
                            <td class="campocaja" align="center">                             
                                <input type="button" class="boton" style="vertical-align:bottom;cursor:pointer;" value="<axis:alt f='axisfileupload' c='BTN_ENVIAR' lit='9001532'/>"
                                onclick="if (objValidador.validaEntrada()) { f_enviar_datos(); }"/>
                                <div class="separador">&nbsp;</div>                                                        
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>

        </table>
        
        <c:import url="../include/botonera_nt.jsp"><c:param name="f">axisfileupload</c:param><c:param name="f">axisfileupload</c:param><c:param name="__botones">salir</c:param></c:import>
        
    </form>
    
    <c:import url="../include/mensajes.jsp" />

</body>
</html>
