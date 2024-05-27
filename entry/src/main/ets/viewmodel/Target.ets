@Observed
export class Target {
  name: string;
  desc: string;
  targetItemList: TargetItem[];

  constructor(name: string, desc: string, targetItemList: TargetItem[]) {
    this.name = name;
    this.desc = desc;
    this.targetItemList = targetItemList;
  }
}

@Observed
export class TargetItem {
  name: string;
  progress: number;
  updateTime: string;

  constructor(name: string, progress: number, updateTime: string) {
    this.name = name;
    this.progress = progress;
    this.updateTime = updateTime;
  }
}