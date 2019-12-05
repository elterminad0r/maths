lemma add_succ_zero (a : mynat) : a + succ(0) = succ(a) :=
  rw add_succ,
  rw add_zero,
  refl,
end
