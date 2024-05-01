package board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import topic.model.dto.TopicDto;
import topic.model.service.TopicService;



@WebServlet("/boardloadmore")
public class BoardLoadMoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int currentPageNum = Integer.parseInt(request.getParameter("currentPage"));
        currentPageNum++; 
        int pageSize = 5;
        
		request.setAttribute("current_page", currentPageNum);
		request.setAttribute("map" , boardService.selectBoardListNew(pageSize, currentPageNum));
        
		request.getRequestDispatcher("/WEB-INF/views/topic.jsp").forward(request, response);
	}
        



 
}