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
		String user_id = request.getParameter("user_id"); // 로그인창에서 전송된 id와 비밀번호를 가져옵니다.
		String user_pwd = request.getParameter("user_pwd");
		String user_name = request.getParameter("user_name");
		
		System.out.println(user_id);
		System.out.println(user_pwd);
		
		MemberBean memberBean = new MemberBean(); // MemberVO 객체를 생성하고 속성에 id와 비밀번호를 설정합니다.
		memberBean.setId(user_id);
		memberBean.setPwd(user_pwd);
		MemberDAO dao = new MemberDAO();
		boolean result = dao.isExisted(memberBean); // memberdao의 isExisted() 메서드를 호출하면서 memberVO를 전달합니다.
		

		if (result) {
			
			request.setAttribute("check.id", user_id); // 조회한 결과가 true이면 id와 비밀번호를 세선에 저장합니다.
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
