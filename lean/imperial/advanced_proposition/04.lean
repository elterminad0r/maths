lemma iff_trans (P Q R : Prop) : (P ↔ Q) → (Q ↔ R) → (P ↔ R) :=
begin
  -- could do with cc
  intros h g,
  cases h with hpq hqp,
  cases g with gqr grq,
  split,
  cc, -- instead of "intro, exact ..."
  cc,
end
