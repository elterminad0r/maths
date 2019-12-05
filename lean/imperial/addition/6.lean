lemma add_right_comm (a b c : mynat) : a + b + c = a + c + b :=
  rw [add_assoc, add_comm b c, add_assoc],
  refl,
end
