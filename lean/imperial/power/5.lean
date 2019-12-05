lemma pow_add (a m n : mynat) : a ^ (m + n) = a ^ m * a ^ n :=
  induction n with d hd,
  rwa [add_zero, pow_zero, mul_one],

  rw add_succ,
  repeat {rw pow_succ},
  rw hd,
  simp,
end
