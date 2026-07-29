import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.TwoPhaseFlowLayer
import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

def DustyGasTwoPhaseFlowsClosure (A : AdmissibleClass) : Prop :=
  ConstrainedTheoremClosure A ∧ TwoPhaseFlowLayerClosed sourceTwoPhaseFlowCertificate

theorem dusty_gas_two_phase_flows_endgame (A : AdmissibleClass) : DustyGasTwoPhaseFlowsClosure A := by
  exact And.intro (constrained_theorem_closure A) source_two_phase_flow_layer_closed

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse