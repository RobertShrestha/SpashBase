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
    struct BaseDimensions {
//        static let inset: CGFloat = 10
//        static let tabBarHeight: CGFloat = 58
//        static let toolBarHeight: CGFloat = 66
//        static let navBarWithStatusBarHeight: CGFloat = 64
//        static let cornerRadius: CGFloat = 20
//        static let borderWidth: CGFloat = 1
//        static let buttonHeight: CGFloat = 50
//        static let textFieldHeight: CGFloat = 40
//        static let tableRowHeight: CGFloat = 50
//        static let segmentedControlHeight: CGFloat = 30
    }
    
    public enum ImageAPIs:String{
        case latest = "images/latest"
        case search = "images/search"
        case image = "images/"
       
    }
    
    
}
