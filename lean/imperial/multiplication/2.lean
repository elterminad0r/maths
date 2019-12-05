lemma mul_one (m : mynat) : m * 1 = m :=
  rw [one_eq_succ_zero, mul_succ, mul_zero],
  simp,
end
