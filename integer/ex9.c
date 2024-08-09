#include<stdio.h>
int main(){
    int n;
    scanf("%d", &n);
    int tong_le = 0, tong_chan = 0;
    while(n != 0){
        int d = n % 10;
        if(d % 2 == 0) tong_chan += d;
        else tong_le += d;
        n /= 10;
    }
    printf("%d %d", tong_chan, tong_le);
    return 0;
}