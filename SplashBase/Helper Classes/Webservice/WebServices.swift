//
//  WebServices.swift
//  IBonton
//
//  Created by Robert Shrestha on 12/19/18.
//  Copyright © 2018 robert. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

protocol WebService: class {
    func getRequestWithoutHeaderAPI<T: Decodable>(type:T.Type,withParameter param: [String : Any], fromURL url:String,completionHandler: @escaping (Result<T?>)-> Void)
    func postRequestWithoutHeaderAPI(withParameter param:[String:Any],fromURL url:String,completionHandler: @escaping (Result<DefaultDataResponse?>)-> Void)
    func getRequestWithHeaderAPI<T: Decodable>(type:T.Type,withHeaderParameter headerParam:[String:String],fromURL url:String,completionHandler: @escaping (Result<T?>)->Void)
    func postRequestWithHeaderAPI<T: Decodable>(type:T.Type,withParameter param:[String:Any],withHeaderParameter headerParam:[String:String],fromURL url:String,completionHandler: @escaping (Result<T?>)->Void)
    
    
}
class WebServiceImp:NSObject, WebService{
    
    
    let decoder = JSONDecoder()
    func getRequestWithoutHeaderAPI<T>(type: T.Type,withParameter param: [String : Any], fromURL url: String,completionHandler: @escaping (Result<T?>)->Void) where T : Decodable {
        guard let url = URL(string: url) else { return }
        Alamofire.request(url, method: .get, parameters: param, headers: nil).responseData { (response) in
            if response.error == nil{
                do{
                    guard let data = response.data else { return  }
                    let datas = try self.decoder.decode(type, from: data)
                    completionHandler(.success(datas))
                }catch(let error){
                    completionHandler(.failure(error))
                }
            }else{
                completionHandler(.failure(response.error!))
            }
        }
        
        
        
    }
    
    func postRequestWithoutHeaderAPI(withParameter param: [String : Any], fromURL url: String,completionHandler: @escaping (Result<DefaultDataResponse?>)-> Void){
            

            
                        Alamofire.request(url, method: .post, parameters: param, headers: nil)
                            .validate()
                            .response { response in
                                if response.error == nil{
                                   completionHandler(.success(response))
                                }else{
                                    completionHandler(.failure(response.error!))
                                }
                        }
    }
    
    
    func getRequestWithHeaderAPI<T>(type: T.Type, withHeaderParameter headerParam: [String : String], fromURL url: String,completionHandler: @escaping (Result<T?>)->Void)  where T : Decodable {
            guard let url = URL(string: url) else { return }
            Alamofire.request(url, method: .get, parameters: nil, headers: headerParam).responseData { (response) in
                if response.error == nil{
                    do{
                        guard let data = response.data else { return  }
                        let datas = try self.decoder.decode(type, from: data)
                        completionHandler(.success(datas))
                    }catch(let error){
                        completionHandler(.failure(error))
                    }
                }else{
                    completionHandler(.failure(response.error!))
                }
            }
    }

    
    
    
    
  
    
   
    
   
    
    func postRequestWithHeaderAPI<T>(type: T.Type, withParameter param: [String : Any], withHeaderParameter headerParam: [String : String], fromURL url: String,completionHandler: @escaping (Result<T?>)->Void) where T : Decodable {
            guard let url = URL(string: url) else { return }
            Alamofire.request(url, method: .post, parameters: param, headers: headerParam).responseData { (response) in
                if response.error == nil{
                    do{
                        guard let data = response.data else { return  }
                        let datas = try self.decoder.decode(type, from: data)
                        completionHandler(.success(datas))
                    }catch(let error){
                        completionHandler(.failure(error))
                    }
                }else{
                    completionHandler(.failure(response.error!))
                }
            }
    }
 
    
}
