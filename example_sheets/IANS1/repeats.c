/* Fairly terse translation of repeats.hs into  C, for a little speed gain with
 * huge loss of abstraction. */

/* Uses finitely sized integers. */

#include <stdio.h>
#include <stdlib.h>

typedef __int128_t my_int;

/* exponentiation by squaring */
my_int ipow(my_int a, my_int b) {
    my_int half_square;
    if (b == 0) return 1;
    half_square = ipow(a, b/2);
    return half_square * half_square * (b & 1 ? a : 1);
}

/* return i-th element in the sequence of possible divisors */
my_int possible_divisor_seq(my_int i) {
    return ipow(6 * ((i + 1) / 2) - 2 * (i & 1) + 1, 2);
}

/* check 10^n + 1 for square divisors */
void check_squares(int n) {
    my_int sq, i = 0, t = ipow(10, n) + 1;
    printf("n = %d\n", n);
    while ((sq = possible_divisor_seq(++i)) <= t)
        /* just cast to long int and hope for the best */
        if (t % sq == 0) printf("%ld divides 10^%d + 1\n",
                                (long int)possible_divisor_seq(i), n);
}

int main(int argc, char **argv) {
    my_int n, k;
    char* end;
    printf("using %ld-bit integers\n",
           8 * sizeof(my_int));
    if (argc < 2) {
        n = 16;
    } else {
        n = strtol(argv[1], &end, 10);
        if (*end) {
            fprintf(stderr, "Invalid number given\n");
            exit(EXIT_FAILURE);
        }
    }
    for (k = 1; k <= n; k++) {
        check_squares(k);
    }
    return 0;
}
