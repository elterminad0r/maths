lemma add_assoc (a b c : mynat) : (a + b) + c = a + (b + c) :=
begin
  induction c with n hn,
  repeat {rw add_zero},
  repeat {rw add_succ},
  rwa hn,
end
