import { FiveDayWeather } from '../viewmodel/FiveDayWeather'
import { IntradayWeather } from '../viewmodel/IntradayWeather'
import viewModel from '../viewmodel/WeatherViewModel'

@Preview
@Entry
@Component
struct Weather {
  @State isError: boolean = false
  @State intradayWeather: IntradayWeather | null = null
  @State fiveDayWeather: FiveDayWeather | null = null

  aboutToAppear() {
    viewModel.getIntradayWeatherData()
      .then((data) => this.intradayWeather = data)
      .catch(() => this.isError = true)
    viewModel.getFiveDayWeatherData()
      .then((data) => this.fiveDayWeather = data)
      .catch(() => this.isError = true)
  }

  build() {
    Column() {
      if (this.isError) {
        Text('request data failed').textAlign(TextAlign.Center).width('100%').height('100%')
      } else if (IntradayWeather == null || FiveDayWeather == null) {
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