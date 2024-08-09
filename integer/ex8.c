#include<stdio.h>
int main(){
    int n;
    scanf("%d", &n);
    int i = 1;
    while(i < n){
        if(i * i < n){
            printf("%d ", i * i);
        }
        ++i;
    }
    return 0;
}