package image.model.service;

import static common.MybatisTemplate.*;

import org.apache.ibatis.session.SqlSession;

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
	
	public ImageDto retrieveImage(Integer boardId) {
		SqlSession session = getSqlSession();
		ImageDto result = dao.retrieveImage(session, boardId);
		session.close();
		return result;
	}

}
