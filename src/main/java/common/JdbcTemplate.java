package common;

import java.io.FileReader;
import java.io.FileWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

public class JdbcTemplate {
	private JdbcTemplate() {}
		
	
	public static Connection getConnection() {
		Connection conn = null;
		Properties prop = new Properties(); 
		//TODO
		try {
			String currentPath = JdbcTemplate.class.getResource("./").getPath(); 
//			String currentPath = JdbcTemplate.class.getResource("").getPath(); 
//			String currentPath = JdbcTemplate.class.getResource("../").getPath(); 
//			String currentPath = JdbcTemplate.class.getResource("../../common").getPath(); 
//			System.out.println(currentPath);
//			c:\workspace\.metadata\.server.core\tmp0\\\\\
			prop.load(new FileReader(currentPath+"driver.properties"));
//			prop.store(new FileWriter(currentPath+"driver.properties"), "파일에쓰기");
//			prop.setProperty("key1", "value1");
			//System.out.println(prop.getProperty("jdbc.url"));
			Class.forName(prop.getProperty("jdbc.driver"));
			conn = DriverManager.getConnection(prop.getProperty("jdbc.url")
											, prop.getProperty("jdbc.username")
											, prop.getProperty("jdbc.password"));
			
			if(conn != null) System.out.println("연결성공"); else System.out.println("연결실패!!!!!!!!!");
			//conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return conn;
	}
	public static void autoCommit(Connection con, boolean autocommit) {
		try {
			if(con!=null) con.setAutoCommit(autocommit);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void commit(Connection con) {
		try {
			if(con!=null) con.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void rollback(Connection con) {
		try {
			if(con!=null) con.rollback();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public static void close(Connection con) {
		try {
			if(con != null) con.close();
		} catch (Exception e) {
		}
	}
	public static void close(Statement stmt) {
		try {
			if(stmt != null) stmt.close();
		} catch (Exception e) {
		}
	}
	public static void close(ResultSet rs) {
		try {
			if(rs != null) rs.close();
		} catch (Exception e) {
		}
	}
	
}






