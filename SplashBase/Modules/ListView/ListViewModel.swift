//
//  ListViewViewModel.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//


import UIKit

public class ListViewModel: NSObject{
    
    var router = ListViewRouter()

    
    
    var images = [ListModel]()
    var filteredImages = [ListModel]()
    
    var isFiltered:Bool = false
    
    var listCount:Int{
        return isFiltered ? filteredImages.count : images.count
    }
    
}
extension ListViewModel{
    
    func pushToDetailView(navigationController:UINavigationController,indexPath:IndexPath){
        let imageData = isFiltered ? filteredImages[indexPath.row] : images[indexPath.row]
        self.router.goToDetailView(navigateTo: .detailView, navigationController: navigationController, imageData: imageData)
    }
    
    func configureImageCel(cell:ListTableViewCell,atIndex indexPath:IndexPath)->ListTableViewCell{
        let image = isFiltered ? filteredImages[indexPath.row] : images[indexPath.row]
        cell.setupCell(image: image)
        return cell
    }    
    func getList(completionHandler:@escaping (Result<Bool,NetworkError>)->Void){
        
        WebServices().load(resource: LatestModel.all) { (result) in
            switch result{
                
            case .success(let value):
                var status = Bool()
                guard let value = value.images else {
                    completionHandler(.success(false))
                    return
                }
                status = (value.count > 0) ? true : false
                print(value.count)
                self.images = value
                completionHandler(.success(status))
            case .failure(let error):
                print(error)
                completionHandler(.failure(error))
            }
        }
     
    }
    
    
    func getSearchList(queryString query:String,completionHandler:@escaping (Result<Bool,Error>)->Void){
        
        
        
        WebServices().load(resource: LatestModel.search(query)) { (result) in
            switch result{
                
            case .success(let value):
                var status = Bool()
                guard let value = value?.images else { completionHandler(.success(false)); return}
                status = (value.count > 0) ? true : false
                print(value.count)
                self.filteredImages = value
                completionHandler(.success(status))
                
                
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
    
}
