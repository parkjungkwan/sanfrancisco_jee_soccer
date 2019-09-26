package com.soccer.web.enums;

public enum DBUrl {
	ORACLE_URL, MARIADB_URL;
	@Override
	public String toString() {
		String url = "";
		switch (this) {
		case ORACLE_URL:
			url = "jdbc:oracle:thin:@localhost:1521:xe";
			break;

		default:
			break;
		}
		return url;
	}

}
