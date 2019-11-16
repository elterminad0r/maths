"""
Same problem, but by generous application of the central limit theorem.

If you have PyPy, I recommend using that to run this rather than CPython.
"""

# whether or not to use my home-brewed libraries
PORTABLE = False
# how often to update progress bar
UPDATE_INTERVAL = 10 ** 4

from random import sample
from collections import Counter

if not PORTABLE:
    import smartparse as argparse
    from progress_bar import format_bar
else:
    import argparse

from brute import longest_consecutive_run

def random_arrangement(n, k):
    """
    Have k people randomly sit around a table of size n.
    """
    indicator = [0] * n
    for i in sample(range(n), k):
        indicator[i] = 1
    return indicator

def get_args():
    """
    Parse argv
    """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("N", type=int, nargs="?", default=10 ** 6,
            help="Number of samples to generate")
    return parser.parse_args()

def main(N):
    """
    Generate lots of random samples and print some nice progress bars.
    """
    run_lengths = Counter()
    for i in range(N):
        run_lengths[longest_consecutive_run(random_arrangement(7, 3), 7)] += 1
        if not PORTABLE and i % UPDATE_INTERVAL == 0:
            print("\r{:7.5f}: {:4.0%} {}".format(
                    run_lengths[3] / max(run_lengths[2] + run_lengths[3], 1),
                    i / N,
                    format_bar(70, i / N, unicode=True)),
                end="")
    print("\r{:7.5f}: {:4.0%} {}".format(
            run_lengths[3] / max(run_lengths[2] + run_lengths[3], 1),
            1,
            format_bar(70, 1, unicode=True)))
    print("Lengths: {}".format(run_lengths))
    print("Total N_3: {}".format(run_lengths[3]))
    print("Total N_2: {}".format(run_lengths[2]))
    print("Proportion N_3 / (N_3 + N_2): {}".format(
        run_lengths[3] / (run_lengths[2] + run_lengths[3])))

if __name__ == "__main__":
    args = get_args()
    main(args.N)
