theorem le_of_succ_le_succ (a b : mynat) : succ a ≤ succ b → a ≤ b :=
begin
  intro h,
  cases h with n hn,
  rw succ_add at hn,
  use n,
  apply succ_inj,
  cc,
end
