package project;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/member")
public class MemberServlet extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request,HttpServletResponse response)  throws ServletException, IOException {
      request.setCharacterEncoding("utf-8");
      response.setContentType("text/html;charset=utf-8");
      MemberDAO dao=new MemberDAO();
      PrintWriter out=response.getWriter();
		 String _id=request.getParameter("id");
		 String _pwd=request.getParameter("pwd");
		 String _name=request.getParameter("name");
		 String _email=request.getParameter("email");
		 String _tel=request.getParameter("tel");
		 String _dept=request.getParameter("dept");
		 String _gender=request.getParameter("gender");
		 String _birth=request.getParameter("birth");
		 String _introduction=request.getParameter("introduction");
		 
		 MemberVO vo=new MemberVO();
		 vo.setId(_id);
		 vo.setPwd(_pwd);
		 vo.setName(_name);
		 vo.setEmail(_email);
		 vo.setTel(_tel);
		 vo.setDept(_dept);
		 vo.setGender(_gender);
		 vo.setBirth(_birth);
		 vo.setIntroduction(_introduction);
		 
		 
	     dao.addMember(vo);

       List list=dao.listMembers();
       
       RequestDispatcher rd = request.getRequestDispatcher("/output.html");
       rd.forward(request, response);
   }
}
