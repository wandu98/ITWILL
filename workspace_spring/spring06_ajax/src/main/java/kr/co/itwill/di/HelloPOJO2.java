package kr.co.itwill.di;

public class HelloPOJO2 {

	public static void main(String[] args) {
		
		IHello hello = null;
		
		hello = new MessageKO2(); //다형성
		hello.sayHello("박지성");
		
		hello = new MessageEN2(); //다형성
		hello.sayHello("John");
		
		
	}//main() end
}//class end
