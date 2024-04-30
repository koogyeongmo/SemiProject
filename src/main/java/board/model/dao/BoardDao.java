package board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardDto;
import board.model.dto.BoardInsertDto;
import board.model.dto.BoardInsertCommentDto;
import board.model.dto.BoardCommentDto;




public class BoardDao {
	
	public List<BoardDto> selectBoardList(SqlSession session, int start, int end) {
		Map<String, Integer> param = new HashMap<String, Integer>();
		param.put("startRownum", start);
		param.put("endRownum", end);
		return session.selectList("boardMapper.selectBoardList", param);
	}
	
	public BoardDto selectOne(SqlSession session, Integer boardId) {
		return session.selectOne("boardMapper.selectOne", boardId);
	}
	
	public int insert(SqlSession session, BoardInsertDto dto) {
		return session.insert("boardMapper.insert", dto);
	}
	
	public int update(SqlSession session, BoardDto dto) {
		int result = 0;
		//TODO
		return result;
	}
	
	public int delete(SqlSession session, Integer boardId) {
		return session.delete("boardMapper.delete", boardId);
	}
	
	public int updateViewCount(SqlSession session, Integer boardId) {
		return session.update("boardMapper.updateViewCount", boardId);
	}

	public int updateCommentCount(SqlSession session, Integer boardId) {
		return session.update("boardMapper.updateCommentCount", boardId);
	}
	
	public Integer selectTotalCount(SqlSession session) {
		return session.selectOne("boardMapper.selectTotalCount");
	}
	
	public Integer getSequenceNum(SqlSession session) {
		return session.selectOne("boardMapper.getSequenceNum");
	}

	
	public Integer insertComment(SqlSession session, BoardInsertCommentDto dto) {
		return session.insert("boardMapper.insertComment", dto);
	}
	

	public List<BoardCommentDto> selectCommentList(SqlSession session, Integer boardId) {
		return session.selectList("boardMapper.selectCommentList", boardId);
	}

	public int upvote(SqlSession session, Integer boardId) {
		return session.update("boardMapper.upvote", boardId);
	}
	
	public int downvote(SqlSession session, Integer boardId) {
		return session.update("boardMapper.downvote", boardId);
	}
}
