<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<c:set var="nombrePantalla" value="garantias_impuestos"/>

<script type="text/javascript">

</script>
<!--${mntgaran.IMPUESTOS}-->
<form name="${nombrePantalla}" action="" method="POST">    
    <table cellspacing="5" class="seccion" style="padding-left:1%;padding-right:1%">
        <tr>
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
            <th style="width:10%;height:0px"></th> 
        </tr>
        <tr>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="100916"/></b> 
            </td>            
            <td>
                <input type="checkbox" name="CIMPCON" disabled <c:if test="${mntgaran.IMPUESTOS.CIMPCON==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="800378"/></b>
            </td>            
            <td>
                <input type="checkbox" name="CIMPDGS" disabled <c:if test="${mntgaran.IMPUESTOS.CIMPDGS==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="1000253"/></b>                
            </td>            
            <td>
                <input type="checkbox" name="CIMPIPS" disabled <c:if test="${mntgaran.IMPUESTOS.CIMPIPS==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="101705"/></b>                
            </td>            
            <td>
                <input type="checkbox" name="CIMPARB" disabled <c:if test="${mntgaran.IMPUESTOS.CIMPARB==1}">checked</c:if> />
            </td>
            <td class="titulocaja" style="text-align:right">
                <b><fmt:message key="103478"/></b>  
            </td>            
            <td>
                <input type="checkbox" name="CIMPFNG" disabled <c:if test="${mntgaran.IMPUESTOS.CIMPFNG==1}">checked</c:if> />
            </td>
        </tr>
    </table>
    
</form>