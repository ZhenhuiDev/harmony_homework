import http from '@ohos.net.http';
import { FiveDayWeather } from './FiveDayWeather';
import { IntradayWeather } from './IntradayWeather';

export class WeatherViewModel {
  private httpRequest = http.createHttp();

  async getIntradayWeatherData(): Promise<IntradayWeather> {
    let response = await this.httpRequest.request(
      'https://api.openweathermap.org/data/2.5/weather?units=metric&lang=zh_cn&appid=7ce48fbdedcc72653e589f93b4da7ee4&q=Chengdu,CN',
      {
        method: http.RequestMethod.GET,
        header: { 'Content-Type': 'application/json' }
      }
    );
    console.log(`intraday weathre, code = ${response.responseCode}, type = ${response.resultType}, data = ${response.result}`)
    if (response.responseCode == http.ResponseCode.OK) {
      return response.result as IntradayWeather
    } else {
      throw new Error(`request intraday weather failed, msg = ${response.result}`)
    }
  }

  async getFiveDayWeatherData(): Promise<FiveDayWeather> {
    let response = await this.httpRequest.request(
      'https://api.openweathermap.org/data/2.5/forecast?appid=7ce48fbdedcc72653e589f93b4da7ee4&units=metric&lang=zh_cn&q=Chengdu,CN',
      {
        method: http.RequestMethod.GET,
        header: { 'Content-Type': 'application/json' }
      }
    );
    console.log(`five day weathre, code = ${response.responseCode}, type = ${response.resultType}, data = ${response.result}`)
    if (response.responseCode == http.ResponseCode.OK) {
      return response.result as FiveDayWeather
    } else {
      throw new Error(`request five day weather failed, msg = ${response.result}`)
    }
  }
}

export default new WeatherViewModel();