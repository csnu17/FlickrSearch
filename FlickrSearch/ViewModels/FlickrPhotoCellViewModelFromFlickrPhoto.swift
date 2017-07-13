//
//  FlickrPhotoCellViewModelFromFlickrPhoto.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/12/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import Foundation
import UIKit

class FlickrPhotoCellViewModelFromFlickrPhoto: FlickrPhotoCellViewModel {
  
  // MARK: - Properties
  
  var thumbnail: UIImage?
  
  // MARK: - Init
  
  init(thumbnail: UIImage?) {
    self.thumbnail = thumbnail
  }
}
