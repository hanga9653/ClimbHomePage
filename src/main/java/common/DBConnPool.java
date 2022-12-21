package common;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class DBConnPool {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public DBConnPool() {
		try {
			Context initCtx = new InitialContext();
			Context ctx = (Context)initCtx.lookup("java:comp/env");
			//server.xml에 네이밍 등록해야됨
			DataSource source = (DataSource)ctx.lookup("dbcp_mysql");
			//커넥션에 생성한 객체를 가져다가 사용
			con = source.getConnection();
			System.out.println("DB 커넥션 풀 연결 성공");
		}
		catch (Exception e) {
			System.out.println("DB 커넥션 풀 연결 실패");
			e.printStackTrace();
		}
	}
	
	//사용이 끝난 객체 반납(소멸X)
	public void close() {
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(psmt!=null)psmt.close();
			if(con!=null)con.close();
			
			System.out.println("JDBC1 자원 해제");
		}
		catch (Exception e) {
			e.printStackTrace();
		}
	}
}
