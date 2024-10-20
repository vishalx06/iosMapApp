//
//  Location.swift
//  MapApp
//
//  Created by Vishal Sharma on 31/08/24.
//

import Foundation
import MapKit

struct Location: Identifiable {
//    let id = UUID().uuidString
    let name: String
    let cityName: String
    let coordinates: CLLocationCoordinate2D
    let description: String
    let imageNames: [String]
    let link: String
    
    // Identifiable
    var id: String {
    // name = "Colosseum"
    // cityName = "Rome"
    // id = "ColosseumRome"
    name + cityName
    }
}
