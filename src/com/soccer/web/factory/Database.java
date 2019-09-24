package com.soccer.web.factory;

import java.sql.Connection;

public interface Database {
	public Connection getConnection();
}
