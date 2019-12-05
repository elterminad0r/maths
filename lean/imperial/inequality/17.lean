lemma lt_iff_succ_le (a b : mynat) : a < b ↔ succ a ≤ b :=
begin
  have h1 := lt_aux_one a b,
  have h2 := lt_aux_two a b,
  split,
  exact h1,
  exact h2,
end
