lemma and_or_distrib_left (P Q R : Prop) : P ∧ (Q ∨ R) ↔ (P ∧ Q) ∨ (P ∧ R) :=
begin
  split,
  cc,
  intro h,
  cases h with hpq hpr,
  cc,
  cc,
end
