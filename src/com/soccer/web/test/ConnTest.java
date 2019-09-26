package com.soccer.web.test;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.soccer.web.enums.DBDriver;
import com.soccer.web.enums.DBUrl;
import com.soccer.web.pool.Constants;

public class ConnTest {
	public static void main(String[] args) {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(DBDriver.ORACLE_DRIVER.toString());
			conn = DriverManager.getConnection(DBUrl.ORACLE_URL.toString(),
					Constants.USERNAME, Constants.PASSWORD);
			if(conn != null) {
				System.out.println("연결 성공");
				stmt = conn.createStatement();
				rs = stmt.executeQuery("SELECT P.*, (SELECT TEAM_NAME FROM TEAM WHERE TEAM_ID LIKE P.TEAM_ID )\r\n" + 
						"FROM (SELECT *\r\n" + 
						"           FROM PLAYER\r\n" + 
						"           WHERE POSITION IN('GK','MF')\r\n" + 
						"            AND TEAM_ID IN('K07','K09','K08')) P");
				List<String> list = new ArrayList<>();
				while(rs.next()) {
					list.add(rs.getString("PLAYER_NAME"));
				}
				System.out.println("팀명: \n"+list);
				
			}else {
				System.out.println("연결 실패");
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
	}
}
