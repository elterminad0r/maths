lemma example3 (a b : mynat) (h : succ a = b) : succ(succ(a)) = succ(b) :=
  rw h,
  refl,
end
