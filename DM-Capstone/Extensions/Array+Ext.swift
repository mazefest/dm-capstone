//
//  Array+Ext.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation

extension Array<HydrationLog> {
    func filter(by startDate: Date, and endDate: Date) -> [HydrationLog] {
        return self.filter { log in
            return log.date >= startDate && log.date <= endDate
        }
    }
}
