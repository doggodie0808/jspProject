package project;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/login2")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		doHandle(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		doHandle(request, response);
	}

	private void doHandle(HttpServletRequest request, HttpServletResponse response)	throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		String user_id = request.getParameter("user_id"); // �α���â���� ���۵� id�� ��й�ȣ�� �����ɴϴ�.
		String user_pwd = request.getParameter("user_pwd");

		MemberVO memberVO = new MemberVO(); // MemberVO ��ü�� �����ϰ� �Ӽ��� id�� ��й�ȣ�� �����մϴ�.
		memberVO.setId(user_id);
		memberVO.setPwd(user_pwd);
		MemberDAO dao = new MemberDAO();
		boolean result = dao.isExisted(memberVO); // memberdao�� isExisted() �޼��带 ȣ���ϸ鼭 memberVO�� �����մϴ�.
		

		if (result) {
			HttpSession session = request.getSession();
			session.setAttribute("isLogon", true); // ��ȸ�� ����� true�̸� isLongOn�Ӽ��� true�� ���ǿ� �����մϴ�.
			session.setAttribute("login.id", user_id); // ��ȸ�� ����� true�̸� id�� ��й�ȣ�� ������ �����մϴ�.
			session.setAttribute("login.pwd", user_pwd);

			RequestDispatcher rd = request.getRequestDispatcher("/list.jsp");
		    rd.forward(request, response);
		} else {
			response.sendRedirect("/201658019_final/login.html");
		}
	}

}
