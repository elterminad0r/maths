theorem mul_left_cancel (a b c : mynat) (ha : a ≠ 0) : a * b = a * c → b = c :=
  -- + revert b because the website said so. I still don't /really/ understand
  --   what revert is for, ie how you're supposed to spot that you should use
  --   it.
  -- + I *think* this works because it gives us a hypothesis with
  --   "forall b" later, which is nicer than just having a hypothesis with "b"
  --   in. It sort of sneaks b around the induction.

  -- induction on c, because a didn't seem to work.
  revert b,
  induction c with n hn,
  -- base case of induction: want to show
  -- ∀ (b : mynat), a * b = a * 0 → b = 0
  -- which is basically just mul_eq_zero_iff
  intro b,
  rw [mul_zero, mul_eq_zero_iff],
  cc,

  -- then also induct on b (?)
  intros b h,
  induction b with m hm,

  symmetry at h,
  rw [mul_zero, mul_eq_zero_iff] at h,
  have hnz := succ_ne_zero n,
  cc,

  rw succ_eq_succ_iff,
  apply hn,
  repeat {rw mul_succ at h},
  exact add_right_cancel _ a _ h,
end
