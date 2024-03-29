//
//  UIButton+Extension.swift
//  SplashBase
//
//  Created by Robert Shrestha on 11/23/19.
//  Copyright © 2019 robert. All rights reserved.
//

import UIKit

extension UIButton{
    func heatBeatAnimation(){
        let pulse1 = CASpringAnimation(keyPath: "transform.scale")
        pulse1.duration = 0.6
        pulse1.fromValue = 1.0
        pulse1.toValue = 1.12
        pulse1.autoreverses = true
        pulse1.repeatCount = 1
        pulse1.initialVelocity = 0.5
        pulse1.damping = 0.8
        
        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2.7
        animationGroup.repeatCount = 1
        animationGroup.animations = [pulse1]
        
        self.layer.add(animationGroup, forKey: "pulse")
    }
}
