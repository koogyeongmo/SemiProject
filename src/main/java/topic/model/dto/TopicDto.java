package topic.model.dto;

import java.util.Arrays;

public class TopicDto {
	private String topicId;
	private String topicDescription;
	private int followerCount;
	private byte[] topicProfileImage;
	private byte[] topicBannerImage;
	
	@Override
	public String toString() {
		return "TopicDto [topicId=" + topicId + ", description=" + topicDescription + ", followerCount=" + followerCount
				+ ", topicProfileImage=" + Arrays.toString(topicProfileImage) + "]";
	}

	public String getTopicId() {
		return topicId;
	}

	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}

	public String getTopicDescription() {
		return topicDescription;
	}

	public void setDescription(String description) {
		this.topicDescription = description;
	}

	public int getFollowerCount() {
		return followerCount;
	}

	public void setFollowerCount(int followerCount) {
		this.followerCount = followerCount;
	}

	public byte[] getTopicProfileImage() {
		return topicProfileImage;
	}

	public void setTopicProfileImage(byte[] topicProfileImage) {
		this.topicProfileImage = topicProfileImage;
	}

	public byte[] getTopicBannerImage() {
		return topicBannerImage;
	}

	public void setTopicBannerImage(byte[] topicBannerImage) {
		this.topicBannerImage = topicBannerImage;
	}
	
	
}
