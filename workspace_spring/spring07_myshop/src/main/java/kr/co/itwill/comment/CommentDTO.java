package kr.co.itwill.comment;

public class CommentDTO {
	
	private int cno;
	private int pno;
	private String content;
	private String wname;
	private String regdate;
	
	public CommentDTO() {}

	public int getCno() {
		return cno;
	}

	public void setCno(int cno) {
		this.cno = cno;
	}

	public int getPno() {
		return pno;
	}

	public void setPno(int pno) {
		this.pno = pno;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getWname() {
		return wname;
	}

	public void setWname(String wname) {
		this.wname = wname;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	@Override
	public String toString() {
		return "CommentDTO [cno=" + cno + ", pno=" + pno + ", content=" + content + ", wname=" + wname + ", regdate="
				+ regdate + "]";
	}
	
	
	
}//class end


