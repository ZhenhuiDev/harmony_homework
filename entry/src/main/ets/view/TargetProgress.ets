@Component
export struct TargetProgress {
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