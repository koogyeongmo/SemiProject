package board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardInsertCommentDto;
import board.model.service.BoardService;




@WebServlet("/createcomment.ajax")
public class BoardCreateCommentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();


    public BoardCreateCommentController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Integer boardId = Integer.parseInt(request.getParameter("boardId"));
		String userId = request.getParameter("userId");
		String content = request.getParameter("content");
		
		
		BoardInsertCommentDto newBoard = new BoardInsertCommentDto(boardId, userId, content);
		
        int insert = boardService.insertComment(newBoard);

		
	}
		

}
	
	
	
	
	
	
	
	
	