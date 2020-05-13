package jdbc;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//�� Ŭ������ db������ ����ߴ� ���ð�ü�� ��ȯ�ϴµ� �ʿ��� ����� ����
public class JdbcUtil {

	//ResultSet �ݱ�=> JdbcUtil.close(ResultSet��ü);
	public static void close(ResultSet rs) {
		if (rs != null) {
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		}
	}
	
	//Statement �ݱ�
	public static void close(Statement stmt) {
		if (stmt != null) {
			try {
				stmt.close();
			} catch (SQLException ex) {
			}
		}
	}
	
	//Connection �ݱ� =>JdbcUtil.close(Connection��ü);
	public static void close(Connection conn) {
		if (conn != null) {
			try {
				conn.close();
			} catch (SQLException ex) {
			}
		}
	}

	public static void rollback(Connection conn) {
		if (conn != null) {
			try {
				conn.rollback();
			} catch (SQLException ex) {
			}
		}
	}
}
