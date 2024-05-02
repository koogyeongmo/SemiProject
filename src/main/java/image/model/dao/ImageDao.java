package image.model.dao;

import static common.MybatisTemplate.getSqlSession;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardCommentDto;
import image.model.dto.ImageDto;
import image.model.dto.ImageInsertDto;




public class ImageDao {
	public int uploadImage(SqlSession session, ImageInsertDto dto) {
		return session.insert("imageMapper.uploadImage", dto);
	}
	
	public List<ImageDto> retrieveAllImages(SqlSession session, int boardId) {
		return session.selectList("imageMapper.retrieveAllImages", boardId);
	}

	public List<ImageDto> allImages(SqlSession session) {
		return session.selectList("imageMapper.allImages");
	}
	
	public ImageDto retrieveImage(SqlSession session, int boardId) {
		return session.selectOne("imageMapper.retrieveImage", boardId);
	}

	public List<ImageDto> selectImageList(SqlSession session, int boardId) {
		return session.selectList("imageMapper.selectImageList", boardId);
	}
	
	public int checkImage(SqlSession session, int boardId) {
		return session.selectOne("imageMapper.checkimage", boardId);
	}
	
	
	public List<ImageDto> selectTopicCoverImageList(SqlSession session, String topicId) { 
		return session.selectList("imageMapper.selectTopicCoverImageList", topicId); 
	 }
	 

}
