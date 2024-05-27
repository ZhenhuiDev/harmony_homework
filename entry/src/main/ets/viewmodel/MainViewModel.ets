import { getCurrentTime } from '../util/DateUtil';
import { TargetItem } from '../viewmodel/Target';
import { Target } from '../viewmodel/Target';

export class MainViewModel {
  private target = new Target(
    "第一季度运营目标",
    "实现用户量与用户活跃度提升",
    [new TargetItem("子目标1", 50, getCurrentTime())]
  )

  getTarget(): Target {
    return this.target
  }

  getTargetItemList(): TargetItem[] {
    return this.target.targetItemList
  }

  addTargetItem(item: TargetItem) {
    this.target.targetItemList.push(item)
  }

  deleteData(selectArr: Array<boolean>) {
    if (!selectArr) {
      return
    }
    let dataLen = this.target.targetItemList.length - 1;
    for (let i = dataLen; i >= 0; i--) {
      if (selectArr[i]) {
        this.target.targetItemList.splice(i, 1);
      }
    }
  }
}

export default new MainViewModel();