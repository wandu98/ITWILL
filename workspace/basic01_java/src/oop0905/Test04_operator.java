package oop0905;

public class Test04_operator {

    public static void main(String[] args) {
        //연산자
        //산술, 비교(관계), 논리연산자
        //삼항, 대입, 1증감연산자

        
        System.out.println(5/3); //1
        System.out.println(5%3); //2
        
        System.out.println(3/5); //0
        System.out.println(3%5); //3
        
        System.out.println(3.0/5.0); //0.6
        System.out.println(3/5.0);   //0.6
        System.out.println(3.0/5);   //0.6
        System.out.println(3/5.);    //0.6
        ///////////////////////////////////////////////////
        
        
        //bit 연산자
        
        //1)비트곱, 비트합 연산자
        System.out.println(5&3); //1
        System.out.println(5|3); //7
        /*
            2진수 : 0 1
            8진수 : 0 1 2 3 4 5 6 7
           10진수 : 0 1 2 3 4 5 6 7 8 9       
           16진수 : 0 1 2 3 4 5 6 7 8 9 a b c d e f
           
                                   128 64 32 16 8 4 2 1
           10진수 5를 2진수 변환 ->                   1 0 1
           10진수 3을 2진수 변환 ->                     1 1
           10진수 9을 2진수 변환 ->                  1 0 0 1 
           10진수 35을 2진수 변환->            1  0  0 0 1 1
           
           5 ->      00000101       00000101
           3 ->    & 00000011     | 00000011
                   ----------     ----------
                     00000001       00000111
        */
        
        //2)비트 부정 연산자
        System.out.println(~5);
        
        
        //3)shift연산자
        
        //3은 이동 bit 수
        System.out.println(16<<3); //left shift   16*2의3승  
        System.out.println(16>>3); //right shift  16/2의3승
        /*
           16를 2진수로 변환       00010000        00010000
                           <<3 10000000     >>3 00000010        
        */
        

    }//main() end
}//class end
