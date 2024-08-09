#include <stdio.h>

int main() {
    int size;
    scanf("%d", &size);
    //xử lý đầu vào nhập n<= 0
    while(size <= 0){
        printf("Nhap lai: ");
        scanf("%d", &size);
    }
    int arr[size];
    for(int i = 0;i < size;i++) scanf("%d", &arr[i]);
    int m,n;
    scanf("%d%d", &m, &n);
    int cnt = 0;
    for(int i = 0;i < size;i++){
        if(arr[i] >= m && arr[i] <= n) ++cnt;
    }
    printf("%d", cnt);
    return 0;
}
