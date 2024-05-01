package account.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.MemberDto;
import member.model.dto.MemberInfoDto;
import member.model.service.MemberService;

/**
 * Servlet implementation class JoinController
 */
@WebServlet("/join")
public class JoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinController() {
        super();
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String memId = request.getParameter("username");
		String memPwd = request.getParameter("pwd");
		String memEmail = request.getParameter("email");
		MemberDto dto1 = new MemberDto(memId, memPwd, memEmail);
		MemberInfoDto dto2 = new MemberInfoDto(memId, memPwd);
		int result = new MemberService().insert(dto1);
		if (result > 0) {
			request.getSession().setAttribute("LoggedIn", dto2);
			request.getSession().setAttribute("userId", dto2.getMemId());

		}
		
		response.getWriter().append(String.valueOf(result));

	}
}
	