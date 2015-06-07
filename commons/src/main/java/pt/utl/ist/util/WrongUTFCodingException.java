package pt.utl.ist.util;

import java.util.HashMap;
import java.util.Map;

public class WrongUTFCodingException extends Exception {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4476377657835308199L;

	private HashMap< String, CharErrorSpecification > description = new HashMap<String, CharErrorSpecification>();
	private String outText = "";

	public WrongUTFCodingException( String outText, Map< String, CharErrorSpecification > description ){
		this.description.putAll(description);
		this.outText = outText;
	}

	public HashMap<String, CharErrorSpecification> getDescription() {
		return description;
	}

	public String getOutText() {
		return outText;
	}

	public void setOutText(String outText) {
		this.outText = outText;
	}
}
