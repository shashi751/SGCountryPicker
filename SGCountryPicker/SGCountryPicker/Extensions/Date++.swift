//
//  Date++.swift
// Storygeny
//
//  Created by Shashi Gupta on 07/09/22.
//

import Foundation

extension Date {
    static var yesterday: Date { return Date().dayBefore }
    static var tomorrow:  Date { return Date().dayAfter }
    var dayBefore: Date {
        return Calendar.current.date(byAdding: .day, value: -1, to: noon)!
    }
    var last7Days: Date {
        return Calendar.current.date(byAdding: .day, value: -7, to: noon)!
    }
    var last28Days: Date {
        return Calendar.current.date(byAdding: .day, value: -28, to: noon)!
    }
    var last90Days: Date {
        return Calendar.current.date(byAdding: .day, value: -90, to: noon)!
    }
    var last365Days: Date {
        return Calendar.current.date(byAdding: .day, value: -365, to: noon)!
    }
    var dayAfter: Date {
        return Calendar.current.date(byAdding: .day, value: 1, to: noon)!
    }
    var noon: Date {
        return Calendar.current.date(bySettingHour: 12, minute: 0, second: 0, of: self)!
    }
    var month: Int {
        return Calendar.current.component(.month,  from: self)
    }
    var isLastDayOfMonth: Bool {
        return dayAfter.month != month
    }
    
    func startOfHour() -> Date?
    {
        let calendar = Calendar.current

        var components = calendar.dateComponents([.year, .month, .day, .hour, .minute, .second], from: self)

        components.minute = 0
        components.second = 0

        return calendar.date(from: components)
    }
}


