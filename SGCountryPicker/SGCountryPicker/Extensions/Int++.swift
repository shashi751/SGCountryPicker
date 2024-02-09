//
//  Int++.swift
// Storygeny
//
//  Created by Shashi Gupta on 14/10/22.
//

import Foundation

extension Int{
    
    func toDateString(format:String) -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(self))
        return ""//DateHelper.shared.getFormatedDate(formatter: format, date: date)
    }
}
