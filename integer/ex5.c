#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int n_ = 0; // n đảo 
    int tmp = n;
    int cnt = 0; //đếm số chữ số của n
    while(tmp != 0){
        int d = tmp % 10;
        n_ = n_ * 10 + d;
        tmp /= 10;
        cnt++;
    }
    int i = cnt/2; //chỉ số ở giữa 
    int tong_trai = 0, tong_phai = 0;
    for(int j = 0;j < i;j++){
        int d1 = n % 10;
        tong_phai += d1;
        n /= 10;
        int d2 = n_ % 10;
        tong_trai += d2;
        n_ /= 10;
    }
    if(tong_phai == tong_trai) printf("So may man");
    else printf("Khong phai so may man");
    printf("\n%d %d", n, n_);
    return 0;
}
