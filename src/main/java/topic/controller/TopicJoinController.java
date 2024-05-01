package topic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import topic.model.dto.*;
import topic.model.service.TopicService;
import member.model.dto.*;



@WebServlet("/jointopic")
public class TopicJoinController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TopicService topicService = new TopicService();

       

    public TopicJoinController() {
        super();
    }


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	    
	    if (request.getSession().getAttribute("LoggedIn") != null) {	
		    MemberInfoDto userInfo = (MemberInfoDto) request.getSession().getAttribute("LoggedIn");
		    
		    String topicId = request.getParameter("topicId");
		    String joinType = request.getParameter("joinType");
		    String userId = userInfo.getMemId();
		    
		    TopicFollowDto topicFollowDto = new TopicFollowDto(topicId, userId);
		    
		    if ("join".equals(joinType)) {
		        topicService.joinTopic(topicFollowDto);
				List<TopicDto> followingTopics = topicService.selectAllTopicsByUserId(userId);
				request.getSession().setAttribute("followingTopics", followingTopics);
		    } else if ("leave".equals(joinType)) {
		        topicService.deleteTopicFollow(topicFollowDto);
				List<TopicDto> followingTopics = topicService.selectAllTopicsByUserId(userId);
				request.getSession().setAttribute("followingTopics", followingTopics);

		    } else {
		    	System.out.println("Servlet error joining");
		    }
	    	
	    }


	}

}
