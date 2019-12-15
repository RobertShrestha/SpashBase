//
//  DetailAPIClient.swift
//  SplashBase
//
//  Created by Robert Shrestha on 12/15/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation

protocol DetailAPIClinetProtocol {
    func getImageDetail(imageID:Int,completionHandler:@escaping (Result<ListModel?,NetworkError>)->Void)
}

class DetailAPIClient:DetailAPIClinetProtocol{
    func getImageDetail(imageID: Int, completionHandler: @escaping (Result<ListModel?, NetworkError>) -> Void) {
        WebServices.shared.load(resource: ListModel.getImageDetail(imageID: "\(imageID)")) { (result) in
            switch result{
                
            case .success(let value):
                guard let value = value else { completionHandler(.success(nil)); return}
                completionHandler(.success(value))
                
                
            case .failure(let error):
                print(error)
                print(error.localizedDescription)
                completionHandler(.failure(error))
            }
        }
    }
}
