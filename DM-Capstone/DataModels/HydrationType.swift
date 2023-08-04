//
//  HydrationType.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation
import UIKit

enum HydrationType: String, CaseIterable {
    case water
    case beer
    case coffee
    case wine
    case sportsDrink
    case milk
    case soda
    
    var title: String {
        return self.rawValue.camelCaseToSpaced()
    }
    
    var imageName: String {
        switch self {
        case .water:
            return "drop.fill"
        case .beer:
            return "beer-mug"
        case .coffee:
            return "cup.and.saucer.fill"
        case .wine:
            return "wineglass.fill"
        case .sportsDrink:
            return "figure.run"
        case .milk:
            return "cow"
        case .soda:
            return "soda"
        }
    }
    
    var image: UIImage {
        switch self {
        case .water, .sportsDrink, .coffee, .wine:
            return UIImage(systemName: imageName)!
        case .milk, .beer, .soda:
            return UIImage(named: imageName)!
        }
    }
    
    var hydrationImpact: Double {
        switch self {
        case .water:
            return 1.0
        case .beer:
            return 0.85
        case .coffee:
            return 0.7
        case .wine:
            return 0.8
        case .sportsDrink:
            return 1.35
        case .milk:
            return 1.20
        case .soda:
            return 0.8
        }
    }
    
    var color: UIColor {
        switch self {
        case .water:
            return .blue
        case .beer:
            return .yellow
        case .coffee:
            return .brown
        case .wine:
            return .red
        case .sportsDrink:
            return .green
        case .milk:
            return .black
        case .soda:
            return .red
        }
    }
}
