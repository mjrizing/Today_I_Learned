## Java배열..

import java.util.Scanner;

class Grade {
	//우리반 학생 10명에 대한 점수가 들어있다.
	int[] score; //score이라는 배열을 정수.
	
	public int getTotal() {
		int total = 0;
		for(int index = 0; index < score.length; index++) {
			total += score[index];
		}
		return total;
	}
	
}
public class Practice05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		test2();
	}

	
	public static void test2() {
		int[] level = {1, 2, 3, 4, 5, 6, 5, 4, 3, 2, 1}; //별의 갯수
		//별의 개수를 탐색.
		for(int index = 0; index < level.length; index++) {
			System.out.printf("%d : ", index);
			// 실제 별을 개수만큼 출력.
			for(int star = 0; star < level[index]; star++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	
	
	
	public static void test1() {
		Grade my = new Grade();
		Scanner input = new Scanner(System.in); 
		//int[]jumsu = {100, 90, 80, 70, 60};
		
		
		my.score = new int[5];
		for(int index = 0; index < my.score.length; index++) {
			System.out.print("점수 입력 : ");
			my.score[index] = input.nextInt();
			
		}
		System.out.println("총합 : " + my.getTotal());
	}
	
	
}
