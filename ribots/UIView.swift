//
//  UIView.swift
//  ribots
//
//  Created by Jano Amigo on 22/9/17.
//  Copyright © 2017 Jano Amigo. All rights reserved.
//

import UIKit

extension UIView {
    
    /// Rotates the view
    ///
    /// - Parameter duration: total duration of the animation
    func startRotating(duration: Double) {
        
        if self.layer.animation(forKey: "rotation") == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(Double.pi * 2.0)
            animate.speed = 10
            self.layer.add(animate, forKey: "rotation")
        }
    }
    
    /// Stops the rotation of the view
    func stopRotating() {
        let kAnimationKey = "rotation"
        
        if self.layer.animation(forKey: kAnimationKey) != nil {
            self.layer.removeAnimation(forKey: kAnimationKey)
        }
    }
    
    /// Fades In the view
    ///
    /// - Parameters:
    ///   - duration: duration of the animation
    ///   - completion: completion callback
    func fadeIn(duration: Double, completion: ((Bool) -> Swift.Void)?) {
        alpha = 0
        UIView.animate(withDuration: duration) {
            self.alpha = 1
        }
    }
    
    /// Fades Out the view
    ///
    /// - Parameters:
    ///   - duration: duration of the animation
    ///   - completion: completion callback
    func fadeOut(duration: Double, completion: ((Bool) -> Swift.Void)?) {
        
        alpha = 1
        UIView.animate(withDuration: 0.5, animations: {
            self.alpha = 0
        }, completion: completion)
    }
}
