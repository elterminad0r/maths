lemma zero_mul (m : mynat) : 0 * m = 0 :=
  induction m with n hn,
  rw mul_zero,
  refl,

  rw mul_succ,
  rw hn,
  simp,
end
