@Preview
@CustomDialog
export struct AddTargetDialog {
  @State textValue: string = ''
  controller?: CustomDialogController
  onConfirm: (text: string) => void

  build() {
    Column() {
      Text($r('app.string.dialog_add'))
        .fontWeight(FontWeight.Bold)
        .fontColor($r('app.color.title_text_color'))
        .fontSize($r('app.float.page_title_text_size'))
      TextInput({ placeholder: $r('app.string.dialog_placeholder'), text: this.textValue }).height(60).width('90%')
        .onChange((value: string) => {
          this.textValue = value
        })
        .margin({ top: 20, bottom: 20 })

      Row() {
        Text($r('app.string.cancel'))
          .buttonStyle()
          .onClick(() => {this.controller?.close()})
        Text($r('app.string.confirm'))
          .buttonStyle()
          .onClick(() => {
            this.controller?.close()
            this.onConfirm(this.textValue)
          })
      }
    }
    .alignItems(HorizontalAlign.Start)
    .borderRadius(10)
    .padding(20)
  }
}

@Extend(Text) function buttonStyle() {
  .fontSize($r('app.float.big_text_size'))
  .fontColor($r('app.color.login_blue_text_color'))
  .textAlign(TextAlign.Center)
  .height(40)
  .layoutWeight(1)
}