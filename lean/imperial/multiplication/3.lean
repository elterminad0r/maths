lemma one_mul (m : mynat) : 1 * m = m :=
  induction m with n hn,
  rwa mul_zero,

  rw [mul_succ, hn, one_eq_succ_zero, add_succ],
  simp,
end
