<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ page import="java.util.*" %>
<c:set var="nombrePantalla" value="garantias_datostecnicos"/>

<script type="text/javascript">

</script>

<form name="${nombrePantalla}" action="" method="POST">

                
    <table cellpadding="0" cellspacing="2" class="seccion">
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
            
                <b><axis:alt f="axispro001" c="RAMO" lit="107248"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TMORTALIDAD" lit="1000354"/></b>
            </td>
           <td class="titulocaja">
                <b><axis:alt f="axispro001" c="RECARGO" lit="1000339"/></b>
           </td>
           <td class="titulocaja">
                <b><axis:alt f="axispro001" c="PARTICIPACION" lit="1000495"/></b>
                 <input type="checkbox" name="NPARBEN" value="${mntgaran.DATTECNICOS.NPARBEN}" 
                    <c:if test="${mntgaran.DATTECNICOS.NPARBEN == 1}">checked</c:if>
                    <axis:atr f="axispro001" c="NPARBEN" a="modificable=false"/> disabled/>
            </td>
        </tr>
        <tr>
            <td align="left" >
                <input type="text" name="TRAMDGS" value="${mntgaran.DATTECNICOS.TRAMDGS}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="TRAMDGS" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TTABLA" value="${mntgaran.DATTECNICOS.TTABLA}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="TTABLA" a="modificable=false"/> />
            </td>
            <td align="left">
                    <input type="text" name="PRECSEG" value="${mntgaran.DATTECNICOS.PRECSEG}" class="campowidthinput campo campotexto" style="width:60%"
                    <axis:atr f="axispro001" c="PRECSEG" a="modificable=false"/> />
            </td>
        </tr>
         <tr>                           
                            <td class="titulocaja">
                                <b><axis:alt f="axispro001" c="TPROVIS" lit="9000729"/></b>
                            </td>
           
                        </tr>                        
                         <tr>  
                              
                  <td align="left" >
                <input type="text" name="TPROVIS" value="${mntgaran.DATTECNICOS.TPROVIS}" class="campowidthinput campo campotexto" style="width:80%"
                <axis:atr f="axispro001" c="TPROVIS" a="modificable=false"/> />
            </td>
                             </tr>
    </table>
</form>