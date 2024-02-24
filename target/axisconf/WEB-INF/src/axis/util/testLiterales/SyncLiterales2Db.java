package axis.util.testLiterales;

import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Vector;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import axis.jdbc.AccesoSQL;


public class SyncLiterales2Db {
    
    public static class SortedProperties extends Properties{
        public synchronized Enumeration keys() {
            Enumeration keysEnum = super.keys();
            Vector keyList = new Vector();
            while(keysEnum.hasMoreElements()){
                keyList.add(keysEnum.nextElement());
            }
            Collections.sort(keyList);
        return keyList.elements();
        }
    }
    
    public SyncLiterales2Db() {
    }
    
    public static void main (String [] var_args) throws Exception{
        Log logger = LogFactory.getLog(SyncLiterales2Db.class);
        Connection conn = null;
        
        try{

            Class c = Class.forName ("oracle.jdbc.driver.OracleDriver");
            logger.debug("Cargado puente java-jdbcOracle " + c);
            
            logger.debug("A conectarse " + c);
            conn = DriverManager.getConnection ("jdbc:oracle:thin:@192.168.10.15:1521:DELTA", "icre_t", "i");
            
            AccesoSQL sqlStmnt = new AccesoSQL (conn);
            
            // depr. String[] ficheros = {"_es", "_ca"};
            // String[] ficheros = {"_ca"};
            
            String[] ficheros = {"_2", "_1"}; // <=> {"_es", "_ca"}
            

            // TODO: Parametrizar ruta!
            String path = "C:\\DEVELOP\\jdevstudio10133\\jdev\\mywork\\iAxisCredit\\axisweb\\src";
            // String[] srcPathTmp = ((publicPath.indexOf("public_html") != -1) ? publicPath.split("public_html") : publicPath.split("WEB-INF"));
            // String srcPath = srcPathTmp[0] + ((publicPath.indexOf("public_html") != -1) ? "src" : File.separator + "WEB-INF" + File.separator + "src");
            
            for (int j = 0; j < ficheros.length; j++) {
                //Directorio de properties

                String srcPath = path +  File.separator + "mensajes" + ficheros[j] + ".properties";
    
                //Cargar literales de properties en una lista
                SortedProperties literales = new SortedProperties();
                literales.load(new FileInputStream(new File(srcPath)));                
                
                List listaLiterales = new ArrayList();
                List listaTLITERA = new ArrayList();
                
                //Almacenamiento de los literales cargados
                for (Enumeration e = literales.keys(); e.hasMoreElements(); ) {
                    Map m = new HashMap();
                    Object obj = e.nextElement();
                    String SLITERA = obj.toString();
                    String TLITERA = literales.getProperty(SLITERA);
                    m.put("SLITERA", SLITERA);
                    m.put("TLITERA", TLITERA);
                    
                    if (!listaTLITERA.contains(TLITERA)) {
                        listaTLITERA.add(TLITERA);
                        listaLiterales.add(m);                                 
                    } else {
                        String deleteStm1 = "DELETE FROM AXIS_LITERALES WHERE SLITERA=" + SLITERA + "";
                        String deleteStm2 = "DELETE FROM AXIS_CODLITERALES WHERE SLITERA=" + SLITERA + "";
                        
                        sqlStmnt.execute(conn, deleteStm1); 
                        sqlStmnt.execute(conn, deleteStm2);
                        logger.error("LITERAL: " + SLITERA + " estaba repetido y se ha borrado");                
                    }
                }                        
                 
                for (int i = 0; i < listaLiterales.size(); i++) {
                    if (listaLiterales != null && !listaLiterales.isEmpty()) {
                        Map LITERALES = (Map) listaLiterales.get(i);
                        String SLITERA = (String) LITERALES.get("SLITERA");
                        String TLITERA = (String) LITERALES.get("TLITERA");                        
                        TLITERA = TLITERA.replaceAll("'", "''");
                        
                        // depr. String idioma = ficheros[j].equals("_ca") ? "1" : "2";
                        String idioma = ficheros[j].equals("_1") ? "1" : "2";
                        
                        String insertStm = "UPDATE AXIS_LITERALES SET TLITERA='" + TLITERA + "' WHERE SLITERA=" + SLITERA + " AND CIDIOMA=" + idioma;
                        
                        sqlStmnt.execute(conn, insertStm);                        
                        logger.debug("LITERAL: " + SLITERA + " modificado bien");                
                    }                                        
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        } finally {
            if (conn != null)
                conn.close();
        }
    }
}
