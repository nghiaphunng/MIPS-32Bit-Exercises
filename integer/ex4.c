#include <stdio.h>
int isPerfect(int i) {
    int sum = 0;
    for (int j = 1; j <= i / 2; j++) {
        if (i % j == 0) {
            sum += j;
        }
    }
    return sum == i;
}

int main() {
    int n;
    scanf("%d", &n);

    for (int i = 1; i < n; i++) {
        if (isPerfect(i)) {
            printf("%d\n", i);
        }
    }

    return 0;
}