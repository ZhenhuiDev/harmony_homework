import { TargetItem } from '../viewmodel/Target'

@Component
export struct SubTarget {
  @Prop isEdit: boolean
  @ObjectLink item: TargetItem
  @Link selectArr: Array<boolean>;
  public index: number = 0;

  build() {
    Row() {
      Text(this.item.name).fontSize($r('app.float.normal_text_size'))
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
          Text(this.item.updateTime)
            .fontSize($r('app.float.little_text_size'))
            .fontColor($r('app.color.login_more_text_color'))
        }
      }.alignItems(HorizontalAlign.End)

      if (this.isEdit) {
        Checkbox()
          .select(this.selectArr[this.index])
          .margin({ left: 10, right: 10 })
          .selectedColor($r('app.color.mainPage_selected'))
          .onChange((isCheck: boolean) => {
            this.selectArr[this.index] = isCheck;
          })
      }
    }.backgroundColor(Color.White).border({ radius: 10 }).width('100%').padding(20)
  }
}