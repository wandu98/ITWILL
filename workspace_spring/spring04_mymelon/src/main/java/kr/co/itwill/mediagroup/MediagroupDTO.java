package kr.co.itwill.mediagroup;

public class MediagroupDTO {

private int mediagroupno;
private String title;

//기본생성자, getter, setter, toString

public MediagroupDTO() {}

public int getMediagroupno() {
	return mediagroupno;
}
public void setMediagroupno(int mediagroupno) {
	this.mediagroupno = mediagroupno;
}
public String getTitle() {
	return title;
}
public void setTitle(String title) {
	this.title = title;
}

@Override
public String toString() {
	return "MediagroupDTO [mediagroupno=" + mediagroupno + ", title=" + title + "]";
}


}//MediagroupDTO() end
