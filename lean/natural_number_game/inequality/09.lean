theorem le_total (a b : mynat) : a ≤ b ∨ b ≤ a :=
begin
  -- this feels too long
  induction b with n hn,
  right,
  exact zero_le a,

  cases hn,
  left,
  exact le_succ a n hn,

  cases hn with d hd,
  cases d with t,
  left,
  use succ 0,
  rw hd,
  ring,

  right,
  use t,
end
