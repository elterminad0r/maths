lemma add_left_eq_zero {a b : mynat} (H : a + b = 0) : b = 0 :=
begin
  cases b with d,
  refl,
  rw add_succ at H,
  exfalso,
  exact succ_ne_zero _ H,
end
