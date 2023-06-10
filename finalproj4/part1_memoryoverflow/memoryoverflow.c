#include<stdio.h>

long long a[10];
int b[20];

void ignorethis2(){
    scanf("%d%d%d", a, b);
}

void checkthisfunc(){
    memset(a, 2, sizeof(long) * 12);
    memset(b, 2, sizeof(int) * 12);
}

void ignorethis(){
    ignorethis2();
}

int main(){
    ignorethis();
    return 0;
}