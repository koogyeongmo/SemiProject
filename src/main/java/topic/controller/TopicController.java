package topic.controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.List;

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


@WebServlet("/topic/*")
public class TopicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	private TopicService topicService = new TopicService();

       

    public TopicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null) {
            String[] parts = pathInfo.split("/");
            String topicId = parts[1]; 
            
            //add checker if topic is in database
            int checkTopicExists = topicService.checkTopic(topicId);
         
            
            if (parts.length == 2 && checkTopicExists > 0) {
        		String pageNum = request.getParameter("page");

        		int pageSize = 3;
        		int currentPageNum = 1;  
                
        		if(pageNum!= null && !pageNum.equals("")) {
        			try {
        				currentPageNum = Integer.parseInt(pageNum);
        			}catch(NumberFormatException e) {
        				System.out.println(" NumberFormatException");
        			}
        		}
                TopicDto topicInfo = topicService.selectTopic(topicId);
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
                
        		
        		request.setAttribute("map" , boardService.selectBoardListDetail(pageSize, currentPageNum));
                
        		request.getRequestDispatcher("/WEB-INF/views/topic.jsp").forward(request, response);
                return;
            }
        }
	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
	}
	
	

}
