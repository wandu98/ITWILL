package oop0906;

public class Test08_sort {

    public static void main(String[] args) {
        //정렬 Sort
        /*
            - 정렬유형
              오름차순 ascending   1->10  A->Z  a->z  ㄱ->ㅎ
              내림차순 descending
        
            - 정렬방식
              삽입정렬 insertion sort
              선택정렬 selection sort
              버블정렬 bubble sort
              
            - selection sort 알고리즘
              9 8 7 6 5  ->  5 6 7 8 9
            
              9 8 7 6 5
              8 9 7 6 5
              7 9 8 6 5
              6 9 8 7 5
              5 9 8 7 6
              --------------step 1
              5 8 9 7 6
              5 7 9 8 6
              5 6 9 8 7
              --------------step 2
              5 6 8 9 7
              5 6 7 9 8
              --------------step 3
              5 6 7 8 9
              --------------step 4
            
            - bubble sort 알고리즘
            9 8 7 6 5 -> 5 6 7 8 9
            8 9 7 6 5
            8 7 9 6 5
            8 7 6 9 5
            8 7 6 5 9
            -------------step 1
            7 8 6 5 9
            7 6 8 5 9
            7 6 5 8 9
            -------------step 2
            6 7 5 8 9
            6 5 7 8 9
            -------------step 3
            5 6 7 8 9
            -------------step 4
        */
        
        int[] su= {9,8,7,6,5};
        
        //selection sort
        for(int i=0; i<su.length-1; i++) {
        	for(int j=i+1; j<su.length; j++) {
        		if(su[i]>su[j]) {	//오름차순
        			int temp=su[i];
        			su[i]=su[j];
        			su[j]=temp;
        		}//if end
        	}//for end
        }//for end
        
        for(int idx=0; idx<su.length; idx++) {
        	System.out.println(su[idx]);
        }//for end
        
        System.out.println("------------");
        

    }//main() end
}//class end
