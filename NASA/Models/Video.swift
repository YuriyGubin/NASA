//
//  Video.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import Foundation

struct Video {
    let videoID: String
    let title: String
    
    static func getVideos() -> [Video] {
        let dataStore = DataStore.shared
        
        var videos: [Video] = []
        
        let videosURLCount = dataStore.videosIDs.count
        let titlesCount = dataStore.titles.count
        
        let count = min(videosURLCount, titlesCount)
        
        for index in 0..<count {
            videos.append(Video(
                videoID: dataStore.videosIDs[index],
                title: dataStore.titles[index]
            ))
        }
        return videos
    }
}
