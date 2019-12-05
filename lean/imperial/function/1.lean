example (P Q : Type) (p : P) (h : P → Q) : Q :=
  exact h p,
end
