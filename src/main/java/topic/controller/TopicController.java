package topic.controller;

import java.io.IOException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardDto;
import board.model.service.BoardService;
import image.model.dto.ImageDto;
import image.model.service.ImageService;
import member.model.dto.MemberInfoDto;
import topic.model.dto.TopicDto;
import topic.model.dto.TopicFollowDto;
import topic.model.service.TopicService;
import vote.model.dto.VoteTransferDto;


@WebServlet("/topic/*")
public class TopicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardService();
	private TopicService topicService = new TopicService();
	private ImageService imageService = new ImageService();

       

    public TopicController() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
        String pathInfo = request.getPathInfo();
        
        if (pathInfo != null) {
            String[] parts = pathInfo.split("/");
            String topicId = parts[1]; 
            
            int checkTopicExists = topicService.checkTopic(topicId);
         
            
            if (parts.length == 2 && checkTopicExists > 0) {
        		String pageNum = request.getParameter("page");

        		int pageSize = 5;
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
                String banner_image = topicInfo.getTopicBannerImage();
                String profile_image = topicInfo.getTopicProfileImage();
                
        		request.setAttribute("topic_id" , topic_id);
        		request.setAttribute("topic_description" , topic_description);
        		request.setAttribute("topic_follower" , topic_follower);
        		request.setAttribute("banner_image" , banner_image);
        		request.setAttribute("profile_image" , profile_image);
        		request.setAttribute("current_page", currentPageNum);
                
        		
        		request.setAttribute("board_new" , boardService.selectBoardListNew(topic_id));
        		request.setAttribute("board_top" , boardService.selectBoardListTop(topic_id));
        		
        		List<ImageDto> imageList = imageService.allImages();

        		if (imageList != null) {
        		    Map<Integer, String> boardIdToUrlMap = new HashMap<>();
        		    for (ImageDto imageDto : imageList) {
        		        Integer boardId = imageDto.getBoardId(); 
        		        String imageType = imageDto.getImageType();
        		        byte[] imageData = imageDto.getImageBlob();
        		        String base64ImageData = Base64.getEncoder().encodeToString(imageData);
        		        String dataUrl = "data:" + imageType + ";base64," + base64ImageData;

   
        		        if (!boardIdToUrlMap.containsKey(boardId)) {
        		            boardIdToUrlMap.put(boardId, dataUrl);
        		        }
        		    }

        		    request.setAttribute("board_new_cover", boardIdToUrlMap);
        		}
        		
        		
        		
     
			  if (request.getSession().getAttribute("LoggedIn") != null) {
				  MemberInfoDto userInfo = (MemberInfoDto) request.getSession().getAttribute("LoggedIn");
				  String username = userInfo.getMemId();
				  
				  TopicFollowDto topicDto = new TopicFollowDto(topic_id, username);
				  int followStatus = topicService.checkTopicFollow(topicDto);
				  if (followStatus != 0) {
					  request.setAttribute("followStatus", "following");
				  }




			  }		

                
        		request.getRequestDispatcher("/WEB-INF/views/topic.jsp").forward(request, response);
                return;
            }
        }
	    response.sendError(HttpServletResponse.SC_NOT_FOUND);
	}

}
