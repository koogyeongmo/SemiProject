package image.model.dao;

import org.apache.ibatis.session.SqlSession;

import image.model.dto.ImageDto;



public class ImageDao {
	public int uploadImage(SqlSession session, ImageDto dto) {
		return session.insert("imageMapper.uploadImage", dto);
	}
	
	public ImageDto retrieveImage(SqlSession session, String imageId) {
		return session.selectOne("imageMapper.retrieveImage", imageId);
	}

	
}
