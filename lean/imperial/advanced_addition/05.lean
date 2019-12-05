theorem add_right_cancel (a t b : mynat) : a + t = b + t → a = b :=
begin
  induction t with n hn,
  simp,

  repeat {rw add_succ},
  rw succ_eq_succ_iff,
  cc,
end
