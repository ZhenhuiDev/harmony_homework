import { FiveDayWeather } from '../viewmodel/FiveDayWeather'
import { IntradayWeather } from '../viewmodel/IntradayWeather'

@Preview
@Entry
@Component
struct Weather {
  @State loading: boolean = true
  @State fiveDayWeather: FiveDayWeather | null = null
  @State intradayWeather: IntradayWeather | null = null

  build() {
    Column() {
      if (IntradayWeather == null || FiveDayWeather == null) {
        LoadingProgress()
          .color(Color.Blue)
          .width('50%')
          .alignSelf(ItemAlign.Center)
      } else {

      }
    }
    .width('100%')
    .height('100%')
  }
}