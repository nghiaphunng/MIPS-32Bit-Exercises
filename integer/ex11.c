#include <stdio.h>

int main() {
    int n;
    scanf("%d", &n);
    int res = 1e9;
    while (n != 0) {
        int d = n % 10;
        if(d < res) res = d;
        n /= 10;      
    }
    printf("%d", res);
    return 0;
}