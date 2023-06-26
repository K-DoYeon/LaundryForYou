package likey;

public class LikeyDTO {
	private String userID;
	private String subject;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public LikeyDTO (String userID, String subject) {
		super();
		this.userID = userID;
		this.subject = subject;
	}
}
