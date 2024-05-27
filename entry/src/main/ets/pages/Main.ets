import { Target, TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'
import { TargetSummary } from '../view/TargetSummary'
import { AddTargetDialog } from '../view/AddTargetDialog'
import TargetList from '../view/TargetList'
import { getCurrentTime } from '../util/DateUtil'

@Preview
@Entry
@Component
struct MainPage {
  @State target: Target = mainViewModel.getTarget()
  @State targetItemList: TargetItem[] = mainViewModel.getTargetItemList()
  @State totalTasksNumber: number = 0;
  @State completedTasksNumber: number = 0;
  @State latestUpdateDate: string = '-';
  @Provide @Watch('onProgressChanged') overAllProgressChanged: boolean = false;
  onConfirm = (text: string) => {
    mainViewModel.addTargetItem(new TargetItem(text, 0, getCurrentTime()))
    this.targetItemList = mainViewModel.getTargetItemList()
    this.overAllProgressChanged = !this.overAllProgressChanged;
  }
  dialogController: CustomDialogController = new CustomDialogController({
    builder: AddTargetDialog({ onConfirm: this.onConfirm }),
    autoCancel: false,
    alignment: DialogAlignment.Bottom,
    offset: { dx: 0, dy: -20 },
  })

  onProgressChanged() {
    this.totalTasksNumber = this.target.targetItemList.length;
    this.completedTasksNumber = this.target.targetItemList.filter((item: TargetItem) => item.progress === 100).length;
    this.latestUpdateDate = getCurrentTime();
  }

  build() {
    Column() {
      Text($r('app.string.mainPage_title'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_text_color'))

      Line().width('100%').height(20)

      TargetSummary({
        targetName: this.target.name,
        targetDesc: this.target.desc,
        latestUpdateDate: this.latestUpdateDate,
        totalTasksNumber: this.totalTasksNumber,
        completedTasksNumber: this.completedTasksNumber
      })

      Line().width('100%').height(20)

      TargetList({ itemList: $targetItemList, onAddClick: () => this.dialogController.open() }).layoutWeight(1)
    }
    .padding(20)
    .height('100%')
    .backgroundColor($r('app.color.mainPage_backgroundColor'))
    .alignItems(HorizontalAlign.Start)
  }
}

