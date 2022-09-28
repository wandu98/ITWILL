package oop0919;



public class Test01_buyer {

	public static void main(String[] args) {
		//상품 구매 및 반품 프로그램
		
		//1)상품만들기
		//-> Product 클래스
		//-> SmartTv 클래스
		//-> Notebook 클래스
		//-> HandPhone 클래스
		
		
		//2)상품 진열하기
		SmartTV tv=new SmartTV();
		Notebook note=new Notebook();
		HandPhone phone=new HandPhone();
		
		
		//3)상품 구매하기
		//->Buyer클래스
		Buyer kim=new Buyer();
		kim.buy(tv);	//100
		kim.buy(note);	//200
		kim.buy(phone);	//150
		kim.buy(phone);	//150
		kim.buy(phone); //150
		kim.buy(phone); //150
		kim.buy(phone); //잔액부족
		kim.buy(phone); //잔액부족
		
		kim.disp();
		System.out.println("--------------------");
		
		//4)반품하기
		//->Order 클래스 
		//->(Buyer클래스 복사해서 수정)
		//->상품을 중복해서 구매하지 않았다는 전제하에 반품
		Order lee=new Order();
		lee.buy(tv);
		lee.buy(note);
		lee.buy(phone);
		lee.disp();
		
		System.out.println("<<<<반품");
		lee.refund(note);
		
		System.out.println("<<<<결과");
		lee.disp();
		
	}//main() end
}//class end
