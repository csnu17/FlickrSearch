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
  var flicksPhotos: [Int : [FlickrPhotoCellViewModel]]
  
  lazy private var flickr = Flickr()
  
  // MARK: - Init
  
  init(flickrSearchResults: Dynamic<[FlickrSearchResults]>) {
    self.flickrSearchResults = flickrSearchResults
    self.flicksPhotos = [:]
  }
  
  // MARK: -
  
  func searchFlickrFrom(term: String) {
    flickr.searchFlickrForTerm(term) { [weak self] results, error in
      self?.isFinishedSearching.value = true
      
      if let error = error {
        print("Error searching: \(error)")
        return
      }
      
      if let results = results {
        print("Found \(results.searchResults.count) matching \(results.searchTerm)")
        
        self?.flicksPhotos[self?.flickrSearchResults.value.count ?? 0] = results.searchResults.map {
          FlickrPhotoCellViewModelFromFlickrPhoto(thumbnail: $0.thumbnail)
        }
        self?.flickrSearchResults.value.insert(results, at: 0)
      }
    }
  }
}
