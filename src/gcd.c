extern int getint();
extern void putint(int a );
extern void putch(int a);

int gcd(int a, int b) {
	if (a == b){ return a; 	}
	else if (a > b) { return gcd(a - b, b); }
		else return gcd(b - a, a);
}

const int LF = 10;

int main(){
    int a,b;
    a = getint();
    b = getint();
    putint(gcd(a,b));
    putch(LF);
    return 0;
}
