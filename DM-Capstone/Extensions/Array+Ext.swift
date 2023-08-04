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
            return log.date! >= startDate && log.date! <= endDate
        }
    }
}


// Converts an array of strings to a sentence
// [hey, hi, hello] -> `hey hi hello`
extension Array<String> {
    func stringArrayToSentence() -> String {
        var string = ""
        for word in self {
            if string.isEmpty {
                string = word
            } else {
                string = "\(string) \(word)"
            }
        }
        return string
    }
}
