lemma add_comm (a b : mynat) : a + b = b + a :=
begin
  induction b with n hn,
  rwa [add_zero, zero_add],

  rwa [add_succ, succ_add, hn],
end
