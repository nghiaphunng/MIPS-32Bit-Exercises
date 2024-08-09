//Nhập mảng số nguyên từ bàn phím. In ra tổng các phần tử chẵn và tổng các phần tử dương trong mảng. 
#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);

    int arr[n];
    int sum_even = 0, sum_positive = 0;
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
        if (arr[i] % 2 == 0) {
            sum_even += arr[i];
        }
        if (arr[i] > 0) {
            sum_positive += arr[i];
        }
    }

    printf("%d\n", sum_even);
    printf("%d\n", sum_positive);

    return 0;
}
