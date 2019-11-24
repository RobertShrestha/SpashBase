//
//  ListViewRouter.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//

import UIKit

enum Navigations{
    case detailView
    // case sourceView
}

class ListViewRouter: NSObject {
    static func setupModule()-> ListViewController{
        let viewController:ListViewController = ListViewController.instantiate()
        viewController.viewModel = ListViewModel()
        viewController.viewModel.router = ListViewRouter()
        return viewController
    }
}
extension ListViewRouter{
    func goToDetailView(navigateTo view:Navigations,navigationController:UINavigationController,imageData:ListModel){
        switch view {
        case .detailView:
            let detail = DetailRouter.setupModule(image: imageData)
            navigationController.pushViewController(detail, animated: true)
        }
    }
}
