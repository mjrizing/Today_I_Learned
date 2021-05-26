//2차원배열

#include<stdio.h>

int main() {
	int array1[2][3] = {
		{1,2,3}, //0행 0열은 1, 0행1열은 2, 0행2열은 3
		{4,5,6}
	}; //2행 3열의 배열을 선언, 초기화.
	int array2[2][3] = { 1,2,3,4,5,6 };
	//2차원 배열 초기화
	int sum[2][3]; //합계를 나타낼 배열선언.
	int a = 0;
	int b = 0;

	/*printf("%d %d %d\n", array1[0][0], array1[0][1], array1[0][2] );
	printf("%d %d %d\n", array1[1][0], array1[1][1], array1[1][2] );*/

	for (int i = 0; i < 2; i++) {//변수 i는 행을 나타냄.
		for (int j = 0; j < 3; j++) { //j열
			printf(" %d", array1[i][j]);
		}
		printf("\n");
	}
	for (int i = 0; i < 2; i++) {//변수 i는 행을 나타냄.
		for (int j = 0; j < 3; j++) { //j열
			printf(" %d", array2[i][j]);
		}
		printf("\n");
	}
	for (int i = 0; i < 2; i++) {//변수 i는 행을 나타냄.
		for (int j = 0; j < 3; j++) { //j열
			sum[i][j] = (array1[i][j] + array2[i][j]);
			printf(" %d", sum[i][j]);
		}
		printf("\n");
	}
	for (int j = 0; j < 2; j++) {//변수 i는 행을 나타냄.
		a += array1[0][j] + array2[0][j];
	}
	for (int j = 0; j < 3; j++) { //j열
		b += array1[1][j] + array2[1][j];
		}
		printf("%d\n", b);
	}
	// array1 + array2 0행의 합. 배열1 1,2,3 배열2 1, 2, 3 즉 결과값 12나오도록
	// array1 + array2 1행의 합. 배열1 4,5,6 배열2 4,5,6 즉 결과값 30나오도록

----------------------------------------------

#include <stdio.h>

int main() {

	/*int a = 10;
	char b[10];

	scanf_s("%d", &a);
	printf("%d\n", a);
	scanf_s("%s", b, 10);
	printf("%s\n", b);*/

	int a[3] = { 1, 2, 3 };
	printf("a라는 배열 이름 주소: %x\n", a);
	printf("a배열의 [0]요소의 주소 : %x\n", &a[0]);
	printf("a배열의 [1]요소의 주소 : %x\n", &a[1]);
	printf("a배열의 [2]요소의 주소 : %x\n", &a[2]);

	printf("%d %d %d \n", a[0], a[1], a[2]);
	int* A = &a;
	printf("%d %d %D \n", *A, *(A+1), *(A+2));
	A++;//증가되는 값은 자료형에 따라 증가
	// int형 포인터변수 4증가
	// double형 포인터변수 8증가
	// char형 포인터변수 1증가
	printf("%x\n", A);
	printf("%d\n", *A);
	double b[2] = { 1.1, 2.2 };
	double* B = &b;
	B++;
	printf("B++의 결과는 %f\n", *B);

	
	int num1 = 10, num2 = 20, num3 = 30;
	int* arr[3] = { &num1, &num2, &num3 };
	printf("%d\n", *arr[0]);
	printf("%d\n", *arr[1]);
	printf("%d\n", *arr[2]);



}

----------------------------------------------

#include <stdio.h>

void arr(int *A, int len) {
	for (int i = 0; i < len; i++) {
		printf("%d", A[i]);
	}
	printf("\n");
}

int main() {
	int a[3] = { 1, 2, 3 };
	int b[5] = { 11, 12, 13, 14, 15 };

	arr(a, sizeof(a)/sizeof(int));
	arr(b, sizeof(b)/sizeof(int));
}

// 정수형 입력, 실수형 입력, for문 while문 if문 같은 문제
// 증가연산자 산술연산자 논리연산자 관련 문제출제할것.
