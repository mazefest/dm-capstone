//
//  HydrationLogController.swift
//  DM-Capstone
//
//  Created by Colby Mehmen on 7/25/23.
//

import Foundation
import CoreData

class HydrationLogcontroller {
    static var shared = HydrationLogcontroller()
    
    var logs: [HydrationLog] = []
    
    private lazy var fetchRequest: NSFetchRequest<HydrationLog> = {
        let request = NSFetchRequest<HydrationLog>(entityName: "HydrationLog")
        request.predicate = NSPredicate(value: true)
        return request
    }()
    
    init() {
        load()
    }
    
    func add(_ hydrationLog: HydrationLog) {
        logs.append(hydrationLog)
        cache()
    }
    
    func remove(_ hydrationLog: HydrationLog) {
        guard let index = logs.firstIndex(where: {$0.id == hydrationLog.id}) else { return }
        logs.remove(at: index)
        cache()
    }
    
    func update(_ hydrationLog: HydrationLog) {
        guard let index = logs.firstIndex(where: {$0.id == hydrationLog.id}) else { return }
        logs[index] = hydrationLog
        cache()
    }
    
    func cache() {
        CoreDataManager.saveContext()
    }
    
    func load() {
        let request = NSFetchRequest<HydrationLog>(entityName: "HydrationLog")
        request.predicate = NSPredicate(value: true)
        self.logs = (try? CoreDataManager.managedObjectContext.fetch(request)) ?? []
    }
}

extension HydrationLogcontroller {
    func logsInRange(start: Date, end: Date) -> [HydrationLog] {
        return logs.filter({$0.date!.isInRange(start: start, end: end)})
    }
}
