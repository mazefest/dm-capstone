//
//  HydrationTypeController.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation

class HydrationTypeController {
    static let allLiquidTypes: [HydrationType] = [water, coffee, carbonatedWater, sportsDrink, soda, beer, juice, wine, milk]
    
    static var juice: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC31")!,
        title: "Juice",
        imageNmae: "carrot.fill",
//        color: .orange,
        hydrationImpact: 1.0,
        isDeletable: false
    )
    
    static var wine: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC28")!,
        title: "Wine",
        imageNmae: "wineglass.fill",
//        color: .red,
        hydrationImpact: 1.0,
        isDeletable: false
    )
    
    static var milk: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FA21")!,
        title: "Milk",
        imageNmae: "cow",
//        color: .black,
        hydrationImpact: 1.0,
        isDeletable: false
    )

    
    static let water: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC30")!,
        title: "Water",
        imageNmae: "drop.fill",
//        hydrationTypeColor: .cyan,
        hydrationImpact: 1.0,
        isDeletable: false
    )
    
    static let coffee: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC01")!,
        title: "Coffee",
        imageNmae: "cup.and.saucer.fill",
//        color: .brown,
        hydrationImpact: 0.9,
        isDeletable: false
    )
    
    static let carbonatedWater: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC02")!,
        title: "Carbonated Water",
        imageNmae: "bubbles.and.sparkles.fill",
//        color: .blue,
        hydrationImpact: 0.9,
        isDeletable: false
    )
    
    static let sportsDrink: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC03")!,
        title: "Sports Drink",
        imageNmae: "figure.run",
//        color: .indigo,
        hydrationImpact: 1.5,
        isDeletable: false
    )
    
    static let soda: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC04")!,
        title: "Soda",
        imageNmae: "soda",
//        color: .pink,
        hydrationImpact: 0.8,
        isDeletable: false
    )
    
    static let beer: HydrationType = .init(
        id: UUID(uuidString: "ACABE335-1022-4A2B-A6E8-9E65F7B3FC05")!,
        title: "Beer",
        imageNmae: "beer-mug",
//        color: .yellow,
        hydrationImpact: 0.8,
        isDeletable: false
    )
}
