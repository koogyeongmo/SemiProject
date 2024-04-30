package vote.model.dto;

public class VoteDto {
	private String userId; 
	private int boardId;
	private String voteType;
	
	
	public VoteDto() {
		super();
	}
	public VoteDto(String userId, int boardId, String voteType) {
		super();
		this.userId = userId;
		this.boardId = boardId;
		this.voteType = voteType;
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
	public String getVoteType() {
		return voteType;
	}
	public void setVoteType(String voteType) {
		this.voteType = voteType;
	}
	@Override
	public String toString() {
		return "VoteDto [userId=" + userId + ", boardId=" + boardId + ", voteType=" + voteType + "]";
	} 
	
	
	
}
