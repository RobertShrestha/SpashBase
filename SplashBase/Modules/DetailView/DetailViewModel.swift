//
//  DetailViewModel.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//Copyright © 2019 robert. All rights reserved.
//


import UIKit

 class DetailViewModel: NSObject{
    
    var router = DetailRouter()
    
    var webService = WebServiceImp()
    
    
    var image: ListModel?
    
    var imageName:String?{
        return image?.url.fileName()
    }
    var url:String?{
        return image?.url
    }
    var id:String{
        return "\(image?.id ?? 1)"
    }
    var largeUrl:String?{
        return image?.largeURL
    }
    
    var site:String{
        return "\(image?.site ?? "")"
    }
    var copyright:String{
        return "\(image?.copyright ?? "")"
    }
    
    
    public init(list:ListModel) {
        self.image = list
    }
  
    
    
    func getImageDetail(completionHandler:@escaping (Result<Bool,Error>)->Void){
        
        let param = ["":""]
        
        let baseURL = Configs.Network.BASE_URL
        let url = baseURL + Configs.ImageAPIs.image.rawValue + "\(self.image?.id ?? 1)"
        print(url)
        
        webService.getRequestWithoutHeaderAPI(type: ListModel.self, withParameter: param, fromURL: url) { (result) in
            switch result{
                
            case .success(let value):
                guard let value = value else { completionHandler(.success(false)); return}
               
                self.image = value
                completionHandler(.success(true))
                
                
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
    
}