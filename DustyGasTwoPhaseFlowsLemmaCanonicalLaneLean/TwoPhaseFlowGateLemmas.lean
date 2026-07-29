import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.TwoPhaseFlowBridgeLemmas

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) :
    gateClosed A := by
  exact A.gateWitness

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse