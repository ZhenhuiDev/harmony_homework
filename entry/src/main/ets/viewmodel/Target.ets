export class Target {
  icon: Resource;
  name: ResourceStr;
  desc: ResourceStr;
  updateTimestamp: number;
  targetItemList: TargetItem[];

  constructor(icon: Resource, name: ResourceStr, desc: ResourceStr, updateTimestamp: number, targetItemList: TargetItem[]) {
    this.icon = icon;
    this.name = name;
    this.desc = desc;
    this.updateTimestamp = updateTimestamp;
    this.targetItemList = targetItemList;
  }
}

export class TargetItem {
  name: string;
  progress: number;
  updateTimestamp: number;

  constructor(name: string, progress: number, updateTimestamp: number) {
    this.name = name;
    this.progress = progress;
    this.updateTimestamp = updateTimestamp;
  }
}