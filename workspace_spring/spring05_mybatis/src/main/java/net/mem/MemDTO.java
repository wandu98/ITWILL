package net.mem;

public class MemDTO {

	private int num;
	private String name;
	private int age;
	
	
	public MemDTO() {}
	
	///Test용 생성자 만듦
	
	public MemDTO(int num) {
		this.num = num;
	}
	
	public MemDTO(int num, int age) {
		this.num = num;
		this.age = age;
	}
	
	public MemDTO(String name, int age) {
		this.name = name;
		this.age  = age;
	}
	
	public MemDTO(int num, String name, int age) {
		this.num  = num;
		this.name = name;
		this.age  = age;
	}
	
	public int getNum() {
		return num;
	}
	
	public String getName() {
		return name;
	}
	
	public int getAge() {
		return age;
	}
	
}