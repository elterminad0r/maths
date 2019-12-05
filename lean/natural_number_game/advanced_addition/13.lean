lemma ne_succ_self (n : mynat) : n ≠ succ n :=
begin
  induction n with m hm,
  exact zero_ne_succ 0,
  intro h,
  exact hm (succ_inj h),
end
