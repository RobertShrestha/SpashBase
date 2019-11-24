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
