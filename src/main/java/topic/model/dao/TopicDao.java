package topic.model.dao;

import org.apache.ibatis.session.SqlSession;

import topic.model.dto.TopicDto;



public class TopicDao {
	public int checkTopic(SqlSession session, String topicId) {
		return session.selectOne("topicMapper.checkTopic", topicId);
	}
	
	public TopicDto selectTopic(SqlSession session, String topicId) {
		return session.selectOne("topicMapper.selectTopic", topicId);
	}
}
