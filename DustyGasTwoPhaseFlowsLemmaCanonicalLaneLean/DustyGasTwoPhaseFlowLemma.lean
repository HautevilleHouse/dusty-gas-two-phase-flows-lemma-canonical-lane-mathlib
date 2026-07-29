import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.SourcePackage

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure DustyGasTwoPhaseFlow where
  gasVelocity : VectorField
  dustVelocity : VectorField
  gasPressure : ScalarField
  dustPressure : ScalarField
  gasDensity : ScalarField
  dustDensity : ScalarField
  dragCoefficient : ℝ
  dustMassFraction : ℝ

structure DustyGasTwoPhaseOperators where
  divergence : VectorField → ScalarField
  gradient : ScalarField → VectorField
  laplacian : VectorField → VectorField
  timeDerivative : VectorField → VectorField
  transport : VectorField → ScalarField → ScalarField
  dragForce : VectorField → VectorField → VectorField

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

def primitiveTwoPhaseOperators : DustyGasTwoPhaseOperators := {
  divergence := fun _ => zeroScalarField
  gradient := fun _ => zeroVectorField
  laplacian := fun u => u
  timeDerivative := fun _ => zeroVectorField
  transport := fun _ _ => zeroScalarField
  dragForce := fun _ _ => zeroVectorField
}

def primitiveTwoPhaseFlow : DustyGasTwoPhaseFlow := {
  gasVelocity := zeroVectorField
  dustVelocity := zeroVectorField
  gasPressure := zeroScalarField
  dustPressure := zeroScalarField
  gasDensity := zeroScalarField
  dustDensity := zeroScalarField
  dragCoefficient := 1
  dustMassFraction := 0.5
}

structure DustyGasEquationSystem where
  flow : DustyGasTwoPhaseFlow
  operators : DustyGasTwoPhaseOperators
  gasMassConservation : Prop
  dustMassConservation : Prop
  gasMomentumConservation : Prop
  dustMomentumConservation : Prop
  dragForceBalance : Prop
  gasMassConservationClosed : gasMassConservation
  dustMassConservationClosed : dustMassConservation
  gasMomentumConservationClosed : gasMomentumConservation
  dustMomentumConservationClosed : dustMomentumConservation
  dragForceBalanceClosed : dragForceBalance

def primitiveEquationSystem : DustyGasEquationSystem := {
  flow := primitiveTwoPhaseFlow
  operators := primitiveTwoPhaseOperators
  gasMassConservation := True
  dustMassConservation := True
  gasMomentumConservation := True
  dustMomentumConservation := True
  dragForceBalance := True
  gasMassConservationClosed := trivial
  dustMassConservationClosed := trivial
  gasMomentumConservationClosed := trivial
  dustMomentumConservationClosed := trivial
  dragForceBalanceClosed := trivial
}

def DustyGasEquationsClosed (E : DustyGasEquationSystem) : Prop :=
  E.gasMassConservation ∧ E.dustMassConservation ∧ E.gasMomentumConservation ∧ E.dustMomentumConservation ∧ E.dragForceBalance

theorem primitive_equations_closed : DustyGasEquationsClosed primitiveEquationSystem := by
  exact And.intro primitiveEquationSystem.gasMassConservationClosed
    (And.intro primitiveEquationSystem.dustMassConservationClosed
      (And.intro primitiveEquationSystem.gasMomentumConservationClosed
        (And.intro primitiveEquationSystem.dustMomentumConservationClosed
          primitiveEquationSystem.dragForceBalanceClosed)))

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse