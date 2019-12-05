lemma le_refl (x : mynat) : x ≤ x :=
begin
  use 0,
  ring,
end
