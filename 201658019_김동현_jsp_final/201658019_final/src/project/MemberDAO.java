package project;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import project.MemberVO;

public class MemberDAO {
	private Connection con;
	private PreparedStatement pstmt;
	private DataSource dataFactory;

	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			Context envContext = (Context) ctx.lookup("java:/comp/env");
			dataFactory = (DataSource) envContext.lookup("jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public List listMembers() {
		List list = new ArrayList();
		try {
			con = dataFactory.getConnection();
			String query = "select * from t_member";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String dept = rs.getString("dept");
				String gender = rs.getString("gender");
				String birth = rs.getString("birth");
				String introduction = rs.getString("introduction");
				MemberVO vo = new MemberVO();
				vo.setId(id);
				vo.setPwd(pwd);
				vo.setName(name);
				vo.setEmail(email);
				vo.setTel(tel);
				vo.setDept(dept);
				vo.setGender(gender);
				vo.setBirth(birth);
				vo.setIntroduction(introduction);
				
				
				list.add(vo);
			}
			rs.close();
			pstmt.close();
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public void addMember(MemberVO memberVO) {
		try {
			Connection con = dataFactory.getConnection();
			String id = memberVO.getId();
			String pwd = memberVO.getPwd();
			String name = memberVO.getName();
			String email = memberVO.getEmail();
			String tel = memberVO.getTel();
			String dept = memberVO.getDept();
			String gender = memberVO.getGender();
			String birth = memberVO.getBirth();
			String introduction = memberVO.getIntroduction();
			String query = "insert into t_member";
			query += " (id,pwd,name,email,tel,dept,gender,birth,introduction)";
			query += " values(?,?,?,?,?,?,?,?,?)";
			System.out.println("prepareStatememt: " + query);
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			pstmt.setString(3, name);
			pstmt.setString(4, email);
			pstmt.setString(5, tel);
			pstmt.setString(6, dept);
			pstmt.setString(7, gender);
			pstmt.setString(8, birth);
			pstmt.setString(9, introduction);
			
			
			
			pstmt.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	



	public boolean isExisted(MemberVO memberVO) {
		boolean result = false;
		String id = memberVO.getId();
		String pwd = memberVO.getPwd();
		try {
			con = dataFactory.getConnection();
			String query = "select decode(count(*),1,'true','false') as result from t_member";
			query += " where id=? and pwd=?"; // 오라클의 decode()함수를 이용해 조회하여 id와 비밀번호가 테이블에 존재하면 true를, 존재하지않으면 false를 조회합니다.
			System.out.println(query); // 메서드로 전달된 id와 비밀번호를 이용해 sql문을 작성한후 데이터베이스에 조회합니다.
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			ResultSet rs = pstmt.executeQuery();
			rs.next(); //커서를 첫번째 레코드로 위치시킵니다.
			result = Boolean.parseBoolean(rs.getString("result"));
			System.out.println("result=" + result);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
