//
//  Double++.swift
//  Storygeny
//
//  Created by Shashi Gupta on 10/07/23.
//

import Foundation

extension Date{
    
    func getTimeStamp() -> Double{
        return Double(self.timeIntervalSince1970)
    }
}

extension Double{
    
    func formatNumber() -> String {
        
        let formatter = NumberFormatter()
        formatter.usesGroupingSeparator = true
        formatter.groupingSize = 3
        
        if self >= 100000 {
            // Convert to lakhs
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: Double(self) / 100000))! + " lac"
        } else if self >= 1000 {
            // Convert to thousands
            formatter.numberStyle = .decimal
            return formatter.string(from: NSNumber(value: Double(self) / 1000))! + " k"
        } else {
            // For numbers less than 1000, display as is
            return formatter.string(from: NSNumber(value: self))!
        }
    }
}
