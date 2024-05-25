import { Target, TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'
import { SubTarget } from '../view/SubTarget'
import { TargetSummary } from '../view/TargetSummary'

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

      TargetSummary({ target: $target })

      Line().width('100%').height(20)

      Text($r('app.string.mainPage_subTarget'))
        .fontSize($r('app.float.big_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))

      Line().width('100%').height(20)

      List({ space: 20 }) {
        ForEach(this.target.targetItemList, (item: TargetItem) => {
          ListItem() {
            SubTarget({ item: item })
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