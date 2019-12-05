lemma mul_assoc (a b c : mynat) : (a * b) * c = a * (b * c) :=
  induction c with n hn,
  repeat {rw mul_zero},

  repeat {rw mul_succ},
  rw hn,
  rwa mul_add,
end
