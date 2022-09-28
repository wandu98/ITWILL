package oop0915;


interface IMessage {
	public void msgPrint();	//추상메소드
}//interface end

class Message implements IMessage {
	@Override
	public void msgPrint() {
		System.out.println("Message 클래스");
	}
}//class end

public class Test08_anonymous {

	public static void main(String[] args) {
		//익명 내부객체 Anonymous class

		//인터페이스는 직접 객체 생성할 수 없다
		//IMessage msg=new IMessage(); 에러
		
		//1)구현 클래스
		Message msg=new Message();
		msg.msgPrint();
		
		//2)다형성
		IMessage imess=new Message();
		imess.msgPrint();
		
		//3)익명 객체
		//->필요한 곳에 일시적으로 생성
		//->이벤트가 발생할 때만 실행
		//->모바일 응용 앱, JavaScript, jQuery등에서 많이 사용
		//예) $("button").click(){}
		IMessage mess=new IMessage() {
			@Override
			public void msgPrint() {
				System.out.println("익명 내부 객체");
			}
		};
		
		mess.msgPrint();
		
		System.out.println(mess);
		
		
		
	}//main() end
}//class end
