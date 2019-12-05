theorem succ_eq_add_one (n : mynat) : succ n = n + 1 :=
begin
  rw one_eq_succ_zero,
  rwa [add_succ, add_zero],
end
