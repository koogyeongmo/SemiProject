package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;

/**
 * Servlet implementation class BoardReadController
 */
@WebServlet("/thread")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String boardIdStr = request.getParameter("id");
		try {
			int boardId = Integer.parseInt(boardIdStr);
			request.setAttribute("threadInfo", service.selectOne(boardId));
			request.setAttribute("commentInfo", service.selectCommentList(boardId));
			request.setAttribute("threadId", boardIdStr);

			request.getRequestDispatcher("/WEB-INF/views/thread.jsp").forward(request, response);
		}catch(NumberFormatException e) {
			System.out.println("NumberFormatException");
			response.sendRedirect(request.getContextPath()+"/topic");
		}
	}

}
