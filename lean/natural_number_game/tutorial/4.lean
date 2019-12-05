lemma add_succ_zero (a : mynat) : a + succ(0) = succ(a) :=
  rwa [add_succ, add_zero],
end
