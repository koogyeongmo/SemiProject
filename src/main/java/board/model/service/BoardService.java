package board.model.service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;

import static common.MybatisTemplate.*;
import board.model.dao.BoardDao;
import board.model.dto.BoardDto;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardInsertCommentDto;
import board.model.dto.BoardCommentDto;



public class BoardService {
	private BoardDao dao = new BoardDao(); 	
	
	public List<BoardDto> selectBoardListAll(List<String> topicIdList) {

		SqlSession session = getSqlSession();		
		
		List<BoardDto> result = dao.selectBoardListAll(session, topicIdList);
		session.close();
		
		return result;
	}
	
	public List<BoardDto> selectBoardListNew(String topicId) {

		SqlSession session = getSqlSession();		
		
		List<BoardDto> result = dao.selectBoardListNew(session, topicId);
		session.close();
		
		return result;
	}
	
	public List<BoardDto> selectBoardListTop(String topicId) {

		SqlSession session = getSqlSession();		
		
		List<BoardDto> result = dao.selectBoardListTop(session, topicId);
		session.close();
		
		return result;
	}

	
	
	public BoardDto selectOne(Integer boardId) {
		BoardDto result = null;
		SqlSession session = getSqlSession();
		result = dao.selectOne(session, boardId);
		if(result != null) {
			dao.updateViewCount(session, boardId);

		}

		session.close();
		return result;
	}
	
	
	public int insert(BoardInsertDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.insert(session, dto);
		session.close();
		return result;
	}
	// update
	public int update(BoardDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.update(session, dto);
		session.close();
		return result;
	}
	// delete
	public int delete(Integer boardId) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.delete(session, boardId);
		session.close();
		return result;
	}
	
	public List<BoardCommentDto> selectCommentList(Integer boardId) {
		SqlSession session = getSqlSession();		
		
		List<BoardCommentDto> result = dao.selectCommentList(session, boardId);
		session.close();
		
		return result;
	}
	
	
	
	public int insertComment(BoardInsertCommentDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.insertComment(session, dto);
		dao.updateCommentCount(session, dto.getBoardId());
		session.close();
		return result;
	}
	
	public int getSequenceNum() {
		SqlSession session = getSqlSession();
		int result = dao.getSequenceNum(session);
		session.close();
		
		return result;
	}
	
	public int upvote(int boardId) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.upvote(session, boardId);
		session.close();
		return result;
	}
	
	public int downvote(int boardId) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.downvote(session, boardId);
		session.close();
		return result;
	}
	
}
