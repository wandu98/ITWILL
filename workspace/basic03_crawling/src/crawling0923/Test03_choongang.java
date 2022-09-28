package crawling0923;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test03_choongang {

	public static void main(String[] args) {
		//중앙정보처리학원 웹페이지의 공지사항 제목만 크롤링 하기
		try {
			
			String URL="https://www.choongang.co.kr/html/sub07_01_n.php";
					
			//공지사항 웹페이지 1~11 페이지 소스 가져오기
			for(int p=1; p<=11; p++) {
				String params="?page=" + p + "&mod=&idx=";
				//System.out.println(params);
				Document doc=Jsoup.connect(URL+params).get();
				//System.out.println(doc.toString());
				
				//요소 선택하기
				/*
				  <tr class="board_defaulut_list">
				 	<tb class="default_title">빅데이터 분석기사 자격증 실기시험 대비반</td>
				 */
				Elements elements=doc.select(".board_default_list .default_title");
				for(Element element : elements ) {	//for(개별:덩어리)
					System.out.println(element.text());
				}//for end
				
			}//for end
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end	

	}//main() end
}//class end
