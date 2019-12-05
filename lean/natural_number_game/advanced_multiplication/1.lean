theorem mul_pos (a b : mynat) : a ≠ 0 → b ≠ 0 → a * b ≠ 0 :=
begin
  intros ha hb h,
  cases a with n,
  cc,
  cases b with m,
  cc,
  rw succ_mul at h,
  exact succ_ne_zero _ (add_left_eq_zero h),
end
