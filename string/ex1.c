#include <stdio.h>
#include <string.h>

int main() {
    char str[100];
    scanf("%s", str);
    int check = 1;
    for(int i = 0; i < strlen(str) / 2; i++){
        if (str[i] != str[strlen(str) - i - 1]) {
            check = 0;
            break;
        }
    }
    if(check == 1) printf("Doi xung");
    else printf("Khong doi xung");
    return 0;
}