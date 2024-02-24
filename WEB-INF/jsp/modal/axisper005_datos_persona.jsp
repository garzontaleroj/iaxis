<%/* Revision:# yw/ItbzfYYv27Y2bGxAaGw== # */%>
<%/***Fichero: axisctr148.jsp,Autos*/%>
<%@ page contentType="text/html;charset=windows-1252"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

	<script language="Javascript" type="text/javascript">
	
    function soloLetrasNumeros(e){
	       key = e.keyCode || e.which;
	       tecla = String.fromCharCode(key).toLowerCase();
	       letras = " áéíóúabcdefghijklmnñopqrstuvwxyz1234567890";
	       especiales = "8-37-39-46";
	
	       tecla_especial = false;
	       for(var i in especiales){
	            if(key == especiales[i]){
	                tecla_especial = true;
	                break;
	            }
	        }
	
	        if(letras.indexOf(tecla)==-1 && !tecla_especial){
	            return false;
	        }
	 }
    </script>

<table class="seccion" >
                            <tr>
                                <th style="width:4%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:21%;height:0px"></th>
                                <th style="width:22%;height:0px"></th>
                                <th style="width:20%;height:0px"></th>
                            <tr>
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="CTIPER" lit="102844"/></b>
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="CTIPIDE" lit="109774"/></b>
                                </td>
                                <td class="titulocaja">
                                  <b><axis:alt f="axisper005" c="NNUMIDE" lit="105330"/></b>
                                </td>
                              <%--  <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->--%>
                                <axis:ocultar c="SNIP" f="axisper005">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="SNIP" lit="1000088"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                <td class="campocaja">
                                <!-- ** LCF ** __formdata.TIDENTI NOMBRE CAMPO -->
                                    <select title='<axis:alt f="axisper005" c="CTIPER" lit="102844"/>' name="CTIPPER" id="CTIPPER" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <c:if test="${((empty __formdata.isNew || !empty __formdata.CTIPPER) || !empty __formdata.SPEREAL) && __formdata.CESTPER != 99}"> disabled </c:if> onchange="f_onchange_TIDENTI(this.value)" >&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipPerson}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CTIPPER}"> selected </c:if> /> <!-- ** LCF ** __formdata.TIDENTI -->
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                <td class="campocaja">
                                   

                                    <select title='<axis:alt f="axisper005" c="CTIPIDE" lit="109774"/>' name="CTIPIDE" id="CTIPIDE" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <c:if test="${((empty __formdata.isNew || !empty __formdata.CTIPIDE) || ( !empty __formdata.SPEREAL)) && __formdata.CESTPER != 99}"> disabled </c:if>
                                    <c:if test="${__formdata.CESTPER == 99}"> <axis:atr f="axisper005" c="CTIPIDE" a="obligatorio=true"/> </c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipDocum}">
                                            <option value = "${element.CATRIBU}" 
                                                <c:if test="${element.CATRIBU == __formdata.CTIPIDE}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                  
                               
                               
                                    
                                </td>
                                <td class="campocaja" >
                                    <input title='<axis:alt f="axisper005" c="NNUMIDE" lit="105330"/>' type="text" class="campowidthinput campo campotexto" size="15" value="${__formdata.NNUMIDE}"  name="NNUMIDE" id="NNUMIDE" style="width:50%;text-transform:uppercase;"
                                    <c:if test="${(empty __formdata.isNew || !empty __formdata.NNUMIDE) && __formdata.CESTPER != 99}"> readonly </c:if>/>
                                  
                                  
                                </td>
                                <%--<c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->--%>
                                <axis:ocultar c="SNIP" f="axisper005">
                                <td class="campocaja">
                                    <input type="text"  <axis:atr f="axisper005" c="SNIP" a="modificable=true"/>  
                                    <c:if test="${!empty __formdata.SNIP && !__formdata.isNew }"> readonly </c:if> 
                                    class="campowidthinput campo campotexto" size="15" value="${__formdata.SNIP}" 
                                    name="SNIP" id="SNIP" style="width:90%;"/>
                                  <%--  <c:if test="${!empty __formdata.SNIP && !__formdata.isNew}"> 
                                    <input type="hidden" class="campowidthinput campo campotexto" size="15" value="${__formdata.SNIP}" name="SNIP" id="SNIP" style="width:90%;"/>
                                    </c:if>--%>
                                </td>
                                </axis:ocultar>
                              <%--  </c:if>--%>
                            </tr>
                             <tr>
                            <td></td>
                             <axis:ocultar c="SWRUT" f="axisper005"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT"><axis:alt f="axisper005" c="SWRUT" lit="9903067"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE">
                                                <b id="label_TDIGITOIDE"><axis:alt f="axisper005" c="TDIGITOIDE" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                            <axis:ocultar c="SWRUT_COLM" f="axisper005"  dejarHueco="false">
                             <td class="titulocaja" colspan="2" id="tit_SWRUT">
                               <table>
                               <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                
                                            <td class="titulocaja" >
                                                <b id="label_SWRUT_COLM"><axis:alt f="axisper005" c="SWRUT_COLM" lit="9904620"/></b>
                                            </td>
                                            <td class="titulocaja" id="tit_TDIGITOIDE_COLM">
                                                <b id="label_TDIGITOIDE_COLM"><axis:alt f="axisper005" c="TDIGITOIDE_COLM" lit="9903068"/></b>
                                            </td>
                                   </tr>
                                   </table>
                                   </td>
                                </axis:ocultar>
                                 <axis:visible c="TIPOSOC" f="axisper005">
                                      <td class="titulocaja" colspan="2" id="tit_TIPOSOC">
                                          <b id="label_TIPOSOC"><axis:alt f="axisper005" c="TIPOSOC" lit="9903269"/></b>
                                        </td>   
                                    </axis:visible>
                            </tr>
                            <tr>
                            <td></td>
                            
                             <axis:ocultar c="SWRUT" f="axisper005"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT" colspan="2">
                                <table>
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja">
                               
                                     <input onClick="f_onclickCheckbox(this)" type="checkbox" id="SWRUT" name="SWRUT"  <axis:atr f="axisper005" c="SWRUT" a="modificable=true&isInputText=false"/> 
                                      <c:if test="${__formdata.SWRUT == 1}">checked="true"</c:if>  value="${__formdata.SWRUT}"/>
                                </td>
                                <td class="campocaja" id="td_TDIGITOIDE">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                 value="${__formdata.TDIGITOIDE}" name="TDIGITOIDE" id="TDIGITOIDE"  style="width:25%;text-transform:uppercase;"
                                    <axis:atr f="axisper005" c="TDIGITOIDE" a="modificable=false"/>
                                    />
                                 </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                               <%-- BUG 32649 INI --%>
                          
                                 <axis:ocultar c="SWRUT_COLM" f="axisper005"  dejarHueco="false">
                                <td class="campocaja" id="td_SWRUT_COLM" colspan="2">
                                <table>
                                <tr>
                                    <th style="width:20%;height:0px"></th>
                                    <th style="width:80%;height:0px"></th>                                
                                </tr>
                                <tr>
                                <td class="campocaja" >
                            				 <input onClick="f_onclickCheckbox(this)" type="checkbox" id="SWRUT_COLM" name="SWRUT_COLM"  <axis:atr f="axisper005" c="SWRUT_COLM" a="modificable=false&isInputText=false"/> 
                                      <c:if test="${__formdata.SWRUT_COLM == 1}">checked="true"</c:if>  value="${__formdata.SWRUT}"/>
                                </td>
                                      <td class="campocaja" id="td_TDIGITOIDE_COLM">
                                   <input type="text" class="campowidthinput campo campotexto" size="50" 
                                    title='<axis:alt f="axisper005" c="TDIGITOIDE_COLM" lit="9903068"/>' 
                                    	<axis:atr f="axisper005" c="TDIGITOIDE_COLM" a="modificable=true"/>
                                    value="${__formdata.TDIGITOIDE_COLM}" name="TDIGITOIDE_COLM" id="TDIGITOIDE_COLM" onchange="f_onchange_TDIGITOIDE_COLM(this.value)"  style="width:25%;"
                                     <c:if test="${empty __formdata.isNew}"> <axis:atr f="axisper005" c="TDIGITOIDE_COLM" a="modificable=false"/> </c:if> 
                                    <axis:atr f="axisper005" c="TDIGITOIDE_COLM" /> >
                                            
                                </td>
                                </tr>
                                </table>
                                </td>
                                </axis:ocultar>
                                <%-- BUG 32649 fin--%>
                              <axis:visible c="TIPOSOC" f="axisper005">
                                     <td class="campocaja" id="td_TIPOSOC" colspan="2" >
                                   <input type="text" class="campowidthinput campo campotexto"  size="15" value="${__formdata.TIPOSOC}" id="TIPOSOC" name="TIPOSOC"  readonly>
                                </td>  
                                </axis:visible>
                            </tr>
                          <tr>
                              <axis:ocultar f="axisper005" c="tit_TNOMBRE" dejarHueco="false">
                                <td>
                                    &nbsp; 
                                </td>
                              </axis:ocultar>
                                 
                                <axis:ocultar f="axisper005" c="TNOMBRE" dejarHueco="false">
                                     <td class="titulocaja" id="tit_TNOMBRE">
                                      <b id="label_TNOMBRE"><axis:alt f="axisper005" c="TNOMBRE" lit="105940"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="TNOMBRE1" dejarHueco="false">
                                    <td class="titulocaja" id="tit_TNOMBRE1">
                                      <b id="label_TNOMBRE1"><axis:alt f="axisper005" c="TNOMBRE1" lit="105940"/></b>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="TNOMBRE2" dejarHueco="false">
                                    <td class="titulocaja" id="tit_TNOMBRE2">
                                      <b id="label_TNOMBRE2"><axis:alt f="axisper005" c="TNOMBRE2" lit="9902260"/></b>
                                    </td>
                                </axis:ocultar>     
                            <axis:ocultar f="axisper005" c="TAPELLI1" dejarHueco="false">
                               <td class="titulocaja" id="tit_TAPELLI1">
                                    <b id="label_TAPELLI1"><axis:alt f="axisper005" c="TAPELLI1" lit="108243"/></b>
                                </td>
                              </axis:ocultar>
                              
                              <axis:ocultar f="axisper005" c="CCIIU" dejarHueco="false">
	                             	 <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 1}"> 
		                                <td class="titulocaja" id="tit_CCIIU">
		                                    <b id="label_CCIIU"><axis:alt f="axisper005" c="CCIIU" lit="9909091"/></b>
		                                </td>
	                                </c:if> 
                              </axis:ocultar>
                              
                                    <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                    <td class="titulocaja">
                                        <b><axis:alt f="axisper005" c="TAPELLI2" lit="108246"/></b>
                                    </td>
                                    </c:if>                              
                            
                            <%--c:if test="${__formdata.CTIPPER == 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                                 <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CIDIOMA" lit="1000246"/></b>
                                </td> 
                                 <axis:ocultar c="CPAIS" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CPAIS" lit="9000789"/></b>
                                </td>
                                </axis:ocultar>
                            </c:if--%>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp; 
                                </td>
                                
                                <axis:ocultar f="axisper005" c="TNOMBRE" dejarHueco="false">
                                    <td class="campocaja" id="td_TNOMBRE" >
                                        <input type="text" title="<axis:alt f="axisper005" c="TNOMBRE" lit="105940"/>" onkeypress="return soloLetrasNumeros(event)" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE}" name="TNOMBRE" id="TNOMBRE" style="width:90%;" <axis:atr f="axisper005" c="TNOMBRE" a="modificable=true&obligatorio=true"/>
                                    </td>
                                </axis:ocultar>
                                <axis:ocultar f="axisper005" c="TNOMBRE1" dejarHueco="false">
                                    <td class="campocaja" id="td_TNOMBRE1" >
                                        <input type="text" title="<axis:alt f="axisper005" c="TNOMBRE1" lit="105940"/>" onkeypress="return soloLetrasNumeros(event)" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE1}" name="TNOMBRE1" id="TNOMBRE1" style="width:90%;" <axis:atr f="axisper005" c="TNOMBRE1" a="modificable=true&obligatorio=true"/>
                                        <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.TNOMBRE1}"> readonly </c:if>/>
                                    </td>
                                </axis:ocultar>
                                 <axis:ocultar f="axisper005" c="TNOMBRE2" dejarHueco="false">
                                    <td class="campocaja" id="td_TNOMBRE2">
                                        <input type="text" title="<axis:alt f="axisper005" c="TNOMBRE2" lit="9902260"/>" onkeypress="return soloLetrasNumeros(event)" class="campowidthinput campo campotexto" size="15" value="${__formdata.TNOMBRE2}" name="TNOMBRE2" id="TNOMBRE2" style="width:90%;"
                                        <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.TNOMBRE2}"> readonly </c:if>/>
                                    </td>
                                </axis:ocultar>
                                
                                <axis:ocultar f="axisper005" c="TAPELLI1" dejarHueco="false">
                                <td class="campocaja"  id="td_TAPELLI1">
                                    <input type="text" title="<axis:alt f="axisper005" c="TAPELLI1" lit="108243"/>" onkeypress="return soloLetrasNumeros(event)" class="campowidthinput campo campotexto" size="15" value="${__formdata.TAPELLI1}" name="TAPELLI1" id="TAPELLI1" style="width:90%;" <axis:atr f="axisper005" c="TAPELLI1" a="modificable=true&obligatorio=true"/>
                                    <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.TAPELLI1}"> readonly </c:if>/>
                                </td>
                                </axis:ocultar>
                                
                                <axis:ocultar c="CCIIU" f="axisper005" dejarHueco="false">
	                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 1}"> 
	                                
		                                <td class="campocaja" colspan="3">       
			                           		<input type="text" class="campowidthinput campo campotexto" onkeypress="return ValidNum(event);"
			                                size="15" value="${__formdata.CCIIU}" name="CCIIU" id="CCIIU"
			                                style="width:10%;" title="<axis:alt f="axisper010" c="CCIIU" lit="9909091"/>"
			                                        <axis:atr f="axisper005" c="CCIIU" a="obligatorio=false"/>/>
			                                        &nbsp;<img id="findCCIIU" border="0" src="images/find.gif" onclick="f_abrir_axisciiu001(null, null)" style="cursor:pointer"/>
			                                &nbsp;<span id="TCCIIU_span"><b>${__formdata.DCIIU}</b></span>         
			                           </td>
	                                </c:if>  
                                </axis:ocultar>
                                
                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                                <td class="campocaja">
                                    <input type="text" title="<axis:alt f="axisper005" c="TAPELLI2" lit="108246"/>" onkeypress="return soloLetrasNumeros(event)" class="campowidthinput campo campotexto" size="15" value="${__formdata.TAPELLI2}" name="TAPELLI2" id="TAPELLI2" style="width:90%;"
                                    <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.TAPELLI2}"> readonly </c:if>/>
                                </td>
                                </c:if>
                                
                     
                            </tr>
                            
                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>
                              <axis:ocultar f="axisper005" c="FNACIMI" dejarHueco="false">
                                <td class="titulocaja"  id="tit_FNACIMI">
                                    <b id="label_FNACIMI"><axis:alt f="axisper005" c="FNACIMI" lit="1000064"/></b>
                                </td>                                
                                </axis:ocultar>    
                                                                
                            <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                                  <axis:ocultar f="axisper005" c="CSEXPER" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CSEXPER" lit="100962"/></b>
                                </td>
                                  </axis:ocultar> 
                             </c:if>
                             		<axis:ocultar c="CIDIOMA" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CIDIOMA" lit="1000246"/></b>
                                </td>
                                </axis:ocultar>
                                 <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                 <axis:ocultar c="CPROFES" f="axisper005" dejarHueco="false">
                                <td class="titulocaja">
                                    <b><axis:alt f="axisper005" c="CPROFES" lit="110978"/></b>
                                </td>  
                                    </axis:ocultar>
                                </c:if>
                                 <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                    <axis:ocultar c="COCUPACION" f="axisper005" dejarHueco="false">
                                        <td class="titulocaja">
                                            <b><axis:alt f="axisper005" c="COCUPACION" lit="9904804"/></b>
                                        </td>  
                                    </axis:ocultar>
                                </c:if>
                                <axis:ocultar c="CPAIS" f="axisper005" dejarHueco="false">
                                <td class="titulocaja" id="tit_CPAIS">
                                    <b id="label_CPAIS"><axis:alt f="axisper005" c="CPAIS" lit="9000789"/></b>
                                </td>
                                </axis:ocultar>
                            </tr>                            
                            <tr>
                                <td>
                                    &nbsp;
                                </td>  
                                
                                          <axis:ocultar f="axisper005" c="FNACIMI" dejarHueco="false">
                                <td class="campocaja"   id="td_FNACIMI">
                                    <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:80%;"
                                    onblur="javascript:f_formatdate(this,'')"
                                    <axis:atr f="axisper005" c="FNACIMI" a="modificable=true&formato=fecha"/> title="<axis:alt f="axisper005" c="FNACIMI" lit="1000064"/>"
                                     <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.FNACIMI}"> readonly </c:if>/>                                     
                                     <%-- <c:if test="${! __formdata.isNew || !empty __formdata.FNACIMI}"> readonly </c:if>/> --%>
                                     <c:if test="${__formdata.isNew && empty __formdata.FNACIMIcerca || empty __formdata.SPEREAL || empty __formdata.FNACIMI}">
                                     <a style="vertical-align:middle;"><img id="popup_calendario_FNACIMI" alt="<axis:alt f="axisper005" c="FNACIMI" lit="1000064"/>" title="<axis:alt f="axisper005" c="FNACIMI" lit="1000064" />" src="images/calendar.gif"/></a></c:if>

                                     <%--  <input type="text" class="campowidthinput campo campotexto" size="10" value="<fmt:formatDate pattern="dd/MM/yyyy" value="${__formdata.FNACIMI}"/>" name="FNACIMI" id="FNACIMI"  style="width:85%;"
                                    <axis:atr f="axisper005" c="FNACIMI" a="modificable=true&formato=fecha"/> title="<axis:alt f="axisper005" c="FNACIMI" lit="1000064"/>"
                                    <c:if test="${! __formdata.isNew || !empty __formdata.CSEXPER}"> readonly </c:if>/><c:if test="${__formdata.isNew && empty __formdata.FNACIMIcerca }"><a style="vertical-align:middle;"><img id="popup_calendario_FNACIMI" alt="<axis:alt f="axisper005" c="FNACIMI" lit="1000064"/>" title="<axis:alt f="axisper005" c="FNACIMI" lit="1000064" />" src="images/calendar.gif"/></a></c:if>--%>
                                </td>
                                </axis:ocultar> 
                             <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                <td class="campocaja">
                                     <axis:ocultar f="axisper005" c="CSEXPER" dejarHueco="false">
                                    <select name="CSEXPER" id="CSEXPER" title="<axis:alt f="axisper005" c="CSEXPER" lit="100962"/>" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.CSEXPER}"> disabled </c:if>/>                                                                         
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.tipSexo}">
                                            <option value = "${element.CATRIBU}" 
                                            <c:if test="${element.CATRIBU == __formdata.CSEXPER}"> selected </c:if> />
                                                ${element.TATRIBU} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar> 
                            </c:if>  
                            		<axis:ocultar c="CIDIOMA" f="axisper005" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="CIDIOMA" id="CIDIOMA" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                    	<axis:atr f="axisper005" c="CIDIOMA" a="isInputText=false&obligatorio=false"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstIdiomas}">
                                            <option value = "${element.CIDIOMA}" 
                                            <c:if test="${element.CIDIOMA == __formdata.CIDIOMA}"> selected </c:if> />
                                                ${element.TIDIOMA} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                              </axis:ocultar>
                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> <!-- ** LCF ** __formdata.TIDENTI -->
                              <axis:ocultar f="axisper005" c="CPROFES" dejarHueco="false">
                                <td class="campocaja">
                                   
                                    <select name="CPROFES" id="CPROFES" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper005" c="CPROFES" lit="110978"/>"
                                        <axis:atr f="axisper005" c="CPROFES" a="isInputText=false&obligatorio=false"/>
                                        <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.CPROFES}"> disabled </c:if>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstProfesiones}">
                                            <option value = "${element.CPROFES}" 
                                            <c:if test="${element.CPROFES == __formdata.CPROFES}"> selected </c:if> />
                                                ${element.TPROFES} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                    
                                </td>
                                </axis:ocultar> 
                                </c:if>
                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}">
                                <axis:ocultar c="COCUPACION" f="axisper005" dejarHueco="false">
                                <td class="campocaja">
                                    <select name="COCUPACION" id="COCUPACION" size="1" class="campowidthselect campo campotexto" style="width:90%;" title="<axis:alt f="axisper005" c="COCUPACION" lit="9904804"/>"
                                     <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.COCUPACION}"> disabled </c:if>/> 
                                        <axis:atr f="axisper005" c="COCUPACION" a="isInputText=false&obligatorio=false"/>>&nbsp;
                                        <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                        <c:forEach var="element" items="${__formdata.listValores.lstOcupaciones}">
                                            <option value = "${element.CPROFES}" 
                                            <c:if test="${element.CPROFES == __formdata.COCUPACION}"> selected </c:if> />
                                                ${element.TPROFES} 
                                            </option>
                                        </c:forEach>
                                    </select>
                                </td>
                                </axis:ocultar>
                                </c:if>
                                <axis:ocultar c="CPAIS" f="axisper005" dejarHueco="false">
                                        <td class="campocaja">
                                                  <input type="text"  class="campowidthinput campo campotexto" title="<axis:alt f="axisper005" c="CPAIS" lit="9000789"/>" size="3" maxlength="3" 
                                                  value="${__formdata.CPAIS}<c:if test="${empty __formdata.CPAIS}">${__configform.axisper005__CPAIS__valordefecto}</c:if>"
                                                  name="CPAIS" id="CPAIS" onchange="f_onchange_CPAIS()" <axis:atr f="axisper005" c="CPAIS" a="modificable=true&obligatorio=true"/> style="width:30px;" />
                                                      <axis:visible c="findPaisResidencia" f="axisper005">
                                                      <img  title="<axis:alt f="axisper005" c="CNACIONALIDAD" lit="9000508"/>" id="findPaisResidencia" border="0" src="images/find.gif" onclick="f_abrir_axiscom001('152430', 'LISTA_PAIS_RESIDENCIA', null)" style="cursor:pointer"/>
                                                      </axis:visible>
                                                   <span id="TPAISRESIDENCIA_span"><b>${__formdata.TPAISRESIDENCIA} </b></span>
                                       </td>   
                                </axis:ocultar>
                            </tr>     
                            
                             <tr>
                                <td>
                                    &nbsp;
                                </td>
                                <axis:ocultar c="CESTCIV" f="axisper005" dejarHueco="false">
	                                <c:if test="${__formdata.CTIPPER != 2}">
	                                      <td class="titulocaja">
	                                        <b><axis:alt f="axisper005" c="CESTCIV" lit="9900955"/></b>
	                                      </td>
	                                </c:if>
                                </axis:ocultar>
                                
                                <axis:ocultar c="CCIIU" f="axisper005" dejarHueco="false">
		                              <c:if test="${__formdata.CTIPPER != 2}">
		                                      <td class="titulocaja">
		                                        <b><axis:alt f="axisper005" c="CCIIU" lit="9909091"/></b>
		                                      </td>
		                              </c:if>
                                </axis:ocultar>
                             </tr>
                             
                              <tr>
                                <td>
                                    &nbsp;
                                </td>      
                                <axis:ocultar c="CESTCIV" f="axisper005" dejarHueco="false">
                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> 
                                <td class="campocaja">
                                        <select title="<axis:alt f="axisper005" c="CESTCIV" lit="9900955"/>" name="CESTCIV" id="CESTCIV" size="1" class="campowidthselect campo campotexto" style="width:90%;"
                                        <c:if test="${!empty __formdata.SPEREAL && !empty __formdata.CESTCIV}"> disabled </c:if>>&nbsp;
                                            <option value="<%= Integer.MIN_VALUE %>"> - <axis:alt f="axisper005" c="SNV_COMBO" lit="1000348"/> - </option>
                                            <c:forEach var="element" items="${__formdata.listValores.lstEstciv}">
                                                <option value = "${element.CATRIBU}" 
                                                    <c:if test="${element.CATRIBU == __formdata.CESTCIV}"> selected </c:if> />
                                                        ${element.TATRIBU} 
                                                 </option>
                                            </c:forEach>
                                        </select>
                                </td>
                                </c:if>  
                                </axis:ocultar>
                                
                                <axis:ocultar c="CCIIU" f="axisper005" dejarHueco="false">
	                                <c:if test="${empty __formdata.CTIPPER || __formdata.CTIPPER != 2}"> 
	                                
		                                <td class="campocaja" colspan="3">       
			                           		<input type="text" class="campowidthinput campo campotexto" onkeypress="return ValidNum(event);"
			                                size="15" value="${__formdata.CCIIU}" name="CCIIU" id="CCIIU"
			                                style="width:10%;" title="<axis:alt f="axisper010" c="CCIIU" lit="9909091"/>"
			                                        <axis:atr f="axisper005" c="CCIIU" a="obligatorio=false"/>/>
			                                        &nbsp;<img id="findCCIIU" border="0" src="images/find.gif" onclick="f_abrir_axisciiu001(null, null)" style="cursor:pointer"/>
			                                &nbsp;<span id="TCCIIU_span"><b>${__formdata.DCIIU}</b></span>         
			                           </td>
	                                </c:if>  
                                </axis:ocultar>
                                
                              </tr>
                        </table>
