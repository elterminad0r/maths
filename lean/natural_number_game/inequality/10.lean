lemma le_succ_self (a : mynat) : a ≤ succ a :=
begin
  use 1,
  exact succ_eq_add_one a,
end
