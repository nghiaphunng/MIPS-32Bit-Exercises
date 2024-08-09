#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    while (n <= 0) {
        printf("Nhap lai: ");
        scanf("%d", &n);
    }
    int arr[n];
    int res_value = 0;
    int res_index = -1;

    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);

        if (arr[i] > 0 && (res_index == -1 || arr[i] < res_value)) {
            res_value = arr[i];
            res_index = i;
        }
    }

    // In ra vị trí và giá trị của phần tử dương nhỏ nhất
    if (res_index != -1) {
        printf("%d\n", res_index);
        printf("%d\n", res_value);
    } else {
        printf("Khong co phan tu duong\n");
    }

    return 0;
}
