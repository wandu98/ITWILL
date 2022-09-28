package oop0907;

public class Test03_overload {
	
	public static void hap(int a) {
		System.out.println(a);
	}//hap() end
	
	public static void hap(int a, int b) {
		System.out.println(a+b);
	}//hap() end
	 
	public static void hap(double a) {
		System.out.println(a);
	}//hap() end
	
	public static void hap(double a, double b) {
		System.out.println(a+b);
	}//hap() end
/*	
 	에러. 함수의 리턴형은 메소드 오버로딩의 조건이 아니다
	public static int hap(double a, double b) {}
*/
	public static void main(String[] args) {
		// Method Overload 함수명 중복 정의
		//->함수명을 중복해서 사용할 수 있다
		
		//메소드 오버로딩의 전제조건
		//->매개변수의 갯수가 달라야 한다
		//->매개변수의 자료형이 달라야 한다
		
		hap(3);
		hap(2, 4);
		hap(5.6);
		hap(9.8, 7.6);

		//절대값 구하기
		System.out.println(Math.abs(-3));		//int형 (기본)	
		System.out.println(Math.abs(4L));		//long형
		System.out.println(Math.abs(5.6f));		//float
		System.out.println(Math.abs(7.8d));		//double형 (기본), d접미사 생략가능
		
		
	}//main() end
}//class end
