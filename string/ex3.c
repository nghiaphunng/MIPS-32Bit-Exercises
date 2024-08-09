#include<stdio.h>
int main(){
    char str[100];
    int freq[256] = {0};
    scanf("%s", str);
    int max_freq = 0;
    char c_res;
    int i = 0;
    while(str[i] != '\0'){
        freq[str[i]] += 1;
        if(freq[str[i]] > max_freq){
            max_freq = freq[str[i]];
            c_res = str[i];
        }
        ++i;
    }
    printf("%c ", c_res);
    return 0;
}