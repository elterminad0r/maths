theorem le_antisymm (a b : mynat) (hab : a ≤ b) (hba : b ≤ a) : a = b :=
begin
  cases hab with n hn,
  cases hba with m hm,
  rw [hn, add_assoc] at hm,
  symmetry at hm,
  have hmnz := eq_zero_of_add_right_eq_self a (n + m) hm,
  have hnz := add_right_eq_zero n m hmnz,
  rw [hn, hnz],
  ring,
end
