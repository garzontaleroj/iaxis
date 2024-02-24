<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>

<c:set var="nombrePantalla" value="administracion"/>

<script type="text/javascript">
    function f_aceptar_axispro004() {
            document.miForm.subpantalla.value="administracion";
            objUtiles.ejecutarFormulario("axis_axispro001.do?SPRODUC=${param.SPRODUC}", "form", document.miForm, "_self", objJsMessages.jslit_cargando);
        }
        
        function f_but_9901308(){
                objUtiles.abrirModal("axiscomi008", "src", "modal_axiscomi008.do?operation=form&isMantProd=1&VSPRODUC="+${param.SPRODUC}); 
        }
        
        function f_cerrar_axiscomi008(){
                objUtiles.cerrarModal("axiscomi008");
            }
</script>

<form name="${nombrePantalla}" action="" method="POST">
    
    <table cellpadding="0" cellspacing="5" class="seccion" style="padding:1%">
        <tr>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
            <th style="width:25%;height:0px"></th>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TTIPGES" lit="1000478"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TTIPREB" lit="1000479"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TCALCOM" lit="1000480"/></b>
            </td>
            <c:choose>
                <c:when test="${OB_IAX_PRODADMINISTRACION.TRECCOB != null }"> 
                    <td class="titulocaja">
                        <b><axis:alt f="axispro001" c="TRECCOB" lit="1000484"/></b>
                    </td>
                </c:when>
                <c:otherwise>
                    <td>&nbsp;</td>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="TTIPGES" value="${mntproducto.ADMPROD.TTIPGES}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TTIPGES" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TTIPREB" value="${mntproducto.ADMPROD.TTIPREB}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TTIPREB" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TCALCOM" value="${mntproducto.ADMPROD.TCALCOM}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TCALCOM" a="modificable=false"/> />
            </td>
            <c:choose>
                <c:when test="${OB_IAX_PRODADMINISTRACION.TRECCOB != null }"> 
                     <td align="left">
                        <input type="text" name="TRECCOB" value="${mntproducto.ADMPROD.TRECCOB}" class="campowidthinput campo campotexto" style="width:90%"
                        <axis:atr f="axispro001" c="TRECCOB" a="modificable=false"/> />
                    </td>
                </c:when>
                <c:otherwise>
                    <td>&nbsp;</td>
                </c:otherwise>
            </c:choose>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TTIPPAG" lit="111136"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="NDIASPRO" lit="1000481"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CRECFRA" lit="1000482"/></b>
                <input type="checkbox" name="CMOVDOM" value="${mntproducto.ADMPROD.CMOVDOM}" 
                <c:if test="${mntproducto.ADMPROD.CMOVDOM == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CMOVDOM" a="modificable=false"/> disabled/>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CFECCOB" lit="140335"/></b>
                <input type="checkbox" name="CFECCOB" value="${mntproducto.ADMPROD.CFECCOB}" 
                <c:if test="${mntproducto.ADMPROD.CFECCOB == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CFECCOB" a="modificable=false"/> disabled/>
            </td>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="TTIPPAG" value="${mntproducto.ADMPROD.TTIPPAG}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TTIPPAG" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="NDIASPRO" value="${mntproducto.ADMPROD.NDIASPRO}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="NDIASPRO" a="modificable=false"/> />
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="CRECFRA2" lit="1000483"/></b>
                <input type="checkbox" name="CRECFRA" value="${mntproducto.ADMPROD.CRECFRA}" 
                <c:if test="${mntproducto.ADMPROD.CRECFRA == 1}">checked</c:if>
                <axis:atr f="axispro001" c="CMOVDOM" a="modificable=false"/> disabled/>
            </td>
        </tr>
        <tr>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="IMINEXT" lit="1000334"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TCOBBAN" lit="100879"/></b>
            </td>
            <td class="titulocaja">
                <b><axis:alt f="axispro001" c="TCUECAR" lit="112211"/></b>
            </td>
        </tr>
        <tr>
            <td align="left">
                <input type="text" name="IMINEXT" value="${mntproducto.ADMPROD.IMINEXT}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="IMINEXT" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TCOBBAN" value="${mntproducto.ADMPROD.TCOBBAN}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TCOBBAN" a="modificable=false"/> />
            </td>
            <td align="left">
                <input type="text" name="TCUECAR" value="${mntproducto.ADMPROD.TCUECAR}" class="campowidthinput campo campotexto" style="width:90%"
                <axis:atr f="axispro001" c="TCUECAR" a="modificable=false"/> />
            </td>
        </tr>
        <tr>
            <axis:ocultar f="axispro001" c="BT_COMPROD">
            <td class="titulocaja">
                <b><a href="javascript:void(0)"><axis:alt f="axispro001" c="BT" lit="1000325"/></a></b>
            </td>
                <td class="titulocaja" >
                    <b><a href="javascript:f_but_9901308()"><axis:alt f="axispro001" c="BT_COMPROD" lit="9002270"/></a></b>
                </td>
            </axis:ocultar>
        </tr>
         <tr>
            <td class="titulocaja">
                            <b><axis:alt f="axispro001" c="LITERAL" lit="9905956"/></b>
                        </td>           
        </tr>
        <tr>                                
                           <td align="left">
                            <input type="text" name="CNV_SPR" value="${mntproducto.ADMPROD.CNV_SPR}" class="campowidthinput campo campotexto" style="width:90%"
                            <axis:atr f="axispro001" c="CNV_SPR" a="modificable=false"/> />
                        </td>
                    </tr>
    </table>
</form>