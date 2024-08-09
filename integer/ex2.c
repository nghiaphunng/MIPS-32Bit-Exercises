#include <stdio.h>

int main() {
    int N;
    scanf("%d", &N);
    int a = 0, b = 1, c;

    if (N >= 1) {
        printf("%d ", a);
    }
    if (N >= 2) {
        printf("%d ", b);
    }

    c = a + b;
    while (c < N) {
        printf("%d ", c);
        a = b;
        b = c;
        c = a + b;
    }
    
    return 0;
}