example (P Q : Type) : P → (Q → P) :=
begin
  intros p q,
  exact p,
end
