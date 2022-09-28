package oop0906;

public class Test04_for {

    public static void main(String[] args) {
        //반복문
        
        //1. for문
        for(int a=1; a<=3; a++) {
            System.out.println("JAVA");
        }//for end
        
        //for문에 선언된 변수는 for문에서만 사용가능하다
        //System.out.println(a); 에러
        
        int b=0;
        for(b=1; b<=3; b++) {
            System.out.println("PYTHON");
        }//for end
        
        System.out.println(b);
        ///////////////////////////////////////////////////        
        
        
        //2. while문
        int i=0;
        while(i<=3) {
            System.out.println("SEOUL");
            i++;
        }//while end
        //////////////////////////////////////////////////
        
        
        //3. do~while문
        int j=0;
        do {
            System.out.println("JEJU");
            j++;
        }while(j<=3);
        ///////////////////////////////////////////////////       
        
        
        
        //4. break 와 continue문
        for(int a=1; a<10; a++) {
            if(a==5) {
                break;
            }//if end
            System.out.print(a + " ");
        }//for end        
        
        System.out.println(); //줄바꿈
        
        for(int a=1; a<10; a++) {            
            if(a==5) {
                continue;
            }//if end
            System.out.print(a+ " ");            
        }//for end    
        

    }//main() end
}//class end
