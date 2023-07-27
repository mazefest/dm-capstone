//
//  Date+Ext.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation

extension Date {
    var startOfDay: Date {
        return Calendar.current.startOfDay(for: self)
    }

    var endOfDay: Date {
        var components = DateComponents()
        components.day = 1
        components.second = -1
        return Calendar.current.date(
            byAdding: components,
            to: Calendar.current.startOfDay(for: self)
        )!
    }
}
