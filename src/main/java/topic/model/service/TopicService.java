package topic.model.service;

import static common.MybatisTemplate.*;

import org.apache.ibatis.session.SqlSession;

import topic.model.dto.TopicDto;
import topic.model.dao.TopicDao;

public class TopicService {
	private TopicDao dao = new TopicDao(); 
	
	
	public int checkTopic(String topicId) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.checkTopic(session, topicId);
		session.close();
		return result;
	}
	public TopicDto selectTopic(String topicId) {
		TopicDto result = null;
		SqlSession session = getSqlSession();
		result = dao.selectTopic(session, topicId);
		session.close();
		return result;
	}


}
