<%/* Revision:# ADEWCUP9LePoc/1EuJrncQ== # */%>
<%@ page contentType="text/html;charset=windows-1252"
         errorPage="/WEB-INF/jsp/axiserror.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

				
						<!-- *************************  CUMULOS  ****************** -->
						<tr><td>		
                        <axis:visible c="DSP_CUMULOS" f="axisper009">    
                                <table class="seccion">
                                	<tr>
                                        <td>
		                                    <axis:visible f="axisper009" c="CBOTCUMCUP"> 
											 	<div style="float:left;">	
													<input type="button" class="boton" id="CBOTCUMCUP" 
														value="<axis:alt f="axisper009" c="BT_BOTCUMCUP" 
														lit="108853"></axis:alt>" onclick="f_abrir_axisrea052('MANTTO_PER')" />
												</div>	
										     </axis:visible>  
										 </td>
									</tr>	              
                                </table>
                        </axis:visible>
                        </td></tr>     
                        <!-- *************************  Cumulos  ********************* -->