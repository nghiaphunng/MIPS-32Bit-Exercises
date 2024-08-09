#include <stdio.h>
//Lời giải: BCNN(m, n) = (m * n) / UCLN(m, n)
int main() {
    int m, n;
    scanf("%d%d", &m, &n);
    int tich = m * n;
    while (n != 0) {
        int tmp = n;
        n = m % n;
        m = tmp;
    }
    printf("%d", tich/m);
    return 0;
}