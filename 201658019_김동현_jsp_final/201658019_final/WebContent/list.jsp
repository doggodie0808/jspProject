<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <style>    
        #visual .content-container{	
            height:inherit;
            display:flex; 
            align-items: center;
        }
    </style>
</head>

<body>
    <!-- --------------------------- <body> --------------------------------------- -->
	<div id="body">
		<div class="content-container clearfix">
		<main class="main">
			<h2 class="main title">DBP 학생 목록</h2>
			
			<div class="notice margin-top">				
				<table>
					<thead>
						<tr>
						
							<th>ID</th>
							<th>&nbsp;이름</th>
						</tr>
					</thead>
					<%	 
				response.setContentType("text/html;charset=UTF-8");
				request.setCharacterEncoding("UTF-8");
				
				Connection conn = null;
				PreparedStatement pstmt= null;
				ResultSet rs = null;
				
				String driver = "oracle.jdbc.OracleDriver";
				String url = "jdbc:oracle:thin:@localhost:1521:XE";
				String user = "scott";
				String password = "tiger";
				StringBuffer sql = new StringBuffer();
				
				sql.append("select * from t_member ");
				
				try {
					Class.forName(driver);
		
					conn = DriverManager.getConnection(url, user, password);
					pstmt = conn.prepareStatement(sql.toString());
					rs = pstmt.executeQuery();
					
					while(rs.next()){
						String _id = rs.getString("id");
						String _name = rs.getString("name");
						
				%>
						<tr>
							<td><%=_id %></td>
							<td><%=_name %></td>
							
						</tr>
				<%
					}
				} catch (ClassNotFoundException e) {
					e.printStackTrace();
				} catch (SQLException e) {
					e.printStackTrace();
				} finally{
					try {
						if(rs != null) rs.close();
						if(pstmt != null) pstmt.close();
						if(conn != null) conn.close();
					} catch (SQLException e) {
						e.printStackTrace();
					}
				}
			%>
				</table>
			</div>
			
			<div class="search-form margin-top first align-right">
			<br>	
				<form action="yourname" method=get>
					<fieldset>
						<legend class="hidden">학생 분류</legend>
						<label class="hidden">학과</label>
						<select name="f">
							<option  value="default">전체</option>
							<option  value="computer">컴퓨터공학부</option>
							<option  value="information">정보통신학부</option>
							<option  value="itcontents">IT콘텐츠학과</option>
							<option  value="korean">국어국문학과</option>							
						</select> 
						<input type="submit" value="검색" />
					</fieldset>
				</form>
			</div>
		</main>
		
			
		</div>
	</div>

    </body>
    
    </html>