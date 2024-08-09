#include<stdio.h>
#include<string.h>
//Nhập vào xâu ký tự. Đếm số ký tự chữ hoa, chữ thường và chữ số có trong xâu
int main(){
    char str[100];
    scanf("%s", str);
    int cnt_up = 0, cnt_low = 0, cnt_num = 0;
    for(int i = 0;i < strlen(str);i++){
        if(str[i] >= 65 && str[i] <= 90){
            ++cnt_up;
        }
        else if(str[i] >= 90 && str[i] <= 122){
            ++cnt_low;
        }
        else if(str[i] >= 48 && str[i] <= 57){
            ++cnt_num;
        }
    }
    printf("%d %d %d", cnt_up, cnt_low, cnt_num);
    return 0;
}