package oop0920;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java.util.StringTokenizer;

public class Test05_sungjuk {

	public static void main(String[] args) {
		//문제) 성적프로그램
		//성적 입력 자료(sungjuk.txt)를 가져와서, 성적 결과 파일 완성하기(result.txt)
		/*
		 	1) 입력 데이터 파일 : sungjuk.txt
		 	
		 	2) 결과 파일 : result.txt
		 	
		 
								성 / 적 / 결 /과
              -------------------------------------------------------
              이름     국어   영어  수학   평균  등수   결과
              -------------------------------------------------------
			  라일락    100  100  100   100   1    합격 ********** 장학생
              진달래     50   55   60    55   4    불합격 *****
              개나리     95   95   35    75   3    재시험 *******
			  무궁화     80   85   90    85   2    합격 ********
              홍길동     60   40   30    43   5    불합격 ****
              ------------------------------------------------------
		 */
		
		String inName = "/Users/wandu/java202207/sungjuk.txt";
		String outName = "/Users/wandu/java202207/result.txt";
		
		FileReader 	   fr=null;
		BufferedReader br=null;
		
		FileWriter fw=null;
		PrintWriter out=null;
		
		try {
			
			//1)데이터 저장 변수 선언
			String[] name =new String[5];
			int[] kor  = new int[5];
			int[] eng  = new int[5];
			int[] mat  = new int[5];
			int[] aver = new int[5];
			int[] rank = { 1, 1, 1, 1, 1 };
			int size   = name.length;
			int i	   = 0; //행번호	
		
			
			//2)단계 : 데이터 입력 파일(sungjuk.txt) 가져와서 내용을 읽기
			fr=new FileReader(inName);
			br=new BufferedReader(fr);
		
			
			while(true) {
				String line=br.readLine(); //3)엔터(\n)를 기준으로 한줄씩 가져오기
				if(line==null) { //파일의 끝인지? (EOF)
					break;		 //반복문 빠져나감
				}//if end
				//System.out.println(line);
				
				// , 를 기준으로 문자열 분리한 후 1)단계에서 선언한 변수에 저장하기
				//split 사용 할 때
				/*
				 	String[] word=line.split(",");
				 	name[i]=word[0].trim();
				 	kor[i] =Integer.parseInt(word[1].trim());
				 	eng[i] =Integer.parseInt(word[2].trim());
				 	mat[i] =Integer.parseInt(word[3].trim());
				 	i++;; //다음사람
				 	
				 */
				StringTokenizer st=new StringTokenizer(line, ",");
				
				
				while(st.hasMoreElements()) {
					
			 	name[i]=st.nextToken();	
				kor[i]=Integer.parseInt(st.nextToken()); 
				eng[i]=Integer.parseInt(st.nextToken());
				mat[i]=Integer.parseInt(st.nextToken());
				}//while end
				i++;
				}//while end
			
				
				//3)단계: 평균 구하기
				for(i=0; i<size; i++) {
					aver[i]=(kor[i]+eng[i]+mat[i])/3;
				}//for end
				
				
				//4)단계: 등수 구하기
				for(int a=0; a<size; a++) {
					for(int b=0; b<size; b++) {
						if(aver[a]<aver[b]) {
							rank[a]=rank[a]+1;
						}//if end
					}//for end
				}//for end
				
				//true: append모드
				//false : overwrite모드
				fw=new FileWriter(outName, false);
				
				//autoFlush : true 버퍼 클리어
				 out=new PrintWriter(fw, true);
				
				 out.println("			성 / 적 / 결 / 과 ");
				 out.println("----------------------------------------------------------");
					
				 out.println("이름   국어   영어   수학   평균   등수  결과 ");
				 out.println("----------------------------------------------------------");
				

				 //순서대로 출력
				 for(i=0; i<size; i++) {
						out.printf("%-3s %6d %6d %6d %6d %3d  "
		                		,name[i],kor[i],eng[i],mat[i],aver[i],rank[i]);
						
				 //합격, 불합격 여부
				 if(aver[i]>=70) {
					if(kor[i]<40 || eng[i]<40 || mat[i]<40) {
						out.printf("%-5s", "재시험 ");
					}else {
						   out.printf("%-5s", "합  격 ");
					}//if end
					}else {
						out.printf("%-5s", "불합격 ");
					}//if end
						
						
						//별*
						for(int star=1; star<=aver[i]/10; star++) {
							out.printf("%c", '*');
					    }//for end

						
						//평균 95점 이상이면 장학생
						if(aver[i]>=95) {
							out.printf("%-12s", "장학생");
						}//if end
						out.println();// 한사람 출력하고 줄바꿈
				 }//for end
				 System.out.println("result.txt 성적프로그램이 완성되었습니다.");
				 
			 }catch (Exception e) {
				 System.out.println("성적 프로그램 읽고, 쓰기 실패:" + e);
			}finally {
			try {
				if(br!=null) { br.close(); }
			}catch (Exception e) {}
			try{
				if(fr!=null) { fr.close(); }
			}catch (Exception e) {}
		   try {
                if(out!=null) { out.close(); }
            }catch (Exception e) {}
            try {
                if(fw!=null) { fw.close(); }
            }catch (Exception e) {}
            
			}//end
			
	}//main() end
}//class end
