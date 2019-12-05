lemma eq_zero_of_add_right_eq_self (a b : mynat) : a + b = a → b = 0 :=
begin
  intro h,
  -- I'd like to avoid all this using `conv`, but I don't know how
  rw ← add_zero a at h,
  rw add_assoc at h,
  have hbz := add_left_cancel a (0 + b) 0 h,
  rw zero_add at hbz,
  cc,
end
