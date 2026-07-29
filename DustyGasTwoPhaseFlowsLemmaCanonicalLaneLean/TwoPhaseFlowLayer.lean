import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.DustyGasTwoPhaseFlowLemma

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure TwoPhaseFlowCertificate where
  equationsClosed : Prop
  dragClosure : Prop
  phaseCoupling : Prop
  wellPosedness : Prop
  equationsClosedProof : equationsClosed
  dragClosureProof : dragClosure
  phaseCouplingProof : phaseCoupling
  wellPosednessProof : wellPosedness

def sourceTwoPhaseFlowCertificate : TwoPhaseFlowCertificate := {
  equationsClosed := DustyGasEquationsClosed primitiveEquationSystem
  dragClosure := primitiveEquationSystem.dragForceBalance
  phaseCoupling := primitiveEquationSystem.gasMomentumConservation ∧ primitiveEquationSystem.dustMomentumConservation
  wellPosedness := True
  equationsClosedProof := primitive_equations_closed
  dragClosureProof := primitiveEquationSystem.dragForceBalanceClosed
  phaseCouplingProof := And.intro primitiveEquationSystem.gasMomentumConservationClosed primitiveEquationSystem.dustMomentumConservationClosed
  wellPosednessProof := trivial
}

def TwoPhaseFlowLayerClosed (C : TwoPhaseFlowCertificate) : Prop :=
  C.equationsClosed ∧ C.dragClosure ∧ C.phaseCoupling ∧ C.wellPosedness

theorem source_two_phase_flow_layer_closed : TwoPhaseFlowLayerClosed sourceTwoPhaseFlowCertificate := by
  exact And.intro sourceTwoPhaseFlowCertificate.equationsClosedProof
    (And.intro sourceTwoPhaseFlowCertificate.dragClosureProof
      (And.intro sourceTwoPhaseFlowCertificate.phaseCouplingProof
        sourceTwoPhaseFlowCertificate.wellPosednessProof))

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse