lemma mul_add (t a b : mynat) : t * (a + b) = t * a + t * b :=
  induction a with n hn,
  rw mul_zero,
  simp,

  rw succ_add,
  repeat {rw mul_succ},
  rw hn,
  simp,
end
