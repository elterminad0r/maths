"""
Searching for associative anticommutative operations
"""

import sys
import time

import itertools

import argparse

PROGRESS_INTERRUPT = 1e5

def generate_operations(s):
    """
    Generate all the operations on a set s.
    """
    for outputs in itertools.product(s, repeat=len(s) ** 2):
        mapping = {}
        for input_, output in zip(
                itertools.product(s, repeat=2),
                outputs):
            mapping[input_] = output
        yield mapping

def is_assoc(o, s):
    """
    Check if operation is associative with respect to some set.
    """
    return all(o[o[a, b], c] == o[a, o[b, c]]
            for a, b, c in itertools.product(s, repeat=3))

def is_acomm(o, s):
    """
    Check if operation is anticommutative with respect to some set.
    """
    return (all(o[a, b] != o[b, a] for a, b in itertools.combinations(s, 2)) and
            all(o[a, a] == o[a, a] for a in s))

def fmt_operation(o):
    """
    Format operation as string.
    """
    return "\n".join(itertools.starmap("({0[0]}, {0[1]}) -> {1}".format,
                                       o.items()))

# TODO: finish writing this
def cayley_table(o, s):
    """
    Format operation on set as "Cayley table".
    """
    w = max(map(len, map(str, s)))
    n = len(s)
    return "{:{w}} | {}\n{}\n{}".format(
            "×", "|".join("{:{w}} ".format(n, w=w) for n in s).strip(),
            "{}+{}".format((w + 1) * "-", (n * w) * "-"),
            "\n".join("{:{w}} | {}".format(
                n, " ".join("{:{w}}".format(o[n, m], w=w) for m in s), w=w)
                for n in s),
            w=w)

def find_assoc_acomm(n):
    """
    Find associative anticommutative operations
    """
    print("finding associative anticommutative operations on {{1, ..., {}}}"
            .format(n))
    s = range(n)
    ops = generate_operations(s)
    N = n ** (n ** 2)
    w = len(str(N))
    start = time.time()
    for prog, o in enumerate(ops):
        if prog % PROGRESS_INTERRUPT == 0:
            print("\r{:{}}/{} ({:6.1%}), {:4.1e}/s".format(
                        prog, w, N, prog / N, prog / (time.time() - start)),
                    file=sys.stderr, end="")
        if is_assoc(o, s) and is_acomm(o, s):
            print()
            print(fmt_operation(o))

def get_args():
    """
    Parse argv
    """
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("n", type=int, nargs="?", default=3,
            help="size of set to consider")
    return parser.parse_args()

if __name__ == "__main__":
    args = get_args()
    find_assoc_acomm(args.n)
