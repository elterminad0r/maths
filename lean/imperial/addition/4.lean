lemma add_comm (a b : mynat) : a + b = b + a :=
begin
  induction b with n hn,
  rw [add_zero, zero_add],
  refl,

  rw [add_succ, succ_add, hn],
  refl,
end
