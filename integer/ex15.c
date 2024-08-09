#include<stdio.h>
int main(){
    int m, n, q;
    scanf("%d %d %d", &m, &n, &q);
    //xử lý đầu vào
    while(m >= n || q <= m * n){
        scanf("%d %d %d", &m, &n, &q);
    }
    //solve
    int check = 0;
    for(int i = m;i <= n;i++){
        if(q % i == 0){
            printf("%d ", i);
            check = 1;
        }
    }
    if(check == 0) printf("-1");
    return 0;
}