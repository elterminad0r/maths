lemma succ_mul (a b : mynat) : succ a * b = a * b + b :=
  induction b with n hn,
  repeat {rw mul_zero},
  simp,

  repeat {rw mul_succ},
  rw hn,
  repeat {rw add_succ},
  simp,
end
