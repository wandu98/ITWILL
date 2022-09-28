package oop0915;

class Unit{
	int currentHP;
	int x, y;
}//class end


interface Movable {
	void move(int x, int y);
}//interface end


interface Attackable {
	void attack(Unit u);
}//interface end


interface Fightable extends Movable, Attackable {
	//인터페이스 간 상속은 다중상속이 가능하다
}//interface end	


class Fight extends Unit implements Fightable {
	//클래스 간 다중상속이 안 됨 주의!
	@Override
	public void attack(Unit u) {}
	
	@Override
	public void move(int x, int y) {}
	
}//class end 


class Tetris extends Unit implements Movable, Attackable {
	 //클래스 입장에서 클래스는 단일상속만 가능하고, 인터페이스는 다중구현이 가능하다
	@Override
	public void attack(Unit u) {}
	
	@Override
	public void move(int x, int y) {}
}//class end





public class Test07_interface {

	public static void main(String[] args) {
		// 클래스와 인터페이스의 상속

	}//main() end
}//class end
