<%/***Fichero: axisctr148.jsp,Autos*/%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<table class="seccion">
                <tr>
                    <td align="left" >
                         <table class="area" align="center">
                            <tr>
                                <th style="width:16%;height:0px">
                                                                    &nbsp;
                                                                </th>
                                <th style="width:16%;height:0px">
                                                                    &nbsp;
                                                                </th>
                                <th style="width:16%;height:0px">
                                                                    &nbsp;
                                                                </th>
                                <th style="width:16%;height:0px">
                                                                    &nbsp;
                                                                </th>
                                <th style="width:16%;height:0px">
                                                                    &nbsp;
                                                                </th>
                                <th style="width:16%;height:0px">
                                                                    &nbsp;
                                                                </th>
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr148" c="CTIPMAT" dejarHueco="false">
                                    <!-- Tipo de matrícula -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="CTIPMAT" f="axisctr148" lit="9001056" /></b>
                                    </td>
                                </axis:ocultar>    
                                
                                 <axis:ocultar c="CPAISORIGEN" f="axisctr148" dejarHueco="false">
                                <td class="titulocaja" id="tit_CPAISORIGEN">
                                    <b id="label_CPAISORIGEN"><axis:alt f="axisctr148" c="CPAISORIGEN" lit="100816"/></b>
                                </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisctr148" c="CMATRIC" dejarHueco="false">
                                    <!-- Matrícula -->
                                    <td id="TCMATRIC" class="titulocaja">
                                        <b><axis:alt c="CMATRIC" f="axisctr148" lit="9001057" /></b>
                                    </td>
                                </axis:ocultar>    
                                 <axis:visible c="CODMOTOR" f="axisctr148">
                                    <!-- Combustible -->
                                    <td class="titulocaja" id="tit_CODMOTOR">
                                        <b><axis:alt c="CODMOTOR" f="axisctr148" lit="9904654" /></b>
                                    </td>  
                                 </axis:visible>
                                 <axis:ocultar f="axisctr148" c="CCHASIS" dejarHueco="false">
                                     <!-- CCHASIS -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CCHASIS" f="axisctr148" lit="9904655" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="NBASTID" dejarHueco="false">
                                     <!-- NBASTID -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="NBASTID" f="axisctr148" lit="9001061" /></b>
                                    </td>
                                </axis:ocultar>    
                                <axis:visible f="axisctr148" c="TTIPVEH">
                                     <!-- tipo vehicle -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="TTIPVEH" f="axisctr148" lit="9001059" /></b>
                                    </td>
                                </axis:visible>    
                                <axis:visible f="axisctr148" c="TCLAVEH" >
                                    <!-- clase vehicle -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="TCLAVEH" f="axisctr148" lit="9001060" /></b>
                                    </td> 
                                </axis:visible>    
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr148" c="CTIPMAT" dejarHueco="false">
                                    <td class="campocaja">
                                            <select name = "CTIPMAT" id="CTIPMAT" <axis:atr f="axisctr148" c="CTIPMAT" a="obligatorio=true&modificable=true&isInputText=false"/>  
                                            title="<axis:alt c="CTIPMAT" f="axisctr148" lit="9001056" />"
                                            size="1" onchange="f_matricula(this.value);f_buscar_matric(1);" class="campowidthselect campo campotexto">
                                                <option value="null"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="tip_matricula" items="${TMATRICULA}">
                                                    <option value = "${tip_matricula.CATRIBU}"
                                                       <c:if test="${(!empty __formdata.CTIPMAT) && tip_matricula.CATRIBU == __formdata.CTIPMAT}"> selected </c:if>>
                                                        ${tip_matricula.TATRIBU}</option>  
                                                </c:forEach>
                                            </select> 
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar c="CPAISORIGEN" f="axisctr148" dejarHueco="false">
                                        <td class="campocaja" id = "td_CPAISORIGEN">
                                          <input type="text"  class="campowidthinput campo campotexto" 
                                          title="<axis:alt f="axisctr148" c="CPAISORIGEN" lit="9000789"/>" size="3" maxlength="3" value="${__formdata.CPAISORIGEN}" 
                                          name="CPAISORIGEN" id="CPAISORIGEN" onchange="f_onchange_CPAIS()" <axis:atr f="axisctr148" c="CPAISORIGEN" a="modificable=true&obligatorio=true"/> style="width:18%;" />
                                              <axis:visible c="findPaisResidencia" f="axisctr148">
                                              <img id="findPaisResidencia" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_RESIDENCIA', null)" style="cursor:pointer"/>
                                              </axis:visible>
                                           <span id="TPAISRESIDENCIA_span"><b>${__formdata.TPAISRESIDENCIA} </b></span>
                                       </td>   
                                </axis:ocultar>
                                <axis:ocultar f="axisctr148" c="CMATRIC" dejarHueco="false">
                                    <td class="campocaja">
                                            <input type="text" name="CMATRIC" id="CMATRIC" value="${__formdata.CMATRIC}" obligatorio="true"
                                            class="campowidthinput campo campotexto" onblur="conMayusculas(this);f_valida_campo(this);f_buscar_matric(1);"
                                            title="<axis:alt c="CMATRIC" f="axisctr148" lit="9001057" />"
                                            <axis:atr f="axisctr148" c="CMATRIC" a="modificable=true"/> maxlength="12"/>
                                    </td>  
                                </axis:ocultar>    
                                
                                <axis:ocultar f="axisctr148" c="CODMOTOR" dejarHueco="false">
                                    <td class="campocaja">
                                            <input type="text" name="CODMOTOR" id="CODMOTOR" value="${__formdata.CODMOTOR}"  class="campowidthinput campo campotexto"
                                             title="<axis:alt c="CODMOTOR" f="axisctr148" lit="9904654" />" onchange="conMayusculas(this);f_valida_campo(this);f_buscar_matric(2);"
                                            <axis:atr f="axisctr148" c="CODMOTOR" a="modificable=true"/>
                                                   maxlength="50"/>
                                    </td>  
                                </axis:ocultar>   
                                 
                              <axis:ocultar f="axisctr148" c="CCHASIS" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" name="CCHASIS" id="CCHASIS" <axis:atr f="axisctr148" c="CCHASIS" a="modificable=true"/>
                                         title="<axis:alt c="CCHASIS" f="axisctr148" lit="9904655" />" onchange="conMayusculas(this);f_valida_campo(this);f_buscar_matric(2);"
                                        value="${__formdata.CCHASIS}"  class="campowidthinput campo campotexto"
                                               maxlength="50"/>
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar f="axisctr148" c="NBASTID" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" name="NBASTID" id="NBASTID" <axis:atr f="axisctr148" c="NBASTID" a="modificable=true"/>
                                         title="<axis:alt c="NBASTID" f="axisctr148" lit="9001061" />" onchange="f_validaCaracter(this);conMayusculas(this);f_valida_campo(this);f_buscar_matric(2);"
                                         value="${__formdata.NBASTID}"  class="campowidthinput campo campotexto"
                                         maxlength="20"/>
                                    </td>
                                </axis:ocultar>  
                                <axis:visible f="axisctr148" c="TTIPVEH">
                                     <td class="campocaja">
                                       <input type="text" name="TTIPVEH" id="TTIPVEH" <axis:atr f="axisctr148" c="TTIPVEH" a="modificable=false"/> 
                                       title="<axis:alt c="TTIPVEH" f="axisctr148" lit="9001059" />"
                                       value="${__formdata.TTIPVEH}"  class="campowidthinput campo campotexto"/>
                                    </td>
                                </axis:visible>  
                                <axis:visible f="axisctr148" c="TCLAVEH">
                                    <td class="campocaja">
                                        <input type="text" name="TCLAVEH" id="TCLAVEH" <axis:atr f="axisctr148" c="TCLAVEH" a="modificable=false"/> 
                                         title="<axis:alt c="TCLAVEH" f="axisctr148" lit="9001060" />" value="${__formdata.TCLAVEH}"  class="campowidthinput campo campotexto"/>
                                    </td>
                                </axis:visible>  
                            </tr>
                            <tr>
                             <axis:ocultar f="axisctr148" c="IVEHICU" dejarHueco="false">
                                    <!-- Imp. Veh. -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="IVEHICU" f="axisctr148" lit="9001058" /></b>
                                    </td>
                                </axis:ocultar>   
                                  <axis:ocultar f="axisctr148" c="IVEHINUE" dejarHueco="false">
                                    <!-- Imp. Veh. -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="IVEHINUE" f="axisctr148" lit="9904722" /></b>
                                    </td>
                                </axis:ocultar>  
                                  <axis:ocultar f="axisctr148" c="CCOLOR" dejarHueco="false">
                                     <!-- Color -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="CCOLOR" f="axisctr148" lit="9001062" /></b>
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar f="axisctr148" c="NKILOMETRAJE" dejarHueco="false">
                                     <!-- KILOMETRAJE -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="NKILOMETRAJE" f="axisctr148" lit="9904723" /></b>
                                    </td>
                                </axis:ocultar> 
                                 <axis:ocultar f="axisctr148" c="CCILINDRAJE" dejarHueco="false">
                                     <!-- KILOMETRAJE -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CCILINDRAJE" f="axisctr148" lit="9904725" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="NPLAZAS" dejarHueco="false">
                                    <!-- Número plazas -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="NPLAZAS" f="axisctr148" lit="9001065" /></b>
                                    </td>
                                </axis:ocultar>  
                                
                            </tr>
                            <tr>
                            
                                <axis:ocultar f="axisctr148" c="IVEHICU" dejarHueco="false">
                                    <td class="campocaja">
                                    <!-- BUG 0027955/0152859 - JSV (19/09/2013) &formato=decimal -->
                                            <input type="text" name="IVEHICU" id="IVEHICU" <axis:atr f="axisctr148" c="IVEHICU" a="modificable=true&formato=decimal"/>
                                             title="<axis:alt c="IVEHICU" f="axisctr148" lit="9001058" />"
                                            value="<fmt:formatNumber pattern='###,##0.00'  value='${__formdata.IVEHICU}'/>"  class="campowidthinput campo campotexto"
                                                   maxlength="19"/>
                                    </td>  
                                </axis:ocultar>  
                                <axis:ocultar f="axisctr148" c="IVEHINUE" dejarHueco="false">
                                    <td class="campocaja">
                                    <!-- BUG 0027955/0152859 - JSV (19/09/2013) &formato=decimal -->
                                            <input type="text" name="IVEHINUE" id="IVEHINUE" <axis:atr f="axisctr148" c="IVEHINUE" a="modificable=true&formato=decimal"/>
                                             title="<axis:alt c="IVEHINUE" f="axisctr148" lit="9904722" />"
                                            value="<fmt:formatNumber pattern='###,##0.00'  value='${__formdata.IVEHINUE}'/>"  class="campowidthinput campo campotexto"
                                                   maxlength="19"/>
                                    </td>  
                                </axis:ocultar> 
                                  <axis:ocultar f="axisctr148" c="CCOLOR" dejarHueco="false">
                                    <td class="campocaja" >
                                            <select name = "CCOLOR" id="CCOLOR"  <axis:atr f="axisctr148" c="CCOLOR" a="obligatorio=true&modificable=true&isInputText=false"/>
                                             title="<axis:alt c="CCOLOR" f="axisctr148" lit="9001062" />"
                                            size="1" onchange="" class="campowidthselect campo campotexto">
                                               <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="color" items="${COLORES}">
                                                    <option value = "${color.CATRIBU}"
                                                       <c:if test="${(!empty __formdata.CCOLOR)&& color.CATRIBU == __formdata.CCOLOR}"> selected </c:if>>
                                                        ${color.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                    </td>
                                </axis:ocultar>  
                                 <axis:ocultar f="axisctr148" c="NKILOMETRAJE" dejarHueco="false">
                                    <td class="campocaja">
										<c:choose>
											<c:when test="${empty __formdata.NKILOMETRAJE || (!empty __formdata.NKILOMETRAJE  && __formdata.NKILOMETRAJE == 0)}">
												<input type="text" name="NKILOMETRAJE" id="NKILOMETRAJE" 
												<axis:atr f="axisctr148" c="NKILOMETRAJE" a="modificable=true&formato=entero"/> 
												 title="<axis:alt c="NKILOMETRAJE" f="axisctr148" lit="9904723" />"
												value="${__formdata.NKILOMETRAJE}"  class="campowidthinput campo campotexto"  maxlength="19"/>
											</c:when>
											<c:otherwise>
												<input type="text" name="NKILOMETRAJE" id="NKILOMETRAJE" 
												<axis:atr f="axisctr148" c="NKILOMETRAJE" a="modificable=true&formato=entero"/> 
												 title="<axis:alt c="NKILOMETRAJE" f="axisctr148" lit="9904723" />"
												value="<fmt:formatNumber pattern='###,##0.00'  value='${__formdata.NKILOMETRAJE}'/>"  class="campowidthinput campo campotexto"
													   maxlength="19"/>
											</c:otherwise>
										</c:choose>
                                    </td>
                                </axis:ocultar> 
                                
                                <axis:ocultar f="axisctr148" c="CCILINDRAJE" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" name="CCILINDRAJE" id="CCILINDRAJE" <axis:atr f="axisctr148" c="CCILINDRAJE" a="modificable=true"/> 
                                         title="<axis:alt c="CCILINDRAJE" f="axisctr148" lit="9904725" />"
                                        value="${__formdata.CCILINDRAJE}"  class="campowidthinput campo campotexto"
                                               maxlength="50"/>
                                    </td>
                                </axis:ocultar>
                    <axis:ocultar f="axisctr148" c="NPLAZAS" dejarHueco="false">
                        <td class="campocaja" colspan="1">
                            <input type="text" name="NPLAZAS" id="NPLAZAS"
                                   <axis:atr f="axisctr148" c="NPLAZAS" a="modificable=true"/>
                                   title='<axis:alt c="NPLAZAS" f="axisctr148" lit="9001065" />'
                                   value="${__formdata.NPLAZAS}"
                                   class="campowidthinput campo campotexto"
                                   maxlength="3"/>
                        </td>
                    </axis:ocultar>
                </tr>
                            <tr>
                             
                            <axis:ocultar f="axisctr148" c="IVEHICUFASECOLDA" dejarHueco="false">
                                    <!-- Imp. Veh. -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="IVEHICUFASECOLDA" f="axisctr148" lit="9904726" /></b>
                                    </td>
                                </axis:ocultar>   
                                  <axis:ocultar f="axisctr148" c="IVEHICUFASECOLDANUE" dejarHueco="false">
                                    <!-- Imp. Veh. -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="IVEHICUFASECOLDANUE" f="axisctr148" lit="9904727" /></b>
                                    </td>
                                </axis:ocultar> 
                            <axis:visible c="CMOTOR" f="axisctr148">
                                    <!-- Combustible -->
                                    <td class="titulocaja" id="LCMOTOR">
                                        <b><axis:alt c="CMOTOR" f="axisctr148" lit="9001054" /></b>
                                    </td>  
                                 </axis:visible>
                                  <axis:ocultar f="axisctr148" c="NPMA" dejarHueco="false">
                                    <!-- P.M.A. -->
                                    <td class="titulocaja">
                                        <b><axis:alt c="NPMA" f="axisctr148" lit="9001063" /></b>
                                    </td>  
                                </axis:ocultar>  
                                
                                
                                <%-- BUG 30256/166723 - 21/02/2014 - RCL --%>
                                <axis:ocultar f="axisctr148" c="NTARA" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="NTARA" f="axisctr148" lit="9001064" /></b>
                                    </td>
                                </axis:ocultar>  
                                <axis:ocultar f="axisctr148" c="CPESO" dejarHueco="false">
                                    <!-- Peso -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CPESO" f="axisctr148" lit="9904882" /></b>
                                    </td>
                                </axis:ocultar> 
                                  <axis:ocultar f="axisctr148" c="CPINTURA" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CPINTURA" f="axisctr148" lit="9904728" /></b>
                                    </td>
                                </axis:ocultar> 
                                
                               
                                <axis:ocultar f="axisctr148" c="KMANY" dejarHueco="false">
                                    <!-- Kilometres al any -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="KMANY" f="axisctr148" lit="9001066" /></b>
                                    </td>
                                </axis:ocultar>  
                            </tr>
                            
                            <tr>
                             <axis:ocultar f="axisctr148" c="IVEHICUFASECOLDA" dejarHueco="false">
                                    <td class="campocaja">
                                            <input type="text" name="IVEHICUFASECOLDA" id="IVEHICUFASECOLDA" <axis:atr f="axisctr148" c="IVEHICUFASECOLDA" a="modificable=false"/>
                                             title="<axis:alt c="IVEHICUFASECOLDA" f="axisctr148" lit="9904726" />"
                                            value="<fmt:formatNumber pattern='###,##0.00'  value='${__formdata.IVEHICUFASECOLDA}'/>"  class="campowidthinput campo campotexto"/>
                                    </td>  
                                </axis:ocultar>  
                                <axis:ocultar f="axisctr148" c="IVEHICUFASECOLDANUE" dejarHueco="false">
                                    <td class="campocaja">
                                            <input type="text" name="IVEHICUFASECOLDANUE" id="IVEHICUFASECOLDANUE" <axis:atr f="axisctr148" c="IVEHICUFASECOLDANUE" a="modificable=false"/>
                                            title="<axis:alt c="IVEHICUFASECOLDANUE" f="axisctr148" lit="9904727" />"
                                            value="<fmt:formatNumber pattern='###,##0.00'  value='${__formdata.IVEHICUFASECOLDANUE}'/>"  class="campowidthinput campo campotexto"/>
                                    </td>  
                                </axis:ocultar> 
                             <axis:ocultar c="CMOTOR" f="axisctr148">
                                <td class="campocaja" >
                                    <select name = "CMOTOR" id="CMOTOR" value="${__formdata.CMOTOR}" size="1" class="campowidthselect campo campotexto"
                                     title="<axis:alt c="CMOTOR" f="axisctr148" lit="9001054" />"
                                        <axis:atr f="axisctr148" c="CMOTOR" a="modificable=true&isInputText=false&obligatorio=true"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${COMBUSTIBLE}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CMOTOR) && combustible.CATRIBU == __formdata.CMOTOR}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                  <axis:ocultar f="axisctr148" c="NPMA" dejarHueco="false">
                                    <td class="campocaja">
									<!-- BUG 0026923/0009029 - JSV (26/08/2013) - INI -->
                                        <!--input type="text" name="NPMA" id="NPMA" <axis:atr f="axisctr148" c="NPMA" a="modificable=true"/> 
                                         title="<axis:alt c="NPMA" f="axisctr148" lit="9001063" />"
                                        value="${__formdata.NPMA}"  class="campowidthinput campo campotexto"
                                               maxlength="13"/-->
                                    
                                        <input type="text" name="NPMA" id="NPMA" <axis:atr f="axisctr148" c="NPMA" a="modificable=true&formato=decimal"/> 
                                         title="<axis:alt c="NPMA" f="axisctr148" lit="9001063" />"
                                        value="<fmt:formatNumber pattern='###,##0.00' value='${__formdata.NPMA}'/>"  class="campowidthinput campo campotexto"
                                               maxlength="13"/>
									<!-- BUG 0026923/0009029 - JSV (26/08/2013) - FIN -->											   
                                    </td>
                                </axis:ocultar>  
                                <%--Bug  27586 -- RCL-- 08/07/2013 --%>
                                <axis:ocultar f="axisctr148" c="NTARA" dejarHueco="false">
                                    <td class="campocaja">
                                        <input type="text" name="NTARA" id="NTARA" <axis:atr f="axisctr148" c="NTARA" a="modificable=true"/> 
                                         title="<axis:alt c="NTARA" f="axisctr148" lit="9001064" />"
                                        value="${__formdata.NTARA}"  class="campowidthinput campo campotexto"/>
                                    </td>
                                </axis:ocultar> 
                                <%--Bug  25202 -- ECP-- 18/02/2013 --%>
                                 <axis:ocultar f="axisctr148" c="CPESO" dejarHueco="false">
                                 <td class="campocaja">
                                   
                                       <select name = "CPESO" id="CPESO" value="${__formdata.CPESO}" size="1"  class="campowidthselect campo campotexto"
                                        <axis:atr f="axisctr148" c="CPESO" a="modificable=true&isInputText=false"/>
                                        title="<axis:alt c="CPESO" f="axisctr148" lit="9001064" />"
                                        >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="pesos" items="${LSTPESOS}">
                                                <option value = "${pesos.CPESO}"
                                                    <c:if test="${(!empty __formdata.CPESO) && pesos.CPESO == __formdata.CPESO}"> selected </c:if>>
                                                                ${pesos.TPESO}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                 </axis:ocultar> 
                                 <axis:ocultar f="axisctr148" c="CPINTURA" dejarHueco="false">
                                 <td class="campocaja">
                                   
                                       <select name = "CPINTURA" id="CPINTURA" value="${__formdata.CPINTURA}" size="1"  class="campowidthselect campo campotexto"
                                        <axis:atr f="axisctr148" c="CPINTURA" a="modificable=true&isInputText=false"/>
                                        title="<axis:alt c="CPINTURA" f="axisctr148" lit="9904728" />"
                                        >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTPINTURA}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CPINTURA) && combustible.CATRIBU == __formdata.CPINTURA}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                                
                                
                              
                                <axis:ocultar f="axisctr148" c="KMANY" dejarHueco="false">
                                    <td class="campocaja">
                                            <select name = "KMANY" id="KMANY"  size="1" <axis:atr f="axisctr148" c="KMANY" a="obligatorio=true&modificable=true&isInputText=false"/>
                                             title="<axis:alt c="KMANY" f="axisctr148" lit="9001066" />"
                                            onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="kmany" items="${KM}">
                                                    <option value = "${kmany.CATRIBU}"
                                                       <c:if test="${(!empty __formdata.NKILOMETROS) && kmany.CATRIBU == __formdata.NKILOMETROS}"> selected </c:if>>
                                                        ${kmany.TATRIBU}</option>  
                                                </c:forEach>
                                            </select>
                                    </td>
                                </axis:ocultar>
                            
                            </tr>
                            <tr>
                            
                            <axis:ocultar f="axisctr148" c="CCAJA" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CCAJA" f="axisctr148" lit="9904729" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CCAMPERO" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CCAMPERO" f="axisctr148" lit="9904730" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CTIPCARROCERIA" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CTIPCARROCERIA" f="axisctr148" lit="9904731" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CSERVICIO" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CSERVICIO" f="axisctr148" lit="9904732" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CORIGEN" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CORIGEN" f="axisctr148" lit="9000443" /></b>
                                    </td>
                                </axis:ocultar> 
                                <axis:ocultar f="axisctr148" c="CTRANSPORTE" dejarHueco="false">
                                    <!-- Tara -->
                                    <td class="titulocaja" >
                                        <b><axis:alt c="CTRANSPORTE" f="axisctr148" lit="9904733" /></b>
                                    </td>
                                </axis:ocultar> 
                            </tr>
                            <tr>
                            
                            
                             <axis:ocultar f="axisctr148" c="CCAJA" dejarHueco="false">
                             <td class="campocaja">
                                   
                                       <select name = "CCAJA" id="CCAJA" value="${__formdata.CCAJA}" size="1"  class="campowidthselect campo campotexto"
                                         title="<axis:alt c="CCAJA" f="axisctr148" lit="9904729" />" <axis:atr f="axisctr148" c="CCAJA" a="modificable=true&isInputText=false"/> >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTCAJA}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CCAJA) && combustible.CATRIBU == __formdata.CCAJA}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                                 <axis:ocultar f="axisctr148" c="CCAMPERO" dejarHueco="false">
                                 <td class="campocaja">
                                   
                                       <select name = "CCAMPERO" id="CCAMPERO" title="<axis:alt c="CCAMPERO" f="axisctr148" lit="9904730" />" value="${__formdata.CCAMPERO}" size="1"  class="campowidthselect campo campotexto"
                                          <axis:atr f="axisctr148" c="CCAMPERO" a="modificable=true&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTCAMPERO}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CCAMPERO) && combustible.CATRIBU == __formdata.CCAMPERO}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                                
                                 <axis:ocultar f="axisctr148" c="CTIPCARROCERIA" dejarHueco="false">
                                 <td class="campocaja">
                                   
                                       <select name = "CTIPCARROCERIA" id="CTIPCARROCERIA" value="${__formdata.CTIPCARROCERIA}" size="1"  class="campowidthselect campo campotexto" 
                                       title="<axis:alt c="CTIPCARROCERIA" f="axisctr148" lit="9904731" />"
                                        <axis:atr f="axisctr148" c="CTIPCARROCERIA" a="modificable=true&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTTIPCARROCERIA}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTIPCARROCERIA) && combustible.CATRIBU == __formdata.CTIPCARROCERIA}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                                
                                 <axis:ocultar f="axisctr148" c="CSERVICIO" dejarHueco="false">
                                       <td class="campocaja">
                                 
                                       <select name = "CSERVICIO" id="CSERVICIO" value="${__formdata.CSERVICIO}" size="1"  class="campowidthselect campo campotexto" title="<axis:alt c="CSERVICIO" f="axisctr148" lit="9904732" />"
                                        <axis:atr f="axisctr148" c="CSERVICIO" a="modificable=true&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTSERVICIO}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CSERVICIO) && combustible.CATRIBU == __formdata.CSERVICIO}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                                
                                 <axis:ocultar f="axisctr148" c="CORIGEN" dejarHueco="false">
                                  <td class="campocaja">
                                 
                                       <select name = "CORIGEN" id="CORIGEN" value="${__formdata.CORIGEN}" size="1"  class="campowidthselect campo campotexto"
                                        title="<axis:alt c="CORIGEN" f="axisctr148" lit="9000443" />"
                                        <axis:atr f="axisctr148" c="CORIGEN" a="modificable=true&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTORIGEN}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CORIGEN) && combustible.CATRIBU == __formdata.CORIGEN}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                            
                            
                                 <axis:ocultar f="axisctr148" c="CTRANSPORTE" dejarHueco="false">
                                  <td class="campocaja">
                                 
                                       <select name = "CTRANSPORTE" id="CTRANSPORTE" value="${__formdata.CTRANSPORTE}" size="1"  class="campowidthselect campo campotexto"
                                        title="<axis:alt c="CTRANSPORTE" f="axisctr148" lit="9904733" />"
                                        <axis:atr f="axisctr148" c="CTRANSPORTE" a="modificable=true&isInputText=false"/>>
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="combustible" items="${LSTTRANSPORTE}">
                                                <option value = "${combustible.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTRANSPORTE) && combustible.CATRIBU == __formdata.CTRANSPORTE}"> selected </c:if>>
                                                                ${combustible.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                    </select>
                                    </td>
                                </axis:ocultar>  
                            
                            
                            </tr>
                            
                            <tr>
                                <%-- BUG 30256/166723 - 21/02/2014 - RCL --%>
                                <axis:ocultar f="axisctr148" c="CTRANSMISION" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b><axis:alt c="CTRANSMISION" f="axisctr148" lit="9906547" /></b>
                                    </td> 
                                </axis:ocultar>
                            </tr>
                            
                            <tr>
                                <td class="campocaja">
                                    <input type="hidden" name="CTRANSMISION" id="CTRANSMISION" value="${__formdata.CTRANSMISION}" />
                                    
                                <%-- BUG 30256/166723 - 21/02/2014 - RCL 
                                <axis:visible f="axisctr148" c="CTRANSMISION"> 
                                
                                        <select name = "CTRANSMISION" id="CTRANSMISION" value="${__formdata.CTRANSMISION}" size="1"  class="campowidthselect campo campotexto"
                                        <axis:atr f="axisctr148" c="CTRANSMISION" a="modificable=true&isInputText=false"/>
                                        title="<axis:alt c="CTRANSMISION" f="axisctr148" lit="9001064" />"
                                        >
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                            <c:forEach var="transmisiones" items="${LSTTRANSMISION}">
                                                <option value = "${transmisiones.CATRIBU}"
                                                    <c:if test="${(!empty __formdata.CTRANSMISION) && transmisiones.CATRIBU == __formdata.CTRANSMISION}"> selected </c:if>>
                                                                ${transmisiones.TATRIBU}
                                                </option>  
                                            </c:forEach>
                                        </select>
                               </axis:visible>  --%>
                               </td>
                            </tr>
                            
                            <tr>
                            <td colspan="2">&nbsp;</td>
                             <!-- Descripción del remolque -->
                                <axis:ocultar f="axisctr148" c="TDREMOLQUE" dejarHueco="false">
                                    <td class="titulocaja">
                                        <b id="TDREMOLQUE"><axis:alt c="TDREMOLQUE" f="axisctr148" lit="9001069" /></b>
                                    </td>
                                </axis:ocultar> 
                                
                                
                            </tr>
                            <tr>
                                <axis:ocultar f="axisctr148" c="CREMOLQUE" dejarHueco="false">
                                    <td class="campocaja" colspan="2">
                                        <b><axis:alt c="CREMOLQUE" f="axisctr148" lit="9001067" /></b>
                                        <input type="radio" name="CREMOLQUE" id="CREMOLQUE" <axis:atr f="axisctr148" c="CREMOLQUE" a="modificable=true&isInputText=false"/>
                                        title="<axis:alt c="CREMOLQUE" f="axisctr148" lit="101778" />"
                                        value="${__formdata.CUSOREM}" onclick="f_descremolque(1)"  <c:if test="${__formdata.CUSOREM == 1}"> checked </c:if>><b><axis:alt c="SI" f="axisctr148" lit="101778" /><b>
                                        <input type="radio" name="CREMOLQUE" id="CREMOLQUE" <axis:atr f="axisctr148" c="CREMOLQUE" a="modificable=true&isInputText=false"/> value="${__formdata.CUSOREM}"  onclick="f_descremolque(0)" <c:if test="${__formdata.CUSOREM == 0}"> checked </c:if>
                                        title="<axis:alt c="CREMOLQUE" f="axisctr148" lit="101779" />"><b><axis:alt c="NO" f="axisctr148" lit="101779"/><b>
                                    </td>
                                    <td class="campocaja">
                                            <select name = "DESREMOLQUE" id="DESREMOLQUE" <axis:atr f="axisctr148" c="DESREMOLQUE" a="modificable=true&isInputText=false"/>
                                             title="<axis:alt c="TDREMOLQUE" f="axisctr148" lit="9001069" />"
                                            value="${__formdata.TREMDESC}" size="1" onchange="" class="campowidthselect campo campotexto">
                                                <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisctr148" c="SELECCIONAR" lit="108341"/> - </option>    
                                                <c:forEach var="desremolque" items="${DESREMOLQUE}">
                                                    <option value = "${desremolque.CATRIBU}"
                                                       <c:if test="${(!empty __formdata.CREMOLQUE) && desremolque.CATRIBU == __formdata.CREMOLQUE}"> selected </c:if>>
                                                        ${desremolque.TATRIBU}</option> 
                                                </c:forEach>
                                            </select>
                                    </td>
                                </axis:ocultar>  
                                  
                            </tr>
                          </table>
                     </td>
                  </tr>   
            </table>