import { Target, TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'
import { SubTarget } from '../view/SubTarget'
import { TargetSummary } from '../view/TargetSummary'
import { AddTargetDialog } from '../view/AddTargetDialog'

@Preview
@Entry
@Component
struct MainPage {
  @State target: Target = mainViewModel.getTarget()
  @State isEdit: Boolean = false
  onConfirm = (text: string) => {
    console.log(`text = ${text}`)
  }
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({ onConfirm: this.onConfirm }),
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
  })

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
      .layoutWeight(1)

      Button(this.isEdit ? $r('app.string.mainPage_delete') : $r('app.string.mainPage_add'), {
        type: ButtonType.Capsule,
        stateEffect: false
      })
        .onClick(() => {
          this.dialogController.open()
        })
        .fontColor(this.isEdit ? $r('app.color.setting_button_fontColor') : $r('app.color.login_button_color'))
        .fontSize(15)
        .height(40)
        .borderRadius(4)
        .backgroundColor($r('app.color.setting_button_backgroundColor'))
        .alignSelf(ItemAlign.Center)
    }
    .padding(20)
    .height('100%')
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
    .alignItems(HorizontalAlign.Start)
  }
}