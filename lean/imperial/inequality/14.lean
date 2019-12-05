theorem add_le_add_left (a b : mynat) (h : a ≤ b) (t : mynat) :
  t + a ≤ t + b :=
begin
  rw add_comm t a,
  rw add_comm t b,
  exact add_le_add_right a b h t,
end
