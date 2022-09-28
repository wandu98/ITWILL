package oop0920;

import java.io.FileInputStream;

public class Test01_input {

	public static void main(String[] args) {
		//파일 입출력(.txt)
		//File : .txt .pdf .xls .csv .ppt .jpg ~~
		
		//byte형 : 1바이트 할당
		//char형 : 2바이트 할당
		
		//1)byte기반 -> 한글깨짐
		
		String filename="/Users/wandu/java202207/workspace/basic01_java/src/oop0920/data.txt";
		//같은경로에 있으면 굳이 경로를 쓰지 않아도 된다
		//예외처러리를 해줘야된다
		
		FileInputStream fis=null;
		
		try {
			fis=new FileInputStream(filename);
			while(true) {
				int data=fis.read();//1바이트 읽기
				if(data==-1) { //파일의 끝(End Of File)인지?
					break;
				}//if end
				System.out.printf("%C", data);
			}//while end
			
		}catch (Exception e) {
			System.out.println("파일 읽기 실패 : " + e);
		}finally {
			//자원반납
			try {
				if(fis!=null) { fis.close(); } // 위에서 InputStream으로 열어줬으면 다시 닫아줘야 된다
			}catch (Exception e) {}	
		}//end
		
		
		
	}//main() end
}//class end
