package kr.or.ddit.smartware.email.model;

import javax.mail.Store;

public class GmailConnector {
	private static Store store;

	public static Store getStore() {
		return store;
	}

	public static void setStore(Store store) {
		GmailConnector.store = store;
	}

	
	
	
}