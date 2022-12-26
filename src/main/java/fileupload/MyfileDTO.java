package fileupload;

public class MyfileDTO {
	//멤버변수
	private String num;		//일련번호
	private String title;	//제목
	private String content;	//내용
	private String id;		//아이디
	private String ofile;	//원본 파일명
	private String sfile;	//저장된 파일명
	private String postdate;//등록 날짜
	private String visitcount;//조회수
	private String b_flag;//카테고리
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getOfile() {
		return ofile;
	}
	public void setOfile(String ofile) {
		this.ofile = ofile;
	}
	public String getSfile() {
		return sfile;
	}
	public void setSfile(String sfile) {
		this.sfile = sfile;
	}
	public String getPostdate() {
		return postdate;
	}
	public void setPostdate(String postdate) {
		this.postdate = postdate;
	}
	public String getVisitcount() {
		return visitcount;
	}
	public void setVisitcount(String visitcount) {
		this.visitcount = visitcount;
	}
	public String getB_flag() {
		return b_flag;
	}
	public void setB_flag(String b_flag) {
		this.b_flag = b_flag;
	}
	
	
	
}
