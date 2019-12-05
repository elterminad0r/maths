lemma and_trans (P Q R : Prop) : P ∧ Q → Q ∧ R → P ∧ R :=
begin
  intros h1 h2,
  cases h1 with p q,
  cases h2 with q' r,
  split,
  cc,
  cc,
end
