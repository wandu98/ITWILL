package net.testbean;

public class CalcBean {
    
    public int abs(int su){  //절대값 구하기
        return Math.abs(su);
    }//abs() end
    
    public long fact(int su){ //팩토리얼값 구하기
        return (su==0) ? 1 : su*fact(su-1);    
    }//fact() end
    
}//class end