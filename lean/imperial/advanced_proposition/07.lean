lemma or_symm (P Q : Prop) : P ∨ Q → Q ∨ P :=
begin
  intro h,
  cases h with p q,
  right,
  cc,
  left,
  cc,
end
