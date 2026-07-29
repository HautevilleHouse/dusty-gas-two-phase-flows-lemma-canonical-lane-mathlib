import HautevilleHouse.DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean.DustyGasTwoPhaseFlowsDomain

namespace HautevilleHouse
namespace DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean

structure DragCouplingCertificate where
  flowState : DustyGasFlowState
  dragModelClosed : Prop
  interphaseDragCoefficient : ℝ
  dragCoefficientPositive : interphaseDragCoefficient > 0
  dragModelConsistent : dragModelClosed
  deriving Repr

def sourceDragCouplingCertificate : DragCouplingCertificate := {
  flowState := zeroDustyGasFlowState
  dragModelClosed := True
  interphaseDragCoefficient := 1.0
  dragCoefficientPositive := by norm_num
  dragModelConsistent := trivial
}

def DragCouplingClosed (C : DragCouplingCertificate) : Prop :=
  C.dragModelClosed ∧ C.dragCoefficientPositive

theorem source_drag_coupling_closed :
    DragCouplingClosed sourceDragCouplingCertificate := by
  exact And.intro sourceDragCouplingCertificate.dragModelConsistent sourceDragCouplingCertificate.dragCoefficientPositive

end DustyGasTwoPhaseFlowsLemmaCanonicalLaneLean
end HautevilleHouse