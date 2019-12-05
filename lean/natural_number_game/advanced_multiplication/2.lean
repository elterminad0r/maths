theorem eq_zero_or_eq_zero_of_mul_eq_zero (a b : mynat) (h : a * b = 0) :
  a = 0 ∨ b = 0 :=
begin
  cases a with n hn,
  left,
  cc,
  cases b with m hm,
  right,
  cc,
  have g := mul_pos (succ n) (succ m) (succ_ne_zero n) (succ_ne_zero m),
  exfalso,
  cc,
end
