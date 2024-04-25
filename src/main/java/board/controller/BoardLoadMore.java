package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardDto;
import board.model.dto.BoardListDto;
import board.model.service.BoardService;

import topic.model.dto.TopicDto;
import topic.model.dto.TopicDto;
import topic.model.service.TopicService;

/**
 * Servlet implementation class BoardLoadMore
 */
@WebServlet("/boardloadmore")
public class BoardLoadMore extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLoadMore() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String loadMoreCounterStr = request.getParameter("loadMoreCounter");

	    int loadMoreCounter = Integer.parseInt(loadMoreCounterStr) + 1;

		
	}

}
