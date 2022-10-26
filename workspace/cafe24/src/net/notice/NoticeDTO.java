package net.notice;

public class NoticeDTO {//전송객체
  //멤버변수 field   
 private int noticeno;           
 private String subject;       
 private String content;       
 private String regdt;  
 private int indent;
 private int readcnt;
 private int grpno;
 private int ansnum;
 
//생성자함수 constructor
 public NoticeDTO() {}

public int getNoticeno() {
    return noticeno;
}

public void setNoticeno(int noticeno) {
    this.noticeno = noticeno;
}

public String getSubject() {
    return subject;
}

public void setSubject(String subject) {
    this.subject = subject;
}

public String getContent() {
    return content;
}

public void setContent(String content) {
    this.content = content;
}

public String getRegdt() {
    return regdt;
}

public void setRegdt(String regdt) {
    this.regdt = regdt;
}

public int getIndent() {
    return indent;
}

public void setIndent(int indent) {
    this.indent = indent;
}

public int getReadcnt() {
    return readcnt;
}

public void setReadcnt(int readcnt) {
    this.readcnt = readcnt;
}

public int getGrpno() {
    return grpno;
}

public void setGrpno(int grpno) {
    this.grpno = grpno;
}

public int getAnsnum() {
    return ansnum;
}

public void setAnsnum(int ansnum) {
    this.ansnum = ansnum;
}

@Override
public String toString() {
    return "NoticeDTO [noticeno=" + noticeno + ", subject=" + subject + ", content=" + content + ", regdt=" + regdt
            + ", indent=" + indent + ", readcnt=" + readcnt + ", grpno=" + grpno + ", ansnum=" + ansnum + "]";
}

 

}//class end
