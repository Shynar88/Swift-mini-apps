//
//  Place.swift
//  MapApp
//
//  Created by Zhanserik on 6/19/17.
//  Copyright © 2017 Kenes Inc. All rights reserved.
//

import Foundation
import MapKit

class Place: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D = CLLocationCoordinate2D(latitude: 0, longitude: 0)
    var title: String?
    var subtitle: String?
    var color: UIColor?
    init(coordinate: CLLocationCoordinate2D, title: String?, subtitle: String?, color: UIColor?) {
        self.coordinate = coordinate
        self.title = title
        self.subtitle = subtitle
        self.color = color
    }
}
