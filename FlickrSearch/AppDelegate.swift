//
//  AppDelegate.swift
//  FlickrSearch
//
//  Created by Phetrungnapha, K. on 7/11/2560 BE.
//  Copyright © 2560 iTopStory. All rights reserved.
//

import UIKit

let themeColor = UIColor(red: 0.01, green: 0.41, blue: 0.22, alpha: 1.0)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
    window?.tintColor = themeColor
    
    let rootViewController = window?.rootViewController as! UINavigationController
    let vc = rootViewController.viewControllers.first as! FlickrPhotosCollectionViewController
    let viewModel = FlickrPhotosCollectionViewModelFromFlickrSearchResults(flickrSearchResults: Dynamic([]))
    vc.viewModel = viewModel
    
    return true
  }
}
