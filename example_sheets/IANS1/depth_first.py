"""
Try instead very deep searched for small square factors.

Can use nice modular exponentiation here.
"""

from itertools import islice

from sympy import factorint

from repeats import possible_divisors

import smartparse as argparse

def fmt_factorint(n):
    """
    Nicely format an integer's factorisation
    """
    return " * ".join("{}^{}".format(a, b) for a, b in factorint(n).items())

def search(n, upper_bound):
    """
    Search for numbers of the form 10^n + 1 that are a multiple of n^2, using
    modular exponentiation (so little memory requirements)
    """
    print("searching {}^2".format(n))
    sq = n ** 2
    for i in range(1, upper_bound + 1):
        if pow(10, i, sq) == sq - 1:
            print("{}^2 divides 10^n + 1 where n = {} = {} = {}"
                    .format(n, i, "{} * {}".format(n, i / n), fmt_factorint(i)))

def get_args():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("n", nargs="?", type=int, default=100,
            help="Number of squares to check")
    parser.add_argument("--max", type=int, default=1000,
            help="Largest exponent of 10 to check")
    return parser.parse_args()

if __name__ == "__main__":
    args = get_args()
    for i, _ in islice(possible_divisors(), args.n):
        search(i, args.max)
