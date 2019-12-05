lemma succ_le_succ (a b : mynat) (h : a ≤ b) : succ a ≤ succ b :=
begin
  cases h with n hn,
  use n,
  rw hn,
  rwa succ_add,
end
