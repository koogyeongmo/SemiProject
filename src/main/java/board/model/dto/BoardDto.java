package board.model.dto;

public class BoardDto {

	private Integer boardId;
	private String topicId;
	private String userId;
	private Integer upvote;
	private Integer downvote;
	private String title;
	private String content;
	private String postTime;  
	private Integer views;
	private Integer comments;
	
	public BoardDto() {
		super();
	}

	public BoardDto(Integer boardId, String topicId, String userId, Integer upvote, Integer downvote, String title,
			String content, String postTime, Integer views, Integer comments) {
		super();
		this.boardId = boardId;
		this.topicId = topicId;
		this.userId = userId;
		this.upvote = upvote;
		this.downvote = downvote;
		this.title = title;
		this.content = content;
		this.postTime = postTime;
		this.views = views;
		this.comments = comments;
	}

	@Override
	public String toString() {
		return "BoardDto [boardId=" + boardId + ", topicId=" + topicId + ", userId=" + userId + ", upvote=" + upvote
				+ ", downvote=" + downvote + ", title=" + title + ", content=" + content + ", postTime=" + postTime
				+ ", views=" + views + ", comments=" + comments + "]";
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
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

	public Integer getUpvote() {
		return upvote;
	}

	public void setUpvote(Integer upvote) {
		this.upvote = upvote;
	}

	public Integer getDownvote() {
		return downvote;
	}

	public void setDownvote(Integer downvote) {
		this.downvote = downvote;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getPostTime() {
		return postTime;
	}
	
	public String getDate() {
		return postTime.split(" ")[0];
	}

	public void setPostTime(String postTime) {
		this.postTime = postTime;
	}

	public Integer getViews() {
		return views;
	}

	public void setViews(Integer views) {
		this.views = views;
	}
	
	public Integer getComments() {
		return views;
	}

	public void setComments(Integer views) {
		this.views = views;
	}
	
	public int getVoteCount() {

		return upvote - downvote;
	}
	
}
