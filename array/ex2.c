#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    //xử lý đầu vào nhập n<= 0
    while(n <= 0){
        printf("Nhap lai: ");
        scanf("%d", &n);
    }
    int arr[n];
    for(int i = 0;i < n;i++) scanf("%d", &arr[i]);
    int res = -1e9; 
    int res_index = 0;
    for(int i = 0;i < n -1;i++){
        int d = arr[i] * arr[i + 1];
        if(d > res){
            res = d;
            res_index = i;
        }
    }
    printf("%d %d", arr[res_index], arr[res_index + 1]);
    return 0;
}
