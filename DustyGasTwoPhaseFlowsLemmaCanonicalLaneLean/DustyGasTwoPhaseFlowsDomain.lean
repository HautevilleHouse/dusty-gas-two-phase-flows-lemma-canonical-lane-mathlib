import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure DustyGasFlowState where
  gasDensity : ℝ
  dustDensity : ℝ
  gasVelocity : ℝ → ℝ → ℝ -- time and space
  dustVelocity : ℝ → ℝ → ℝ
  pressure : ℝ → ℝ → ℝ
  viscosity : ℝ
  porosity : ℝ
  deriving Repr

def zeroDustyGasFlowState : DustyGasFlowState := {
  gasDensity := 0
  dustDensity := 0
  gasVelocity := fun _ _ => 0
  dustVelocity := fun _ _ => 0
  pressure := fun _ _ => 0
  viscosity := 1
  porosity := 0.5
}

structure DustyGasOperators where
  gasMomentumEquation : DustyGasFlowState → Prop
  dustMomentumEquation : DustyGasFlowState → Prop
  massConservationGas : DustyGasFlowState → Prop
  massConservationDust : DustyGasFlowState → Prop
  dragCoupling : DustyGasFlowState → Prop
  pressureGradient : DustyGasFlowState → Prop
  operatorsConsistent : Prop

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse