import { Target } from '../viewmodel/Target'
import { TargetProgress } from './TargetProgress'

@Component
export struct TargetSummary {
  @Prop targetName: string;
  @Prop targetDesc: string
  @Prop latestUpdateDate: string;
  @Prop totalTasksNumber: number;
  @Prop completedTasksNumber: number;

  build() {
    Column() {
      Row() {
        Image($r('app.media.icon')).width(80).height(80)
        Column() {
          Text(this.targetName)
            .fontSize($r('app.float.big_text_size'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.title_text_color'))
          Text(this.targetDesc)
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

          Text(this.latestUpdateDate)

        }.alignItems(HorizontalAlign.Start)

        Blank()
        TargetProgress({ current: this.completedTasksNumber, total: this.totalTasksNumber })
      }.width('100%')
    }.padding(20).backgroundColor(Color.White).border({ radius: 10 })
  }
}