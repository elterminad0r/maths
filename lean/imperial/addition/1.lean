lemma zero_add (n : mynat) : 0 + n = n :=
begin
  induction n with m hm,
  rw add_zero,
  refl,
  rw add_succ,
  rw hm,
  refl,
end
