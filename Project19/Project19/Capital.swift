//
//  Capital.swift
//  Project19
//
//  Created by Medi Assumani on 11/15/18.
//  Copyright © 2018 Medi Assumani. All rights reserved.
//

import UIKit
import MapKit

class Capital: NSObject, MKAnnotation {
    
    var title: String?
    var coordinate: CLLocationCoordinate2D
    var info: String

    init(title: String, coordinate: CLLocationCoordinate2D, info: String) {
        self.title = title
        self.coordinate = coordinate
        self.info = info
    }
}
