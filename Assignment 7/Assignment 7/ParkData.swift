//
//  ParkData.swift
//  Assignment 7
//
//  Created by user287375 on 12/6/25.
//

import Foundation

struct ParkData {
    static let allParks: [Park] = [
        Park(name: "Yellowstone",
             location: "Wyoming, Montana, Idaho",
             shortDescription: "America's first national park, known for geysers and wildlife.",
             imageName: "yellowstone"),
        
        Park(name: "Yosemite", location: "California", shortDescription: "Massive granite cliffs, waterfalls and giant sequoias", imageName: "yosemite"),
        
        Park(name: "Grand Canyon", location: "Arizonia", shortDescription: "Famous canyon carved by the Colorado River.", imageName: "grand canyon"),
        
        Park(name: "Zion", location: "Utah", shortDescription: "Steep red cliffs and narrow canyons.", imageName: "zion"),
        
        Park(name: "Rocky Mountain", location: "Colorado", shortDescription: "High peaks, alpine lakes, and scenic drives.", imageName: "rocky mountain"),
        
        Park(name: "Glacier", location: "Montana", shortDescription: "Glacier carved peaks and Going-to-the-Sun Road.", imageName: "glacier"),
        
        Park(name: "Acadia", location: "Maine", shortDescription: "Coastal park with rocky shores and Cadillac Mountain.", imageName: "acadia"),
        
        Park(name: "Everglades", location: "Florida", shortDescription: "Vast wetlands home to aligators and manatees.", imageName: "everglades"),
        
        Park(name: "Great Smoky Mountains", location: "Tennessee, North Carolina", shortDescription: "America's most visited national park famous for smoky ridges.", imageName: "great smokey mountains"),
        
        Park(name: "Arches", location: "Utah", shortDescription: "Over 2,000 natural stone arches and red rock formations.", imageName: "arches")
    ]
}
