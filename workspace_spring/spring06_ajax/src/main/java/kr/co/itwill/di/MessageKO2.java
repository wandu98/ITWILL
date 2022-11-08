package kr.co.itwill.di;

import javax.swing.JOptionPane;

public class MessageKO2 implements IHello {

	public MessageKO2() {
		System.out.println("MessageKO2() 객체 생성");
	}
	
	@Override
	public void sayHello(String name) {
		JOptionPane.showMessageDialog(null, "안녕하세요~~" +  name);
	}
	
}//class end
