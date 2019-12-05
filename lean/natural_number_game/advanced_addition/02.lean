theorem succ_succ_inj {a b : mynat} (h : succ(succ(a)) = succ(succ(b))) :  a = b :=
begin
  exact succ_inj (succ_inj h),
end
