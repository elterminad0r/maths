lemma mul_left_comm (a b c : mynat) : a * (b * c) = b * (a * c) :=
  rwa [← mul_assoc, mul_comm a b, mul_assoc],
end
