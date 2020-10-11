variable p : Prop

example : ¬(p ↔ ¬p) :=
begin
    intro h,
    have hnp: ¬ p,
    intro hp,
    have hnp := iff.mp h hp,
    exact hnp hp,
    have hp: p,
    exact iff.mpr h hnp,
    exact hnp hp,
end
