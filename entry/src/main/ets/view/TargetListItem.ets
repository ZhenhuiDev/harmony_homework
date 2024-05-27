import { getCurrentTime } from '../util/DateUtil';
import { TargetItem } from '../viewmodel/Target'
import mainViewModel from '../viewmodel/MainViewModel'

@Component
export struct TargetListItem {
  @Prop isEdit: boolean
  @ObjectLink item: TargetItem
  @Link selectArr: Array<boolean>;
  @Link @Watch('onClickIndexChanged') clickIndex: number;
  @State isExpanded: boolean = false;
  @State latestProgress: number = 0;
  @State updateTime: string = '';
  public index: number = 0;
  @Consume overAllProgressChanged: boolean;

  aboutToAppear() {
    this.latestProgress = this.item?.progress;
    this.updateTime = this.item?.updateTime;
  }

  onClickIndexChanged() {
    if (this.clickIndex !== this.index) {
      this.isExpanded = false;
    }
  }

  build() {
    Column() {
      Row() {
        Text(this.item.name).fontSize($r('app.float.normal_text_size'))
        Blank()
        Column() {
          Text(`${this.latestProgress}%`)
            .fontSize($r('app.float.big_text_size'))
            .fontWeight(FontWeight.Bold)
            .fontColor($r('app.color.title_text_color'))
          Row() {
            Text($r('app.string.mainPage_update_time'))
              .fontSize($r('app.float.little_text_size'))
              .fontColor($r('app.color.login_more_text_color'))
            Text(this.updateTime)
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
      }
      .width('100%')

      if (this.isExpanded) {
        Row() {
          Text($r('app.string.cancel'))
            .fontSize($r('app.float.big_text_size'))
            .fontColor($r('app.color.login_button_color'))
            .padding({ top: 10, bottom: 10 })
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .onClick(() => this.isExpanded = false)
          Text($r('app.string.confirm'))
            .fontSize($r('app.float.big_text_size'))
            .fontColor($r('app.color.login_button_color'))
            .padding({ top: 10, bottom: 10 })
            .layoutWeight(1)
            .textAlign(TextAlign.Center)
            .onClick(() => {
              this.latestProgress = 100;
              this.updateTime = getCurrentTime();
              let result = mainViewModel.updateProgress(this.index, this.latestProgress, this.updateTime);
              if (result) {
                this.overAllProgressChanged = !this.overAllProgressChanged;
              }
              this.isExpanded = false;
            })
        }.transition({ scale: { x: 0, y: 0 } })
      }
    }
    .backgroundColor(Color.White)
    .border({ radius: 10 })
    .width('100%')
    .padding(20)
    .onClick(() => {
      if (!this.isEdit) {
        animateTo({ duration: 300 }, () => {
          this.isExpanded = !this.isExpanded;
        })
        this.clickIndex = this.index;
      }
    })
  }
}