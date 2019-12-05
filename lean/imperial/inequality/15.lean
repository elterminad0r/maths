lemma lt_aux_one (a b : mynat) : a ≤ b ∧ ¬ (b ≤ a) → succ a ≤ b :=
begin
  cases b with c,
  exact h2 (zero_le a),

  cases h1 with n hn,
  cases n with m,
  rw [hn, add_zero] at h2,
  exfalso,
  exact h2 (le_refl a),

  use m,
  rwa [hn, add_succ, succ_add],
  cases h with h1 h2,
  exfalso,
  intro h,
end
