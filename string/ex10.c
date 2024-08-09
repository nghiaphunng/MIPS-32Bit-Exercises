#include<stdio.h>
#include<string.h>
//Nhập vào xâu ký tự. Đếm số nguyên âm trong câu. (Các nguyên âm là a, i, u, e, o)ong xâu
int main(){
    char str[100];
    scanf("%s", str);
    int sum_char = 0, sum_num = 0;
    for(int i = 0;i < strlen(str);i++){
        if((str[i] >= 65 && str[i] <= 90) ||
        (str[i] >= 97 && str[i] <= 122)){
            sum_char += (str[i]);
        }
        else if(str[i] >= 48 && str[i] <= 57){
            sum_num += (str[i] - 48);
        }
    }
    printf("%d %d", sum_num, sum_char);
    return 0;
}