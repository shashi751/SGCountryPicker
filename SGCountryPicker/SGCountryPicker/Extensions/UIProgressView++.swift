//
//  UIProgressView.swift
//  Storygeny
//
//  Created by Shashi Gupta on 10/08/23.
//

import Foundation
import UIKit

extension UIProgressView {

    @IBInspectable var barHeight : CGFloat {
        get {
            return transform.d * 2.0
        }
        set {
            // 2.0 Refers to the default height of 2
            let heightScale = newValue / 2.0
            let c = center
            transform = CGAffineTransformMakeScale(1.0, heightScale)
            center = c
        }
    }
}

