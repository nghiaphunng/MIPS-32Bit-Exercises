#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    while (n <= 0) {
        printf("Nhap lai: ");
        scanf("%d", &n);
    }

    int arr[n];
    int sum_odd = 0; //tổng lẻ
    int sum_ne = 0; //tổng âm
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);

        // Tính tổng lẻ
        if (arr[i] % 2 != 0) {
            sum_odd += arr[i];
        }

        // Tính tổng âm
        if (arr[i] < 0) {
            sum_ne += arr[i];
        }
    }

    // In tổng các phần tử lẻ và tổng các phần tử âm
    printf("%d\n", sum_odd);
    printf("%d\n", sum_ne);

    return 0;
}
