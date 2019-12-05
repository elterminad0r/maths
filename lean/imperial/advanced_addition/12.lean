theorem add_one_eq_succ (d : mynat) : d + 1 = succ d :=
begin
  symmetry,
  exact succ_eq_add_one d,
end
