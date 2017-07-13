//
//  FlickrPhotoCellViewModelFromFlickrPhoto.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/12/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import Foundation

class FlickrPhotoCellViewModelFromFlickrPhoto: FlickrPhotoCellViewModel {
  
  // MARK: - Properties
  
  var thumbnail: Image?
  
  // MARK: - Init
  
  init(thumbnail: Image?) {
    self.thumbnail = thumbnail
  }
}
