package kr.co.itwill.di;

public class HelloPOJO {

	public static void main(String[] args) {
		//POJO 방식
		
		IHello hello=null;
		
		hello=new MessageKO1(); //다형성
		hello.sayHello("손흥민");
		
		hello=new MessageEN1();
		hello.sayHello("TOM");
	}//main() end
}//class end
