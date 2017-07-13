//
//  FlickrPhotosCollectionViewController.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/11/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import UIKit

class FlickrPhotosCollectionViewController: UICollectionViewController {
  
  // MARK: - Properties
  
  private let reuseIdentifier = "FlickrCell"
  private let sectionInsets = UIEdgeInsets(top: 50.0, left: 20.0, bottom: 50.0, right: 20.0)
  private let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
  private let itemsPerRow: CGFloat = 3
  
  var viewModel: FlickrPhotosCollectionViewModel? {
    didSet {
      fillUI()
    }
  }
  
  // MARK: - Life cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    fillUI()
  }
}

// MARK: - UICollectionViewDataSource

extension FlickrPhotosCollectionViewController {
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    return viewModel?.numberOfSections ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               numberOfItemsInSection section: Int) -> Int {
    return viewModel?.rowsPerSection[section] ?? 0
  }
  
  override func collectionView(_ collectionView: UICollectionView,
                               cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                  for: indexPath) as! FlickrPhotoCell
    cell.viewModel = viewModel?.flickrPhotoCellViewModel(indexPath: indexPath)
    return cell
  }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension FlickrPhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      sizeForItemAt indexPath: IndexPath) -> CGSize {
    let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
    let availableWidth = view.frame.width - paddingSpace
    let widthPerItem = availableWidth / itemsPerRow
    
    return CGSize(width: widthPerItem, height: widthPerItem)
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      insetForSectionAt section: Int) -> UIEdgeInsets {
    return sectionInsets
  }
  
  func collectionView(_ collectionView: UICollectionView,
                      layout collectionViewLayout: UICollectionViewLayout,
                      minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return sectionInsets.left
  }
}

// MARK: - UITextFieldDelegate

extension FlickrPhotosCollectionViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    if let viewModel = viewModel {
      textField.addSubview(activityIndicator)
      activityIndicator.frame = textField.bounds
      activityIndicator.startAnimating()
      
      viewModel.searchFlickrFrom(term: textField.text ?? "Apple")
    }
    
    textField.text = nil
    textField.resignFirstResponder()
    return true
  }
}

// MARK: - Private

private extension FlickrPhotosCollectionViewController {
  
  func fillUI() {
    if !isViewLoaded {
      return
    }
    
    guard let viewModel = viewModel else {
      return
    }
    
    viewModel.isFinishedSearching.bind { [unowned self] in
      if $0 {
        self.activityIndicator.removeFromSuperview()
      }
    }
    
    viewModel.flickrSearchResults.bind { [unowned self] in
      if !$0.isEmpty {
        self.collectionView?.reloadData()
      }
    }
  }
}
