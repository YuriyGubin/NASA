//
//  PicCollectionViewCell.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import UIKit
import Kingfisher

class PicCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet var pictImage: UIImageView!
    
    @IBOutlet var titleTextView: UITextView!
    
    func configure(with picture: Picture) {
        //titleTextView.text = picture.title
        pictImage.frame.size.width = superview?.frame.width ?? 100
        
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
    
//    func configure(with picture: Picture) {
//        titleTextView.text = picture.title
//
//        DispatchQueue.global().async {
//            let stringUrl = picture.url
//            guard let imageUrl = URL(string: stringUrl) else { return }
//            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
//
//            DispatchQueue.main.async {
//                self.pictImage.image = UIImage(data: imageData)
//            }
//        }
//    }
}
