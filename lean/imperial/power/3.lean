lemma pow_one (a : mynat) : a ^ (1 : mynat) = a :=
  rwa [one_eq_succ_zero, pow_succ, pow_zero, one_mul],
end
