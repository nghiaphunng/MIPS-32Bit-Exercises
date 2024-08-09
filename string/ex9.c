#include<stdio.h>
#include<string.h>
//Nhập vào xâu ký tự. Đếm số nguyên âm trong câu. (Các nguyên âm là a, i, u, e, o)ong xâu
int main(){
    char str[100];
    scanf("%s", str);
    int cnt = 0;
    //đưa chuỗi về kí tự thường 
    for(int i = 0;i < strlen(str);i++){
        if(str[i] >= 65 && str[i] <= 90){
            str[i] += 32;
        }
    }
    for(int i = 0;i < strlen(str);i++){
        if(str[i] == 'a' || str[i] == 'i' || str[i] == 'u' 
        || str[i] == 'e' || str[i] == 'o'){
            ++cnt;
        }
    }
    printf("%d", cnt);
    return 0;
}