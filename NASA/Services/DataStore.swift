//
//  DataStore.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import Foundation

struct DataStore {
    
    static let shared = DataStore()
    
    let videosIDs = [
        "o2FFtPPM3iY",
        "DMZ5WFRbSTc",
        "ehUIlhKhzDA",
        "nBN3jheTBG0",
        "GAGFC8-wn1g",
        "vH298zSCQzY",
        "SN5-DnOHQmE",
        "o33NZIlfKys",
        "6UYLRJ6uylg",
        "N_Igfs9aS1A"
    ]
    
    let titles = [
        "How Do We Launch Things into Space?",
        "Solar System Size and Distance",
        "Why Is the Sky Blue?",
        "What is a Solar Eclipse?",
        "Where Does the Sun's Energy Come From?",
        "What's the difference between weather and climate?",
        "What Is the Greenhouse Effect?",
        "Our Moon Isn't the Only Moon!",
        "Color the Galaxy with NASA Space Crafts",
        "NASA Space Crafts: Mars Perseverance Rover"
    ]
    
    private init() {}
    
}
