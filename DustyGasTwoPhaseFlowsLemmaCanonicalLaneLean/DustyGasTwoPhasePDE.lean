import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

/-!
# Dusty Gas Two-Phase PDE Objects

This module defines the primitive PDE objects for the dusty gas two-phase flow system.
-/

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

abbrev Space3 := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → Space3 → ℝ
abbrev VectorField := Time → Space3 → Space3

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

structure DustyGasOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → VectorField
  drag : VectorField → VectorField
  sourceTerm : ScalarField → ScalarField
  dragIdempotent : ∀ u, drag (drag u) = drag u

def primitiveDustyGasOperators : DustyGasOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ => zeroVectorField
  drag := fun u => u
  sourceTerm := fun _ => zeroScalarField
  dragIdempotent := by intro u; rfl
}

structure TwoPhaseFlow where
  gasVelocity : VectorField
  dustVelocity : VectorField
  gasPressure : ScalarField
  dustVolumeFraction : ScalarField
  viscosity : ℝ
  operators : DustyGasOperators

def primitiveTwoPhaseFlow : TwoPhaseFlow := {
  gasVelocity := zeroVectorField
  dustVelocity := zeroVectorField
  gasPressure := zeroScalarField
  dustVolumeFraction := zeroScalarField
  viscosity := 1
  operators := primitiveDustyGasOperators
}

def IncompressibleGas (F : TwoPhaseFlow) : Prop :=
  F.operators.divergence F.gasVelocity = zeroScalarField

def DustyGasMomentumBalance (F : TwoPhaseFlow) : Prop :=
  F.operators.timeDerivative F.gasVelocity = F.operators.laplacian F.gasVelocity

def DragCouplingBalanced (F : TwoPhaseFlow) : Prop :=
  F.operators.drag F.gasVelocity = F.operators.drag F.dustVelocity

def TwoPhaseEquationClosed (F : TwoPhaseFlow) : Prop :=
  IncompressibleGas F ∧ DustyGasMomentumBalance F ∧ DragCouplingBalanced F

theorem primitive_two_phase_equation_closed_checked :
    TwoPhaseEquationClosed primitiveTwoPhaseFlow := by
  exact And.intro (by rfl) (And.intro (by rfl) (by rfl))

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse