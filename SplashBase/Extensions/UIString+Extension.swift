//
//  UIString+Extension.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
extension String {
    
    func fileName() -> String {
        return NSURL(fileURLWithPath: self).deletingPathExtension?.lastPathComponent ?? ""
    }
    
    func fileExtension() -> String {
        return NSURL(fileURLWithPath: self).pathExtension ?? ""
    }
    
//    func isMp4URL()->Bool{
//        return self.fileExtension().contains("mp4")
//    }
    var isMp4URL:Bool{
        return self.fileExtension().contains("mp4")
    }
}
