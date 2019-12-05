example (P Q F : Type) : (P → Q) → ((Q → F) → (P → F)) :=
begin
  intros f g p,
  exact g (f p),
end
