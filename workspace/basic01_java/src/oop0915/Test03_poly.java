package oop0915;

import java.util.Calendar;
import java.util.GregorianCalendar;

class Father {
	//멤버변수 field
	public String name="아버지";
	public String addr="주소";
	
	//생성자함수 constructor
	public Father() {}
	public Father(String name, String addr) {
		this.name=name;
		this.addr=addr;
	}//end
	
	//멤버함수 method
	public void disp() {
		System.out.println(this.name);
		System.out.println(this.addr);
	}//disp() end
	
}//class end

class Son extends Father {
	public Son() {}
	public Son(String n, String a) {
		super.name=n;
		super.addr=a;
	}//end
}//class end

class Daughter extends Father {
	String friend="절친";
	public Daughter() {}
	public Daughter(String n, String a) {
		super(n, a);	//부모생성자 함수 호출
	}//end
}//class end




public class Test03_poly {

	public static void main(String[] args) {
		// 다형 Polymorphism
		/*
		 	상속관계에서의 다형성
		 	- 부모클래스의 관점에서 형태가 여러가지
			- 클래스들간의 형변환이 용이하다
		 	- 다형성의 예) Calendar cal=new GregorianCalendar();
		 	 			 Number num=new Integer(5);
		 */
		/////////////////////////////////////////////////////
		
		//1)일반적인 방식으로 객체 생성
		//-> new 연산자
		//-> POJO(Plain Old Java Object) 방식
		/*
		Father fa=new Father();
		fa.disp();
		
		Son son=new Son("손흥민", "영국");
		son.disp();
		
		Daughter dau=new Daughter("김연아", "한국");
		dau.disp();
		*/
		////////////////////////////////////////////////
		
		//2)다형성을 이용한 객체 생성
		//->자식클래스가 부모클래스에 대입 가능하다 핵심 키워드
		//->부모클래스는 대입된 자식클래스의 모양으로 스스로를 변환한다
		
		Father fa=new Son("개나리", "역삼동");
		fa.disp();
		
		fa=new Daughter("진달래", "서초동");
		fa.disp();
		
	
		
		System.out.println(fa.name);
		System.out.println(fa.addr);
		//에러. 자식클래스에서 추가된 멤버는 다형성의 대상이 아니다
		//System.out.println(fa.friend);
		////////////////////////////////////////////////////////
		
		
		//부모클래스도 자식클래스에 대입가능하다
		//->단, 자식클래스의 모양으로 형변환해야 한다
		/*
		Father father=new Father();
		Son son=new Son();
		
		father=son;
		son=(Son)father;	//Exception 발생할 수도 있다
		
		double a=3.4;
		int b=(int)a;	//강제 형변환
		*/
		///////////////////////////////////////////////////////
		
		
		//예)
		Object obj=new Integer(5);	//다형성. 자식클래스가 부모클래스에 대입
		System.out.println(obj.toString());
		
		Integer inte=(Integer)obj;	//다형성
									//부모클래스도 자식클래스에 대입 가능하지만 
									//자식클래스의 모습으로 변환해야 한다
		
		obj=new Father();
		System.out.println(obj.toString());
		
		
		
		
		
	}//main() end
}//class end
