package image.model.dto;

import java.util.Arrays;

public class ImageDto {
	private Integer imageId;
	private byte[] imageBlob;
	private Integer boardId;
	private String imageType;
	
	public ImageDto() {
		super();
	}

	public ImageDto(Integer imageId, byte[] imageBlob, Integer boardId, String imageType) {
		super();
		this.imageId = imageId;
		this.imageBlob = imageBlob;
		this.boardId = boardId;
		this.imageType = imageType;
	}

	public Integer getImageId() {
		return imageId;
	}

	public void setImageId(Integer imageId) {
		this.imageId = imageId;
	}

	public byte[] getImageBlob() {
		return imageBlob;
	}

	public void setImageBlob(byte[] imageBlob) {
		this.imageBlob = imageBlob;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public String getImageType() {
		return imageType;
	}

	public void setImageType(String imageType) {
		this.imageType = imageType;
	}

	@Override
	public String toString() {
		return "ImageDto [imageId=" + imageId + ", imageBlob=" + Arrays.toString(imageBlob) + ", boardId=" + boardId
				+ ", imageType=" + imageType + "]";
	}


}
