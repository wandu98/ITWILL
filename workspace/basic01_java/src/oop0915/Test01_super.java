package oop0915;


class School extends Object{
	String name="학교";
	public School() {
		System.out.println("School()...");
	}
}//class end extends Object 생략가능

class MiddleSchool extends School {
	public MiddleSchool() {
		
		//상속관계에서 부모 생성자 함수 호출 명령어 
		super();//생략가능하다
		System.out.println("MiddleSchool()...");
	}
		public void disp() {
			System.out.println(name);//학교. 부모가 물려준 값 그대로
	}//disp() end
}//class end

class HighSchool extends School {
	String name="고등학교";
	
	public HighSchool() {
		super();
		System.out.println("HighSchool()...");
	}
	
	public void disp() {
		String name="강남고등학교";
		System.out.println(name);		//강남고등학교	지역변수
		System.out.println(this.name);	//고등학교		나의 멤버변수  
		System.out.println(super.name); //학교		부모의 멤버변수
	}//disp() end
}//class end




public class Test01_super {

	
	public static void main(String[] args) {
		// super 부모, 조상
		// superclasses 부모클래스들
		// subclasses	자식클래스
		
		//super		: 자식클래스에서 부모클래스의 멤버의 접근할 때
		//super() : 자식클래스의 생성자 함수가 부모클래스의 생성자 함수를 호출할 때
        
        //this    : 멤버변수(field)와 일반 지역변수를 구분하기 위해
        //this()  : 자신의 생성자함수가 자신의 생성자함수를 호출할 때
		
		/////////////////////////////////////////////////////
		
		//상속관계에서 생성자 함수 호출순서
		//->부모생성자가 먼저 호출되고 자신의 생성자 함수가 호출된다
		
		//School() -> MiddleSchool()
		MiddleSchool ms=new MiddleSchool();
		ms.disp();
		
		//School() -> HighSchool()
		HighSchool hs=new HighSchool();
		hs.disp();
		
	}

}
