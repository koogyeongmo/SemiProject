package vote.model.dao;

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
	

}