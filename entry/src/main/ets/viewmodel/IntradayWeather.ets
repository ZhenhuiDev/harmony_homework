import { Coordinate } from './Coordinate';
import { WeatherDetail } from './WeatherDetail';
import { WeatherMain } from './WeatherMain';

export class IntradayWeather {
  id: number;
  cod: number;
  name: string;
  timezone: number;
  coord: Coordinate;
  weather: WeatherDetail;
  base: string;
  main: WeatherMain;
}