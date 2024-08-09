#include <stdio.h>

int main() {
    int m, n;
    scanf("%d%d", &m, &n);
    while (n != 0) {
        int tmp = n;
        n = m % n;
        m = tmp;
    }
    printf("%d", m);
    return 0;
}