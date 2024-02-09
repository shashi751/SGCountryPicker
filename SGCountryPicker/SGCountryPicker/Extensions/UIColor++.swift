//
//  UIColor++.swift
// Storygeny
//
//  Created by Shashi Gupta on 19/08/22.
//

import Foundation
import UIKit


extension UIColor {
    
    //:
    static var Primary: UIColor {
        return UIColor(named: "Primary") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    //:
    static var App_gray: UIColor {
        return UIColor(named: "App_gray") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    //:
    static var App_Orange: UIColor {
        return UIColor(named: "App_Orange") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    
    //:
    static var App_Text_Secondary: UIColor {
        return UIColor(named: "App_Text_Secondary") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    //:
    static var App_Green: UIColor {
        return UIColor(named: "App_Green") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    //:
    static var App_Gray_Background: UIColor {
        return UIColor(named: "App_Gray_Background") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    //:
    static var App_GraphLight: UIColor {
        return UIColor(named: "App_GraphLight") ?? #colorLiteral(red: 0, green: 0.3215686275, blue: 0.8, alpha: 1)
    }
    
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexValue = hex.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines).uppercased()

        if hexValue.hasPrefix("#") {
            hexValue.remove(at: hexValue.startIndex)
        }

        var rgbValue: UInt64 = 0
        Scanner(string: hexValue).scanHexInt64(&rgbValue)

        let red = CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgbValue & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
    
}
