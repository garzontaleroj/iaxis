<%@ page contentType="text/html;charset=iso-8859-15" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="/WEB-INF/tld/displaytag-11.tld" prefix="display"%>
<%@ taglib uri="/WEB-INF/tld/axis-1.tld" prefix="axis"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<fmt:setLocale value="${sessionScope.__locale}"/>
<fmt:setBundle scope="request" basename="axis.bundle.Mensajes"/>
<script type="text/javascript">
        Calendar.setup({
            inputField     :    "FBAJAGE",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FBAJAGE", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FINIVIGCOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIGCOM", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FINIVIGSOBRECOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINIVIGSOBRECOM", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FFINVIGSOBRECOM",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINVIGSOBRECOM", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FRECEPCONTRA",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FRECEPCONTRA", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FALTASOC",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "FALTASOC_ICO", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FINSDGS",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FINSDGS", 
            singleClick    :    true,
            firstDay       :    1
        });
        
        Calendar.setup({
            inputField     :    "FFINCREDITO",     
            ifFormat       :    "%d/%m/%Y",      
            button         :    "icon_FFINCREDITO", 
            singleClick    :    true,
            firstDay       :    1
        });


   </script>