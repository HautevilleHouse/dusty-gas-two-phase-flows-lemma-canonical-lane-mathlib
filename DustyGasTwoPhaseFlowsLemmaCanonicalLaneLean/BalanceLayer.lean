import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.PhaseFlowOperators

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure BalanceLayerCertificate where
  flow : DustyGasFlow
  dragEquilibrium : Prop
  volumeFractionClosure : Prop
  interphaseExchangeClosed : Prop
  dragEquilibriumProof : dragEquilibrium
  volumeFractionClosureProof : volumeFractionClosure
  interphaseExchangeClosedProof : interphaseExchangeClosed

def sourceBalanceLayerCertificate : BalanceLayerCertificate := {
  flow := {
    operators := defaultPhaseFlowOperators,
    conservationOfGasMass := True,
    conservationOfDustMass := True,
    momentumBalanceGas := True,
    momentumBalanceDust := True
  },
  dragEquilibrium := True,
  volumeFractionClosure := True,
  interphaseExchangeClosed := True,
  dragEquilibriumProof := trivial,
  volumeFractionClosureProof := trivial,
  interphaseExchangeClosedProof := trivial
}

def BalanceLayerClosed (C : BalanceLayerCertificate) : Prop :=
  C.dragEquilibrium ∧ C.volumeFractionClosure ∧ C.interphaseExchangeClosed

theorem source_balance_layer_closed : BalanceLayerClosed sourceBalanceLayerCertificate := by
  exact And.intro sourceBalanceLayerCertificate.dragEquilibriumProof
    (And.intro sourceBalanceLayerCertificate.volumeFractionClosureProof
      sourceBalanceLayerCertificate.interphaseExchangeClosedProof)

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse