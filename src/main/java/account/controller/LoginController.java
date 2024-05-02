package account.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;
import member.model.service.MemberService;
import topic.model.dto.TopicDto;
import topic.model.service.TopicService;
import vote.model.dto.VoteDto;
import vote.model.service.VoteService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService service = new MemberService();
	private TopicService topicService = new TopicService();
	private VoteService voteService = new VoteService();

       

    public LoginController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String prePage = request.getParameter("prePage");
		request.getSession().setAttribute("prePage", prePage);
		request.getRequestDispatcher("/WEB-INF/views/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		MemberLoginDto dto = new MemberLoginDto(id, pwd);
		System.out.println("/login doPost dto: "+ dto);
		int result = 0;
		MemberInfoDto resultInfo = service.loginGetInfo(dto);
		
		if(resultInfo != null) {
			
			List<Integer> upvotedBoards = voteService.allVotesByUser(resultInfo.getMemId(), "upvote");
			List<Integer> downvotedBoards = voteService.allVotesByUser(resultInfo.getMemId(), "downvote");
			
			request.getSession().setAttribute("upvotedBoards", upvotedBoards);
			request.getSession().setAttribute("downvotedBoards", downvotedBoards);

			
			List<TopicDto> followingTopics = topicService.selectAllTopicsByUserId(resultInfo.getMemId());
			
			List<TopicDto> allTopics = topicService.selectAllTopics();
			

			
			request.getSession().setAttribute("topicList", allTopics);
			

			request.getSession().setAttribute("followingTopics", followingTopics);
			request.getSession().setAttribute("LoggedIn", resultInfo);
			request.getSession().setAttribute("userId", resultInfo.getMemId());
			result = 1;
		}
		response.getWriter().append(String.valueOf(result));
	}

}






