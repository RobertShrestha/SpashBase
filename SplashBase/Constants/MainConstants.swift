//
//  MainConstants.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import UIKit


struct Configs{
    
    
    struct App {
        static let bundleIdentifier = "com.robert.SplashBase"
        static let appName = "SplashBase"
        static let IsTesting = false
        
    }
    
    struct Network{
        static let useStaging = false
        static let loggingEnabled = false
        
        static var BASE_URL:String {
            return "http://www.splashbase.co/api/v1/"
        }
        
      
        
    }
   
    
    public enum ImageAPIs:String{
        case latest = "images/latest"
        case search = "images/search"
        case image = "images/"
       
    }
    
    
}
