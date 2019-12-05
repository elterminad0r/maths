lemma mul_comm (a b : mynat) : a * b = b * a :=
  induction b with n hn,
  rwa [mul_zero, zero_mul],

  rwa [mul_succ, succ_mul, hn],
end
