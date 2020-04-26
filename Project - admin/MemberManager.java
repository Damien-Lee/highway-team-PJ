package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberManager {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	private DataSource ds;
	
	//데이터베이스 연결
	public MemberManager( )  {
		try  {
			Context context = new InitialContext( );
			ds = (DataSource)context.lookup("java:");
		}  catch (Exception e)  {
			System.out.println("connection err:" + e);
		}
	}
	
	//아이디 체크
	public boolean checkId(String id)  {
		boolean b = false;
		try  {
			String sql = "select id from homepage_member where id like ?";
			conn = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery( );
			b=rs.next( );
		}  catch (Exception e)  {
			System.out.println("checkId err : " + e);
		}  finally  {
			try  {
				if(rs		  != null)rs.close( );
				if(pstmt != null)pstmt.close( );
				if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return b;
	}
	
	
	//회원가입
	public boolean insertData(MemberBean bean)  {
		boolean b = false;
		try  {
			String sql = "insert into homepage_member values(?,?,?,?)";
			conn = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getId ( ));
			pstmt.setString(2, bean.getNickname ( ));
			pstmt.setString(2, bean.getBirthday ( ));
			pstmt.setString(4, bean.getPassword ( ));
			if(pstmt.executeUpdate( ) > 0)b=true;
			
		}  catch (Exception e)  {
			System.out.println("insertData err : " + e);
		}  finally  {
			try  {
				if(rs		  != null)rs.close( );
				if(pstmt != null)pstmt.close( );
				if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return b;
	}
	
	//로그인용 데이터 탐색
	public String login(String id, String password)  {
		String str="";
		try  {
			String sql = "select id, name from homepage_member where id=? and pass=?";
			conn = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password); 
			rs = pstmt.executeQuery( );
			if(rs.next()) str=rs.getString("name");

		}  catch (Exception e)  {
			System.out.println("login err : " + e);
		}  finally  {
			try  {
				if(rs  	  != null)rs.close( );
				if(pstmt != null)pstmt.close( );
				if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return str;
	}
	
	//회원 수정 - 회원 정보 가저오기
	public MemberDto getData(String id)  {
		MemberDto dto = null;
		try  {
			String sql = "select id, password, nickname, birthday from homepage_member where id like ?";
			conn = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery( );
			if(rs.next( )){
				dto = new MemberDto( );
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setNickname(rs.getString("nickname"));
				dto.setBirthday(rs.getString("birthday"));
			}
			
		}  catch (Exception e)  {
			System.out.println("getData err : " + e);
		}  finally  {
			try  {
				if(rs		  != null)rs.close( );
				if(pstmt != null)pstmt.close( );
				if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return dto;
	}
	
	//회원정보 수정 - 수정하기
	public boolean modifyData(MemberBean bean)  {
		boolean b = false;
		try {
			String sql = "update homepage_member set password=?, nickname=?, birthday=? where id=?";
			conn = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bean.getPassword( ));
			pstmt.setString(2, bean.getNickname( ));
			pstmt.setString(3, bean.getBirthday( ));
			pstmt.setString(4, bean.getId( ));
			if(pstmt.executeUpdate( ) > 0) b=true;
		}  catch (Exception e)  {
			System.out.println("modifyData err : " + e);
		}  finally  {
				try  {
					if(rs		  != null)rs.close( );
					if(pstmt != null)pstmt.close( );
					if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return b;
	}
	
	//회원 탈퇴 - 비밀번호 확인
	public boolean deleteConfirm(String id, String password)  {
		boolean b = false;
		try  {
			String sql = "select * from homepage_member where id = ? and password = ?";
			conn   = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, password);
			rs       = pstmt.executeQuery( );
			if(rs.next( )) b = true;
			
		}  catch (Exception e)  {
			System.out.println("deleteConfirm err : " + e);
		}  finally  {
				try  {
					if(rs		  != null)rs.close( );
					if(pstmt != null)pstmt.close( );
					if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return b;
	}
	
	//회원 탈퇴 - 탈퇴하기
	public boolean deleteData(String id)  {
		boolean b = false;
		try {
			String sql = "delete from homepage_member where id = ?";
			conn        = ds.getConnection( );
			pstmt       = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			int re = pstmt.executeUpdate( );
			if(re > 0) b = true;
			
		}  catch (Exception e)  {
			System.out.println("deleteData err : " + e);
		}  finally  {
			try {
				if(rs		  != null)rs.close( );
				if(pstmt != null)pstmt.close( );
				if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return b;
	}
	
	//---------------------------- 관리자 ----------------------------
	//관리자 로그인
	public boolean admin_login(String admin_id, String admin_password)  {
		boolean b = false;
		try  {
			String sql = "select * from admin where admin_id = ? and admin_password = ?";
			conn   = ds.getConnection( );
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, admin_id);
			pstmt.setString(2, admin_password);
			rs = pstmt.executeQuery( );
			b = rs.next( );
		}  catch (Exception e)  {
			System.out.println("admin_login err : " + e);
		}  finally  {
			try {
				if(rs 		  != null)rs.close( );
				if(pstmt != null)pstmt.close( );
				if(conn  != null)conn.close( );
			}  catch (Exception e2)  {
			}
		}
		return b;
	}

}
