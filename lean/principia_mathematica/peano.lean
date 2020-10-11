open nat

--1.a.
example : ∀ m n k : nat, m * (n + k) = m * n + m * k :=
begin
    intros m n k,
    induction m with n hn,
    repeat {rw zero_mul},

    repeat {rw succ_mul},
    rw hn,
    simp,
end

--1.b.
example : ∀ n : nat, 0 * n = 0 :=
begin
    intro n,
    rw zero_mul,
end

--1.c.
example : ∀ n : nat, 1 * n = n :=
begin
    intro n,
    induction n with m hm,
    rw mul_zero,

    rw mul_succ,
    rw hm,
end

--1.d.
example : ∀ m n k : nat, (m * n) * k = m * (n * k) :=
begin
    intros m n k,
    rw mul_assoc,
end

--1.e.
example : ∀ m n : nat, m * n= n * m :=
begin
    intros m n,
    rw mul_comm,
end

--2.a.
example : ∀ m n k : nat, n ≤ m → n + k ≤ m  + k :=
begin
    intros m n k h,
    sorry,
end

--2.b.
example : ∀ m n k : nat, n + k ≤ m + k → n ≤ m :=
begin
    intros m n k h,
end

--2.c.
example : ∀ m n k : nat, n ≤ m → n * k ≤ m * k := sorry

--2.d.
example : ∀ m n : nat, m ≥ n → m = n ∨ m ≥ n+1 := sorry

--2.e.
example : ∀ n : nat, 0 ≤ n := sorry