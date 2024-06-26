import { TargetItem } from '../viewmodel/Target';
import { TargetListItem } from './TargetListItem';
import mainViewModel from '../viewmodel/MainViewModel'

@Component
export default struct TargetList {
  @Link itemList: TargetItem[];
  @State isEdit: boolean = false;
  @State selectAll: boolean = false;
  @State selectArray: Array<boolean> = [];
  @Consume overAllProgressChanged: boolean;
  @State clickIndex: number = -1;
  onAddClick?: () => void;

  build() {
    Column() {
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
            .onClick(() => {
              this.isEdit = true;
              this.selectAllOrCancel(false);
            })
        }
      }.height(25).width('100%')

      Line().width('100%').height(20)

      List({ space: 20 }) {
        ForEach(this.itemList, (item: TargetItem, index: number | undefined) => {
          ListItem() {
            TargetListItem({
              isEdit: this.isEdit,
              item: item,
              clickIndex: $clickIndex,
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
        .onClick(() => {
          if (this.isEdit) {
            this.deleteSelected();
            this.selectAllOrCancel(false);
            this.selectAll = false;
          } else {
            this.onAddClick()
          }
        })
        .fontColor(this.isEdit ? $r('app.color.setting_button_fontColor') : $r('app.color.login_button_color'))
        .fontSize(15)
        .height(40)
        .borderRadius(4)
        .backgroundColor($r('app.color.setting_button_backgroundColor'))
        .alignSelf(ItemAlign.Center)
    }
  }

  selectAllOrCancel(selectStatus: boolean) {
    let newSelectArray: Array<boolean> = [];
    this.itemList.forEach(() => {
      newSelectArray.push(selectStatus);
    });
    this.selectArray = newSelectArray;
  }

  deleteSelected() {
    mainViewModel.deleteData(this.selectArray);
    this.itemList = mainViewModel.getTargetItemList();
    this.overAllProgressChanged = !this.overAllProgressChanged;
    this.isEdit = false;
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