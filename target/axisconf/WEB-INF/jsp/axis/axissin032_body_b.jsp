<%/**
*  Pantalla principal de 'Alta Siniestro'
*
*  Fecha: 26/10/2007
*/
%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<axis:visible c="TZOCURRENCIA" f="axissin032">
<tr>
	<!-- Zona Ocurrencia -->
		<td class="titulocaja">
			<b><axis:alt f="axissin032" c="ZOCURRENCIA" lit="110492" /></b>
        </td>
</tr>
<tr>
<td colspan="4">
<table class="seccion">
                    <!-- Zona Ocurrencia --> 
                    
                            <tr>
                                <!-- Lugar Ocurrencia -->
                                 
                                 <td colspan="5">
                                        <table class="area" align="center">
                                            <tr>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                            </tr>
                                            <!-- Inicio Seccion -->
					    <!-- IAXIS-2171 AABC Adicion de campos de ubicación -->
                                            <!--  
                                            <axis:visible f="axissin032" c="RADIOLOCALIZA"> 
                                            <tr>
                                                <td class="titulocaja" colspan="4">
                                                   <input value="0" type="radio"  id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);" <c:if test="${!empty __formdata.TLOCALI}">checked</c:if>/>
                                                   <b><axis:alt f="axissin032" c="radioLocaliza" lit="100588" /></b> 
                                                </td>
                                            </tr>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="TLOCALI"> 
                                            <tr>
                                            <td colspan="4">
                                            <table id="textTlocali">
                                            <tr>
                                               <td colspan="4" style="width:100%;" class="campocaja">
                                                    <textarea class="campowidthinput campo campotexto_ob" style="width:100%;" name="TLOCALI" id="TLOCALI" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)">${__formdata.TLOCALI}</textarea>
                                                </td>
                                            </tr>
                                             </table>
                                            </div>
                                            </td>
                                            </tr>
                                            </axis:visible>
                                            -->
                                            <axis:visible f="axissin032" c="RADIOLOCALIZA"> 
                                            <tr>
                                                <td class="titulocaja" colspan="4">
                                                    <input value="1" type="radio" id="radioLocaliza" name="radioLocaliza" onclick="f_verifica_textarea(this.value);"  <c:if test="${empty __formdata.TLOCALI}">checked</c:if>/>
                                                    <b><axis:alt f="axissin032" c="TLOCALI" lit="9000914" /></b>
                                                </td>
                                            </tr>
                                            </axis:visible>
                                            
                                            <tr>
                                            <td colspan="4">
                                            <table id="direccions">
                                            <tr>
                                                <th style="width:15%;height:0px"></th>
                                                <th style="width:10%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:20%;height:0px"></th>
                                                <th style="width:25%;height:0px"></th>
                                                <th style="width:10%;height:0px"></th>
                                            </tr>
                                            <axis:visible f="axissin032" c="DSP_DIRECCION"> 
                                            <axis:ocultar f="axissin032" c="CSIGLAS" dejarHueco="false">
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CSIGLAS" lit="110028" /></b>
                                                </td>
                                            </tr>
                                            </axis:ocultar>
                                            <axis:ocultar f="axissin032" c="CSIGLAS" dejarHueco="false">
                                            <tr>
                                                <!-- Tipo via -->
                                                <td class="campocaja">
                                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" 
                                                    <axis:atr f="axissin032" c="CSIGLAS" a="obligatorio=true"/>  title="<axis:alt f="axissin032" c="CSIGLAS" lit="110028" />">&nbsp;
                                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                        <c:forEach var="element" items="${__formdata.listvalores.lstTipoVia}">
                                                            <option value = "${element.CSIGLAS}" 
                                                            <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                                ${element.TDENOM} 
                                                            </option>
                                                        </c:forEach>
                                                    </select>
                                                </td>
                                            </tr>
                                            </axis:ocultar>
                                            
                                            <tr>
                                                <!-- Nombre -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="TNOMVIA" lit="110029" /></b>
                                                </td>
                                                <!-- Número -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="NNUMVIA" lit="800440" /></b>
                                                </td>
                                                <!--  Otros -->
                                                <td class="tituloca">
                                                    <b><axis:alt f="axissin032" c="TCOMPLE" lit="110031" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <!-- Nombre -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto_ob" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                        <axis:atr f="axissin032" c="TNOMVIA" a="obligatorio=true"/> value="${__formdata.TNOMVIA}"
                                                        title="<axis:alt f="axissin032" c="TNOMVIA" lit="110029" />"/>
                                                </td>
                                                <!-- Número -->
                                                <td class="campocaja">
                                                    <input   type="text" class="campowidthinput campo campotexto_ob" id="NNUMVIA" maxlength="5" onkeyup="f_val_longitud_campo(this, 5)" name="NNUMVIA" size="15"  value="${__formdata.NNUMVIA}" style="width:50%;"/>
                                                </td>
                                                <!-- Otros -->
                                                <td class="campocaja" colspan="2">
                                                    <input    type="text" class="campowidthinput campo campotexto_ob"  id="TCOMPLE" name="TCOMPLE" 
                                                    value="${__formdata.TCOMPLE}"/>
                                                </td>
                                            </tr>
                                            </axis:visible>
                                            
                                             <%-- Direccion para colombia --%>
                                            <axis:visible f="axissin032" c="DSP_DIRECCIONCOL">  
                                            <tr>
                                               <td colspan ="6"> 
                                                <table>
                                                <tr>
                                                    <th style="width:19%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                    <th style="width:17%;height:0px"></th>
                                                    <th style="width:17%;height:0px"></th>
                                                    <th style="width:17%;height:0px"></th>
                                                    <th style="width:15%;height:0px"></th>
                                                </tr>
                                                <tr>
                                                    <axis:visible f="axissin032" c="CVIAVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CVIAVP" lit="9902408"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNOMVIA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin032" c="TNOMVIA" lit="9903010"/></b>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="CLITVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CLITVP" lit="9902409"/></b>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="CBISVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CBISVP" lit="9902410"/></b>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="CORVP">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CORVP" lit="9902411"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                    
                                                </tr>
                                                <tr>
                                                    <axis:visible f="axissin032" c="CVIAVP">
                                                    <td class="campocaja" >
                                                    <select name="CVIAVP" id="CVIAVP" size="1" class="campowidthselect campo campotexto" style="width:80%;" 
                                                            <axis:atr f="axissin032" c="CSIGLAS" a="obligatorio=false"/> title="<axis:alt f="axissin032" c="CVIAVP" lit="9902408"/>">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstTipoVia}">
                                            									<option value = "${element.CSIGLAS}" 
                                            									<c:if test="${element.CSIGLAS == __formdata.CVIAVP}"> selected </c:if> />
                                                							${element.TDENOM} 
                                            									</option>
                                        										</c:forEach>
                                                        </select>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="TNOMVIA">
                                                    <td class="campocaja" colspan="2">
                                                        <input   type="text" class="campowidthinput campo campotexto" id="TNOMVIA" name="TNOMVIA" size="15" 
                                                            <axis:atr f="axissin032" c="TNOMVIA" a="obligatorio=false"/> value="${__formdata.TNOMVIA}"
                                                            title="<axis:alt f="axissin032" c="TNOMVIA" lit="110029" />" maxlength="40" onkeyup="f_val_longitud_campo(this, 40)"/>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="CLITVP">
                                                    <td class="campocaja">
                                                        <select name="CLITVP" id="CLITVP" size="1" class="campowidthselect campo campotexto" style="width:70%;"
                                                         <axis:atr f="axissin032" c="CLITVP" a="obligatorio=false"/> title="<axis:alt f="axissin032" c="CLITVP" lit="9902409"/>">
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCLITVP}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CLITVP}"> selected </c:if> >
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="CBISVP">
                                                    <td class="campocaja">
                                                        <select name="CBISVP" id="CBISVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCBISVP}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CBISVP}"> selected </c:if> >
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                     </axis:visible>
                                                    <axis:visible f="axissin032" c="CORVP">
                                                    <td class="campocaja">
                                                        <select name="CORVP" id="CORVP" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCORVP}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CORVP}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                     </axis:visible>
                                                    
                                                    
                                                </tr>
                                                <tr>
                                                    <axis:visible f="axissin032" c="NVIAADCO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="NVIAADCO" lit="9902414"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="CLITCO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CLITCO" lit="9902409"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="CORCO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CORCO" lit="9902411"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="NPLACACO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="NPLACACO" lit="9902415"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="COR2CO">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="COR2CO" lit="9902411"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                    <axis:visible f="axissin032" c="NVIAADCO">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" maxlength="5" onkeyup="f_val_longitud_campo(this, 5)" size="15" value="${__formdata.NVIAADCO}" name="NVIAADCO" id="NVIAADCO" 
                                                           <axis:atr f="axissin032" c="NVIAADCO" a="obligatorio=false"/>    style="width:70%;" formato="entero" title="<axis:alt f="axissin032" c="NVIAADCO" lit="9902414"/>"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="CLITCO">
                                                    <td class="campocaja">
                                                        <select name="CLITCO" id="CLITCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCLITCO}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CLITCO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="CORCO">
                                                    <td class="campocaja">
                                                        <select name="CORCO" id="CORCO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCORCO}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CORCO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="NPLACACO">
                                                    <td class="campocaja">
                                                        <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" onkeyup="f_val_longitud_campo(this, 5)" value="${__formdata.NPLACACO}" name="NPLACACO" id="NPLACACO" 
                                                          <axis:atr f="axissin032" c="NPLACACO" a="obligatorio=false"/> style="width:70%;" formato="entero" title="<axis:alt f="axissin032" c="NPLACACO" lit="9902415"/>"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="COR2CO">
                                                    <td class="campocaja">
                                                        <select name="COR2CO" id="COR2CO" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCOR2CO}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.COR2CO}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                
                                                    <axis:visible f="axissin032" c="CDET1IA">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CDET1IA" lit="9902417"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNUM1IA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin032" c="TNUM1IA" lit="9902418"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="CDET2IA">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CDET2IA" lit="9902419"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNUM2IA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin032" c="TNUM2IA" lit="9902420"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                
                                                    <axis:visible f="axissin032" c="CDET1IA">
                                                    <td class="campocaja">
                                                        <select name="CDET1IA" id="CDET1IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CDET1IA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNUM1IA">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                                           style="width:90%;" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="CDET2IA">
                                                    <td class="campocaja">
                                                        <select name="CDET2IA" id="CDET2IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CDET2IA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNUM2IA">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                                           style="width:90%;" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                
                                                    <axis:visible f="axissin032" c="CDET3IA">
                                                    <td class="titulocaja">
                                                        <b><axis:alt f="axissin032" c="CDET3IA" lit="9902421"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNUM3IA">
                                                    <td class="titulocaja" colspan="2">
                                                        <b><axis:alt f="axissin032" c="TNUM3IA" lit="9902422"/></b>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                <tr>
                                                
                                                    <axis:visible f="axissin032" c="CDET3IA">
                                                    <td class="campocaja">
                                                        <select name="CDET3IA" id="CDET3IA" size="1" class="campowidthselect campo campotexto" style="width:70%;">&nbsp;
                                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="BLANCO" lit="1000348"/> - </option>
                                                            <c:forEach var="element" items="${__formdata.listvalores.lstCDET}">
                                                                <option value = "${element.CATRIBU}" 
                                                                <c:if test="${element.CATRIBU == __formdata.CDET3IA}"> selected </c:if> />
                                                                    ${element.TATRIBU} 
                                                                </option>
                                                            </c:forEach>
                                                        </select>
                                                    </td>
                                                    </axis:visible>
                                                    <axis:visible f="axissin032" c="TNUM3IA">
                                                    <td class="campocaja" colspan="2">
                                                        <input type="text" class="campowidthinput campo campotexto" size="5" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                                           style="width:90%;" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                                    </td>
                                                    </axis:visible>
                                                    
                                                </tr>
                                                </table>
                                                </td>
                                                </tr>
                                            </axis:visible>
                                            <axis:visible f="axissin032" c="DSP_DIRECCIONCHI" >
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axissin032" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="CSIGLAS" lit="110028"/></b>
                                </td>
                                </axis:ocultar>
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="TNOMVIA" lit="110029"/></b>
                                </td>
                                <td class="titulocaja">
                                    <b><axis:alt f="axissin032" c="NNUMVIA" lit="9904598"/></b>
                                </td>                     
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CSIGLAS" f="axissin032" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CSIGLAS" id="CSIGLAS" size="1" class="campowidthselect campo campotexto" style="width:80%;">&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axissin032" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstTipoVia}">
                                            <option value = "${element.CSIGLAS}" 
                                            <c:if test="${element.CSIGLAS == __formdata.CSIGLAS}"> selected </c:if> />
                                                ${element.TDENOM} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                <td class="campocaja">
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMVIA}" name="TNOMVIA" id="TNOMVIA" 
                                    style="width:95%;"/>
                                </td>
                                <td class="campocaja" colspan="3" >
                                    <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM1IA}" name="TNUM1IA" id="TNUM1IA" 
                                       style="width:15%;"  maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMVIA}" name="NNUMVIA" id="NNUMVIA" 
                                    style="width:15%;"/>
                                    &nbsp;&nbsp;&nbsp;
                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.TCOMPLE}" name="TCOMPLE" id="TCOMPLE" 
                                    style="width:15%;"/>
                                </td>                                
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin032" c="TNUM2IA" lit="9904595"/></b>
                                    </td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axissin032" c="TNUM3IA" lit="9904596"/></b>
                                    </td> 
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM2IA}" name="TNUM2IA" id="TNUM2IA" 
                                            style="width:90%;"  title="<axis:alt f="axissin032" c="TNUM2IA" lit="9904595"/>" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                    </td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.TNUM3IA}" name="TNUM3IA" id="TNUM3IA" 
                                            style="width:90%;"  title="<axis:alt f="axissin032" c="TNUM3IA" lit="9904596"/>" maxlength="100" onkeyup="f_val_longitud_campo(this, 100)"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="titulocaja" colspan="2">
                                        <b><axis:alt f="axisper012" c="LOCALIDAD" lit="9903353"/></b>
                                    </td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td class="campocaja" colspan="2">
                                        <input type="text" class="campowidthinput campo campotexto" size="100" value="${__formdata.LOCALIDAD}" name="LOCALIDAD" id="LOCALIDAD" 
                                            style="width:90%;"  title="<axis:alt f="axissin032" c="LOCALIDAD" lit="9903353"/>" />
                                    </td>
                                </tr>
                            </axis:visible>
                                            <tr>
                                                <td>
                                                    &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="CPOSTAL" f="axissin032" dejarHueco="false">
                                                <!-- C.P -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CPOSTAL" lit="101081" /></b>
                                                </td>
                                                </axis:ocultar>
                                                <!-- Pais -->
                                                <td class="titulocaja" colspan="2">
                                                    <b><axis:alt f="axissin032" c="CPAIS" lit="100816" /></b>
                                                </td>
                                                <!-- Provincia -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CPROVIN" lit="100756" /></b>
                                                </td>
                                                <!--  Población -->
                                                <td class="titulocaja">
                                                    <b><axis:alt f="axissin032" c="CPOBLAC" lit="100817" /></b>
                                                </td>
                                            </tr>
                                            <tr>
                                                <axis:ocultar c="CPOSTAL" f="axissin032" dejarHueco="false">
                                                 <!-- C.P -->
                                               <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.CPOSTAL}" name="CPOSTAL" id="CPOSTAL" 
                                                    style="text-transform:uppercase;width:60%;" onblur="f_onblur_CPOSTAL(this.value)" style="width:50%;"
                                                     <axis:atr f="axissin032" c="CPOSTAL" a="obligatorio=false"/> title="<axis:alt f="axissin032" c="CPOSTAL" lit="101081"/>"/>
                                                     <axis:ocultar c="CPOSTALFIND" f="axissin032"
														dejarHueco="false">
														<img id="findCpostal" border="0" src="images/find.gif"
															onclick="f_abrir_axisper042();" style="cursor: pointer" alt="" />
													</axis:ocultar>
                                                </td>   
                                                </axis:ocultar>
                                                <td class="campocaja" colspan="2">
                                                    <input type="text" class="campowidthinput campo campotexto" size="3" maxlength="3" onkeyup="f_val_longitud_campo(this, 3)" value="${__formdata.CPAIS}" name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" style="width:15%;" 
                                                    <axis:atr f="axissin032" c="CPAIS" a="obligatorio=false"/> title="<axis:alt f="axissin032" c="CPAIS" lit="100816"/>"/>&nbsp;<img id="findPais" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS', null)" style="cursor:pointer"/>
                                                    &nbsp;<span id="TPAIS_span"><b>${__formdata.TPAIS}</b></span>
                                                </td>
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="3"  onkeyup="f_val_longitud_campo(this, 3)" value="${__formdata.CPROVIN}" name="CPROVIN" id="CPROVIN" onchange="f_onchange_CPROVIN()" style="width:18%;" 
                                                    <axis:atr f="axissin032" c="CPROVIN" a="obligatorio=false"/> title="<axis:alt f="axissin032" c="CPROVIN" lit="100756"/>"/>
                                                    &nbsp;<img id="findProvincia" style="visibility:${empty __formdata.CPAIS ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152431', 'LISTA_PROVINCIA', document.miForm.CPAIS.value)"/>                
                                                    &nbsp;<span id="TPROVIN_span"><b>${__formdata.TPROVIN}</b></span>
                                                </td>
                                                
                                                <td class="campocaja">
                                                    <input type="text" class="campowidthinput campo campotexto" size="15" maxlength="5" onkeyup="f_val_longitud_campo(this, 5)" value="${__formdata.CPOBLAC}" name="CPOBLAC" id="CPOBLAC" onchange="f_onchange_CPOBLAC()" style="width:18%;" 
                                                    <axis:atr f="axissin032" c="CPOBLAC" a="obligatorio=false"/> title="<axis:alt f="axissin032" c="CPOBLAC" lit="100817"/>"/>
                                                    &nbsp;<img id="findPoblacion" style="visibility:${empty __formdata.CPROVIN ? 'hidden' : 'visible'};cursor:pointer" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152432', 'LISTA_POBLACION', document.miForm.CPROVIN.value,document.miForm.CPOSTAL.value)"/>                
                                                    &nbsp;<span id="TPOBLAC_span"><b>${__formdata.TPOBLAC}</b></span>
                                                </td>

                                                
                                            </tr>
                                        </table>
                                        </div>
                                        </td>
                                        </tr>
                                        </table>
                                 </td>
                                 
                            </tr>
                              
                    </table>                    
</td>
</tr>
</axis:visible>
