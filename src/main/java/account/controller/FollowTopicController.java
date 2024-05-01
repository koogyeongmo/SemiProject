package account.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import topic.model.service.TopicService;
import topic.model.dto.TopicDto;
import topic.model.dto.TopicFollowDto;


/**
 * Servlet implementation class ChooseTopicController
 */
@WebServlet("/signup/follow")
public class FollowTopicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private TopicService topicService = new TopicService();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FollowTopicController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<TopicDto> dto = topicService.selectAllTopics();
		
		request.getSession().setAttribute("topicList", dto);
		request.getRequestDispatcher("/WEB-INF/views/followtopic.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if (request.getSession().getAttribute("userId") != null) {
	
		    String topicArrayString = request.getParameter("topicList");
		    String[] topicArray = topicArrayString.split(",");
	
		    String userId = (String) request.getSession().getAttribute("userId");
		    	
		    
		    for (String topic: topicArray) {
		    	TopicFollowDto dto = new TopicFollowDto(topic, userId);
		    	int result = topicService.joinTopic(dto);
		    }
		    
		    List<TopicDto> followingTopics = topicService.selectAllTopicsByUserId(userId);
			
			request.getSession().setAttribute("followingTopics", followingTopics);
			request.getRequestDispatcher("/WEB-INF/views/topic.jsp").forward(request, response);

			
		}

	    

	}

}
