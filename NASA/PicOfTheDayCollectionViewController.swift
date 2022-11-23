//
//  PicOfTheDayCollectionViewController.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import UIKit

class PicOfTheDayCollectionViewController: UICollectionViewController {
    
   
    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private var pictures: [Picture]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchPictures()
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        pictures?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "picture",
            for: indexPath
        ) as? PicCollectionViewCell else {
            return UICollectionViewCell()
        }
        let reversedPictures = pictures.reversed()
        let picture = Array(reversedPictures)[indexPath.item]
        cell.layer.cornerRadius = 5
        cell.configure(with: picture)
        
        
        // Configure the cell
    
        return cell
    }
    
    private func fetchPictures() {
        NetworkManager.shared.fetchPicture { result in
            switch result {
            case .success(let pictures):
                self.pictures = pictures
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension PicOfTheDayCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.bounds.width / 2 - 3, height: view.bounds.width / 2 - 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}
