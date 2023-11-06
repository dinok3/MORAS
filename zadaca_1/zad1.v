Require Import Bool.

Notation "! x" := (negb x) (at level 20).

Goal
forall (X Y : bool),
(X && !Y) || (!X && !Y) || (!X && Y) = !(X && Y)
.
Proof.
  intros [] []; simpl; reflexivity.
Qed.


Goal
forall (x y z :bool),
!(!x && y && z) && !(x && y && !z) && (x && !y && z) = (x && !y && z)
.
Proof.
  intros [] [] [];simpl;reflexivity.
Qed.