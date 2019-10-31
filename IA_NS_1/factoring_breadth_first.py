"""
Finding 10^n + 1 numbers with square factors by integer factorisation
"""

# import a hopefully fast-ish integer factorisation function
from sympy import factorint

# re-use argv code
from repeats import get_args

def repeats(n):
    """
    Show factors of 10^n + 1 that are even powers of primes
    """
    print("checking n = {}".format(n))
    factors = factorint(10 ** n + 1)
    for fac, power in factors.items():
        for m in range(2, power + 1, 2):
            print("{}^{} divides 10^{} + 1".format(fac, m, n))

def main(n):
    for m in range(n):
        repeats(m)

if __name__ == "__main__":
    args = get_args()
    main(args.n)
