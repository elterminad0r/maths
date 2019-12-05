lemma zero_mul (m : mynat) : 0 * m = 0 :=
  induction m with n hn,
  rwa mul_zero,

  rw mul_succ,
  rw hn,
  simp,
end
