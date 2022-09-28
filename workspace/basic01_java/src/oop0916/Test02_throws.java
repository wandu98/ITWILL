package oop0916;


class Test{
	//1) 각각의 try~catch을 직접 이용한 예외처리
	/*
	public void view() {
		try {
			int a=3/0;
		}catch(Exception e) {
			System.out.println(e);
		}//end
	}//view() end
	
	
	public void disp() {
		try {
			int a=Integer.parseInt("KOREA");
		}catch (Exception e) {
			System.out.println(e);
		}//end
	}//disp() end
	*/
	
	
	
	
	
	//2) throws를 이용한 예외처리
	public void view() throws Exception {
		int a=3/0;
	}//view() end
	
	public void disp() throws NullPointerException, NumberFormatException {
		int a=Integer.parseInt("KOREA");
	}//disp() end          
	
	
	//OS가 개입해서 문제가 발생하지 않도록 조정하는 기법
	public synchronized void login() {}
	
	
	
	
}//class end



public class Test02_throws {

	public static void main(String[] args) {
		// throws문
		//-> 메소드 호출 시 예외처리를 한꺼번에 모아서 처리

		
		
		try {
			Test test=new Test();
			test.view();
			test.disp();
		}catch (Exception e) {
			System.out.println(e);
		}//end
		
		
		
		
	}//main() end
}//class end
