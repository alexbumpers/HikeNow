//
//  Places.swift
// HikeNow
//
//  Created by Alex Bumpers on 4/9/18.
//  Copyright © 2018 Alex Bumpers. All rights reserved.
//

import Foundation
import MapKit

struct Places: Codable {
    var searchItem: String
    var tripLength: Int
    var leaveDate: Date
    var returnDate: Date
    
//    init(searchItem: String, tripLength: Int) {
//        self.searchItem = searchItem
//        self.tripLength = tripLength
//    }
    
    static let documentsDirectory =
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let archiveURL =
        documentsDirectory.appendingPathComponent("places").appendingPathExtension("plist")
    
    static func loadFromFile() -> [Places]? {
        guard let codedPlaces = try? Data(contentsOf: archiveURL) else {return nil}
        let decoder = PropertyListDecoder()
        return try? decoder.decode(Array<Places>.self, from: codedPlaces)
    }
    
    static func saveToFile(places: [Places]) {
        let propertyListEncoder = PropertyListEncoder()
        let codedPlaces = try? propertyListEncoder.encode(places)
        try? codedPlaces?.write(to: archiveURL, options: .noFileProtection)
    }
    
    static func loadSamplePlaces() -> [Places] {
        let myTripsTableViewController = MyTripsTableViewController()
        let places_collection = myTripsTableViewController.places
        return places_collection
    }
    
}
