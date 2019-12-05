lemma le_zero (a : mynat) (h : a ≤ 0) : a = 0 :=
begin
  cases h with n hn,
  symmetry at hn,
  exact add_right_eq_zero a n hn,
end
