package topic.model.service;

import static common.MybatisTemplate.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardDto;
import topic.model.dto.*;
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
	
	public int joinTopic(TopicFollowDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.joinTopic(session, dto);
		session.close();
		return result;
	}

	public int deleteTopicFollow(TopicFollowDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.deleteTopicFollow(session, dto);
		session.close();
		return result;
	}
	
	public int checkTopicFollow(TopicFollowDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.checkTopicFollow(session, dto);
		session.close();
		return result;
	}
	
	public int insertMultipleTopicFollow(List<TopicFollowDto> dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.insertMultipleTopicFollow(session, dto);
		session.close();
		return result;
	}
	
	public List<TopicDto> selectAllTopics() {

		
		SqlSession session = getSqlSession();		
		
		List<TopicDto> result = dao.selectAllTopics(session);
		session.close();
		
		return result;
	}
	
	public List<TopicDto> selectAllTopicsByUserId(String userId) {

		
		SqlSession session = getSqlSession();		
		List<TopicDto> result = dao.selectAllTopicsByUserId(session, userId);
		session.close();
		
		return result;
	}


}
