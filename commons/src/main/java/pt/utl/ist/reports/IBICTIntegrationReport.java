/**
 * 
 */
package pt.utl.ist.reports;

import java.io.File;
import java.io.IOException;

import org.apache.commons.io.FileUtils;

/**
 * @author rodrigo gurgel
 *
 */
public class IBICTIntegrationReport {

	public static void addSimpleIntegrationReport(String text, Class object, File file) {
		try {
			FileUtils.writeStringToFile(file, "String to append", true);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
