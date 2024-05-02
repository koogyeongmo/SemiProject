package board.model.dto;

public class BoardCommentDto {
	private Integer commentId;
	private Integer boardId;
	private String userId;
	private String content;
	private String postTime;
	private Integer upvote;
	private Integer downvote;
	
	public BoardCommentDto() {
		super();
	}

	public BoardCommentDto(Integer commentId, Integer boardId, String userId, String content, String postTime,
			Integer upvote, Integer downvote) {
		super();
		this.commentId = commentId;
		this.boardId = boardId;
		this.userId = userId;
		this.content = content;
		this.postTime = postTime;
		this.upvote = upvote;
		this.downvote = downvote;
	}

	public Integer getCommentId() {
		return commentId;
	}

	public void setCommentId(Integer commentId) {
		this.commentId = commentId;
	}

	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}
	
	public String getUserId() {
		return userId;
	}

	public void setUserId(String boardId) {
		this.userId = boardId;
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

	public void setPostTime(String postTime) {
		this.postTime = postTime;
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
	public String getDate() {
		return postTime.split(" ")[0];
	}

	@Override
	public String toString() {
		return "BoardCommentDto [commentId=" + commentId + ", boardId=" + boardId + ", userId=" + userId +  ", content="
				+ content + ", postTime=" + postTime + ", upvote=" + upvote + ", downvote=" + downvote + "]";
	}
	
	
	
}
	