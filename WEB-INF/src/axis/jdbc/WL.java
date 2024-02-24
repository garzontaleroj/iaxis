package axis.jdbc;//WLS-Ready

//WLX

import java.io.File;

import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

public class WL {
	static Log logger = LogFactory.getLog(WL.class);

	public WL() {
		super();
	}

	public static void main(String[] args) throws Exception {
		File[] files = new File("C:\\projects\\10_1_3_1\\iAxis\\axistest\\webcontext\\WEB-INF\\src\\axis\\jdbc")
				.listFiles();
		String fileString = null;
		String substring = null;
		String substringR = null;
		for (File file : files) {
			if (file.isFile()) {
				fileString = FileUtils.readFileToString(file);
				if (!file.canWrite()) {
					continue;
				}
				// if (file.getName().indexOf("PAC_TEST_ME")<0) {
				// continue;
				// }
				if (fileString.indexOf("WLS-Ready") < 0) {
					logger.debug(".................file.getAbsolutePath():" + file.getAbsolutePath());
					fileString = StringUtils.replace(fileString, "cStmt.close",
							"retVal=new ConversionUtil().convertOracleObjects(retVal);cStmt.close");
					fileString = StringUtils.replace(fileString, "return new ConversionUtil().convertOracleObjects (",
							"returnX");
					fileString = StringUtils.replace(fileString, "return new ConversionUtil().convertOracleObjects(",
							"returnX");
					int offset = 0;
					int target = 0;
					while (fileString.indexOf("returnX") >= 0) {
						offset = fileString.indexOf("returnX");
						target = fileString.indexOf(");", offset + 1);
						substring = fileString.substring(offset, target) + ");";
						substringR = StringUtils.replace(substring, "returnX", "return ");
						substringR = substringR.substring(0, substringR.length() - 2) + "; ";
						fileString = StringUtils.replace(fileString, substring, substringR);
					}

					fileString = StringUtils.replace(fileString, "cStmt.close ", "cStmt.close");
					fileString = StringUtils.replace(fileString, ";cStmt.close", ";\n            cStmt.close");
					fileString = StringUtils.replace(fileString, "cStmt.close();",
							"cStmt.close();//AXIS-WLS1SERVER-Ready");
					fileString = StringUtils.replace(fileString,
							"retVal=new ConversionUtil().convertOracleObjects(retVal);",
							"retVal=new ConversionUtil().convertOracleObjects(retVal);//AXIS-WLS1SERVER-Ready");

					fileString = StringUtils.replace(fileString, "axis.jdbc;", "axis.jdbc; //WLS-Ready");
					FileUtils.writeStringToFile(file, fileString);
				}
			}
		}
	}
}
