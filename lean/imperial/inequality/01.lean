lemma one_add_le_self (x : mynat) : x ≤ 1 + x :=
begin
  use 1,
  ring,
end
