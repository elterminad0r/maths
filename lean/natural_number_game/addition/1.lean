lemma zero_add (n : mynat) : 0 + n = n :=
begin
  induction n with m hm,
  rwa add_zero,

  rw add_succ,
  rwa hm,
end
