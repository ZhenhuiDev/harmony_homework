"use strict";
struct Login extends   {
    constructor() { }
    imageButton(src) {
            .height($r('app.float.other_login_image_size'))
            .width($r('app.float.other_login_image_size'))
            .backgroundColor($r('app.color.background'));
    }
    login() {
    }
    build() {
        .backgroundColor($r('app.color.background'))
            .height('100%')
            .width('100%')
            .padding({
            left: $r('app.float.page_padding_hor'),
            right: $r('app.float.page_padding_hor'),
            bottom: $r('app.float.login_page_padding_bottom')
        });
    }
}
function inputStyle() {
    
  
        .placeholderColor($r('app.color.placeholder_color'))
        .height($r('app.float.login_input_height'))
        .fontSize($r('app.float.big_text_size'))
        .backgroundColor($r('app.color.background'))
        .width('100%')
        .padding({ left: 0 })
        .margin({ top: $r('app.float.input_margin_top') });
}
function lineStyle() {
    
  
        .width('100%')
        .height($r('app.float.line_height'))
        .backgroundColor($r('app.color.line_color'));
}
function blueTextStyle() {
    
  
        .fontColor($r('app.color.login_blue_text_color'))
        .fontSize($r('app.float.small_text_size'))
        .fontWeight(FontWeight.Medium);
}
//# sourceMappingURL=Login.js.map