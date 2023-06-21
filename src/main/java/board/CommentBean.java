package board;

public class CommentBean {
	private int commentid;
	private String uid;
	private String upass;
	private String content;
	private String wdate;
	private int ref;
	private int like;
	private int commentAvailable;
	
	
	public int getCommentid() {
		return commentid;
	}
	public void setCommentid(int commentid) {
		this.commentid = commentid;
	}

	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getUpass() {
		return upass;
	}
	public void setUpass(String upass) {
		this.upass = upass;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public int getRef() {
		return ref;
	}
	public void setRef(int ref) {
		this.ref = ref;
	}
	public int getLike() {
		return like;
	}
	public void setLike(int like) {
		this.like = like;
	}
	public int getCommentAvailable() {
		return commentAvailable;
	}
	public void setCommentAvailable(int commentAvailable) {
		this.commentAvailable = commentAvailable;
	}
	
}
