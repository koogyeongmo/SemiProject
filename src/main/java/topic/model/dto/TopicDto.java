package topic.model.dto;


public class TopicDto {
	private String topicId;
	private String topicDescription;
	private int followerCount;
	private String topicProfileImage;
	private String topicBannerImage;
	


	@Override
	public String toString() {
		return "TopicDto [topicId=" + topicId + ", topicDescription=" + topicDescription + ", followerCount="
				+ followerCount + ", topicProfileImage=" + topicProfileImage + ", topicBannerImage=" + topicBannerImage
				+ "]";
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

	public String getTopicProfileImage() {
		return topicProfileImage;
	}

	public void setTopicProfileImage(String topicProfileImage) {
		this.topicProfileImage = topicProfileImage;
	}

	public String getTopicBannerImage() {
		return topicBannerImage;
	}

	public void setTopicBannerImage(String topicBannerImage) {
		this.topicBannerImage = topicBannerImage;
	}
	
	public String getCapitalizedId() {
	    return topicId.substring(0, 1).toUpperCase() + topicId.substring(1);
		
	}
	
	
}
