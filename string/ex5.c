#include<stdio.h>
#include<string.h>
int main(){
    char str1[100];
    char str2[100];
    scanf("%s", str1);
    scanf("%s", str2);
    
    for(int i = 0;i < strlen(str1);i++){
        if(str1[i] >= 65 && str1[i] <= 90){
            str1[i] = str1[i] + 32;
        }
    }
    for(int i = 0;i < strlen(str2);i++){
        if(str2[i] >= 65 && str2[i] <= 90){
            str2[i] = str2[i] + 32;
        }
    }
    if(strlen(str1) != strlen(str2)){
        printf("Khong giong nhau");
        return 0;
    }
    
    int i = 0;
    while(str1[i] != '\0' && str2[i] != '\0'){
        if(str1[i] != str2[i]){
            printf("Khong giong nhau");
            return 0;
        }
        i++;
    }
    printf("Giong nhau");
    return 0;
}