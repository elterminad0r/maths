"""
Finding numbers of the form 10 ^ n + 1 divisible by a square greater than 1.
"""

#                                          __
# _______   ____  ______    ____  _____  _/  |_  ______
# \_  __ \_/ __ \ \____ \ _/ __ \ \__  \ \   __\/  ___/
#  |  | \/\  ___/ |  |_> >\  ___/  / __ \_|  |  \___ \
#  |__|    \___  >|   __/  \___  >(____  /|__| /____  >
#              \/ |__|         \/      \/           \/
# FIGMENTIZE: repeats

from itertools import count, takewhile
from time import time

from progress_bar import format_bar

def possible_divisors(*, counter=None):
    """
    Generate non-trivial squares that could possibly divide 10 ^ n + 1.
    Yields pairs of roots and squares.

    It's fairly obvious that multiples of 2 and 3 are uninteresting, because
    10 ^ n + 1 is an odd number that is 2 more than a multiple of 3.

    In fact, we only need to check primes so it would be ideal for this to just
    return primes. But then that requires a fair bit of computation and memory
    allocation, so I'm not sure which is actually faster. Obviously I haven't
    bothered to check.

    If a counter is passed, this is added to after each yield. It should be a
    mutable object with an integer at index 0.
    """
    if counter is None:
        for n in count(6, 6):
            yield n - 1, (n - 1) ** 2
            yield n + 1, (n + 1) ** 2
    else:
        for x in possible_divisors(counter=None):
            counter[0] += 1
            yield x

def check_squares(n, *, counter=None):
    """
    Yield square divisors of 10 ^ n + 1
    """
    t = 10 ** n + 1
    yield from filter(lambda x: t % x[1] == 0,
                      takewhile(lambda x: x[1] <= t,
                                possible_divisors(counter=counter)))

def present_search(n, do_count=True, verbose=True):
    """
    Search all 10 ^ m + 1 up to m = n, presenting results.
    """
    if do_count:
        counter = [0]
    else:
        counter = None
    start = time()
    for m in range(1, n + 1):
        verbose and print("checking m = {}".format(m))
        for i, isq in check_squares(m, counter=counter):
            verbose and print("{} divides 10^{} + 1".format(isq, m))
    elapsed = time() - start
    verbose and print("took ~{0:.2f}s =~ {0:.2e}s".format(elapsed))
    if do_count:
        verbose and print("checked {0} =~ {0:.2e} numbers".format(counter[0]))
        verbose and print("~{0:.2e} numbers / s".format(counter[0] / elapsed))

if __name__ == "__main__":
    present_search(16)
