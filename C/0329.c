#include <stdio.h>
struct group // 구조체 group 선언.
{
	int a; //멤버 변수 a.
	double b; //멤버 변수 b.

}; //구조체는 마지막에 ;을 넣어야함.


int main() {
	
	struct group g1, g2; //g1 이라는 구조체변수에 멤버변수 a,b 만들어짐. g2또한 마찬가지.


	g1.a = 10;
	g1.b = 3.14;

	g2.a = 20;
	g2.b = 6.666;
	
	scanf_s("%d", &g1.a);
	scanf_s("%lf", &g1.b);

	printf("g1.a의 값은 %d\n", g1.a);
	printf("g1.b의 값은 %f\n", g1.b);
	printf("g2.a의 값은 %d\n", g2.a);
	printf("g2.b의 값은 %f\n", g2.b);



}




------------------------------------------------------------------------------------------------------------------------
#include <stdio.h>

struct point
{
	int x;
	int y;
};

int main() {
	struct point p1 = { 10, 20 };
	struct point p2 = { 5, 6 };
	struct point p3 = { 0, 0 };
	//구조체 변수 초기값 지정시 반드시 선언과 함께 사용.
	p2.x = p1.x;

	p3.x = p1.x - p2.x;
	p3.y = p1.y - p2.y;

	printf("%d %d\n", p1.x, p1.y);
	printf("%d %d\n", p2.x, p2.y);
	printf("%d %d\n", p3.x, p3.y);




}
------------------------------------------------------------------------------------------------------------------------
# include <stdio.h>

struct score { //3. score s 구조체변수 안에는 math, english, total이 들어있다.

	double math;
	double english;
	double total;
};
struct student { //2. no라는 변수가 만들어져있고, score s라는 구조체변수가 하나 더있음.
	int no;
	struct score s; //student구조체변수 안에 s라고하는 구조체변수 만듬.
};


int main() {

	struct student stu; // 1.student라는 구조체변수 만듬.

	stu.no = 12345678;
	stu.s.math = 90;
	stu.s.english = 80;
	stu.s.total = stu.s.math + stu.s.english;

	printf("학번 : %d\n", stu.no);
	printf("총점 : %.1lf\n", stu.s.total);
}

------------------------------------------------------------------------------------------------------------------------
#include <stdio.h>

struct student { //구조체안에 배열 선언가능.
	char no[10];
	char name[20]; //멤버변수로 배열사용.

};




int main() {
	struct student stu[2] ={
	{ "12345678", "김" }, // 1번 배열
	{ "098765", "박" } // 2번 배열
}; //c언어는 main함수부터 시작.


	printf("학번: %s, 이름: %s\n", stu[0].no, stu[0].name);
	printf("학번: %s, 이름: %s\n", stu[1].no, stu[1].name);


}

#include <stdio.h>

struct student {
	char name[20]; //이름
	char no[20]; //학번
	char add[20]; //주소
};


------------------------------------------------------------------------------------------------------------------------
int main() {
	FILE* fp; //파일포인터
	struct student stu[3]; //크기는 3만큼 즉,3명의 정보를 저장.

	for (int i = 0; i < 3; i++) {
		printf("****%d 번째 학생정보****\n", i+1);
		printf("이름은:");
		scanf_s("%s", stu[i].name, 20); //문자열을 지정하기때문에 크기 지정해줘야한다.
		printf("학번은:");
		scanf_s("%s", stu[i].no, 20);
		printf("주소는:");
		scanf_s("%s", stu[i].add, 20);
	}
	for (int i = 0; i < 3; i++) {
		printf("****%d 번째 학생정보****\n", i + 1);
		printf("이름 : %s, 학번: %s, 주소: %s\n", stu[i].name, stu[i].no, stu[i].add);
	}
	fp = fopen("data1.txt", "w"); // data1.txt를 fp에 저장하여라.
	

	fclose(fp); //fp를 닫는다.
}
