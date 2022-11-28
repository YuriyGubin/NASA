//
//  PicOfTheDayCollectionViewController.swift
//  NASA
//
//  Created by Юрий Губин on 22.11.2022.
//

import UIKit

class PicOfTheDayCollectionViewController: UICollectionViewController {

    let sectionInserts = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
    
    private let searchController = UISearchController(searchResultsController: nil)
    private var searchBarIsEmpty: Bool {
        guard let text = searchController.searchBar.text else { return false }
        return text.isEmpty
    }
    private var isFiltering: Bool {
        return searchController.isActive && !searchBarIsEmpty
    }
    
    private var pictures: [Picture] = []
    private var fiteredPictures: [Picture] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        fetchPictures()
        setupSearchController()
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        isFiltering ? fiteredPictures.count : pictures.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: "picture",
            for: indexPath
        ) as? PictureCell else {
            return UICollectionViewCell()
        }
        let reversedPictures = pictures.reversed()
        let picture = isFiltering
        ? fiteredPictures[indexPath.item]
        : Array(reversedPictures)[indexPath.item]
        
        cell.layer.cornerRadius = 5
        cell.configure(with: picture)
   
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPaths = collectionView.indexPathsForSelectedItems else { return }
        guard let detailVC = segue.destination as? DetailViewController else { return }
        let reversedPictures = pictures.reversed()
        indexPaths.forEach { indexPath in
            let picture = isFiltering
            ? fiteredPictures[indexPath.item]
            : Array(reversedPictures)[indexPath.item]
            detailVC.detail = picture
        }
    }
    
    @IBAction func cancelBtn() {
        dismiss(animated: true)
    }
    
    private func fetchPictures() {
        NetworkManager.shared.fetch([Picture].self) { result in
            switch result {
            case .success(let pictures):
                self.pictures = pictures
                self.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func setupSearchController() {
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.placeholder = "Search"
        searchController.searchBar.barTintColor = .white
        navigationItem.searchController = searchController
        definesPresentationContext = true
        
        if let textField = searchController.searchBar.value(forKey: "searchField") as? UITextField {
            textField.font = UIFont.boldSystemFont(ofSize: 17)
            textField.textColor = .white
        }
    }
    
    
}

extension PicOfTheDayCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: view.bounds.width / 2 - 3, height: view.bounds.width / 2 - 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        3
    }
}

//MARK: Search Methods
extension PicOfTheDayCollectionViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    private func filterContentForSearchText(_ searchText: String) {
        fiteredPictures = pictures.filter { picture in
            picture.title.lowercased().contains(searchText.lowercased())
        }
        
        collectionView.reloadData()
    }
}
