@Preview
@Entry
@Component
struct Login {
  @State account: string = '';
  @State password: string = '';

  @Builder
  imageButton(src: Resource) {
    Button({ type: ButtonType.Circle, stateEffect: true }) {
      Image(src)
    }
    .height($r('app.float.other_login_image_size'))
    .width($r('app.float.other_login_image_size'))
    .backgroundColor($r('app.color.background'))
  }

  login(): void {
    console.log('login clicked');
  }

  build() {
    Column() {
      Image($r('app.media.app_icon'))
        .width($r('app.float.logo_image_size'))
        .height($r('app.float.logo_image_size'))
        .margin({ top: $r('app.float.logo_margin_top'), bottom: $r('app.float.logo_margin_bottom') })
      Text($r('app.string.login_page'))
        .fontSize($r('app.float.page_title_text_size'))
        .fontWeight(FontWeight.Medium)
        .fontColor($r('app.color.title_text_color'))
      Text($r('app.string.login_more'))
        .fontSize($r('app.float.normal_text_size'))
        .fontColor($r('app.color.login_more_text_color'))
        .margin({ bottom: $r('app.float.login_more_margin_bottom'), top: $r('app.float.login_more_margin_top') })
      TextInput({ placeholder: $r('app.string.account') })
        .maxLength(11)
        .type(InputType.Number)
        .inputStyle()
        .onChange((value: string) => {
          this.account = value;
        })
      Line().lineStyle()
      TextInput({ placeholder: $r('app.string.password') })
        .maxLength(8)
        .type(InputType.Password)
        .inputStyle()
        .onChange((value: string) => {
          this.password = value;
        })
      Row() {
        Text($r('app.string.sms_login')).blueTextStyle()
        Text($r('app.string.forget_password')).blueTextStyle()
      }
      .justifyContent(FlexAlign.SpaceBetween)
      .width('100%')
      .margin({ top: $r('app.float.forgot_margin_top') })

      Button($r('app.string.login'), { type: ButtonType.Capsule })
        .width('90%')
        .height($r('app.float.login_button_height'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
        .backgroundColor($r('app.color.login_button_color'))
        .margin({ top: $r('app.float.login_button_margin_top'), bottom: $r('app.float.login_button_margin_bottom') })
        .onClick(() => {
          this.login();
        })
      Text($r('app.string.register_account'))
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize($r('app.float.normal_text_size'))
        .fontWeight(FontWeight.Medium)
      Blank()
      Text($r('app.string.other_login_method'))
        .fontColor($r('app.color.other_login_text_color'))
        .fontSize($r('app.float.little_text_size'))
        .fontWeight(FontWeight.Medium)
        .margin({ top: $r('app.float.other_login_margin_top'), bottom: $r('app.float.other_login_margin_bottom') })
      Row({ space: 44 }) {
        this.imageButton($r('app.media.app_icon'))
        this.imageButton($r('app.media.app_icon'))
        this.imageButton($r('app.media.app_icon'))
      }
    }.backgroundColor($r('app.color.background'))
    .height('100%')
    .width('100%')
    .padding({
      left: $r('app.float.page_padding_hor'),
      right: $r('app.float.page_padding_hor'),
      bottom: $r('app.float.login_page_padding_bottom')
    })
  }
}

@Extend(TextInput) function inputStyle() {
  .placeholderColor($r('app.color.placeholder_color'))
  .height($r('app.float.login_input_height'))
  .fontSize($r('app.float.big_text_size'))
  .backgroundColor($r('app.color.background'))
  .width('100%')
  .padding({ left: 0 })
  .margin({ top: $r('app.float.input_margin_top') })
}

@Extend(Line) function lineStyle() {
  .width('100%')
  .height($r('app.float.line_height'))
  .backgroundColor($r('app.color.line_color'))
}

@Extend(Text) function blueTextStyle() {
  .fontColor($r('app.color.login_blue_text_color'))
  .fontSize($r('app.float.small_text_size'))
  .fontWeight(FontWeight.Medium)
}