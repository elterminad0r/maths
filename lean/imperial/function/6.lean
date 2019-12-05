example (P Q R : Type) : (P → (Q → R)) → ((P → Q) → (P → R)) :=
begin
  intros f g p,
  exact (f p) (g p),
end
