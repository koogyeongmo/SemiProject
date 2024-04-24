package image.model.dto;

import java.util.Arrays;

public class ImageDto {
	private String imageId;
	private byte[] imageBlob;

	public ImageDto(String imageId, byte[] imageBlob) {
		super();
		this.imageId = imageId;
		this.imageBlob = imageBlob;
	}

	public String getImageId() {
		return imageId;
	}

	public void setImageId(String imageId) {
		this.imageId = imageId;
	}

	public byte[] getImageBlob() {
		return imageBlob;
	}

	public void setImageBlob(byte[] imageBlob) {
		this.imageBlob = imageBlob;
	}

	@Override
	public String toString() {
		return "ImageDto [imageId=" + imageId + ", imageBlob=" + Arrays.toString(imageBlob) + "]";
	}

}
