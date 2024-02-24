<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ page contentType="text/html;charset=windows-1252"%>

<!-- Sub form seccion datos generales -->
<c:set var="pantalla" value="axisplantillajsp_seccion"/>

<script type="text/javascript">
    
</script>
<!--Cada seccion tiene su form particular -->
<form name="${pantalla}" action="axis_plantilla.do">
   
    <!-- Area de campos  -->
    <div class="notitulo"></div>
    <table class="seccion">
        <tr>
          <td>

             <table class="subseccion">
                             <tr>
                                    <th style="width:33%;height:0px"></th>
                                       
                                    <th style="width:33%;height:0px"></th>
                                            
                                    <th style="width:33%;height:0px"></th>
                                       
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2"/></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja dim100">
                                                <select name="select"   id="select" size="1" onchange="" class="campowidth campo campotexto_ob">&nbsp;                                        
                                                    <option value = "null"> - Seleccione una opción - </option>
                                                    <option value = "0" selected>Opción 0</option>
                                                    <option value = "1" selected>Opción 1</option>
                                                    <option value = "2" selected>Opción 2</option>
                                                    <option value = "3" selected>Opción 3</option>
                                                </select>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo2" name="campo2" size="15"
                                            value="campo2"/>
                                            </td>
                                            <td class="campocaja">
                                            <input onClick="" checked
                                            type="checkbox" id="check" name="chek" value="" />
                                    
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2" /></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo1" name="campo1" size="15"
                                            value="campo1"/>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo2" name="campo2" size="15"
                                            value="campo2"/>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo3" name="campo3" size="15"
                                            value="campo3"/>
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td>
                                            
                                        </td>
                                        </tr>
                            </table>
                          
                                <tr>
                                    <td>

                                        <table class="area subseccion">
                                                <tr>
                                                    <td>
                                                    
                                                    <c:set var="title0"><fmt:message key="Nombre" /></c:set>
                                                    <c:set var="title1"><fmt:message key="Tlf" /></c:set>
                                                    <c:set var="title2"><fmt:message key="Cargo" /></c:set>
                                                    <div class="separador">&nbsp;</div>
                                                    <div class="displayspace">
                                                      <display:table name="${lista}" id="lista" export="false" class="dsptgtable" pagesize="-1" defaultsort="1" defaultorder="ascending" sort="list" cellpadding="0" cellspacing="0"
                                                       requestURI="axis_plantilla.do?operation=resumen&ordenar=true">
                                                        <%@ include file="../include/displaytag.jsp"%>
                                                        <display:column title="" sortProperty="radio" sortable="false" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspIcons"><input  checked onClick="" 
                                                            value="" type="radio" id="radio" name="radio"/></div>
                                                        </display:column>
                                                        <display:column title="${title0}" sortable="true" sortProperty="NOMBRE" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspText">${lista.NOMBRE}</div>
                                                        </display:column>
                                                        <display:column title="${title1}" sortable="false" sortProperty="TLF" headerClass="headwidth5 sortable" media="html" autolink="false" >
                                                            <div class="dspNumber">${lista.TLF}</div>
                                                        </display:column>
                                                        <display:column title="${title2}" headerClass="sortable" media="html" autolink="false" >
                                                            <div class="dspText">${lista.CARGO}</div>
                                                        </display:column>
                                                       
                                                    </display:table>
                                                    </div>
                                                   <div class="separador">&nbsp;</div>
                                                    </td>
                                                </tr>
                                        </table>
                                    </td>
                                </tr>
                          
          
  
        </td>
        </tr>
    </table>
    
    
    
    <!-- Area de campos -->
    <div class="separador">&nbsp;</div>
    <div class="notitulo"></div>
     <table class="seccion">
        <tr>
          <td>

             <table class="subseccion">
                                        <tr>
                                            <th style="width:33%;height:0px"></th>
                                       
                                            <th style="width:33%;height:0px"></th>
                                            
                                            <th style="width:33%;height:0px"></th>
                                       
                                        </tr>
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2"/></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        <tr>
                                            <td class="campocaja dim100">
                                                <select name="select"   id="select" size="1" onchange="" class="campowidth campo campotexto_ob">&nbsp;                                        
                                                    <option value = "null"> - Seleccione una opción - </option>
                                                    <option value = "0" selected>Opción 0</option>
                                                    <option value = "1" selected>Opción 1</option>
                                                    <option value = "2" selected>Opción 2</option>
                                                    <option value = "3" selected>Opción 3</option>
                                                </select>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo2" name="campo2" size="15"
                                            value="campo2"/>
                                            </td>
                                            <td class="campocaja">
                                            <input onClick="" checked
                                            type="checkbox" id="check" name="chek" value="" />
                                    
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_1"/></b>
                                            </td>
                                            
                                            <td class="titulocaja" >
                                                <b><fmt:message key="titulo_campo_2" /></b>
                                            </td>
                                            
                                            <td class="titulocaja">
                                                <b><fmt:message key="titulo_campo_3"/></b>
                                            </td>
                                            
                                        </tr>
                                        
                                        <tr>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo1" name="campo1" size="15"
                                            value="campo1"/>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo2" name="campo2" size="15"
                                            value="campo2"/>
                                            </td>
                                            <td class="campocaja">
                                            <input  type="text" class="campowidth campo campotexto" id="campo3" name="campo3" size="15"
                                            value="campo3"/>
                                            </td>
                                       </tr>
                     </table>
       </td>
        </tr>
    </table>
       
  
    </form>
  