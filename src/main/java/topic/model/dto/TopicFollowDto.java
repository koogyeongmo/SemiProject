package topic.model.dto;


public class TopicFollowDto {
	private String topicId;
	private String userId;
	
	public TopicFollowDto() {
		super();
	}
	
	public TopicFollowDto(String topicId, String userId) {
		super();
		this.topicId = topicId;
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "TopicJoinDto [topicId=" + topicId + ", userId=" + userId + "]";
	}
	public String getTopicId() {
		return topicId;
	}
	public void setTopicId(String topicId) {
		this.topicId = topicId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	
}