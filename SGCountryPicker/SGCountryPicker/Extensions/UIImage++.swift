//
//  UIImage++.swift
//  Storygeny
//
//  Created by Shashi Gupta on 11/10/23.
//

import Foundation
import UIKit

extension UIImage{
    
    func imageSizeInBytes() -> Double {
        if let imageData = self.jpegData(compressionQuality: 1) {
            return Double(imageData.count)
        }
        return 0 // Unable to determine size
    }
    
}
