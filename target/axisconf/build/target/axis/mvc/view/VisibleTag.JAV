package axis.mvc.view;

import axis.service.axis.AxisBaseService;
import axis.util.Constantes;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.TagSupport;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;


public class VisibleTag extends TagSupport {
    static Log logger = LogFactory.getLog(VisibleTag.class);
    
    boolean enableDebug = false;
    
    String f = null; // form/whoami/pantalla
    String c = null; // campo/item/componente/parrafo
    
    HttpServletRequest request = null;

    boolean visible = true;

    public VisibleTag() {        
    }
    
    private VisibleTag(HttpServletRequest request) {        
        this.request = request;
    }

    public void setF(String f) {
        this.f = f;
    }

    public String getF() {
        return f;
    }

    public void setC(String c) {
        this.c = c;
    }

    public String getC() {
        return c;
    }
    
    public boolean getVisible() {
        return visible;
    }

    public int doStartTag() throws JspException {
        try {
            procesar();            
        } catch (Exception e) {
            logger.warn("No se ha podido ejecutar el VisibleTag (f=" + f + ",c=" + c + "): " + e.getLocalizedMessage());            
        } finally {
            return (visible ? EVAL_BODY_INCLUDE : SKIP_BODY);
        }            
    }

    public int doEndTag() throws JspException {
        return EVAL_PAGE;
    }

    public static boolean esComponenteVisible(HttpServletRequest request, String f, String c) {
        VisibleTag vt = new VisibleTag(request);          
        vt.setF(f);
        vt.setC(c);        
        
        try {            
            vt.procesar();
        } catch (Exception e) {
            logger.warn("No se ha podido ejecutar el VisibleTag (f=" + f + ",c=" + c + "): " + e.getLocalizedMessage());            
        } finally {
            return vt.getVisible();
        }        
    }

    private void procesar() throws Exception {
        HashMap m = null;
        if (pageContext != null)
            m = (HashMap) pageContext.getRequest().getAttribute(Constantes.CONFIGFORM);
        else if (request != null)
            m = (HashMap) request.getAttribute(Constantes.CONFIGFORM);
            
        if (isEmpty(m)) {
            // throw new Exception("No existe CONFIGFORM en PageScope/RequestScope.");
            visible = true;
            return;
        }
            
        String llave = f + "__" + c + "__" + "visible";
        String valor = (String) m.get(llave);
        
        if (enableDebug)
            logger.debug("COMPONENTE: " + c + " 'visible': " + 
                         (!isEmpty(valor) ? valor : "No hay info en BD."));
                     
        if (!isEmpty(valor) && valor.equalsIgnoreCase("false")) {
            visible = false;
        } else {
            visible = true;
        }
        
        if (enableDebug)
            logger.debug("Finalmente, el componente " + c + " queda como visible=\"" + visible + "\"");
    }

    private boolean isEmpty(Object obj) {
        return AxisBaseService.isEmpty(obj);
    }

}
