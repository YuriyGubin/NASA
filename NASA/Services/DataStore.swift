//
//  DataStore.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import Foundation

struct DataStore {
    
    static let shared = DataStore()
    
    let videosURL = [
        "https://www.youtube.com/watch?v=o2FFtPPM3iY&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=1",
        "https://www.youtube.com/watch?v=DMZ5WFRbSTc&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=2",
        "https://www.youtube.com/watch?v=ehUIlhKhzDA&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=3",
        "https://www.youtube.com/watch?v=ehUIlhKhzDA&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=4",
        "https://www.youtube.com/watch?v=GAGFC8-wn1g&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=5",
        "https://www.youtube.com/watch?v=vH298zSCQzY&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=6",
        "https://www.youtube.com/watch?v=vH298zSCQzY&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=7",
        "https://www.youtube.com/watch?v=vH298zSCQzY&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=8",
        "https://www.youtube.com/watch?v=vH298zSCQzY&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=9",
        "https://www.youtube.com/watch?v=vH298zSCQzY&list=PL2aBZuCeDwlQHIpnk-mRVKL_VQCOIsCS_&index=10"
    ]
    
    let images = [
        "LessonOne",
        "LessonTwo",
        "LessonThree",
        "LessonFour",
        "LessonFive",
        "LesssonSix",
        "LessonSeven",
        "LessonEight",
        "LessonNine",
        "LessonTen"
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
