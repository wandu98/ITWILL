package crawling0923;

import java.io.FileWriter;
import java.io.PrintWriter;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class Test06_movie {

	public static void main(String[] args) {
		//네이버 영화 평점 후기 크롤링 하기
		//예)"공조2" 영화 평점 제목을 공감순으로 정렬 후 크롤링하기(1페이지)
		
		
		try {
			
			//네이버 영화 평점 후기 페이지 주소
			String URL="https://movie.naver.com/movie/bi/mi/pointWriteFormList.naver";
			String params="?code=201641";	//영화코드번호
			params+="&type=after&onlyActualPointYn=N&onlySpoilerPointYn=N";
			params+="&order=sympathyScore";	//공감순
			params+="&page=1";
			
			Document doc=Jsoup.connect(URL+params).get();
			//System.out.println(doc.toString());
			
			//1. 평점 제목이 있는 요소
			//<span id="_filtered_ment_0">	</span>
			//				....
			//<span id="_filtered_ment_9">	</span>
			/*
			for(int ment=0; ment<=9; ment++) {
				Elements elements=doc.select("#_filtered_ment_" + ment);
				for(Element element : elements) {
					System.out.println(element.text());
				}//for end
			}//for end
			*/
			
			
			//2. 평점 제목이 있는 요소
			/*
				<div class="score_reple">
            	   <p>
                		<span class="ico_viewer">관람객</span>
                		<span id="_filtered_ment_0">
                    		현빈 다니엘 헤니 존잘ㅎㅎ
                		</span>
            	   </p>               
            	</div>
			*/
			Elements elements=doc.select(".score_reple p");
			
			//불필요한 요소 제거하기 <span class="ico_viewer">관람객</span>
			elements.select(".ico_viewr").remove();
			
			for(Element element : elements) {
				System.out.println(element.text());
			}//for end
			
			
		}catch (Exception e) {
			System.out.println("크롤링 실패 : " + e);
		}//end	

	}//main() end
}//class end
