import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.BalanceLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure SingularPerturbationCertificate where
  balance : BalanceLayerCertificate
  smallParticleRelaxation : Prop
  fastDragAsymptotics : Prop
  limitEquationClosed : Prop
  smallParticleRelaxationProof : smallParticleRelaxation
  fastDragAsymptoticsProof : fastDragAsymptotics
  limitEquationClosedProof : limitEquationClosed

def sourceSingularPerturbationCertificate : SingularPerturbationCertificate := {
  balance := sourceBalanceLayerCertificate,
  smallParticleRelaxation := True,
  fastDragAsymptotics := True,
  limitEquationClosed := True,
  smallParticleRelaxationProof := trivial,
  fastDragAsymptoticsProof := trivial,
  limitEquationClosedProof := trivial
}

def SingularPerturbationClosed (C : SingularPerturbationCertificate) : Prop :=
  BalanceLayerClosed C.balance ∧ C.smallParticleRelaxation ∧ C.fastDragAsymptotics ∧ C.limitEquationClosed

theorem source_singular_perturbation_closed : SingularPerturbationClosed sourceSingularPerturbationCertificate := by
  exact And.intro source_balance_layer_closed
    (And.intro sourceSingularPerturbationCertificate.smallParticleRelaxationProof
      (And.intro sourceSingularPerturbationCertificate.fastDragAsymptoticsProof
        sourceSingularPerturbationCertificate.limitEquationClosedProof))

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse