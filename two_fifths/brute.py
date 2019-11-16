# ________      /\.________
# \_____  \    / /|   ____/
#  /  ____/   / / |____  \
# /       \  / /  /       \
# \_______ \/ /  /______  /
#         \/\/          \/
# FIGMENTIZE: 2/5

"""
Three red counters and four blue counters are arranged in a circle.

What is the probability that all three red counters are next to each other,
**given that** two red counters are next to each other?

Solve this by generating all 3-subsets of a 7-set, and counting the various
adjacency sizes in those. This is allowable as 7 is prime, so by cycling, each
such combination corresponds to exactly 6 other combinations - ie everything is
counted 7 times. (sort of like in Cauchy's theorem)
"""

from itertools import combinations
from collections import Counter
from fractions import Fraction

def longest_consecutive_run(members, n):
    """
    `members` is an indicator map of integers in {0,...,n - 1}, indicating
    whether or not they have been selected.

    This returns the length of the longest sequence of consecutive selected
    integers, allowing for wrapping around the end of the list.
    """
    try:
        # first false element, backwards from the end of the range
        start = next(i for i in reversed(range(n)) if not members[i])
    except StopIteration:
        return n
    longest_run = current_run = 0
    for i in range(n):
        if members[(i + start) % n]:
            current_run += 1
        else:
            longest_run = max(current_run, longest_run)
            current_run = 0
    longest_run = max(current_run, longest_run)
    return longest_run

def indicated_combinations(n, k):
    """
    Return all ways to pick a k-set from an n-set, represented by an array of
    truthy values of length n.
    """
    # - This singleton list is mutated and yielded, in order not to waste too
    #   much memory.
    # - * is safe as integers are immutable
    # - I'm using integers so it's easier to skim when debugging
    indicator = [0] * n
    for combination in combinations(range(n), k):
        for i in combination:
            indicator[i] = 1
        yield indicator
        for i in combination:
            indicator[i] = 0

def main():
    """
    Efficiently calculate proportions, but also print out every combination for
    testing purposes.
    """
    for combination in indicated_combinations(7, 3):
        print("{}: {}".format("".join(map(str, combination)),
                              (longest_consecutive_run(combination, 7))))
    run_lengths = Counter(longest_consecutive_run(combination, 7)
            for combination in indicated_combinations(7, 3))
    print("Lengths: {}".format(run_lengths))
    print("Total N_3: {}".format(run_lengths[3]))
    print("Total N_2: {}".format(run_lengths[2]))
    print("Proportion N_3 / (N_3 + N_2): {}".format(
        Fraction(run_lengths[3], run_lengths[2] + run_lengths[3])))

if __name__ == "__main__":
    main()
