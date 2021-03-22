
### 1차원 배열, 2차원 배열, 3차원 배열


#include <stdio.h>

int main() {
	int a[5] = { 5,6,3,8,1 }; //5개의 칸을 갖는 배열 a를 선언.
	int temp;

	for (int i = 0; i < 5; i++) {
		for (int j = i+ 1; j < 5; j++) {
			if (a[i] < a[j]) {
				temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}

		}
	}
	
	for (int i = 0; i < 5; i++) {
		printf("%d ", a[i]);
	}



}


--------------------------------------------------------
//숫자야구

#include <stdio.h>
#include <stdlib.h> //프로그래밍언어에서 제공해주는 표준 라이브러리
#include <time.h> //시간과 관련된 함수가 저장.
#include <windows.h>

int main() {
	
	int ball[3];
	int user[3];
	int temp;//랜덤한값
	int s=0, b=0;
	int count = 1;

	srand((unsigned)time(NULL));
	for (int i = 0; i < 3; i++) {
		temp = (rand() % 9) + 1; //랜덤한값이 rnad()부분에 들어가게된다. 1부터 9까지
		ball[i] = temp;
		for (int j = 0; j < i; j++) {
			if (temp == ball[j] && i != j) {
				i--;
			}
		}
	}
	printf("%d %d %d \n", ball[0], ball[1], ball[2]);
	while(1) {
		while(1) {
			printf(" %d 회차");
			printf("1부터 9까지의 숫자를 입력하세요.");
			scanf_s("%d", &user[0]);
			scanf_s("%d", &user[1]);
			scanf_s("%d", &user[2]);

		if (user[0] < 1 || user[0] > 9 || user[1] < 1 || user[1] > 9 || user[2] < 1 || user[2] > 9) {
			printf("잘못된 값을 입력하셨습니다.\n");
			continue; //잘못된 값 입력후 다시 반복문으로 올라가기위해
		}
		else if (user[0] == user[1] || user[0] == user[2] || user[1] == user[2]) {
			printf("중복된 값을 입력하셨습니다.\n");
			continue; //중복된 값 입력후 다시 반복문으로 올라가기위해
		}
		break;
	}
		s = 0;
		b = 0;

		for (int i = 0; i < 3; i++) {
			for (int j = 0; j < 3; j++) {
				if (ball[i] == user[j])
					if (i == j) {
						s++;
					}
					else {
						b++;
					}
			}
		}
		system("cls");
		printf("[결과]스트라이크 : %d, 볼 : %d\n", s, b);
		if (s == 3) {
			printf("****승리****\n");
			break;
		}
		else if (count == 9) {
			printf("****패배****\n");
			break;
		
		}
	}
}

--------------------------------------------------------

#include <stdio.h>

int main() {
	int a = 0; //변수 선언과 초기화
	int b[5] = { 1,2,3,4,5 }; //1차원 배열선언과 초기화
	int c[2][5] = {  //2차원 배열선언과 초기화
		{1,2,3,4,5},
		{6,7,8,9,0}
	};

	printf("%d %d %d %d %d \n", c[0][0], c[0][1], c[0][2], c[0][3], c[0][4]);
	printf("%d %d %d %d %d \n", c[1][0], c[1][1], c[1][2], c[1][3], c[1][4]);
}
