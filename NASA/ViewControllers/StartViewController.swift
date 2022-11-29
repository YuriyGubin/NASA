//
//  StartViewController.swift
//  NASA
//
//  Created by Юрий Губин on 29.11.2022.
//

import UIKit

class StartViewController: UIViewController {
    
    
    @IBOutlet var schoolImage: UIImageView!
    @IBOutlet var pictureImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }

    private func setupViews() {
        schoolImage.layer.cornerRadius = 30
        schoolImage.layer.borderWidth = 5
        schoolImage.layer.borderColor = UIColor.white.cgColor
        
        pictureImage.layer.cornerRadius = 30
        pictureImage.layer.borderWidth = 5
        pictureImage.layer.borderColor = UIColor.white.cgColor
    }
}
