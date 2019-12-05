lemma zero_pow_succ (m : mynat) : (0 : mynat) ^ (succ m) = 0 :=
  rwa [pow_succ, mul_zero],
end
