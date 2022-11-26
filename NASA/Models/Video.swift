//
//  Video.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import Foundation

struct Video {
    let videoURL: String
    let image: String
    let title: String
    
    static func getVideos() -> [Video] {
        let dataStore = DataStore.shared
        
        var videos: [Video] = []
        
        let videosURLCount = dataStore.videosURL.count
        let imagesCount = dataStore.images.count
        let titlesCount = dataStore.titles.count
        
        let count = min(videosURLCount, imagesCount, titlesCount)
        
        for index in 0..<count {
            videos.append(Video(
                videoURL: dataStore.videosURL[index],
                image: dataStore.images[index],
                title: dataStore.titles[index]
            ))
        }
        return videos
    }
}
