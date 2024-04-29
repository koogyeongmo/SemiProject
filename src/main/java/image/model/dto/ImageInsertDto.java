package image.model.dto;

import java.util.Arrays;

public class ImageInsertDto {
	private Integer boardId;
	private byte[] imageBlob;
	private String imageType;
	
	public ImageInsertDto() {
		super();
	}

	public ImageInsertDto(Integer boardId, byte[] imageBlob, String imageType) {
		super();
		this.boardId = boardId;
		this.imageBlob = imageBlob;
		this.imageType = imageType;

	}
	public Integer getBoardId() {
		return boardId;
	}
	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	public byte[] getImageBlob() {
		return imageBlob;
	}
	public void setImageBlob(byte[] imageBlob) {
		this.imageBlob = imageBlob;
	}
	

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	@Override
	public String toString() {
		return "ImageInsertDto [boardId=" + boardId + ", imageBlob=" + Arrays.toString(imageBlob) + "imageType=" + imageType + "]";
	}
	
	

}

