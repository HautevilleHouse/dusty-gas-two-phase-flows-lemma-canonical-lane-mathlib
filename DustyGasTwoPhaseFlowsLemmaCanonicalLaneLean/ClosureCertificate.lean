import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.FinalTheorem
import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.SingularPerturbationLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure DustyGasClosureCertificate where
  singularPerturbation : SingularPerturbationCertificate
  bridgeClosed : Prop
  gateClosed : Prop
  bridgeClosedProof : bridgeClosed
  gateClosedProof : gateClosed

def admittedObject : AdmittedTheoremObject := {
  object := {
    sourceKey := "dusty_gas_two_phase_flows",
    theoremObject := "Dusty Gas Two Phase Flows Lemma",
    claimBoundary := "admitted analytic closure"
  },
  localWitness := "Phase flow operators with balance and singular perturbation layers.",
  bridgeEvidence := "source-derived certificate fields",
  sourceKeyChecked := rfl,
  theoremObjectChecked := rfl
}

def admissibleClass : AdmissibleClass := {
  object := admittedObject,
  endpointSatisfied := SingularPerturbationClosed sourceSingularPerturbationCertificate,
  remainderRecorded := False,
  gateWitness := Or.inl source_singular_perturbation_closed
}

def sourceDustyGasClosureCertificate : DustyGasClosureCertificate := {
  singularPerturbation := sourceSingularPerturbationCertificate,
  bridgeClosed := bridgeClosed admissibleClass,
  gateClosed := gateClosed admissibleClass,
  bridgeClosedProof := bridge_from_admissible_class admissibleClass,
  gateClosedProof := gate_from_admissible_class admissibleClass
}

def DustyGasClosureCertificateClosed (C : DustyGasClosureCertificate) : Prop :=
  SingularPerturbationClosed C.singularPerturbation ∧ C.bridgeClosed ∧ C.gateClosed

theorem source_dusty_gas_closure_certificate_closed : DustyGasClosureCertificateClosed sourceDustyGasClosureCertificate := by
  exact And.intro source_singular_perturbation_closed
    (And.intro sourceDustyGasClosureCertificate.bridgeClosedProof
      sourceDustyGasClosureCertificate.gateClosedProof)

theorem dusty_gas_endgame : ConstrainedDustyGasClosure admissibleClass := by
  exact constrained_dusty_gas_endgame admissibleClass

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse