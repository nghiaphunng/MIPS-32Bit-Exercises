#include<stdio.h>
#include<string.h>
int main(){
    char c;
    char c_;
    char str[100];
    scanf("%s", str);
    getchar();
    scanf("%c", &c);
    if(65 <= c && c <= 90){
        c_ = c + 32;
    }
    else c_ = c - 32;
    int cnt = 0;
    for(int i = 0;i < strlen(str);i++){
        if(str[i] == c || str[i] == c_) ++cnt;
    }
    printf("%d", cnt);
    return 0;
}