theorem le_succ (a b : mynat) : a ≤ b → a ≤ (succ b) :=
begin
  intro h,
  cases h with c hc,
  use (succ c),
  rw hc,
  ring,
end
