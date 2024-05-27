import { Target, TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'
import { SubTarget } from '../view/SubTarget'
import { TargetSummary } from '../view/TargetSummary'
import { AddTargetDialog } from '../view/AddTargetDialog'

@Preview
@Entry
@Component
struct MainPage {
  @State isEdit: boolean = false
  @State target: Target = mainViewModel.getTarget()
  @State targetItemList: TargetItem[] = mainViewModel.getTargetItemList()
  @State selectArray: Array<boolean> = [];
  @State selectAll: boolean = false;
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
  onCancel = () => {
    this.selectAll = false;
    this.isEdit = false;
    this.selectAllOrCancel(false);
  }
  onEdit = () => {
    this.isEdit = true;
    this.selectAllOrCancel(false);
  }

  build() {
    Column() {
      Text($r('app.string.mainPage_title'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_text_color'))

      Line().width('100%').height(20)

      TargetSummary({ target: $target })

      Line().width('100%').height(20)

      Row() {
        Text($r('app.string.mainPage_subTarget'))
          .fontSize($r('app.float.big_text_size'))
          .fontWeight(FontWeight.Medium)
          .fontColor($r('app.color.title_text_color'))

        Blank()

        if (this.isEdit) {
          Text($r('app.string.mainPage_chose_cancel'))
            .padding(5)
            .fontColor($r('app.color.login_blue_text_color'))
            .onClick(() => this.isEdit = false)
          Text($r('app.string.mainPage_chose_all'))
            .margin({ left: 10 })
            .fontColor($r('app.color.login_blue_text_color'))
          Checkbox()
            .select(this.isSelectAll())
            .selectedColor($r('app.color.mainPage_selected'))
            .onClick(() => {
              this.selectAll = !this.selectAll;
              this.selectAllOrCancel(this.selectAll);
            })
            .width(20)
            .height(20)
        } else {
          Text($r('app.string.mainPage_chose_edit'))
            .padding(5)
            .fontColor($r('app.color.login_blue_text_color'))
            .onClick(this.onEdit)
        }
      }.height(25).width('100%')

      Line().width('100%').height(20)

      List({ space: 20 }) {
        ForEach(this.targetItemList, (item: TargetItem, index: number | undefined) => {
          ListItem() {
            SubTarget({
              isEdit: this.isEdit,
              item: item,
              index: index,
              selectArr: $selectArray,
            })
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
        .onClick(() => this.dialogController.open())
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

  selectAllOrCancel(selectStatus: boolean) {
    let newSelectArray: Array<boolean> = [];
    this.target.targetItemList.forEach(() => {
      newSelectArray.push(selectStatus);
    });
    this.selectArray = newSelectArray;
  }

  deleteSelected() {
    // TODO
    // DataModel.deleteData(this.selectArray);
    // this.targetData = DataModel.getData();
    // this.overAllProgressChanged = !this.overAllProgressChanged;
    // this.isEditMode = false;
  }

  isSelectAll(): boolean {
    if (this.selectArray.length === 0) {
      return false;
    }
    let deSelectCount: Length = this.selectArray.filter((selected: boolean) => selected === false).length;
    if (deSelectCount === 0) {
      this.selectAll = true;
      return true;
    }
    this.selectAll = false;
    return false;
  }
}

