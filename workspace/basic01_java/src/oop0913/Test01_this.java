package oop0913;

class Score{
	//멤버변수 field
	private String name="손흥민";
	private int kor, eng, mat;
	private int aver;
	
	//생성자함수 constructor
	//생성자함수를 오버로딩하면 기본생성자 함수는 자동으로 생성되지 않는다
	//그래서, 기본생성자 함수는 수동으로 생성할 것을 추천!
	public Score() {}
	
	public Score(String name, int kor, int eng, int mat){
		this.name=name;
		this.kor=kor;
		this.eng=eng;
		this.mat=mat;
		this.aver=(kor+eng+mat)/3;
	}//end
	
	//멤버변수 method
	public void disp() {
		//지역변수의 우선순위가 가장 높다 
		String name="박지성";
		System.out.println(name);		//박지성
		
		System.out.println(this.name);	//손흥민 this.멤버변수
		System.out.println(this.kor);
		System.out.println(this.eng);
		System.out.println(this.mat);
		System.out.println(this.aver);
	}//disp() end
		
}//class end
public class Test01_this {

	public static void main(String[] args) {
		//this
		//->클래스가 자신을 가리키는 대명사
		//->일반지역변수 멤버변수를 구분하기 위함
		
		//this()
		//->자신의 생성자 함수를 호출
		
		Score one=new Score("김연아", 50, 60, 75);
		one.disp();
		
		Score two=new Score();
		two.disp();
		
		Score three=new Score("무궁화", 10, 20, 25);
		three.disp();
		
		//객체 지향 프로그램 특징 : 은폐, 캡슐화
				
		//객체가 참조하고 있는 주소
		System.out.println(one.hashCode());
		System.out.println(two.hashCode());
		System.out.println(three.hashCode());
		
		//객체 생성(메모리 할당)의 여부 확인
		System.out.println(one);
		System.out.println(two);
		System.out.println(three);
		
		one=null;
		System.out.println(one);
		//////////////////////////////
		
		Score kim=new  Score("봉선화", 10, 20, 30);	//#100
		Score lee=new  Score("라일락", 40, 50, 60);	//#200
		Score park=new Score("진달래", 70, 80, 90);	//#300
		
		//객체 배열
		Score[] score= {
							 new Score("오필승", 11, 22, 33)
							,new Score("코리아", 44, 55, 66)
							,new Score("대한민국", 77, 88, 99)
						  };
		
	 /*
	  
        +---------+---------+--------+
        |  #100   |  #200   |  #300  |
        +---------+---------+--------+
         score[0]   score[1]  score[2]
         
	  */
		
		score[0].disp();
		score[1].disp();
		score[2].disp();
		
		int size=score.length;
		
		for(int i=0; i<size; i++) {
			score[i].disp();
		}//for end
	}//main() end
}//class end
