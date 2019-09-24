package com.soccer.web.factory;

import java.sql.Connection;
import java.sql.DriverManager;

import com.soccer.web.pool.Constants;

public class Oracle implements Database{
	@Override
	public Connection getConnection() {
		Connection conn = null;
		try {
			Class.forName(Constants.ORACLE_DRIVER);
			conn =  DriverManager.getConnection(
					Constants.ORACLE_URL,
					Constants.USERNAME,
					Constants.PASSWORD);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
}
