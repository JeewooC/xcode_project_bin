//
//  Point.swift
//  MapApp
//
//  Created by Jeewoo Chung on 7/30/19.
//  Copyright © 2019 Jeewoo Chung. All rights reserved.
//

import Foundation
import MapKit
import Contacts

class Point: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var category: String
    var notes: String
    
    init(title: String, cord: CLLocationCoordinate2D, category: String, notes: String) {
        self.title = title
        self.coordinate = cord
        self.category = category
        self.notes = notes
        
        super.init()
    }
    
    var subtitle: String? {
        get {
            return category
        }
    }
    
    func mapItem() -> MKMapItem {
        let addressDict = [CNPostalAddressStreetKey: subtitle!]
        let placemark = MKPlacemark(coordinate: coordinate, addressDictionary: addressDict)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = title
        return mapItem
    }
}
