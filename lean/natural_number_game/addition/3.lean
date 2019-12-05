lemma succ_add (a b : mynat) : succ a + b = succ (a + b) :=
begin
  induction b with n hn,
  repeat {rw add_zero},
  repeat {rw add_succ},
  rwa hn,
end
