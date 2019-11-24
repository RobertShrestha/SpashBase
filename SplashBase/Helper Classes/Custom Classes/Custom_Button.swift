//
//  Custom_Button.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit


class FavouriteButton:UIButton{
    override func draw(_ rect: CGRect) {
        //dropShadow(offsetX: 0.0, offsetY: 3.0, color: .black, opacity: 0.8, radius: 0.0
        self.setImage(UIImage(named: "FavouriteInActiveIcon"), for: .normal)
        self.setImage(UIImage(named: "FavouriteActiveIcon"), for: .selected)
    }
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        self.setImage(#imageLiteral(resourceName: "FavouriteActiveIcon"), for: .selected)
//        self.setImage(#imageLiteral(resourceName: "FavouriteInActiveIcon"), for: .normal)
    }
    
    override func prepareForInterfaceBuilder() {
//        self.setImage(#imageLiteral(resourceName: "FavouriteActiveIcon"), for: .selected)
//        self.setImage(#imageLiteral(resourceName: "FavouriteInActiveIcon"), for: .normal)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}
