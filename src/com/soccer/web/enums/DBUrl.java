package com.soccer.web.enums;

public enum DBUrl {
	ORACLE_URL, MARIADB_URL;
	@Override
	public String toString() {
		String driver = "";
		switch (this) {
		case ORACLE_URL:
			driver = "oracle.jdbc.OracleDriver";
			break;

		default:
			break;
		}
		return driver;
	}

}
