package board.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardDto;
import board.model.dto.BoardInsertDto;



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
	
	public int updateReadCount(SqlSession session, Integer boardId) {
		return session.update("boardMapper.updateReadCount", boardId);
	}

	
	public Integer selectTotalCount(SqlSession session) {
		return session.selectOne("boardMapper.selectTotalCount");
	}
	
	public Integer getSequenceNum(SqlSession session) {
		return session.selectOne("boardMapper.getSequenceNum");
	}

	




	
}
