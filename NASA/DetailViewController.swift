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
    
    
    @IBOutlet var explanationTextVeiw: UITextView!
    
    var detail: Picture!

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
       
    }
    

    @IBAction func shareAction(_ sender: Any) {
    }
    
    private func setupViews() {
        guard let imageURL = URL(string: detail.url) else { return }
        pictImage.kf.setImage(with: imageURL)
        
        explanationTextVeiw.text = detail.explanation
        
    }
}
