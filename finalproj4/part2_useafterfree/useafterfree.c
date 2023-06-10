#include<stdlib.h>
#include<stdio.h>

__attribute__((noinline))
void use(char* obj){
    printf("%c", obj);
}

int main(){
    char* obj1 = (char*)malloc(sizeof(char) * 10);
    char* obj2 = (char*)malloc(sizeof(char) * 10);
    free(obj1);
    use(obj1);
    use(obj2);
    return 0;
}