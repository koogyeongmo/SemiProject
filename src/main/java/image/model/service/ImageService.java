package image.model.service;

import static common.MybatisTemplate.*;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardCommentDto;
import board.model.dto.BoardDto;
import image.model.dto.ImageDto;
import image.model.dto.ImageInsertDto;

import image.model.dao.ImageDao;

public class ImageService {
	private ImageDao dao = new ImageDao(); 
	
	public int uploadImage(ImageInsertDto dto) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.uploadImage(session, dto);
		session.close();
		return result;
	}
	
	public List<ImageDto> retrieveAllImages(Integer boardId) {
		SqlSession session = getSqlSession();		
		List<ImageDto> result = dao.retrieveAllImages(session, boardId);
		session.close();
		
		return result;
	}
	
	public List<ImageDto> allImages() {
		SqlSession session = getSqlSession();		
		List<ImageDto> result = dao.allImages(session);
		session.close();
		
		return result;
	}
	
	
	public ImageDto retrieveImage(Integer boardId) {
		SqlSession session = getSqlSession();
		ImageDto result = dao.retrieveImage(session, boardId);
		session.close();
		return result;
	}
	
	public List<ImageDto> selectImageList(int boardId) {
		SqlSession session = getSqlSession();		
		
		List<ImageDto> result = dao.selectImageList(session, boardId);
		session.close();
		
		return result;
	}
	
	public int checkImage(int boardId) {
		int result = 0;
		SqlSession session = getSqlSession();
		result = dao.checkImage(session, boardId);
		session.close();
		return result;
	}
	
	
	 public List<ImageDto> selectTopicCoverImageList(String topicId) { SqlSession
		 session = getSqlSession();
		 
		 List<ImageDto> result = dao.selectTopicCoverImageList(session, topicId);
		 session.close();
	 
	 return result; }
	 

}
