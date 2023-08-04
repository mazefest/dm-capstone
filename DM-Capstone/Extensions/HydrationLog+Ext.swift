//
//  HydrationLog+Ext.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/27/23.
//

import Foundation
import CoreData

extension HydrationLog {
    var type: HydrationType {
        print(self.hydrationType)
        print(self.date?.formatted())
        return HydrationType(rawValue: self.hydrationType ?? "water") ?? .soda
    }
    
    @discardableResult convenience init(id: UUID = UUID(), measurement: Double, date: Date, hydrationType: HydrationType, context: NSManagedObjectContext = CoreDataManager.managedObjectContext) {
        self.init(context: context)
        self.id = id
        self.measurement = measurement
        self.date = date
        self.hydrationType = hydrationType.rawValue
    }
}
extension HydrationLog {
    var measurementDisplayString: String {
        if self.type.hydrationImpact != 1.0 {
            return "\(measurement) (\((type.hydrationImpact * measurement).twoDecimalPlaces())) ounces"
        }
        return "\(measurement.twoDecimalPlaces()) ounces"
    }
}
