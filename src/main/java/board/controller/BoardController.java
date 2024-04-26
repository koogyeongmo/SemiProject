package board.controller;

import java.io.IOException;
import java.text.NumberFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.service.BoardService;
import topic.model.service.TopicService;
import topic.model.dto.TopicDto;

/**
 * Servlet implementation class BoardReadController
 */
@WebServlet("/thread/*")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	private TopicService topicService = new TopicService();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BoardController() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pathInfo = request.getPathInfo();
        System.out.println(pathInfo);
        if (pathInfo != null) {
            String[] parts = pathInfo.split("/");
            String topicName = parts[1]; 
            Integer threadId = Integer.parseInt(parts[2]); 


	        try {
	        	
				  TopicDto topicInfo = topicService.selectTopic(topicName); 
				  String topic_id = topicInfo.getTopicId();
				  String topic_description = topicInfo.getTopicDescription();
				  String topic_follower = NumberFormat.getInstance().format(topicInfo.getFollowerCount()); 
				  byte[] banner_image = topicInfo.getTopicBannerImage(); 
				  byte[] profile_image = topicInfo.getTopicProfileImage();
				  
				  request.setAttribute("topic_id" , topic_id);
				  request.setAttribute("topic_description" , topic_description);
				  request.setAttribute("topic_follower" , topic_follower);
				  request.setAttribute("banner_image" , banner_image);
				  request.setAttribute("profile_image" , profile_image);
				 

				request.setAttribute("threadInfo", boardService.selectOne(threadId));
				request.setAttribute("commentInfo", boardService.selectCommentList(threadId));
				request.setAttribute("threadId", threadId);

				request.getRequestDispatcher("/WEB-INF/views/thread.jsp").forward(request, response);
			} catch (NumberFormatException e) {
				System.out.println("NumberFormatException");
				response.sendRedirect(request.getContextPath() + "/topic");
			}
	        
	        
	    } else {
	        response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Invalid URL");
	    }
	}
		
	
	
	
	
	


}
