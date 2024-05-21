import { Target, TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'

@Preview
@Entry
@Component
struct MainPage {
  @State target: Target = mainViewModel.getTarget()

  build() {
    Column() {
      Text($r('app.string.mainPage_title'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_text_color'))

      Line().width('100%').height(20)

      TotalTarget({ target: $target })

      Line().width('100%').height(20)

      Text($r('app.string.mainPage_subTarget'))
        .fontSize($r('app.float.big_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))

      Line().width('100%').height(20)

      List({ space: 20 }) {
        ForEach(this.target.targetItemList, (item: TargetItem) => {
          ListItem() {
            SubTarget({ name: item.name, progress: item.progress, updateTimestamp: item.updateTimestamp })
          }
        })
      }
      .listDirection(Axis.Vertical)
      .width('100%')
    }
    .padding(20)
    .height('100%')
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
    .alignItems(HorizontalAlign.Start)
  }
}

@Component
struct TotalTarget {
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

@Component
struct SubTarget {
  @Prop name: string;
  @Prop progress: number;
  @Prop updateTimestamp: number;

  getUpdateTime(): string {
    let date = new Date(this.updateTimestamp)
    return `${date.getMonth()}/${date.getDay()}/${date.getFullYear()}`
  }

  build() {
    Row() {
      Text(this.name)
      Blank()
      Column() {
        Text(`${this.progress}%`)
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

@Component
struct TargetProgress {
  @Prop current: number
  @Prop total: number

  build() {
    Stack() {
      Progress({ value: this.current, total: this.total, type: ProgressType.Ring }).width(50)
      Row() {
        Text(`${this.current}`)
          .fontSize($r('app.float.small_text_size'))
          .fontColor($r('app.color.login_blue_text_color'))
        Text(`/${this.total}`)
          .fontSize($r('app.float.small_text_size'))
          .fontColor($r('app.color.title_text_color'))
      }
    }
  }
}