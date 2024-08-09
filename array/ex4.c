#include<stdio.h>
int main(){
    int n;
    scanf("%d", &n);
    int arr[n];
    for(int i = 0;i < n;i++) scanf("%d", &arr[i]);
    //solve
    for(int i = 0;i < n - 1;i++){
        if(arr[i] >= 0) continue; //bỏ qua phần tử >= 0
        for(int j = i + 1;j < n;j++){
            if(arr[j] < 0 && arr[i] < arr[j]){
                int tmp = arr[i];
                arr[i] = arr[j];
                arr[j] = tmp;
            }
        }
    }
    //in mảng
    for(int i = 0;i < n;i++){
        printf("%d ", arr[i]);
    }
    return 0;
}