import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.TurbulentDispersionLayer
import DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.RegularityEndpointLayer

/-!
# Dusty Gas Analytic Closure

This module states the admitted analytic closure theorem for the dusty gas package.
-/

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

def DustyGasAdmittedAnalyticClosure : Prop :=
  TurbulentDispersionClosed sourceTurbulentDispersionCertificate ∧
  RegularityEndpointClosed sourceRegularityEndpointCertificate ∧
  ConstrainedTheoremClosure dustyGasAdmissibleClass

def UnrestrictedClassicalDustyGasBoundaryCarried : Prop :=
  formalizationCertificate.theoremBoundaryOpen = true ∧
  mathlibPDESubstrate.unrestrictedNavierStokesStackCarried = true

theorem dusty_gas_admitted_analytic_closure_checked :
    DustyGasAdmittedAnalyticClosure := by
  exact And.intro source_turbulent_dispersion_closed
    (And.intro source_regularity_endpoint_closed
      (constrained_theorem_closure dustyGasAdmissibleClass))

theorem unrestricted_classical_dusty_gas_boundary_carried_checked :
    UnrestrictedClassicalDustyGasBoundaryCarried := by
  exact And.intro rfl rfl

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse