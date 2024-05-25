import { TargetItem } from '../viewmodel/Target'

@Component
export struct SubTarget {
  @ObjectLink item: TargetItem

  getUpdateTime(): string {
    let date = new Date(this.item.updateTimestamp)
    return `${date.getMonth()}/${date.getDay()}/${date.getFullYear()}`
  }

  build() {
    Row() {
      Text(this.item.name)
      Blank()
      Column() {
        Text(`${this.item.progress}%`)
          .fontSize($r('app.float.big_text_size'))
          .fontWeight(FontWeight.Bold)
          .fontColor($r('app.color.title_text_color'))
        Row() {
          Text($r('app.string.mainPage_update_time'))
            .fontSize($r('app.float.little_text_size'))
            .fontColor($r('app.color.login_more_text_color'))
          Text(`:${this.getUpdateTime()}`)
            .fontSize($r('app.float.little_text_size'))
            .fontColor($r('app.color.login_more_text_color'))
        }
      }.alignItems(HorizontalAlign.End)
    }.backgroundColor(Color.White).border({ radius: 10 }).width('100%').padding(20)
  }
}