lemma zero_le (a : mynat) : 0 ≤ a :=
begin
  use a,
  ring,
end
