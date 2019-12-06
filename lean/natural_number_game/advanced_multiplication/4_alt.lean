theorem mul_left_cancel (a b c : mynat) (ha : a ≠ 0) : a * b = a * c → b = c :=
  -- This is a longer proof that uses a little more lean machinery, and puts
  -- more stress on my CPU, but to me what this proof is doing makes much more
  -- sense:
  -- + It first establishes that any two natural numbers have a difference
  --   (ie one is less than or equal to the other, or can be written as some "d"
  --   plus the other), which is actually proved later in inequality world.
  -- + Then taking wlog b = c + d, we use distributivity and cancellation of
  --   addition to get a * d = 0, and then we must have d = 0, so b = c.
  -- + However I'm not sure how to do wlog properly in Lean, so I end up
  --   introducing a general hypothesis of this form and then applying it twice,
  --   using a lot of symmetry in the second case.

  -- New sub-goal: for all natural numbers b, c, we can write one as `d` plus
  -- the other. To prove this requires induction and lots of case-work (and you
  -- need to know how existence proofs with the use tactic work!). It would
  -- probably be nicer all round if we got the ring tactic at this point, but oh
  -- well.
  have h : ∃ d: mynat, b = c + d ∨ b + d = c,
  induction b with n hn,
  use c,
  right,
  rwa zero_add,
  cases hn with d hd,
  cases d,
  repeat {rw add_zero at hd},
  -- In this bit I have a hypothesis of the form "a or a", and I'd like to use
  -- the idempotency of logical disjunction in some flashy way, but idk how so I
  -- just claim it's equivalent to "a" and prove it in both cases (using cc
  -- because it's easier to write).
  have hnc: n = c,
  cases hd,
  cc, cc,
  rw hnc,
  use 1,
  left,
  rwa succ_eq_add_one,
  cases hd,
  use succ (succ d),
  left,
  rw hd,
  repeat {rw add_succ},
  use d,
  right,
  rw ← hd,
  rwa [add_succ, succ_add],
  -- Now we've demonstrated the existence of our d, expose it with cases
  cases h with d hd,
  -- This is my hack to avoid having to prove this twice
  have h_lazy: ∀ x y z w: mynat, x ≠ 0 → y = z + w → x * y = x * z → y = z,
  intros x y z w hxnz hyzw hxyxz,
  rw [hyzw, mul_add] at hxyxz,
  have hxzz := eq_zero_or_eq_zero_of_mul_eq_zero _ _ (eq_zero_of_add_right_eq_self _ _ hxyxz),
  have hwz: w = 0,
  cc,
  rwa [hyzw, hwz, add_zero],
  cases hd,
  exact h_lazy a b c d ha hd,
  intros h,
  symmetry at h,
  symmetry at hd,
  symmetry,
  exact h_lazy a c b d ha hd h,
end
