//
//  ListModel.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation

struct LatestModel:Codable{
    var images: [ListModel]?
}

struct ListModel:Codable{
    var id:Int
    var url:String
    var largeURL:String
    var soureID:Int?
    var copyright:String?
    var site:String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case url
        case largeURL = "large_url"
        case soureID = "source_id"
        case copyright
        case site
    }
}
extension ListModel{
    static func getImageDetail(imageID:String)-> Resource<ListModel?>{
        guard let url = URL(string: Configs.Network.BASE_URL + Configs.ImageAPIs.image.rawValue + "\(imageID)") else {
            fatalError("URL is in-correct")
        }
        return Resource<ListModel?>(url: url)
    }
}
extension LatestModel{
    static var all:Resource<LatestModel> = {
        guard let url = URL(string: Configs.Network.BASE_URL + Configs.ImageAPIs.latest.rawValue) else {
            fatalError("URL is in-correct")
        }
        return Resource<LatestModel>(url: url)
    }()
    
    static func search(_ query:String) -> Resource<LatestModel?>{
        var urlComponents = URLComponents(string: Configs.Network.BASE_URL + Configs.ImageAPIs.search.rawValue)
        urlComponents?.queryItems = [
            URLQueryItem(name: "query", value: query)
        ]
        guard let url = urlComponents?.url else {
            fatalError("Ulr is wrong")
            
        }
        
        
        let resource = Resource<LatestModel?>(url: url)
        return resource
    }
    
    /*
    static func create(vm: AddCoffeeOrderViewModel) -> Resource<Order?> {
        
        let order = Order(vm)
        
        guard let url = URL(string: "https://guarded-retreat-82533.herokuapp.com/orders") else {
            fatalError("URL is incorrect!")
        }
        
        guard let data = try? JSONEncoder().encode(order) else {
            fatalError("Error encoding order!")
        }
        
        var resource = Resource<Order?>(url: url)
        resource.httpMethod = HttpMethod.post
        resource.body = data
        
        return resource
        
    }
*/
}
