//
//  DetailRouter.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//

import UIKit

class DetailRouter: NSObject {
    static func setupModule(image:ListModel)-> DetailViewController{
        let viewController:DetailViewController = DetailViewController.instantiate()
        viewController.viewModel = DetailViewModel(list: image)
        viewController.viewModel?.router = DetailRouter()
        return viewController
    }
}
