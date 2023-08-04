//
//  CoreDataStack.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/31/23.
//

import Foundation
import CoreData

enum CoreDataManager {
    static let persistenceContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "HydrationTracker")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as Error? {
                fatalError("Uh oh \(error.localizedDescription)")
            }
        }
        return container
    }()
    
    static var managedObjectContext: NSManagedObjectContext {
        return persistenceContainer.viewContext
    }
    
    static func saveContext() {
        let context = managedObjectContext
        
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
