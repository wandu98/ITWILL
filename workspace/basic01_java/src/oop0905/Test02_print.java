package oop0905;

public class Test02_print {

	public static void main(String[] args) {
		// 콘솔창 출력
		
		System.out.print(123);
		System.out.print(456);
		System.out.print(123);
		
		System.out.println();	//콘솔창에서 줄바꿈
		
		//출력하고 줄바꿈(엔터)	
		System.out.println(123);
		System.out.println(456);
		System.out.println(789);
		
		//문자열 데이터 구분 기호 "
		System.out.println("JAVA");
		System.out.println("Python");
		System.out.println(123);		//숫자
		System.out.println("456");		//문자열
		
		// " ' \ 등을 단순 기호로 인식하고자 할때
		System.out.println("\"");
		System.out.println("\'");
		System.out.println("\\");
		
		// + 연산자
		System.out.println(123+456);		//579
		System.out.println("123"+"456");	//"123456"
		System.out.println(123+"456");		//"123456"
		System.out.println("123"+456);		//"123456"
		System.out.println("123+456");		//"123+456"
		
		
	}//main() end
}
