lemma contra (P Q : Prop) : (P ∧ ¬ P) → Q :=
begin
  -- fine, I'll play along
  intro h,
  cases h with hp hnp,
  exfalso,
  exact hnp hp,
end
