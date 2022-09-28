package oop0914;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class Test02_Calendar {

	public static void main(String[] args) {
		// 날짜 관련 클래스 (년월일시분초 요일)
		// GregorianCalendar
		// Calendar
		// Date
		
		GregorianCalendar now=new GregorianCalendar();
		
		System.out.println(now.get(1));		//년 
		System.out.println(now.get(2));		//월 		
		System.out.println(now.get(2)+1);	//월 
		System.out.println(now.get(5));		//일 
		System.out.println("--------------------");		
		
		System.out.println(now.get(Calendar.YEAR));		//년 
		System.out.println(now.get(Calendar.MONTH));	//월 		
		System.out.println(now.get(Calendar.MONTH)+1);	//월 
		System.out.println(now.get(Calendar.DATE));		//일
		System.out.println("--------------------");
		
		System.out.println(now.get(Calendar.HOUR));		//시 
		System.out.println(now.get(Calendar.MINUTE));	//분 
		System.out.println(now.get(Calendar.SECOND));	//초
		System.out.println("--------------------");
		
		//24시간을 기준으로 
		System.out.println(now.get(Calendar.HOUR_OF_DAY));		//13
		//요일(1일 2월 3화 4수 5목 6금 7토)
		System.out.println(now.get(Calendar.DAY_OF_WEEK));		//시
		System.out.println("--------------------");
		//////////////////////////////////////////////
		
	
		//날짜 데이터의 연산
		
		//now날짜에 3년 더하기
		now.add(Calendar.YEAR, 3);
		System.out.println(now.get(Calendar.YEAR));
		
		//now날짜에 5달 빼기
		now.add(Calendar.MONTH, -5);
		System.out.println(now.get(Calendar.MONTH));
		
		//now날짜에 7일 더하기 
		now.add(Calendar.DATE, 7);
		System.out.println(now.get(Calendar.DATE));
		System.out.println("--------------------");
		//////////////////////////////////////////
		
		//날짜 데이터 구성하기
		//1998년 9월 14일
		GregorianCalendar myBirth=new GregorianCalendar();
		myBirth.set(Calendar.YEAR, 1998);
		myBirth.set(Calendar.MONTH, Calendar.SEPTEMBER);
		myBirth.set(Calendar.DATE, 14);
		System.out.println("--------------------");
		

	}//main() end
}//class end
