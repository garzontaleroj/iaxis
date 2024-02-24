<%/*
*  Fichero: displaytag.jsp
*  @author <a href = "mailto:echristen@csi-ti.com">elmar Christen</a> 
*  @author <a href = "mailto:xgallego@csi-ti.com">Xavi Gallego</a>
*  @author <a href = "mailto:rkirchner@csi-ti.com">Roger Kirchner</a> 
*  
*  Pantalla que printea el JSTL displaytag con los resultados obtenidos de la búsqueda de persona.
*
*  Fecha: 22/10/2007
*/%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<display:setProperty name="basic.msg.empty_list"><fmt:message key="1000255" /></display:setProperty>                       
<display:setProperty name="basic.msg.empty_list_row"><fmt:message key="1000255" /></display:setProperty>
<display:setProperty name="paging.banner.invalid_page"><fmt:message key="1000256" /></display:setProperty>
<display:setProperty name="paging.banner.item_name"><fmt:message key="1000257" /></display:setProperty>
<display:setProperty name="paging.banner.items_name"><fmt:message key="1000258" /></display:setProperty>
<display:setProperty name="paging.banner.no_items_found"><fmt:message key="1000259" /></display:setProperty>
<display:setProperty name="paging.banner.one_item_found"><fmt:message key="1000260" /></display:setProperty>
<display:setProperty name="paging.banner.all_items_found"><fmt:message key="1000260" /></display:setProperty>
<display:setProperty name="paging.banner.some_items_found"><fmt:message key="1000261" /></display:setProperty>
<display:setProperty name="paging.banner.full"><fmt:message key="1000262" /></display:setProperty>
<display:setProperty name="paging.banner.first"><fmt:message key="1000263" /></display:setProperty>
<display:setProperty name="paging.banner.last"><fmt:message key="1000264" /></display:setProperty>
<display:setProperty name="paging.banner.onepage"><fmt:message key="1000265" /></display:setProperty>
<display:setProperty name="paging.banner.page.selected"><fmt:message key="1000266" /></display:setProperty>
<display:setProperty name="paging.banner.page.link"><fmt:message key="1000267" /></display:setProperty>
<display:setProperty name="paging.banner.page.separator"><fmt:message key="1000268" /></display:setProperty>
<display:setProperty name="paging.banner.export.sepchar"><fmt:message key="1000268" /></display:setProperty>
<display:setProperty name="paging.banner.export.banner"><fmt:message key="1000270" /></display:setProperty>
