//
//  Landmark.swift
//  Landmarks
//
//  Created by Ke Ma on 25/09/2020.
//  Copyright © 2020 Ke. All rights reserved.
//

import SwiftUI
import CoreLocation

struct Landmark: Hashable, Codable {
    var id: Int
    var name: String
    fileprivate var imageName: String
    fileprivate var coordinate: Coordinates
    var state: String
    var park: String
    var category: Category
    
    var locationCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude)
    }
    
    enum Category: String, CaseIterable, Codable, Hashable {
        case featured = "Featured"
        case lakes = "Lakes"
        case rivers = "Rivers"
    }
}

extension Landmark {
    var image: Image {
        ImageStore.shared.image(name: imageName)
    }
}

struct Coordinates: Hashable, Codable  {
    var latitude: Double
    var longitude: Double
}
