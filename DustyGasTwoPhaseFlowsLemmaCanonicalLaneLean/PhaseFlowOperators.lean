import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.AdmissibleClass
import Mathlib.Data.Real.Basic

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

abbrev SpatialPoint := Fin 3 → ℝ
abbrev Time := ℝ
abbrev ScalarField := Time → SpatialPoint → ℝ
abbrev VectorField := Time → SpatialPoint → SpatialPoint

structure PhaseFlowOperators where
  gasFraction : ScalarField
  dustConcentration : ScalarField
  gasVelocity : VectorField
  dustVelocity : VectorField
  dragCoefficient : ℝ
  diffusionCoefficient : ℝ
  pressureGradient : ScalarField

structure DustyGasFlow where
  operators : PhaseFlowOperators
  conservationOfGasMass : Prop
  conservationOfDustMass : Prop
  momentumBalanceGas : Prop
  momentumBalanceDust : Prop

def zeroScalarField : ScalarField := fun _ _ => 0
def zeroVectorField : VectorField := fun _ _ _ => 0

def defaultPhaseFlowOperators : PhaseFlowOperators := {
  gasFraction := zeroScalarField,
  dustConcentration := zeroScalarField,
  gasVelocity := zeroVectorField,
  dustVelocity := zeroVectorField,
  dragCoefficient := 1,
  diffusionCoefficient := 1,
  pressureGradient := zeroScalarField
}

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse