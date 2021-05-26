#1
#include <stdio.h>
int main(void)
{
    int num;

    printf("5의 배수 : ");
    for (num = 1; num <= 100; num++)
    {
        if (num % 5 == 0)
            printf("%3d \n", num);
    }
    return 0;
}


--------------------------------------------------------------------------
#2
#include <stdio.h>

int main() {
	int a = 1;

	while (a <= 10) 
	{
		if (a % 3 == 0) // =하나는 대입연산자 == 가 같다라는 의미
			{
			printf(" 짝 ");
		}
		else if (a % 5 == 0) {
			printf(" ! ");
		}
		else{
			printf(" %d ", a);
		}
		a++;
	}
	return 0;
}


--------------------------------------------------------------------------
#3
#include <stdio.h>

int main() {

	int a;
	int sum = 0;

	for (int i = 1; i < 6; i++)
	{
		printf("%d번 과목의 점수는?(0은 종료)\n", i);
		scanf_s("%d", &a);
		if(a == 0) {
			break;
		}

		sum = a + sum;
	}
	printf("누적값은 : %d,\n 평균은 : %d\n", sum, sum / 5);
}


--------------------------------------------------------------------------
#4
#include <stdio.h>
//누적계산
// 값을 입력하세요.
int main() {
	int a;
	int sum = 0;

	while(1) { //무한대로 동작
	printf("값을 입력하세요.(1~9)\n");
	scanf_s("%d", &a);

		if (a == 10)
		{
			break; //반복문을 종료
		}
		else if	(a >= 10)
		{
			printf("값이 잘못입력되었습니다.\n");
			continue; //반복문을 다시실행
		}
		sum += a;
	}
	printf("합계는 %d\n", sum);
}


--------------------------------------------------------------------------
#5
#incldue <stdio.h>
int num=5;
for(int i=0;i<num;i++){
    for(int j=num-1;j>i;j--){
    printf(" ");
    }

    for(int j=0;j<2*i+1;j++){
    printf("*");
    }
    printf("\n");
}

for(int i=1;i<num;i++){
   for(int j=0;j<i;j++){
     printf(" ");
   }

    for(int j=2*num-1;j>2*i;j--){
         printf("*");
    }
    printf("\n");
}


--------------------------------------------------------------------------
#6

#include <stdio.h>

int main(void) {

	int a[10] = { 9, 8, 5, 7, 2, 1, 3, 4, 6, 0 };

	int i, j, temp;

	for (i = 0; i < 10; i++) {
		for (j = 0; j < 10; j++) {
			if (a[i] < a[j]) {
				temp = a[i];
				a[i] = a[j];
				a[j] = temp;
			}
		}
	}		
	for (i = 0; i < 10; i++){

		printf("%d ", a[i]);
	}
}


--------------------------------------------------------------------------
#7
#include<stdio.h>
int main() {

	int num[10];
	int num2[10] = { 0 };
	int p = 0, q = 9;

	for (int i = 0; i < 10; i++) {
		scanf_s("%d", &num[i]);

		for (int i = 0; i < 10; i++) {
			if (num[i] % 2 == 0) {
				num2[q] = num[i];
				q--;
			}
			else {
				num2[p] = num[i];
				p++;
			}
		}
	}
	for (int i = 0; i < 10; i++) {
		printf("%d", num2[i]);
	}
}


--------------------------------------------------------------------------
#8
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
}



