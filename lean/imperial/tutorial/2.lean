lemma example2 (x y z : mynat) (h : y = x + 7) : 2 * y = 2 * (x + 7) :=
  rwa h,
end
