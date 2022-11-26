//
//  PictureCell.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import UIKit
import Kingfisher

class PictureCell: UICollectionViewCell {
    
    
    @IBOutlet var pictImage: UIImageView!
    
    @IBOutlet var titleLabel: UILabel!
    
    
    func configure(with picture: Picture) {
        titleLabel.text = picture.title
        
        guard let imageURL = URL(string: picture.url) else { return }
        let processor = DownsamplingImageProcessor(size: pictImage.bounds.size)
        pictImage.kf.indicatorType = .activity
        pictImage.kf.setImage(
            with: imageURL,
            options: [
                .processor(processor),
                .scaleFactor(UIScreen.main.scale),
                .transition(.fade(1)),
                .cacheOriginalImage
            ]
        ) { result in
                switch result {
                case .success(let value):
                    print("Task done for: \(value.source.url?.lastPathComponent ?? "")")
                case .failure(let error):
                    print("Job failed: \(error.localizedDescription)")
                }
            }
    }
}
