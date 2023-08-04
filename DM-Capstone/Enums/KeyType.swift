//
//  KeyType.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 8/1/23.
//

import Foundation

enum KeyType: CaseIterable {
    case one
    case two
    case three
    case four
    case five
    case six
    case seven
    case eight
    case nine
    case dot
    case delete
    
    var representation: String {
        switch self {
        case .one:
            return "1"
        case .two:
            return "2"
        case .three:
            return "3"
        case .four:
            return "4"
        case .five:
            return "5"
        case .six:
            return "6"
        case .seven:
            return "7"
        case .eight:
            return "8"
        case .nine:
            return "9"
        case .dot:
            return "."
        case .delete:
            return "<"
        }
    }
}
