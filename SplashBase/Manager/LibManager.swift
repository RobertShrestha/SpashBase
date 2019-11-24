//
//  LibManager.swift
//  XtendCommerce
//
//  Created by Robert Shrestha on 5/15/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

class LibsManager:NSObject{
    
    static let shared = LibsManager()
    func setupLibs(with window: UIWindow? = nil) {
        let libsManager = LibsManager.shared
        libsManager.setupKeyboardManager()
        
    }
    func setupKeyboardManager() {
        IQKeyboardManager.shared.enable = true
    }
    
}
