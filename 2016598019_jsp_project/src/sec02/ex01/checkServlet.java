package sec02.ex01;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

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
@WebServlet("/check")
public class checkServlet extends HttpServlet {
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
		String user_name = request.getParameter("user_name");
		
		System.out.println(user_id);
		System.out.println(user_pwd);
		
		MemberBean memberBean = new MemberBean(); // MemberVO ��ü�� �����ϰ� �Ӽ��� id�� ��й�ȣ�� �����մϴ�.
		memberBean.setId(user_id);
		memberBean.setPwd(user_pwd);
		MemberDAO dao = new MemberDAO();
		boolean result = dao.isExisted(memberBean); // memberdao�� isExisted() �޼��带 ȣ���ϸ鼭 memberVO�� �����մϴ�.
		

		if (result) {
			
			request.setAttribute("check.id", user_id); // ��ȸ�� ����� true�̸� id�� ��й�ȣ�� ������ �����մϴ�.
			request.setAttribute("check.name", user_name);

			RequestDispatcher rd = request.getRequestDispatcher("/modification.jsp");
		    rd.forward(request, response);

		} else {
			request.setAttribute("situation", "2");
			RequestDispatcher rd = request.getRequestDispatcher("/output.jsp");
			rd.forward(request, response);
		}
	}

}
