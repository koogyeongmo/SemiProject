package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardInsertDto;
import board.model.service.BoardService;




@WebServlet("/boardcreate.ajax")
public class BoardCreateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();


    public BoardCreateController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String topicId = request.getParameter("topicId");
		String userId = request.getParameter("userId");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		
		BoardInsertDto newBoard = new BoardInsertDto(topicId, userId, title, content);
		
        int insert = boardService.insert(newBoard);

		
	}
		

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

