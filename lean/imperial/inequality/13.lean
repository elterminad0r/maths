theorem not_succ_le_self (a : mynat) : ¬ (succ a ≤ a) :=
begin
  intro h,
  have hsz := le_antisymm (succ a) a h (le_succ_self a),
  symmetry at hsz,
  exact ne_succ_self a hsz,
end
