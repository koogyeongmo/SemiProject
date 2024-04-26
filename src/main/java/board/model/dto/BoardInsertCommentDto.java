package board.model.dto;

public class BoardInsertCommentDto {
	private Integer boardId;
	private String userId;
	private String content;
	
	public BoardInsertCommentDto() {
		super();
	}
	
	public BoardInsertCommentDto(Integer boardId, String userId, String content) {
		super();
		this.boardId = boardId;
		this.userId = userId;
		this.content = content;
	}


	public Integer getBoardId() {
		return boardId;
	}

	public void setBoardId(Integer boardId) {
		this.boardId = boardId;
	}

	public String getCommentContent() {
		return content;
	}

	public void setCommentContent(String content) {
		this.content = content;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	@Override
	public String toString() {
		return "BoardInsertCommentDto [boardId=" + boardId + ", userId=" + userId
				+ ", content=" + content + "]";
	}
	
	
}
