//
//  VideoCell.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import UIKit
import AVKit
import youtube_ios_player_helper

class VideoCell: UICollectionViewCell {

    @IBOutlet var playerView: YTPlayerView!
    
    func configure(with video: Video) {
        playerView.load(withVideoId: video.videoID)
    }

}
