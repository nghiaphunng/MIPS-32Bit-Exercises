#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    while (n <= 0) {
        printf("Nhap lai: ");
        scanf("%d", &n);
    }
    int arr[n];
    for (int i = 0; i < n; i++) {
        scanf("%d", &arr[i]);
    }

    int maxOdd = -1e9;
    int minEven = 1e9;

    //tìm maxOdd và minEven
    for (int i = 0; i < n; i++) {
        if (arr[i] % 2 != 0 && arr[i] > maxOdd) {
            maxOdd = arr[i];
        }
    }

    for (int i = 0; i < n; i++) {
        if (arr[i] % 2 == 0 && arr[i] > maxOdd && arr[i] < minEven) {
            minEven = arr[i];
        }
    }
    //print
    if (minEven == 1e9) {
        printf("Khong tim thay\n");
    } else {
        printf("%d\n", minEven);
    }

    return 0;
}
