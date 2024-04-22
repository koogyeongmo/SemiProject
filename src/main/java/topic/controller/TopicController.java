package topic.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.model.dto.BoardDto;
import board.model.dto.BoardListDto;
import board.model.service.BoardService;

/**
 * Servlet implementation class BoardListController
 */
@WebServlet("/topic")
public class TopicController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TopicController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int pageSize = 3;
		int pageBlockSize = 5;
		int currentPageNum = 1;  
		String pageNum = request.getParameter("page");
		if(pageNum!= null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			}catch(NumberFormatException e) {
				System.out.println("!!!!!!!!!!!!!! NumberFormatException !!!!!!");
				//e.printStackTrace();
			}
		}
		request.setAttribute("map" , service.selectPageListDetail(pageSize, pageBlockSize, currentPageNum));
//		request.setAttribute("dtolist", service.selectAllList());
		request.getRequestDispatcher("/WEB-INF/views/topic.jsp").forward(request, response);
	}
	

}
