//
//  FlickrProtocol.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/11/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import Foundation

protocol FlickrProtocol {
  func searchFlickrForTerm(_ searchTerm: String, completion: @escaping (_ results: FlickrSearchResults?, _ error : NSError?) -> Void)
}
