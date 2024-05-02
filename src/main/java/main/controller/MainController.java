package main.controller;

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

import board.model.service.BoardService;
import image.model.dto.ImageDto;
import image.model.service.ImageService;
import member.model.dto.MemberInfoDto;
import topic.model.dto.TopicDto;
import topic.model.dto.TopicFollowDto;

/**
 * Servlet implementation class MainController
 */
@WebServlet("/main")
public class MainController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ImageService imageService = new ImageService();
	private BoardService boardService = new BoardService();

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MainController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
        
        		int pageSize = 10;
        		int currentPageNum = 1; 
        		
 

        		
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
        		    request.setAttribute("board_cover", boardIdToUrlMap);
        		}
        		
				List<TopicDto> followingTopics = null;
				List<String> topicStringList = new ArrayList<>();
				
				Object attribute = request.getSession().getAttribute("followingTopics");
				if (attribute != null && attribute instanceof List<?>) {
				    followingTopics = (List<TopicDto>) attribute;
				    
				    for (TopicDto dto: followingTopics) {
				    	topicStringList.add(dto.getTopicId());
				    }
				    
				}

        		request.setAttribute("boardMainList", boardService.selectBoardListAll(topicStringList));
                
        		request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request, response);
            
        
	}
}

	




