lemma add_mul (a b t : mynat) : (a + b) * t = a * t + b * t :=
  induction t with n hn,
  repeat {rw mul_zero},
  simp,

  repeat {rw mul_succ},
  rw hn,
  simp,
end
