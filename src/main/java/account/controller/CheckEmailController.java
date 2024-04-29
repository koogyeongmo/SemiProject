package account.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import member.model.dto.MemberDto;
import member.model.service.MemberService;

/**
 * Servlet implementation class CheckIdController
 */
@WebServlet("/checkemail.ajax")
public class CheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CheckEmailController() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("###checkemail  doPost 진입");
		String k1 = request.getParameter("k1");
		String k2 = request.getParameter("k2");
		System.out.println(k1+","+k2);
	
		String memEmail = request.getParameter("cemail");
		System.out.println(memEmail);
		int result = new MemberService().selectCheckEmail(memEmail);
		response.getWriter().append(String.valueOf(result));	
		


	}

}




