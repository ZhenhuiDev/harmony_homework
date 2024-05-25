import { Target } from '../viewmodel/Target'
import { TargetProgress } from './TargetProgress'

@Component
export struct TargetSummary {
  @Link target: Target

  getUpdateTime(): string {
    let date = new Date(this.target.updateTimestamp)
    return `${date.getMonth()}/${date.getDay()}/${date.getFullYear()} ${date.getHours()}:${date.getMinutes()}`
  }

  build() {
    Column() {
      Row() {
        Image(this.target.icon).width(80).height(80)
        Column() {
          Text(this.target.name)
            .fontSize($r('app.float.big_text_size'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.title_text_color'))
          Text(this.target.desc)
            .fontSize($r('app.float.little_text_size'))
            .fontColor($r('app.color.login_more_text_color'))
        }
        .margin({ left: 10, top: 10 })
        .alignItems(HorizontalAlign.Start)
      }.alignItems(VerticalAlign.Top).width('100%')

      Line().width('100%').height(20)
      Row() {
        Column() {
          Text($r('app.string.mainPage_total_progress'))
            .fontWeight(FontWeight.Bold)
            .fontSize($r('app.float.normal_text_size'))
            .fontColor($r('app.color.title_text_color'))
          Row() {
            Text($r('app.string.mainPage_update_time'))
              .fontSize($r('app.float.little_text_size'))
              .fontColor($r('app.color.login_more_text_color'))
            Text(':')
              .fontSize($r('app.float.normal_text_size'))
              .fontColor($r('app.color.title_text_color'))
          }

          Text(this.getUpdateTime())

        }.alignItems(HorizontalAlign.Start)

        Blank()
        TargetProgress({ current: 5, total: 10 })
      }.width('100%')
    }.padding(20).backgroundColor(Color.White).border({ radius: 10 })
  }
}