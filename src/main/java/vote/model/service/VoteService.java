package vote.model.service;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;


import static common.MybatisTemplate.*;

import vote.model.dao.VoteDao;
import vote.model.dto.*;



public class VoteService {
	private VoteDao dao = new VoteDao(); 	
	
	
	public int insert(VoteDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.insert(session, dto);
		session.close();
		return result;
	}

	public int delete(VoteTransferDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.delete(session, dto);
		session.close();
		return result;
	}
	
	public String check(VoteTransferDto dto) {
		String result = null;
		SqlSession session = getSqlSession();
		result = dao.check(session, dto);
		session.close();
		return result;
	}
	
	public List<Integer> allVotesByUser(String userId, String voteType) {
		List<Integer> result = null;
		SqlSession session = getSqlSession();
		result = dao.allVotesByUser(session, userId, voteType);
		session.close();
		return result;
	}

}
