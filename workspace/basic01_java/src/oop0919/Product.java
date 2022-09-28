package oop0919;

public class Product extends Object{
					//extends Object 생략가능
	public int price;		//상품가격
	public int bonusPoint;	//마일리지
	
	public Product() {}//default constructor 
	public Product(int price) {
		this.price=price;	//this.멤버변수=지역변수
		//상품가격의 10%를 보너스 점수 책정
		this.bonusPoint=(int)(price*0.1);
	}//end
}//class end



class SmartTV extends Product{
	public SmartTV() {
		super(100);		//상품가격 Price=100 bonusPoint=10  부모를 먼저 찍어야 된다
	}
	
	@Override
	public String toString() {
		return "AppleTV";	//상품명
	}
}//class end

class Notebook extends Product{
	public Notebook() {
		super(200);		//상품가격 price=200 bonusPoint=20	
	}
	
	@Override
	public String toString() {
		return "MacBook";	//상품명
	}
	
}//class end

class HandPhone extends Product{
	public HandPhone() {
		super(150);		//상품가격 price=150 bonusPoint=15	
	}
	
	@Override
	public String toString() {
		return "iPhone14 Pro";	//상품명
	}
}//class end