#include<stdio.h>
int isPrime(int i){
    if(i <= 1) return 0;
    for(int j = 2;j < i;j++){
        if(i % j == 0){
            return 0;
        }
    }
    return 1;
}

void print(int n){
    for(int i = 2;i < n;i++){
        if(isPrime(i)){
            printf("%d ", i);
        }
    }
}
int main(){
    print(15);
    return 0;
}