//
//  VideoCell.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import UIKit
import AVKit

class VideoCell: UICollectionViewCell {
    
    @IBOutlet var videoImageView: UIImageView!
    
    @IBOutlet var videoTitleLabel: UILabel!
    
    
    func configure(with video: Video) {
        videoImageView.image = UIImage(named: video.image)
        videoTitleLabel.text = video.title
        
        
    }
}
