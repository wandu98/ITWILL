package oop0915;


abstract class Travel {				//추상클래스
	void view() {}					//일반메소드
	abstract String travelwhere();	//추상메소드
}// class end


class TypeA extends Travel{
	@Override
	String travelwhere() {
		return "제주도 올레길";
	}
}//class end

class TypeB extends Travel{
	@Override
	String travelwhere() {
		return "여의도 벚꽃축제";
	}
}//class end

class TypeC extends Travel{
	@Override
	String travelwhere() {
		return "지리산 둘레길";
	}
}//class end

public class Test05_abstract {

	public static void main(String[] args) {
		// 추상클래스와 다형성
		
		
		Travel tour=new TypeA();
		System.out.println(tour.travelwhere());
		
		tour=new TypeB();
		System.out.println(tour.travelwhere());
		
		tour=new TypeC();
		System.out.println(tour.travelwhere());
		

	}//main() end
}//class end
