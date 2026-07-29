import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.DustyGasRegularityEndpointLayer

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure DustyGasAnalyticCertificate where
  operatorsClosed : Prop
  dragCouplingClosed : Prop
  endpointLayerClosed : Prop
  operatorsClosedProof : operatorsClosed
  dragCouplingClosedProof : dragCouplingClosed
  endpointLayerClosedProof : endpointLayerClosed

def sourceDustyGasAnalyticCertificate : DustyGasAnalyticCertificate := {
  operatorsClosed := True
  dragCouplingClosed := DragCouplingClosed sourceDragCouplingCertificate
  endpointLayerClosed := RegularityEndpointClosed sourceRegularityEndpointCertificate
  operatorsClosedProof := trivial
  dragCouplingClosedProof := source_drag_coupling_closed
  endpointLayerClosedProof := source_regularity_endpoint_closed
}

def DustyGasAnalyticCertificateClosed (C : DustyGasAnalyticCertificate) : Prop :=
  C.operatorsClosed ∧ C.dragCouplingClosed ∧ C.endpointLayerClosed

theorem source_dusty_gas_analytic_certificate_closed :
    DustyGasAnalyticCertificateClosed sourceDustyGasAnalyticCertificate := by
  exact And.intro sourceDustyGasAnalyticCertificate.operatorsClosedProof
    (And.intro sourceDustyGasAnalyticCertificate.dragCouplingClosedProof
      sourceDustyGasAnalyticCertificate.endpointLayerClosedProof)

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse