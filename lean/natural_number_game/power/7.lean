lemma pow_pow (a m n : mynat) : (a ^ m) ^ n = a ^ (m * n) :=
  induction n with d hd,
  rw mul_zero,
  repeat {rw pow_zero},

  rwa [pow_succ, hd, mul_succ, pow_add],
end
