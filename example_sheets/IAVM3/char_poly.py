import sympy
t = sympy.symbols("t")
print(sympy.expand((7 - t) * (-19 - t) * (13 - t) - 1440 - 1440
                   - (-120 * (13 - t) + 72 * (-19 - t) - 240 * (7 - t))))
# -t**3 + t**2 + t - 1
