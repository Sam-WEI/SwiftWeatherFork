//
//  Created by Jake Lin on 9/9/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import Foundation

struct Temperature {
  let degrees: String

  init(country: String, openWeatherMapDegrees: Double) {
    if country == "US" {
      degrees = String(TemperatureConverter.kelvinToFahrenheit(degrees: openWeatherMapDegrees)) + "\u{f045}"
    } else {
      degrees = String(TemperatureConverter.kelvinToCelsius(degrees: openWeatherMapDegrees)) + "\u{f03c}"
    }
  }
}
