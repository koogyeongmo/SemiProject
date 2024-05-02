package vote.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import vote.model.dto.*;




public class VoteDao {

	public int insert(SqlSession session, VoteDto dto) {
		return session.insert("voteMapper.insert", dto);
	}
	
	
	public int delete(SqlSession session, VoteTransferDto dto) {
		return session.delete("voteMapper.delete", dto);
	}
	
	public String check(SqlSession session, VoteTransferDto dto) {
		return session.selectOne("voteMapper.check", dto);
	}
	
	public List<Integer> allVotesByUser(SqlSession session, String userId, String voteType) {
		Map<String, String> param = new HashMap<String, String>();
		param.put("userId", userId);
		param.put("voteType", voteType);
		return session.selectList("voteMapper.allVotesByUser", param);
	}
	
	

}