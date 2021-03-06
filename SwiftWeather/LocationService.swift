//
//  Created by Jake Lin on 9/2/15.
//  Copyright © 2015 Jake Lin. All rights reserved.
//

import Foundation
import CoreLocation

protocol LocationServiceDelegate {
  func locationDidUpdate(service: LocationService, location: CLLocation)
}

class LocationService: NSObject {
  var delegate: LocationServiceDelegate?

  fileprivate let locationManager = CLLocationManager()

  override init() {
    super.init()

    locationManager.delegate = self
    locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
  }

  func requestLocation() {
    //locationManager.requestWhenInUseAuthorization()
    //locationManager.requestLocation()
    delegate?.locationDidUpdate(service: self, location: CLLocation(latitude: 40.71, longitude: -74.00))
  }
}

// MARK: - CLLocationManagerDelegate
extension LocationService : CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            print("Current location: \(location)")
            delegate?.locationDidUpdate(service: self, location: location)
        }
    }
    
    
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error finding location: \(error.errorCode)")
    }

 
}
