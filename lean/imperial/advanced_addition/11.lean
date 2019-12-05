lemma add_right_eq_zero (a b : mynat) : a + b = 0 → a = 0 :=
begin
  rw add_comm,
  exact add_left_eq_zero,
end
