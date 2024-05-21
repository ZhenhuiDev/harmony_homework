import { TargetItem } from '../viewmodel/Target';
import { Target } from '../viewmodel/Target';

export class MainViewModel {
  getTarget(): Target {
    return new Target(
      $r('app.media.icon'),
      "第一季度运营目标",
      "实现用户量与用户活跃度提升",
      Date.now(),
      [new TargetItem("子目标1", 50, Date.now())]
    )
  }
}

export default new MainViewModel();