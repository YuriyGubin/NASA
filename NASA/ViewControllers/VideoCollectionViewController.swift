//
//  VideoCollectionViewController.swift
//  NASA
//
//  Created by Yuriy on 26.11.2022.
//

import UIKit
import AVKit

class VideoCollectionViewController: UICollectionViewController {
    
    private let videos = Video.getVideos()

    override func viewDidLoad() {
        super.viewDidLoad()
    }


    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        videos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "video",
            for: indexPath
        ) as? VideoCell else {
            return UICollectionViewCell()
            
        }
        
        let video = videos[indexPath.item]
        cell.configure(with: video)
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let video = videos[indexPath.item]
        
        let videoURL = URL(string: video.videoURL)
        let player = AVPlayer(url: (videoURL ?? URL(string: "https://youtu.be/TnPtNw38p2g")!))
                              
        let playerViewController = AVPlayerViewController()
        playerViewController.player = player
                              
        present(playerViewController, animated: true) {
            player.play()
        }
    }
}

extension VideoCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width, height: view.bounds.width * 0.8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        10
    }
}
