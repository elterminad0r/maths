lemma one_pow (m : mynat) : (1 : mynat) ^ m = 1 :=
  induction m with n hn,
  rwa pow_zero,
  rwa [pow_succ, hn, mul_one],
end
