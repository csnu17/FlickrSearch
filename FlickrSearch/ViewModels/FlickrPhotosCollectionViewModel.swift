//
//  FlickrPhotosCollectionViewModel.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/11/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import Foundation

protocol FlickrPhotosCollectionViewModel {
  var flickrSearchResults: Dynamic<[FlickrSearchResults]> { get }
  var isFinishedSearching: Dynamic<Bool> { get }
  var numberOfSections: Int { get }
  var rowsPerSection: [Int] { get }
  
  func searchFlickrFrom(term: String)
  func flickrPhotoCellViewModel(indexPath: IndexPath) -> FlickrPhotoCellViewModel
}
