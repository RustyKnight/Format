//
//  CNMutablePostalAddress+CLPlacemark.swift
//  Format
//
//  Created by Shane Whitehead on 16/2/19.
//  Copyright © 2019 Roy Marmelstein. All rights reserved.
//

import Foundation
import CoreLocation
import Contacts

@available(iOS 9.0, *)
extension CNMutablePostalAddress {
  convenience init(placemark: CLPlacemark) {
    self.init()
    street = [placemark.subThoroughfare, placemark.thoroughfare]
      .compactMap { $0 }           // remove nils, so that...
      .joined(separator: " ")      // ...only if both != nil, add a space.
    /*
     // Equivalent street assignment, w/o flatMap + joined:
     if let subThoroughfare = placemark.subThoroughfare,
     let thoroughfare = placemark.thoroughfare {
     street = "\(subThoroughfare) \(thoroughfare)"
     } else {
     street = (placemark.subThoroughfare ?? "") + (placemark.thoroughfare ?? "")
     }
     */
    city = placemark.locality ?? ""
    state = placemark.administrativeArea ?? ""
    postalCode = placemark.postalCode ?? ""
    country = placemark.country ?? ""
    isoCountryCode = placemark.isoCountryCode ?? ""
    if #available(iOS 10.3, *) {
      subLocality = placemark.subLocality ?? ""
      subAdministrativeArea = placemark.subAdministrativeArea ?? ""
    }
  }
}
