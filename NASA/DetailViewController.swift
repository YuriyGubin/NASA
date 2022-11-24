//
//  DetailViewController.swift
//  NASA
//
//  Created by Yuriy on 23.11.2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet var pictImage: UIImageView!
    
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var explanationTextVeiw: UITextView!
    
    var detail: Picture!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       
    }
    

    @IBAction func shareAction(_ sender: Any) {
        guard let image = pictImage.image else { return }
        let shareController = UIActivityViewController(
            activityItems: [image],
            applicationActivities: nil
        )
        shareController.completionWithItemsHandler = { _, bool, _, _ in
            if bool {
                print("Done!")
            }
        }
        present(shareController, animated: true, completion: nil)
    }
    
    private func setupViews() {
        guard let imageURL = URL(string: detail.hdurl ?? detail.url) else { return }
        pictImage.kf.indicatorType = .activity
        pictImage.kf.setImage(with: imageURL)
        
        titleLabel.text = detail.description
        titleLabel.textColor = .red
        if detail.copyright != nil {
            explanationTextVeiw.text = detail.cd
        } else {
            explanationTextVeiw.text = detail.explanation
        }
        
        
    }
}
