//
//  UIView+Frame.swift
//  special
//
//  Created by 葛枝鑫 on 15/4/24.
//  Copyright (c) 2015年 葛枝鑫. All rights reserved.
//

import Foundation
import UIKit

extension UIView{

    var x: CGFloat {
        get {
            return self.frame.origin.x
        }
        set(newX) {
            var point = self.frame.origin
            point.x = newX
            self.frame = CGRect(origin: point, size: self.frame.size)
        }
    }
   
    var y: CGFloat {
        get {
            return self.frame.origin.y
        }
        set(newY) {
            var point = self.frame.origin
            point.y = newY
            self.frame = CGRect(origin: point, size: self.frame.size)
        }
    }
    
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set(newWidth) {
            let point = self.frame.origin
            var size = self.frame.size
            size.width = newWidth
            self.frame = CGRect(origin: point, size: size)
        }
    }
   
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set(newHeight) {
            let point = self.frame.origin
            var size = self.frame.size
            size.height = newHeight
            self.frame = CGRect(origin: point, size: size)
        }
    }
    
    
}
