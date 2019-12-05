lemma add_right_comm (a b c : mynat) : a + b + c = a + c + b :=
  rwa [add_assoc, add_comm b c, add_assoc],
end
