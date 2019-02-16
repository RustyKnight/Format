//
//  AddressExtensions.swift
//  Format
//
//  Created by Roy Marmelstein on 15/11/2015.
//  Copyright © 2015 Roy Marmelstein. All rights reserved.
//

import Foundation
import CoreLocation
import Contacts

@available(iOS 9.0, *)
public extension CLPlacemark {
  /**
   Formats a CLPlacemark to a string corresponding to the current locale's formatting rules.
   
   - returns: Formatted address string.
   */
  @available(iOS 9.0, *)
  public func format() -> String {
    let address = CNMutablePostalAddress(placemark: self)
    let formatter = CNPostalAddressFormatter()    
    return formatter.string(from: address)
  }
}
