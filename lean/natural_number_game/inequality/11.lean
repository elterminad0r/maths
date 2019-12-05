theorem add_le_add_right (a b : mynat) : a ≤ b → ∀ t, (a + t) ≤ (b + t) :=
begin
  intros h t,
  cases h with n hn,
  use n,
  rw hn,
  ring,
end
