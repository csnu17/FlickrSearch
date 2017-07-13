//
//  FlickrPhotosCollectionViewModelFromFlickrSearchResults.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/11/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import Foundation

class FlickrPhotosCollectionViewModelFromFlickrSearchResults: FlickrPhotosCollectionViewModel {
  
  // MARK: - Properties
  
  let flickrSearchResults: Dynamic<[FlickrSearchResults]>
  let isFinishedSearching = Dynamic(true)
  var numberOfSections: Int
  var rowsPerSection: [Int]
  
  lazy private var flickr = Flickr()
  
  // MARK: - Init
  
  init(flickrSearchResults: Dynamic<[FlickrSearchResults]>) {
    self.flickrSearchResults = flickrSearchResults
    numberOfSections = 0
    rowsPerSection = []
  }
  
  // MARK: - Public
  
  func searchFlickrFrom(term: String) {
    flickr.searchFlickrForTerm(term) { [weak self] results, error in
      guard let strongSelf = self else {
        return
      }
      
      self?.isFinishedSearching.value = true
      
      if let error = error {
        print("Error searching: \(error)")
        return
      }
      
      if let results = results {
        print("Found \(results.searchResults.count) matching \(results.searchTerm)")
        
        strongSelf.rowsPerSection.append(strongSelf.numberOfSections)
        strongSelf.rowsPerSection[strongSelf.numberOfSections] = results.searchResults.count
        strongSelf.numberOfSections += 1
        strongSelf.flickrSearchResults.value.insert(results, at: 0)
      }
    }
  }
  
  func flickrPhotoCellViewModel(indexPath: IndexPath) -> FlickrPhotoCellViewModel {
    let selectedFlickrPhoto = flickrSearchResults.value[indexPath.section].searchResults[indexPath.row]
    return FlickrPhotoCellViewModelFromFlickrPhoto(thumbnail: selectedFlickrPhoto.thumbnail)
  }
}
