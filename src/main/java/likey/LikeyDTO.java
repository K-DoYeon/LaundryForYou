package likey;

public class LikeyDTO {
	private String userID;
	private String subject;
	private String userIP;
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getUserWriteTitle() {
		return subject;
	}
	public void setUserWriteTitle(String userWriteTitle) {
		this.subject = userWriteTitle;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	
	public LikeyDTO (String userID, String subject) {
		super();
		this.userID = userID;
		this.subject = subject;
	}
}
