package oop0913;

public class Sawon {
	//멤버변수 filed
	String sabun;		//사원번호
	String name;		//이름
	int pay;			//급여
	
	
	//생성자함수 constructor
	public Sawon() {}

	//생성자 함수 자동 코딩
    //메뉴Source ->Generate Constructor using Fields...
	public Sawon(String sabun, String name, int pay) {
		this.sabun = sabun;
		this.name  = name;
		this.pay   = pay;
	}//end
	
	//static변수
	static String COMPANY="(주)아이티윌";
	static int SUDANG=10;
	static double TAX=0.03;
	
	//static 합수
	static void line() {
		System.out.println("-----------------------------");
	}//line() end
	
}//class end
