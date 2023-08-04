//
//  Date+Ext.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation

extension Date {
    /*
     Returns a date object at 12:00am
     **/
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    /*
     Returns a date object at 11:59pm
     **/
    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(
            byAdding: components,
            to: Calendar.current.startOfDay(for: self)
        )!
    }
    
    /*
     @returns -> boolean if instance is greater/equal than `beginningDate` and less/equal to `endDate`.
     @beginnigDate: Date -> will check if instance date is greater than or equal to
     @endDate: Date -> will check if instance date is greater than or equal to
     **/
    func isInRange(start beginningDate: Date, end endDate: Date) -> Bool {
        return self >= beginningDate && self <= endDate
    }
    
    /*
     // write documentation
     **/
    func modified(by value: Int, component: Calendar.Component) -> Date {
        var dateComponent = DateComponents()
        switch component {
        case .day:
            dateComponent.day = value
        case .month:
            dateComponent.month = value
        case .weekOfYear, .weekOfMonth:
            dateComponent.weekOfYear = value
        case .year:
            dateComponent.year = value
        default:
            break
        }
        return Calendar.current.date(byAdding: dateComponent, to: self) ?? self
    }
}
