package crawling0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test05_soldesk {

	public static void main(String[] args) {
		//솔데스크 웹페이지에서 공지사항 제목 크롤링해서
		//soldesk.txt파일에 저장하기
		
		try {
			
			String fileName="/Users/wandu/java202207/soldesk.txt";
			FileWriter  fw =new FileWriter(fileName, true);	//추가모드
			PrintWriter out=new PrintWriter(fw, true);
			
			String URL="https://soldesk.com/board/board_bagic/board_list.asp";
					
			for(int p=1; p<=8; p++) {
				String params="?scrID=0000000173&pageNum=8&subNum=1&ssubNum=1&page=" + p + "&bd_num=&act=list&s_string=";
				
				//공지사항 웹페이지 1~8 페이지 소스 가져오기
				Document doc=Jsoup.connect(URL+params).get();
				//System.out.println(doc.toString());
				/*
				 	공지사항 제목 가져오기
				 	<td class="td_left">
				 	
				 	</td>
				 */
				Elements elements=doc.select(".td_left");
				
				//class="td_m_date" 요소 제거하기
				elements.select(".td_m_date").remove();
				for(Element element : elements ) {	
					System.out.println(element.text());
					out.println(element.text());	//.txt 출력하기
				}//for end
			}//for end
			
			out.close();
			fw.close();
			
			System.out.println("----------soldesk.txt 공지사항 제목 저장 완성");
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end	

	}//main() end
}//class end
