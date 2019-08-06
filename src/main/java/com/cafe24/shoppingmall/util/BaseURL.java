package com.cafe24.shoppingmall.util;

public class BaseURL {

	public static final String URL_PROTOCOL = "http://";
	public static final String CONTEXT_IP = "localhost";
	public static final String CONTEXT_PORT = "8080";
	public static final String API_SERVER_URL = "shoppingmall-backend";

	public static String getContextURL() {
		String contextURL = URL_PROTOCOL + CONTEXT_IP + ":" + CONTEXT_PORT+"/"+ API_SERVER_URL;
		return contextURL;
	}

}
