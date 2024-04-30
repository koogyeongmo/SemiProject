package vote.model.dto;

public class VoteTransferDto {
	private String userId; 
	private int boardId;
	
	
	public VoteTransferDto() {
		super();
	}
	public VoteTransferDto(String userId, int boardId) {
		super();
		this.userId = userId;
		this.boardId = boardId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getThreadId() {
		return boardId;
	}
	public void setThreadId(int boardId) {
		this.boardId = boardId;
	}
	@Override
	public String toString() {
		return "VoteDeleteDto [userId=" + userId + ", boardId=" + boardId + "]";
	}

	
	
	
}
