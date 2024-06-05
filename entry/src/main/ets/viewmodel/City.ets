import { Coordinate } from './Coordinate';

export class City {
  id: number;
  name: string;
  coord: Coordinate;
  country: string;
  population: number;
  timezone: number;
  sunrise: number;
  sunset: number;

  constructor(id: number, name: string, coord: Coordinate, country: string, population: number, timezone: number, sunrise: number, sunset: number) {
    this.id = id;
    this.name = name;
    this.coord = coord;
    this.country = country;
    this.population = population;
    this.timezone = timezone;
    this.sunrise = sunrise;
    this.sunset = sunset;
  }
}