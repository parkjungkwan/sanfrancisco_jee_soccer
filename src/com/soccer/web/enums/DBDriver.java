package com.soccer.web.enums;

public enum DBDriver {
	ORACLE_DRIVER,
	MYSQL_DRIVER,
	MARIADB_DRIVER;
	
	@Override
	public String toString() {
		String driver = "";
		switch (this) {
		case ORACLE_DRIVER:
			driver = "oracle.jdbc.OracleDriver";
			break;

		default:
			break;
		}
		return driver;
	}

}
