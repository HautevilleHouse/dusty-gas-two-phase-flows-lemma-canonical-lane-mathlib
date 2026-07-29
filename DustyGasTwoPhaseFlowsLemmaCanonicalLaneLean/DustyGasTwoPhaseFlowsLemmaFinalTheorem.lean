import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.TwoPhaseFlowGateLemmas

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

def ConstrainedTwoPhaseFlowsClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_two_phase_flows_endgame (A : AdmissibleClass) :
    ConstrainedTwoPhaseFlowsClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse