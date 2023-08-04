//
//  Double+Ext.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import Foundation

extension Double {
    func twoDecimalPlaces() -> String {
        return String(format: "%.2f", self)
    }
}
