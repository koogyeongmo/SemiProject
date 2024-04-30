package vote.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import vote.model.service.VoteService;
import member.model.dto.*;
import vote.model.dto.*;



@WebServlet("/vote")
public class VoteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	private VoteService voteService = new VoteService();

       

    public VoteController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	    
	    if (request.getSession().getAttribute("LoggedIn") != null) {	
		    int boardId = Integer.parseInt(request.getParameter("boardId"));
		    MemberInfoDto userInfo = (MemberInfoDto) request.getSession().getAttribute("LoggedIn");
		    String voteType = request.getParameter("voteType");
		    String username = userInfo.getMemId();
		    
		    VoteDto voteDto = new VoteDto(username,boardId, voteType);
		    
		    if ("upvote".equals(voteType)) {
		        boardService.upvote(boardId);
		        voteService.insert(voteDto);
		    } else if ("downvote".equals(voteType)) {
		    	System.out.println("testtt");
		        boardService.downvote(boardId);
		        voteService.insert(voteDto);

		    } else {
		    	System.out.println("Error upvoting/downvoting.");
		    }
	    	
	    }


	}

}
