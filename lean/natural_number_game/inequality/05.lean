theorem le_trans (a b c : mynat) (hab : a ≤ b) (hbc : b ≤ c) : a ≤ c :=
begin
  cases hab with n hn,
  cases hbc with m hm,
  use (m + n),
  rw [hm, hn],
  ring,
end
