package oop0916;

import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.Properties;
import java.util.Set;

public class Test04_SetMap {

	public static void main(String[] args) {
		//2. Set 계열 : 순서가 없다
		
		Set set=new HashSet();
		set.add(3);
		set.add(2.4);
		set.add('R');
		set.add("BUSAN");
		set.add(new Integer(7));
		
		System.out.println(set.size());
		
		//cursor : 가리킬 요소가 있으면 true, 없으면 false 값 반환
		//cursor를 이용해서 요소를 접근하는 경우
		Iterator iter=set.iterator();
		while(iter.hasNext()) {	//다음 cursor가 있는지?	
			//cursor가 가리키는 요소 가져오기
			Object obj=iter.next();
			System.out.println(obj);
		}//while end
		System.out.println("-------------------------");
		///////////////////////////////////////////////////////
		
		
		//3. Map계열 : 순서가 없다
		//->key		: 이름표
		//->Value	: 값
		
		//->JSON, 파이선(딕셔너리), NoSQL등에서 많이 사용하는 문법
		
		HashMap map=new HashMap();
		map.put("one", 3);
		map.put("two", 2.4);
		map.put("three", 'R');
		map.put("four", "손흥민");
		
		System.out.println(map.size());
		
		System.out.println(map.get("four"));
		
		map.put("four", "박지성");
		System.out.println(map.get("four"));
		//////////////////////////////////////////////////////
		
		//Properties 클래스
		Properties db=new Properties();
		
		db.put("url", "http://localhost:1521");
		db.put("username", "itwill");
		db.put("password", "12341234");
		
		System.out.println(db.get("url"));
		System.out.println(db.get("username"));
		System.out.println(db.get("password"));
		////////////////////////////////////////////////////////
		
		
		//문제) = 문자를 기준으로 문자열을 분리해서
		//	   = 앞의 문자열은 key, = 뒤의 문자열은 value로 구분해서 hm에 저장하고
		//		hm의 key값들 중에서 "read.do"를 호출하면
		//		value값으로 net.bbs.Read. 출력하시오
		
		HashSet command=new HashSet();
		command.add("list.do=net.bbs.List");
		command.add("read.do=net.bbs.Read");
		command.add("write.do=net.bbs.Write");
		
		System.out.println(command.size());//3
		
		
		HashMap hm=new HashMap();
		
		//1) 커서 생성하기
		Iterator cursor=command.iterator();
		
		//2)커서가 있을때까지 반복
		while(cursor.hasNext()) {
			//3)커서가 가리키는 요소를 가져와서 문자열 형변환
			Object obj=cursor.next();
			String line=(String)obj;	//다형성
			//System.out.println(line);
			
			//4)"=" 위치를 기준으로 문자열 분리하기
			//-> split(), substring(), StringTokenizer클래스
			String[] word=line.split("=");
			String key=word[0];		//"=" 앞 문자열
			String value=word[1];	//"=" 뒤 문자열
			//System.out.println(key);
			//System.out.println(value);
			
			//5)hm에 저장하기
			hm.put(key, value);
		}//while end
		
		
		
		//결과값
		System.out.println(hm.get("read.do"));	//net.bbs.Read
		
		
		
	}//main() end
}//class end
