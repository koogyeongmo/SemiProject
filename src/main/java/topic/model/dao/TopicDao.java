package topic.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardDto;
import topic.model.dto.*;



public class TopicDao {
	public int checkTopic(SqlSession session, String topicId) {
		return session.selectOne("topicMapper.checkTopic", topicId);
	}
	
	public TopicDto selectTopic(SqlSession session, String topicId) {
		return session.selectOne("topicMapper.selectTopic", topicId);
	}
	
	public int joinTopic (SqlSession session, TopicFollowDto dto) {
		return session.insert("topicMapper.joinTopic", dto);
	}
	
	public int deleteTopicFollow (SqlSession session, TopicFollowDto dto) {
		return session.delete("topicMapper.deleteTopicFollow", dto);
	}
	
	
	public int checkTopicFollow (SqlSession session, TopicFollowDto dto) {
		return session.selectOne("topicMapper.checkTopicFollow", dto);
	}
	
	public int insertMultipleTopicFollow (SqlSession session, List<TopicFollowDto> dto) {
		return session.selectOne("topicMapper.insertMultipleTopicFollow", dto);
	}
	public List<TopicDto> selectAllTopics(SqlSession session) {
		return session.selectList("topicMapper.selectAllTopics");
	}
	public List<TopicDto> selectAllTopicsByUserId(SqlSession session, String userId) {
		return session.selectList("topicMapper.selectAllTopicsByUserId", userId);
	}
	
}
