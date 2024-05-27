import { Target, TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'
import { SubTarget } from '../view/SubTarget'
import { TargetSummary } from '../view/TargetSummary'
import { AddTargetDialog } from '../view/AddTargetDialog'
import TargetList from '../view/TargetList'

@Preview
@Entry
@Component
struct MainPage {
  @State isEdit: boolean = false
  @State target: Target = mainViewModel.getTarget()
  @State targetItemList: TargetItem[] = mainViewModel.getTargetItemList()
  onConfirm = (text: string) => {
    mainViewModel.addTargetItem(new TargetItem(text, 0, Date.now()))
    this.targetItemList = mainViewModel.getTargetItemList()
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

      TargetList({ itemList: $targetItemList, onAddClick: () => this.dialogController.open() }).layoutWeight(1)
    }
    .padding(20)
    .height('100%')
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
    .alignItems(HorizontalAlign.Start)
  }
}

