import { City } from './City';
import { WeatherDetail } from './WeatherDetail';
import { WeatherMain } from './WeatherMain';

export class FiveDayWeather {
  cod: string;
  message: number;
  cnt: number;
  list: FiveDayWeatherItem[];
  city: City;
}

export class FiveDayWeatherItem {
  weather: WeatherDetail;
  base: string;
  main: WeatherMain;
  dt_txt: string;
}