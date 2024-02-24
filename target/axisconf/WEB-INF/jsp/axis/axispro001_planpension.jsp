<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="datostecnicos"/>

<script type="text/javascript">
    
                        
</script>

<form name="${nombrePantalla}" action="" method="POST">
    <table cellpadding="0" cellspacing="5" style="padding:1%" class="seccion">
    
        <tr>
            <th style="width:25%;height:0%;"/>
            <th style="width:25%;height:0%;"/>
            <th style="width:25%;height:0%;"/>
            <th style="width:25%;height:0%;"/>
        </tr>
        <tr>
            <axis:ocultar f="axispro001" c="CCODPLA"> 
                <td class="titulocaja">
                     <b><axis:alt f="axispro001" c="CCODPLA" lit="9900880"/></b>
                </td>
            </axis:ocultar>
        </tr>
        <tr>
            <axis:ocultar f="axispro001" c="CCODPLA"> 
                <td class="campocaja" colspan="2">
                    <input  type="text" style="width:10%" name="CCODPLA" id="CCODPLA" value="${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.CGESDGS}" class="campowidthinput campo" readonly="true"/>                                             
                    <input  type="text" style="width:80%" name="TPLA" id="TPLA" value="${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.TNOMPLA}" class="campowidthinput campo" readonly="true"/>
                </td>
            </axis:ocultar>  

        </tr>
        <tr>
            <axis:ocultar f="axispro001" c="CCODFON"> 
                <td class="titulocaja" colspan="2">
                     <b><axis:alt c="CCODFON" f="axispro001" lit="1000179"/></b>
                </td>
            </axis:ocultar>
        </tr>
        <tr>
            <axis:ocultar f="axispro001" c="CCODFON"> 
                <td class="campocaja" colspan="2">
                    <input  type="text" style="width:10%" name="CCODFON" id="CCODFON" value="${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.CFONDGS}" class="campowidthinput campo" readonly="true"/>                                             
                    <input  type="text" style="width:80%" name="TENTIDAD" id="TENTIDAD" value="${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.TFONDO}" class="campowidthinput campo" readonly="true"/>
                </td>
            </axis:ocultar>  

        </tr>
        <tr>                            
            <axis:ocultar f="axispro001" c="CCODGESA"> 
                <td class="titulocaja">
                    <b><axis:alt c="CCODGESA" f="axispro001" lit="9001782"/></b>
                </td>
            </axis:ocultar>                                
        </tr>  
        <tr>
             <td class="campocaja" colspan="2">
                <input  type="text" style="width:10%" name="CCODGESA" id="CCODGESA" value="${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.CGESDGS}" class="campowidthinput campo" readonly="true" style="width:10%"/>
                <input  type="text" style="width:80%" name="TCODGES" id="TCODGES" value="${mntproducto.PLANPENSIONES[0].OB_IAX_PLANPENSIONES.TNOMGES}" class="campowidthinput campo" readonly="true" style="width:80%"/>
            </td>
        </tr>
    </table>
</form>