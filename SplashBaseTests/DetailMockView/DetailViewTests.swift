//
//  DetailViewTests.swift
//  SplashBaseTests
//
//  Created by Robert Shrestha on 12/15/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
@testable import SplashBase

class MockDetailAPIClient{
    var shouldThrowError = false
    
    convenience init(){
        self.init(false)
    }
    
    init(_ shouldThrowError:Bool) {
        self.shouldThrowError = shouldThrowError
    }
    
    let response = [
        "id": 1,
        "url": "https://splashbase.s3.amazonaws.com/unsplash/regular/tumblr_mnh0n9pHJW1st5lhmo1_1280.jpg",
        "large_url": "https://splashbase.s3.amazonaws.com/unsplash/large/17c4qcC",
        "source_id": 1,
        "copyright": "CC0",
        "site": "unsplash"
        ] as [String : Any]
}
extension MockDetailAPIClient:DetailAPIClinetProtocol{
    func getImageDetail(imageID: Int, completionHandler: @escaping (Result<ListModel?, NetworkError>) -> Void) {
        if shouldThrowError{
            completionHandler(.failure(NetworkError.domainError))
        }else{
            do{
                let value = try JSONDecoder().decode(ListModel.self, withJSONObject: response)
                completionHandler(.success(value))
            }
            catch(let error){
                completionHandler(.failure(NetworkError.decodingError(error: error)))
            }
        }
    }
}
