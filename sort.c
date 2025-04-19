extern int bubblesort(int *a, int n);
extern void putint(int n);
extern void putch(char c);
extern int getint();
extern int getch();

int main(){
    int n = 10;
    int a[10]; // ={4, 3, 9, 2, 0, 1, 6, 5, 7, 8};
    int i = 0;
    while (i < n) {
        a[i] = getint();
        i = i + 1;
    }
    i = bubblesort(a, 10);
    while (i < n) {
        putint(a[i]);
        putch(32);
        i = i + 1;
    }
    putch(10);
    return 0;
}
 