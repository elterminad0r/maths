lemma lt_aux_two (a b : mynat) : succ a ≤ b → a ≤ b ∧ ¬ (b ≤ a) :=
begin
  intro h,
  cases h with n hn,
  split,
  use succ n,
  rwa [hn ,succ_add, add_succ],

  intro hba,
  rw hn at hba,
  cases hba with d hd,
  rw [add_assoc, succ_add, ← add_succ] at hd,
  symmetry at hd,
  have h2 := eq_zero_of_add_right_eq_self a (succ (n + d)) hd,
  exact succ_ne_zero (n + d) h2,
end
