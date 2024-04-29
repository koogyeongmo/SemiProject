package image.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import board.model.dto.BoardCommentDto;
import image.model.dto.ImageDto;
import image.model.dto.ImageInsertDto;




public class ImageDao {
	public int uploadImage(SqlSession session, ImageInsertDto dto) {
		return session.insert("imageMapper.uploadImage", dto);
	}
	
	public ImageDto retrieveImage(SqlSession session, int boardId) {
		return session.selectOne("imageMapper.retrieveImage", boardId);
	}

	public List<ImageDto> selectImageList(SqlSession session, int boardId) {
		return session.selectList("imageMapper.selectImageList", boardId);
	}
	
}
