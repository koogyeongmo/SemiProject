package board.model.dto;

public class BoardInsertDto {
	
	private int boardId;
	private String topicId;
	private String userId;
	private String title;
	private String content;
	
	public BoardInsertDto() {
		super();
	}
	
	public BoardInsertDto(int boardId, String topicId, String userId, String title, String content) {
		this.boardId = boardId;
		this.topicId = topicId;
		this.userId = userId;
		this.title = title;
		this.content = content;
	}

	public int getBoardId() {
		return boardId;
	}

	public void setBoardId(int boardId) {
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

	@Override
	public String toString() {
		return "BoardInsertDto [boardId" + boardId +", topicId=" + topicId + ", userId=" + userId + ", title=" + title + ", content=" + content
				+ "]";
	}
	
	
	
}