package oop0914;

public class Test07_quiz {

	public static void main(String[] args) {
		//연습문제
		//문1)주민번호의 각 숫자의 합을 구하시오 (Character 클래스 활용)
		// 8+9+1+2+3+0+1+2+3+4+5+6+7
		String jumin="8912301234567";
		int sum=0;
		for(int i=0; i<jumin.length(); i++) {
			char ch=jumin.charAt(i);	//'8'
			//'8' -> 8
			sum=sum+Character.getNumericValue(ch);
		}//for end
		System.out.println(sum);
		
		
		
		//문2)대소문자를 서로 바꿔서 출력하시오 (Character 클래스를 활용)
		// gONE wITH tHE wIND
		String str="Gone With The Wind";
		for(int i=0; i<str.length(); i++) {
			char ch=str.charAt(i);
			if(Character.isUpperCase(ch)) {
				System.out.print(Character.toLowerCase(ch));
			}else if(Character.isLowerCase(ch)) {
				System.out.print(Character.toUpperCase(ch));
			}else {
				System.out.print(ch);
			}//if end
		}//for end
		
		
		
	}//main() end
}//class end
