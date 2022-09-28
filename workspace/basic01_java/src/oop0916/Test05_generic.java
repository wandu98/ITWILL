package oop0916;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Vector;

class Mountain {
	String name;	//산이름
	int height;		//산높이
	
	public Mountain() {}
	public Mountain(String name, int height) {
		this.name = name;
		this.height = height;
	}//end
}//class end


 
public class Test05_generic {

	public static void main(String[] args) {
		// 제네릭 Generic
		/*
		  	- 요소를 수집하는 경우에 특정 자료형으로 제한할 수 있다
		  	- <E>
		  	- <K, V>
		  	- <T>
		  	- <?>
		  	- <참조자료형>	
		 */
		//int형만 num배열에 대입 가능하다
		int[] num=new int[3];
		
		//Vector<int> 기본자료형은 올 수 없다. 에러
		Vector<String> vec=new Vector<>();
		vec.add("개나리");
		vec.add("진달래");
		vec.add(new String("무궁화"));
		//vec.add(3);
		//vec.add(2.4);
		//vec.add(new Character('R')); 에러
		
		for(int i=0; i<vec.size(); i++) {
			String str=vec.get(i);
			System.out.println(str);
		}//for end
		//////////////////////////////////////
		
		//앞에 <Integer> 선언이 되어 있으면 뒤에 생략이 가능하다
		ArrayList<Integer> list=new ArrayList<>();
		list.add(3);
		list.add(new Integer(5));
		//list.add(2.4);	 에러
		//list.add("KOREA"); 에러
		////////////////////////////////////////////
		
		HashSet<Double> set=new HashSet<>();
		set.add(1.2);
		set.add(new Double(3.5));
		//set.add(7); 	에러
		//set.add("");  에러
		/////////////////////////////////////////////////////
		
		
		HashMap<String, Character> map=new HashMap<>();
		map.put("one", 'R');
		map.put("two", new Character('r'));
		//map.put("", ""); 에러
		System.out.println(map.get("one"));
		////////////////////////////////////////////////////
		
		
		Mountain m1=new Mountain("한라산", 1950);
		Mountain m2=new Mountain("관악산", 1500);
		Mountain m3=new Mountain("북한산", 1000);
		
		ArrayList<Mountain> item=new ArrayList<>(); //Mountain 자료형만 올 수 있음
		item.add(m1);
		item.add(m2);
		item.add(m3);
		//item.add(""); 에러
		
		for(int i=0; i<item.size(); i++) {
			Mountain m=item.get(i);
			System.out.println(m.name);
			System.out.println(m.height);
		}//for end
		
		
	}//main() end
}//class end
