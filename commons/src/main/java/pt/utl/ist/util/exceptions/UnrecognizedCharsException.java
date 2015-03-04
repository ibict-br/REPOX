/**
 * 
 */
package pt.utl.ist.util.exceptions;

import java.util.HashMap;
import java.util.Map;

/**
 * @author rodrigoGurgel
 *
 */
public class UnrecognizedCharsException extends Exception {

	private static final long serialVersionUID = -7958583711251425813L;

	private Map< Integer, Integer > waywardChars = new HashMap<Integer, Integer>();

	private String fixedString;
	/**
	 * 
	 */
	
	public Map< Integer, Integer > GetWaywardChars(){
		return waywardChars;
	}
	
	public String GetFixedString(){
		return fixedString;
	}
	
	public UnrecognizedCharsException() {
		super("Unrecognized Char Coding");
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public UnrecognizedCharsException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}
	
	public UnrecognizedCharsException(String message, String fixedString, Map< Integer, Integer > waywardChars ) {
		super(message);
		this.waywardChars.putAll( waywardChars );
		this.fixedString = fixedString;
	}

	/**
	 * @param cause
	 */
	public UnrecognizedCharsException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public UnrecognizedCharsException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 * @param enableSuppression
	 * @param writableStackTrace
	 */
	public UnrecognizedCharsException(String message, Throwable cause,
			boolean enableSuppression, boolean writableStackTrace) {
		super(message, cause, enableSuppression, writableStackTrace);
		// TODO Auto-generated constructor stub
	}

}
