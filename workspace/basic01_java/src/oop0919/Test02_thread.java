package oop0919;

 class MyThread1 {
	 private int num;
	 private String name;
	 
	public MyThread1(int num, String name) {
		super();
		this.num = num;
		this.name = name;
	}//end
	 
	public void start() {
		run();
	}//start() end
	
	public void run() {
		for(int a=0; a<num; a++) {
			System.out.println(name+":"+a);
		}//for end
	}//run() end
	 
 }//class end

public class Test02_thread {

	public static void main(String[] args) {
		//Thread 클래스
		//->하나의 프로그램이나 하나의 메소드가 cpu자원을 전부 점유하는 것을 막을 수 있다	

		//1)쓰레드를 사용하지 않은 경우
		MyThread1 t1=new MyThread1(1000, "★");
		MyThread1 t2=new MyThread1(1000, "★★");
		MyThread1 t3=new MyThread1(1000, "★★★");
		
		t1.start();
		t2.start();
		t3.start();
		
		
	}//main() end
}//class end

