//
//  FlickrPhotoCell.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/12/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import UIKit

typealias Image = UIImage

class FlickrPhotoCell: UICollectionViewCell {
  
  // MARK: - Properties
  
  var viewModel: FlickrPhotoCellViewModel? {
    didSet {
      guard let viewModel = viewModel else {
        return
      }
      
      imageView.image = viewModel.thumbnail
    }
  }
  
  @IBOutlet weak var imageView: UIImageView!
  
  // MARK: - Life cycle
  
  override func awakeFromNib() {
    super.awakeFromNib()
    backgroundColor = UIColor.white
  }
}
