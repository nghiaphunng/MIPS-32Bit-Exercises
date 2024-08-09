#include <stdio.h>

void decToOctal(int n) {
    int octalNum[100];
    int i = 0;

    while (n != 0) {
        octalNum[i] = n % 8;
        n /= 8;
        i++;
    }

    for (int j = i - 1; j >= 0; j--) {
        printf("%d", octalNum[j]);
    }
}

int main() {
    int N;
    scanf("%d", &N);

    decToOctal(N);

    return 0;
}