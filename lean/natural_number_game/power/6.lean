lemma mul_pow (a b n : mynat) : (a * b) ^ n = a ^ n * b ^ n :=
  induction n with d hd,
  repeat {rw pow_zero},
  simp,

  repeat {rw pow_succ},
  rw hd,
  simp,
end
