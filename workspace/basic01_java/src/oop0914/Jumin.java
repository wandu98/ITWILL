package oop0914;

import java.util.Calendar;
import java.util.GregorianCalendar;

public class Jumin {

    private String juminno; //주민번호
    
    public Jumin() {}
    public Jumin(String juminno) {
        this.juminno=juminno;
    }
    
    public boolean validate() {
        boolean flag=false;
        //문)주민번호가 맞으면 flag변수값을 true 대입하시오
        Integer[] CHECKNUM= {2,3,4,5,6,7,8,9,2,3,4,5};
        Integer[] save=new Integer[12];
        int hap=0;
        int size=save.length;
                
        for(int i=0; i<size; i++) {
            int num=Integer.parseInt(juminno.substring(i, i+1)); //주민번호에서 한글자씩 가져와서 정수형변환
            save[i]=num*CHECKNUM[i]; //8*2
            hap=hap+save[i];
        }//for end
        
        int M=(11-(hap%11))%10;//오류 검증 번호
        if(M==Integer.parseInt(juminno.substring(12))) { //오류검증번호와 주민번호 마지막 글자와 같은지?
            flag=true;
        }//if end
        
        return flag;
    }//validate() end
    
    
    public void disp() {
        //문)생년월일, 성별, 나이, 띠 출력하기
        /*
            생년월일 : 1989년12월30일
            성별 : 남자
            나이 : 32   -> GregorianCalendar클래스 이용
            띠 :       -> 태어난년도%12 (0원숭이 1닭 2개 ~~~~ 11양)
         */
        
        GregorianCalendar now=new GregorianCalendar();
        int cYear=now.get(Calendar.YEAR);//2022
        
        int myCode=Integer.parseInt(juminno.substring(6,7)); //"1"->1 성별코드
        
        int myYear=0, myMonth=0,myDate=0;
        myYear =Integer.parseInt(juminno.substring(0,2));    //89  태어난 년도
        myMonth=Integer.parseInt(juminno.substring(2,4));    //12  태어난 월
        myDate =Integer.parseInt(juminno.substring(4,6));    //30  태어난 일
        
        switch(myCode) {
        case 1 :
        case 2 : myYear=1900+myYear; break;
        case 3 :
        case 4 : myYear=2000+myYear; break;
        }//switch end
        
        int myAge=cYear-myYear; //나이 구하기
        
        String gender="";
        switch(myCode%2) {
        case 0 : gender="여자"; break;
        case 1 : gender="남자"; break;
        }//switch end
        
        String[] animal = {"원숭이","닭","개","돼지","쥐","소","호랑이","토끼","용","뱀","말","양"};
        
        System.out.println("주민번호: "+juminno);
        System.out.println("생년월일: "+myYear+"년"+myMonth+"월"+myDate+"일");
        System.out.println("나이: "+myAge);
        System.out.println("성별: "+gender);
        System.out.println("띠 : " + animal[myYear%12]);
        
    }//disp() end
    
}//class end
