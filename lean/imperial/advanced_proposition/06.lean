example (P Q : Prop) : Q → (P ∨ Q) :=
begin
  intro q,
  right,
  cc,
end
