//
//  DetailRouter.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//

import UIKit
enum DetailNavigations{
    case imageViewer(String)
    case openInBrowser(URL)
    case share(String)
}

class DetailRouter: NSObject {
    static func setupModule(image:ListModel)-> DetailViewController{
        let viewController:DetailViewController = DetailViewController.instantiate()
        viewController.viewModel = DetailViewModel(list: image)
        viewController.viewModel?.router = DetailRouter()
        return viewController
    }
}
extension DetailRouter{
    
    func goToView(navigations:DetailNavigations,navigationController:UINavigationController?){
        switch navigations {
        case .imageViewer(let imageURL):
            
            let vc:CustomImageViewerViewController = CustomImageViewerViewController.instantiate()
            vc.imageURL = imageURL
            navigationController?.pushViewController(vc, animated: true)
            
        case .openInBrowser(let url):
            
            UIApplication.shared.open(url)
            
        case .share(let id):
            
            let firstActivityItem = "Check this out \n"
            print(id)
            let secondActivityItem = URL(string: "http://www.splashbase.co/images/" + id)!
            
            let activityViewController : UIActivityViewController = UIActivityViewController(
                activityItems: [firstActivityItem, secondActivityItem], applicationActivities: nil)
            
            
//            activityViewController.popoverPresentationController?.sourceView = (sender as! UIButton)
            
            activityViewController.popoverPresentationController?.sourceRect = CGRect(x: 150, y: 150, width: 0, height: 0)
            
            
            
            navigationController?.present(activityViewController, animated: true, completion: nil)
            
        }
    }
}
