example (P Q : Type) : (P → Q) → ((Q → empty) → (P → empty)) :=
begin
  intros f h p,
  exact h (f p),
end
