package oop0920;

import java.io.FileReader;

public class Test02_input {

	public static void main(String[] args) {
		//2)char 기반 -> 한글 안깨짐
		
		String filename="/Users/wandu/java202207/workspace/basic01_java/src/oop0920/data.txt";
		FileReader fr=null;
		
		try {
			
			fr=new FileReader(filename);
			
			while(true) {
				int data=fr.read();//2바이트 읽기
				if(data==-1) {
					break;
				}//if end
				System.out.printf("%C", data);
			}//while end
			
		}catch (Exception e) {
			System.out.println("파일 읽기 실패 : " + e);
		}finally {
			//자원 반납
			try {
				if(fr!=null) { fr.close(); }
			}catch (Exception e) {}
		}//end

	}//main() end
}//class end
